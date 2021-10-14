Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B12F42E2B4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 22:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhJNU1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 16:27:11 -0400
Received: from mail-eopbgr30054.outbound.protection.outlook.com ([40.107.3.54]:10830
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229637AbhJNU1L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Oct 2021 16:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw2wftZmqKMGA7M4KX5GEuyBgAM44RdQ3Jpc9qwSN4o=;
 b=rR2h/4FJrMtUKmhYom4WOHaq7v0fLrBdNGINOmsMSRiipR0P4ZlijFtO5tZo7puRiQnJIXuFOxr1UGPoIcyrf64Q6dGUlKMqzGNGLfovMKyjK+f7+5eKtjZ3+X19V0EKeU2w3j0IhvnOV7T4sph8QK/6UqQ0TOWJl+6tFXPvQko=
Received: from AM5PR0601CA0040.eurprd06.prod.outlook.com
 (2603:10a6:203:68::26) by AM6PR08MB5031.eurprd08.prod.outlook.com
 (2603:10a6:20b:ed::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 20:25:02 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::30) by AM5PR0601CA0040.outlook.office365.com
 (2603:10a6:203:68::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 20:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 20:25:02 +0000
Received: ("Tessian outbound b9598e0ead92:v103"); Thu, 14 Oct 2021 20:25:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e3e8e4676441804
X-CR-MTA-TID: 64aa7808
Received: from 82c07cfe3d96.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id E93120F6-BD99-49CC-AFE5-A4FC2BB4D6F6.1;
        Thu, 14 Oct 2021 20:24:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82c07cfe3d96.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Oct 2021 20:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNtVpSYDCTzQWdUXlSSGBgQ3V2wVJMVFeAYYKX8n9eXuQId7WUAIPSY7Mwfsa7vKzV60NuzJfv/4lPesudHdHKnLGXzHs/+r0jiqlOzTjPmCYqC7vVxvJh2/SXavvTUk7ci463LpyQlsUVzgDs65YGxgeqDo2dUmsFPN+OH6FmkaGyLz+XzI0xXM6gnRdIgS/gjHAlPsczZwm9lIcrLzSExNP+suLQ0CSyn0zLoAKwSWpT4x4WyL5TZ+n9BAWDBJowlG3L2BpfLDqTphn0w7cS7+CRuK1VL/dVjVgB6A4g5e+SKoBGOxyjRQXB7Nzj6goTg6pYlAe1J4ZJ2kW4JvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw2wftZmqKMGA7M4KX5GEuyBgAM44RdQ3Jpc9qwSN4o=;
 b=A64lf2J5N5goz/YAxXYdJyetQTK+1uUasDoSYgwy8dHrU1XwaGM1D6AqxZTC3iZdzi5FYptcpiCZ4TY1zn2RulF94Cw0wHtNXPTuqPtq/pmOZdOvyqfxRRClyehH+g1fZ5knGQWryEeuoFXQHddMVhw3W+hPprtXHnciQUNm3nlljhkLPFrXZ91yVyJroVkHM/lVdRuFfWPPltPJ1H+EwBUQV8fU9rLw4Hc31gOs5v8QWVnQMqeFN0HDS99br2HTZNDWIOYbS5f3nfqtALMa2uXTF9pMAJaDiFDV2Q8PdehlrDsHBav6eGPeLcTWEc7FKWFC9aRxQE7q+KJK1OhH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw2wftZmqKMGA7M4KX5GEuyBgAM44RdQ3Jpc9qwSN4o=;
 b=rR2h/4FJrMtUKmhYom4WOHaq7v0fLrBdNGINOmsMSRiipR0P4ZlijFtO5tZo7puRiQnJIXuFOxr1UGPoIcyrf64Q6dGUlKMqzGNGLfovMKyjK+f7+5eKtjZ3+X19V0EKeU2w3j0IhvnOV7T4sph8QK/6UqQ0TOWJl+6tFXPvQko=
Authentication-Results-Original: marcan.st; dkim=none (message not signed)
 header.d=none;marcan.st; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 20:24:50 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::951e:f504:6b46:28a3%9]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 20:24:50 +0000
Date:   Thu, 14 Oct 2021 21:24:46 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v2 3/3] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <20211014202446.GA9397@e124191.cambridge.arm.com>
References: <20211001191209.29988-1-joey.gouly@arm.com>
 <20211001191209.29988-4-joey.gouly@arm.com>
 <e18d09cb-ec5f-0e15-e701-f6ae5108b23e@marcan.st>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18d09cb-ec5f-0e15-e701-f6ae5108b23e@marcan.st>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::34) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.52) by LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 20:24:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e519a8f9-cd85-4c18-3de3-08d98f50b388
