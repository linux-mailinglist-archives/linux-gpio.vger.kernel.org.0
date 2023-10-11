Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E207C5840
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 17:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjJKPks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 11:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjJKPkr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 11:40:47 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FFDA4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 08:40:46 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7b2ca45d5cfso7085241.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 08:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697038845; x=1697643645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiqkmLVKop1bY7kTu5d76rBX8seKJtFxmVTzPnLP1bo=;
        b=XZfm5mX20l7kN7XURvmKfywMsDFkQaUNiuQRtjomgY82Y61T6/jK/U/LCOeVdgnv1G
         WvKVC01KnBcfUy7xXklqmPQma9i+tgQTth5ng2gjEDeKAR923l7PzOPwkE5/qTQ5asor
         Jt3zUOSDULyfDXfSKTWbf8aNTMvOBrbr6ktcXVaKTvLBNg2JnKWNprl2o4EY74A5L1Vg
         NO3+t/gNiApPoe18Q/tj+6w7eDNBTH2o2sPPrR3G3q91+H5WslKqx0plRHNWzHT8ZScy
         iWBUpP7iStCNgSFMgrWYU2kykL8v+SSUPm1UlGssmZVfUzYWXOEVLuXq7QB9LIutKMvm
         W2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038845; x=1697643645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiqkmLVKop1bY7kTu5d76rBX8seKJtFxmVTzPnLP1bo=;
        b=PURM8kpLUsDrJnncBQWdLawGnbAZ1m67Gp6ETswG65GbpOkIYeFZrnLEVpW0a46Inz
         5N2U0FgoXY4YF1/kFlq0Yh8eFSoQgZOLU0tsdJO0RkkvZeqMfT8mSAdzLhk4W1Pbds2u
         xDx+9eDBVpE7+MDfoJQvSNOcnJxn1T3swCxa8kAeoFpb+dN4YuggX5vJt+V7xHBUws/5
         Ny0X5/C3q8PqR9rgwyeu2jeml9Ued+EUoSK6MlsRV9/AaU9O3rqMus7zDiHicdVE3S69
         A+tu+2VGihSuCR5+99N/sL61GSx0TMN9Ou4MA2LFrSkjH873VcDISMYQJn1k+sLQ6tRB
         eIvA==
X-Gm-Message-State: AOJu0YzXVQ4z4eceT74rYKM0L79b/fN2Ldo+FYcpErAhhiHxBwgCqhJf
        fNEPnkjWErOQZ1KXl4X3PiEIO7xdJFtEbuKno9gT0A==
X-Google-Smtp-Source: AGHT+IG5JPt7jU/kX+X7eDlJt7BFoHK21OdgrQOLlEuTAOd7ghzmyiZ7IZjjbLxUGh+HsuIIZJ+c5yN5NRQaFOz0b9o=
X-Received: by 2002:a67:b908:0:b0:452:5c6d:78c9 with SMTP id
 q8-20020a67b908000000b004525c6d78c9mr20597977vsn.12.1697038845467; Wed, 11
 Oct 2023 08:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-pxa-gpio-v8-0-eed08a0fcac8@skole.hr> <20231011-pxa-gpio-v8-2-eed08a0fcac8@skole.hr>
 <CAMRc=McWj1RHw-um2OcCpkToxXg6R63vLGTGfMTFiMSr4WXkJg@mail.gmail.com> <5740986.DvuYhMxLoT@radijator>
In-Reply-To: <5740986.DvuYhMxLoT@radijator>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Oct 2023 17:40:34 +0200
Message-ID: <CAMRc=MczBWwY96pkn1j5-EGK6ibrH3s12R_4Y4+OfDJWE4WbJw@mail.gmail.com>
Subject: Re: [PATCH RFT v8 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 5:17=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:
>
> On Wednesday, October 11, 2023 4:21:39 PM CEST Bartosz Golaszewski wrote:
> > Which driver consumes these GPIOs? Doesn't it need any conversion?
>
> That is drivers/leds/leds-gpio.c which has already been converted to the
> descriptor API way back in 5c51277a9aba ("leds: leds-gpio: Add support fo=
r
> GPIO descriptors").
>
> Regards,
> Duje
>
>
>

Perfect. In that case:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
