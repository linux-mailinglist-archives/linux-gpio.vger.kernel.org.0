Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA0A3BF242
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 00:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhGGWwp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 18:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhGGWwp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jul 2021 18:52:45 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9807CC061574
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jul 2021 15:50:03 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id z12so3374931qtj.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jul 2021 15:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MI4Z3jtjEYFo3/H6shxull8OWOjMcaT+8m4H6EkmX4o=;
        b=PL017LVV1sXCR6gYImO417YsBN/YozW+vIw1xwHub1q7Fw3yP+CAGNFmx0F2FgGtoU
         vSB7MLatl1v6jpI+PtklHVJ4EobGBzk+r35cBAc5jQ29kYycbehBRPRx0ves2i7jNgYa
         ibBAIW1WlE0APKoDf0KEbP8T1BGKD+VJ6MQhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MI4Z3jtjEYFo3/H6shxull8OWOjMcaT+8m4H6EkmX4o=;
        b=crpd6nB7cwKcgPfGmbDkf7770VfIJyKzO1qm0qoo0rwMd+s1MZfx6gjQEctVMeVfvU
         MKYCSiG1Z2uwq+6l/U2tE93BkI4YWQTeS2r3S8XCK4l9P1mi31mbdg3/0dRJiIY0phct
         quQDpR1GH3N6gNGZnBHK1PY///KNDIGIGqQTYx/jPAaDRQBDqT7yclUMQ8AmheXONF9A
         5cENExhu6txOJAUhta0BnVhzf3CexWYOSgiULpHGqBabq0PMCoFvTDSWmWzMQRep2xSq
         RhcsAAgLGwR4cidHX6WO3SzEYUTkn1iKEFy59BOXiCYf8eD32KrC+OpLZ8apB4H/xpUS
         vZbA==
X-Gm-Message-State: AOAM533MVMhXkFIsA5UaPTWGN8MqnqHEjaDtOSaooYOcKXkgs+HRj+7q
        3dZG0zpWGVknDzo/D/kE/2owbucH8fNk1g==
X-Google-Smtp-Source: ABdhPJwxMsD/q7L5pvzeldK9w2RfSDgYZPE2X3XKKEJ0voY2MZ98Jdj5rPLNyJNuJefn9KoEat5/og==
X-Received: by 2002:ac8:4258:: with SMTP id r24mr5949631qtm.11.1625698202618;
        Wed, 07 Jul 2021 15:50:02 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id f12sm206943qtv.52.2021.07.07.15.50.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 15:50:01 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id r135so5840778ybc.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jul 2021 15:50:01 -0700 (PDT)
X-Received: by 2002:a25:d97:: with SMTP id 145mr36808020ybn.276.1625698201114;
 Wed, 07 Jul 2021 15:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <5B3HVQ.XR62REW2D4KQ1@ixit.cz> <R3LHVQ.51D68IW9A14U3@ixit.cz>
 <CAD=FV=XJYDE-gmN5Sq9n6GH2mr6V2o-AbUxcsHKrM_vkemU-MQ@mail.gmail.com> <T0BWVQ.57K5KI0VO3U71@ixit.cz>
In-Reply-To: <T0BWVQ.57K5KI0VO3U71@ixit.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 7 Jul 2021 15:49:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7aGzH+VFPvCz3fPAew8MS2rsdfvz2Mg6ikP1ZCUScxQ@mail.gmail.com>
Message-ID: <CAD=FV=W7aGzH+VFPvCz3fPAew8MS2rsdfvz2Mg6ikP1ZCUScxQ@mail.gmail.com>
Subject: Re: (probably) Qualcomm PM8xxx PMIC chips driver issue in 5.10+ kernel
To:     David Heidelberg <david@ixit.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Jul 7, 2021 at 3:13 PM David Heidelberg <david@ixit.cz> wrote:
>
> Doug,
>
> thank you for your reply. Further investigation led me to the "irq:
> Request and release resources for chained IRQs" (hack) which I used for
> many previous kernels to avoid fatal panic (at PM8xxx dependent
> components).
> It seems it does not only collide with your patch, but also thanks to
> your fix I can drop it since from 5.10.
>
> Only thing which remains is this warning in the place of RCU stall:
>
> [ 1.739567] ssbi c00000.ssbi: SSBI controller type: 'pmic-arbiter'
> [ 1.741905] pm8xxx_probe: PMIC revision 1: F3
> [ 1.747435] pm8xxx_probe: PMIC revision 2: 0B
> [ 1.751786] ------------[ cut here ]------------
> [ 1.756102] WARNING: CPU: 0 PID: 1 at drivers/gpio/gpiolib.c:3316
> gpiochip_enable_irq+0xa4/0xa8

OK, I guess this makes sense. I think this WARNING is actually what
your HACK patch was trying to avoid. Presumably, though, the
irq_request_resources() in your HACK patch ended up enabling the
interrupt before the system was ready to handle it.

Looking at pm8xxx_probe(), I guess it's effectively doing this:

irq = platform_get_irq(pdev, 0);
...
irq_set_chained_handler_and_data(irq, data->irq_handler, chip);

...and the IRQ is actually a GPIO. I guess nowhere in there is the
interrupt actually requested. I'm actually a little surprised that it
works but I'm certainly no expert.

I wonder if changing it to this sequence would fix it?

irq = platform_get_irq(pdev, 0);
request_irq(irq, NULL, 0, "pm8xxx", &pdev->dev);
irq_set_chained_handler_and_data(irq, data->irq_handler, chip);

...or perhaps this sequence (though you'd have to backport IRQF_NO_AUTOEN):

irq = platform_get_irq(pdev, 0);
request_irq(irq, NULL, IRQF_NO_AUTOEN, "pm8xxx", &pdev->dev);
irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
enable_irq(irq);


Of course I'm poking in the dark a bit here. In any case, it does
sound like the patch works OK without your hack patch in place so I
guess the answer is to figure out how to more properly fix the hack
patch. I probably won't be able to help tons there...

-Doug
