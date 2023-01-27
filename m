Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D92E67E667
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbjA0NS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbjA0NSD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:18:03 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53402686D
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:17:38 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id p141so5890124ybg.12
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ltT4p02a+5qTMNpSxHZjxExoQbUuEr3YTl5MtDJTfI=;
        b=hs/Zxf/lXZ0cJ9J64MR2Ftiv2nNTnG+cnV6Hd73qQD3Dr8/yC6FlnIKpn/RWzWQgA7
         7t3XN90rkAbzWHl9NIRqKGNQlaEXWMB4TuHIBKKhyYnHs1uSZJBac9LOziXCoqCO5MUY
         wWpEnFq5W2gIQRnAbr8tM5U8tqFce2QAmVmw8vR7mUf3z25mtJ2ZsRa4xDF2va+lgUWv
         uQPg8f+EuwOlueEMdxXZ0eprNHzCX7HC70rxdXsI3Bnx2KxQtAIK7LZhOGk3k+vBRLPq
         c98JeVLmonsPbHPXB1pBCceOcsITwnSp2jnU9vuLIWNwDUoreBo5y7lzZjEoA+mTaolr
         ofGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ltT4p02a+5qTMNpSxHZjxExoQbUuEr3YTl5MtDJTfI=;
        b=egsVDecDPqr7DPVowVAfrx+CtwSAx41yPzkOJwvJUnV31GmBsPqpUaLHps4dS9y620
         ncvX4t5au8CqOk/gPYZxL4nF7z7jcPooo0Lcri2mSSRZw50E6Y2IEQ431gs3ccyNhwPL
         2+M3Rs3fnnUXvkJHNZJ8Ep733BHJdUfXNcr1dV+PBww3a2cf9lEfLjGnmmUsNvWRZ3A4
         9s2I1cKlSTu3GIerFvoZjkwhZf1vsaHOy+uSaKaQnetWti+EFEsh4itkeQNbdanQNuMx
         jx5630974nBZG4G9dlsaEnzrsoficRX73Cj1YMzdrn++fagSnZYxZyBAzeLjdDHhNfbY
         5jEQ==
X-Gm-Message-State: AFqh2koTye7+ayzFVgutgKRQ8eKCQXW7kyudBio7bEkBSlBTVj6174vl
        Ajrvf23V+8ps8I5ZzaKIzyILimPdUr82FCHRUGz8FA==
X-Google-Smtp-Source: AMrXdXvl+himkQcwgX+qZUHKju5LU191hyCTQ3p2KdCUs9UjeDx4AA44v2jccU6pUSdbT2iINxUfktfyczLLYiCOSlU=
X-Received: by 2002:a25:5303:0:b0:7e4:fa1:b33 with SMTP id h3-20020a255303000000b007e40fa10b33mr3632103ybb.460.1674825456210;
 Fri, 27 Jan 2023 05:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20230126132801.2042371-1-arnd@kernel.org> <20230126132801.2042371-8-arnd@kernel.org>
In-Reply-To: <20230126132801.2042371-8-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:17:25 +0100
Message-ID: <CACRpkdaoPqQsDJ4TKsM8p+dztHCZh7VSyWRohDWd+i8=JPTf3g@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 2:28 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This is a rarely used feature that has nothing to do with the
> client-side of_gpio.h.
>
> Split it out with a separate header file and Kconfig option
> so it can be removed on its own timeline aside from removing
> the of_gpio consumer interfaces.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for isolating this problem, and kudos for even updating
the TODO :D
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
