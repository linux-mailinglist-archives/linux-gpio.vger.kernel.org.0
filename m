Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5BFE735772
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 14:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjFSM63 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 08:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjFSM61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 08:58:27 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE20E5C
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:58:26 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-471b34d1bb8so247860e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687179506; x=1689771506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nTlBdyCskY5GmVX8U/waczreweY+OWJADIQiRcW99c=;
        b=elc0ZkDEycpGhzecM6LnDSbegH+hue5BT0jZw8JZ8UDgZC8IKmqsEbDE8FzEkeeoj4
         xsrduwtqYD5ciS/5ff2OM8VVzgWErDSs95kxGoJBc3zpSF2Q8AOM7hnesKwHw74CFZz5
         HykbTnn1n0rXdH/0GIGPCm18HsnNuKC61Jl1dUCsh/AQIhaPlDkbJAd2OVGdA7+Gn8zr
         F0qgFzOR+EH1Hovph6C7HBd7NEGl4vMtxMWRgZJj4Z4Bv1rjXujfkwBh/tNgi/fPVV5Z
         XaWLEa1fWRLRofYPFFjtsyzzc72piWiDVWhtfooGXeIdU+S9OrWxlwcBqR33TFlulB2J
         JAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179506; x=1689771506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nTlBdyCskY5GmVX8U/waczreweY+OWJADIQiRcW99c=;
        b=gUNWobwcommLPzSwW5FBq64VJNnMIqdZz1Khs25DoqCwnk/Su2g7/CPF+kUqYRprBA
         pEhjsI1Jo1e+wAh6hM5nflYQIIRmK+GBF7fjW8cTIkjg6GlleESWyYTrl2bdSwXSJ3Co
         Wsj11Zw6s2CgGS/iUnt3QJ5gBHdskootjYGQWjdmYeRSKceQhcwfL/LHqjKGTxea5z5Q
         x6xVtme/BrVabrPkJnlrwbc2LhvQzk1gsYRHWhaTEuze9RYQuZSFTZgrteOj+BUYwMyK
         RzbcUdVIxH81V2xQPci+eRgxNvNpro/LfgGk7YW+I9mHee6kxyM6Zit5xtpH+IzJXD7b
         w16Q==
X-Gm-Message-State: AC+VfDy1dQG2LXKig3G067mTJ/0S+rUApTwoW/vH3jmmfE4+0xF0iVex
        lHhnxbifKsQM+LAS1xurCMMh6Iu5kbWLqIbKF4/R0g==
X-Google-Smtp-Source: ACHHUZ63r2svMF/SwxoJlv6EwdVtT4ncETqgHWe0j6vpD/IfJHnS1tx3/Y1+l2viqVW9C/TGrw3L182SDvDQDT/Mb3Y=
X-Received: by 2002:a1f:bd88:0:b0:46e:8e97:5e50 with SMTP id
 n130-20020a1fbd88000000b0046e8e975e50mr2236362vkf.15.1687179505809; Mon, 19
 Jun 2023 05:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230616-fixes-gpiolib-irq-domain-v2-1-e28b47fc3e45@kernel.org>
In-Reply-To: <20230616-fixes-gpiolib-irq-domain-v2-1-e28b47fc3e45@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 14:58:15 +0200
Message-ID: <CAMRc=McB25E=QAcBANE5RdM3SAQkuSpn9aVO+hN5ZnEjVRGb2g@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain()
To:     Michael Walle <mwalle@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 19, 2023 at 10:56=E2=80=AFAM Michael Walle <mwalle@kernel.org> =
wrote:
>
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
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---

Applied, thanks!

Bart
