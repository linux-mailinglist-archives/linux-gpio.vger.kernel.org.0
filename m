Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33DE441D42
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 16:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbhKAPV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 11:21:26 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:31517
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhKAPVZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Nov 2021 11:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obJCmiQft1w215b2Y5kDwIrS0nd8KX1WlxInqXzP5Y0=;
 b=md+MuOesi/E2npky516cnLnd8bapLKSnkfyGRG4SsxNA/L7ku7BlNqwSmxTxxnT0YlUPfYkoz5gYBdsAB21en5PZag6SDjvpk0a5nbJYn6UgQgb3B5J5RQzIbkDm4GvyoY6HjQAaJAFR+ztj37r7vYHjxVJfS5wOn14P5BdqoSY=
Received: from DB9PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:10:1d9::15)
 by VI1PR08MB3870.eurprd08.prod.outlook.com (2603:10a6:803:c2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 15:18:48 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::ff) by DB9PR02CA0010.outlook.office365.com
 (2603:10a6:10:1d9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Mon, 1 Nov 2021 15:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 15:18:48 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108"); Mon, 01 Nov 2021 15:18:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8388868955e38b86
X-CR-MTA-TID: 64aa7808
Received: from 8998d863ac21.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4AAB11A0-CD25-45C2-84CA-EFCAC119F69D.1;
        Mon, 01 Nov 2021 15:18:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8998d863ac21.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 01 Nov 2021 15:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahPKpWF2lXi1NzMnOFoLP44ViQyPfwF5gpyofLwhinI/oNJ/4p4/mw0StSM2vxo1jKbWKee/vcM1YIkc6qZX/wl/iQuJBI5fWnA6QF1KF/c2OHudYzkK1c6wsSU7bFqnULiHALyz21Os+M3/P6sWwNU0CcI3hJsqokIHNik9ToAdYOxYKOSRiGbvXket3ZP/bfxZSo/MKxKzvejbtuzcJni/R7/eKHUMXFlNa8Xo3iMVsUCuSK6VYln3fQgCRYTj8WEKSt33Je3zY7HXXGYnbQFpHF3dLTZqLAYVRaU3hPA65vARqOkOiewzi4qZqcFTAVF4BSl3kJ9VCQo2gl2mqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obJCmiQft1w215b2Y5kDwIrS0nd8KX1WlxInqXzP5Y0=;
 b=TE29VaxI3esAQHoK/VBmRJk5GhrJp6KNGVWDDZZoyPf3SGJbCi9bF8mELOBtBoUCtBhEUBnroJuUlOiSxtSlSCYZnOkIOHThgC1bxdPemTVFM5CZdk7LMxz7pCVbnR7yf8iW/FY4MCaoVZEy3UhvhWI1wuJN9PneLvQ1zRRmLrGhQOfdHby03xP87l1xiJrTlovKG/41pFqG7SN0fU+65Mmt18MDB3jvPapq2JC+vrm9LbXL19zajke+qsm7n7INdcaqtL+f+6lOygavg9euq25Zk15RTTKVeZZEvTtRnO4fSXYMnCAFBTixtwYMiLP4dVpjt9a6fL1lY/nhOuXXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obJCmiQft1w215b2Y5kDwIrS0nd8KX1WlxInqXzP5Y0=;
 b=md+MuOesi/E2npky516cnLnd8bapLKSnkfyGRG4SsxNA/L7ku7BlNqwSmxTxxnT0YlUPfYkoz5gYBdsAB21en5PZag6SDjvpk0a5nbJYn6UgQgb3B5J5RQzIbkDm4GvyoY6HjQAaJAFR+ztj37r7vYHjxVJfS5wOn14P5BdqoSY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 by DB8PR08MB5353.eurprd08.prod.outlook.com (2603:10a6:10:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 15:18:40 +0000
Received: from DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::f169:9645:e7f:7dec]) by DB8PR08MB5433.eurprd08.prod.outlook.com
 ([fe80::f169:9645:e7f:7dec%7]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 15:18:39 +0000
Date:   Mon, 1 Nov 2021 15:18:36 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH] pinctrl: apple: Always return valid type in
 apple_gpio_irq_type
