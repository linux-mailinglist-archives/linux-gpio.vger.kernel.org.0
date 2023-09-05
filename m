Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1537927EF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 18:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbjIEQTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 12:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353922AbjIEIht (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 04:37:49 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA627CC7
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 01:37:43 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7a4d05eaea8so790843241.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693903063; x=1694507863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpHFtm2THaSdixGrwHLfve5bKSsogpNgznR46/rAI8Q=;
        b=LK355mLUVlYWcVLJYzOKbCwA/c6MjFh6VpoiGz6b2DnKuzyefwo1Wv5cRvK8e75/kI
         AwHxuDc0jw+yBfN+AowhfneCMSigF1XX9y87d2PAgcLq6MOA4RtZtfwPMNamcPZxRmmJ
         xpizx0/J/D1pWZl89n7bkbixNq6A73lvoPeN0S18+zXGVTX0oGuFPTMaFKjHq5QkKks+
         xau5dvJ6U3DGa8Nm+JNmoLVvHvjinnRabyhVuGv2w1ZJWSJKUjd6ZLFNwopjNYvHpTQV
         DmeV2ZkThHXCfB9Ge8RCYvulwYy62+vP8sh0e58YgHOMjFoevG7CPWd0Lm5lOZ8+SAzs
         qSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693903063; x=1694507863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpHFtm2THaSdixGrwHLfve5bKSsogpNgznR46/rAI8Q=;
        b=EvidMo/vcrLkXI+lU1SUfR4cu7UkN4aEbjDv+Ab3FiW1ghXmL0ZwemKim0Q/+nQ9bf
         0woW/VkbUU+Q4udvKKWHG1srNqVfq25wmrB9K4qJYDX43+qx4Z2aWQ92ok4O6Yr9p54s
         HUh5wSuSzi3sjH0GHpPjTj8OhBIoDVd3vlZk6AXgeeaDnPfoAXj+ONHvkwKEjYQ1yyTx
         wM9Zna2QWaipmIhp3JA2lrXnX7vfWCE2wo56wwNYE/2kA/vmzzPxQ8gvrLqPViqbPYMr
         FJ1MRhaBdaVpIRprRTysCuBpCm5Uw+EiYymT0ZhDXoQ6r60mzVKw5Xg/pIVtvsBuHhui
         uiRw==
X-Gm-Message-State: AOJu0Yx9yNzX+cR/Ednqk8p3hEEV4ll89XsSJ8BqDG7ZdFr92vwidwWx
        OTmXisR8tNQstcRuhSlkMkduiuxS7mJmgk1eEaVudg==
X-Google-Smtp-Source: AGHT+IFZqQ6NUVEHdjCmDa5Gac5UutlTevVj90aTgLVjwaCXFeHZRN+XSXCgpz0qM5EyEULv6okfGE7VoUrVAqweOQE=
X-Received: by 2002:a67:e294:0:b0:44e:ac98:c65f with SMTP id
 g20-20020a67e294000000b0044eac98c65fmr12293123vsf.21.1693903062895; Tue, 05
 Sep 2023 01:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230904073410.5880-1-brgl@bgdev.pl> <20230904073410.5880-2-brgl@bgdev.pl>
 <ZPWjAUzqeAwF1wro@smile.fi.intel.com>
In-Reply-To: <ZPWjAUzqeAwF1wro@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Sep 2023 10:37:32 +0200
Message-ID: <CAMRc=MeMYi0KbK=1RYGX2zbUjVZyQp-Y_aXfy6+EZcEtUSEU0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: rename gpio_chip_hwgpio() for consistency
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Mon, Sep 4, 2023 at 11:27=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 04, 2023 at 09:34:10AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > All other functions that manipulate a struct gpio_desc use the gpiod_
> > prefix. Follow this convention and rename gpio_chip_hwgpio() to
> > gpiod_get_hwgpio().
>
> Same comment. Also, I don't think it's good idea as it steps on the expor=
ted
> API's toes. I.o.w. I won't mix those two.
>

Even if I agreed with your other comment, gpio_chip_hwgpio() is a
terrible name and if I didn't know, I couldn't tell you what it does
just from looking at the name.

Bart
