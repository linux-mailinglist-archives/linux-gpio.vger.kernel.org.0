Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA2DAC0A70
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 19:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfI0Ret (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 13:34:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfI0Ret (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Sep 2019 13:34:49 -0400
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B20A207FF;
        Fri, 27 Sep 2019 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569605687;
        bh=Fyim3eB2P/MKtc8ARJ6pexOsPtvD1yzbgXxlqGHh3Pw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=obEffdz8yTexCS+3w6Tbu5vFb9ftCXuoB/1H1PuFptHK43k0FHyMunlg4gU3+Qw3e
         RJzU/YZ8cd8SbaeXMYVK6drAbU06VDVc83DvVQD0avDW3KGaLmmLmQP2KuVvH+/zJD
         Erk3RxgVTLQWA4WvbjxjyBm7uZOPrVXKBLcE7p4E=
Received: by mail-wm1-f53.google.com with SMTP id 3so6413571wmi.3;
        Fri, 27 Sep 2019 10:34:47 -0700 (PDT)
X-Gm-Message-State: APjAAAU1GpuX8yYMyKw0LTY7waf7To/VqD3Iurts9KPfqLKQ6xLfPUut
        f4bsANe/9LvdV2EJ/3j5GZVkonflllL15e0CeMM=
X-Google-Smtp-Source: APXvYqyr0Zs3NsHunvF0XaGy83lzuLz1ULO5iRaT/jCHEbEYSkm+ZeaTN0t+d5feoWVL1bm6ic5JNk8tdKGsKab44gw=
X-Received: by 2002:a7b:cb8b:: with SMTP id m11mr8312308wmi.145.1569605685825;
 Fri, 27 Sep 2019 10:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com> <1569560532-1886-2-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1569560532-1886-2-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Fri, 27 Sep 2019 10:34:34 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoMcqD4bo9Brg9=DTeSNP0dJfDtRGadGWGxsX-vHSezQw@mail.gmail.com>
Message-ID: <CAGp9LzoMcqD4bo9Brg9=DTeSNP0dJfDtRGadGWGxsX-vHSezQw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] pinctrl: mediatek: Supporting driving setting
 without mapping current to register value
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Sep 26, 2019 at 10:02 PM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> Mediatek's smarphone project actual usage does need to know current value

MediaTek

> (in mA) in procedure of finding the best driving setting.
> The steps in the procedure is like as follow:
>
> 1. set driving setting field in setting register as 0, measure waveform,
>    perform test, and etc.
> 2. set driving setting field in setting register as 1, measure waveform,
>    perform test, and etc.
> ...
> n. set driving setting field in setting register as n-1, measure
>    waveform, perform test, and etc.
> Check the results of steps 1~n and adopt the setting that get best result.
>
> This procedure does need to know the mapping between current to register
> value.

you seem to use a hardware raw value instead of a human-readable value
to adjust driving current, right?

> Therefore, setting driving without mapping current is more pratical for

s/pratical/practical/

> Mediatek's smartphone usage.
>

MediaTek

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 21 +++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         |  1 +
>  4 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 32451e8..e024ebc 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1077,8 +1077,8 @@
>         .bias_disable_get = mtk_pinconf_bias_disable_get,
>         .bias_set = mtk_pinconf_bias_set,
>         .bias_get = mtk_pinconf_bias_get,
> -       .drive_set = mtk_pinconf_drive_set_rev1,
> -       .drive_get = mtk_pinconf_drive_get_rev1,
> +       .drive_set = mtk_pinconf_drive_set_direct_val,
> +       .drive_get = mtk_pinconf_drive_get_direct_val,

I'm preferred to name it to mtk_pinconf_drive_[get,set]_raw.

>         .adv_pull_get = mtk_pinconf_adv_pull_get,
>         .adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 8077855..acfddf9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -608,6 +608,27 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>         return 0;
>  }
>
> +/* Revision direct value */

Remove the comment since that is straightforward.

> +int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       int err;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);

We can dot it simply by "return mtk_hw_set_value(hw, desc,
PINCTRL_PIN_REG_DRV, arg);".

> +
> +       return err;
> +}
> +
> +int mtk_pinconf_drive_get_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val)
> +{
> +       int err;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> +

Ditto as the above.

> +       return err;
> +}
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..b3bada0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>                                const struct mtk_pin_desc *desc, int *val);
>
> +int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_drive_get_direct_val(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val);
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 3e13ae7..5217f76 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -970,3 +970,4 @@ static int mtk_paris_pinctrl_resume(struct device *device)
>         .suspend_noirq = mtk_paris_pinctrl_suspend,
>         .resume_noirq = mtk_paris_pinctrl_resume,
>  };
> +

Remove the unnecessary the change

> --
> 1.8.1.1.dirty
>
