Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54EEA16D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 17:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfJ3QEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 12:04:37 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41651 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3QEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 12:04:37 -0400
Received: by mail-lj1-f193.google.com with SMTP id m9so3271958ljh.8
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3yunMYdFF3SI5PayKTMIHAKS2jsYjXGFX9imdzBdqw=;
        b=Q9LvvdMQpu6yiLeL5cvG3v0THEAbCel75+yMbNjMGwyTJbqZguzfn7WIDrCe0QSHp7
         cHsz+JC8lgK1IHYqwO2a25xNp7JL/2a30Y2FLuqXBhs/YZZNNQEwlxEfzpYoD5+5ojw6
         0L3W8YvATR2zFo4UXs1ygaFFNbRrilM5Ho39xAJq9OISPEtRbd7FO1YQ1jbnmrVdaLk6
         frVBaOVCwwB6u6B4QcmYOOtFbgTPZrsgAP3T482Ntaz2zIFzIe1/RwYhGvx4K65sKq/O
         6TuvnkHM7mrlhZgi/zJzS/aGu3qBq74tKVu+Ifaus1E91wez/uL5WxWh8T5IiXNyGynw
         PeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3yunMYdFF3SI5PayKTMIHAKS2jsYjXGFX9imdzBdqw=;
        b=Ooa9U7e5bOHxiWbs3U4Dz54cbdO6cS1o1ohXkjVBvK6BtgScURF4x2VYn6/TC8pq5T
         SeNOsrFwTyFCIxPUdtt9+sUPqBNDl42Sht+R0say+r+lbFFWkdjuz9oLXmdPqTWsg8oe
         CtvMqz3xl9UB+kcQCgo2AR21sztlLWe/x5vrK5Bu6vsln51eWqHDfmGlJXo7ZTKmQHG9
         BDj5H7Yst5WygSTAscSpz3cfjFbgaOSxeWCVMF2cFt4OjTKIiKSZLJPwk2+1B3P5ggh0
         h4LCM5J0cnPQW2cAK7pvgpQogspBL12nDru77Ft5qSZAldqalc48tVtu/PZphwd10TCq
         r+Ug==
X-Gm-Message-State: APjAAAWVnIOf+8BwYiT9RDVkGiPHcsKluVS46KMX1hsp98te5pdFHh0m
        nEeBTiDq9glY1Pnz8SLtnSveGqYZAnw5qJZoDVu+1g==
X-Google-Smtp-Source: APXvYqxqinBSLdGw9nIESRMw9vVOKx7tEspUQ/dtoxN2gqUTNb5w1M7hRxUi4yZ0dOYzPSI1vbZ9gGhm6ne+2Bjs4hU=
X-Received: by 2002:a2e:93d7:: with SMTP id p23mr333680ljh.251.1572451473759;
 Wed, 30 Oct 2019 09:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191030144940.21133-1-linus.walleij@linaro.org>
 <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com> <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
In-Reply-To: <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Oct 2019 17:04:21 +0100
Message-ID: <CACRpkdb851eSyqkz5nDB6affd4_JO5fhWHkmve1QoMGxpYswCA@mail.gmail.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 5:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> For 5.4 we should probably revert
> "gpio: merrifield: Pass irqchip when adding gpiochip"
> and the fixes added on top of it, since AFAICT _AEI handling
> will be broken on merrifield after this change too.
>
> So I suggest that we revert the following commits (in revert order):
>
> 4c87540940cbc7ddbe9674087919c605fd5c2ef1 "gpio: merrifield: Move hardware initialization to callback"
> 6658f87f219427ee776c498e07c878eb5cad1be2 "gpio: merrifield: Restore use of irq_base"
> 8f86a5b4ad679e4836733b47414226074eee4e4d "gpio: merrifield: Pass irqchip when adding gpiochip"
>
> That seems like the safest thing to do at this point in the cycle.

OK are the Intel people OK with this?

If so I'll go and revert them.

Mika: will any of the pin control fixes you sent collide with
this? (I guess not...)

Yours,
Linus Walleij
