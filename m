Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1FB3971D5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhFAKxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbhFAKxi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:53:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33467C061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 03:51:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f11so12217599lfq.4
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kkk96RFhOUVeXcdtYw7VNYf9WSYu11sjtdPL/xxbKe8=;
        b=o1ehZKIudj8IUbNQJja9Bw9E9H+E7miiapinkr/taDqFF3USQSngLdAs8ijRzdZ5V4
         R8DlQVmJxyWLsrLsjSnekMwy/de6jXpATv4L6WrPeY0hpYbHi8PSRH6GATZbgs9j3QlQ
         5TK1ycoaH/cgAu6KgAma2Q3jm3i0rbxMBH1ca232N7C8suTpy2V/Obr1ogILk8FMvgdz
         9DPGRRwyNUcb8mXrXKub2kPGQ2RxKx1zZL6wQDX4+c8gLKNy4DfiNZP7IgsUtPFQxGjy
         ppyiI9c1hoOI9oSO/zm31ropq2E1gVVhXMwoeppqq2s3IlwYf0fEv7QhfUNyXfLJ++9H
         tfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kkk96RFhOUVeXcdtYw7VNYf9WSYu11sjtdPL/xxbKe8=;
        b=trZc0xZMdx0T5qHLbwKB6/F6+mpShO5OkJF1+szxlFVnIoQmhapg8TIGZsuCvPo8Rf
         ZCDaA+LMLLi+R6PhoTjvo6YHeJ4lGetzkK9K2ULOT2Qf2lF7ctvs1otyeCL7AXJzNvgH
         KALE/i8wZCc0Z6h4yjX+rEEuDFkodav7Vg/4DyS3CqC3ZBt7Q4ZJMDqF4S5J3bJf7TGn
         6EoVM0zAHqI6HhJrdPMDOhS50yfZRVbqaEsgPzUFWeZ3JoiHkjGrPM6hDvXaFYFuWjCX
         Kc31pk9PZaRp41cYfb+a+AYFrx0SVuFt3Dg6XFglLEnydbhe4D6nLhlEDDbWb84hF/c0
         ijLw==
X-Gm-Message-State: AOAM530H3KjVaOgJWyFTGaIDGAZiiCq6csHpFzGVYdWghW/3xv/SxmTK
        zcUVLWvAmISQ/+kJtHy0PuWb24EMQ2uY2hQAuNW6sg==
X-Google-Smtp-Source: ABdhPJyA7vr/U/2Lycbd2FWBZBtLqVEAm94uzNvJ8gdrDqZfAvOsT2ddncI3yJcK4skM3pg4UBmX6/vZkNHtfc3zogI=
X-Received: by 2002:a05:6512:3e03:: with SMTP id i3mr14354819lfv.529.1622544715508;
 Tue, 01 Jun 2021 03:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc> <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com> <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <CACRpkda+m5mOzMJ8KcPmojFGWkUpCrbmY0ySPTVx72RtWwf89A@mail.gmail.com> <e10c8ef7f758b4f7fa0fcbc992c84125@walle.cc>
In-Reply-To: <e10c8ef7f758b4f7fa0fcbc992c84125@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:51:43 +0200
Message-ID: <CACRpkdb4j6krXwdZGtth9b2W2bAdy9_StGbse_YbBY86-AWdLg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sander Vanheule <sander@svanheule.net>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 12:18 PM Michael Walle <michael@walle.cc> wrote:
> Am 2021-06-01 11:59, schrieb Linus Walleij:

> > Just regarding all registers/memory cells in a register page
> > as default volatile (which is what we do a lot of the time)
> > has its upsides: bugs like this doesn't happen.
>
> I don't think this is the bug here. If it is really a write-only
> register
> the problem is the read in RMW. Because reading the register will return
> the input value instead of the (previously written) output value.

True that. Write and read semantics differ on the register.

Volatile is used for this and some other things,
like for example interrupts being cleared when a register
is read so it is strictly read-once.

So the regmap config is really important to get right.

IIUC one of the ambitions around Rust is to encode this
in how memory is specified in the language. (I am still
thinking about whether that is really a good idea or not.)

Yours,
Linus Walleij
