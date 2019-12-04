Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90B93113799
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfLDW2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:28:19 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32842 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbfLDW2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:28:18 -0500
Received: by mail-pf1-f196.google.com with SMTP id y206so561177pfb.0;
        Wed, 04 Dec 2019 14:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AiGWSuLOFBQ4k5wKIT3jlmc1KWiqycxf7Nfr0tXx5d8=;
        b=nfKG/bbABLOMg3FJRiXUhFFOqjPegCenXZFj8pLWkhZ3UW6y1VkbbnuHtpfeyGquVl
         NFeA9+8GvuZvJB1emgkRGHQBBJ3vlKnUvNhRSUoM9ZSWer26+1AIskD5WHzMxo6+bTGd
         zxUHUfzF+0TIpR9CFUruXqXCjZeOCLr+ieDE/AmfXyabct+SmX66sW9/s77MA6rF9WUE
         9sQCx/ihqYfuTfCWBHhBLsYyUvn/k37lE15RSnvNQ2MbuVSLD7DDDUXuO0MzWAhMCRoJ
         FtCURkRKpY7ai4ncFE6DaH/eAiXnJTPpCY/y4twPmsI4VLudBYyJyXfHt8bACJyTlPTt
         OaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AiGWSuLOFBQ4k5wKIT3jlmc1KWiqycxf7Nfr0tXx5d8=;
        b=p6Zsq4kuWHa5FbfS25f1bPhHMAKasr+C7RYL0Sc6Ts3fvkmhQSNlqSz1j9U805pLY7
         kyRxVLUVYez1r2H5QTNnZwsAjCQkaeN7Os5B5cUsqaCTQcj3sZlrD2sscaiEMGgK6fCM
         /MJgXB16bdsS7XUqjl3PiBygq06dROPBepB0N79iSZbjDB4HAoPMKtmvJf5S0eE+FAau
         Iq5BYQwMC/PwTtf74K6VWcdMV57HbrOHjN5RTtO+j+wC4QOCLPzB0Yf55Q9YEyiSlspB
         LMkKKrv19JgzASSE/PFU1gaq1OWDS3yqYIkESkMZcy6/6FoW9aZEAtFzpn6BLIMQermM
         FrAw==
X-Gm-Message-State: APjAAAWf40v31HxwVYtn6p8gM7DgPMhvKLCJmaOn3oVSxqP74ZK80UYm
        bte1yQ2mY+7YMJYV8QIyk0krAHTTzy9t8svFquo=
X-Google-Smtp-Source: APXvYqwUv5IrrJRXQngWj0b3tWm2la0iej/Xs+XUI/m5bVTkSGf4SmMIgIU1NBe1scpg8POOwNv/g0pwPlLW9OaCN9U=
X-Received: by 2002:a63:941:: with SMTP id 62mr6137453pgj.203.1575498498205;
 Wed, 04 Dec 2019 14:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-9-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-9-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:28:06 +0200
Message-ID: <CAHp75VfVHr2LGZYSVhQ+KmhvGrnH=1ZNAPzJOTdZDh7wsjFddw@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] gpiolib: emit a debug message when adding events
 to a full kfifo
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

On Wed, Dec 4, 2019 at 6:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Currently if the line-event kfifo is full, we just silently drop any new
> events. Add a ratelimited debug message so that we at least have some
> trace in the kernel log of event overflow.
>

Hmm... I don't like prints in IRQ context (even threaded).
Can we rather switch to trace points at some point?

> @@ -975,6 +975,9 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
>         ret = kfifo_in_spinlocked(&le->events, &ge, 1, &le->wait.lock);
>         if (ret)
>                 wake_up_poll(&le->wait, EPOLLIN);
> +       else
> +               pr_debug_ratelimited(
> +                       "%s: event FIFO is full - event dropped\n", __func__);
>
>         return IRQ_HANDLED;

-- 
With Best Regards,
Andy Shevchenko
