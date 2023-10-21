Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0927D7D1F42
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Oct 2023 22:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbjJUUCp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Oct 2023 16:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbjJUUCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Oct 2023 16:02:44 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81864D52
        for <linux-gpio@vger.kernel.org>; Sat, 21 Oct 2023 13:02:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53fc7c67a41so3845010a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Oct 2023 13:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1697918554; x=1698523354; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BUr0abvZCLa5ZjROveiZrf82Tea/s9MUxEcODZD/52U=;
        b=fLoPhxEmosIQSnD+e8PYsLoFNZIz39aM0Gh8ClsvTDawFjPLala1beRJrDd13M8raF
         cMAgSejIXJrl8D504LgBhaV0o1fUhv7/PDFrKrWtQ8jUIwTTJyRKbmL+h5CtydRGjrnJ
         gekFO/J2vSXAmn7TOmnv5SUN8yfIhGFIeQDW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697918554; x=1698523354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUr0abvZCLa5ZjROveiZrf82Tea/s9MUxEcODZD/52U=;
        b=GyLdRGcXy95oiOQnnlKzR8rOtBfWFzkVgetUYdofQo1sT/dayQRZSIJ1lfV/2nIi14
         Xd/mZG9dlVavOPLT0lPw3Cdlg7yhXEI3m7QH4Kq6m+Hy8xkZodXL5N5QJfyj59VyhywG
         1/5rFm51Ubcbxi4YSUI4NTo6lbFK2aD158gho8bsJL3qJCtclUqtw70ZFx1433HHerel
         o876GfuOFC+P3vTATiIrsjbY+gSlTWqgGVBZ9VvZdfLrM4tlb2Zgi20V1LdUbB5zMwyq
         8ssu2uMm87Gm4M8P6xCijQNCyGLDJ0LstJOAjSDdcNmhXaZeLckFmVKY78xeZVz5sRH5
         VIBw==
X-Gm-Message-State: AOJu0YyV5Fr01PDDgdpyf2OedzEzzMhNU5i3JhdQjr61vyPEFpmSniVI
        FNAGVOl46n0SoOReKWQ9Rqn6+1q0IgQc2X3NTcLCVSm1
X-Google-Smtp-Source: AGHT+IEY8qWGsq+iXo3cWywuRTIkRcRwgtUrfMORqcXNuUx2jrbJbwMAGvkFKEMTc82k4Pi7BbKtXw==
X-Received: by 2002:a17:907:9491:b0:9ad:8a9e:23ee with SMTP id dm17-20020a170907949100b009ad8a9e23eemr4624556ejc.13.1697918554693;
        Sat, 21 Oct 2023 13:02:34 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906075700b009a1be9c29d7sm4082442ejb.179.2023.10.21.13.02.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 13:02:33 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso4179663a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Oct 2023 13:02:33 -0700 (PDT)
X-Received: by 2002:a05:6402:214e:b0:53e:1207:5b69 with SMTP id
 bq14-20020a056402214e00b0053e12075b69mr7077779edb.10.1697918553480; Sat, 21
 Oct 2023 13:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231021183925.22831-1-brgl@bgdev.pl>
In-Reply-To: <20231021183925.22831-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 21 Oct 2023 13:02:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiOJO8nfcDeUMwYXPQHLtTnngSDd4ieUWegW1Aru8TbnQ@mail.gmail.com>
Message-ID: <CAHk-=wiOJO8nfcDeUMwYXPQHLtTnngSDd4ieUWegW1Aru8TbnQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.6-rc7
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 21 Oct 2023 at 11:39, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>  drivers/gpio/gpio-vf610.c   | 15 ++++++++-------
>  drivers/gpio/gpiolib-acpi.c |  1 +
>  2 files changed, 9 insertions(+), 7 deletions(-)

I have no idea how you get that diffstat.

             Linus
