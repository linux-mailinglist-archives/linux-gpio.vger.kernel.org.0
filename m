Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E8040ECED
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 23:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238187AbhIPVxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 17:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237870AbhIPVxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 17:53:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1255EC061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 14:52:31 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i7so24096257lfr.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zRQoD6iZCn55Ja8F2Gn3cNarwgkK5+FsGdC92UFZD70=;
        b=eFGCxqeKd62Vy24KV//A6w7k7Nu7tPBzDq2PNTdL+T+OyMy0V2sQGIJdTgZvKOs2qe
         qyhUuDoy5QTFuubpZIPoiPMw98pWQUO14ZoVheus+4o5Fg/oVxfJrNmyf5eeT5TTd/H0
         V0hUXs0V6Xi5nYmult1ktJSWrvhn+c3o5aTDYZWSBdOd6yHRCbOgk1IMzNHuxe3ZAS6P
         Fvpt/06NuwZfdymMN8ultVfvktkqbssYuuMMNPYop7E+friZHcMgO2jhPEITq1dLlW5k
         8sehK7C5icHKoXuWAD2yq6SBZRLRRj88cuuzr8if4wQceky8k23cLQrH6DKdc321KkAM
         6ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zRQoD6iZCn55Ja8F2Gn3cNarwgkK5+FsGdC92UFZD70=;
        b=1J7vUdA0Ww+t9LsIuQKquz7xwbLrzv6bX7CHy01VdLTzZPLhLqnZcXrnyjU9e8RYqx
         z6DNSx7G3857FicohEjM1HdwqUEv2JDhMFatmbIdp5OdEVpjJMNCzKi7nuHxTWNkkIAS
         6+PU0rejurMNy9wPosKwKd9UQ4cfMHgpP7CErGVx+nLfyXUFdzZpgo1w/1NMyAT/rVEW
         bcuHmkDhVRoVWvFiZwX8qvR8MDHTRDmQrC3YUhZjsLnqfddMuVWocIcWsBuUb32TQQ1u
         OEy/HmczQr1DC/yMpGfi/SVfLOMB+vYR42YLb6epBW7h8256hHMuUnAsWjHOyTefw/HT
         dhqA==
X-Gm-Message-State: AOAM531xFIoy1UClBfV0wm4l9DIAGLGPOah1TNB8MukaiJTPMG5CDAVO
        6/YqaLP9hhJ/0ovOpXyQWWJ/1P7Sf2LHPo8DQcAFlg==
X-Google-Smtp-Source: ABdhPJwg4R+gQoXcEfuVVtF22UR6eCaZATGlUqS1qzPkBlvz0xuK7xwfdHsD5LBTEn80MbmBWCaYTn91/IWi8bBNA18=
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr6494178ljo.288.1631829149435;
 Thu, 16 Sep 2021 14:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com> <20210824164801.28896-11-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210824164801.28896-11-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Sep 2021 23:52:18 +0200
Message-ID: <CACRpkda5Y-Dxb4SkwyUcqKwsTd_c9Emgt0Z6OME5pQYz-WiC_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 10/20] tools: gpio: Add GPIO output generation user application
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>, bala.senthil@intel.com,
        Dipen Patel <dipenp@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:

> From: Christopher Hall <christopher.s.hall@intel.com>
>
> Add GPIO user application - gpio_event_gen - to generate output using
> output methods added to GPIO lib. The output produced is 1 Hz clock
> aligned to the system clock using singly scheduled edges.
>
> gpio_event_gen accepts similar arguments to gpio-event-mon.
>
> Example output:
>         $ gpio-event-gen -n gpiochip0 -o 0 -c 3
>         Generating events on line 0 on gpiochip1
>         clock realtime : 1612453529996832765
>         GPIO EVENT TRIGGER: 1612453531000000000
>         clock realtime 2 2 : 1612453531500000000
>         GPIO EVENT TRIGGER: 1612453531500000000
>         clock realtime 2 2 : 1612453532000000000
>         GPIO EVENT TRIGGER: 1612453532000000000
>         clock realtime 2 2 : 1612453532500000000
>
> Produces 3 events of 1 Hz output on line 0 of chip/device 0.
>
> Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Reviewed-by: Mark Gross <mgross@linux.intel.com>

To me this looks as very similar to what the PWM subsystem
is doing, just with a restricted number of periods.
Especially with that command line example.

Yours,
Linus Walleij
