Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F180D21815C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGHHkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgGHHj6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:39:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF15C08E85B
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:39:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so49398913ljp.6
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HxgH6sad3gU6leW7SDh/gf8Hzfs0/fhZcOEjnvGhWs=;
        b=kf6x43aymox0RXHGLm8aA9SdFQARFjcUUTid1nkeg9ibekZJqFjhwH23OVWjfAOjVS
         PIyKh85DWMiQQ7vV4MPU9N/PHWMBXsW8ALCT0jUDOBYiRrEm93dNmyBY2QKLC8e59uXU
         rF/LbFEzhwf7Hh9D0M9LGkfmU1uXbWrbwnSzZ8YxxZR5BL7KxyZLYny+CUf+LF90Q6OB
         gITnA0TUKecjikeYVz6qOheu9mHlpVGZsqJgXhFyS2gl3mAaueYbWpptMe/oEQAYYllA
         zsUp2xKjkGd9Lw4e7zUScEK+4AP896Zl4fGx27sAKWpJkoT11s4X/JaSJFPzE8k8XuwU
         CRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HxgH6sad3gU6leW7SDh/gf8Hzfs0/fhZcOEjnvGhWs=;
        b=Lt9zWVZXNE9c1+fWRqj2mqWg6BQo+EtsRUcuFpDM6sFZV2B+irtoGPRrX7f7mWOEJA
         JCMktPeTErsICCq5UV/oO645/NzE4akkzMmkIOlvawpqGhlZBWtEfZRw4pA48BJv1ff1
         lmukFo3Rc1REPMn/dQFLQma98/SdJuoOZfgPydUBcD5JDaM2jvRRtdvqRPkM40cOBeyv
         ZJWKNMQU+6SYsmpmBjpJj0e45stIq+Pf/HUepg4gIwj7pDphDJCCdLU0+AIs3FdUkc//
         1SdsLTv2VDr4NXTzVrhyJsjLSmzdi4RQzvitRJbf6pAVPzxsJZ3hm8XSdLHXodmpuI2O
         PBkg==
X-Gm-Message-State: AOAM530If7rAcMHtfEB+yDVge52OJN6jkNy+gn1lXoM97H2LS6pmVych
        rKL9/GHGejCbyah1e7Qq6H36gx/yzrfCtFhoSRoAiQ==
X-Google-Smtp-Source: ABdhPJxTYp6lBnboAKIMoKnmPkXV27lA7iN1d1K5nRqP4hkVKmZacGWC0DDRGgpoKAE/wWfaRt/VjtFi95icB142swA=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr33775780ljj.293.1594193995825;
 Wed, 08 Jul 2020 00:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200706175353.16404-1-michael@walle.cc> <20200706175353.16404-14-michael@walle.cc>
In-Reply-To: <20200706175353.16404-14-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:39:45 +0200
Message-ID: <CACRpkdaPO7CGNrxmjL5QH1cxP5wqku1oMtQaQgJfeKiKqiGAOg@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: freescale: sl28: enable fan support
To:     Michael Walle <michael@walle.cc>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

just a drive-by-comment:

On Mon, Jul 6, 2020 at 7:57 PM Michael Walle <michael@walle.cc> wrote:

> Add a pwm-fan mapped to the PWM channel 0 which is connected to the
> fan connector of the carrier.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

If you have a cooling device like this, do you also have a temperature
sensor? In that case it makes sense to add a thermal zone and a
policy, such as I did for a device in
6e97f0aaca4ca778905dd1dc667cbf379f4cae15

Yours,
Linus Walleij
