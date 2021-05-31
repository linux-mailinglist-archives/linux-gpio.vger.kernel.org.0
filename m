Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603E03966CF
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 19:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhEaRXn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 13:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhEaRXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 13:23:33 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C15C0467CF;
        Mon, 31 May 2021 08:49:15 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e7so3338588plj.7;
        Mon, 31 May 2021 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FCdzBejJr3ualFFCFvEugffbkYhoyf/lVFS4X8bD45o=;
        b=bdkmrEDaz1FRvAfbP7TEn1zpt+08TJLzgN0LCEFc0B6LANz/eeGCSH1WJs+wJGcaW9
         Wvnt/rRLUr+RFoH/1l0KVEmqZfwig9fqj41XSHQX67B9TGJPJJMaBItcXgaP6fJ69ViH
         ImisCYxqJIc4QfwgVuvM3JPvIpfvGXB4/wMNCk54jrHiiUyv42YHjayS9I9XX6I8jLQl
         R7JNQND/bAQrvd1ZHU2fOmLMRBg9yCe5Cy3AWPkA3217mWEn5MSEUK9m/Ldvh0v32hlI
         spxq2Owd+pDNlYVK/Ce0+NgAsytZ8ft+tBK9BfQUwlmp779cBoC8pZHOoVtwhD4CttfK
         51Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FCdzBejJr3ualFFCFvEugffbkYhoyf/lVFS4X8bD45o=;
        b=izwF2usFfDvYuAm8x79TFAq3iTwXDo9OCdJyQp8PiOi4gJ3/8/D/qP1amoK0q16fP1
         nFC45YOW2mST3+L1CSIpwcwepZ/LTR2STeVMbrpIg9FmXozkKqnwwTaqnLqFqHdEXNBc
         m+0p0vHjWdOAfbAe7BzuLGIHnK6UhUF0qm/2M+1yBVX7xlpGLoi/eR/bKxt74QIcNEmR
         2M/1KQwgpGrpDSyuQIdGPNx2yi4fdWyplGAILFahMN2ZW4JF/z3I4ZBYSR4lKaVSkjSQ
         I4aZ+nckgijtGVrcDXyAiM093MUAZXuaqYcLUCuBDIV8vuUW+F0niTxsNUXqvHb/9yHy
         DF6g==
X-Gm-Message-State: AOAM530cNJOmz2Qd42MhUh5tHuyWW/Sq1JYZ9WqemDdhKBTUMR8uWjY2
        HdK9veYuJEeXEbZKaZIBbu9LYL+h29E+hkSw4X8=
X-Google-Smtp-Source: ABdhPJx5BGVUVHf95exJairels/WYmOrI3Rug0s54UBhu0sKh0cdUjDwnxdRsZYdwZu2yCS64bpQlfmjrKScouWgFIk=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr20113550pja.181.1622476154635;
 Mon, 31 May 2021 08:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc> <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com> <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <c7239e0cbbc9748925410937a914bd8a@walle.cc> <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
 <0047200eecbd7ee480258cc904d6b7ee@walle.cc> <CAHp75VfOrUBRQH1vrXEwHN4ZPojQfQju-_wp_3djZeozEaatug@mail.gmail.com>
 <272ac6af4a5ba5df4bb085617c9267e5ece61c19.camel@svanheule.net>
In-Reply-To: <272ac6af4a5ba5df4bb085617c9267e5ece61c19.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 31 May 2021 18:48:58 +0300
Message-ID: <CAHp75Vcb95HiYxvEzYr0QXcQmA_A+2M9M0uv6PAhPHtgTges8g@mail.gmail.com>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Michael Walle <michael@walle.cc>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 31, 2021 at 6:33 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Mon, 2021-05-31 at 14:16 +0300, Andy Shevchenko wrote:
> > On Monday, May 31, 2021, Michael Walle <michael@walle.cc> wrote:
> > > Am 2021-05-31 10:36, schrieb Sander Vanheule:

> Am I missing something here? It seems to me like the regmap interface can't
> really accommodate what's required, unless maybe the rtl8231 regmap users
> perform some manual locking. This all seems terribly complicated compared to
> using an internal output-value cache inside regmap-gpio.

Have you had a chance to look into the PCA953x driver?
Sounds to me that you are missing the APIs that regmap provides.

-- 
With Best Regards,
Andy Shevchenko
