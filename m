Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE573301F65
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 23:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbhAXWrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jan 2021 17:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbhAXWrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jan 2021 17:47:42 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847B5C061574
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 14:47:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m22so15102614lfg.5
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y/Ur1icl1bDhiJCpdkX42xbQJISQc10E4JkJfciYOIg=;
        b=Fia13/11rrtVr3VD7jIbc1K2BXfyYbZKOQTkLB5fAphprZoIvpPCfPD9iEjTxrgu6L
         4FV34p6SGvJ+iLunKep0oqWeCiFrP/WtmaaTq9zJLy6Xhh/TgI0S7C/Xo/Idfmv+cAgA
         +0Ucp8n8H19ggvIdUc0BtrkWn7+4itcS3JLyj81g0jXRaJV0I5VOgSI0wfxhbpVGHjEZ
         xuNH/O9sJgiIDcV/+B7ykpvJgvaltM55BcY+DSRsFA/WMFhp0GcU1q3g/NHexoA898y8
         r2XAq8Yo7i46ovoLHCweo+CMO6+tE7lVpj/hiFnpL6l5HGhrhjGbFgoSqwcgGI817arb
         ofCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y/Ur1icl1bDhiJCpdkX42xbQJISQc10E4JkJfciYOIg=;
        b=tsz9sJRtRP3AwUrWOgQaF4eTKVt11Hmw5FHx5dXiFJDvKB0EtXX8AjEu9CM5GGw3oI
         EgibUI4z6z0xJloWwmGyoWE/Psv/Izzp+3DmIpo7ckTq0dj8huyKFQ/pMhsv06bLKwLJ
         VTsYH8dZcP7pZkhW5D3utigDi6tjHPnuQIEmqCReprjeMccsfIMdgHqJWap+r05l5LPf
         le4pm3OBOJyUJFFhcM0xu6ar2T2rEWM85fN5hi4aMQPHGTl7XxH2slyFzXTCu67yy3nC
         clPa8Wxi0Tt5A4DqfhShPqSTK2aGqpBWDES6lzQcUIXTlynZwCVAGYWxE92M67VZI2w3
         gSoQ==
X-Gm-Message-State: AOAM5303rr7yh4F6WYnW+CI+Wf1gICDG5MmIm1A7p6VR4kb2o+GcGAaS
        eXxBdBTDD07zlNGrNSXxisl1xm5TNhXh1/Nq8REMYQ==
X-Google-Smtp-Source: ABdhPJxRmV/i00A0XXkkWgplWNjeR+UwYPMT/qKg224LqsPZ4Tm9OrCC49nvwsY/P09TlEZqpiPKi95861RYTNut0G8=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr278583lfp.586.1611528420080;
 Sun, 24 Jan 2021 14:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20210122185543.16554-1-digetx@gmail.com> <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
 <24d46928-8c57-acba-f9cf-49afbe4c983c@gmail.com>
In-Reply-To: <24d46928-8c57-acba-f9cf-49afbe4c983c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Jan 2021 23:46:49 +0100
Message-ID: <CACRpkdaR9+mxXXjRADG4+qaGiqgwVRPcCAo-5nZwXXASYfs9+g@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 24, 2021 at 12:56 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 24.01.2021 01:50, Linus Walleij =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >
> >> This small series adds modularization support to the gpio-tegra driver=
,
> >> i.e. driver now could be built as a loadable kernel module.
> >>
> >> Dmitry Osipenko (3):
> >>   gpio: tegra: Use debugfs_create_devm_seqfile()
> >>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
> >>   gpio: tegra: Support building driver as a loadable module
> >
> > As these three patches clearly make the kernel look better after
> > than before:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > However when we are doing this I would strongly encourage you
> > to also make a patch implementing remove() so you can insmod
> > rmmod the module at runtime.
>
> The remove() is optional for drivers, it doesn't prevent the rmmod.

Aha you mean all resources are managed (devm_*) so that
rmmod/insmod works fine with this driver?

OK then! :) the work is finished.

Yours,
Linus Walleij