Message-ID: <20211101151836.GA6547@e124191.cambridge.arm.com>
References: <20211101150640.46553-1-sven@svenpeter.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101150640.46553-1-sven@svenpeter.dev>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To DB8PR08MB5433.eurprd08.prod.outlook.com
 (2603:10a6:10:118::13)
MIME-Version: 1.0
Received: from e124191.cambridge.arm.com (217.140.106.52) by LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Mon, 1 Nov 2021 15:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e377dd-320d-4e43-2934-08d99d4ae792
X-MS-TrafficTypeDiagnostic: DB8PR08MB5353:|VI1PR08MB3870:
X-Microsoft-Antispam-PRVS: <VI1PR08MB387053C8BCC98E122D9A1E9B948A9@VI1PR08MB3870.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LZrL/knbXT2WZ+yE81RfvzMJgF69HYbca8219pXw96vVXuDaqw3FTOQi0XiX0XiBKeQQmjoexux2bbNskiRYTwFki3yeNhJ0CCwtgWJN7kF5pCZw9p0VCx1oiLAxUucALFivQRS1bt4IG5d8XHp7qqMfxBvEcQfxZgRRuwuSO4Q1WcwdbjkFsaN0Corr5BoJsU3265gfe2QdGXLAFjh54DFRn7Lgw1R9WLkT2q4E9u9AlkU7TiH3Y/m0PiHjOu6e1qOPOKoBFccqeZv9x1R2V3cZFknPcRqwP+IVA+/DbwEoOZlm75lrjEhpPKV6Cx0VV48yFIyMkl5uLOtQKTKOCgkIq2opzzMzTYCn54DvfDN+nSFrwBHQXcGnpDOvyaN4QTHGMaMd/I4h9CsjHt0UkezVZu/VnVTn1YutAfaVssATRRNvS8c/vF73RjPIxAuxHgFuUP10E/N/f0NzTJL5l3QxvxGftICd97mWhI+zKnl8+RbTMxGCYSwjhClE83H162huKgMb4Xqz8x/7cXzvwcRv7XaoklF/KK6IxwXi0f0rWnaiNB9FNUMXbaTwLVkGb3ELFUx+8KNXx4LJ7sODsDJEfLU0DFUWSaZzATyyBzM2LmuY5cqJ3wrLpVJoX/UMrUPPJL+Rwi/145gXgju7FmVVpfMmo18xUtkz4kbmWzNkvMUlhdi/FEKNGjdArNIIrYgJDdMFNH4zJybM4QZ4+GIKCV9vXJZXh71TeaUjzOg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5433.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(47660400002)(66556008)(52116002)(316002)(33656002)(66946007)(86362001)(5660300002)(7696005)(55016002)(66476007)(1076003)(4326008)(54906003)(38350700002)(38100700002)(2906002)(26005)(8936002)(6916009)(8676002)(956004)(44832011)(83380400001)(186003)(508600001)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5353
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd6318ff-b3f7-4e53-0124-08d99d4ae1bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XojdFJrgPXQBLRpbYoCrHcbKrtwUbOxHu1cb/usHQNXdc8ioUVjpBlVfBYGPoo2EHPkbI2t99vxqeouEVxRBkDhPkuKMIEThCUVbhlJbdHKr2cj06U7iMrxYi1lFbunH75zBIpoc1XSjvLHMZKmpKvOWVB7MWkpkd/o9fKwUY7a6RkisDyYhMRIKvkylwuTd21uC6AB2GSnzCN+d6N2w0iVaMDCiHNPEM/Vi68dNnESUnW/7w3kmnCZfZUYZOtrOU/P/blBzxHA8i0ATMQLxAErAzxhAMcHXYx1C9Lq9WcjZWXaxNDxPG1xc/ppG1LUBCvWxJjVx0dSP1H4icvnyUWpq9m70Xppnrno4tgn5sxr1BRDG1TBB01qMshYtHccF6/8k98TouIpKSApQ6j044M/hs99b9dovqqBRDb5ZKAi/iADLR3HByvPpQkJO2iBg8i9fzmgyjgKJGIJm3bXT4U/Bf3lf+Zb4vYiH4XHx+ZksOaLIG5e9H1JBfKkrLcYm861lehzZIR5RD2VXP2u0qZnzZjE82b3c5FHdKEGu6rSBdMzZKfbmyMIsFdOPuhRL/OVm33PximgI1Cx1WKPn39BR1GN1KQFK/EzO0+hqlio6fc8qwGjDDG/ESrkUmvkPiS+iCQjscZyhLuBMY4OqBA0F2ejqQDaygiS8ErsUJ/wGGjHQ5bvQZ5XRBgcYV482VCTZCC/WeYQLay9xY9sLBOFbFMvH5+Tq9raCAjXJEXM=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(54906003)(316002)(4326008)(450100002)(6862004)(508600001)(356005)(1076003)(5660300002)(2906002)(336012)(956004)(8676002)(8936002)(83380400001)(55016002)(186003)(81166007)(33656002)(7696005)(82310400003)(36860700001)(47076005)(44832011)(26005)(70586007)(70206006)(86362001)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 15:18:48.7732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e377dd-320d-4e43-2934-08d99d4ae792
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3870
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sven,

