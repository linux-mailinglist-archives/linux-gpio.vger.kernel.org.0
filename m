Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C06C79453A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Sep 2023 23:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243608AbjIFVj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Sep 2023 17:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240261AbjIFVj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2023 17:39:57 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5995B19A2
        for <linux-gpio@vger.kernel.org>; Wed,  6 Sep 2023 14:39:54 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso330735276.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Sep 2023 14:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694036393; x=1694641193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcDV32V1hF3ggpML6CN2PmzNf2BZA2lkSDMi12uE+II=;
        b=VO++EKVOBPjO1Juz4K6GcAquceF7DxFz+2QrMxVnAz7DdhxJAMJ+PZPAUlPffkjDOZ
         Iaj0EsnCTWgVmrVjUF7CpqLKSBgvkiA20b9cuhDMClc+mX0N6M7Q/81KdgIvyS2YEIsW
         6gyg3UnkWMLQc1kEMphVz44w6O5I28KVTuQ+VOxq+DliBAH/J+bfWVcRWmlfpskQY024
         DFbmdje1tf8RRj2X+jdJSJMvaroX2D1600tVA0TRGANOcC+Y06c/XyV67KBKQ7lPiRu4
         V3NVmQax3ALBw4MgsSnud3cQEiUZQIQOZzAUg4ZSM60Quamg5A2AvVheSwLiHqUVb8k2
         7nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694036393; x=1694641193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcDV32V1hF3ggpML6CN2PmzNf2BZA2lkSDMi12uE+II=;
        b=ffJFWFzSou6weNHiiUP3T6j9gu6BFZiol5Gn4mx8PviBuO+Q7wXVFzDWMxFrZB36qh
         srmUKNiiDjW8UfWCkhSM5JCAE/dAT3RArh+uK9psFYXAoRTs21MH92kkSsU0ahFxwKAD
         D/OJk1nLHX9sTvArv6yDgbieoUl1ggk7OuPQ5GEIjzQZRRhwNnqLWkHDmrB1BWc86e3g
         TyRHl7VBBGnVI/DbfLXB6d498LT4eC5ZA7DSOr9vuj9nYpnq/9WzlOSBNdiNt2NPuAKF
         XJq2OCmfoR3AmeTzbxHO3ExMsNWRgVqw2NJuWNFhmeMa8/0gATQsPTdiU9EC3UnlZy6u
         w74A==
X-Gm-Message-State: AOJu0Yy53ttBkZqbThl+egzVd/wPdvIaIaeNPlXC7zzk6j+GqrJI+EBB
        ssOKz9VognKlVGpD9zmtQYr8Hq6HjZgMYbn6JRFvaw==
X-Google-Smtp-Source: AGHT+IGobIYkzFxPB1Z9kAA6+sAomQ6tP9CX+LnzMT/FtbPDy1FjubFYI/ZCy9prGJEvpkT0rCOGyCLh2O8UwHr1YYo=
X-Received: by 2002:a25:37cd:0:b0:d78:3f9c:138e with SMTP id
 e196-20020a2537cd000000b00d783f9c138emr16362377yba.37.1694036393559; Wed, 06
 Sep 2023 14:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230904073410.5880-1-brgl@bgdev.pl> <20230904073410.5880-2-brgl@bgdev.pl>
 <ZPWjAUzqeAwF1wro@smile.fi.intel.com> <CAMRc=MeMYi0KbK=1RYGX2zbUjVZyQp-Y_aXfy6+EZcEtUSEU0A@mail.gmail.com>
In-Reply-To: <CAMRc=MeMYi0KbK=1RYGX2zbUjVZyQp-Y_aXfy6+EZcEtUSEU0A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Sep 2023 23:39:41 +0200
Message-ID: <CACRpkdYO=uzzP8JMgdci=qkvGP=1AcrqD3PSBm9vkJYsFqX_gQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: rename gpio_chip_hwgpio() for consistency
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 5, 2023 at 10:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> gpio_chip_hwgpio() is a
> terrible name and if I didn't know, I couldn't tell you what it does
> just from looking at the name.

Probably my fault.

"For the chip containing this desc obtain the corresponding
hardware GPIO number/offset" is what I would put in kerneldoc.
(Which is by the way also horrible.)

Let's rename it to something that says clearly what it does.
(Rusty Russell's API design hierarchy.)

I guess I would just name it something like *_get_chip_hw_offset()
or *_get_chip_hwgpio_offset() but it gets a bit long, maybe it is a bit
talkative but easy to understand. (I stay off the prefix discussion.)

Yours,
Linus Walleij
