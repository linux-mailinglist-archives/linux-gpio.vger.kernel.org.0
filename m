Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDF63A7BD4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 12:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFOKaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 06:30:18 -0400
Received: from mail-mw2nam08on2048.outbound.protection.outlook.com ([40.107.101.48]:43711
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231214AbhFOKaR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 06:30:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASMeDguOMjcogjR8nQlF8iBXpSi6x+BFQCE8CjA8PZV+E+Pe0BJZjOFCqKYmUzXFKJuwkifOqUBYLvXHQ+rcZ1KNYJHHAl1Fg3uDulHyw6/92lj2a28dfV833BevWg979cQEJYjWuza6gj/Zz1kA/ZdxE4en12/GSaRhRUFd1y5xtJAp8AK+0dNPd/5FLUAJz8WzPuGBAtlobVc71VpdX+N/ivIcmdRqCuBclRz6ZW8ANL9dSeaJUpvFx1IsZnx9Z5bke0+IepJBTQYbcMWXoVwyFQfl4CLJYoM7+4+DAtsYcUrSMMj9AlIjmgLW5HcE0b086hUww/F8ct/zLIvMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i48EyGuRKvrnsH72iCq5e9g0xr3MjABLlr8jLJu2Rbg=;
 b=XQcfwo3WD+Wfp2fCXcFV8hIr+vXvXpGyrIwdEHSAGshNylhenw+XDqbDYlAXUHszPdCX1wCYJcDzVXPz9y9kknfqBHK0U6kuAfFPMWEU/yNmt7rlmnM6t76c0H7VmGOn4Cgh8G7kUhmqPEq3PDfAEY9ElWc9pJKGUs+CBum/u9tWcLtammZ7H4bXnVMa6s5bFQ+8mfs0pr1BtH0m5ggd2R33dAHYRS4ELfivxRe5LILFvrXqLeI7hzHxF5UhbiMRAox5DGyvv7atyFzVXjlAeSHCCEsRdKfrYpglngTS+Oa/au2TuUO3WvJfNBz8IzjdrRzgaattg1IlJm+9x6I1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i48EyGuRKvrnsH72iCq5e9g0xr3MjABLlr8jLJu2Rbg=;
 b=nj20JCwRqY/C++CqZY2jXSG8JmJOizEwvZ1KghsPLzvF0fKXwVNeP4x6d7xwmWelreWKUcQ604j0g0mu7dbHdgzg0BP0ba2H3C12oFgjtvV3pvaWKhVZBPY02FzHD90PU5RkkxB57gKrx29YUIBuic8WMIWVnrWh0GL8aFmUpVc=
Received: from SN6PR04CA0108.namprd04.prod.outlook.com (2603:10b6:805:f2::49)
 by BYAPR02MB5800.namprd02.prod.outlook.com (2603:10b6:a03:124::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 15 Jun
 2021 10:28:11 +0000
Received: from SN1NAM02FT0044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::ea) by SN6PR04CA0108.outlook.office365.com
 (2603:10b6:805:f2::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 15 Jun 2021 10:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0044.mail.protection.outlook.com (10.97.5.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 10:28:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 03:28:10 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 15 Jun 2021 03:28:10 -0700
Envelope-to: git@xilinx.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 bgolaszewski@baylibre.com,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=33904)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lt6Ii-0007uT-TC; Tue, 15 Jun 2021 03:28:09 -0700
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add binding documentation for
 modepin
To:     Piyush Mehta <piyush.mehta@xilinx.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>, <git@xilinx.com>,
        <sgoud@xilinx.com>, <michal.simek@xilinx.com>
References: <20210615080553.2021061-1-piyush.mehta@xilinx.com>
 <20210615080553.2021061-2-piyush.mehta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d41f65d5-cb5d-4854-fb51-2808865d042c@xilinx.com>
Date:   Tue, 15 Jun 2021 12:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615080553.2021061-2-piyush.mehta@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c30edf3-8e70-48bb-36d6-08d92fe84685
X-MS-TrafficTypeDiagnostic: BYAPR02MB5800:
X-Microsoft-Antispam-PRVS: <BYAPR02MB58004E3840DA7B9CD204C54EC6309@BYAPR02MB5800.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnWdf0wNpBIawnTX8h/TgxeQ/Uq25aSps8VUBy515SePcEPGGZTXHz16ZV3D+XuNFOooVzsgNb358RBv3qs5/eLvYgafwtOL3mswzIxUdLN2WeyBnU6iu11nnMk6tgxhuyL7xbVMr0SGbqB/pfcNWXj1Vpxz4pNzloqYDvodOpLTnDLomIPUFCPwitwYmyqeWVUAy/7SqDUNvKLZFfrnReBnwH1vD2zuVcr9xofm0itC3Uqlc83MTQueykOc+AJtBerbJLKT3YLQM84pAmDGSkIZzTzAO3kEd8jk8QzDueetQhOdodcHRDcXJ9YyndOYEuVvUf3o6EAsN8QUNl43fjtCmpeBurmOHtupB0+Vkdjn02as0mRAYcnaZwwfUnjPqUJOWxSNdwOQBtnrHN83u3I3mPkPP2SJLyMByA+BNX/ZSoX+5QOVSI/BbHktCoGeutwGT0l9fY1SHSHZUPV+/tydPs3X6fnUnXfIycJ7XpXuGlYOOQC6eAi2mZETyhU+cBLp+I0HuA9AV/K+2he9Cue+wpaYC/aoM1Ebgs+FZLi+vTuWKiLZZOES3Z+sx/eKmbMat+6TXiN+PGU1K8b7LsgXTFWTj0JDo+kJBCimlIXL7xmwaI64vqQ5+j9TJTlpEpRpHJ5UQ9JbKqkCrv2kR6fauexo5BRC2s0FSJeUOsniAkuxDlRm27dOCaotq2hqxWrtnlFWFg0NaBQjCncn1wdrSm+VvKOcaKi5DwSGjJUQ+fmr/kH9V+0voAS9HOUiSyK8muN8xAPKgqmyp3G4VVpPcsehwfwRubO0Xgo0CPuYE65jr53uzBSFT/cohiOAW/kPSNO6jV6//ePcn98O+98MrenA4U674pdTfTI5NPvmKEHMps+ALt8eTeRAT0KS
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39850400004)(376002)(46966006)(36840700001)(26005)(110136005)(54906003)(31696002)(8676002)(36756003)(186003)(478600001)(82740400003)(36906005)(70206006)(31686004)(356005)(316002)(6666004)(70586007)(53546011)(7636003)(5660300002)(107886003)(83380400001)(2616005)(47076005)(2906002)(8936002)(9786002)(36860700001)(44832011)(336012)(4326008)(426003)(82310400003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 10:28:11.0889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c30edf3-8e70-48bb-36d6-08d92fe84685
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5800
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/15/21 10:05 AM, Piyush Mehta wrote:
> Add DT binding document for modepin GPIO controller.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> State: pending

note: this shouldn't be the part of commit message.
But please wait when dt guys review this file and then send v2.

M

> ---
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> new file mode 100644
> index 0000000..39d78f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpio/xlnx,zynqmp-gpio-modepin.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: ZynqMP Mode Pin GPIO controller
> +
> +description:
> +  PS_MODE is 4-bits boot mode pins sampled on POR deassertion. Mode Pin
> +  GPIO controller with configurable from numbers of pins (from 0 to 3 per
> +  PS_MODE). Every pin can be configured as input/output.
> +
> +maintainers:
> +  - Piyush Mehta <piyush.mehta@xilinx.com>
> +
> +properties:
> +  compatible:
> +    const: xlnx,zynqmp-gpio-modepin
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    modepin_gpio: gpio {
> +        compatible = "xlnx,zynqmp-gpio-modepin";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +...
> 
