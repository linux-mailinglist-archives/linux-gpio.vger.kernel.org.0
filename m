Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B6D70500E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 15:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbjEPN6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 09:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbjEPN6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 09:58:11 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1964E49D4
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:58:10 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5617d793160so15506837b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684245489; x=1686837489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WThK0RP6IIU5fNVkO1bRft41UD70/Hf/Gn6lHhOsC1s=;
        b=HmwkY2wodCDgUULJ81Fkyk9fo6uFME8MgDIHmJCcrGG7UU8YLjqspl/bLjJOdL13Q0
         ZCwcLORRUSVTK/S2n7gC0GKjWL6RwN1j6XEOyW71fnIz7wSfn4SOmMODKKLjMCHy6TQT
         yCbq2MW26byfYL2c0KTPWeQwAkKpcF7HZMwx/Xmug8jiAaSc1+IgnwyqB8ZG6sAv2rlf
         Wgm+Rg9z7YE/G3C8Y6fA0rkrgsNkuAciCmsgC9u75eht2sm6u6V5swjD7Ch7rN4/hpo+
         SQkaQaSaE+FqYQrLpgBSOA6p70/UthOSbFtx1y9+HEKjohqvle4W6WVmLS7sFka/PUbN
         eUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684245489; x=1686837489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WThK0RP6IIU5fNVkO1bRft41UD70/Hf/Gn6lHhOsC1s=;
        b=UxbzzimMq2dBmlnYRk3RIdDTa1BtubBfnHAZdmP25ud5F2VEVS13eMxa4RRJe19DeI
         qXx3nAKzVUHZcoRvmMmos/wENOeQw0blC1fzrKruKlTdkvh/zK+o0ZOEXsARpdvHnw7t
         YHFPO+HsRiON0zlbD8cqU/YasMO5aT+XtypY6RGgFz/rCScMixEiBg4/v3sUkfTF8R0t
         eclUjx7FoJlvh42vvojowqWryDeCBNmIYImeOB7s88eRNCP22oyJJiZ5gBLrepSnv6J9
         H/HkVkTwEnVYlj67jpSHrJN6aqo93+4sISYgnTAzGMgBYLWlL25bKAxDDz5kDpNRlEzY
         XCzg==
X-Gm-Message-State: AC+VfDyIBEyux9YhAu66d641OOkcbOoLB4xwhQlsKTKe5EUYRAVthJo2
        lT+c6mpLrtztTSEif38iNP3Mf0cdlfykZWFrwgpY/wqzrIjbnjrX
X-Google-Smtp-Source: ACHHUZ7JP+kJk7OwmFu0wcuva7/WsLYtplfy8+SvFsX4iZHfWMGF/dfDg1ApiLLz8fEBMeqGpk4P0w6cVBcd75VvoKs=
X-Received: by 2002:a0d:c101:0:b0:561:1cff:8675 with SMTP id
 c1-20020a0dc101000000b005611cff8675mr11601079ywd.14.1684245489008; Tue, 16
 May 2023 06:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230512042806.3438373-1-chris.packham@alliedtelesis.co.nz>
 <CACRpkdYz9ipNTo2ORXKWy5Q4uCpKL=9Gd+kK76pestX7Onuz-Q@mail.gmail.com> <b36fcdf1-45ab-0c06-efe4-237df0612466@alliedtelesis.co.nz>
In-Reply-To: <b36fcdf1-45ab-0c06-efe4-237df0612466@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 May 2023 15:57:57 +0200
Message-ID: <CACRpkdbiSAFoJP_JB1d_6gQ+Xx7Y+mLAh=C6Za+fpyWuRe6Gbw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Avoid side effects in gpio_is_visible()
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "johan@kernel.org" <johan@kernel.org>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "maz@kernel.org" <maz@kernel.org>,
        Ben Brown <Ben.Brown@alliedtelesis.co.nz>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 15, 2023 at 12:27=E2=80=AFAM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> In my original case which is a kernel module that exports a GPIO for
> userspace using gpiod_export()

We should not add new users for that API as it increase the usage
of the sysfs ABI but if it's an existing in-tree usecase I buy it.

> The crux of the problem is that the irq_desc is created when it hasn't
> been requested.

The right solution to me seems to be to not use gpiod_export()
and not use sysfs TBH.

> In some cases we know the GPIO pin is an output so we
> could avoid it, in others we could delay the creation until an interrupt
> is actually requested (which is what I'm attempting to do).

Yeah I guess. If we wanna keep papering over issues created
by the sysfs ABI.

Yours,
Linus Walleij
