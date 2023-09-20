Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E297A76F7
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 11:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjITJNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 05:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbjITJNT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 05:13:19 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37D5F2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 02:13:10 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59c00b5c8b2so58307327b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695201189; x=1695805989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vty1xIk4CuQ2B/P6eWEQzTFddTHFTE+WpciZ+JlL/14=;
        b=JLGNhH8eye5BhP1iINvONB8EcYkisgTJoAzehcfrM8L1AutSnq29VjZ0MZC24b3Puk
         lW3wDCGFRtFC60m5V4BGHZnBuRkrWCoCaQpxeaiQTsRLpwPoQbAUp72rss0rms5IDc9O
         MMaQMr6b42pp6KV3B6y8ql9bMB/LL/aAlUmDOAqMoV1cUDoWQ9ebgLlY+hzzcv1ERURi
         ho2fBqhFk8VNkSKBVvs1F9v0VrpnMcoMzRI12SdsJyUri+Gfd6xHTXRYGkjeKoComQuI
         iAUnl6Aun925mIwMMEtpnfuSrVIw+iPUgE9hySnWxpVmxreLjJIoGLcIguvdpj/ztl9g
         DTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695201189; x=1695805989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vty1xIk4CuQ2B/P6eWEQzTFddTHFTE+WpciZ+JlL/14=;
        b=NUYYoBo8Vi03pBheV+oFcjYW9D9zORpPHiAW/MPmiRGz6g4wvvvsteLCth9q+lxALZ
         u2s4M9dVWg8vhGHdjx3K/I4hVJTpnRnodD6FKcKvp2VyNF+z0CqAkHoaEXwFTFutCayY
         x+KnuZ7rpLaUcAkbxH1+d0S5KVWlHRtQEW2l0mbWJQumdzG2ddPzWnlitl/1E+MKcb4j
         /Y70kFoauPpmoXGp47wIKXxUybCYWTFCZUEMn5QIA8birBgKKhc6z6VeXknGHfjVKmu8
         eiMA3GxvmG0y4nBrJb96GCFHaf+LIC0RfsuhLGeLif0DE79LLjfkP/u+cuNW0Qrl6XKg
         ui9Q==
X-Gm-Message-State: AOJu0YzT85C8ES2JYJ4qXbSKTF9hDvogueR7aRqS8mnGNzmgzZ+ZZcbp
        m55cQaJn3DWi9MqzPUuowyJHnmuaARyBHMpMYwZmX+5RLS5nVIzt
X-Google-Smtp-Source: AGHT+IElr+vl7Tz3vaENa6MnGS3Oo+p8Cjurdm3NB8UkTqraBKAlyZSmjedBMUdhGemtw3MXPEHiehvW+vtNx1R8Ias=
X-Received: by 2002:a0d:eb4f:0:b0:595:9770:6914 with SMTP id
 u76-20020a0deb4f000000b0059597706914mr2133189ywe.35.1695201189141; Wed, 20
 Sep 2023 02:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230920085639.152441-1-brgl@bgdev.pl>
In-Reply-To: <20230920085639.152441-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 11:12:58 +0200
Message-ID: <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2023 at 10:56=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are two places in the code where we retrieve a lookup table using
> gpiod_find_lookup_table() (which protects the table list with the lookup
> table lock) and then use it after the lock is released.
>
> We need to keep the lookup table mutex locked the entire time we're using
> the tables. Remove the locking from gpiod_find_lookup_table() and use
> guards to protect the code actually using the table objects.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I convinced myself that this change is correct, good find!

> @@ -3822,8 +3822,6 @@ static struct gpiod_lookup_table *gpiod_find_lookup=
_table(struct device *dev)

Can we rename this function gpiod_find_lookup_table_locked()
as per precedents in the kernel, to indicate that it needs to be
called with a lock held?

Either way:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
