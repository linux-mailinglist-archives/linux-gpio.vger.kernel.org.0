Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73A115A6E0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 11:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBLKrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 05:47:45 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39439 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgBLKro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 05:47:44 -0500
Received: by mail-lf1-f65.google.com with SMTP id t23so1252756lfk.6
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2020 02:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17X1P7t2FPFW7M4slmZioExSFdvzkpCr0KSpfhHxYNg=;
        b=aWDhzZ7UO4+EStPZ3cZ5Q7KDr3hnn3d+LksWJJjjCMa0zZHvUDMqWrNaVciDllF4EZ
         FIt8rz98AYs+DZWmXO/aPM3+POlIBtoHsZHjDZPZ9rRNe1CkhHSKWsg+ZOEDn23+V8J1
         vr/WleMJhFym/KW20IAIxn69xFvRXR/YNKp+1NHZjCt64waUSAXs6GvD/vj84BZovo97
         Pbe9AmTZzxGCi79Oxq9Ri+ieHMG48qFwJwwkLc7ONA+zZdUR5MNLWoeZ5h0b2gP20cJo
         4RGQSUGtn9NjvZ+CwuLl+VBSyO3HYb8vLDsVTjoFM6gu1CWOXcqEtk01/a6hJL494MYZ
         sd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17X1P7t2FPFW7M4slmZioExSFdvzkpCr0KSpfhHxYNg=;
        b=T7chgKqkQGDNPYkUDWE9bVmG5Gss5vE0a99na6Frp7pynWe4C466IGi2pgf3ZNcXhP
         tznXt1XsPQtxRu/QfEhtk1HcLhbLMvQRvjFYa8a2UQBNdK8mKuR3PCNuqNvPlqnHNyiZ
         0OcVlv4/W/QnDPDXVNJlN/2zUPFixs+B40SkRdVU+zY2s3ptoHtnU2qM5F2JDSuHoGxB
         scGpGf+2Wa2qVrFQFk/LrgAYVKwc6ZL5WcGl4JL+SzLqMbenw8zyfIcen46ubuGk1idc
         Hl9Y4RBTM7VxHiGudlbC5+mZAmwi8p73+R6CdP9o6Cd7U6AT+ocnjZZJR7/UpJSKhsle
         OS4w==
X-Gm-Message-State: APjAAAXLbnrHNXqwWdYpJBj6KV6gOOi6qL2yZZrRxKyqdHgD8YxJC8pb
        dzW9EXLvmUUgf1VwAPVf3c4Gi6x3G8Csgw1O8JYKaA==
X-Google-Smtp-Source: APXvYqyV4ki1Xa39qTcwrcrHZU+8mYLMB7WPx9tV1QxoNnySzNnmRTqNaZ7vdoV3Eo+RVkDXPJNgX0a7EkHhvXeMni0=
X-Received: by 2002:a19:850a:: with SMTP id h10mr6417830lfd.89.1581504462560;
 Wed, 12 Feb 2020 02:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20200211091937.29558-1-brgl@bgdev.pl> <20200211091937.29558-7-brgl@bgdev.pl>
In-Reply-To: <20200211091937.29558-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Feb 2020 11:47:31 +0100
Message-ID: <CACRpkdZNyCBxQF_pVPGENob5EKZfYjuaNq5bLNA42XjraXzNZg@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 6/7] gpiolib: add new ioctl() for monitoring
 changes in line info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 11, 2020 at 10:19 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
>
> This patch adds a new ioctl() that allows user-space processes to reuse
> the file descriptor associated with the character device for watching
> any changes in line properties. Every such event contains the updated
> line information.
>
> Currently the events are generated on three types of status changes: when
> a line is requested, when it's released and when its config is changed.
> The first two are self-explanatory. For the third one: this will only
> happen when another user-space process calls the new SET_CONFIG ioctl()
> as any changes that can happen from within the kernel (i.e.
> set_transitory() or set_debounce()) are of no interest to user-space.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Looks good to me. This got really slim and clean after
the reviews, and I am of course also impressed by the kfifo
improvement this brings.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

A question:

Bartosz, since you know about possible impacts on userspace,
since this code use the preferred ktime_get_ns() rather than
ktime_get_ns_real(), what happens if we just patch the other
event timestamp to use ktime_get_ns() instead, so we use the
same everywhere?

If it's fine I'd like to just toss in a patch for that as well.

Yours,
Linus Walleij
