Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2B211A7E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2019 15:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfEBNsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 May 2019 09:48:52 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:65520 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726203AbfEBNsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 May 2019 09:48:52 -0400
X-UUID: de439af8b9254a9896a23ebec1854f85-20190502
X-UUID: de439af8b9254a9896a23ebec1854f85-20190502
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1561821656; Thu, 02 May 2019 21:48:22 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 May 2019 21:48:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 May 2019 21:48:08 +0800
Message-ID: <1556804888.28808.6.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-mediatek@lists.infradead.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        <linux-kernel@vger.kernel.org>, <evgreen@chromium.org>,
        <swboyd@chromium.org>, <linux-gpio@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 2 May 2019 21:48:08 +0800
In-Reply-To: <20190429032551.65975-2-drinkcat@chromium.org>
References: <20190429032551.65975-1-drinkcat@chromium.org>
         <20190429032551.65975-2-drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2019-04-29 at 11:25 +0800, Nicolas Boichat wrote:
> pinctrl variants that include pinctrl-mtk-common-v2.h (and not
> pinctrl-mtk-common.h) also need to use mtk_eint_pm_ops to setup
> wake mask properly, so copy over the pm_ops to v2.
> 
> It is not easy to merge the 2 copies (or move
> mtk_eint_suspend/resume to mtk-eint.c), as we need to
> dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
> different structure definition for v1 and v2.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> ---
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 20e1c890e73b30c..7e19b5a4748eafe 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -723,3 +723,22 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +
> +static int mtk_eint_suspend(struct device *device)
> +{
> +	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> +
> +	return mtk_eint_do_suspend(pctl->eint);
> +}
> +
> +static int mtk_eint_resume(struct device *device)
> +{
> +	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> +
> +	return mtk_eint_do_resume(pctl->eint);
> +}
> +
> +const struct dev_pm_ops mtk_eint_pm_ops = {
> +	.suspend_noirq = mtk_eint_suspend,
> +	.resume_noirq = mtk_eint_resume,
> +};

This is identical to the one in pinctrl-mtk-common.c and will have name
clash if both pinctrl-mtk-common.c and pinctrl-mtk-common-v2.c are
built.

It would be better if we try to merge both version into mtk-eint.c, this
way we could also remove some global functions.

Joe.C


