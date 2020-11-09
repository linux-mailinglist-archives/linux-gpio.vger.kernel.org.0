Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13822ABF85
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 16:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729899AbgKIPQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 10:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKIPQB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 10:16:01 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F299C0613CF;
        Mon,  9 Nov 2020 07:16:01 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w4so7376935pgg.13;
        Mon, 09 Nov 2020 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOLvQx8+HhSWGqiuawsD+ABNE4D1RR1lEjjhwW8+Rxo=;
        b=g6YrncnvAMsicaX2OYez16D1w1HqSBMixXeMziDFCAg1c3YaHBYggDb5xCzhrT9lWh
         lLlZj8EYeJP2ImsdekcPsZebITx2wywrJ+izecmAwicqXDmWsvU4F9fd4RRz0Rdu/6cs
         WRy95Hj9lcZtZz5JLL4XvbTz+VLinqmNrFV+ENb28a1FS5VHCLqvuiPDQgJPQ3zidiHj
         PJ0OOIKmcqnt0PW7eCPfGyef2bUo+Sya2hFKU4fxyfZ+OIhc0xnlCuVr6XNaNKrX8EQB
         a8EqmUYJ791bzyfE6zud+Mhtveq7u6s6cNHMTpVdyVH8EXKPqY9n+ZNObjMvn/xgalOA
         bhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOLvQx8+HhSWGqiuawsD+ABNE4D1RR1lEjjhwW8+Rxo=;
        b=slwfK95xtjHSLXe+vEnMh6L2Oj1UZVYqhPo+EUgoZrAhOGuTvV2oYEqLRCfYnFENS3
         RMnHeZVJvLzIchrO3iodQoRKthurPxNwLeJHwmAkfmC3sAmCBdP+Pm5JN+GiLoLZnTOt
         YM7IydKvWlAIyayUP2/HVjlmRnGJg66V7yG2ov1EZqdSCMnyUQwNVgVqUDJjmBGRsUmr
         8JBzqX+wAgVzHSc1LAlI+RoHoov0IOewvJY968u/B32dcb2GDrY0kuGzJYw150nTACvU
         ecHm64wvTeGtYLXurEIvodccQBhdwFMHGlio8scQ1q1Oe9YoWA2DKHoIV5dE5K66Cj/W
         O/tw==
X-Gm-Message-State: AOAM532BPbiDfZKAdXjcl+9h8RUilHyfzbMgyNrXQnOWvs97nUA6f4XV
        EpsVH0cY63xr8Dp90bmCdSh83szSKMvPrs/J3vA=
X-Google-Smtp-Source: ABdhPJxeNsU9Hwez84+xU+qGGQmigq9W99YeW27bkzDtA22/SGSpokr9Pl6p7nH6lNRNSruZNh+GGa+xq5ofrCw+4Gk=
X-Received: by 2002:a63:4511:: with SMTP id s17mr13187246pga.4.1604934961034;
 Mon, 09 Nov 2020 07:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20201109132643.457932-1-lars.povlsen@microchip.com>
 <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
 <20201109143237.GJ1257108@piout.net>
In-Reply-To: <20201109143237.GJ1257108@piout.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 17:16:49 +0200
Message-ID: <CAHp75Vc7eRDq5wUyUdvCZCnV_VS+afGnbJpQeDSeXVE9K_MGng@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 4:32 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 09/11/2020 16:17:40+0200, Andy Shevchenko wrote:
> > > +       if (input != bank->is_input) {
> >
> > > +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
> > > +                       pin, input ? "input" : "output");
> >
> > Do we need this noise? Isn't user space getting a proper error code as
> > per doc and can handle this?
>
> Why would userspace get the error code?

Huh?! Why it shouldn't. How will users know if they are doing something wrong?

> Userspace should never have to
> handle gpios directly or you are doing something wrong.

This is true, but check how error codes are propagated to the user space.


-- 
With Best Regards,
Andy Shevchenko
