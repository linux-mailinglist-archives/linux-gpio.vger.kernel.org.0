Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333D429F5B3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 21:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgJ2UAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 16:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgJ2T76 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 15:59:58 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770A9C0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 12:59:58 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 9so4302908oir.5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wLa2ZHCXHWu0bt5VmwEbsYdLxajAJVN4w/GM5byMaUg=;
        b=datsJVpPzeYFAZ8ec3rDhSvnG/UwVqhf99XQ/1HFEA9OGgE4uRxNr11zMM2QdK76/2
         AfbMjvWceUnySG3jldV9cmSfKO/cvAWzfs67UV+PF3hJvIdK9aCKKeZpiNdd5U3597En
         iOuI8rB7ekEWOURZNlhq+3UaP9UBVySGZ8qpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wLa2ZHCXHWu0bt5VmwEbsYdLxajAJVN4w/GM5byMaUg=;
        b=b0yD63yA+30Xsf6yXTKZ23jENXhVLUWXU4CQE3piE2LeuRg4QjJCpqlJcGnxg9bsFH
         DtMdAlED9DqX7sKIyzNLIncyfXVTknrGMG1LlKIdpk5DVH3ss0Afia3XIRZ6pnq+VLcv
         AMbAQbSJqswWtYP0Wxur2cvKMD7Hl0e5vX0u+BLGixkpRzQDF5EjIdFkYY+5SrLfgviy
         iY/j+7AVVbNU4/nzgTbmdw/WyFeDN5fLsHHeqzRH2Y2YJH9vy+Qo1rgSKHgl7xPKJg5q
         MfSi21obI+/6grliE3u4b0YBxFu70J4cacgkLsJG0WdVmOLiaEZ6U7XSEZmL4qRnLOTE
         h6Gg==
X-Gm-Message-State: AOAM532UrrAPitIgcq9yfV4mgY3on1UbvtXVHLcJkJzwaY1h0oGHV5Y9
        gJCqUbVCQ1mSAu9Ek6aWwMpQgf02q7AGcFch
X-Google-Smtp-Source: ABdhPJxlRhxUWz+y1ze+DtOuCXMmshTPkbKohH132jaWRg6aG3jkYHT+H5KL1E3eLwItfZ4NXB1vnQ==
X-Received: by 2002:a54:449a:: with SMTP id v26mr634501oiv.16.1604001597652;
        Thu, 29 Oct 2020 12:59:57 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id n62sm784660ota.74.2020.10.29.12.59.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 12:59:57 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id f7so4316441oib.4
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 12:59:56 -0700 (PDT)
X-Received: by 2002:aca:cc01:: with SMTP id c1mr957490oig.128.1604001596307;
 Thu, 29 Oct 2020 12:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201029193243.61546-1-andriy.shevchenko@linux.intel.com> <20201029193243.61546-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201029193243.61546-2-andriy.shevchenko@linux.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 29 Oct 2020 20:59:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCseRCUVBV7SGZeuuyUyiFBmDYQ1D_DfXoEXXMaRxgvzzg@mail.gmail.com>
Message-ID: <CANiDSCseRCUVBV7SGZeuuyUyiFBmDYQ1D_DfXoEXXMaRxgvzzg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: firmware-guide: gpio-properties:
 active_low only for GpioIo()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 8:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It appears that people may misinterpret active_low field in _DSD
> for GpioInt() resource. Add a paragraph to clarify this.
>
> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> v2: added Rb tag (Mika)
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
