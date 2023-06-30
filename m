Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51E3743B18
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbjF3Ls0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbjF3LsZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:48:25 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683083A89
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:48:24 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bff27026cb0so1689247276.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688125703; x=1690717703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5ZqAZiSn5H7ncYmND2Mk0HDGl8wCPZgwIU7C8IqLJ4=;
        b=eJu3hD8LV6A9O1ghoud7QTR+967Q4UY5TO/Mut++jAffD8Q9ckoNu0Q0JnDaWRbVhD
         w74d5xSb4m8YZZsImJmvU8GpkonaTEnYXvJ9xWy2o59Slw7umVI7g5EFHpvcoCmrdJZI
         bIsUgIDtFTUYaG4QNZkQpSrooeZ80wHOudjrIEMrFFIHo3qBVOf8CCAhmgHayq9aprAy
         Vy4jQ1oaByHqqwLB8suCXJCe2L43qGAQ5uIFfSbbXCTr/ERAp5iRAxAWfVCWvaDJQwR8
         WaOhu5mQci+vrhWh2/KJw3iI6qg7HlzquSK3f9vWxnFG9TgCrj3dtiApQZEjkMwPwnzo
         RFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125703; x=1690717703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5ZqAZiSn5H7ncYmND2Mk0HDGl8wCPZgwIU7C8IqLJ4=;
        b=XQ8t8KaapE8IcKAL9uANuzVpMUv4qPsYbWsJpTo8jnVv6XR1xdvXFiKcHZo/1fNq97
         lPo6lGVMHLUEqOA1cnD53Gl+O0HFYzFZNQo2V+NV1Ng5dV4vqGm/0lIpFKiGGXhBAbHh
         bodv4hAaHhOq1na5IbPF6xUVO3/a5QknP44+dbvbghS5KQeJVXm89NuZIAh7hm158ldB
         MWpxBwG136BqK6+FQ0fcL0MIBu+mrBZXncM87iaXuyGChB1HKY4wVSLVcilxa0V4VLY/
         /ceO+vcjkwvNiZ7UMh6KdhUZnUrSfNP1ZHiS/5gUzznpTCXBMBshtJ0l8pxlD1N15wj5
         mp3g==
X-Gm-Message-State: ABy/qLa21nBs3JKqSnEmxQ20en2nUTYKaQ3Gk6K/LF/CKY674tQN7xIN
        lWAd/UvjJ4WbAk9zETicbBN3t6VYvPmqwA8s+UpnWQ==
X-Google-Smtp-Source: APBJJlEn23zpm9K2m3GcGXdyOI90JuXNMbceme7t72QCtVJK1VLTsf7axf/ddaUV4XHnxExw+9SjP+jDaXTxQSRWvDE=
X-Received: by 2002:a25:1f54:0:b0:bca:7cd:7f32 with SMTP id
 f81-20020a251f54000000b00bca07cd7f32mr2488364ybf.48.1688125703651; Fri, 30
 Jun 2023 04:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com> <20230621174943.30302-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621174943.30302-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jun 2023 13:48:12 +0200
Message-ID: <CACRpkdbraGC0H+axUizMXEpo=kC2L-iwfFeiWCL8x8xc9e=6sQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] gpiolib: Factor out gpiochip_simple_create_domain()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
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

On Wed, Jun 21, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> As a preparatory patch and for the sake of consistency,
> factor out gpiochip_simple_create_domain().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
