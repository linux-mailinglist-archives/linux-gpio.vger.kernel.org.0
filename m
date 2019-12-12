Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64E9511D08A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbfLLPI5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:08:57 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43107 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbfLLPI5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:08:57 -0500
Received: by mail-ua1-f67.google.com with SMTP id o42so1006382uad.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 07:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBZPqQLjRrXMYmR1TRaqMyhH4qY4XtbQYO8hjLWbaCQ=;
        b=m4/Wr2qvLIWwO/nnv/MWFlzrVTYqwIuP//VHOprM0TS4aqnouLBYYbuKXDfZOW4zy6
         WwGNt6wKboMPLkZ2E8/NZCbgzjnehCPCJew6MkeU98jvV4zfh3C9C65H7kzchE6IfEc3
         cPsLn0wlOvRbdjWraOtHB9YHqPNxincix8AEtn1vTYqcZFNx++w0YhKkj22b+wEn8D58
         KihdxGOOV7uAKzwjHIWmulnscOi9cX+DuB+DkH8CWtEvucWc13p3AmI36VLn7BCMFG22
         2TmNAFLJ76Xm9ie4xkbBYzaNembFUKkM0K5MrWfnOhPIfPCMMWLF/Aei/G4b6ruqQ5om
         6DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBZPqQLjRrXMYmR1TRaqMyhH4qY4XtbQYO8hjLWbaCQ=;
        b=gv1D9qM7VsfP2Dsnw1Qw070LmQI2Uuzg1urwqRNh0LWTne/ALWGEIo03bB5kQh3oFF
         09M3hdeZR1JWfbXCXIzuCQJsHWpi31qjxqsNj4BTQ30zGRQ8Xrpyn2lJ8lZur+S7grrR
         6Nn+V4HW2aGxnr9HfmSXuUQzE9rz2SzQS0uZWG9YfLlF04vxBb4KEEeO9/xP4D9MCqAw
         I8lzCRm8lOGCWDpgzDmPTWyCQPQQ5vx/Ly6VlxhVrKlgbtHEN9alvCeuQMXOKInuVzXa
         Sa+x3WGHr39MW2n9sNSkt2xexxV0h39VJf+qswhrbhUSBHMCUKZsVFdGkHAZ6h3NyU4k
         QnRg==
X-Gm-Message-State: APjAAAWqQgQ03J4zM4CTxTgmHvFkLf84eMogxmcNwAXMjtC+rxqhDuCj
        +kfvmE0lz3ElNMzGqWfVCtlmZCjwOKayXnbuPQdvBg==
X-Google-Smtp-Source: APXvYqylzTcuVtIdKTe2ptVzi2MZfkuPeOlp+Ab7T3CJfNA/27r7rEWO5mUtRTY83LtjQy3Do512L/IYNuh6OowCLas=
X-Received: by 2002:ab0:2716:: with SMTP id s22mr8672177uao.20.1576163336218;
 Thu, 12 Dec 2019 07:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de> <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de> <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
In-Reply-To: <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 16:08:44 +0100
Message-ID: <CACRpkda4PFA=99u33xsXzQND1FaP=8GXGRQULngcd5a=zFepXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 6:09 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> I discussed it with a colleague again and he mentioned that pinctrl
> should be named pinctrl instead it should be named padctrl.

Quoting Documentation/driver-api/pinctl.rst:

(...)
Definition of PIN:

- PINS are equal to pads, fingers, balls or whatever packaging input or
  output line you want to control and these are denoted by unsigned integers
  in the range 0..maxpin.
(...)

> We don't
> reconfigure the pad to a other function it is still a device general
> purpose input pad. The hw-signal flow goes always trough the gpio block
> so one argument more for my solution. Also we don't configure the "pad"
> to be a vsel/ena-pin. The hw-pad can only be a gpio or has an alternate
> function (WDKICK for GPIO0, Seq. SYS_EN for GPIO2, Seq. PWR_EN for GPIO4).
> Instead we tell the regulator to use _this_ GPIO e.g. for voltage
> selection so we go the other way around. My last argument why pinctrl
> isn't the correct place is that the GPIO1 can be used for
> regulator-0:vsel-in and for regulator-1:enable-in. So this pad would
> have different states which is invalid IMHO.

Yeah it is just one of these cases where the silicon designer pulled
a line of polysilicone over to the regulator enable signal and put a
switch on it and say "so you can also enable the regulator
with a signal from here", it can be used in parallel with anything
else, which is especially messy.

Special cases require special handling, since the electronic design
of this thing is a bit Rube Goldberg.

Yours,
Linus Walleij
