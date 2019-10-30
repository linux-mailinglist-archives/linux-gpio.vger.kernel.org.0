Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 933C2EA39C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 19:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfJ3Stm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 14:49:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbfJ3Stm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 14:49:42 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F06E20856;
        Wed, 30 Oct 2019 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572461381;
        bh=gYeKNtUM/kM/t5fiqa/0cB3LfncGXAfE1NIk3loohs0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qW8v5vaFBpy8dPo13YzVcehUY2UtQKk16IJw+Bk4VWe24nDSLm2qPzIM69qpJNggL
         4v0bSEjX9mhBtaXoFNk81OKwuGDmDQzlnrHxA/KhX5oXXB8IT7ejLE3MLtbh/NXe+P
         kjo3Mjn9NgMGtCG4WbgJ5N4RV59/BEGBc2+coMec=
Received: by mail-qt1-f172.google.com with SMTP id x14so4705280qtq.3;
        Wed, 30 Oct 2019 11:49:41 -0700 (PDT)
X-Gm-Message-State: APjAAAVYvlcxnU5X/lCsVTJgso2XE6GNoEgehuJlQPJ/Xq0Yx/KDSt/3
        OnKjrwQLr2+/6VDprxbty5NfgUUOVNUrOcxv0A==
X-Google-Smtp-Source: APXvYqxvF1bnQPOUd0XIfXsbyq6r9VwPToE4O24OpGpuMKLWZlpqRBut720AL7EXS1WuMfXKuOJLpZwQipA+aMdbyA4=
X-Received: by 2002:a05:6214:8e5:: with SMTP id dr5mr311497qvb.79.1572461380557;
 Wed, 30 Oct 2019 11:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191030120440.3699-1-peter.ujfalusi@ti.com> <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com> <20191030141736.GN4568@sirena.org.uk>
 <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com>
In-Reply-To: <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 30 Oct 2019 13:49:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
Message-ID: <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 9:30 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>
>
>
> On 30/10/2019 16.17, Mark Brown wrote:
> > On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
> >> On 30/10/2019 15.12, Rob Herring wrote:
> >
> >>> Why can't we just add a shared flag like we have for interrupts?
> >>> Effectively, we have that for resets too, it's just hardcoded in the
> >>> the drivers.
> >
> >> This would be kind of the same thing what the
> >> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
> >> fixed-regulators afaik.
> >
> > The theory with that was that any usage of this would need the
> > higher level code using the GPIO to cooperate so they didn't step
> > on each other's toes so the GPIO code should just punt to it.
>
> But from the client driver point of view a GPIO is still GPIO and if the
> components are unrelated then it is hard to patch things together from
> the top.

You can't escape a driver being aware. If a driver depends on that
GPIO to actually be set to states the driver says, then it can't be
guaranteed to work. For example, maybe the driver assumes the device
is in reset state after toggling reset and doesn't work if not in
reset state. The driver has to be aware no matter what you do in DT.

Rob
