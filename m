Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C215656D775
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 10:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiGKIMt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 04:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiGKIMs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 04:12:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29E81D0F9
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:12:47 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id mf4so6334019ejc.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j85hrHeB5Vos75Rgf2s3LYppHM5MAeZjU5ic/1K/dmo=;
        b=OWaz1o2rpPP9G062eWfCrjB5ZpsE/dDNDyrooDw4W5uQRY97IeDfpVJW3FtNfjA7Lm
         fVQFcmh3RxXdByfohI/jb1/JmwTVZ7wnNBuBCxIbrj51TuPmYtB97kzdTTUzBhQBnk2f
         /iEqo3jX27n1dlaIsjwSVOhztq98ff0RhsHooguE8qKWGL2bZQFL09ufBB9E5CS2NxJA
         UIkUDPRIeHo9RH7N9BTIrU/x0y9wEbYBq688mFiJwR2i6Ax4m3AGMKJTCevuzJCUwRQX
         HtAliOQ9H7RejnOwhb5K74Q+tJZXLUVRbobRJpldbC4kNNsjfjnA+u+wE8FhhzJwPlg0
         R+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j85hrHeB5Vos75Rgf2s3LYppHM5MAeZjU5ic/1K/dmo=;
        b=Nb/gEe3ZKRyiqiyl0NyppAcW1O8s1viWUi0sRuWwSji4wIEdgmAPvRCLufJNT6+VYc
         pc3KlyE5vkSkYODFSAP9VFmG7Yrm3u9JA8TkUm+UjURP4xHTQza4ize3L01mY8NzDjQD
         Vgk3+pMqD2Lqj1GK5ko3GEapBrpv+D9ZrGptxql4FwPrUmTf6MBFB1ta+RFRmtV02fb/
         zsNcWNVLSU/Sg+OkN442ovIRhTqKq/L7PQ+WbGaOx9KhIvRungYFIz3TVSCYEhh7OJup
         VOFQ+YST6xWEk0bHIBG/JCP7eV/tEtFljIfVZ8fRSd9QDdGiCljhDHglFcbJJo0u52Sb
         H2PQ==
X-Gm-Message-State: AJIora+YCBNuVWr2EnPwTvql+kOGnElUe5yi3DqHfzb6kl5ZO14Wg20O
        sZanIyuP8sKcwFBsrHcj88RkVA4cTHmanz5k/Vc9Xw==
X-Google-Smtp-Source: AGRyM1vDznTzdH95s55stLdD1+H+5tdXCupMAT0zsaUrDrUosTp5GIlfmAe7FbWhpWR+qyssWCg/oyy2PwokVHZgC6A=
X-Received: by 2002:a17:907:8a25:b0:726:c9f2:2f5e with SMTP id
 sc37-20020a1709078a2500b00726c9f22f5emr17213507ejc.286.1657527166407; Mon, 11
 Jul 2022 01:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <YsiZ8XJAo3UYwtyl@smile.fi.intel.com>
In-Reply-To: <YsiZ8XJAo3UYwtyl@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Jul 2022 10:12:35 +0200
Message-ID: <CAMRc=MciJrs3Z-ukPKmbf4AT+TMAEc1rhgmgdbjJsXJ=W6g2Lg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.20-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 10:56 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> For next cycle just a couple of cleanups for gpio-pch, were sitting in Linux
> Next for weeks. Please pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit b93a8b2c5161696e732185311d309e0aaf0575be:
>
>   gpio: dln2: make irq_chip immutable (2022-06-06 14:09:16 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.20-1
>
> for you to fetch changes up to b65bb2c148913c4020d06c9798e5e1bc18105f4f:
>
>   gpio: pch: Change PCI device macros (2022-06-21 18:01:11 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v5.20-1
>
> * Clean up the GPIO driver of Intel EG20 PCH
>
> The following is an automated git shortlog grouped by driver:
>
> pch:
>  -  Change PCI device macros
>  -  Use dev_err_probe()
>
> ----------------------------------------------------------------
> Andy Shevchenko (2):
>       gpio: pch: Use dev_err_probe()
>       gpio: pch: Change PCI device macros
>
>  drivers/gpio/gpio-pch.c | 43 ++++++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>

Pulled, thanks!

Bart
