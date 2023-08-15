Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6AEE77C956
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 10:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbjHOIZ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 04:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235678AbjHOIZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 04:25:42 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1280019B6
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 01:25:40 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d299ed34bacso8779539276.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692087939; x=1692692739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23jECqG78zEG3HfSc2yRh/FpDDmbVzDHRMD4lKV1Qhg=;
        b=KrAmrNKUHuRm6x6qlsh9bYHKBIw2hgyxYwBasiPYr13Y7RcMrEgNnzbFrhlHEkHEfX
         bjB1lWHu06GPmC7I2aE8HstA6NkWNE4nVws19U7sf8H13s+yPNl5T6WrOsEGDUBhtTqW
         /ghwoaxqoSRy2USBKiK8CsvEjOCViGe0kpeCcL5gebeQIUwd+vIfPCMXBWZF8A0aKdHk
         Ke9YXOeaAjU6Q+2s1+vFiqznepMv/nquREaV7AHxQU9om1CT2Lje9wnIvIlKU6wonc34
         MQvWpz7BR/JHWvOZS+R52e4yUqy8CRbv30/cQyr9WrAnBB4YHD1uulxLnfE6HqPKEcHT
         353Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087939; x=1692692739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23jECqG78zEG3HfSc2yRh/FpDDmbVzDHRMD4lKV1Qhg=;
        b=H0RWJOtbcHOQSBa3CSj/dWHRLXveOYeDxU3i3JOyt7BfU6EVvIc1gDbJN1hUhC2Ba7
         qnMdNd7bxW9/Tg++/SQyDTstfXWPNlGaxKUqO0PJAx6wB3qN7inmETUY1HHUXaJ1TIW1
         pCS6+nfCbtYbuuJugF3AZlz5vlq1wf4VGN7KTGPo5KVdjJEK+uwRjOf4KISIhaN+EVvs
         HnIjOMsSVReb7yvsQm9SeFoP5431i9TNxbQcOn+2irwYHGkB/vs+v1dAIkH7lNV91pvH
         XI8ekvoL/ZXUxzIkCw0Q3eKf4WAyDwbtRKZNKvhMQOHnZjO+jJbh5hD0XhqzP5D0HLA8
         viUg==
X-Gm-Message-State: AOJu0YyAiaNdCUri4YN3bXF8syfPm3k5+BYjmXFqEn364H03U+c5/z0c
        PdNwDgXFVJYdTmRNb6WS0dJEmlRuW2THesG7csAJ1g==
X-Google-Smtp-Source: AGHT+IFNKWTuV42gNaFpktsjwDEK1ReaVlEtEwPvM2nJnyAEc877GkSXWg80Fwj07E0shOJ0yHjG8mue8kSNObUAsU4=
X-Received: by 2002:a25:dc44:0:b0:d71:e9c:4e7b with SMTP id
 y65-20020a25dc44000000b00d710e9c4e7bmr1437799ybe.3.1692087939307; Tue, 15 Aug
 2023 01:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230811193034.59124-1-brgl@bgdev.pl>
In-Reply-To: <20230811193034.59124-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 10:25:28 +0200
Message-ID: <CACRpkdb93yAdW7+YLd0jNK8ZsBXsqNCqpUxnB6ENn-2td+vzmg@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2023 at 9:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> After we remove a GPIO chip that still has some requested descriptors,
> gpiod_free_commit() will fail and we will never put the references to the
> GPIO device and the owning module in gpiod_free().
>
> Rework this function to:
> - not warn on desc =3D=3D NULL as this is a use-case on which most free
>   functions silently return
> - put the references to desc->gdev and desc->gdev->owner unconditionally
>   so that the release callback actually gets called when the remaining
>   references are dropped by external GPIO users
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - add a comment about why we can't use VALIDATE_DESC_VOID()
>
> v2 -> v3:
> - we must drop the reference to the owner module before we drop the one
>   to the gpio_device as the latter may be removed if this is the last
>   reference and we'll end up calling module_put() on freed memory

v3 looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
