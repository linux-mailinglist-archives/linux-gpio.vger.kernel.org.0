Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389EE2293FB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731036AbgGVIvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgGVIvF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:51:05 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECC1C0619DC;
        Wed, 22 Jul 2020 01:51:05 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z3so812407pfn.12;
        Wed, 22 Jul 2020 01:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e3OT5w6u3rxG/3iZ+MykAHqpmEMoLtEmtYfcFs2OdbA=;
        b=lcLf9txTrjt7hKVxP5gHCuyjkEz9RmBIC+LvPgKzvRZtnViz4NLCU3lgBmESF6zSjc
         twIU4avgtOsb4uzfw/cV1b45Ua8JmLeshTj82RnoEUUjxtLgNRG6aMLi3AAfOwptrda4
         G9mAphyqrGUDorRoYnQYEsm3QHhGkO3u1bnmADdhMeik3sp4FMM5jzojAEjucUmeErg/
         euMtXXkvYwV7auGAhJ9WPNDR0Wzcv/XFJ+tPA5rXnKgiyd8iv9wR157pAL+f/s7g5u2A
         p1E+0QX5TAM7MeInLS5d0nuLTtJkOgAyg/jds9ZS/+P6aTfL33oMH6DMytNz6FztY0/2
         AizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e3OT5w6u3rxG/3iZ+MykAHqpmEMoLtEmtYfcFs2OdbA=;
        b=cb5fZJEwW9fnvcPWrn8hHfxwG+MicK1m8zdj225DIvDQKh6r8kNb+ptEgKS6LZnAks
         GU66ydJAhk+FsnDAsH/eT5aiGg1I/Z+x+dsy86PMHoPj9Uj0V+BvVsWy8doDicWG2YSF
         cIQxcXNCDKNakd2Eso9YcFDsfEAjh7ay1q5eQNXohVLEfmWh94asHJS2Wd+6jvycqXrR
         JGrptZE1ee9WX3CTXcv7auqOh/xIYtk91K7+1o9Rz84z+FLWzNJXWCyEVwCdgCjagaOP
         1ZpbcEm9rHV/1CHN4G/Hvx1QbqDUw0hErCoUUppzYy6ZD/foz+MN8Shr33XBVC/p8QSh
         vg/w==
X-Gm-Message-State: AOAM5310DpcC5rThI4W4LDhMw2hRKmBidf6AV8KbUHfZWweuGp6t4zVy
        Vp9Z61Di6u1edf2437r8u4w6N1fAcc50g7sBGag=
X-Google-Smtp-Source: ABdhPJwk8TMBoOfP/mmDUdNAvHRR4uQdqWvutrkzEuwfNgqWTzOS/6FZqp9RGt9Ld4mrxIwr7V5Ox0PodZaH1uJk7tI=
X-Received: by 2002:a62:7657:: with SMTP id r84mr26903497pfc.130.1595407864704;
 Wed, 22 Jul 2020 01:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200721222851.2075891-1-drew@beagleboard.org> <CAHp75Vd35n0=hB-K3WjUXD3HPNt6F=MHNafNY55NGfb5ahvLSA@mail.gmail.com>
In-Reply-To: <CAHp75Vd35n0=hB-K3WjUXD3HPNt6F=MHNafNY55NGfb5ahvLSA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jul 2020 11:50:50 +0300
Message-ID: <CAHp75VeXiir4BYFTd3YrseExnLPg4MfD69koTkqf4_TKp7dsBQ@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: core: print gpio in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 11:48 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 22, 2020 at 1:29 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > If there is a gpio range mapping for the pin, then print out the gpio
> > chip and line index for the pin in the debugfs 'pins' file with the
> > format: "[line-index]:[gpio-label]"
> >
> > Here is an example output on the BeagleBoard.org PocketBeagle (AM3358):
> > /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
> >
> > pin 25 (PIN25) 25:gpio-32-63 44e10864 00000037 pinctrl-single
> > pin 26 (PIN26) 26:gpio-32-63 44e10868 00000037 pinctrl-single
> > pin 27 (PIN27) 27:gpio-32-63 44e1086c 00000037 pinctrl-single
> > pin 28 (PIN28) 0:N/A 44e10870 00000036 pinctrl-single
> > pin 29 (PIN29) 0:N/A 44e10874 00000006 pinctrl-single

Though one more nit, I have just realized, perhaps '0:?' would be
better, because GPIO library uses '?' in cases of unknown labels or
so.
I guess no need to resend (but if you wish you may do, with my tag
included) and we may wait for Linus and Bart to comment.

> > pin 30 (PIN30) 28:gpio-32-63 44e10878 00000027 pinctrl-single
> > pin 31 (PIN31) 29:gpio-32-63 44e1087c 00000037 pinctrl-single
> > pin 32 (PIN32) 30:gpio-32-63 44e10880 00000037 pinctrl-single
> > pin 33 (PIN33) 31:gpio-32-63 44e10884 00000037 pinctrl-single
> > pin 34 (PIN34) 0:gpio-64-95 44e10888 00000037 pinctrl-single
> > pin 35 (PIN35) 1:gpio-64-95 44e1088c 00000037 pinctrl-single
> >
>
> This variant looks good enough to me, thanks! FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


-- 
With Best Regards,
Andy Shevchenko
