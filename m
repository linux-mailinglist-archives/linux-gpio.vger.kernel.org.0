Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864334703C7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 16:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242839AbhLJP1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 10:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242832AbhLJP0z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 10:26:55 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C551DC061746
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:23:19 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id r25so30591951edq.7
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CaWHeGP0DuwfkbKXUdYIJmX8F+biVrGWME72+JdzhqU=;
        b=MgLv3YrA9NlwpapqjGWsPaT057Lv4NTkMge5x9aYIzLu/EWTNZl9PQJ3i9HcLMOx6B
         B9IguP3K+gzGh6KfKbYSO8oxGj7MjYa00frl0BCd7lnk7OkZoOhbnGk36UU3KzWuB3In
         ZXMjkVs8K5nE10yvrBZiB/8HDzocgX7Too6WWjeeDpdcoaRlxj/sgAghwl/0IvTuGbeh
         fAFYqtmGZZZiSOSvOT+oAtgE4HrF1eec+d4mRi7xCG+BmEL2kk0ZRTS2b7waN3H1I0k/
         3ly7VwemPgrnfSjfL1C507DwBcuWSj3OL9qXJWKAX4/7OLRZbrfLo/DTY1QGnfnvK/nI
         rVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CaWHeGP0DuwfkbKXUdYIJmX8F+biVrGWME72+JdzhqU=;
        b=CfjLPBvtL3jXzLV/gBqXR2wQUq2e+ARdLu3jkg7pn3jy2Jp4+CQ9GO2dhbZCMAoGGi
         kgR2casJ56+URfddITPuuQeL7admjrOFqLMVlT2LTMpBZZKuE244Oga+NXJe0bKj5u3+
         TNkGUWPxpXmuouEvw7EYtBpKqK13RUmXjtj35pT7jlT3khiMycZMBj+ay/oB39D0PVaw
         eD5GQJagLeDBZZKfHH3L9PuafkNX1BvEiJW0netLeQQB/EPSDoer23SWmBeWKFLQkdeZ
         3uVmPF3zdaFPqgin3iPzR53se7gqdYNqX/npfBzoTDc0NGZ51TjBZD/M2TSEy2MMo0vw
         pF/w==
X-Gm-Message-State: AOAM533ty27Edj9xHoJMiOLHDARUw7gMmxQIZa+3g/AWgUvsQSpjzAUm
        52mv09wPn49AAciivoYXz6p1OeodeDs9gaqxjNJgBw==
X-Google-Smtp-Source: ABdhPJzwyJoQo5zS+XCmbkGk9eGVm61YMp0R/nIUhpMaAI0dyZLbksovDhkrc3SVhNC+OXjC0RSzQ3wiLRH8X7JDAvI=
X-Received: by 2002:a05:6402:2805:: with SMTP id h5mr38690255ede.267.1639149780836;
 Fri, 10 Dec 2021 07:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20211208003727.3596577-1-f.fainelli@gmail.com> <20211208003727.3596577-6-f.fainelli@gmail.com>
In-Reply-To: <20211208003727.3596577-6-f.fainelli@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 16:22:50 +0100
Message-ID: <CAMRc=MdmP5UCi2SJq9Ybhe9evUmM_PhpSUfzRF24yYUiRG+MNg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] dt-bindings: gpio: Convert Broadcom STB GPIO to YAML
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Cooper <alcooperx@gmail.com>,
        Doug Berger <opendmb@gmail.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." 
        <linux-mmc@vger.kernel.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 8, 2021 at 1:37 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Convert the Broadcom STB GPIO Device Tree binding to YAML to help with
> validation.
>
> Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
