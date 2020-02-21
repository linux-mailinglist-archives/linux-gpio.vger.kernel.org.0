Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA781682D9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbgBUQKk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:10:40 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45451 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgBUQKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:10:40 -0500
Received: by mail-lf1-f65.google.com with SMTP id z5so1859782lfd.12
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fzmdPVewt4poXC+/NMgaFWzacayCygYoOgCnUFqrFA=;
        b=fVdWb+3x5OJjWjTS8JQOQcRTidOkvjo2ir5U7PGAMVw5WxJMB39mldwFJOaGJBpPUy
         TygGJ4Dh2eYuVpqhNmTy3A+mpVuIa2KKYLFA3KwEZW7wHuF9sM0lfQDUBvctfKY5m1/w
         pO0dTq0SLvot91o2JkazTn4LiuQ4fl4I5uYWo0e5ArrD3w5jCckR3bFlT9HGTa+m8PiK
         8VAPpY7zeJn+UMraJSLg7HWnf8dY0AdiTCeorPVYG50crBQzgoxJZ4GIyr4FyKjRhKom
         FwWdL94yUF4/ORBxgq/aGEs+gPSJnwmTca7vaVtED+YyMLd2N70TOhnvv4WIVVP46psz
         EG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fzmdPVewt4poXC+/NMgaFWzacayCygYoOgCnUFqrFA=;
        b=HfKgMXRqlIWt8aFeQzMln1W3eBQpH2Yx98Lm0dTF7Va9S8mT4LDWnpKUHs8iJqkG3m
         KfHaAKeuL16PWcZUzPfFORoJO90AXwQ3QBiXelCVyxaHX6y3qbsAedhdQFOOj4Zg7Y9c
         2RpJs1i2x5ygMfhVus7cSDwGHVGzK4obXxWemeymhaDHn0XCIS8STiqleJ3aCWicC45b
         VOsqQazx8JVncY21nDMtOwatUJsErSanq9fyvyNk2PPCVkMAzyEhh6ry/JeYkhIU19o/
         c6SmqrLzGzvQnFigq1QjRqjVYPyquGAys92hB+Ra7B8bMs1iccj/M+R9Vkfj95rFGRHD
         d+AA==
X-Gm-Message-State: APjAAAUWg5NDWEJAHuPQRqnebzFyYIdrqJsO5Bf41DP+3mBE/ugRuwpR
        HKxEDAlV9TC/el4pJaAxMrGcAnNIUJBdL8zjEEhDzQ==
X-Google-Smtp-Source: APXvYqzfFpHz+WEEPdfY1KvmrQ7fJ+JA1hBH/qsYBoXtX0Ad1P1ZdxZA5yWVXCM5V2QXzRc1KsrSTBXhNXruk6AbO4k=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr20384167lfb.21.1582301436869;
 Fri, 21 Feb 2020 08:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be> <20200220130149.26283-3-geert+renesas@glider.be>
In-Reply-To: <20200220130149.26283-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 17:10:25 +0100
Message-ID: <CACRpkdbFRv2ab-fa3htiLBTmW4kCuB6Rmxb0Afj=eP4hH0W7BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As GPIO hogs are configured at GPIO controller initialization time,
> adding/removing GPIO hogs in DT overlays does not work.
>
> Add support for GPIO hogs described in DT overlays by registering an OF
> reconfiguration notifier, to handle the addition and removal of GPIO hog
> subnodes to/from a GPIO controller device node.
>
> Note that when a GPIO hog device node is being removed, its "gpios"
> properties is no longer available, so we have to keep track of which
> node a hog belongs to, which is done by adding a pointer to the hog's
> device node to struct gpio_desc.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop RFC state,
>   - Document that modifying existing gpio-hog nodes is not supported.

Clean and well separated code, patch applied
with Frank's review tag!

Yours,
Linus Walleij
