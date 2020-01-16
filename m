Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085CB13D71F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 10:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgAPJmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 04:42:22 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:39489 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgAPJmV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 04:42:21 -0500
Received: by mail-lf1-f54.google.com with SMTP id y1so15055404lfb.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 01:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t85fzickz+CI0K4w663KdrCMgZJXm73AsUTA4aBM0x0=;
        b=QC8evsov/nCDvYb+KRjlkRbILmoZetrJB1NefNB+NBiuqhc9Eh26mmTCObtVccC8YH
         mnvIDgZfjAoaYCU3fVTLi8NsuUaOQtuQ7Fxj/20MaBZntnzrEdXLgt6Lp4U8VlGu87cW
         pkaLzTtWEEODn5tKePyfS/dKKuM/chNx5llcmtdlwMxZKDmwjF3HqvvjMYmimNPg71go
         AUeqhXDPtURw1WAa1l3PN7CfGXX2Nir4IZnurMClHD/hEx07dpqSUx5rU/5kQkyns9xA
         dul05O5Wj9SMgA7Iv6i0u7VYIDYuEC2vGeP9v6eeTTzxHBI3QlTVT6Hb+2yrldjwA6Tg
         Bbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t85fzickz+CI0K4w663KdrCMgZJXm73AsUTA4aBM0x0=;
        b=q+OW1o84IzQFM1kwrjV3AFdxZhquZ/jqpgCljtA24tBJtehU0oFToHkDLMT0DZLAqb
         lPdYx29o2fuaTbwaQQ7aMfVocgzBIlbkZ0+qk0dwcl0n1XWRADk41/uSU5lJhNwZFi3N
         HhxN0rT9MNoeI2gQ2BDK/JH+EPNOKvflIgfK8Yb6w7U1jBzz5B+CUtNGZWOhuvxAAddR
         44JPw1bjJKqH9rEyqhXHL3IkMY0wK8Qpoyf+NkmcjnqJ40A/i6sOj5tovBVgfSbbh/1T
         SilgsJliznFni/88jHZTRCjJsKM4aRdx8hBrakqc0jQPVz79+LIVa390W80VrAAOP8U3
         0NMg==
X-Gm-Message-State: APjAAAXztP7vZRJr3hXHxSYRZlozyrncbcK94O+Dyx6sneIJRGxS/fzM
        ty2Roep4r/XZ6u5YMJcfEdx7QiuDp/n2TvqnROzA2xpXi3RJrw==
X-Google-Smtp-Source: APXvYqxDtBr4rY116sQL75p5vtGMrsqeHaEJGb+f9M3b2dQJfW3Lvnjbmt+8ntS5/KnGvAF7/sH897WGbuTIjia37Ao=
X-Received: by 2002:ac2:531b:: with SMTP id c27mr1899870lfh.91.1579167739571;
 Thu, 16 Jan 2020 01:42:19 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xLuCqSFVnVQ-7ZWH-Dkd+w-_bJLnbSDyUip_8orhTwzZw@mail.gmail.com>
In-Reply-To: <CAHCN7xLuCqSFVnVQ-7ZWH-Dkd+w-_bJLnbSDyUip_8orhTwzZw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jan 2020 10:42:08 +0100
Message-ID: <CACRpkdayE023wfdJxHDVNtSF08kqGG6kfW7vkZhnq7OpcnmuEg@mail.gmail.com>
Subject: Re: Using Pull-up resistors on gpio-pca953x expander
To:     Adam Ford <aford173@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 15, 2020 at 9:26 PM Adam Ford <aford173@gmail.com> wrote:

> The pca953x can support pull-up resistors, and I have a pcal6416 that
> I'd like to enable them.

OK this is supported in the driver since
commit 15add06841a3b0b4734a72847a73c71fd09ebe52
"gpio: pca953x: add ->set_config implementation"

> Ideally, I was hoping there would be a way to add enable to the device
> tree, because the expander is connected to some buttons which are
> grounded when pressed.  Without pull-up resistors enabled, the buttons
> always appear to be pressed.
>
> Is there some way to enable them?  I see the functionality is
> available and called through gc->set_config = pca953x_gpio_set_config;
(...)
> Would you entertain my adding some device tree hooks to enable them?

Have you tried something like this in your DTS:

#include <dt-bindings/gpio/gpio.h>
(...)
gpios = <&gpio 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

Yours,
Linus Walleij