X-MS-TrafficTypeDiagnostic: DB9PR08MB6556:|AM6PR08MB5031:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5031C78921677026B2ACCCA094B89@AM6PR08MB5031.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IqXe9Ktf4vNSBhZOG6kWzhH6yunVLPXs5maP1e4RE1DknFI/pUyado5uYe12MJVh3oe3XhwfzCQ1lIp8bLlx8D7AN129EUN3179Km2Wvy4NOuM1685fSCGybZ4MP1Z6QZknf4GmSeOFlPXT+lt2LwNryZnsHBJaSVIhr4FaREb8ViWWM0vghEyknQz89o8Uq1voX+P7DrhJuQ1ikmnsa78ufhOYCVcfGIku6fMmlbciAbhF3uXHuSVS5/ypf8+wWzgdlzZ05UKQ6fBcfUq3/p4Rohhcst+AORMRwOHv+CncKOmKTDWXRM+WZsJFTd/4e6CgODVxz7VwbmoZxjhqfHEbfYPMWcs06uQET4uwqC9Dfg7r7VWSiWH5L9L0EApj6f+KB06XNbaerAF0HK27NqcKdAE2hEtJrvT4IyAsTKu3RlX5j5iOAhFPAbC9MbSzf9cHdABJDqZJYkZGC6uPZkudiivjxpAj4LTnQZ983mM/7yQn5LUwshsLIUma8jYrZekiW1Dd30jPmlRA4yVgcRsST54Zt9+x8QWxfH+WZNiHH6+qFPQ1Xb7JKJueGQHzH9e/ceeHuQ1oVUZKJfUwN9AUa4ncPy13JXoEmRpewrrWRLGTawfK07qIx4kuVnkuLEPUctwPoguuhRHFkMY2EePfIrM2yw9dg1dZNI/0USIMgP8EpgPE+PabcNhzDjB56WL2P0+znl34S9LRsoaPsJodBGKs1h5vEpIxN0/eLOLo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(47660400002)(956004)(8936002)(83380400001)(38350700002)(44832011)(33656002)(7416002)(8676002)(186003)(86362001)(4326008)(26005)(5660300002)(316002)(55016002)(6666004)(508600001)(38100700002)(2906002)(66556008)(7696005)(66946007)(54906003)(52116002)(1076003)(6916009)(66476007)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
Original-Authentication-Results: marcan.st; dkim=none (message not signed)
 header.d=none;marcan.st; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bfa863a5-62c2-469e-3563-08d98f50abf2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pAHU/lrXaPs1yoA0nhdurHAQF6auYi9XPGZcZznNRTAuM2dkuYnNT+mtBUZF9azKhQU6cmCCAw/kDjNX3p3GKiFKJHKE7mmzk343mc+726Cs8Mc9TR5SQ+SRM29hwhvUOytRsJzaUDLkhpmSlcx2W6Au0ePes65K6UkLJJYyv2AmRdO2lhRBRpcKgqEx5Z1YQVWSZqPg1QTrxevDzYhxUuNsCCGZvXPFTEGyt6ww0+MsC+pfJ5d0GATH9GMfyMv6zyX/EzV9rI1DQecpTeKFaeYzz72MmHfj1q2Hsi5ZU+D2toxD17+yoZ5CoVuZpc/5jJT/kbWF8g6y3hVGsAsFfXfwdcijAuuJlEA5CaUHc1eXhNu9sXVOyZiXoe55WkUNoSyKkT8WfzO0G933ADxubI+irdXNO6GrsCJ6s+0csCSZ2IU//IVrkrYS0agq022z/Shql3wTsZlaQcS5i8RQX7PXYslnNS0Wzd2kRkvPkijsqonNeZk92BD7wmjTdhE/qY9aXYeEtDbFU6LfsM0S9eAoLHQ6IvyZqaczA+A19d7fGLy+pyzEA/CK8/6Ewvhu3gqrtNlU9wYree+T4uBRo4T7gxvsFIXhEUb8lgUYhlr5bcsw/r3RuGEQO0IpWCs8f+fzgg/fsbkgAFJ78uRnqIXmfLFN2YyYnLxcwrATlDWtqCovXrm4LjaiqoBlgjqtj93SAM/MLcPihpzIM/+GwFQ517dZqDfHofi0ZV5PUAQ=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(6029001)(4636009)(47660400002)(36840700001)(46966006)(508600001)(70206006)(70586007)(316002)(44832011)(36860700001)(6666004)(82310400003)(356005)(107886003)(55016002)(8676002)(86362001)(7696005)(4326008)(186003)(1076003)(5660300002)(33656002)(336012)(956004)(6862004)(450100002)(83380400001)(54906003)(26005)(2906002)(81166007)(47076005)(8936002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 20:25:02.0362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e519a8f9-cd85-4c18-3de3-08d98f50b388
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5031
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Mon, Oct 04, 2021 at 12:33:15PM +0900, Hector Martin wrote:
> On 02/10/2021 04.12, Joey Gouly wrote:
> > +#define REG_GPIO(x)          (4 * (x))
> > +#define REG_GPIOx_DATA       BIT(0)
> > +#define REG_GPIOx_MODE_MASK  GENMASK(3, 1)
> > +#define REG_GPIOx_OUT        1
> > +#define REG_GPIOx_IN_IRQ_HI  2
> > +#define REG_GPIOx_IN_IRQ_LO  3
> > +#define REG_GPIOx_IN_IRQ_UP  4
> > +#define REG_GPIOx_IN_IRQ_DN  5
> > +#define REG_GPIOx_IN_IRQ_ANY 6
> > +#define REG_GPIOx_IN_IRQ_OFF 7
> > +#define REG_GPIOx_PERIPH     BIT(5)
> > +#define REG_GPIOx_CFG_DONE   BIT(9)
> > +#define REG_GPIOx_GRP_MASK   GENMASK(18, 16)
> > +#define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))
> 
> Can we update these defines with the correct definitions and names we
> figured out the other day and add the missing ones? We now know a bunch of
> these are wrong (e.g. CFG_DONE is INPUT_ENABLE, PERIPH should be two bits,
> we're missing pull-up control, drive strength, schmitt trigger and lock
> bits). Even if we don't implement all the features in the driver yet, we
> should have all the register bit defines for documentation purposes at
> least.

