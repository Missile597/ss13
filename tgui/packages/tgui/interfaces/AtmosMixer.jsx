import { useBackend } from '../backend';
import { Button, LabeledList, NumberInput, Section } from '../components';
import { Window } from '../layouts';

export const AtmosMixer = (props) => {
  const { act, data } = useBackend();
  return (
    <Window width={370} height={195} resizable>
      <Window.Content>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Power">
              <Button
                icon={data.on ? 'power-off' : 'times'}
                content={data.on ? 'On' : 'Off'}
                selected={data.on}
                onClick={() => act('power')}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Output Pressure">
              <NumberInput
                animated
                value={parseFloat(data.set_pressure)}
                unit="kPa"
                width="75px"
                minValue={0}
                maxValue={data.max_pressure}
                step={10}
                onChange={(e, value) =>
                  act('pressure', {
                    pressure: value,
                  })
                }
              />
              <Button
                ml={1}
                icon="plus"
                content="Max"
                disabled={data.set_pressure === data.max_pressure}
                onClick={() =>
                  act('pressure', {
                    pressure: 'max',
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Divider size={1} />
            <LabeledList.Item color="label">
              <u>Concentrations</u>
            </LabeledList.Item>
            <LabeledList.Item label={'Node 1 (' + data.node1_dir + ')'}>
              <NumberInput
                animated
                value={data.node1_concentration}
                unit="%"
                width="60px"
                minValue={0}
                maxValue={100}
                stepPixelSize={2}
                onDrag={(e, value) =>
                  act('node1', {
                    concentration: value,
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label={'Node 2 (' + data.node2_dir + ')'}>
              <NumberInput
                animated
                value={data.node2_concentration}
                unit="%"
                width="60px"
                minValue={0}
                maxValue={100}
                stepPixelSize={2}
                onDrag={(e, value) =>
                  act('node2', {
                    concentration: value,
                  })
                }
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
