Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDFA1473A2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 23:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgAWWPZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 17:15:25 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38366 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgAWWPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 17:15:25 -0500
Received: by mail-pg1-f195.google.com with SMTP id a33so2091159pgm.5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 14:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tXBwxhPJLlGlsNaOTHSkvCkjScA/qmIHT8AzKeFydO8=;
        b=sjK3dNrIhnT59AxIccgYBllx19BQGy09eIHs6Xza5RECBLrH81Q0N6IZNxqQsOUm4e
         2CeGJhJR5oByJjb7DAdHCzom/7osgyWHaVehLZF59dO05VIChggrcIa4b7UubLHPGtm9
         /p0hwCYEeFFyi7UWUv+6ahVXnReFYX1HDhjzYmMvx+lNRdPlRhAnRsWBTaUKS+MFk8in
         Z5cK+NAmrcy4thsvsX2HYP5yYWOHV7mKgi7M4eSRABul9JHpWWJx0F7zaYaMHmNxh6hn
         YokQmcOPSvM3I9n31XimMGfbUaLXzKaQIeaMVdmTJdA6EiMkxuhgrWhJN9LQm8oV2/iP
         2tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tXBwxhPJLlGlsNaOTHSkvCkjScA/qmIHT8AzKeFydO8=;
        b=igpuBRQ+2z4X4ZOqeJaXggOJaxVaeTBIOKVISpQQGdgP4LR7tc4hn6NbdcSF15z9iP
         GwSHBtWoZb6Do9p3owrRmvhaYAyx8RvzKf+tpDC/doMHTrgM5A/vrUk6PiU8iMvEHoJM
         W8cm7a67UhIHCat6HrZ3u0rnbmp4UphogGruwknfYiISbGpSjtzX6K3KNu+8Xm5sbjuF
         Pu4kIPzIjVd+z5vVfAIIWiqRUPCT/5TIeuAurKlMTrOt3FK03+SHaOL6egHeeIM2zeEQ
         mFTBvt9HVte8Ih7yCKnwtr5QT7vv/OnBqloGzMYRCh6++BvkYncyP6pL0kAS7tkCOw3W
         ckHw==
X-Gm-Message-State: APjAAAWWSzWnFC8wER5cGgRTdo0zhafmAXhC9ijO3482RKuBV3zZNwWA
        0P5Y8IGrQa7eywgV506b/vaxEkSLmSqBf3SrbA6dCg==
X-Google-Smtp-Source: APXvYqziuRWMnPljfz/bZp0L+T5uoyDPGMPlFhp5B6LWngEd1YcbHv5Z4Ye1FJte7JIRLPmklQwFeQrvOC+e+F9qqQM=
X-Received: by 2002:a63:597:: with SMTP id 145mr550696pgf.384.1579817724899;
 Thu, 23 Jan 2020 14:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-2-brendanhiggins@google.com> <CACRpkdaTJej2zFX0y7mAYymBdGNvHpp3VyU0kOd=ScA_gMAf-A@mail.gmail.com>
In-Reply-To: <CACRpkdaTJej2zFX0y7mAYymBdGNvHpp3VyU0kOd=ScA_gMAf-A@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 23 Jan 2020 14:15:13 -0800
Message-ID: <CAFd5g44herz1-S-48NB=oKuTFhotHNodi7=S0Z-ffkPcqq08vQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] pinctrl: equilibrium: add unspecified HAS_IOMEM dependency
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Gow <davidgow@google.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for not getting to this before I went on vacation.

On Mon, Dec 16, 2019 at 2:39 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Dec 11, 2019 at 8:28 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
>
> > Currently CONFIG_PINCTRL_EQUILIBRIUM=y implicitly depends on
> > CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> > the following build error:
> >
> > ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `eqbr_pinctrl_probe':
> > drivers/pinctrl/pinctrl-equilibrium.c:908: undefined reference to `devm_platform_ioremap_resource'
> > ld: drivers/pinctrl/pinctrl-equilibrium.c:223: undefined reference to `devm_ioremap_resource'
> >
> > Fix the build error by adding the CONFIG_HAS_IOMEM=y dependency.
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Patch applied but I augmented it with the recently added
> OF dependency so it now says:
> depends on OF && HAS_IOMEM

Probably too late now to be helpful, but I can confirm that OF does
NOT depend on HAS_IOMEM, so this patch was still needed.

Thanks regardless!
