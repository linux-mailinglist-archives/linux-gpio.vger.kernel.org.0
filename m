Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B8E1BDCE9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgD2M7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgD2M7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 08:59:43 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D46C03C1AD
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:59:43 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id e8so2272800ilm.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Yxo09dVJPBtr3rN/uHT49nTIyQW+DSWfIZukN4aXZw=;
        b=vwXabPs8YT5zmX7I08aiEU6YxNfudTyc2yD7lMX45G1aFxMiRpykGJKv4ffjcRCLIq
         JIQayGNer6Hyzg5Kc5RlolmXrRySsefligu8k5AWZCI6FJsJE61o4LfMtKmjq/c9WMcu
         IjYkjt/9JDFArta3aN9OxWEg6Ies2RjNWZnF5mQ+Q87rG6auNpPTLnQN+fUTNVp3NAxH
         T0scTOt+tgh660Eh5IX0BcsBUy58bCYWB6PB3G3zVp2gg18fgQFRIlY2l5WpAiZnr3UM
         YX7wjikHPjxZJprZmyZJufvn1cffI7HKGT4F2FiYWT7Xlm16QSBW+ZCM7QT3WvNgWofL
         7LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Yxo09dVJPBtr3rN/uHT49nTIyQW+DSWfIZukN4aXZw=;
        b=qnv3/AtEgePy8+OcraAR0nqK536kvzVlNjEKkq2osTodZmG8TPrYfk1heFyNPVkhrz
         +GvYArYtJwvwq+oi1L37vLF1bWMWTLOBNeASiM8mwRxvCQXH0P4QrO1VudHLj2mgUYh1
         V28r2BbBpQJrfOLsBUm7uw4FvkE4A05lGWjxH6Aqu9lec02f3foObDqsHFMlZeyQA3nq
         s5yyoy8LvnveTrYCnuSlueBKgsO6qiPMoULfhDPt8JtX7WEnQCo11CmFQEm3+O7hosU4
         qbyokSMFIFe8+KhK6hN1qIFer8+8NieA0nRr/dOd52PGRZGKabc99RSy0uJAw3qc59i+
         3jnA==
X-Gm-Message-State: AGi0PuZdDFzGC+MdKnaUKDzduJC+go4Ht1xufDjLbn5iJKO5VfVBuCnt
        ZUKi9+5qNZKOm2tPct+6ysYJ+bDLeKYUNJmPzplokA==
X-Google-Smtp-Source: APiQypJ+wLPj7v940XymAn8ea0zNXoCXn3l3t9ul5ZusFNcHLuU4YPecSJ0vNhXcTwF13kUf7tiPSxCM9fr4V/YzLJ8=
X-Received: by 2002:a92:dac8:: with SMTP id o8mr29703394ilq.189.1588165182371;
 Wed, 29 Apr 2020 05:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com> <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
In-Reply-To: <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 29 Apr 2020 14:59:31 +0200
Message-ID: <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hector Bujanda <hector.bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 29 kwi 2020 o 14:38 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Wed, Apr 29, 2020 at 2:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > I understand the need to set debounce time to make line events
> > reliable. As I see it: there'll be a couple steps to add this.
>
> I think there is a serious user-facing problem here though, because
> not all GPIO controllers supports debounce, so the call may return
> "nope" (error code).
>
> I think that is unavoidable with things like pull-up/down or drive
> strength, but for debounce I think we could do better.

For bias we don't return an error if the operation is not supported by
the driver.

> drivers/input/keyboard/gpio_keys.c contains generic
> debounce code using kernel timers if the GPIO driver
> cannot provide debouncing, and I have thought for a long
> time that it would be nice if we could do this generic, so that
> we always provide debouncing if requested, even for in-kernel
> consumers but most certainly for userspace consumers,
> else userspace will just start to reinvent this too.
>

Thanks for bringing this to my attention. This definitely looks like
something we could pull into gpiolib for others to use.

Bart