On Mon, Nov 01, 2021 at 04:06:40PM +0100, Sven Peter wrote:
> apple_gpio_irq_type can possibly return -EINVAL which triggers the
> following compile error with gcc 9 because the type no longer fits
> into the mask.
> 
>   drivers/pinctrl/pinctrl-apple-gpio.c: In function 'apple_gpio_irq_set_type':
>   ././include/linux/compiler_types.h:335:38: error: call to '__compiletime_assert_289' declared with attribute error: FIELD_PREP: value too large for the field
>     335 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |                                      ^
>   [...]
>   drivers/pinctrl/pinctrl-apple-gpio.c:294:7: note: in expansion of macro 'FIELD_PREP'
>     294 |       FIELD_PREP(REG_GPIOx_MODE, irqtype));
>         |       ^~~~~~~~~~
> 
> Fix this by making the return value always valid and instead checking
> for REG_GPIOx_IN_IRQ_OFF in apple_gpio_irq_set_type and return -EINVAL
> from there.
> 
> Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/pinctrl/pinctrl-apple-gpio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
> index 0cc346bfc4c3..a7861079a650 100644
> --- a/drivers/pinctrl/pinctrl-apple-gpio.c
> +++ b/drivers/pinctrl/pinctrl-apple-gpio.c
> @@ -258,7 +258,7 @@ static void apple_gpio_irq_ack(struct irq_data *data)
>  	       pctl->base + REG_IRQ(irqgrp, data->hwirq));
>  }
>  
> -static int apple_gpio_irq_type(unsigned int type)
> +static unsigned int apple_gpio_irq_type(unsigned int type)
>  {
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_RISING:
> @@ -272,7 +272,7 @@ static int apple_gpio_irq_type(unsigned int type)
>  	case IRQ_TYPE_LEVEL_LOW:
>  		return REG_GPIOx_IN_IRQ_LO;
>  	default:
> -		return -EINVAL;
> +		return REG_GPIOx_IN_IRQ_OFF;
>  	}
>  }
>  
> @@ -288,7 +288,7 @@ static void apple_gpio_irq_unmask(struct irq_data *data)
>  {
>  	struct apple_gpio_pinctrl *pctl =
>  		gpiochip_get_data(irq_data_get_irq_chip_data(data));
> -	int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
> +	unsigned int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
>  
>  	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
>  			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
> @@ -313,10 +313,10 @@ static int apple_gpio_irq_set_type(struct irq_data *data,
>  {
>  	struct apple_gpio_pinctrl *pctl =
>  		gpiochip_get_data(irq_data_get_irq_chip_data(data));
> -	int irqtype = apple_gpio_irq_type(type);
> +	unsigned int irqtype = apple_gpio_irq_type(type);
>  
> -	if (irqtype < 0)
> -		return irqtype;
> +	if (irqtype == REG_GPIOx_IN_IRQ_OFF)
> +		return -EINVAL;
>  
>  	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
>  			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
> -- 
> 2.25.1
> 

This was previously reported, but was miscategorised it as a compiler bug, so thanks for fixing this!

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey
