Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF402A4349
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 11:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgKCKit (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 05:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbgKCKit (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 05:38:49 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44897C0613D1;
        Tue,  3 Nov 2020 02:38:46 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id h6so13359876pgk.4;
        Tue, 03 Nov 2020 02:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WdbG4Pr33GpNK3JndU4ZlmEuONlijTi1cN0oJuHOnDQ=;
        b=kbF+zmi9Mn7s1NtDSFntsL/5oXSlnrZU6jOOi7eGvMct5t5afmMjVTnF/Qo7Bg+eYy
         wred6nE0iXI62LP05nLoZ3A2KuqK4jMRx5tHDVm2I6yAFe0luK60AVj/rjXF2dkZM8om
         oXK708dNABrVYdThjmpRKs74KA7o1cnsQXCWQo0JRpomQGsFkD7a2d7BNsB/PuuXAQB+
         xWWTFxZSXFu6Pxs1fEpPIG0EfIVKwudWgILfkUQxpYFZk0TD7WLQbUsoznIMGck6INhi
         5KaeOlEZQGOOcm5Fm2FWxNKECCEPyndopi/lyqLBdr3pLJeFFK1PUf0LVkP+5QX32Fr3
         dqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WdbG4Pr33GpNK3JndU4ZlmEuONlijTi1cN0oJuHOnDQ=;
        b=qEyNGhVBjzLnNu0NxfE5zhOLZALmlikfnTYgKdkTw/h4wJpdtRuTvDS/yT3QwdgAmI
         lFCtnkOIKxEh3zvW9lii5FPzB0vKh1ZGsHzL+Z9+q/h6jLV/rgvE8X72ktmOcnPXmUOM
         +2aWiTlY3mhgoR1Q/4MPRrEBoYh6g15CRLvhkH4DQmOah3Bh8JXOIEm1BWs3FjN/LDzj
         FNoanEmU3ncz+EyGYHNmztAkY1tY/DXXPAAKt/TrPYydjZG4RcJ8QQfB54Hogvh6K4yE
         4uohAzLAJyB5/Nwd1HW728FMBhgd3/LGLr56QPk73zxNHxuwFR2N0LHEBzCD9bN9e6VU
         XIBA==
X-Gm-Message-State: AOAM532a6g2PWM5nLmQqWg78x8Nq0cvO+iZyk4OcxPHyBWTHpjJiUJZp
        eH/YsQyQeKNJ71rFgietGtZUzUlUXnAgTEJSElY=
X-Google-Smtp-Source: ABdhPJwic4FS+1RmkgOLWtpUBDGJMW9fpQHR/Kaeqepv2adSR5sM4Re8H24UpKdZ5ItGcTB3XzsdSQOcMOqwq5ziELs=
X-Received: by 2002:aa7:942a:0:b029:164:a853:f0fc with SMTP id
 y10-20020aa7942a0000b0290164a853f0fcmr24349243pfo.40.1604399925739; Tue, 03
 Nov 2020 02:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20201103000439.325448-1-linus.walleij@linaro.org> <967ce9e6-0197-c488-2a7d-c7f491d9b361@redhat.com>
In-Reply-To: <967ce9e6-0197-c488-2a7d-c7f491d9b361@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Nov 2020 12:39:34 +0200
Message-ID: <CAHp75VdZSF_9N+PR5nSf0bzXGH12M3eF8hnLA9HhNbq+PG+mCw@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] x86/platform/geode: Convert net5501 LED to GPIO
 machine descriptor
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 3, 2020 at 12:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/3/20 1:04 AM, Linus Walleij wrote:
> > This makes the machine look up the LED from a GPIO machine
> > descriptor table. The Geode LEDs should be on the CS5535
> > companion chip.
> >
> > Cc: linux-gpio@vger.kernel.org
> > Cc: Andres Salomon <dilinger@queued.net>
> > Cc: linux-geode@lists.infradead.org
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: platform-driver-x86@vger.kernel.org
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Linus, in case you did not know yet, I have take over
> drivers/platform/x86 maintainership from Andy.
>
> Andy, the MAINTAINERS entry for arch/x86/platform says:

Yes, it's a bit orthogonal to PDx86, but it makes sense to have the
below list of reviewers to be in sync with PDx86 maintainers. I'm
happy to give my place in the below to you.

> X86 PLATFORM DRIVERS - ARCH
> R:      Darren Hart <dvhart@infradead.org>
> R:      Andy Shevchenko <andy@infradead.org>
> L:      platform-driver-x86@vger.kernel.org
> L:      x86@kernel.org
> S:      Maintained
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
> F:      arch/x86/platform
>
> Andy, so I guess that with your Reviewed-by added, these are expected to
> get picked up by the tip tree people ?

That's correct.

> Linus, it seems that you did not "Cc: x86@kernel.org" which is
> listed in MAINTAINERS for these, and is probably necessary to
> get these merged through the tip tree.
>
> Note I'm happy to pick these up through:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/
>
> I actually had them in my local review-hans branch before noticing that
> that they went to arch/x86/platform. But I've dropped them now as I'm
> not sure if merging them through the pdx86 tree is the right thing to do,
> the MAINTAINERS file at least suggests things should be done differently.

arch/x86 should go via TIP tree, except cases confirmed by TIP maintainers.

> Linus, if a v4 with "Cc: x86@kernel.org" is necessary you may add my:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> To the entire series.

-- 
With Best Regards,
Andy Shevchenko
