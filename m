Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD58AF969
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 11:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbfIKJsx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 05:48:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40885 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfIKJsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 05:48:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id 7so19331144ljw.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuIkQgmeG79jRGh7Mc6IT8LtcxFI+4dknLktYiNBnXQ=;
        b=L9hidE0N4xL635hxcw9vlTRN7QAXwa1tqbNMX0wqBdiziEeeduIzzj5gjKcU30qXMF
         TFqnXs8FCbfOm+fVCavj1OS1SzMYREAvulE86OrDE0p5iOvMulbwW8m4eYToFexmptsz
         23eFNGaQ08ASPLBT6puN/H+I4MkXT6hGck9KM7deGnikBQTV2GBknCM95yBcopwqllrT
         rsuKn7sgfuTeCAwKGkwmMpruRXj5BB6MNudqZFw31naU+IvGuEt5rcqBtl7T7wxHyc8O
         mvpU73lwC3LHTGm9RFJveDA0RpvBouBFJh4b1dJD1YP5YwFK1ee4iDxY+PTXB1+ZHL6m
         W9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuIkQgmeG79jRGh7Mc6IT8LtcxFI+4dknLktYiNBnXQ=;
        b=d6pPJOrlh+FlDd2zcDESUZLYThAkUvijYkt8lOzh2NoiuXLRAtNGJE3FAa65hBsPFC
         PVcpV7VBnoVI7JRhX6OshIouAVKs2Lz57L/cP2Y1/p2ydp00nZeUdMI8nDjxAbZ7GQzE
         q0cbUaTIu6KeFoOCNge03aPwZHT82X0+t7LS2eGN/cT/I5I/C9fjhKQ8pN+sfzJ2oXuW
         ycVyNCsP9KJSAq+GmISTaoy1gsqYNQ+054XlrP6YUfbeqV3TbXnlQ2yGu0Csh9VrpVX3
         4XLWWlWjjYVd1MXs42FZzl+17umVBfW4d+Tx8i+WX0hMWeE7EQGQzJZaImrOTlkAVwGx
         cuWg==
X-Gm-Message-State: APjAAAUJQbSecbaG5ptlkiWQFztj7tFjF7Qa1Pptt6QE2tyiid3ATcP0
        B74zxfMqiG60JUhKxVZ5lRYikPuDgCpI9y1AjtgJeQ==
X-Google-Smtp-Source: APXvYqxvSRgGJGGfqxnn/UQNSNuz2YWRG/RHGlr6VjiTObudPBZcAs4WawR+xtXm841ztLt8I5JIM2db6KbSSn01jIk=
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr15586230ljc.28.1568195330701;
 Wed, 11 Sep 2019 02:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190827202835.213456-1-hdegoede@redhat.com>
In-Reply-To: <20190827202835.213456-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 10:48:39 +0100
Message-ID: <CACRpkdZ+89GMj0qkU40pR6Lhog6u_bjJe+8L0wui=Huwc_8KoQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot
 option and blacklist
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Daniel Drake <drake@endlessm.com>,
        Ian W MORRISON <ianwmorrison@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 27, 2019 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Another day; another DSDT bug we need to workaround...
>
> Since commit ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events
> at least once on boot") we call _AEI edge handlers at boot.
>
> In some rare cases this causes problems. One example of this is the Minix
> Neo Z83-4 mini PC, this device has a clear DSDT bug where it has some copy
> and pasted code for dealing with Micro USB-B connector host/device role
> switching, while the mini PC does not even have a micro-USB connector.
> This code, which should not be there, messes with the DDC data pin from
> the HDMI connector (switching it to GPIO mode) breaking HDMI support.
>
> To avoid problems like this, this commit adds a new
> gpiolib_acpi.run_edge_events_on_boot kernel commandline option, which
> allows disabling the running of _AEI edge event handlers at boot.
>
> The default value is -1/auto which uses a DMI based blacklist, the initial
> version of this blacklist contains the Neo Z83-4 fixing the HDMI breakage.
>
> Cc: stable@vger.kernel.org
> Cc: Daniel Drake <drake@endlessm.com>
> Cc: Ian W MORRISON <ianwmorrison@gmail.com>
> Reported-by: Ian W MORRISON <ianwmorrison@gmail.com>
> Suggested-by: Ian W MORRISON <ianwmorrison@gmail.com>
> Fixes: ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Use a module_param instead of __setup
> - Do DMI check only once from a postcore_initcall

Patch applied for fixes, thanks for working this out,
sorry for slow reply.

Yours,
Linus Walleij
