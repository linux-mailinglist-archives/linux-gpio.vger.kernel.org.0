Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2794610730C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 14:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbfKVNXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 08:23:44 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41622 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfKVNXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:23:43 -0500
Received: by mail-lf1-f67.google.com with SMTP id m30so3649531lfp.8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 05:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G64bQ8A3yMTqtNBBWlyBmb0qrNhP58uWiyeN1U5KLKw=;
        b=oOCpH0ULI7JqIinV2acu9vs3mEAOQ46GMMMuuiYjz4Q2A0TM3VKB5XZ/sQ6BG/fQsG
         Mo7R9HmO1Hr5pSFYXX9CUQ7Bec3RIsAildBF3DJ9hs9r9e5hCU+THo3i9MqeRiPp1eYn
         uUy3QlRloKM4ueQJrjNnpm2brSNUHHJEewfQsc1CXYOvTcdDYHHrCjWH9TO1NLL1YyRg
         E/1iOC8vb52G/qpBQkYGnCJirqwadUlUIXiFpmGl9e84F8QwImAAIb8LLvTQdDb9JeSO
         kEfI67Ph4F9eEap5SGeKceaBfvA6yM6yKL+qd4Sbrh0PF2aahIU91XTuwhG6gFrFz0N1
         6ojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G64bQ8A3yMTqtNBBWlyBmb0qrNhP58uWiyeN1U5KLKw=;
        b=rOU5NYHL7Y8NzctNKEMbb9fNmBtXglQFxAcJ4y87RMPn+J6XCEdG/BIq867hCnS6hl
         x17H5k4HqW7mPMFNTbjjDRjTNqzhU7sqyB13q1t94kHnPdGc7DahxIlsXuIH/70rP6Zu
         3pHfRaSlRy12YGYXmAHPOIx1c2BbAusJfTFN2yJ45Tujo+iGLoygZ6/1h+KjU+MWL8KO
         IIhpLf7djFPvRE/3m9+1NhA0oZjXMK8lZ5vLzFaL8DaX7oBZ0lcPdZ4OCn6k0N3eFfZZ
         QSrR+xFDb7zR7fWirSoPGrrgQ+wZT+Mymmff4c1++QLFppcMKcvAXORJ+JMKLD32qinJ
         FsOA==
X-Gm-Message-State: APjAAAVDbQB/QTm/MYERLD51Sf1lmJNvQ9342X0nQFd8dEmd3IKpJI6J
        TMh4XVcqg2NlQr+cALnwj8wlSVo6gd50FE5sywo5FG14tQQ=
X-Google-Smtp-Source: APXvYqwEF+IMct0sUqko73DZ1FYEj7WuVXA1c8Q04GTvwlG6eN/OQ1Bt+LcQ4w0/EWe1WDQ1kXUaUsPRu4TNl11V9Co=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr12054376lfn.44.1574429021774;
 Fri, 22 Nov 2019 05:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20191122113230.16486-1-miquel.raynal@bootlin.com>
In-Reply-To: <20191122113230.16486-1-miquel.raynal@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 14:23:30 +0100
Message-ID: <CACRpkdYMoRXT0vGT2NfQaSq6jU-0m3A4JGrk7YAhtDih3meBQA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pca953x: Add Maxim MAX7313 PWM support
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 22, 2019 at 12:32 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:

> The MAX7313 chip is fully compatible with the PCA9535 on its basic
> functions but can also manage the intensity on each of its ports with
> PWM. Each output is independent and may be tuned with 16 values (4
> bits per output). The period is always 32kHz, only the duty-cycle may
> be changed. One can use any output as GPIO or PWM.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I'm happy with this patch, but I would need Thierry's consent
to merge it so waiting for his ACK.

Yours,
Linus Walleij
