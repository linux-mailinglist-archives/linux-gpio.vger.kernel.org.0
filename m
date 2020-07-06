Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9361F2158BB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 15:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgGFNnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 09:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbgGFNnp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 09:43:45 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB62C061755
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 06:43:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k17so9828964lfg.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ZahM7Yr44SU5G4elgPNU/cMSCBK0Eu0ZifqglAE0M0=;
        b=P/aUAtm/tFGpzsfTzKMRYPkdtajs4T/idDOI7xAoDqLA2PEMTQxY6+Y/v7ArpcGDfW
         esfJDlMgBEm7Pdc3xR6yIGICzl6gCCw3IzTcwk6JUvKOoqbU7quLJhtLk0bZqgId37R0
         P8Yuz9p3qh6NcJDVu69ZQW7iHTJ9Xmk/Wub2jmSswJOBxu/Yb7vISf25DjilweEDnE4/
         eUhaFFuFVTDu+ho/4y1om765T3Ykz9xjCYgcDYlAFkMKlQfoX3n8/uVxTk2d8OMVW9Kn
         vF1cp7irWSoDv8C0C/4+U95Wudv0r5KCnpnCy1TU1PMkBdldpW9DXYJXWUEe2T4sP2nR
         Kwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ZahM7Yr44SU5G4elgPNU/cMSCBK0Eu0ZifqglAE0M0=;
        b=bW5GxJyH903E5aWXw1Y9NU3FqJzdUj1eg5PkidSrxG9zEiilstboDGPIkFfa0FjaDH
         MSXY9ffcqFqlEopYDORfASixbjm9UXmHTgrxdxv1ozFU80pmBgg/O9n+vgPKhvCICUBI
         wsqy4wrQvsL4/vO4X1mmxo4VszmXSbgZS9y2ojfi8cZxAxOxJFs+BQD6X/Ca0KUXBYS6
         /vjKsAm1u/eJu/7enKv/0CumnAWO4wQjcuIF38oLEa7uP+epNm0SpSgomnJwPMnZ7APD
         zuBifAAsZvaLYifF8dzVpZLODrIH6FkSWH+klQ0kzJJ2UG4qTYTDdb6Ja1XYwzfuuq7O
         f6JA==
X-Gm-Message-State: AOAM532Q0RhMjgdwsx4aCZg30jpJQpZkSk4UrC7As7RCQZBarL7d6d+/
        UuATJzuLpkPuN3cwwxIjMWag37HLs+70CodR4ja4uQ==
X-Google-Smtp-Source: ABdhPJw8e80/eWLpV6gwgoIz/sHrkOuXvvZI9FvTptLCKHah86SZpGeMmH3LkHs+e257JHG0Plnwp8zGu8i10sVVYi0=
X-Received: by 2002:a19:7407:: with SMTP id v7mr28618070lfe.4.1594043023870;
 Mon, 06 Jul 2020 06:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
In-Reply-To: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jul 2020 15:43:32 +0200
Message-ID: <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
Subject: Re: [RFC] GPIO User I/O
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rodolfo!

thanks for your mail.

On Mon, Jul 6, 2020 at 2:19 PM Rodolfo Giometti <giometti@enneenne.com> wrote:

> 4) Then users will find a new class with entries, one for each new line:
>
> # ls /sys/class/gpio-uio/
> bypass-1  bypass0
>
> 5) By using the attribute "line" the users can get or set the line status
>
> # cat /sys/class/gpio-uio/bypass-1/line
> 0
> # echo 1 > /sys/class/gpio-uio/bypass-1/line
> # cat /sys/class/gpio-uio/bypass-1/line
> 1

This interface is problematic because it extends the sysfs ABI which is
obsolete. This is why the documentation of this ABI has been moved to
Documentation/ABI/obsolete/sysfs-gpio  for many years.

The sysfs approach has several problems which are summarized like
this in the commit where it was introduced:

commit 3c702e9987e261042a07e43460a8148be254412e
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Wed Oct 21 15:29:53 2015 +0200

    gpio: add a userspace chardev ABI for GPIOs

    A new chardev that is to be used for userspace GPIO access is
    added in this patch. It is intended to gradually replace the
    horribly broken sysfs ABI.

    Using a chardev has many upsides:

    - All operations are per-gpiochip, which is the actual
      device underlying the GPIOs, making us tie in to the
      kernel device model properly.

    - Hotpluggable GPIO controllers can come and go, as this
      kind of problem has been know to userspace for character
      devices since ages, and if a gpiochip handle is held in
      userspace we know we will break something, whereas the
      sysfs is stateless.

    - The one-value-per-file rule of sysfs is really hard to
      maintain when you want to twist more than one knob at a time,
      for example have in-kernel APIs to switch several GPIO
      lines at the same time, and this will be possible to do
      with a single ioctl() from userspace, saving a lot of
      context switching.
(...)

Another thing that is not mentioned here is that when a character
device is opened it is automatically closed if a process crashes,
which means that kernelspace can do clean-ups and reference counting
and making the lines available to other consumers (like if you
restart the program).

With Geert's GPIO aggregator userspace and device tree can conjure
special per-usecase gpio chips as pointed out by Drew: this is
very useful when you want some kernel-managed yet
usecase-specific GPIO lines in a special "container" chip.
To me this is the best of two worlds. (Kernelspace and userspace.)

Yours,
Linus Walleij
