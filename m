Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955517C660A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 09:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377620AbjJLG7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 02:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347085AbjJLG7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 02:59:14 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F3AC6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 23:59:13 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59b5484fbe6so8442817b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 23:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697093953; x=1697698753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIFmNYlAB1YA+BGURf8ha/w3pHco7mLuguJQgg17NrU=;
        b=DT+OV1RuKG5TyclTIMf1IQbYnXmwyAwJJZWRR7bPGDgtOnmvT9JOLT0sU9eYHRfZfZ
         ejKO5hE+GxBU2pF6crHRkiBywZcB3BYfVcektK1pX8CXz1J6pcUynnyEddUUiNfWLOTF
         FgLxn2yp0Xb+UIzMHooOxAqGHYpArrLQEObSWUBFThUGRYBj0feiow+qzHnjmtwtNryI
         pi95cd7Ug/75hfpZenKFeRUbrkKKynS4Y3UURwl0U43jGGNSIInD0owb2OtpR87pmT44
         vo9yXQ00O3LjUg/e8OpXjemnqyANIh5U1nNhUnFY9T7LWgajQLei4AmrD9UFYUp8cnFV
         yv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697093953; x=1697698753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIFmNYlAB1YA+BGURf8ha/w3pHco7mLuguJQgg17NrU=;
        b=RCmH49OAl5uOGTOT2F2lntW4IK0qvxoKbqbRVwiEtFKsW7qc0XdCTSm2KowkzKf4Lq
         tsDBCstsgQFupR8QuRLcQCcFeneXpa6cNVOPPJBHxWFuiTXEPayrMw4MUxtyNsDVvwnK
         5kbFLEWllIe6xBj16/+uG76373xfJCoINSHOOJMJw0wn36jjnpL7nO8M8+KU4N1ZMUkE
         MAi+ME8JDCQxqn6O56a70Zw8ppbKphCZGQhrXq550qlpJxlo2/NHPx1HsARZfTrH19Dh
         Uqqs0toyQcue7D9KdMHA69Aah5EygS1Vo/YSuNiHsVJpqfkzOJzQHpg4+R73AlDiFrgx
         quHg==
X-Gm-Message-State: AOJu0YyG22T02dhA70SQ8E7RETucmCvfsCl4newIghQO2jGIaNRDcNjN
        oD7v54r1hazkFqxaX4iZmARgofWGsw/XV9yX3y55NA==
X-Google-Smtp-Source: AGHT+IFrsaoVltofG+8TvEr2LPoalB9tRfaZX/mDOWhp9hrmRfN0VLOhszhqLONmV29bVCQ61IU6QPECcxltuxJBLX4=
X-Received: by 2002:a81:4908:0:b0:5a7:c22f:fdea with SMTP id
 w8-20020a814908000000b005a7c22ffdeamr7245629ywa.8.1697093952900; Wed, 11 Oct
 2023 23:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl>
In-Reply-To: <20231011130204.52265-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Oct 2023 08:59:02 +0200
Message-ID: <CACRpkdZD=Rf2ntpNJmrvXJn-oYPyet-GALZHsdKh-W0t=pN5aA@mail.gmail.com>
Subject: Re: [PATCH 0/3] i2c: mux: don't access GPIOLIB internal structures
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,


On Wed, Oct 11, 2023 at 3:02=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> The backstory for this short series is that we are identyfing and
> removing all unauthorized uses of GPIOLIB structures across the kernel.
>
> For example: there are many users that access struct gpio_chip when the
> only user allowed to safely do this is the provider of that chip.
>
> We are very close to removing gpiochip_find(). Another function that
> poses a similar problem is gpiod_to_chip() which also returns the
> address of the underlying gpio_chip without assuring that it will not go
> away e.g. due to a hot-unplug event or a device unbind.
>
> We'll need to replace it with gpiod_to_gpio_device() across the entire
> tree. Let's start by actually providing it and adding the first user:
> the i2c-mux-gpio driver which dereferences the otherwise opaque struct
> gpio_desc.
>
> Let's also add a helper that allows to retrieve the address of the
> struct device backing the GPIO device as this is another valid use-case.
>
> Finally, let's un-include the GPIO private header and fix the code to
> access the device in a safe way.
>
> As the change is pretty minor, it would be best if patch 3/3 could be
> acked by the I2C mux maintainers and went through the GPIO tree.
> Otherwise, I can apply patches 1 and 2 and provide an immutable branch.
>
> Bartosz Golaszewski (3):
>   gpiolib: provide gpio_device_to_device()
>   gpiolib: provide gpiod_to_gpio_device()
>   i2c: mux: gpio: don't fiddle with GPIOLIB internals

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Good job!

Yours,
Linus Walleij
