Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB7E3DB0C9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 03:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhG3Bty (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 21:49:54 -0400
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com ([40.107.92.70]:10720
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229667AbhG3Bty (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 21:49:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiQuaReawpvbAGCJTklc+wXEUXhmC/Q6/YQUXh2OW1tHoBpOLJh5ZlCBmrjO1DUmhA+n47Cw24D4kiNb7UACQUaK3XooQ7Hu4JCeyJ20kBSMIJIz2lBOjpEKgpWWxORtFth3Nhtc+i1EM3c7jB+zrcBkpHnciqfpbWTAGy4c4a9Eb3XYseujXe/ZszbUX5YWW6JpDeEbw442lxLPWLWbLT7GIQpUAlAVI+gReZ+kuod0FVkE4Ptpp0E4mZCvpKvwGMJcDJkLqrI3JUjGDfRomfUY7eOtaHGfjhWAM8DUkbTzkWCfF2T7YE8+bAljxwg6Afdpfe8JMCuNYq+tHSdGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzJCSATZIlJJU1BeXWs5WsIbfYiSRgwTXStIXrpFlkk=;
 b=kai9/CLnhYvbwJrC6eEZeBLZYOXOR3giR3WGJ0XoRTXOCcUfEBFpmqcji08tTB5KyMUm0X7kwYg6U8dStGSduuFOOeKZ6SSHJNzUd8DbS4mFvgnB9Y966sDAyHar1jvKQ7+CBo4AKozSToU6Vsba7eOixYqCOmqea1CXk/Y4hJm/yx1L1DfrhwW0Sw7NmKt3ilpnbd4P+BvvHLi+EEkLLAQ+KxIBCUg+rpd6q3eJMmJR3VgZEApLBWAtC0wkD47ACUp+Z9t1wfdl61qHHUMus2uI88yVjNmqVqxSLK35MBtj5zW3T0hfRmwIpSeWsRtz8IN+UM7rwI6Bq6zm6KjX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzJCSATZIlJJU1BeXWs5WsIbfYiSRgwTXStIXrpFlkk=;
 b=kR+TxKK1r0RakhfvGhNDReh/w9hbLxbI+DFopEh9jyjbsYHnMpmMDDYrZvEvnCHdcZJEpbLQWo3wHftE6d3oYC/6NF53HmRI2Nwdg6TvSseDFC1srwsmZuAx/8g6o3yeNx1iPph/xRyFFqA7IloVUjgdX/rjU0PRMW7HBdBvm9MFPlp4wbKgYNKp83+J9nHaVdAYQXx5cwcgOR/HOQceiICDHK8zrfaKRZIFdXYWEFp4H6uS+VgZKOPoQRGp3PZy7AhgjpD95LhpiR6PpV+9uQyH1d6AxwTnTMBXiWXPznbRZtJ5usSiypXOohCcPPbAQajxiE2g75a0aFopbiwmpg==
Received: from CO2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:102:2::28)
 by DM5PR12MB2518.namprd12.prod.outlook.com (2603:10b6:4:b0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 30 Jul
 2021 01:49:48 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::76) by CO2PR05CA0060.outlook.office365.com
 (2603:10b6:102:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.6 via Frontend
 Transport; Fri, 30 Jul 2021 01:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 01:49:47 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 01:49:46 +0000
Subject: Re: [RFC 04/11] dt-bindings: Add HTE bindings
To:     Rob Herring <robh+dt@kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-5-dipenp@nvidia.com>
 <CAL_JsqLUc=_oyutBQ0rQP7uGhwh2dQeOng0ZEAfgOdqjGbiwOA@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <0d2141fe-742d-2247-89d0-191a65d3a842@nvidia.com>
Date:   Thu, 29 Jul 2021 18:58:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLUc=_oyutBQ0rQP7uGhwh2dQeOng0ZEAfgOdqjGbiwOA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b3f52b4-fb19-46e3-f80b-08d952fc4fdb
X-MS-TrafficTypeDiagnostic: DM5PR12MB2518:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2518C58315475BF65504ACEFAEEC9@DM5PR12MB2518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPAfZ9qUpnjXlwzqAZuu1Yd6BAOVVNDAdVQbVA5fYKVP4V9nTnyN0s1M5jgm742dTdTXJJdQls1oXH4SD4cfn/E6lEv6gO5pavuNsQmuK57igxluQ7j/BXJfemRC2qnegwhgsBnubb4QfT2qkFSltwFkEDL1JTzDsnod9LJ5zJ21U31Tnor7vUh89ws+ElKiFr7cadkoRiLHCVspYGaZsy7gOnKh5hQKLKzPQ+qRVK3+x1PTgBXeDklrqZby4LL847T3q9pbXi8glOKs2FttHzK8RSiqLU9mMpMo5NyWnjP15unHojH54UF+sEZYRrdCVOv9rRz6NbRfYRbInMcAbSFaUh5W5+16nfpe1rr8EEKYhWOioZ0dZWfTXwXEbHpSEZD5BxgQxRK6KFMQ3maMibqWJwmi9ugZoYxH0DO67QY2+Oud1SZcBekdrIX3rJCLfAqMOXFAIgmfXoaN6O695CUYZsmGj7Y6UYkreyajDAeEuxApDAyOhhNcRhMzl84Id67BlaL2tha3FG8lkqEbMi3lcsRmMxlmz9wBVIu0404jvgLVTFKvo3JTPcACWf946s0E+QQ1aTTw6zfvZOgdpoXw2rZCUUlwMM3LpckrNpXuG3aQTnls3XQFIabDapwgMI7v3V8dX16o1gYT0vgCsqQj60wwbQ8Q8610TFrjP4fh7jJUR4mfYda2q4I/iYFR2VWZy2mQgVE7NneT8bGCe3WgBE13O5UDSRIF2sejBxROAd1euebodE5Kn7+0Z/oJuflQFPsYoCdbHm4fJ+KHckrm0pmCTpF4h7lM0OfplsGy6xnJUd49yjMOfRrt6mgi
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(2906002)(31696002)(16576012)(83380400001)(2616005)(316002)(356005)(36906005)(54906003)(966005)(82310400003)(70206006)(36860700001)(36756003)(508600001)(186003)(53546011)(8676002)(70586007)(5660300002)(7636003)(7416002)(31686004)(8936002)(4326008)(16526019)(86362001)(26005)(336012)(47076005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 01:49:47.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3f52b4-fb19-46e3-f80b-08d952fc4fdb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2518
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/1/21 8:54 AM, Rob Herring wrote:
> On Fri, Jun 25, 2021 at 5:48 PM Dipen Patel <dipenp@nvidia.com> wrote:
>> Introduces HTE devicetree binding details for the HTE subsystem. It
>> includes examples for the consumers, binding details for the providers
>> and specific binding details for the Tegra194 based HTE providers.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  .../devicetree/bindings/hte/hte-consumer.yaml | 47 +++++++++++
>>  .../devicetree/bindings/hte/hte.yaml          | 34 ++++++++
>>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 83 +++++++++++++++++++
>>  3 files changed, 164 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>>  create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
>>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
>> new file mode 100644
>> index 000000000000..79ae1f7d5185
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hte/hte-consumer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: HTE Consumer Device Tree Bindings
>> +
>> +maintainers:
>> +  - Dipen Patel <dipenp@nvidia.com>
>> +
>> +description: |
>> +  HTE properties should be named "htes". The exact meaning of each htes
>> +  property must be documented in the device tree binding for each device.
>> +  An optional property "hte-names" may contain a list of strings to label
>> +  each of the HTE devices listed in the "htes" property.
>> +
>> +  The "hte-names" property if specified is used to map the name of the HTE
>> +  device requested by the devm_of_hte_request_ts() or of_hte_request_ts
>> +  call to an index into the list given by the "htes" property.
>> +
>> +properties:
>> +  htes:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      The list of HTE provider phandle. The provider must document the number
>> +      of cell that must be passed in this property along with phandle.
>> +
>> +  hte-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description:
>> +      An optional string property.
>> +
>> +required:
>> +  - "htes"
>> +
>> +dependencies:
>> +  hte-names: [ htes ]
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    hte_irq_consumer {
>> +              htes = <&tegra_hte_lic 0x19>;
>> +              hte-names = "hte-irq";
>> +    };
>> diff --git a/Documentation/devicetree/bindings/hte/hte.yaml b/Documentation/devicetree/bindings/hte/hte.yaml
>> new file mode 100644
>> index 000000000000..e285c38f1a05
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hte/hte.yaml
>> @@ -0,0 +1,34 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hte/hte.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: HTE providers
>> +
>> +maintainers:
>> +  - Dipen Patel <dipenp@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^hte(@.*|-[0-9a-f])*$"
>> +
>> +  "#hte-cells":
>> +    description:
>> +      Number of cells in a HTE specifier.
>> +
>> +required:
>> +  - "#hte-cells"
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    tegra_hte_aon: hte@c1e0000 {
>> +              compatible = "nvidia,tegra194-gte-aon";
>> +              reg = <0xc1e0000 0x10000>;
>> +              interrupts = <0 13 0x4>;
>> +              int-threshold = <1>;
>> +              slices = <3>;
>> +              #hte-cells = <1>;
>> +    };
>> \ No newline at end of file
>> diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>> new file mode 100644
>> index 000000000000..bb76cc1971f0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Tegra194 on chip generic hardware timestamping engine (HTE)
> I had to read until here to know what HTE is.
Do you think I should have added more description in commit message of hte.yaml for that matter?
>
> Is there another example of this type of h/w that this should be a
> generic binding?
For now, I have only this hardware.
>
> Rob