Done.

> 
> > +	if (!(prev & REG_GPIOx_CFG_DONE))
> > +		writel_relaxed(cfg & ~REG_GPIOx_CFG_DONE, ppin);
> > +	writel_relaxed(cfg, ppin);
> 
> We already determined this dance doesn't make any sense; if we want to
> change the pin config before enabling the input buffer (whether this serves
> any purpose at all is an open question) then that should be handled in the
> upper code responsible for enabling/disabling the input buffer, not in the
> core register wrappers.

Removed this.

[...]

> > +static void apple_gpio_gpio_set(struct gpio_chip *chip, unsigned int offset,
> > +				int value)
> > +{
> > +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> > +
> > +	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
> > +			   REG_GPIOx_CFG_DONE | (value & REG_GPIOx_DATA));
> > +}
> 
> `value ? REG_GPIOx_DATA : 0` please, otherwise this makes assumptions about
> value always being 1 and REG_GPIOx_DATA being the LSB.

I like that.

> > +static int apple_gpio_gpio_direction_input(struct gpio_chip *chip,
> > +					   unsigned int offset)
> > +{
> > +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> > +
> > +	apple_gpio_set_reg(pctl, offset, REG_GPIOx_MODE_MASK | REG_GPIOx_DATA,
> > +			   FIELD_PREP(REG_GPIOx_MODE_MASK,
> > +				      REG_GPIOx_IN_IRQ_OFF) |
> > +				   REG_GPIOx_CFG_DONE);
> 
> Is hardcoding IRQ_OFF correct here? Shouldn't this be getting the intended
> IRQ state from somewhere, or is it always guaranteed that that gets set
> later?

As far as I can tell, the only way to setup an IRQ on a pin/gpio goes
via the apple_gpio_irq_startup function, which calls
`apple_gpio_gpio_direction_input` and then `apple_gpio_gpio_irq_unmask`
which sets the correct IRQ_ value.

> 
> > +static int apple_gpio_gpio_direction_output(struct gpio_chip *chip,
> > +					    unsigned int offset, int value)
> > +{
> > +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> > +
> > +	apple_gpio_set_reg(pctl, offset, REG_GPIOx_PERIPH | REG_GPIOx_DATA,
> > +			   FIELD_PREP(REG_GPIOx_MODE_MASK, REG_GPIOx_OUT) |
> > +				   (value & REG_GPIOx_DATA) |
> > +				   REG_GPIOx_CFG_DONE);
> 
> I actually wonder if we should even bother turning on the input buffer for
> output pins, given we're shadowing the value anyway. Seems unnecessary and
> might save a few nanowatts.
> 
> Also, why is this clearing the peripheral (yet direction_input isn't)?

I've removed setting the input buffer here (CFG_DONE, or INPUT_ENABLE as
it is now named in v3).

That was just an oversight, I'm clearing it in direction_input too now.

[...]

> > +static unsigned int apple_gpio_gpio_irq_startup(struct irq_data *data)
> > +{
> > +	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> > +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> > +
> > +	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP_MASK,
> > +			   FIELD_PREP(REG_GPIOx_GRP_MASK, 0));
> 
> I guess we're only using a single IRQ group right now?
Yep. The irq handler should already work with different groups. So to
support different groups we'd have to get the group number here somehow.

Thanks,
Joey
