Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D18711E4C1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 14:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLMNgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 08:36:50 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41854 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMNgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 08:36:50 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so1975606lfp.8
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AHKaQ18/FhzxuWyV2jzfUODmfU080YNLDhDniCK+KYg=;
        b=wojGA8QHyf/9A/9ULVK0h+WybSZ+aAr8JVfBML0RrAeuc0bYVgHj2zx8qQioAdFYeK
         uY/bGQGDY4wA5Hz2hE42WycMXnkUT8aozQoM8xxc3rDXt2IYLB+J9yjmxm8CQ6R8ROOy
         ZIJ0KuXXb3NjREgWbsCS0WcIddVY0hv13tvCcy3E/R2RtJx0110SFqYVcLscHJISWnvr
         SNQLph+L+9xYaReu6oWfrvOQ+bGUgLARL5I7I7HF0L8aiysuhGj6zQWytJ6gF5GctKIA
         G86RdgsV8JFZoWS8mxglzGQocksDO4O39ViQhvsmbTVZHWaO/oEN+s9Gdwqp7JDPP5Gb
         Fb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AHKaQ18/FhzxuWyV2jzfUODmfU080YNLDhDniCK+KYg=;
        b=ZSPMHGAxMU6tUTa8F0RBAgiL2RRW8MstUV9rL1GbClJESfBojuDifN4gtKmYJNz7i4
         167A3ffsxIBDhs3rx0i3AV9DW+XT0m1C/OzFXvT9zbEn31FGAdUDzfG41z5AWOeJUbFX
         zAvAhIB+co8YZvZU6O+4MU9Xd1QTIWtpdIkQaCty/1LoqJ9/viwK2V9Sf0oTpzYPKp5A
         BEsaxZFiLFfClM/Vbo3RNpqBcVG+g9WsCUFttZJ4UpGd4EL18lp+D911xu/u5C6kui71
         Oij/zVB/HHSl+9Lc9tFv/r2R2EVB69/lWEnjGW3qgxn/DgRxxsJ1nqsPh8jbdeMyHI9C
         qgcw==
X-Gm-Message-State: APjAAAW1C8Y0nHC4q4PtvW++pWg8HhAE3F3603Kv/uXWG/LV6g1a1Tvx
        1I8dMPMiawrhh3k1kVCNLlUEP+s0Bt8Hm9iYW890kg==
X-Google-Smtp-Source: APXvYqzQHiF7lS/AlEMoGT4lbfgs1IYR+UrdwUbzwab2JGQV2CoGFqwg3HuVBLF+B0baJn8vM67AeTHHNjnBvC+5Fw0=
X-Received: by 2002:a19:c648:: with SMTP id w69mr8891789lff.44.1576244207522;
 Fri, 13 Dec 2019 05:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 14:36:36 +0100
Message-ID: <CACRpkdaxTMPNcRMkKxJ9y3W8x7pwwnNaG+=Tc0P+-3ZzpnFmww@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] pinctrl: intel: Move Lynxpoint to pin control umbrella
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 9, 2019 at 2:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel Lynxpoint GPIO is actually half way to the Chassis specification
> that has been established starting from Intel Skylake. It has some pin control
> properties we may utilize. To achieve this, move the driver under pin control
> umbrella and do a bunch of clean ups.
>
> The series has been tested on Broadwell Ultrabook where Lynxpoint GPIO
> is exposed to the OS.
>
> It has a dependency to patches in my review branch [1]. That dependency patch
> is supposed to be submitted soon as a part of Baytrail clean up. In the
> mentioned branch the patches are represented in the correct order.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/log/?h=review-andy
>
> Changes v2:
> - fixed ordering in Kconfig and Makefile (Mika)
> - finished conversion to pin control

This is some really nice development and just go ahead:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If you want to make my life simple could you do this:

- One pull request just moving the driver to the pin control
  subsystem. I will pull this into both the pinctrl and the GPIO
  tree.

- One pull request based on top of the last commit in the first
  pull request with just the rest of refactorings and improvements.
  I will just pull this into the pinctrl tree on top of the moved driver.

Yours,
Linus Walleij
