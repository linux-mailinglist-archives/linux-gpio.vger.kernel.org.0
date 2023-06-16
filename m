Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9347331DC
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 15:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbjFPNHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 09:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjFPNHw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 09:07:52 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A0712B
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:07:51 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bcad7f7dabcso580550276.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686920871; x=1689512871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kyLPSg7lW2woOKm7c3P9mBg/EYKVo5C6C3A7VsM0oE=;
        b=X0YElBsxjc5tOW2JHzbsJ/cX95ZvII2wewHODfJ3nVk4A6FxM3TYOipyutD1uwwa9O
         gNzGvHOBdyPeiufgXx2WQgWAsI7a7BzOH8LCGsU9snXtE79K31IlNwWBdtNCd8Gamkib
         5CNOjAj1/me0vijRzAr7rey5jckmMSSNE9ksJqJG0HhYWQB4f4m69Ai/MOtkRIVzdrPu
         BQlC25cFQLzz43ljwXfexQJOjsHZm4qmYNcEVgu2JImEZ/fJ5y/7iGeN8+ofzNXIkoUf
         hnc1VQcatmi73FxopUvxpUjvoduIaR7EIJwJbYRviStEiKBRR3E9UWQZUR48LPW3m5Bn
         jXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920871; x=1689512871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kyLPSg7lW2woOKm7c3P9mBg/EYKVo5C6C3A7VsM0oE=;
        b=aRYV6vOt6gBW/yHIBBBsvKkBnrsrjsfRonM1g17XnTv4/Gk8g1C7aTSI9o/TjB4E14
         URWj2gqryz2x+Unh9nzOBIFkyoaqBmRqV8gI9Uhpa9ygzhhaWltBSw5IsEGNU3wC1dD7
         3i1Z1glicakPxtA0q4YGPB+EWzOytdFi+3CrIgTDCS4doos9I+qp/Yp7ll1F+hvj9URk
         7S8/2puTJ9CjrR3HVgBrxH0ibDUkxbQO0WjwGd0RJAsnGLnJ03iKvgqoRvz7q9Wmbc7m
         c8rOpmysugA/7hYCmPomt/IWfGvUryPeqtQnTjqLQc0ZB9O1GYh/8iMWH9aK7+SsmptQ
         ve0Q==
X-Gm-Message-State: AC+VfDz7kiZXgvlUkWG5Nj0XJJk7bMvQmwMr8TkvwcFErmhvoyOj3Tmx
        yUGIhCCoXtZRG0S+q0v+Z9M9WJBsz7Npa+eHIVPgoQ==
X-Google-Smtp-Source: ACHHUZ4UNXZmzz9+z8ONXfEmulc4fpjKnnRYyxP6hWCr/X3HKLKSe/AXXDCS4gqZ5n4gqF5eKvHKJQuaabFDaKOhaJY=
X-Received: by 2002:a25:2e51:0:b0:bac:42d1:3ca0 with SMTP id
 b17-20020a252e51000000b00bac42d13ca0mr1299896ybn.48.1686920871103; Fri, 16
 Jun 2023 06:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230616-fixes-gpiolib-irq-domain-v1-1-27fe870db961@kernel.org>
In-Reply-To: <20230616-fixes-gpiolib-irq-domain-v1-1-27fe870db961@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Jun 2023 15:07:39 +0200
Message-ID: <CACRpkdbkzAmwgzfL=dkHCynPFvYP-5Fcp4qQiBfbZ4649Ntn+A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain()
To:     Michael Walle <mwalle@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>
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

On Fri, Jun 16, 2023 at 9:30=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:

> Up until commit 6a45b0e2589f ("gpiolib: Introduce
> gpiochip_irqchip_add_domain()") all irq_domains were allocated
> by gpiolib itself and thus gpiolib also takes care of freeing it.
>
> With gpiochip_irqchip_add_domain() a user of gpiolib can associate an
> irq_domain with the gpio_chip. This irq_domain is not managed by
> gpiolib and therefore must not be freed by gpiolib.
>
> Fixes: 6a45b0e2589f ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
> Reported-by: Jiawen Wu <jiawenwu@trustnetic.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Oh right.

I guess we can't devres it some way...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
