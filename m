Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C99E9CCA16
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 15:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfJENUX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 09:20:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45481 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfJENUX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 09:20:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id q7so5344742pgi.12;
        Sat, 05 Oct 2019 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sV9B8cu+ZbyWOOsD5NwDJjr2JULL45nTXTTkcjmhD94=;
        b=QvTPwQtBYESm08RRFpIIiO3f2u4BuEVt1Sr4+JDccVYKZijjJpNnUV3S/Ukuqk17lR
         xqThrUEuZsHQRtBPbkbfuy6q0qSh+HHpvu+IyixAjBq2IAMtnByuaXBORbSVjZUkmkJi
         Ycb/kCQBWOdwII5gBNokiurVrGAbJgtmKbTbQN10RYh2ZIjFAb4fJFhpwJ72kGPjZ8AK
         0bGsImNAwKSTiTI6fKE9yyHMSDSh5Q0TJ2VeF2aCfFYA8/4ijUrMnhx+5hhAb2ItaNEA
         jeRTIknXk7X4A3mOAU/dSQp/CGwhs34BRtyxtg1TjGbjetfz8YaPyqlc7qPOHrPYH3fR
         kIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sV9B8cu+ZbyWOOsD5NwDJjr2JULL45nTXTTkcjmhD94=;
        b=qlzjlh0/FkBRukrPBzP5u6B/iLL1+vmDnT7rIalSSz2VjdGn54O/ypKBBzLF2bqFYD
         C2ZUlhJAfxjrMYUWQ17pQfY0xIpxHVqqXqDS8OXe+pBeFQelRjugeE8AiXzTd3Nug+v/
         TjZtWYW1t+Y4YI2hqWMrkupiP6xPYEFKWznV7rwfKB7w1stGQ24zNB3/44OLOsQA55YF
         WWAVH84JsyWQPahOoaKIJsIp0F4TISm74a8IFb/ig6LGI17s6NjTayj/zcy7aGUYo8LP
         LlezoKJ67q285dWoxk8bc3mCcHcJqDBdFmIKQhfJpUjbvhWnXD0L7lpRzw+9ZGZQ4dZ3
         AQrQ==
X-Gm-Message-State: APjAAAVlW4edbEk4lRRPC6ochOD7vjFaUVWAvwlRz1PYXPcQKwj4kcuL
        RmkA/xjfwEel8xZgx6F9x9K5QHPJDr23Pf41Bdc=
X-Google-Smtp-Source: APXvYqwtLhISTnAJK5v4FpagNEp+5+N46HKWJBPsjjtMBY51a9O/AAVrVEFHdVixoixV3DrfyO/OedFyeOH3Fk/XoP8=
X-Received: by 2002:a62:524a:: with SMTP id g71mr22866557pfb.154.1570281622712;
 Sat, 05 Oct 2019 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com> <96ac332f-359f-531a-7890-45b39e168b82@gmail.com>
In-Reply-To: <96ac332f-359f-531a-7890-45b39e168b82@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sat, 5 Oct 2019 22:20:11 +0900
Message-ID: <CAC5umyggUm26JHU9QeND=rTozjXwH5uMiVvoK=Zqo31eBn69pg@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2019=E5=B9=B410=E6=9C=885=E6=97=A5(=E5=9C=9F) 6:17 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> Hi Akinobu,
>
> Why do you think this change is needed? Does it solve
> some use case for you?

It can be useful when using with an LED trigger that could set the
brightness values other than LED_FULL or LED_OFF.

The LED CPU trigger for all CPUs (not per CPU) sets the brightness value
depending on the number of active CPUs.  We can define the multi brightness
level gpio LED with fewer number of GPIO LEDs than the total number of
CPUs, and the LEDs can be viewed as a level meter.
