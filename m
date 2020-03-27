Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62744195E06
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 20:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgC0TB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 15:01:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37440 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgC0TB6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 15:01:58 -0400
Received: by mail-lf1-f68.google.com with SMTP id j11so8774114lfg.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CooN/lA7d5yACqkmjNxbvElnXH9xWYc5D690cPagV5A=;
        b=XzwTwOQ2tZqjO9DLphNswRW0Faz+tkI3lW4QKn8PnDodceq0s69XJc+EX+CaxLUZAc
         DsmeaJdkg7faxGR2WlOr2Q2xOqCK3LhvO83UpvhTPjbrrDITVXe01nU0HW2zIBGLSdNK
         x+SI4S2qeU3EY5SopL7X1UD90wHcT3WjJvLfVVsAO2U5Em5d1XWCXX0PRhRjUwlFbFjC
         /RhNOl/qPgtup89fKy/XuqC10uHh8xb2p99SAbLCDPTbSVvO8tHFnVGOGXPs57VzLKHy
         z3pNrxrHAv/ZVQFSEpVOjEocb4Os2eKubiclJ5LN8KBbJgdGF3NkBVCWlJGOm0DbvFTa
         Y1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CooN/lA7d5yACqkmjNxbvElnXH9xWYc5D690cPagV5A=;
        b=l0oSa+G/QtPT5kDUbOwWxEBl4LTwntX7eyh3L4wty3DgSMHkpAl7cH+u6V5EAIUQJD
         1vrhDtyB4YgYL7PbcwwksUK4u/c6JEZOplQBpgR5Y98kdu+7peJEidmNcJnfEXkgJEwA
         qrQAS1zVZQRdYVQFhDqUZzflwdyMUerRbSrZmzFqSU63BntgwakX5KeqO/+gzteHGyGm
         LZSEh1AVu5A/t6s6w9RgkWyMR3p9WDj37vTtN6rRdbJOLqP4PiwLx+9FdCu8Hh3yPfyw
         nHQSR3TCtZ70nKLPJavmhc0iEbCLyzDhoaUPlDCVWY5o1rXy+qVOWdCn8JtVlcXUVbhQ
         +lkA==
X-Gm-Message-State: AGi0PubhlfbSuAbZbGEDq26FeJTLMgE9y9xLVjN1CbXyfUzj71ibbqC6
        2J1aDx/pUiH644DMZvksjwCqd5wBmBEa9OGcQS+7mA==
X-Google-Smtp-Source: APiQypLD/fNDqtD4u7+uuQ8ZqMmHjJHk9/rbkJ2Ows6MzWRJlKEVAAUCTvzeqzTfoWN78XIJxBngK/onAWpgkIOJt00=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr457241lfc.4.1585335716191;
 Fri, 27 Mar 2020 12:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200317205017.28280-1-michael@walle.cc> <20200317205017.28280-13-michael@walle.cc>
 <CAMpxmJW770v6JLdveEe1hkgNEJByVyArhorSyUZBYOyFiVyOeg@mail.gmail.com>
 <9c310f2a11913d4d089ef1b07671be00@walle.cc> <CAMpxmJXmD-M+Wbj6=wgFgP2aDxbqDN=ceHi1XDun4iwdLm55Zg@mail.gmail.com>
 <22944c9b62aa69da418de7766b7741bd@walle.cc> <CACRpkdbJ3DBO+W4P0n-CfZ1T3L8d_L0Nizra8frkv92XPXR4WA@mail.gmail.com>
 <4d8d3bc26bdf73eb5c0e5851589fe085@walle.cc>
In-Reply-To: <4d8d3bc26bdf73eb5c0e5851589fe085@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 20:01:44 +0100
Message-ID: <CACRpkdYwqReW+UcY=4S3ZnC+jFeVr=e+Ns12A_CK6o7VBUXHbA@mail.gmail.com>
Subject: Re: [PATCH 12/18] gpio: add support for the sl28cpld GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
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
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 4:28 PM Michael Walle <michael@walle.cc> wrote:

> For starters, would that be a drivers/gpio/gpio-regmap.c or a
> drivers/base/regmap/regmap-gpio.c? I would assume the first,

Yeah I would name it like that. gpio-regmap.c.

Yours,
Linus Walleij
