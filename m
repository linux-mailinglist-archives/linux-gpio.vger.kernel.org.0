Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974221323B3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGKfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:35:30 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35403 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgAGKfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:35:30 -0500
Received: by mail-lf1-f65.google.com with SMTP id 15so38527534lfr.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9L6amKhoYyOrux9bnk+af4N4r2mBmGPfOuS8aRLMwhg=;
        b=b3uBNQ9bL0Rm0U0fYnJKypGOuWiZl+gYV3Zab1iuTg+6OVZlBzuFugeCNw1MQTCFkN
         3g54n3ju0EKUXogzFtXgt9xSBLz2zNbeoKAx7o3LzBdhmnQIVQ7fXB1R3MJlsbbnIpEc
         Td0NHo20vQ6szBG2bWBCkJx9rt/WUX30CqdQKpxw53+edrtwryaUWeFUnCACCEhUolaJ
         MtPBNVNqkqD+OGmtWv9INMWt6bRyGteMhAYtku/o8/bPQy0quOn5PE1P4MJeiTIbPHPj
         ALu3+vvLSEQPa4knxZt8cB4DuXmTgFK6kdL50DcdLKBE1qJMpj6gWXbJUQjLUKNQdr9O
         2ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9L6amKhoYyOrux9bnk+af4N4r2mBmGPfOuS8aRLMwhg=;
        b=FmapWobLmWPBVpKohLdEDZAVFNWtMZZcjCUYSvEQGOzpovyFR31ger177AO8girzr5
         d1fzjnbB9cwjH+1qbLYYuEe4LlxaCMPfavwxLkSqxnINk/+WzFQHCp3kqvCCNAYl15nf
         nc0wETJrsHDtdbsXKjQQw5TAIuwRGRQt+orw2RD8DT4BztPrPOxOPypIbSN2GQ46ktPw
         HDRQbpiVKNbqozF0h6t2AswtGaomq5Tm8wH/Mw1dsJtIuvNdCDK/UAFBEX0dlpZ6Na2t
         1U7dxnUHuE9rR+kp4LuOT3PXHEG2Sz+h8jFdW5OwcPPuWdEw6B4k+AynZy6itMHdnY1e
         uZSw==
X-Gm-Message-State: APjAAAXN0d8+QoW1YVVredm5f4xslZ1VOm+9OSYKB/M1wN/wJY3a8aMa
        c1/lVVkgzGJs4wRtTnkw70eL9246LkTvvaIP5lEIww==
X-Google-Smtp-Source: APXvYqwnBmZ4C+qwBklDTAQj/VsW+ZK44EVkNgdlyTwnOhfThUt0pp3AtFsnFlSbQJX3beIx2opfQ6TrxZqyuOD8rVs=
X-Received: by 2002:a19:c648:: with SMTP id w69mr58975631lff.44.1578393328640;
 Tue, 07 Jan 2020 02:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20191227230447.32458-1-hdegoede@redhat.com>
In-Reply-To: <20191227230447.32458-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:35:17 +0100
Message-ID: <CACRpkdaR4vFp=huuqvsnZTFnAmKNJmjpwM8sPpVX2aERp-LogA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not clear IRQ flags on direct-irq
 enabled pins
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 28, 2019 at 12:04 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Suspending Goodix touchscreens requires changing the interrupt pin to
> output before sending them a power-down command. Followed by wiggling
> the interrupt pin to wake the device up, after which it is put back
> in input mode.
>
> On Bay Trail devices with a Goodix touchscreen direct-irq mode is used
> in combination with listing the pin as a normal GpioIo resource.
>
> This works fine, until the goodix driver gets rmmod-ed and then insmod-ed
> again. In this case byt_gpio_disable_free() calls
> byt_gpio_clear_triggering() which clears the IRQ flags and after that the
> (direct) IRQ no longer triggers.
>
> This commit fixes this by adding a check for the BYT_DIRECT_IRQ_EN flag
> to byt_gpio_clear_triggering().
>
> Note that byt_gpio_clear_triggering() only gets called from
> byt_gpio_disable_free() for direct-irq enabled pins, as these are excluded
> from the irq_valid mask by byt_init_irq_valid_mask().
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied as non-critical fix for v5.6 with Mika's ACK.
(Tell me if it's critical.)

Yours,
Linus Walleij
