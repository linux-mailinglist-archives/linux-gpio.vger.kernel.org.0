Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295548E600
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 10:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbfHOIPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 04:15:15 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43808 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfHOIPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 04:15:15 -0400
Received: by mail-lf1-f67.google.com with SMTP id c19so1098509lfm.10
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 01:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=07F0k0/I+yQaJeXPWKleDyscIPKImasXKY4zAI60tCY=;
        b=G8SdXPNy0DY07FdznzFQbQPys62B0rkcgdUNT5rYvTTPn4OonEcccoiFkBo37IAx3I
         BL9Lk28Tu5Lf9K+yB+wRakTAzoisJMKBx73xHjVkVyrcdNA6XnKtROAKwke820Hu3U7C
         3DpU+WBUJTXBWYM4VsE8Xj5Jl1ED+0ZOodIZAPwoNhhswaJVrEgpfRyAl/ukjeJAYWL2
         wHWySW6lnrDHYCXorZfmoy0KO7B87NYRrettzL5vyd8b1Bu4wymhJCznHvLi1P/qe8oU
         4OzzEftvuK/zJuF5fWLMIhmL7SrCqJRRMq2eit1SdQw8gbDjBXvRB1+iYMH68kLeUQYD
         tB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=07F0k0/I+yQaJeXPWKleDyscIPKImasXKY4zAI60tCY=;
        b=IzJT3i3L4N8RLgvIBy+T+CEDVS1UEh6n3WDAEeA+A+QDRyMkgwu7473YF0gl4u9RMz
         oVVv2DqTL+SSPa/O39h3wIVwlluYDVr2YPf2zae4BwAk2EZs8LOavaERlOU+2f2ZIvmz
         mNOMYe+yvRwQ1qB6R8NUUrVJQQFMGULMV58i+d8wATif7eQMEUYZsKzdwcgNRN1GzQLR
         UP4i2+la8FK0i3E8FBXGSWQgnFF8Q/qPTrUnGfZB7s+P+OR8LsVMidJcCoGa8lebQ15g
         0buJo/KM0GLOD5utJf5wyR6xi2SzjrvIHRiKqMyCmTUHEpY3EiLAP7362Bd3GyjKo2pt
         UWEQ==
X-Gm-Message-State: APjAAAXZx7FgDhRwknTTBF+L/3+qAaiqeJ5/4+uELLghYYC0wqqDx0Es
        kBSmKMhS1n4zr+0O4+Y5RG4+SGZ4yyrnPls+Momb2kaYFrA=
X-Google-Smtp-Source: APXvYqwIh4OwFZkSrYNco6Hu5QjyW4uf5uMv+vgvg4VuDTF5BWUPotfTuOryTJ3WWGJrbJbymQSfOvvAHhFhPTMq1LM=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr1830823lfp.61.1565856913202;
 Thu, 15 Aug 2019 01:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131002.14597-1-uwe@kleine-koenig.org> <9d01ed54-4c20-a4d3-f5b1-8ec2aac09ea0@kleine-koenig.org>
In-Reply-To: <9d01ed54-4c20-a4d3-f5b1-8ec2aac09ea0@kleine-koenig.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:15:00 +0200
Message-ID: <CACRpkdYjeNFP0KrF+RpFOvWWzmY5iKcRK9EOPqMX3t_6vwhbeA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: don't depend twice on GPIOLIB
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 10:12 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:
> On 7/25/19 3:10 PM, Uwe Kleine-K=C3=B6nig wrote:
> > config GPIO_MOCKUP is defined in a big if GPIOLIB ... endif block so it
> > doesn't need to depend explicitly on GPIOLIB.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> > ---
> >  drivers/gpio/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index bb13c266c329..856fcd260ba2 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1465,7 +1465,6 @@ endmenu
> >
> >  config GPIO_MOCKUP
> >       tristate "GPIO Testing Driver"
> > -     depends on GPIOLIB
> >       select IRQ_SIM
> >       help
> >         This enables GPIO Testing driver, which provides a way to test =
GPIO
> >
>
> I didn't get feedback for this patch. Did it fall through the cracks?

Weird, the patch is not in my inbox :(

I downloaded from lore.kernel.org and applied, thanks!

Yours,
Linus Walleij

Yours,
Linus Walleij
