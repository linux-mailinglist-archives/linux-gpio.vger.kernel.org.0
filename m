Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1732F786B17
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 11:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbjHXJFo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 05:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240604AbjHXJF1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 05:05:27 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0162619A1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:05:22 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d77f869dccfso497369276.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692867921; x=1693472721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz0lX7obyRYwFXDDijisdLNdcDWsD7huiQfK6bLDL+s=;
        b=Y4k2G7rUKYYr6TfQBfx67NJK4eAav+BB+nUOF6RphvYOT6JuXG9mpwoXwekh9zmb1f
         XRA5RKT1+2TO6WlaTLbuXvN7/oWgEb68yEDRQw+GHmcf3w2n6HncvPCD+6/NWuP5sb8N
         LNJ/s+nVmLHXPGtSLKLp4mSYpA50+B8Jg5s1u5kogxF+ZLeOiK105OgnEUURREhbKBJc
         HDUn0gBMtZPGDy00wHsor8bqJsReloLy1p51pQlBo5xFgj/sI2uMzmj9weQLnFQwldM/
         emE8aTcKNrabznb/7rv0b5rM0pq8rB3qSQMOF+PmQSQEnS0eu5VNJ95O/DUUmcT1sYpX
         o0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692867921; x=1693472721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oz0lX7obyRYwFXDDijisdLNdcDWsD7huiQfK6bLDL+s=;
        b=LGK9AwYg9uo7sHFD2odaun729IWCFXyh+miveHDZf2EBRhgb3qDVhGSK5pQYjl2nD8
         dW9uTR/zuV8sQsT49kXMIdU6WZe7Hmp0+r48cHjVxqNW0cRGOzWgnNlGua1vNLUdh5Il
         sa07uo+/f+KBc78kI2QH+qRIjxowx5HFocZDwBErfQkX3klLit97NvWytY/8T+GzOZw0
         UR+zTel7pDaPO3uoeZmB9vwyyq1kOJ2HvDEWwbliob4DBUknj5QFH5uUOAxlxBLxMHnl
         hyvRh3qyLRn5zvnuGgBnO4/kLi28Kt+aSsMhuPgXkVCH5HQaRxww+Gf31fKiLNi5XHd3
         ivVQ==
X-Gm-Message-State: AOJu0YwG/5g/FlrhMvI3Mja3sGejqG5lCaPgKPfe8HNcDBLPJN/lGtqv
        UnFlJrEBMgohiC/qohh7oRMqApoq80xH6ikcMrqRSA==
X-Google-Smtp-Source: AGHT+IGO5uHQDq4lmkD/OXBfXWOFXFDEC59MvVmxu2+oSwdNQOmJXNPTBg6ZAwq+rdanXvgyYiPX5NPQz3vl9go+Wwc=
X-Received: by 2002:a25:320d:0:b0:d14:6e28:69a4 with SMTP id
 y13-20020a25320d000000b00d146e2869a4mr13981058yby.29.1692867921757; Thu, 24
 Aug 2023 02:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230821153339.26305-1-brgl@bgdev.pl>
In-Reply-To: <20230821153339.26305-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Aug 2023 10:47:17 +0200
Message-ID: <CACRpkdb0y20JOdmzqMdEZB1_LbSKSY1nOtzhfvyf=eC3o2_p=Q@mail.gmail.com>
Subject: Re: [libgpiod v1.6.x][PATCH] tests: mockup: unbind mockup devices
 before unloading the module
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
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

On Mon, Aug 21, 2023 at 5:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpio-mockup relies on the GPIO devices being registered in module's __ini=
t
> function and them being unregistered in __exit. This works with the GPIO
> subsystem as it only takes a reference to the underlying owner module whe=
n
> a GPIO descriptor is requested and not when the GPIO device is
> instantiated.
>
> This behavior may change in the future in the kernel so make the behavior
> of libgpiomockup more correct and have it unbind all mockup devices over
> sysfs before unloading the module.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
