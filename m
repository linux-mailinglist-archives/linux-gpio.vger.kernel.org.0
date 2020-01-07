Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A641713232F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGKFE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:05:04 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43483 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbgAGKFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:05:03 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so38448224lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=awClw5OAQIwoGJ1RZz6WGsXMCWNAAQaZn8rQr6h6O5s=;
        b=x5KxWlGe7nbe02Q9as2w62MXuN/BIWWDnrFUKqM2bPddubzze64XtDbRYCeyDm6rm2
         qi8wSDPT1ADgriXyfveliTg+kLK9wl2nA2natoUTp7Vz1aMtCjtkfVOQZsI2oIrTzs/Y
         u+Ssk63d3rThpDc3d7NekeZWAHe6VxuaExN4gw5bpiHDM3ScGcQnr+aL3ZB9/y9QyztF
         k9KAajHdQXFlj1F9/3YBkmp50in8DKYhFWiL2WRI7eCHceWKtbDHQs85UQoDOIZpw2jz
         j9aCHM2u7r97AS9b++W1qiREBX7/RzZeT8D21s4TYx8uTUqV9QlpjqDnlubbqfc/EkEI
         fSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=awClw5OAQIwoGJ1RZz6WGsXMCWNAAQaZn8rQr6h6O5s=;
        b=KOVSM+R8/n2uJxKfFoW077SHPGWlWwnUS9oVDpit3GneD6BGx7rU/+JAcDm66dVj+O
         8MYmi8Tzb79e5rYMKSPbG2UVGvdjR/POwH1D9Wb18jD7dPXx5iEfukzo8Tsfw25KIwtB
         zKStC+F4GH/hY3mZVtIlXTioG33NW6Ojeo/OB7FVMm6NmbbWygLtTLOkoXR2xmPRn7e3
         U35eWdHyM1jJgmAlmj4a2vX5D0hwIGLhK9ufJUKfw04k3jKvWv/KrbHU/b1HxgosC7T6
         RTA739cNb1RMDJ7BpU3AUAJlT4AcoPGURFma0F/2hYrFGnHk5Z0JANSWg0Ij6HZyrEhA
         8Phg==
X-Gm-Message-State: APjAAAVpFQRz2m9DV7tx0FQyvzsOUtrVQIfEN5KBDCiWRKO5VVYw4Szp
        Ibyk/1K4otNiBJnSQghldm+Ag8bNZNOwwS2TvFqaoA==
X-Google-Smtp-Source: APXvYqw0j/84MKECKcv0/Q78CRciq/3n0s13Yasvj4qWuUXq74vhfWWyeCyqp/+mpqyYZnb4UfHpt8+hrdDc7TszrfA=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58196144lfi.93.1578391499976;
 Tue, 07 Jan 2020 02:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-7-brgl@bgdev.pl>
In-Reply-To: <20191224120709.18247-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:04:48 +0100
Message-ID: <CACRpkdb3kE3Pkzgb0tg03BW-hggbDFez7ZWt5XZAuMZsqGO0xQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] gpiolib: use gpiochip_get_desc() in gpio_ioctl()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Unduplicate the offset check by simply calling gpiochip_get_desc() and
> checking its return value.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
