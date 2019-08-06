Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA721839E8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 21:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfHFTzA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 15:55:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40356 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfHFTy7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 15:54:59 -0400
Received: by mail-wr1-f65.google.com with SMTP id r1so89020965wrl.7;
        Tue, 06 Aug 2019 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=pweWeMZ+YAimqC/rJkc+DaUbocqC+KDHTVadFtRmDA0=;
        b=fGAJjSURN9jdmlO/I/yY7LcvHVIFWmV3kCQetZLe/YsASKUdA/2V49frkUJFh32akX
         gt/nIuAshzYJrMBWOFMq7WOhOnKJNFylLc88RXm5VVxEyXnwZExq/aQyyFcw6PsIBdUO
         UJBdbyqjns/oNRuElRx8SE96dBXcqAcxK/aj5vopiYWvxDSJwtP4RSABBjLH4MQt17dB
         AOwLQA5PL/xZM+pTYZxvJhnFpmDkdLkUqo8nndY4GhfnYq58zUpjD8I5R57K4OgKkBFx
         zGfzjahX0X8XzLBcff5KFwL0tPALfivB00M77hWMEdiAzB0K55NAJxYWQYAE+1ReF+f8
         qkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=pweWeMZ+YAimqC/rJkc+DaUbocqC+KDHTVadFtRmDA0=;
        b=WurGKoyN2lV3dZY27B2iD59Pkm57nngCQuoA0JCxmdWNrXcqPOUTorzW0CTsnTz+CD
         fUzu7Xi/KbFgJRj/iuRy8d9SUsof5QPxw2n/1y9klemunXVVAu8W/tR35yStFjQanxrv
         pctQbFR3vt+67Wqj7VCFj1jLqLOHJ6xaeSyw/84aaywlMGmvU1xhIbI27OWxXAIzuPaz
         MxO7ykkjeG2QXqgsuRvveMJ3sLnp3IFaMRfeemq9KJ9shOQiykykAZqgiuJUtZ3hTGBj
         UDzGj0QYcbGBx99Fuj3k6DY4ugBnfFo++QRA+EgIYrU020QFmeA+BdLSxqLDTLN4MSTB
         IO7g==
X-Gm-Message-State: APjAAAU8dfRGIAOotTjHeKzqZd34RaSGGpkG/Zy4jWKzDYBzyNMAh5hd
        A3slLXpUvDMcN9Sl3n/VPARv8QJO3kI=
X-Google-Smtp-Source: APXvYqyqfIIs/GR5fj1UygzkWQGeAlXeuTKMOwI7ZkHYeJsqCO/4oOppuFUB/Tcua3HuCcOYDPpdjw==
X-Received: by 2002:adf:fe10:: with SMTP id n16mr5585332wrr.92.1565121297462;
        Tue, 06 Aug 2019 12:54:57 -0700 (PDT)
Received: from [192.168.1.32] ([141.226.31.91])
        by smtp.gmail.com with ESMTPSA id a8sm77911466wma.31.2019.08.06.12.54.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 12:54:56 -0700 (PDT)
Date:   Tue, 06 Aug 2019 22:54:48 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <CACRpkdaTmxQn2Z=vD6nyqk-iXCFrnCG1xpkXwO3-+sazOhGBvw@mail.gmail.com>
References: <20190803133436.15016-1-rfried.dev@gmail.com> <CACRpkdYEdQdk62bWJ2=i2Mbvpz3kwL=9bnMoxksFsTgAHRh68w@mail.gmail.com> <CACRpkdaTmxQn2Z=vD6nyqk-iXCFrnCG1xpkXwO3-+sazOhGBvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpiolib: Take MUX usage into account
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>
From:   Ramon Fried <rfried.dev@gmail.com>
Message-ID: <2F7B6E95-045E-4F57-B2CB-858BEE298986@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On August 6, 2019 4:11:27 PM GMT+03:00, Linus Walleij <linus=2Ewalleij@lin=
aro=2Eorg> wrote:
>On Tue, Aug 6, 2019 at 3:04 PM Linus Walleij <linus=2Ewalleij@linaro=2Eor=
g>
>wrote:
>> On Sat, Aug 3, 2019 at 3:34 PM Ramon Fried <rfried=2Edev@gmail=2Ecom>
>wrote:
>>
>> > From: Stefan Wahren <stefan=2Ewahren@i2se=2Ecom>
>> >
>> > The user space like gpioinfo only see the GPIO usage but not the
>> > MUX usage (e=2Eg=2E I2C or SPI usage) of a pin=2E As a user we want t=
o
>know which
>> > pin is free/safe to use=2E So take the MUX usage of strict pinmux
>controllers
>> > into account to get a more realistic view for ioctl
>GPIO_GET_LINEINFO_IOCTL=2E
>> >
>> > Signed-off-by: Stefan Wahren <stefan=2Ewahren@i2se=2Ecom>
>> > Tested-By: Ramon Fried <rfried=2Edev@gmail=2Ecom>
>> > Signed-off-by: Ramon Fried <rfried=2Edev@gmail=2Ecom>
>> > ---
>> > Sending Stefan's RFC as patch, as I tested it and it seems to work,
>> > additionally, an accompanying fix was made by me to gpiolibd to fix
>a
>> > display error of the actual result:
>> > https://patchwork=2Eozlabs=2Eorg/patch/1139923/
>>
>> This is mostly fine, some style nits so I fixed it up when
>> applying=2E
>
>Ooops no=2E It needs a deeper rework in accordance to my comments
>last time it was posted=2E Please read this reply to Stefan's patch
>and address the comments:
>
NP, I'll try to address these in a new patch=2E=20
Thanks=2E=20
Ramon=20
>https://lore=2Ekernel=2Eorg/linux-gpio/CACRpkdb5DjAMRYkT+b0U6HVk7E6ccLT79=
-LB=3DQGQWWtE17aPUg@mail=2Egmail=2Ecom/
>
>Yours,
>Linus Walleij

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
