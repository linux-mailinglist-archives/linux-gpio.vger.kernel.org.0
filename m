Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62232305D8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 10:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgG1I4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 04:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgG1I4V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 04:56:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03265C0619D6
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 01:56:20 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id 88so17468928wrh.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wxTwrgnq9E/WiNk3kV+5CMVUMO6IYGLUJRsXmpueos0=;
        b=SgmKbxshWIgy7i/i8vqaI5tcJ2bU9gb64Sjar5YKhBEB9iRFEBzg3k9HrxnHFKOSOs
         zMcnsMKMr8P3PuxxZvVa0Ir4j3kWZgXjk2nPksQHELB7nSQggAJnMs7JY2nOvsJ+GTyc
         sIiabW7fz/o12PIx2L6NxjeBcGNbm096zWnTV1cVN3V+7GI56cqEkWoS5K7sGXi1aM9m
         1knClukA542+MNKmOGARWM3fcYgIfXhxS0F2pay/Q5sEMEVLSN/zk8GkjyMscM7sqgyD
         YpxFhjMDccQmmVdIisDgzl/kMCQRrp8Zbjd/gxKYKRbEEJIQ6UoCMBONxNgeMkHczaNP
         XxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wxTwrgnq9E/WiNk3kV+5CMVUMO6IYGLUJRsXmpueos0=;
        b=HgJr6INAUJ8Z5CticDrhzmFdwjmZQM9PApLnjkFYvtQY/ipEPaoRMq4n61YHbckdC5
         0ta2vPvlRhJhg6eR+2uGCHo2FjPU1dstpIFLLxK17lRo6oLI8CTiBxHg16rIiTIRtUoQ
         peqqIXA75OP815MRFBwUB25TsRprxA5IUYpcgAq8lrfqjHyEZGxBpLrTBaWQOGEy+qDM
         ypLbItFI5BXTTIAig2/uQwo1q3HZVZK9nvsa5ILdkfAMGJiX7Lg0HPM0JAkwdw2pwx5i
         Xr3E0slBiVl1+wAL/1T6hOfEWoulkRUUxXIGLwQdSXYsA1rz5pOItzWcTTK9QMgVuq/H
         4rvA==
X-Gm-Message-State: AOAM532+oSUeZSajSPYNHU9JohSX9LbUTTqBzIWTHVgy8RWhlVq/ClZI
        8/6tfdUp4MRfe8hBs8te9KqDqQ==
X-Google-Smtp-Source: ABdhPJzyefbTUcC6FA1OtyHG3ZE+ihx1cIgJ8kJah012w56nbIM6+qpRfcUIjerKX0Iu0TxyY/d/Tw==
X-Received: by 2002:adf:f045:: with SMTP id t5mr25467199wro.288.1595926579385;
        Tue, 28 Jul 2020 01:56:19 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id a10sm12662484wro.35.2020.07.28.01.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 01:56:18 -0700 (PDT)
Date:   Tue, 28 Jul 2020 09:56:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 02/13] dt-bindings: mfd: Add bindings for sl28cpld
Message-ID: <20200728085616.GD2419169@dell>
References: <20200725231834.25642-1-michael@walle.cc>
 <20200725231834.25642-3-michael@walle.cc>
 <20200728072422.GF1850026@dell>
 <1065b0107ce6fd88b2bdd704bf45346b@walle.cc>
 <20200728082707.GB2419169@dell>
 <a47993ca4c77ab1ee92f6693debb3c87@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a47993ca4c77ab1ee92f6693debb3c87@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > > > > +$id: http://devicetree.org/schemas/mfd/kontron,sl28cpld.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Kontron's sl28cpld board management controller
> > > >
> > > > "S128CPLD" ?
> > > 
> > > still not, its sl28cpld, think of a project/code name, not the product
> > > appended with CPLD.
> > > 
> > > > "Board Management Controller (BMC)" ?
> > > 
> > > sounds like IPMI, which I wanted to avoid.
> > 
> > Is there a datasheet?
> 
> No there isn't.

Then what are you working from?

> > > > > +maintainers:
> > > > > +  - Michael Walle <michael@walle.cc>
> > > > > +
> > > > > +description: |
> > > > > +  The board management controller may contain different IP blocks
> > > > > like
> > > > > +  watchdog, fan monitoring, PWM controller, interrupt controller
> > > > > and a
> > > > > +  GPIO controller.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: kontron,sl28cpld-r1
> > > >
> > > > We don't usually code revision numbers in compatible strings.
> > > >
> > > > Is there any way to pull this from the H/W?
> > > 
> > > No, unfortunately you can't. And I really want to keep that, in case
> > > in the future there are some backwards incompatible changes.
> > 
> > Rob,
> > 
> > I know you reviewed this already, but you can give your opinion on
> > this specifically please?  I know that we have pushed back on this in
> > the past.
> 
> Oh, come one. That is an arbitrary string. "sl28cpld-r1" is the first
> implementation of this. A future "sl28cpld-r2" might look completely
> different and might not suite the simple MFD at all. "sl28cpld" is
> a made up name - as "sl28cpld-r1" is, too.

Well that sounds bogus for a start.  I guess that's one of the
problems with trying to support programmable H/W in S/W.
 
If it's okay with Rob, then I'll be okay with it.

Just to note, this has not been okay for others in the past, and this
use-case is not 'special'.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
