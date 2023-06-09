Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1920172914F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238158AbjFIHiP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239022AbjFIHiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:38:07 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5A918C
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:38:06 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-39c7f5706f0so411733b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686296286; x=1688888286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eek9PNJnyCtKyekmvAspHpY2O46dtVatAGKNcAtI9H8=;
        b=IRw1pAu1cs9xYZM9EKMHdfyMh2j5/2COsPmsR2+0Hjg4+RA+7pSAaL/B4AM/bQBoH9
         A9cS1w9MVFzCgC7ayePC0Q54d+ef2a+EKKzb0EL8RtNcPicYWAaIZezKJPSAGeq7LxgJ
         RgQbdRFZMy8EzpjX2aa3Yv6Q2AQrIFe4TrUwbehbRAh3K+9JWZ7y/tDv8rbGCHVH0qwy
         3qGjHd4U82TweivONwTyUElVVPNLNof+x6FepxOrrECglEkN4hJ7MsLhADiIZ3xehuxS
         Cnqz7a7L5izD6wwFvT/6RuCC1eS50oKzbJj8frWtY+HO0z35rs7N0Dpn357i6UlsNPG0
         jdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296286; x=1688888286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eek9PNJnyCtKyekmvAspHpY2O46dtVatAGKNcAtI9H8=;
        b=De+njZBRcbuUGI/mw9Pq2OjCv5/E04hIawZZQNdO5RLt1PYAX4Rchm9VSUyYD6K/32
         N9XQp+C8ABLP0AZ/FVaN820di/z1F4VVfUxcs3L7H8yCJZVQNzFO+VrkYCAzOQSpXZuU
         9Ju5zQBaqAZormoh59crOxyeMPGHKJ0EtZL86EuRUMt8qCeCirs1Iz3ITjKys9whf6Pj
         3wvVxXd9RjbifzMCq26HbCIYbQsWJigjCEx9L6Iag8/WaQfToWqIY1DIEA7pJYvAAyf0
         sMXiXGdp2cGOtFNjNuTplBu3b0XidhfbrCPzARmXhd2GAYFo7m6DZCf3l88XxWYGVvUl
         t0Tw==
X-Gm-Message-State: AC+VfDzeB2aeDzKFVyZpFuLHXsv/6EREdJQCMuuVQZvFcyzqn2FCNwub
        5rL2w/bb+bFEywNJRLSpBX3nPENPtKwd3dWKt1DKOA==
X-Google-Smtp-Source: ACHHUZ6wash2adXVoBqs+8SFc0fMUE5lD3iFWKimwfpHSAzCrZvPtZTRlOo6oFI3zY+ftldTJcqxXm/rOAmTEAzJqvg=
X-Received: by 2002:a05:6808:f15:b0:397:f94e:4321 with SMTP id
 m21-20020a0568080f1500b00397f94e4321mr835247oiw.23.1686296286137; Fri, 09 Jun
 2023 00:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230607081803.778223-1-jiawenwu@trustnetic.com>
In-Reply-To: <20230607081803.778223-1-jiawenwu@trustnetic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:37:55 +0200
Message-ID: <CACRpkdZvV27wcp6ZxrUHtEC8+dydnH8_GJW9T97qROgfT1mZow@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix GPIO chip IRQ initialization restriction
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     brgl@bgdev.pl, shreeya.patel@collabora.com,
        andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 7, 2023 at 10:20=E2=80=AFAM Jiawen Wu <jiawenwu@trustnetic.com>=
 wrote:

> In case of gpio-regmap, IRQ chip is added by regmap-irq and associated wi=
th
> GPIO chip by gpiochip_irqchip_add_domain(). The initialization flag was n=
ot
> added in gpiochip_irqchip_add_domain(), causing gpiochip_to_irq() to retu=
rn
> -EPROBE_DEFER.
>
> Fixes: 5467801f1fcb ("gpio: Restrict usage of GPIO chip irq members befor=
e initialization")
> Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>

Looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours.
Linus Walleij
