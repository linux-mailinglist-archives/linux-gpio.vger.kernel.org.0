Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF043F272F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 09:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238523AbhHTHB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 03:01:57 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:37072 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235172AbhHTHB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 03:01:57 -0400
X-UUID: acfcbdcf3e5b4a30a64e3878c740b93e-20210820
X-UUID: acfcbdcf3e5b4a30a64e3878c740b93e-20210820
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 557516772; Fri, 20 Aug 2021 15:01:17 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 15:01:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 15:01:16 +0800
From:   <sean.wang@mediatek.com>
To:     <sam.shih@mediatek.com>
CC:     <robh+dt@kernel.org>, <sean.wang@kernel.org>,
        <linus.walleij@linaro.org>, <matthias.bgg@gmail.com>,
        <mpm@selenic.com>, <herbert@gondor.apana.org.au>,
        <gregkh@linuxfoundation.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <hsinyi@chromium.org>,
        <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
        <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <john@phrozen.org>, <Ryder.Lee@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: Re: [v2, 04/12] pinctrl: mediatek: moore: check if pin_desc is valid before use
Date:   Fri, 20 Aug 2021 15:01:13 +0800
Message-ID: <1629442873-24655-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20210817074557.30953-5-sam.shih@mediatek.com--annotate>
References: <20210817074557.30953-5-sam.shih@mediatek.com--annotate>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

>Certain SoC are missing the middle part gpios in consecutive pins, it's better to check if mtk_pin_desc is a valid pin for the extensibility
>
>Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>


>---
>v2: applied the comment suggested by reviewers:
>    - for the pins not ballout, we can fill .name in struct mtk_pin_desc
>      as NULL and return -ENOTSUPP in gpio/pinconf ops.

Thanks for take the suggestion and the improvement.
Acked-by: Sean Wang <sean.wang@mediatek.com>

>
>---
> drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>
>diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
>index 3a4a23c40a71..ad3b67163973 100644
>--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
>+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
>@@ -60,6 +60,8 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
>		int pin = grp->pins[i];
>
>		desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>+		if (!desc->name)
>+			return -ENOTSUPP;
>
>		mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
>				 pin_modes[i]);
>@@ -76,6 +78,8 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>	const struct mtk_pin_desc *desc;
>
>	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>+	if (!desc->name)
>+		return -ENOTSUPP;

<snip>
