Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6974A6225FD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiKII7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKII7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:59:30 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F4517A98
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:59:29 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id m22so7677799eji.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHMYDAB7SOPCsQhVODz+CSzsPNokxJ6rB45utAOxtxs=;
        b=vXrbkeONuoJyhqmlNVGaLNPuKfYxVdBOcdsdOM5KpWrBZMTOEJa2qtDG4hDZ/O6AA0
         Tr0ukvFb+r4I7ZqlXqJjyZviweqjNwFbPPtGuCCkpkyyM9uu4UdciR5w8dmp+AAywY/D
         e82EfSvtqY0YyGIOsEQ85oNDYCGwpf+ZaNnu3QTyKFjE1pkOYwwN4yJQq5lil6MMQ0BB
         sG/dMEwjhXDvxH7hzM9G9Q7NaNXThhlLsfXI6n4mg8Skg0gGcsUdh8YXOqR4YSnfKDfq
         /LD9anszmbF5lRIqS0OZ5uVbNiSEyau3f8QtV40SKsolDTtywbu2aIWYsL9fOExxxNk+
         2SKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHMYDAB7SOPCsQhVODz+CSzsPNokxJ6rB45utAOxtxs=;
        b=pTXq7O0LpNVM4ily9KeJcK359IrNvXh/DYepGaZDZHisW/Wh5DiMcsMg5blILK1AdP
         I5d+hzJlIv/h++hyLrXYxrSPIpX/kV6gNnMHy0euXtuTH2r0DP7wWYh2pZpL6HADeOMj
         YidrMXjMOODagoHY9cis97maSCWyjypvIpqy4F1Wl03qvG+m4lAHBtXLXmeKPTTtujfl
         lIUHPDldt8Ix7iKuSknChIajbe4mkdTdQee1uvjKLQQvufLc3+0XmsxcXYRTQ5vrtafH
         XCcCfdnnfnRzN0IsmcW9o+HEkV7GfoC4WUZZ+6HWByWOcYqrjqEcOTGS9+/4eClrsLXX
         GxHQ==
X-Gm-Message-State: ACrzQf1vE8g5AZ0FMB8794Ahc0gnBzUJWDXv/OkMLTt2F7PWcgNzQHrq
        3epwrDvFl+Cy4XFj40fIhshdrfvQy4bJNwZU4TD7Ng==
X-Google-Smtp-Source: AMsMyM4RDdhbWZObgw8kP219Q81vEJT7t01J1Sturs5XpQarS4SsdU5TER14TE9q0WEfUDHDYApBivGySl5+HBgwOmk=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr57345528ejw.203.1667984367884; Wed, 09
 Nov 2022 00:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20221108133853.61884-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221108133853.61884-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:59:16 +0100
Message-ID: <CACRpkda=Jd_627OZSq1LkVp=6CcOVXvuLPY-5i9HrWXn68-nkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: of: Prepare of_gpiochip_add() /
 of_gpiochip_remove() for fwnode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2022 at 2:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library is getting rid of of_node, fwnode should be utilized instead.
> Prepare of_gpiochip_add() / of_gpiochip_remove() for fwnode.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
