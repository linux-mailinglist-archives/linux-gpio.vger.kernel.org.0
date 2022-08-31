Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCA25A7D9A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiHaMka (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiHaMk3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:40:29 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B714A6581A
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:40:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lx1so28043629ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=MCBuc3iFnBItgcwahvmF8Fyf/yByT2EhRd1eNSiQSjI=;
        b=ZyGZdtZvlUcVjIqEYoq7QSBtvxtLU54sf8bj9ZWaAW6WJ5+bo/iDixWUKvoWzuj3ah
         2kQSxN6F9EdAOXMasrVeA1rvNKYrJG92yU9BQUwRUSiBQOJZwY28qDThBSdcEPh09pHm
         eaKl5K7VT5xnjIQCn2cquwL/U91c8cfvCkWezWaL11HuJp835rN+qdEJ3IN2kwz+yKk1
         EVz8rhUXBiBGiVq16atOcvL5MJlq1zv1NNfZ5ld2Jt8MSKzFGT55/j1m3kq2GUjY0gVA
         2jh4hutLkDQhnU+QXtX+LDVJrFEeCxa4rJzWIgx7cJX5o6n7NC1WAFTVpN6IBhbqBasa
         aOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MCBuc3iFnBItgcwahvmF8Fyf/yByT2EhRd1eNSiQSjI=;
        b=6GkUrT9ajYCIWh7J4RtywzWdBZ28tIOoHQwG1OXD9BEthV/lTe2m9gQz0dgchh9GGl
         eGSjk2+wkfYtpGZS9Ko04EZ7wGQU+/tC+HMPL2zAnU8gti8yxlnzTHuorZ3DzhRcVY6J
         fyedbOTGQ5d9P8m+avggj0T+P4hl4qBkEMfp5CyPjo5iB41/i+vi/1QXXcpy6zjSaGnF
         94qUkX6iCnK8GsTkxy1ondC5ieJDxp7LNRqBW0y85Llr5LlmmtYAvIjgLU0zrxf0tXGB
         4uzHWMd5ab6PX7dUUGl0PwrrplPEw+dQRoc8D06thHU7QSLAGt+YQeYXVqaE5SWyrnX/
         YJpg==
X-Gm-Message-State: ACgBeo3fWhvgw+p5904ZqTyAoZumJsH+dxHEYYTnLws/g5jfaAazqwB1
        7+FcBc7pg8qROie91yXoIv34BKXa8sl1b4NdhT1vmQ==
X-Google-Smtp-Source: AA6agR5VjKGidDtLFEn1Gq6NqN0WGj/6ZAB+3gykERCjjCMt8W2xZ7MD4XByi6+Z9ZCivVK/Tp40Ki+UZvj+ZFT5okg=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr14289735ejc.208.1661949625872; Wed, 31
 Aug 2022 05:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220825094132.1268174-1-s.hauer@pengutronix.de>
 <20220825094132.1268174-3-s.hauer@pengutronix.de> <CACRpkdYL24cJgo9F1nWYzP=8+XywdUXhSedJRQFJ16MUAx7-dQ@mail.gmail.com>
 <20220829144032.GC24324@pengutronix.de>
In-Reply-To: <20220829144032.GC24324@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:40:13 +0200
Message-ID: <CACRpkdbA3FR_sFrj9FTH3Ui8so-j654wm=5yTMUydZttsU_HMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add gpio-latch binding document
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 29, 2022 at 4:40 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> > Hm I wanted to just call these "gpios" but that is maybe confusing.
> > What about "latch-gpios"?
>
> Hm, the clk input is used to latch the current state of the inputs to
> the outputs, so "latch-gpios" might even be confused with the GPIO
> routed to the clk unput of the latch.  Overall, the whole thing is a
> latch, so "latch-gpios" doesn't sound like a good name to distinguish
> the different types of inputs of a latch.  I still like data-gpios best
> as these lines are described as "Data inputs" in my 74273 data sheet.

How about "latched-gpios" (notice the "d")

It makes some semantic sense.

But I will not nitpick, data is fine, just a bit unspecific.

Yours,
Linus Walleij
