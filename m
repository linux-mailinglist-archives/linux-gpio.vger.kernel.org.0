Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB9D9B800
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 23:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436889AbfHWVEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 17:04:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40626 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731003AbfHWVEv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 17:04:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id e27so10055243ljb.7
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 14:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13UHXBt660/aIVKBoXMcQ4nm46OiVnmZNta/wqHmaKc=;
        b=ubuKsMIb1CUBRatgGo/GVRgVktUzj3G32qzBISuMcyhSJXGRaFHKzScpd8CixsVGdq
         jluLCHCwZq8Ogkdpde+GfQ0HorGIt/YYx6ebA+8rbk+6q1UdqEZs6/WyU+auNTLh5C/N
         0WRnR6O0SZs/fBC8NVGEJdWx3lTZNy0EPkpT37TLEZyClox6j192piqWCYPWfAeNXsU9
         9fBuccUnlDiOLtEvnDsrGg2dNK2+UwyhLd4nkR0T51CKJr2vwDyYZunsthnXixkJVkdR
         nW1zyOHGpuyOlhI3W8DqtFT/hQr0VB013RlZKdwoG0/GcZ+CkEzUZShZaUNaNCcz7Iim
         UTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13UHXBt660/aIVKBoXMcQ4nm46OiVnmZNta/wqHmaKc=;
        b=LJZqeF6my7hca9/Xdse2IHW10CEW5qXvECN0mdsk4eAPjX9zkvOAVS55Z40BfSWT/J
         xUIwVPVpickDF+qTddYuAVTQD9GmlVAkAtc8FbywZxR+bFF5n666hGoKGMsZiNYimgJN
         ZxzCh62maydsnMFkNYgJzyW3V+L0MwmpDNX7i9ptDq2LqOzRL0tEq5ryMpr1jVnaNDoZ
         XgiAU21AucRjq9zqBF/36rJjKBH4aPYAn35pjTheuRU/4ASPodeHjx7pQKdr3IMrLUSJ
         vwx7ZzVB6W2WWapzHlxmPlvc++tlfjO1m1J3v8csn2/TZ/MGVcUua9jmlSLy7q6ongz3
         4Qkg==
X-Gm-Message-State: APjAAAXETeuXg6pFvFYTkZFskF7QaHTsLxJ6kxsxRhJ/Vpkdt5L6E/Hs
        u4UZEXy7GilHNvNI/0JU92gXunTBv8Ly5r3MhoXfHw==
X-Google-Smtp-Source: APXvYqwGpA8OdrR4aM7LPWB/BOE58FOO/hhDVPkHbXlI6IXzih26QKPR2FDrnj3AMzBI17UBlMssLytnsGLzLxb5jdI=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr4178916ljk.54.1566594289227;
 Fri, 23 Aug 2019 14:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190812062729.1892-1-linus.walleij@linaro.org>
 <CACRpkdbBaiVQ+BUNZEYNv6dGZjAbS=eA54dLTQ99Ngvbk7YQ9Q@mail.gmail.com>
 <a82230ae-4f3a-2600-0bea-85c432c56d05@i2se.com> <b93be430-a20c-6709-dda4-b16d76858300@i2se.com>
In-Reply-To: <b93be430-a20c-6709-dda4-b16d76858300@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 23:04:37 +0200
Message-ID: <CACRpkdbi_No64cQbku-8ufZG=vb3fL2F6PYYLs01VT4zrOowyw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23, 2019 at 9:00 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> > Can you give me some test ideas?
>
> I configured a GPIO as input with pull-up, setup the interrupt via sysfs
> and wired the GPIO to GND.
> After that i checked that /proc/interrupts for the pin has increased.
> Everything worked as expected.
>
> Is it sufficient?
>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

Works for me, at least it is not crashing or going numb, elaborate
testing we do in -next, thanks! Applied with your test-tag.

Yours,
Linus Walleij
