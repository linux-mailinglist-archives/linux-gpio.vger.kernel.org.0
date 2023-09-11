Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F3579A455
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Sep 2023 09:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbjIKHS6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 03:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbjIKHS5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 03:18:57 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88282CD7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 00:18:52 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-49059b1ca83so1356829e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694416731; x=1695021531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvsn5WhlTXckNztgCjaZWncAFCsHe8LiGt93hlutzro=;
        b=YTt1wFCPLTB9bfT4VBQreUv9mq47B2vFU8QGdrGbDrzSPAtH4T4yIk9CoVvMXGbq/4
         2f0drzabbR8Bb/TGDNv6ON3A21qSC5zAW8IqvaYkrYCesvEFA5Ms6gHvtskeOZMKd+hi
         oTS9v1BUWY47Tf1Izrdd4vCCqTcoNr+A820lfJN9Z66NBb3dxCT5MXHRa1SxFIWN3Oxe
         PmdoavzvV1ByemrKT6eyMYaslFIfcpkXK4zyhHbF9xiWcIx58linLeqluxso9Hvc1UOL
         QNPwB6aDvlljidAu4AYUqMcxwBBFzWLQNZulfiIXcakv4ocz75FscV1yZS33FrVv5wY/
         wtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694416731; x=1695021531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvsn5WhlTXckNztgCjaZWncAFCsHe8LiGt93hlutzro=;
        b=RB5XQj8CmVoGQszs9En06JMt4lnyXwuabqzfNDOJfQUodgNZ+T/ioPrPIlkyYwjOL7
         V5jTsdynnlvN9bTKZ2Y6E35ScdRIGDjwdbNGhx1G1f3mIsyKE7/jVmcZ0x8phPv0uKIt
         x1wGdCvE/MTTF5jr7gz02Xi+4sMDS4cY0vobmxUoCS53tINNiFBglCB4b8i6xztLsCwc
         AmmDSO7/Ju4sQfOtHV1CiPXfxRzKKsq1tOBtXRc1SlvCnPZuexGFUylfdt/x/Yxkwia0
         KRpzrs9/thkEZaWhdHUSMfHdnMZhc2I+x/b4pmtzHDurx4+I3gjkStQgiOZouJYjqd2y
         heCg==
X-Gm-Message-State: AOJu0YzwwKDVpxek85sYZWaxP2HtDtpRdfg7f65ppRTu7sxFkWSxNJYc
        qblt1oI3FZUqoKtu6tOrLsFRbmXM0jSgWimPz/L33w==
X-Google-Smtp-Source: AGHT+IG/h3CtCnmKTTrKs3EVmNCf4L+MRvAZk+BLkZuobw3vhCpzmQqEw2hF69gMMsR9FqEvT+BEextt9lHj66ySFZ4=
X-Received: by 2002:a1f:4a41:0:b0:48f:8f80:8bf4 with SMTP id
 x62-20020a1f4a41000000b0048f8f808bf4mr5572212vka.16.1694416731678; Mon, 11
 Sep 2023 00:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230901112926.13216-1-brgl@bgdev.pl>
In-Reply-To: <20230901112926.13216-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 09:18:40 +0200
Message-ID: <CAMRc=Mcx8kUHHNY0TMMvTTa5dev5Ua7W09z8UtkTbU=+iQJu0w@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: da9062: don't pull in internal GPIOLIB headers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 1, 2023 at 1:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I'm removing instances of users of internal GPIOLIB headers which should
> not be included by anyone but GPIO core code. The pinctrl-da9062 driver
> uses gpiochip_get_desc() which we should put into the gpio/driver.h
> header as it does sometimes make sense for GPIO providers to get its own
> descriptors without having to go through gpiochip_request_own_desc().
>
> Bartosz Golaszewski (3):
>   pinctrl: da9062: add missing include
>   gpiolib: make gpiochip_get_desc() public
>   pinctrl: da9062: don't include private GPIOLIB header
>
>  drivers/gpio/gpiolib.h           | 2 --
>  drivers/pinctrl/pinctrl-da9062.c | 7 +------
>  include/linux/gpio/driver.h      | 2 ++
>  3 files changed, 3 insertions(+), 8 deletions(-)
>
> --
> 2.39.2
>

Linus,

Do you mind me taking these through the GPIO tree or do you prefer to
apply them yourself in which case I'll apply patch 2/3 first and
provide you with an immutable tag?

Bartosz
