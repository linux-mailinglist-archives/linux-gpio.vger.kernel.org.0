Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A563DB097
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 03:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbhG3BXN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 21:23:13 -0400
Received: from mail-mw2nam10on2077.outbound.protection.outlook.com ([40.107.94.77]:55453
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233516AbhG3BXM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 21:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6OAv4xTRdnDnrrc9eFSHjEzIFLET+ENZ0NKgJKS4GkcXB8qHUTCgpMOi9jRGA/INcPAFFtIVrOiz9E4W8453a95SEf9PlbNFM/YH6v9g7uXP1DFoKj65cgiEHSYA8hH9zg31CEFcB5Rcy+AHYHqMEsF6s/+ZK9Nw3box5HIMwj1Hu4staR8gnhLMgoWx1iIIzIQ3+lierqIO71SbV3TgxfZDcWx3Yz/kp69sO0b0/V73tCcgeZsgfyvFq6tLMg9BRwnDsjoOdvNQbHWic3xZon2KxEg6Gh5Z2QADceCeFU7YHA/J5Kyy8hb1JUMty00sgtJ8+drNu/hUx4jQ3ThJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1HoiVDlfNurHMXTqTtTCtGSCNxkPr7ROAQv+iTVSC8=;
 b=Oq/NDfzS+4ahqZWP54EvJly+i/N/uMbec1tiRqRLMRnfFH27H/ZTQSavE9tY0sRjRlAHlFPJoZMqeKdBqbeppS3Dsb277To6S2t7fwLFFesFaO7jUOASLCLzpfl60mO2c+c+hPKpR+NpEwo6Zf/7PcpwndpG7TLgXbH5pwsR6kCazQ8/GcSPx9Y0nk0HNxmkyE3uqY6hRpYMhJWEjuUmH5m28o9U3+8OZv0sgelsuNLUkM3m10jFTWU+xwTkE0zvZ9e3DTUR9FcD/t3xzs1TvhgTDNEnhSTK8TX9YvTCvoKrJiN21FDDMso9tU3iilOKJewYT0Vviehf5yi6S8FvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1HoiVDlfNurHMXTqTtTCtGSCNxkPr7ROAQv+iTVSC8=;
 b=XdetbWhcO8k4LMmy3pjxwUWW1nGRbDy/bWaZmkKSTAjAYBC8oMMXVgDKFqYOZTM9zSX9bpvdNxdqngoaqCCcwAIeBw1c7YIqax2rL3zTVEfUT5bKNFg4wbrhXASwX5d7OoMvY1Rakq9KUutCcPLY4wDiq1CBDzRDPQjI97scdEUiCHakJsJEn8Xj7phwTblIt9W+twhQmMfpnLFJsvK8Tc+sV8KJ3yJy3l1ahvHUtCbRY1ehidlt8s+712fk0aoAAHvusrSLqWscEsewYDC0MQ9ihRSaGKtjTUiBitkma3Rv12B9NBSAsrfH1NV4qJ8hrrLEzHOSpBWta4ICn+kgTg==
Received: from DM6PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:333::15)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 01:23:06 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::e5) by DM6PR03CA0082.outlook.office365.com
 (2603:10b6:5:333::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Fri, 30 Jul 2021 01:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 01:23:06 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 01:23:05 +0000
Subject: Re: [RFC 04/11] dt-bindings: Add HTE bindings
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-5-dipenp@nvidia.com>
 <CACRpkdbazcGqapWMLnj8=UShU0j002SkKRTxgpprfDeaP_nAQQ@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <4b313c41-2b1b-8498-e5dd-1f82b939fa6c@nvidia.com>
Date:   Thu, 29 Jul 2021 18:32:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbazcGqapWMLnj8=UShU0j002SkKRTxgpprfDeaP_nAQQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6af2362-34a5-482c-f0da-08d952f89596
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-Microsoft-Antispam-PRVS: <MN2PR12MB399808DBFF668BB2704715ECAEEC9@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SuvqXzHU/oYcn+Ruw2ZO1CpgfjBIKJUFcNa+xXCtxhNgMKS1c2xbsmR5FAIvqmKpUBubNwT7oHS6gJF9KZQBKFMY/4c33xPa1pvpX36Wns2P2VMWEGw9OB6s7HrUhv7cXaTzxihdJMe3+VMcw0pLJm5gtpwKdFkzx8GBQ5Sd3PToFb+lQySt1fxscPyKXTmCcw7tXdaJdNzoXRA6xzQtaZlTVeAkyqzwdo3GAzHC1Dp8eKWeX935w9wDSaEGAR9IBItQ38hA4ulNteGwYtj8NqxLXnJIrzPt57iDkCvYgnEw8CiFK1uao017CJLZoDcRcUkOT2sWYFSpaeamyWQHQq4ILwMYNZ1FeXdi0MulhUa+ia6BFsszjCTWNFoc3W8LUhncG6KXPwtXhw8MV2vgypbKnMKstSfwAlpq1+GKWGgI23yZrCSWMgL7/9MerLvIS4ZpeRoW4JeADlyjlcdL9qze2Wq2NTos9fUqxumEsZkvGEQtgmlADu4Oy0k95y7BlPfgmzoMP9m+cokPy9dek4ph5/ZweFRG/OytIR4aWnageXl882RNi0zRVI7jMiGXjvlYO70p6834nfEErj6st8WfZIKf1oct0yaJyS23+duuI7a9mQhuq46uHxM5vMNOE6BbPzDYTV2Y8wqpQ41GM8fS4WnNBU6oigptDh7ohSxL5NHWTK0H+vgPrCbaAbYAgfMqR9rCE9sr9la1Pg1XvQynPfztKAbXXfR2wQy0emgDBverLi2jzC+zEOfohB93L2Gt34sv/2rJGZeo9EUa/kwtD+UAqDNtm4sxoIRaD4gJ3pS5AlScLN7op4J5kB8m
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(316002)(8676002)(966005)(70206006)(6916009)(16576012)(2616005)(36860700001)(186003)(82310400003)(54906003)(70586007)(478600001)(36906005)(36756003)(16526019)(26005)(336012)(8936002)(2906002)(5660300002)(356005)(426003)(7636003)(47076005)(86362001)(4326008)(82740400003)(31686004)(53546011)(7416002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 01:23:06.3380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6af2362-34a5-482c-f0da-08d952f89596
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/27/21 3:56 AM, Linus Walleij wrote:
> Hi Dipen,
>
> thanks a lot for this very interesting patch set!
>
> I'm gonna try to review properly, just pointing out some conceptual
> things to begin with. Bindings is a good place to start.
>
> On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
>
>> +description: |
>> +  HTE properties should be named "htes". The exact meaning of each htes
>> +  property must be documented in the device tree binding for each device.
>> +  An optional property "hte-names" may contain a list of strings to label
>> +  each of the HTE devices listed in the "htes" property.
> I think this is a bit over-abbreviated. IIO has:
> io-channels =...
> io-channel-names =...
>
> Given DT:s infatuation with using english plural I would opt for:
> hardware-timestamps = ..
> hardware-timestamp-names = ...
I can change it to suggested names in next RFC series.
>
> The "engine" part is a bit of an nVidia:ism I think and a too generic
> term. Could as well be "processor" or "automata" but nVidia just
> happened to name it an engine. (DMA engine would be a precedent
> though, so no hard preference from my side.)
>
> When reading this it is pretty intuitively evident what is going on.
>
> Other than that it looks really good!
>
>> +++ b/Documentation/devicetree/bindings/hte/hte.yaml
> I would name this hardware-timestamp-common.yamp or so.

Sure, but do I have to change hte-consumer and other hte named

yaml as well in this directory? If yes, I am referring HTE everywhere  in the

code (framework is named as hte itself), I hope that is fine and does not

create any confusion.

>
>> +title: HTE providers
> Spell this out: Hardware timestamp providers
Can I do hardware timestamp engine provider instead?
>
>> +properties:
>> +  $nodename:
>> +    pattern: "^hte(@.*|-[0-9a-f])*$"
> Likewise:
> hardware-timestamp@ ...
>
> I think this is good because it is very unambiguous.
>
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
> The examples can be kept to the tegra194 bindings I think, this
> generic binding doesn't need an example as such.
Ok, will remove it.
>
>> +$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#
> This one should be named like this, that is great.
>
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Tegra194 on chip generic hardware timestamping engine (HTE)
> This is clear and nice.
>
>> +  int-threshold:
>> +    description:
>> +      HTE device generates its interrupt based on this u32 FIFO threshold
>> +      value. The recommended value is 1.
>> +    minimum: 1
>> +    maximum: 256
> Does this mean a single timestamp in the FIFO will generate an IRQ?
> Then spell that out so it is clear.
In the description I said that.
>
>> +  slices:
>> +   description:
>> +    HTE lines are arranged in 32 bit slice where each bit represents different
>> +    line/signal that it can enable/configure for the timestamp. It is u32
>> +    property and depends on the HTE instance in the chip.
>> +   oneOf:
>> +    - items:
>> +        - const: 3
>> +    - items:
>> +        - const: 11
> Can't you just use
> enum: [3, 11]
> ?
Sure, will change it.
>
>> +  '#hte-cells':
>> +    const: 1
> So IMO this would be something like
> #hardware-timestamp-cells
Sure.
>
> Other than this it overall looks very nice to me!
>
> Yours,
> Linus Walleij
