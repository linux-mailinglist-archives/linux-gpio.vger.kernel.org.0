Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D3929E2FD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 03:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgJ1VeU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:34:20 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32935 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgJ1VeQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:34:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id s21so1135553oij.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=khsXwY2FOIak2E0IL9IWqYVg7gg6o/TiC9wESQ4lpvE=;
        b=nvCl8sKwfy5MaflP71vCYy5uZwYIEw6hBOTPLMirYPIM9coKxLjYxUttQyjPrhGAW3
         wIYGldGZNGcC8gHmdV+ZWm/IqohhKrnRpZPcrTxQRcVfK0TKBfDHIMVWxU6FFW1n+y4V
         jYFhtScOr2Uz8IHzxFnLUdzAeKgHTM5DbPgfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=khsXwY2FOIak2E0IL9IWqYVg7gg6o/TiC9wESQ4lpvE=;
        b=KSCmoDc7NOo4u+I/llACMGnx5RBr2tUL9IL++5LdK6EwLco5IJb369P7EDwUYD+Cs/
         4IBp3nbBQKU5o3AObXqjb3yALsBStWIH2CmPwe3QS6hiMgYpYigJabcFaluUNkW2VOpQ
         wrGTnCIEq00fBscHkvgnXqsN1NMtE5EzRLUBPbEVWjD/Yl3LDsXLjJ1f7mEDBOx0DjkP
         AZY0m/0XnZN03EegLXtgmC6mSSLpnv+rXh5u+h8ONprKAWgo1GvfI9sP+HNtH5dr+Q3y
         zjDRZeaRn4QdUp0I2t92DqFvgC49HvzTQc6PBXCgoSBc7xIVmtlsaULuE6y6jZhWJs8S
         5Bxg==
X-Gm-Message-State: AOAM531riqT7gJaVBcwkDE5pbOxt1KSGI2/H+4JVi0L6iZdzZocLzsFS
        Zm5KFM+Ryu/iQQIDd+2ZuKYOUYEWYzG5ijQehFI=
X-Google-Smtp-Source: ABdhPJzgCUrdQ+LQTFddxZXfio+3uoYq6GZ3GmaeoJQ5Vxa5w+EasQhhMuP6cLRUT6/yXyreyLQ50Q==
X-Received: by 2002:aca:220b:: with SMTP id b11mr691926oic.130.1603919455035;
        Wed, 28 Oct 2020 14:10:55 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id l11sm136360oon.35.2020.10.28.14.10.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 14:10:54 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id u127so1032577oib.6
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:10:54 -0700 (PDT)
X-Received: by 2002:a05:6808:602:: with SMTP id y2mr686737oih.11.1603919453681;
 Wed, 28 Oct 2020 14:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201028205101.47583-1-andriy.shevchenko@linux.intel.com> <20201028205101.47583-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201028205101.47583-2-andriy.shevchenko@linux.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 28 Oct 2020 22:10:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRDwfFo9HE84iujjFe6h9aS6b3B8wkz5Rt0aO8=XMsNg@mail.gmail.com>
Message-ID: <CANiDSCtRDwfFo9HE84iujjFe6h9aS6b3B8wkz5Rt0aO8=XMsNg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: firmware-guide: gpio-properties:
 active_low only for GpioIo()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy

Thanks for your patch and super fast response.

I think there are two different concepts here:

1) when the pin has a low value, it is  0 or a 1? =>active_low

2) when do I get an irq, low->high or high->low => irq polarity

When I read the acpi spec for GpioInt()
https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf page
934, it has the same problem as for GpioIo(), it does not express the
active_low and this is where the _DSD field comes handy.

Without using the active_low, how can we describe  a pin that is
active low and has to trigger an irq on both edges?

Thanks again


On Wed, Oct 28, 2020 at 9:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It appears that people may misinterpret active_low field in _DSD
> for GpioInt() resource. Add a paragraph to clarify this.
>
> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/firmware-guide/acpi/gpio-properties.rst | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/firmware-guide/acpi/gpio-properties.rst b/Documentation/firmware-guide/acpi/gpio-properties.rst
> index e6e65ceb2ca1..370fe46c6af9 100644
> --- a/Documentation/firmware-guide/acpi/gpio-properties.rst
> +++ b/Documentation/firmware-guide/acpi/gpio-properties.rst
> @@ -55,6 +55,9 @@ Since ACPI GpioIo() resource does not have a field saying whether it is
>  active low or high, the "active_low" argument can be used here.  Setting
>  it to 1 marks the GPIO as active low.
>
> +Note, active_low in _DSD does not make sense for GpioInt() resource and
> +must be 0. GpioInt() resource has its own means of defining it.
> +
>  In our Bluetooth example the "reset-gpios" refers to the second GpioIo()
>  resource, second pin in that resource with the GPIO number of 31.
>
> --
> 2.28.0
>


-- 
Ricardo Ribalda
