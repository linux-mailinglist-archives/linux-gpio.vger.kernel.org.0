Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D1F444A68
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 22:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhKCVpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 17:45:38 -0400
Received: from mail-sn1anam02on2080.outbound.protection.outlook.com ([40.107.96.80]:57518
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229698AbhKCVph (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Nov 2021 17:45:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqC9VnDB684ZjQe6drP6bnD238uauOc1LfeAmcy9SJSuqizWE27BBuEEPKPrEo+xMwZTGja4EIqc90aGay4vIHWYVzUgUfPrPK/J9LyyqrKmZBIye3yTALGD66fRXxlWjQYIE+lNYe6b8fqQZn0V7cSBBKqZsg4NiuNbvDLTut/yszHcU1okaNKW/E0dVmdXSsllfU0zw3O2fA/sGLQQ+tARmrtpbDOxzHi5AiUy502DBXUgPCV59p/zrgQ25+k0NEtjrYYo7jzfAXHrSMJrl+r0PvYU8Yu0PU4mwrGwKAVGdpr41aHO4xaKa5DwO1oimUxKzBqzqApD+z1Tgt/Z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IErX6bic2XvMdhUasuMKspdcNf0IWlzCNRBRy+VdmqU=;
 b=G4QuTdWXEGD/y3DvHITQZLS7Izt/ZGzx9DhuaeDB3DY1BCkzkIozlnPs3dHfNB1tOk+TTcC8/UfoUKzJcpFUEx+nJCg49o0w2HjXW9gYywbKGs/h4kUhzB7sbYJgi4iv7c1hSVEvqlTcdImFMvOQ3fhG3JctcMOSmTKtdxnM2NAoc2pLG+Exl5X0tm9H4eLPVl1MQr5lXGnXtSIv2aK4Ng9caQkzceR59SuLUN1JALl3EVj2ujgckUJVaILCFUZJ/jLsrYjHkaK1+Cm23wAb2AyYa0o0Zhz1VI3FSRayQsS9W7Y5Uc62uatWdAPci2/eFuMJeNwzQ0SmgngAZ/e03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IErX6bic2XvMdhUasuMKspdcNf0IWlzCNRBRy+VdmqU=;
 b=Jsbpa189tAIqHL2QCxaYOp1+Bzz6mHB2Y+lhyPYDKMRknB+5Ha8QqsTmqvXH8ZY2lMF0taX/VDtWUbPRRvTZO4tV/tjDhyDdnSLmzTyaDnaZoKJW0FQkUhDHBYNZyXg0X/MUh94yZvulUSV4pwFFSV8y9ZT4wawnqp8aztCZ06FOjmGnzkytFsUHmlFBXybZQKS5uYGcvXvxJPeFzu8vQepuK2jWL9SE1S3AmwI9OfoyMMeNRSHnuMn1aXRPtNIYQYbyqq9IkCHcQVFbC6MDi6GeC7GoLGvjalwBKtynjJYR/Y2zldN1yxPs/WLBsePFyqLtHU7N01u9mnXxkq2z3w==
Received: from DM3PR03CA0021.namprd03.prod.outlook.com (2603:10b6:0:50::31) by
 CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Wed, 3 Nov 2021 21:42:58 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::c6) by DM3PR03CA0021.outlook.office365.com
 (2603:10b6:0:50::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 21:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 21:42:57 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 21:42:56 +0000
Subject: Re: [RFC v2 04/11] dt-bindings: Add HTE bindings
To:     Rob Herring <robh@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-5-dipenp@nvidia.com>
 <YWDCEOuHu8vsRSPH@robh.at.kernel.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <f6331beb-c2c3-dded-f07e-aea0067cf39c@nvidia.com>
Date:   Wed, 3 Nov 2021 14:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDCEOuHu8vsRSPH@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5283be0-2dd6-4a1e-1d35-08d99f12e6fb
X-MS-TrafficTypeDiagnostic: CH2PR12MB4070:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40703B48C56F022D601EB8E1AE8C9@CH2PR12MB4070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITYQTIIFzB4DGU8YQLZ96FSbdDdwVfAryTznLMmTM1fsHqA0eSwWRcmueE/jOue9J4uI+yronw3G/qJzghLRWXonIK3tMQkIyRtKDSaHKOOxP2N/902XnS1OmQqXHUKFBUO2ALtOEHZwCblyL2ptmXbUvECsd+qRKdxO1PjIuDXFZtmD622JwxF52S32dCzvlA91+Haa/cwk3+A0MTrdtYgYikyWyDxFWmQJkUtmceUJczHS5uCwyP7kx7P3Jn5UYzQZUtzONVv1P99qrR5ef84TKIt5tLYgzEa0OIIXI6dCkfhTZkJqCeaib9FmtssFNoGOCS2KsNIc/3Sh5uPReiHGZtLQpbAZ94sgrmIgPZUChvPXKy1tPooXbsvB4e8kRkPA1oHa6TGORKZv0Sfztoa+AhDEj6w9gsGit0jcmUpzrK/1Gyo0awilYOS9PoHOIdekG5rVacwXEUkXOEpNziPbk27B2hMaTRWSS4HYMvZexlYQ/HJKW/RemSmBPUMucR3W7vRRsXOyn4jWrVV7U8T/c8BcVkvvMSOrvNz8RsnK+obGeT2ZcakLcMi9Ms6so7h309+VVOqDWpr7oM11j86PKRl586AJLdeFf9tkCtZY/BwO8fm0SsnpNkf4EheupIzNZvkY9IGDe7v6msNSpi3uN7bAtnMfdfrkX0AeAyCKXMqUQqTdzkI5OF1dQ05mGJWCyAsxXc0BJEQ29CJPp3cHDl2wgKLfGKcBYYlV3w2KTsYKoyOBObN7fSPsj7JOD591ORJ21KTDBYGIfQ6ytVrHdSDIWBNkG5YUPT3KI5+P8iyUyAaL/lBee1wPNS8yvZYhISJWjbNEk9vvGzMSu08dzugLL5/lImgMh9l5uSw=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(53546011)(5660300002)(7636003)(47076005)(8936002)(6916009)(82310400003)(966005)(7416002)(36860700001)(16576012)(2906002)(31686004)(26005)(36756003)(54906003)(4326008)(508600001)(70586007)(336012)(83380400001)(31696002)(186003)(8676002)(2616005)(86362001)(16526019)(426003)(70206006)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 21:42:57.8442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5283be0-2dd6-4a1e-1d35-08d99f12e6fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,


On 10/8/21 3:11 PM, Rob Herring wrote:
> On Thu, Sep 30, 2021 at 04:26:10PM -0700, Dipen Patel wrote:
>> Introduces HTE devicetree binding details for the HTE subsystem. It
>> includes examples for the consumers, binding details for the providers
>> and specific binding details for the Tegra194 based HTE providers.
>>
> This pattern of binding isn't easily checked completely by schema. You 
> need a dtc check added too. Should be a 2 line change. (And dtc changes 
> go upstream first).
Sorry, I could not understand your comment. Can you please elaborate?
>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>> Changes in v2:
>> - Replace hte with hardware-timestamp for property names
>> - Renamed file
>> - Removed example from the common dt binding file.
>>
>>  .../hte/hardware-timestamps-common.yaml       | 29 +++++++
>>  .../devicetree/bindings/hte/hte-consumer.yaml | 48 +++++++++++
>>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 79 +++++++++++++++++++
>>  3 files changed, 156 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
>>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
>> new file mode 100644
>> index 000000000000..8b8db3bc4dcf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hte/hardware-timestamps-common.yaml
>> @@ -0,0 +1,29 @@
>> +# SPDX-License-Identifier: GPL-2.0
> Dual license new bindings.
Do you mean to add SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) instead?
>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hte/hardware-timestamps-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Hardware timestamp providers
>> +
>> +maintainers:
>> +  - Dipen Patel <dipenp@nvidia.com>
>> +
>> +description: |
>> +  Some devices/SoCs have hardware time stamping engines which can use hardware
>> +  means to timestamp entity in realtime. The entity could be anything from
>> +  GPIOs, IRQs, Bus and so on. The hardware timestamp engine (HTE) present
>> +  itself as a provider with the bindings described in this document.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^hardware-timestamps(@.*|-[0-9a-f])*$"
> "^hardware-timestamp(@.*|-[0-9a-f])?$"
>
>> +
>> +  "#hardware-timestamps-cells":
> Double plural:
>
> #hardware-timestamp-cells
>
> Arguably, the same string everywhere would have been an easier design, 
> but let's keep consistency with (most) other flavors of this pattern.
>
>> +    description:
>> +      Number of cells in a HTE specifier.
>> +
>> +required:
>> +  - "#hardware-timestamps-cells"
>> +
>> +additionalProperties: true
>> diff --git a/Documentation/devicetree/bindings/hte/hte-consumer.yaml b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
>> new file mode 100644
>> index 000000000000..cf65d1d44a18
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hte/hte-consumer.yaml
>> @@ -0,0 +1,48 @@
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
>> +  HTE properties should be named "hardware-timestamps". The exact meaning of
>> +  each hardware-timestamps property must be documented in the device tree
>> +  binding for each device. An optional property "hardware-timestamps-names" may
>> +  contain a list of strings to label each of the HTE devices listed in the
>> +  "hardware-timestamps" property.
>> +
>> +  The "hardware-timestamps-names" property if specified is used to map the name
>> +  of the HTE device requested by the devm_of_hte_request_ts() or of_hte_request_ts
>> +  call to an index into the list given by the "hardware-timestamps" property.
>> +
>> +properties:
>> +  hardware-timestamps:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      The list of HTE provider phandle. The provider must document the number
>> +      of cell that must be passed in this property along with phandle.
>> +
>> +  hardware-timestamps-names:
> hardware-timestamp-names
>
>
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description:
>> +      An optional string property.
>> +
>> +required:
>> +  - "hardware-timestamps"
> Don't need quotes.
>
>> +
>> +dependencies:
>> +  hardware-timestamps-names: [ hardware-timestamps ]
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    hte_irq_consumer {
>> +              hardware-timestamps = <&tegra_hte_lic 0x19>;
>> +              hardware-timestamps-names = "hte-irq";
>> +    };
>> diff --git a/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>> new file mode 100644
>> index 000000000000..529926118f35
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Tegra194 on chip generic hardware timestamping engine (HTE)
>> +
>> +maintainers:
>> +  - Dipen Patel <dipenp@nvidia.com>
>> +
>> +description: |
>> +  Tegra194 SoC has multiple generic hardware timestamping engines which can
>> +  monitor subset of GPIO and on chip IRQ lines for the state change, upon
>> +  detection it will record timestamp (taken from system counter) in its
>> +  internal hardware FIFO. It has bitmap array arranged in 32bit slices where
> has a bitmap
>
>> +  each bit represent signal/line to enable or disable for the hardware
>> +  timestamping.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nvidia,tegra194-gte-aon
>> +      - nvidia,tegra194-gte-lic
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  int-threshold:
> nvidia,int-threshold unless this is common for all hw timestamps?
>
>> +    description:
>> +      HTE device generates its interrupt based on this u32 FIFO threshold
>> +      value. The recommended value is 1.
>> +    minimum: 1
>> +    maximum: 256
>> +
>> +  slices:
> nvidia,slices
>
> Needs a type.
>
>> +    description:
>> +      HTE lines are arranged in 32 bit slice where each bit represents different
>> +      line/signal that it can enable/configure for the timestamp. It is u32
>> +      property and depends on the HTE instance in the chip.
>> +    enum: [3, 11]
>> +
>> +  '#hardware-timestamps-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - slices
>> +  - "#hardware-timestamps-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tegra_hte_aon: hardware-timestamps@c1e0000 {
>> +              compatible = "nvidia,tegra194-gte-aon";
>> +              reg = <0xc1e0000 0x10000>;
>> +              interrupts = <0 13 0x4>;
>> +              int-threshold = <1>;
>> +              slices = <3>;
>> +              #hardware-timestamps-cells = <1>;
>> +    };
>> +
>> +  - |
>> +    tegra_hte_lic: hardware-timestamps@3aa0000 {
>> +              compatible = "nvidia,tegra194-gte-lic";
>> +              reg = <0x3aa0000 0x10000>;
>> +              interrupts = <0 11 0x4>;
>> +              int-threshold = <1>;
>> +              slices = <11>;
>> +              #hardware-timestamps-cells = <1>;
>> +    };
>> +
>> +...
>> -- 
>> 2.17.1
>>
>>
