Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92C51323A2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgAGKdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:33:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36613 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgAGKdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:33:08 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so54165076ljg.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xC5eckw6LeHTQNvUicysdWSevFLO+gQO55vJ3inC8GY=;
        b=bgo00NBNQ7QeyKuZRI5207V4LPSEALLJbm+Qn8vuLgkKgv9K+TOeYbAKoo0prDns7G
         Jo+GtUnSf8YRyZD439tshC0l3HXLYNCzZaABHf4/caPDYRbEBVMGZxBbYdK8dkfJ3nVw
         VrP0iudXFKJQRttAp1ZGziwLfB7y0if/JUc6vRi01i5kcyNjW6GRIhwsU0ATWv6YooWL
         htma5HJh7LVrwR9jQnh/+I1KnCsSmRH310YNZ8sJSZX9C0nKa97voMLY9cwlEej0YtwC
         r7QkfHmPzfG4HBCqluj4LpxzlkZgrteCAf3zUUEDWFuw5wn0bQ+yld5e/FpGL/NUsdzH
         RBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xC5eckw6LeHTQNvUicysdWSevFLO+gQO55vJ3inC8GY=;
        b=J3BaFzXCLNEJwFoZpDuincuzZBv2w8QKcjF0a/ciH8RNgRdGOMIV93YqUj1Z09HY+6
         PDbM4myeFJcCdP0VYqwGCxyIDHyJepEKx2fYpkY1WYGtQsL8esR6UhwK3cOSOVlrmMut
         w5JlXFZq/LZ8nwbQFfd0Z1orQfhUzJZ5OLCDDjDp+9gQjU6hn/3kvxclHSb6EQe0qFu0
         fDo1ShsGOw0dqbIWDINPX/X97uH0icA2UmVKMxU/u3+dZzSoKd8V6RPItfwCtpkofwkA
         VoxlJSpoYG1S3xryhy9TOpZ1GEu1159hBRZwAqv4ikhvWER1CPr4THoD3za5hwDR735k
         DxPg==
X-Gm-Message-State: APjAAAUK0guLdwDGZXTY6SX+pDUEUifpsjyEuC4OU0PMDkwmcSZjesHl
        D/tviG5QNOJPKi02psqXhDeFsLxXzo0wDXEEQBuo3vCzHzM=
X-Google-Smtp-Source: APXvYqzCDMEvzHlBYQDhP4F32AbSocRmoqo2rsOS+sKUN52oJaPqCY7ScGRgE9GJ3dyK1pDScgA8Sz7BOyh2aT/z3qg=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr64129889ljm.218.1578393185295;
 Tue, 07 Jan 2020 02:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20191229013059.495767-1-linus.walleij@linaro.org> <20191230102021.GF2628@lahna.fi.intel.com>
In-Reply-To: <20191230102021.GF2628@lahna.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:32:54 +0100
Message-ID: <CACRpkdZONfNCPwTn=Ou7LU=+fPjDXeGGN8jkCzgRLkK2stKeNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Pass irqchip when adding gpiochip
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 30, 2019 at 11:20 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Sun, Dec 29, 2019 at 02:30:59AM +0100, Linus Walleij wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >
> > Set up the pin ranges using the new callback.
>
> Maybe have this one split as a separate patch? Same what we do for
> Baytrail and Cherryview.

I'm afraid to do that since splitting the semantic ordering was
something that broke a lot of times already, I was under the
impression that doing the two things (moving to the callback
and adding along with the gpio_chip) at the same time was
the only way to preserve the semantic ordering.

But more than anything I want someone to test it ...

Yours,
Linus Walleij
