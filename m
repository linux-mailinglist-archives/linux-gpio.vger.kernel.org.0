Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1FB10C5CB
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 10:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfK1JRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 04:17:15 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45632 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfK1JRP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 04:17:15 -0500
Received: by mail-lj1-f194.google.com with SMTP id n21so27628691ljg.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 01:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAhyWvAj0DllZ8ve6+5K9EM0d7Du36EBTTCNiXlO/bA=;
        b=F+EDIJqH7d7OyUqXE4dFcF9L8aq9Hiz8BzLIc5zJNa+4xI4ZnlPt2vrAyeWOyrxbqT
         k+40jGa+ckr2SLe0lxl2tPiNeHkQ1R9ZZ28kzma0PxCzyOmLDvgTikVPzoQpuRLxVJcG
         sACru+xRlqyI6I/TGfMl28B9tEfpeQ6XVt9TxDxh/eZZDC2tS2TJstDZHPnyguKkaL3X
         YBk65Dsk5b6Ld/xpEsM51S9klQXIC9A+DjLTlXwrer13B0T4MYZGfWekcQJ7KFyWjTWP
         9FxhcRaEAf+RvklyTTBXn88youOXTVXce2j9TWt3XXm0fZkRf0MHuVFSqkw3TSRR7kut
         7hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAhyWvAj0DllZ8ve6+5K9EM0d7Du36EBTTCNiXlO/bA=;
        b=DTMj6G2zxb/JKeJUGaCsmXlNUEhNHavH18LsDaRKsD1FGIMmPk7PGo/nbrvchyLcKg
         DEWIc5przxkKIbdnXPVKZWX3W1lF0XhaH64TVsRSfMqLAuRgciyK7eYFgP7iTPeFrABc
         ozfipQz7g/bR5Be4xInc8MkAVaxeteEUCmY/4onzRGlcfnBqHdC6EWfWNj0LAKbCU/XJ
         sBCJ/I1FxsV75qRzBZImdIDLYmOvmMX7fmrVKYiiNyHufkHXKcNL6iFqY0Saqqn68Z+l
         n4tmwHfxoWA7QTAiqjB8b+qgnX3S2Bh1adQMOGON+P8l8Btms0Ctd8KFE/rX95y9xFDW
         anFg==
X-Gm-Message-State: APjAAAW9wI2eQCF+dwZ7TnV+f0YISdthJs+I8i3VHHIzRQyRJl0mwv5y
        y0kFA6agTEBqOoARb8AC6Cf7AHEAvZpPenyXiuI9Iw==
X-Google-Smtp-Source: APXvYqwczNmhsrp97hbeZJ/j5MP19zr5kyWzopv1KxozixDSRs+Lv9/0+NUJFNc3hmWqxOeqM3W62Yph6tHQ/JcRbrI=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr33671728lji.191.1574932633134;
 Thu, 28 Nov 2019 01:17:13 -0800 (PST)
MIME-Version: 1.0
References: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
 <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com> <943fd3dd-9090-0c7b-3010-c92c139503b0@electromag.com.au>
In-Reply-To: <943fd3dd-9090-0c7b-3010-c92c139503b0@electromag.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 10:17:01 +0100
Message-ID: <CACRpkdZ23ncXQE+aqEDeZoppToXmWV+TpnJHjVvK3nxnN78+rA@mail.gmail.com>
Subject: Re: Multiple SPI MCP23S17s sharing a CS line
To:     Phil Reid <preid@electromag.com.au>
Cc:     Phil Elwell <phil@raspberrypi.org>,
        Jason Kridner <jkridner@gmail.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 28, 2019 at 5:11 AM Phil Reid <preid@electromag.com.au> wrote:
> On 27/11/2019 20:36, Linus Walleij wrote:

> > IIUC this needs to be figured out and both the DT bindings
> > and the driver need to be fixed to support this peculiar addressing
> > scheme.
> >
>
> Similar problem has come up before with gpio line props from Jan.
> The above was similar to what was discussed previously a couple of times.
> eg: https://patchwork.ozlabs.org/patch/1052925/
>
> I'd say it's the way to solve the problem.

OK I see.

Actually this comment from Jan:

"Linux  does not support multiple child devices "within" one SPI slave.
If there  was proper support for this, this patch would be superfluous."

This is not a real limitation, we can have children inside SPI devices,
no problem at all. The driver can just parse them with something like
for_each_available_child_of_node(parent, child) from
<linux/of.h>.

It is possible for the driver to create proper subdevices for each
node or just create (I think) the different gpio_chip:s with
a reference to the unique DT node for each chip and then the
.xlate function will figure out the GPIO translation.

Yours,
Linus Walleij
