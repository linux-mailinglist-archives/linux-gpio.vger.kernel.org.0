Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A487AA12B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 22:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjIUU7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 16:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjIUU6i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 16:58:38 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF64AFC06
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 11:07:44 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-792707f78b5so49372739f.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 11:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695319663; x=1695924463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBhNwxRW2TiFrElAif7iI6ZafZNTH+8pl3WgNjQm1nI=;
        b=lb58c4kCJYuI4fG9uFWQhwnZ/Q0q5eb4Ep872R6xf6JdTMmS1ACq52vfMOcGhIHCRH
         VCmfFHnWFS1Y+giku/iAPquMknXS61ZmcfMNVkRRzyI1bEKKZpzkgUa/m8IWygPboWx6
         EvOE8Z8EWzNpzGSiX/dmtw3I64AkwOeeT1nlfkZYyeKTB4Kd7z021kmJLV4Zi0SqFCHl
         qBnEVyzbPxvknnOHSGhSHO+SOs74S7m/KL62wwsmm3/fnZXSFAqU9koGeHS7guTf/uoV
         V6yOzNJpmIQRcxV6GzCtpC0862ZGkyIog4aoSADMAZzn3HO2TJWZKfLtFCW7f2CRc87I
         fMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695319663; x=1695924463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBhNwxRW2TiFrElAif7iI6ZafZNTH+8pl3WgNjQm1nI=;
        b=ud2w1L5SYqXBianzmutSe4/HIkxzZjCx1yBWlIhkCSMtSy9O86jZ3prIpD5nkJ/IyS
         0gSyEnjzcAgtZS+OVqBY0REnPlzFBQzlwoPWyss2WwoBnLPJxpq92PuT8PKf444bZMJ4
         oAnVbEbUcYYNLONU+mjKrFBIXY2GXZvSD3w50fln9gNIaETTn2xcBoNefOhi+rhgJ8qe
         /Qg2FHDwc0/lQ+zTmdKImDu7bWSxDiwBa0epoNt8+cQhA9TtCvJolrdU38L5MoNXBPCb
         0DQHw4xoXtY2Yf8BKEQ7sNN9TFnHf9gi+24EkXWVTBGSsXHVhoPXuxyH5KKsgLWSc/8n
         MWRQ==
X-Gm-Message-State: AOJu0YzpvHPFPHETeJIbfPy5TBteJskIsFu6U6Sd0Xxenm8s0ifLNNih
        mbtYMVsyx7GGTY9QgTShhG2EokWKY3ld35ix56lEECC7y9iqw4mS
X-Google-Smtp-Source: AGHT+IFvn2xj3bCzCzglyhTLZ+/0AMj6N+3hw5k/GAMytQtun5T0UTI9xu+zqnMzKuqsF39WZXpX1QhtPlsDG/KwFrs=
X-Received: by 2002:a81:a041:0:b0:586:a2f9:648e with SMTP id
 x62-20020a81a041000000b00586a2f9648emr6026906ywg.4.1695299654629; Thu, 21 Sep
 2023 05:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org>
 <20230921-ixp4xx-gpio-clocks-v1-2-574942bf944a@linaro.org> <ZQwngrU9fxdSGSKs@smile.fi.intel.com>
In-Reply-To: <ZQwngrU9fxdSGSKs@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Sep 2023 14:34:02 +0200
Message-ID: <CACRpkdadMCXyWYycMHZ0m7ZscTayJs=378e8DPJDkEEyTOeLUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: ixp4xx: Handle clock output on pin 14 and 15
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 21, 2023 at 1:23=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:

> Maybe
>
>         if (...)
>                 val =3D 0;
>         else
>                 val =3D readl();
>
> ?

Neat, I'll do this!

> > +     /*
> > +      * Enable clock outputs with default timings of requested clock.
> > +      * If you need control over TC and DC, add these to the device
> > +      * tree bindings and use them here.
> > +      */
>
> Shouldn't this be integrated into PPS subsystem?

PPS is for GPS, we *could* integrate it into the clk subsystem (with
configuration cells and all hoopla) but as I state in the cover letter
I think it becomes overengineered for this legacy system, there are
no users or benefit of that added complexity as compared to these
few-liners.

Yours,
Linus Walleij
