Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8B776129C
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2019 20:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfGFSP1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Jul 2019 14:15:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38469 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfGFSP1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Jul 2019 14:15:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so12100832ljg.5
        for <linux-gpio@vger.kernel.org>; Sat, 06 Jul 2019 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A5lm0JSw+Z8wQ0Vdkc6Vkvw8WJnahchqFx9ZZf0C1bw=;
        b=AOXZYY0ycpRLRb/cuxQRZXeXQqW+nq2DUKUycdltMljz6f3AWjl7BTug/90DxbEVkm
         +USftXGrGeluRa+0NDXg7Im2eWo97UoPdo+U4Z+Tbr8nmZ1HpYI7GJ1h0mfgGOzFV28n
         FZHoifvTVwMZTx1/AnjDBFVWKDNKYbEnMA8HymAw4E5AxgKCNMW7TnxEmv9HOAq7O/Kk
         U9UVU6/8bxDYHfzaLef5W9PoGUsLNGOeQso1rscyxkNIbGvyBZOFHPspKd/noy7eKTkJ
         c+IfxVIzehYxL0GmIf51EIu7BbKqvJtX7txYbJRVEtDOI9KXcJvNs7suY8RWVHFrqNeC
         GaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A5lm0JSw+Z8wQ0Vdkc6Vkvw8WJnahchqFx9ZZf0C1bw=;
        b=Ai87i+JY0I+JPJXVaCh93K6AdvJp0Ds8YrIqtV1FKiaBCBhk+UA4CPkpkB0XolUvpR
         fcu31TiTeB8hTeXGn3x7DICi8wRwPrds9Oe3ZDp0FBU2/l4Ax3UNZNCchP6Qqnd+JAKJ
         nv3SRU9EjgyT4LMc1kD0JO8cAw+8ZpigTE/MO72VEsjUxE02egku34wu9qmBFr6jOCLI
         10YcV64bqKxEp6EBjA/JqkvhK6W1gTy811chYnucUWNtKVGngybtvoyLyZVSWYCeBdLw
         RWcPy03UaC3Us+Fxny5mDvIGHFc8iI096A3rDKfe8PvKqZ2+Te99unlbfwxBWX2nFiZD
         SQTA==
X-Gm-Message-State: APjAAAVc3IU4NU21jkF2SuyuHZDBbrknTSra01lgQeb6+oASyzkg4kp8
        JgYfDEEFojvNb3K7cQcC0cfptNkUE23WzTayY6P7DA==
X-Google-Smtp-Source: APXvYqz7lsLg+z4aZBOaKSE3IQ/hz5dnOlRYMqln19xtliTli2/FjLoEkwKW5PKDUGW8qlx3tKK22leN2u6gdA9eSjo=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr2079752ljc.28.1562436925636;
 Sat, 06 Jul 2019 11:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190704153803.12739-1-bigeasy@linutronix.de> <20190704153803.12739-8-bigeasy@linutronix.de>
In-Reply-To: <20190704153803.12739-8-bigeasy@linutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 6 Jul 2019 20:15:14 +0200
Message-ID: <CACRpkdb5Si0qQ71Ef10erN-pFNsK8xVpbfbztkr1-z-R+nKw8Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpiolib: Use spinlock_t instead of struct spinlock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 4, 2019 at 5:38 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> For spinlocks the type spinlock_t should be used instead of "struct
> spinlock".
>
> Use spinlock_t for spinlock's definition.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Patch applied with Bartosz' ACK!

Yours,
Linus Walleij
