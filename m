Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D15B79CFC8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 13:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbjILLYO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 07:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234567AbjILLYM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 07:24:12 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3640170E
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 04:24:00 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44e8984b724so3377249137.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694517840; x=1695122640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLhc8iMbw9INgbW/oH4hagu1vdQLEQ9RJpYm3m2tpso=;
        b=EJ14mE1s0P/favfYDo/bVmr8+1V8vvlJGd4UVr0X4Tw1QUqcxvcKqUfsC39zX3r9u9
         g3n4N/dwm76jVeLqHLwMACBERcV5XQF6BCNCLa2SCIp8CJ+jccdwOv3a4jDTfmZ6BGtv
         Z7rkmDHfWomg/jYJFEDwKAI+DtChyx9o/bSdMgAeI5NuNGyQtP7HgsW7pHk0UIKzRk2m
         Vz7wjjUKn1mRt/WQqKaQNSiY237QOzu6WxO/icRxjPQiDGHJ12MBMWwsEnl142JQaXUD
         S0RitoGKNPcuo5hYnXmG69R+wFI1fSElt/Bkgk2o3kv9tKlzeoZ2NRYyOmSQX4CE/RUf
         jBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694517840; x=1695122640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLhc8iMbw9INgbW/oH4hagu1vdQLEQ9RJpYm3m2tpso=;
        b=F6WxUD88C1bFPfDgIlriBdlcKRg5IaPh1ynKZF6qztldsraAOWGxTKxXTaovEmQxm6
         +in6zhzYCA835tCwiKOephmkF21A38KtqUXFg6rJt2lKA/sWiYviCDZ/2f9b2fTLeooK
         9Z+Md7kPm+e4buf6GzZA/i4e8UM15CjFusM4/Dc41WQ/20kKQDaMWTYfUP1Xgadqii3u
         t/YFy6HFc+GN0uuY7OKpsCAEW3pTr8/8q2qudwJ8GJ8VECSnbcnYMwSp5t9XQKFi2euY
         uGDvVtE/BGTG/mSPnzVSHkI/8AGdleyyX+rhOYU35c9fTsM5vaBsB5PmbpvLeDPFDTwS
         /Ghg==
X-Gm-Message-State: AOJu0YyoMIRPbXPpRkFp2gFnmog5xm7F5mEGYq9etq3FKkj5qoR/cHY2
        eAQySpUg2d9FY6GZI4XX7Kmqbs9rw1mMqdjkXRFnIg==
X-Google-Smtp-Source: AGHT+IE4IqCuIX3KrrXjgai861PYFw3vAuWDA9SCwCjZEAr6cx8Pa+/+T2iZB8t5fAoLBp5JFtsLxbs18LIJDUBwJX4=
X-Received: by 2002:a67:e918:0:b0:44d:453c:a837 with SMTP id
 c24-20020a67e918000000b0044d453ca837mr1156694vso.11.1694517840104; Tue, 12
 Sep 2023 04:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230912094519.22769-1-brgl@bgdev.pl> <20230912094519.22769-2-brgl@bgdev.pl>
 <ZQA+716X8EVmIRAt@smile.fi.intel.com>
In-Reply-To: <ZQA+716X8EVmIRAt@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Sep 2023 13:23:49 +0200
Message-ID: <CAMRc=McVgkt+BQ33dYE0V3-dWcJbNHALaE4-Ao02Y7jh=P=0rg@mail.gmail.com>
Subject: Re: [RFT PATCH 2/3] gpio: eic-sprd: use a helper variable for &pdev->dev
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 12:35=E2=80=AFPM Andy Shevchenko <andy@kernel.org> =
wrote:
>
> On Tue, Sep 12, 2023 at 11:45:18AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Instead of dereferencing pdev everywhere, just store the address of the
> > underlying struct device in a local variable.
>
> ...
>
> > -     return devm_add_action_or_reset(&pdev->dev,
> > -                                     sprd_eic_unregister_notifier,
> > +     return devm_add_action_or_reset(dev, sprd_eic_unregister_notifier=
,
> >                                       &sprd_eic->irq_nb);
>
> Ping-pong style detected: Lines added / modified by previous patch in the=
 same
> series got modified again.
>
> If you look at how I do that, I introduce the temporary variable with my =
new
> code and then reuse it later on.
>
> OTOH, I see that the first one is supposed to be backported (?) in such c=
ase
> perhaps it's fine.

I would typically do the same but the fix comes first in series.

Bart
