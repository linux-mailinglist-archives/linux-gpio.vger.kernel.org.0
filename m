Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5997F6BACDD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 11:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbjCOKAR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 06:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbjCOJ77 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 05:59:59 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEED8235D
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:58:47 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id x25so8373104vsj.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678874327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UETJniz/O98zlZqk47leCUow9oRq7Z1Nu1ZbHvmon2o=;
        b=o+EHwii/d5xrY6gJdZXhjFyqlJxcgQNljiMv/03XnA8vj6caGtGWtHkszWV2bRZ7Ir
         /qLCNojgvrMs5IzKarEd2Dw4775PBEgnq3nAr8Sg3RTqLUGertjL71RwQvZkDZ3F6OyF
         tx9H2c/CXQ4GhxCbxpgsGACgKORSa7taJhg9L681+DemE2jzRSxiTIcM27j1GRwOyQz2
         hWrLN12tiYcOWuHf3R0e6Vleu9k379w1decYL9li/q+gR/M1q65g1JLYcgisMymoB0vq
         Pfz/ZTgO4cjhb7kxaSwtrcNJ8e3IcRn8ROp6tEFRESlkA0bb1f0tVbRwtt70vCLSLXQl
         q/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678874327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UETJniz/O98zlZqk47leCUow9oRq7Z1Nu1ZbHvmon2o=;
        b=4Q0WGIedloPOwHKNZQ0wYjBMJncGuFGSMbZPaIp5VNWtMY1OmvlakZJyKtXH2gy7EU
         dWoShGG28rLXdqdgVt2REyBu95cRgv7xCkdjIeimIqKvJIOpv9tljv5ItXjHzvdN63bP
         JRHyh3NkXLl+n+6ux6AtGMDWRjqufrdEPooHOg0gZUHLwuZ8p7Qq8h/hbclf2E0OitQl
         Ti2LTnsdADPTMc24g+B+wb/Z6gK7Wt52NJrlQw+BQh1n9bj5Q6ahOnACEzL+9jefJjUE
         D+4gM0ob6V7SgRm72YfWSLvaxfPC57jChmU3OX5UJ7vwJl2HWEXttj9Vcz9XizbFuaI8
         Rq7Q==
X-Gm-Message-State: AO0yUKWhbli4wjCpYqyYqbV8jf1a0hBvhNexbreubXHfW9GaRifQMqaP
        tUZqOrSozwKCxF9OXC8yKwSpj16FPnKzBH7V68JODw==
X-Google-Smtp-Source: AK7set8voa2ABEzOIvwhhpmNpGSSvP8pFb9vDR5UZCgRGxqHFsg+97YEyw5/5hJWqpJIkXyLLYj97Bk7gs7ujv+B3bA=
X-Received: by 2002:a67:ea49:0:b0:411:a740:c3ea with SMTP id
 r9-20020a67ea49000000b00411a740c3eamr27093080vso.0.1678874327058; Wed, 15 Mar
 2023 02:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230309185819.85050-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309185819.85050-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Mar 2023 10:58:36 +0100
Message-ID: <CAMRc=Mcp+oU-ujr9inAwD_cG=MVCTUR82sd0CwoZFujch4HcHQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Use IRQ hardware number getter instead of
 direct access
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 7:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> IRQ framework provides special type and getter to transform
> the Linux IRQ to the hardware pin. Use that type and getter
> function instead of direct access.
>
> While at it, amend an indentation in a couple of places.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
