Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B292132574
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 12:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgAGL7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 06:59:01 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38452 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgAGL7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 06:59:01 -0500
Received: by mail-lj1-f193.google.com with SMTP id w1so32465139ljh.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t+RjLA1nu+UarfxlPRBZDGYPPkFySZnZrIRRIWUIMtU=;
        b=NMzuTRGgyu2V1U2Ya+o+byXEakfTmtpwvAvhcwv7MAWttIFE8nLJ9fVOLLK2v0joeD
         YRx6ySZYaDLLJUkQjwuqLoNYn+pHipZHr+vvHgi/2Gn+wCxSpT0vG5YLxQLnva0EPlr1
         KmACwIBIzIVFPleHkwQqmgTOCsNoe0484H5wRgEWMluuNRsBBmrh0mFVczIfwNhws9HA
         E5HVT4KB9hjLdfepHPqpw2UsIigGB2++fEk+SMre9q4CeMsKPfsz5DRw7V5Ohy306I0+
         0rPo51/c4gjCRYdEKgU1fyg/8ibJ3oSwGcei2oKqLGVANF3gulHRtsFw0L2c9pM4EdVU
         siow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t+RjLA1nu+UarfxlPRBZDGYPPkFySZnZrIRRIWUIMtU=;
        b=MvLSfRJNSq8jFxJkPaKTudK24hENnRsQ5Pzzrul59e5iMIu/uSSRt525S+NnwUEtpQ
         Fk4ZFv4pZ0RShUOWv5aeJETitN+DDQoMVfqKZXT8H5HrO7w96cmxoFHsN6AEU3TH0Y3X
         R16WgoVc3GY/0RUIQah9fdW/iKg4NbaayKI6CSNcNcgRTYtlytfDg5LAxkD6fTZICsDE
         CPK1A2QfwmnFsLhFa+8sTAQyNiso+JQwayFIzhphNQzc7lu2yjn2fdZj5Rg14RfjcRog
         TPbT2BHOYBQ9GiFmgSlSIR0XJKtmyLfEhq6xBBxszhwKa1fqoXVkbrJteEB1n4r3q3QD
         vcmA==
X-Gm-Message-State: APjAAAURvMJjSOG5P3e7FXORasZNbkcQ1dTDkszZ3wXfM1bYwzF9GA6/
        JugXx7RuuZNoHNZSZRJjEC9YtNC+5H2OrTe1M3DFhQ==
X-Google-Smtp-Source: APXvYqzmZNZYK7BCEuoCF3uU03mrF91sLuPTkgtI16O1cE7YJ+XdbyiUKr82lO1llQvYDUT4AbK6PUOF3qwIQ3xjNXw=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr52181964ljj.77.1578398338600;
 Tue, 07 Jan 2020 03:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20200105160357.97154-1-hdegoede@redhat.com> <20200105160357.97154-3-hdegoede@redhat.com>
In-Reply-To: <20200105160357.97154-3-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 12:58:47 +0100
Message-ID: <CACRpkdbbtzdq7EKMV1WW16t571sXvQZ3MbbixcT9yx2NtR01dw@mail.gmail.com>
Subject: Re: [PATCH resend v2 2/2] gpiolib: acpi: Add honor_wakeup
 module-option + quirk mechanism
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 5, 2020 at 5:04 PM Hans de Goede <hdegoede@redhat.com> wrote:

> On some laptops enabling wakeup on the GPIO interrupts used for ACPI _AEI
> event handling causes spurious wakeups.
>
> This commit adds a new honor_wakeup option, defaulting to true (our current
> behavior), which can be used to disable wakeup on troublesome hardware
> to avoid these spurious wakeups.
>
> This is a workaround for an architectural problem with s2idle under Linux
> where we do not have any mechanism to immediately go back to sleep after
> wakeup events, other then for embedded-controller events using the standard
> ACPI EC interface, for details see:
> https://lore.kernel.org/linux-acpi/61450f9b-cbc6-0c09-8b3a-aff6bf9a0b3c@redhat.com/
>
> One series of laptops which is not able to suspend without this workaround
> is the HP x2 10 Cherry Trail models, this commit adds a DMI based quirk
> which makes sets honor_wakeup to false on these models.
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Use honor_wakeup && ... instead of if (honor_wakeup) ...
> - Fix some typos in the comment explaining the need for the quirk

Patch applied for fixes.

Yours,
Linus Walleij
