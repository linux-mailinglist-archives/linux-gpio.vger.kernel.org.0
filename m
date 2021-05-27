Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1403927AB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 08:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhE0GeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 02:34:23 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:44766 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhE0GeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 02:34:11 -0400
Received: by mail-lj1-f178.google.com with SMTP id s25so4830923ljo.11;
        Wed, 26 May 2021 23:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=yOQzPA/lFWMyi60ZEKnmB4uCe5Zh7AcsI2uWRxe5Yv4=;
        b=fo2Fye/qr8fbUjKp5bwqHKUY0CpHRMMDSrEC9CY+00j0zLH7Ck19Kwi1nkvyMQ6Cle
         M+1aBTkSeHkDI2BW8JJWCmOxnhbBcCGB7NWAn+Nwqia4M3SVTWiBA8lqeLxxTVk5z+P9
         YOpxcKLANwnNYPfS9845EEt4b8QjA08nAZRLIE3ZAgQfgxyOSHdztF9XB7c78QXcwVf4
         5ptE8rajwdGOhR7jdlm9Q8E53NHosiCM1hY7LLAzX7LPUVIp/ssdCipgDrXMBx4JDAun
         hk4Jt6zbHIqiwOSaOFKlEox3/GHVKXLhYdDoXqkcmyMx+RTZH/aLuifZf2D1klgSVmZm
         sb8A==
X-Gm-Message-State: AOAM531YcIUJTyTgNsr7RPRnoNiFsnRiHAQu//Kts/rO4qhwnhQODOqz
        FCyctnDpTq4z0/fjbRPn5Kl59SUcBZQ=
X-Google-Smtp-Source: ABdhPJx4pkDFWwQCgqUek0COu8QfQS73VAX2xWX5SGtXxa8eK84PqSJsDypu7N/jtd69iqwjYzBwOQ==
X-Received: by 2002:a2e:889a:: with SMTP id k26mr1370406lji.438.1622097156203;
        Wed, 26 May 2021 23:32:36 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id b44sm127928ljr.68.2021.05.26.23.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 23:32:35 -0700 (PDT)
Message-ID: <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-power@fi.rohmeurope.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
In-Reply-To: <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 27 May 2021 09:32:28 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-05-27 at 00:46 +0200, Linus Walleij wrote:
> On Wed, May 26, 2021 at 8:02 AM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> 
> > Support providing some IC specific operations at gpio_regmap
> > registration.
> 
> I see there is some discussion around the abstractions here.
> 
> I can only say how we designed gpio-mmio.c (CONFIG_GPIO_GENERIC).
> 
> It was designed for GPIO controllers with 8, 16 or 32 bits of GPIO,
> each stuffed in a consecutive bit in a set of registers. We later
> amended it to deal with bigendian as well, and 64 bit registers,
> and some quirks around the registers (like just readable etc).
> 
> But that's it. For anything more complex we have opted for
> users to write their own drivers with elaborate code.
> 
> As library it can sometimes be combined with an irqchip,
> if the interrupts are simple.
> 
> But overall: each GPIO needs to be a single bit, not 2 not 3
> not in every 7th register etc.
> 
> I would not try to turn gpio regmap into a Rube Goldberg Machine
> panacea-fit-all for all kinds of register and bit layouts, 

This is exactly the point of this patch series. The goal is that
complex hardware is handled by IC specific drivers. But at the same
time, hardware which has 'standard parts' and 'complex parts' could re-
use the well-defined gpio_regmap parts instead of duplicating that code
in IC driver. As far as I understand we do agree with Michael about the
benefits of this overall idea. Current patch only allows IC specific
bits for init_valid_mask and set_config - but I personally see no
problem in expanding this if needed. Place to add more callbacks would
be there - whether to add something or not can then be evaluated case
by case.

I think that the disagreement boils down to few styling issues - and
one more pragmatic one. And only what comes to how we allow
implementing the IC specific call-backs for these more complex HW
specific cases. "Styling" boils down to providing getter-functions for
well-defined gpio_regmap properties like regmap, device and fwnode
pointers Vs. exposing these in a well-defined structure as function
parameters.

The more pragmatic question is how the IC specific bits are provided to
the callbacks. My approach would be allowing IC drivers to use the
existing regmap_gpio config structure as I think in many cases that
would be enough and IC drivers could omit the driver_data, like gpio-
bd71815.c could do. I guess I could go through some of the existing
drivers and see if others would benefit from this too. The other option
I see is to force the IC driver to always allocate drvdata if it needs
any HW information in the callbacks - no matter if this is same
information it has already passed to gpio-regmap in the config. 

> it's nice to
> be able to combine it with an interrupt chip or pin controller if
> those
> functions are also simple, like the set/get registers.
> 
> Any too bold ambitions will be hard to maintain, I think.

In my eyes maintaining drivers which all allocate own set of private
data gets much more messy than maintaining set of drivers most of which
use same predefined config struct and only allocate drvdata if really
needed. After that being said - I am not the one maintaining this :] So
at the end of the day it's fair to go on in a way Michael and You find
easiest to maintain. It is just my view that this series would be the
way to allow many of the IC drivers using regmap to enjoy the benefits
of the gpio-regmap - while still maintaining the formal structure. 

Please, let me know if you think I should see how much this would drop
the code from some of the existing GPIO drivers. It makes no sense to
invest more time in this if others are 100% against it.

Best Regards
	Matti Vaittinen

--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland
SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)


