Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3D12A7A5A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbgKEJVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgKEJVl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:21:41 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29D4C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:21:39 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 126so1251901lfi.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MLqSXCNezt+6aLqOTtVwOIFeRl7Xe1AvGFzo3fYe1IY=;
        b=Jgn4flcDwaM4mzljPuY4s4pB7iP2cuTWB5VKgui315qkRuy92cPfVJ/shvssIW9x54
         ot3qVvePuzmxXvqWwA9M1JCEWi58AHdtLSTwHA8QV/5i1MmA27VBu9rus5CeT/CaOZV8
         6A+F8/YOOm+6m2YzWCu5jnOZWbHIj7S46XpDNGyQYH5CxLEiu2+M9jmw3lnBcs8hnmwV
         /yYVTHgHb6O2DZIQxxp12BQZLIG2M9n00OKf3BYP+g+tj+PbS4wHlOsaF/ocmoCThCJb
         z9m5vcykgPY2noV1am3wjgeLAJJOYclMBzpvO6QAlprivTLPtOaK24UYWrrJ2FIFol32
         0JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MLqSXCNezt+6aLqOTtVwOIFeRl7Xe1AvGFzo3fYe1IY=;
        b=S3N64JdZd9yzH1cvnZT/nvddx1X9C7i9m56bYhiMskIpNZxnUc16iCoV/J3Mm3iXuv
         4BAFwKvvNEBF6KwV4ht37uhBqJc2DAw+q6WrupTN/3qbnmlUntl0+1kXgAf98ITDmTMH
         Aj0ZGjhl3NvZJT6HvsoY9jBzB5V0fPreoHMFat1Ij5Ii0/qTmZVcx8W9gQxozqWwMHO0
         75GWrR18OVFBx8BN0jDmsybRvFCQOvYTghFIJgX9YF4m/J4i3FLeYCOuFKbnB9eF28Id
         PwjKFlf3zhPCcL2yzZ+idTpgH/Ealw0GpaXPtTAvjJmb4rfdPA82TEzZExv7nS+FEhIy
         NZLw==
X-Gm-Message-State: AOAM533q+fyYXJU+Aqo+NsPA+G3dBv3oxEU9C/1s5IlJel52c8X5M+kI
        dGvzI7bJK5qXoKAR7JYXUdaBu8XfdU6Utrl/FQSI4g==
X-Google-Smtp-Source: ABdhPJyIx15IqdB1NPA4Sazq74uSIewpcq3AMgBd0y4Lv2GKOeKDnGro5f8DkvKwJhJ7plUKGIKFbEhFk80IWVCFJr8=
X-Received: by 2002:a05:6512:322d:: with SMTP id f13mr567603lfe.571.1604568098468;
 Thu, 05 Nov 2020 01:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-4-daniel@0x0f.com>
 <CACRpkdYmdZ81q_tsXRQ56aFjGsvV3AwJ8_hiu31mD14DGiK84A@mail.gmail.com> <CAFr9PXnX7QyM0VUmosFYueSe4ewA7uT2VZMfxFPaFt6-jUhoSw@mail.gmail.com>
In-Reply-To: <CAFr9PXnX7QyM0VUmosFYueSe4ewA7uT2VZMfxFPaFt6-jUhoSw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:21:27 +0100
Message-ID: <CACRpkdbx+T3uX9taZNjsURHGc6qVLvGGC2boEC4=NaOi4_uZTQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 1:07 PM Daniel Palmer <daniel@0x0f.com> wrote:

> Sorry to pester you again...

Don't worry. I'm more worried that my replies are slow.

> Before I do that I have a question that maybe you could help me with:
> Andy noted a few times that I have this driver as a built in driver
> and not a module.
> The gpio-ixp4xx.c driver is also a built in driver. Is there a reason
> why it's ok there but not this driver?

Not that I know of. There is a lot of push for modularization right
now because Android (and other distributions) likes it, so if your
SoC could be used by Android or Fedora or Debian etc it is
generally a good idea to modularize.

These distributions use the generic ARM (etc) kernel and try
to load as many drivers as possible as modules.

It is not always possible because some GPIOs might be needed
very early, such as on-chip GPIO. So you better make sure
that the platform can get to userspace also without this driver
compiled in, otherwise it *MUST* be bool so people don't get
ammunition to shoot themselves in the foot and configure a
non-bootable kernel just because they could modularize this
driver.

If your SoC is only used by OpenWrt (like ixp4xx) then it is fine
to just use bool because that distribution is always built with an
image for a specific hardware, whereas distributions are generic.

So it actually depends a bit on the usecase of the SoC.

Yours,
Linus Walleij
