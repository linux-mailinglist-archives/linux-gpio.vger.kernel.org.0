Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9602331D170
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 21:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhBPURl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 15:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhBPURf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2021 15:17:35 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41717C06174A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 12:16:55 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id o63so6959726pgo.6
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 12:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZSu4R2cU3Y85FwXCU27KTg0eEHQOqbMnt54AuYnMOe0=;
        b=WNJFrMyZWnoGgAwgPoB69w1MMzTEJ+O76Bd8+7UYM7kM0ac11tXM7kJQH4gNX6kU/J
         BRWH3kNXAbCW9LILNrY8g96Hg22SDh7Bi/LS8Tom1BC1B9KvHTDvmNCHUMKR/olqpWHP
         4mWF9M5PJqPWPc3aKO2ngd7w9cn4BJ0x5Y9Ap6CeYPzmpP0OxLwSE+GetgLcoGTcmhVD
         +qhqG8FceZd6wGsieq66L60nYBj5aDWZQcxaaTJnD6nj3i4/U9f9EiUr6m8k/9K/oY/O
         oxMPE4nI4R/HEqh+jZqqZnosfKb7ppNcZeoMvcvH8lwAnbEb1X51qIf64GO2GVHYY3Bw
         /4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZSu4R2cU3Y85FwXCU27KTg0eEHQOqbMnt54AuYnMOe0=;
        b=VY6v+e4fvwlehIh+AJ/EU/8C2YIgyufWPga58uSGYl1lBNOPJJ2WZJ6C8Z7CJNVf80
         yhn+wDlUbv3FwRXMfaVCKNRrxYCpShHjGp43peYo/7fSKcofvhM1Xn7+YsqclGL/LnNk
         DfYFGQ8DF4rOMCtMFjLiaVAjOr5P+MvxhN5pBgEssvLEaOOWifg8/JdvlNMJr0W02k7G
         IizR5fy1t+B7UVgJH3tk3Hy4g9fYU0QHBn/dwZKKIDpq+UOWkEqssacSo5K+CuQqFnoD
         bkvx1SGwpaSnDX3OKlUzc9NIVBGf8qDg5bCJYmPVWid7d1uhl7rDwC4MZ+eG1JXJid/k
         eVcQ==
X-Gm-Message-State: AOAM5312wvOpND7T5TWy58ZZcbNmX501ZfWQ4ip6WSyqdQSCdonLBTe3
        fBKk0l7rOS3EAK4/iy/n0swCVF6TEvQKChLLxMX56gPdVUo=
X-Google-Smtp-Source: ABdhPJxQIImbnm9tzuXHDwqX6/1dt0pHjRNE9zeIkCathnk6buhfBNhB9pW8bni0PI1LUfeSt4mwcpup+0rXBejNK/c=
X-Received: by 2002:a63:4753:: with SMTP id w19mr4608895pgk.394.1613506614858;
 Tue, 16 Feb 2021 12:16:54 -0800 (PST)
MIME-Version: 1.0
From:   Maksim Kiselev <bigunclemax@gmail.com>
Date:   Tue, 16 Feb 2021 23:16:43 +0300
Message-ID: <CALHCpMg7-OHSiBHOObUSTtH6gSLhg9yfh9u=E6tGnTLbhJVucw@mail.gmail.com>
Subject: [PATCH] gpio: pcf857x: Fix missing first interrupt
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Tue, 16 Feb 2021 17:00:58 +0300
Subject: [PATCH] gpio: pcf857x: Fix missing first interrupt

If no n_latch value will be provided at driver probe then all pins will
be used as an input:
gpio->out = ~n_latch;

In that case initial state for all pins is "one":
gpio->status = gpio->out;

So if pcf857x IRQ happens with change pin value from "zero" to "one"
then we miss it, because of "one" from IRQ and "one" from initial state
leaves corresponding pin unchanged:
change = (gpio->status ^ status) & gpio->irq_enabled;

The right solution will be to read actual state at driver probe.

Fixies: commit 6e20a0a429bd ("gpio: pcf857x: enable gpio_to_irq() support")
Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
drivers/gpio/gpio-pcf857x.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index a2a8d155c75e3..b7568ee33696d 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -332,7 +332,7 @@ static int pcf857x_probe(struct i2c_client *client,
* reset state. Otherwise it flags pins to be driven low.
*/
gpio->out = ~n_latch;
- gpio->status = gpio->out;
+ gpio->status = gpio->read(gpio->client);
/* Enable irqchip if we have an interrupt */
if (client->irq) {
--
2.27.0
