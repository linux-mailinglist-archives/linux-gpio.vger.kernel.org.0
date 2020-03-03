Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A01F177642
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 13:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgCCMpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 07:45:00 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34599 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbgCCMpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 07:45:00 -0500
Received: by mail-lj1-f193.google.com with SMTP id x7so3391466ljc.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=evBBjz9U85vcZNZZum1Slxsx5UFRYSR0J1vw207eOiw=;
        b=briYpDcVVWZUVDIFgqyV6cNFPFZtBrD4hN2SQA9RIULfrQoVS3OwSb4tMkXEgUhL7d
         WZGM7wJPzWcp7JQbbIbPU8yZbmk9G13QrMifNCdIPzswPWznVZFWpb6ylFPt8uV7ebQ6
         OurrOGfFkQ/cN+fJK9mbKs3RvKUsObLdFNDml1GdVyn32vTHoa4pezriZWZjzSrrj5mW
         16WL9SALUboYb8T0vtNyBIwr8UZZLZEGKsci91FKaws8uIEmO8Xoqex7H5sgEtO/GLny
         uA52xwO0zagbBnYtan6hjg/V4eR58fwgVvY8iVPbEuNIeMke/Yjek/J047DznYasiuh9
         Bhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evBBjz9U85vcZNZZum1Slxsx5UFRYSR0J1vw207eOiw=;
        b=iw8QAdwgvsYkZeeEV+T8mQ5+c/6kjDrEkuSDGkLRDKNTdidi/Jwtyl9qKxhqxN7uKL
         9Pkcq5BY1aDqsy+wbFofFyD4WLbrS+ZIrZpvNPK9uTI4T5nERUvi4VGzuBkhhxtsbpaD
         HujrH8smY/+PrO9RXYBcrZ8d2LIsFD/S5VW47om4KYLFoYey/FsW8QP7RW4pJDl8CUy7
         NqRQEymELBubc+yi5t+K3SWaZm68Wpd1Gx37bv0TPNkjQEaSzbBrDeyn2AMKDQVKjRWt
         2FQy5sATDnCZTjOzJumri1xyBsMzGmX0M4RY4vrdYHD9e7uTK7kF0X8P87BKksJ6MdD1
         vbAA==
X-Gm-Message-State: ANhLgQ1gFZaXnhMNfPNJEcqzUQP9UIBSOEYAXGm+9dYRKko9EL/WV+8g
        lirP/JcxsM9EvpEWuZFvHlTqLUn9oQo0jk3Y41ZGKA==
X-Google-Smtp-Source: ADFU+vtT0CJ25xhmeEgN1GhW/qH/dAyDjAKDZAfgH63Fo9MDo7daTii7BbgtD/P65Cr3BKtEzTxVJtL/0EYFvL+JY6o=
X-Received: by 2002:a05:651c:44b:: with SMTP id g11mr2285809ljg.168.1583239498582;
 Tue, 03 Mar 2020 04:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20200302182552.724cf197@canb.auug.org.au> <ccba6f43-a803-62e7-193f-cba0704a163a@infradead.org>
In-Reply-To: <ccba6f43-a803-62e7-193f-cba0704a163a@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Mar 2020 13:44:47 +0100
Message-ID: <CACRpkdZ3guZGLmZwtQSMT+NV=wL5dr4pdwKb7vhQ4Ut_K0dKYA@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 2 (pinctrl/sprd/pinctrl-sprd.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Baolin Wang <baolin.wang@spreadtrum.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 5:36 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/1/20 11:25 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200228:
> >
>
> on i386 or x86_64:
>
> kconfig warnings and build error:
>
> WARNING: unmet direct dependencies detected for PINCTRL_SPRD
>   Depends on [n]: PINCTRL [=y] && OF [=n] && (ARCH_SPRD || COMPILE_TEST [=y])
>   Selected by [m]:
>   - PINCTRL_SPRD_SC9860 [=m] && PINCTRL [=y]
>
> ../drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
> ../drivers/pinctrl/sprd/pinctrl-sprd.c:282:8: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
>   ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         pinconf_generic_dump_config

Should be fixed with

depends on OF=y

in drivers/pinctrl/sprd/Kconfig

Baolin are you onto it?

Yours,
Linus Walleij
