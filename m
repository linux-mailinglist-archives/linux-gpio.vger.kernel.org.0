Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE5C113794
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbfLDWZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:25:59 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40605 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbfLDWZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:25:59 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so542143pgt.7;
        Wed, 04 Dec 2019 14:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tAFoA1pfXHfuh5IVrrebPzs6UPD54i8tJnf9BhA9zqY=;
        b=btLVHaGLK7ZZyT7Ik0vJTBBHaUjTSw26/Q4xnulPc2WD+wQAy0/CKV4cLwcwo7SRkR
         /7FvnLN/mQ5Uq21IPDhMV9uOs9gu10UI6xJYliNWS1Hu+snT8F18jn0bOCTtuEslB8SV
         5LT6RCoiO9+ZpvNZt5LGV6ZC0Wh2VLcjrqmLoJrbvVH3TDzG8f2PGcQtb5JT/n+D1iVr
         DNCfNt6Y8QtISX2NBt4fSsDs5haqAN161+AigO0A90mKL5GwKXJO+nVMMw3tJ+QGBxpk
         X5eMiIZWxrNXYeXonhvFrbf1mgHTXWh030Pky632jnf1zd/K2L13KRrYMUL6YKd05/R5
         sBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAFoA1pfXHfuh5IVrrebPzs6UPD54i8tJnf9BhA9zqY=;
        b=U9MDH566iZ7AlnngzW031JsYWiuG/mUMsPXBmi8nxdUNFkDnBleraV5UueB4my2+ZB
         9HS3gU5AgfMYETK1qsiAyR6kdww8GgdAgkvCprmL5nFHWG4HR51JHeMggoPgVNrwBTIH
         dvxvwuKrJAGgqqWizA0ULbzcg7J/yDGLNaVL7bRdLfxmUJPNo51+aU6HIjQt0sDfA+y2
         kl30ZCPaxbbP6npbYSwPdjkKW114uWmXUnAz8mbKZ02+PsNdr7BPvS4owgBw2Tn702P4
         RmyHHARQRl/GgOJzaFxdWlT0vm3nkaFYl5+/mE94CzWSt7GU2gR7/lDLn3G3+DV56z0d
         Jxng==
X-Gm-Message-State: APjAAAVsI4oAHmeeIaWoSSq+1SO1S8sM7T0UGxyuyxmjGNU2cLa1PYSK
        +jAPXO5ytgXspE1C73cwB6QSVnbJRnetXIzXexo=
X-Google-Smtp-Source: APXvYqzPOjIHijkjh5DGuImeVKvFjiVmEyesruPfagYaeR8UYU/gIxivSZAHoYxtDyM35LC6AIZdtfSaTRTMbHWEtuI=
X-Received: by 2002:a62:7590:: with SMTP id q138mr5641663pfc.241.1575498358358;
 Wed, 04 Dec 2019 14:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-8-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-8-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:25:46 +0200
Message-ID: <CAHp75Vf7+XY8rnrbMfMgNO25EHSemjZVUgvFFp+zvj4vvJ1B8g@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] gpiolib: rework the locking mechanism for
 lineevent kfifo
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 6:01 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The read_lock mutex is supposed to prevent collisions between reading
> and writing to the line event kfifo but it's actually only taken when
> the events are being read from it.
>
> Drop the mutex entirely and reuse the spinlock made available to us in
> the waitqueue struct. Take the lock whenever the fifo is modified or
> inspected. Drop the call to kfifo_to_user() and instead first extract
> the new element from kfifo when the lock is taken and only then pass
> it on to the user after the spinlock is released.
>

My comments below.

> +       spin_lock(&le->wait.lock);
>         if (!kfifo_is_empty(&le->events))
>                 events = EPOLLIN | EPOLLRDNORM;
> +       spin_unlock(&le->wait.lock);

Sound like a candidate to have kfifo_is_empty_spinlocked().


>         struct lineevent_state *le = filep->private_data;
> -       unsigned int copied;
> +       struct gpioevent_data event;
>         int ret;

> +       if (count < sizeof(event))
>                 return -EINVAL;

This still has an issue with compatible syscalls. See patch I have
sent recently.
I dunno how you see is the better way: a) apply mine and rebase your
series, or b) otherwise.
I can do b) if you think it shouldn't be backported.

Btw, either way we have a benifits for the following one (I see you
drop kfifo_to_user() and add event variable on stack).

> +       return sizeof(event);

Also see comments in my patch regarding the event handling.

-- 
With Best Regards,
Andy Shevchenko
