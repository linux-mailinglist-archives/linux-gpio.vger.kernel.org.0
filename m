Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A521E223F21
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 17:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgGQPHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 11:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgGQPHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 11:07:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C66C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 08:07:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m16so5551047pls.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BFqe3UC1D0i+t2u0tBMKNjy1clynxkYXvqw5FQS9DJk=;
        b=lLQNBEAFmz6qJHCsjFcxtmorwzB7PGhr2uo0MB8Cbhx+GNSBwQezvONmVMQ69jHmad
         FYprgW+6iae2gOQNdF8jW/DY+bwUfjhLsurCbEi6+AM61n4Aes7IiMH1OoWRGyJJnThZ
         H8aBmGVUhEc0hB87X0b5lwdoyKRB25oyQ5GOecslYMHlQitKcx5Y/xKquzqeZbBaA5zl
         k6+w9QNOkRV8V03UpYCtq9e/yujwPeQvU1NdXIygWEGZOTNcRXwvWMjSzlJf/XDnbj6r
         yTfUpYD1unqCia88fpTeQscVFw1Q3b65Z9Vf4okAjuqMJ4tTxyhVM16jcO1urw2cUaoz
         y2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BFqe3UC1D0i+t2u0tBMKNjy1clynxkYXvqw5FQS9DJk=;
        b=uFwFTfSGyDcAgTZ40CZxUGiUJE7tpA++DOERSlfnBy5e/blrCA/lNcihnZXJs0jSlF
         YKNkOmfldD4/n8Cbi0JtIMRzyVWPt6XQlTOyrZgTmdJT6WsREh9SU/KQFjqNnQzkg8Qy
         FIitKk8CyEFNSx/pfIiymlQHYgXB3NWCQrhRYBstTvkf3ZarWE54AbBOr+x3Z+hRDgeA
         eB2O8+TYMb2FgTP18u5OUMDQJf5hxHezTW1/z29M1lZLAicLTR43jxJF9N5TrRx5Q/uz
         IDKAUc5nZogZa6qbZeKUdGD5nc9rXXzQu5LSG4AlmsdgNNfZC8TVDWlPZ3G5gEhdtnD3
         Twuw==
X-Gm-Message-State: AOAM530aAaj09uUPgrCMN7Anhe3W/Ay3mMdxIEom/uEj4teuxH1jM53s
        v0OZl6FAp1Fbfh/UarjV7FD6mpCuOUqKduuQufg=
X-Google-Smtp-Source: ABdhPJy1r3AHClWxIl9ecQgbWpcKgNNFZl7I862ljxfYAepeB/VoFfU/AnfFj+a7F6/YLo2V8CtsJ7bvGOQ4o8prvoM=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr8094077plv.255.1594998440515;
 Fri, 17 Jul 2020 08:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com> <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru>
In-Reply-To: <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 18:07:04 +0300
Message-ID: <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 5:17 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> I need a small userspace program to do some GPIO magic to communicate
> other hardware like devmem. This program takes about 2,5 seconds just to
> find GPIO lines by name.
>
> replacing synchronize_rcu to synchronize_rcu_expedited in
> atomic_notifier_chain_unregister gives the same boost as removing
> synchronize_rcu

Have you tried to replace an atomic notifier call with a regular one?
IIRC it's still not clear why atomic is used there.

-- 
With Best Regards,
Andy Shevchenko
