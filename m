Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091BF1776F3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 14:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgCCN2P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 08:28:15 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46768 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgCCN2P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 08:28:15 -0500
Received: by mail-qk1-f196.google.com with SMTP id u124so3269286qkh.13;
        Tue, 03 Mar 2020 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+RjkZNVBTQF8AzTpSWG5LJtd246vYUWKTAxkIql6+A=;
        b=ubjlZr8/2D8teU3kDdJ1ja7NFLKRlRFYQh2yQl8Hf+UWLS0oYFNiSPRq+w8OH82yza
         /ZHs6DMPovozJLnZuwLfhcOnO2NM1W6R6fHKOnNASOVMAToExkyYm2nd14sdxyNDDZz7
         7D4Dp5HHVf8jD1ODqLYJaVACJmQ1wPc7Imr5Mbb1zSkJkoBhO8DdOyRdItV8sKizqZ+C
         0q/j42mk3+AwbiepGWVxBb5wC5CSx9AQq46ZTXBOlUci8fT5mfyG6gd/UcSPnIGnMb5D
         9hksY2ZysGt+cuG0SFidqvROLBGIjZAUe0UgLRpFpFoO27Z5K3g6UPBOOJnGC1ZqMEnB
         RLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+RjkZNVBTQF8AzTpSWG5LJtd246vYUWKTAxkIql6+A=;
        b=jloYufHAsnas85oQ5ciMsyPEH/CSR90CMLP1luMyZnJuZ+kMw97VaCYuOYlXQt0gYI
         7fOpnnZiw2wwMpI4D7hQ7j0Q/I9BcXAD/jvp3wqhQ2LrIaQsAXwYV0/VJggO2Vmf8sJx
         0CfxPf6FBDJ/nqYccq//2yM3uMJuxVa+Zh0XRMxyATUH8lRpUlAht1I1whr9MgrPEAYz
         1kal8z1TJqHW8YgkXVJ8cmHV8Xzk7YHvBvs+iq9cKMBOoJcUbnwicBO+V7pKNlKKu4yg
         fzsayCcvZSnex/cQ7MuUvNc/mpdroB2bK4Nd/29I1P+LaxcShmbU/6QiHPEHjUG+nlwC
         Aeuw==
X-Gm-Message-State: ANhLgQ1QWBwf8Oq6PnE7wHw1npb5iivUKpcXWoM8WoQOrSjt5PopeD4e
        Z6Zmd3hkje0DJuYjAbbFw2fvyUJ3fc8CtiUfJOI=
X-Google-Smtp-Source: ADFU+vu04x+YnOzO9JpwN7FD1ENNIDZ5TTmQijEEFjWkxq672wtKoTEdKtSNfTli5L1H3kjL7ZhIlHNPAR1qn952Wzg=
X-Received: by 2002:a05:620a:806:: with SMTP id s6mr4228410qks.235.1583242094163;
 Tue, 03 Mar 2020 05:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20200302182552.724cf197@canb.auug.org.au> <ccba6f43-a803-62e7-193f-cba0704a163a@infradead.org>
 <CACRpkdZ3guZGLmZwtQSMT+NV=wL5dr4pdwKb7vhQ4Ut_K0dKYA@mail.gmail.com>
In-Reply-To: <CACRpkdZ3guZGLmZwtQSMT+NV=wL5dr4pdwKb7vhQ4Ut_K0dKYA@mail.gmail.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Tue, 3 Mar 2020 21:28:02 +0800
Message-ID: <CADBw62o-nvBu4QLD4f10sFCd4E+C68ghUwaUPfL-LeD5Ctrpog@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 2 (pinctrl/sprd/pinctrl-sprd.c)
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Baolin Wang <baolin.wang@spreadtrum.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Mar 3, 2020 at 8:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Mar 2, 2020 at 5:36 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 3/1/20 11:25 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20200228:
> > >
> >
> > on i386 or x86_64:
> >
> > kconfig warnings and build error:
> >
> > WARNING: unmet direct dependencies detected for PINCTRL_SPRD
> >   Depends on [n]: PINCTRL [=y] && OF [=n] && (ARCH_SPRD || COMPILE_TEST [=y])
> >   Selected by [m]:
> >   - PINCTRL_SPRD_SC9860 [=m] && PINCTRL [=y]
> >
> > ../drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
> > ../drivers/pinctrl/sprd/pinctrl-sprd.c:282:8: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
> >   ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
> >         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >         pinconf_generic_dump_config
>
> Should be fixed with
>
> depends on OF=y
>
> in drivers/pinctrl/sprd/Kconfig
>
> Baolin are you onto it?

Yes, I've sent out a patch to fix this issue, and I saw you've applied it.
Sorry, I forgot replying in this thread.

-- 
Baolin Wang
