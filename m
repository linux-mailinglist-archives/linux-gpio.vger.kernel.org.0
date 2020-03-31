Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0225519A090
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 23:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731224AbgCaVQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 17:16:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731236AbgCaVQL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 17:16:11 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1433B206DB;
        Tue, 31 Mar 2020 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585689370;
        bh=jf6zoqXWfNCOPCI+Bfu8MGbtJ3B0kxXSXQKXMuUQKKI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1MYy8H73lCY120WVEh+zL9+ak/XkWqWgR2yGBrmBrPHKN7JagqzUcvV2ykYmkhzAs
         BCWPj8OfCHW1nwkvxT3shNUHNi1SCWHqj+szbZXwjNV12R++CQnNXnK51XA4KNX4dr
         gDFIhQEztRF7LJwVAQuRn0LauQPqI7R75E2vGvp4=
Received: by mail-io1-f50.google.com with SMTP id c16so8927251iod.6;
        Tue, 31 Mar 2020 14:16:10 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3PO/QpylZZ8EJxBvZfSamk186q3WHeHW/brFbAPPAL3YVqRGg2
        Eb0vsGHEmw/VbHHcmYM1YqJhcz9VRGjCMGd/P68=
X-Google-Smtp-Source: ADFU+vuy0279ZdmmsQkWM7UtgQHdvE2o7mSVyhq21qmJU7mmw0M6FlvRofSohPicffCGA9jF0S915k7kmX9Zfg8ZH/c=
X-Received: by 2002:a02:c792:: with SMTP id n18mr17940258jao.5.1585689369479;
 Tue, 31 Mar 2020 14:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com> <1585569648-14017-2-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1585569648-14017-2-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 31 Mar 2020 14:15:57 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoJ1MiqQhoRnqEgrTP6FycVGJLSQR41FOYK85ic2cgmLA@mail.gmail.com>
Message-ID: <CAGp9LzoJ1MiqQhoRnqEgrTP6FycVGJLSQR41FOYK85ic2cgmLA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: mediatek: make MediaTek pinctrl v2 driver
 ready for buidling loadable module
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

Hi Light,
>  int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, bool pullup)
> @@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
>
>  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, bool pullup,
> @@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
>

I got build error with the patch

../drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:529:1: error:
redefinition of '__ksymtab_mtk_pinconf_bias_set_rev1'
../drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:503:1: note:
previous definition of '__ksymtab_mtk_pinconf_bias_set_rev1' was here
make[4]: *** [drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o] Error 1

>  /* Combo for the following pull register type:
>   * 1. PU + PD
> @@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
>  out:
>         return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
>
<snip>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 83bf29c..8823c0c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -10,6 +10,7 @@
>   */
>
>  #include <linux/gpio/driver.h>
> +#include <linux/module.h>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include "pinctrl-paris.h"
>
> @@ -633,6 +634,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>
>         return len;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_show_one_pin);
>
>  #define PIN_DBG_BUF_SZ 96
>  static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> @@ -1037,3 +1039,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
>         .suspend_noirq = mtk_paris_pinctrl_suspend,
>         .resume_noirq = mtk_paris_pinctrl_resume,
>  };
> +EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);

place EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe) exactly at the tail
of mtk_paris_pinctrl_probe definition.

> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
> --
> 1.8.1.1.dirty
