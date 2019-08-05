Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5016A81637
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHEKBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:01:25 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35855 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbfHEKBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:01:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so78787195ljj.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0xtvyrPYbjnc/YTvcTRZsvcmhf0BCCGEhLfCpsPtBwI=;
        b=QAUH416Xg7pzoU6ZA9YnPHMPWwYoFtTCTcQDWmgeY3QWRsubRXnET3mxCJdlX5J1oR
         zwIiDp6scndDTUXPvp7pabtaZWonqMt3RxuJrBEfWePlJP3U8262Q9B3mX6OW2LZBry8
         y7XU8IAlxU4pxESaRqfe3aRFnP3dlGRYiYwLzUnExRe+HgkdktctGvkUGhDfLBA2d8TM
         7MvczrSg/+Lk0ddMO6fY7AWUKq6+iWIRxY49QaIYroekMHELgsBFjjwdrGwniLs1UVFZ
         zbcMChFfB/2LeuKXkm1eEd67CYfBNiMM09hfuJ1CAmxPi/8Rwdsi2ej8wL0Tc/UHTDEE
         bmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0xtvyrPYbjnc/YTvcTRZsvcmhf0BCCGEhLfCpsPtBwI=;
        b=TGEaE7OJwNy3cCF+d3Qb3S0IMd1Tv/IudCZGRXk4wmcF8Ki7qKkml6WWnOLcqTSN2Q
         EW9zwuVWzwD/M/keW9FbnP4MpydMh+A+0RMEVTTbRKNBqZHJa4hUMn1eDu4wCHzf0fGT
         n3TPwU2itGWavhdG9JRPlXNc675Jz9D1InHKMqT7BsaRhno5eVEjBtVIs2K3zgU8FqTV
         KMWVbf42F6jOeO/5Tul2+tz99KR3P3uIM9Bvciu2QU1m0BLhqPCBa5KxhKsA1A09mYM9
         sKTVF4BxEk0f0i0PjPaBy/7es+INKHj9dAk4aaF+/+FfnEITorcTwKQuHsuiOrBGboNC
         0quA==
X-Gm-Message-State: APjAAAXkSa6jOuNqeyscgJI06g3OGBIbYs6IDarGPnZl2IyY7GwrbJ45
        SbLMF3EKyLLu5DixSXnSLukeoNxYj6y2ZTGI1PA2lA==
X-Google-Smtp-Source: APXvYqzDj5GHLN0h+zxHm04UoGGjJIZ8HVt7nx2D57Avm2xNDaXnuo+iqKYJ+tF7OnOSu+Lnnsnt5ATnXM2sP8DJiEc=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr13720878ljo.69.1564999283085;
 Mon, 05 Aug 2019 03:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:01:11 +0200
Message-ID: <CACRpkda+0xQDcgkYg=x=d_Gk_EwvDE1iM+PKfo0sG7T-juQw6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: msm: Switch to use device_property_count_uXX()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 23, 2019 at 9:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use use device_property_count_uXX() directly, that makes code neater.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(...)
>         /* The number of GPIOs in the ACPI tables */
> -       len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
> -                                                  0);
> +       len = ret = device_property_count_u16(pctrl->dev, "gpios");

Patch applied (makes the kernel a better place) but:

Can't we just use: gpiod_count(pctrl->dev, NULL); ?

It's more to the point when counting gpios I think.

However this driver is not includeing <linux/gpio/consumer.h>
and is this "gpios" property really a consumer property? I think
so but...

Yours,
Linus Walleij
