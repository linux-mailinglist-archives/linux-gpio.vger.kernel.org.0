Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1A12B7078
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 21:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgKQUtK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 15:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQUtK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 15:49:10 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B5DC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 12:49:10 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id e139so12575854lfd.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 12:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5ETcqSN8lv0PfGsFTiK4oZnIYNwQI58sAlmgkVAp7M=;
        b=RA1/gsfiwlNjhA9mps2+nEfjeRKYCChfzv+9GLy+uaVGxFLNzanjtmwxI1JWEDsZxt
         W5FWX0nYY8I3nqm0BKNYfE6LaUTH4g1KWT92X/4wXasOcBnhSKBDc/ZBsBj3yRyqKmHa
         swVXx758s+HI2faH9ca6B0bW36K8+d+VB8GgOn7Tk/g27KhXNamCkDHDE1whgysJQoVm
         H4oZ8NRyCuGnhdeYLm71eXh6UHKMYdI3SVCC/7k4qAz9k8+3y90tRQbqYRBihxsqBm6i
         lHo0hf1BGgwCn1oCNo10C7JTl3yQETRY9Z7QtLW4FUxvEx0nzZFXke+pvqfLPzsIs681
         0I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5ETcqSN8lv0PfGsFTiK4oZnIYNwQI58sAlmgkVAp7M=;
        b=cf3cQdzXHJB9ALv8cOwuCALM7ZNBweoft88iDKFo+4pnJWC609lnUN2hicejD8VkPJ
         jKD8fxaGGXaNy5lYAJpG4v0GbeQQP15BpKIHGtDjKNB4fYbo1pIfNLEQOct4VO79FJSA
         7f0ozoMJUStFReH0pynPTHjXccxgkllmUzGJmcqCb7gkEewoTPXghW710ggO+x7scfdq
         xri02gnnWuHl59kuLp5wEsagBTWd/sy9O699t8acaDtXxzqeNKFFB7e+MiW84UDt466Z
         MVffqyAHeyL744El/Kcj4ygDlyoZ63px2J63IvbRwbNCKQ+QnrPzAyXvU4WK1LL+DbGy
         pcQw==
X-Gm-Message-State: AOAM533ks3buM+hnF/KKayTNEA+ZO69pshsvKt3/IImS/diG5hBG5t8O
        aBeQRdVEBMoYCAL/j1MhphpmB0ZTFwvuaJcb2ttn+w==
X-Google-Smtp-Source: ABdhPJze01SALsWhfa1HeMLYLEd3J6hLBrtG9sGKyH+ACWaJHJ+l2wRVDRCmynmle5SEzGhQ938ZcxLINN6vFpWWe7c=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr2271840lfq.585.1605646148590;
 Tue, 17 Nov 2020 12:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-18-andriy.shevchenko@linux.intel.com>
 <20201111192739.GS4077@smile.fi.intel.com> <20201112070050.GO2495@lahna.fi.intel.com>
In-Reply-To: <20201112070050.GO2495@lahna.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 21:48:57 +0100
Message-ID: <CACRpkdbxpn3qNLsqPWjO54NO-D-fXnT2+3bV2vHBoiFB0neYxw@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] gpiolib: acpi: Make Intel GPIO tree official for
 GPIO ACPI work
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 8:00 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Nov 11, 2020 at 09:27:39PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 09, 2020 at 10:53:32PM +0200, Andy Shevchenko wrote:
> > > Make Intel GPIO tree official for GPIO ACPI work.
> >
> > Mika, do you think it's a good idea?
>
> If it helps the GPIO maintainers work then yes sure, and in that case
> you can add:
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Was requested by me :)

And yes: Andy's collecting Intel patches has been a tremendous help,
and if he can do the same for ACPI I am grateful.

Yours,
Linus Walleij
