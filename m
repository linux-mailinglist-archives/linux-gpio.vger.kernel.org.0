Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54ACC717001
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 23:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjE3VwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 17:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjE3VwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 17:52:12 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F834AA
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 14:52:11 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-62606e67c0dso39508096d6.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685483530; x=1688075530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/8qz9tb36j8JlorYajJ69Pxgfl62/52yIxA2Qxzx28=;
        b=Dt7WNAZq60S0MtAeEhh2T/KDHy3F2IpJmqHeR3AYY0aJTnq9wZPVCnfgDAB8m9+FOd
         gbVHbiPIb6HVWZaD7zb8PrwLd4Fy7qV98J23x30lHkuCKfmcEPL/KVX2G82jZHqnKqK0
         3o0vUbR8JhXhUEDVubypJdojnCD4nxY7iNgnT3aNccPtCifkAIwcLlwECgCyS4w2z3LT
         TNCtJkFl7re+JImCSa6E8AMpNYctAL9bTHe11p0E+bEvCrQ0qkbv8mm4TLuKV5gob+LQ
         pcNNTohnMFKPg9IiUok9/zbbjbXLdDm8HHmdUQEd2L5FTX061arJ78wBA5YjOky7lXKs
         8Qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685483530; x=1688075530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/8qz9tb36j8JlorYajJ69Pxgfl62/52yIxA2Qxzx28=;
        b=OF9Psl5g3Xbx3Ef/nRVSvdplLi42cP1Gri//qtT/XzGkr2pYQvS3afPrQhNtAbbvup
         SQw6xZWMuhDNO9Cp8fqu4NThZtoOs2TKgMG6TIvqAPZSSaS2evVCH8g77sNNv5ew9x+V
         uco9pVHw28NLN6LjbbUsKrFlSKRMa6Y6+4jphE9jtbsuZpMtrfsDEsi+2rVXa5H5zhiE
         IaTS5SfErHYRo0G6qcUUzyW3UZAsRt/kFVLgPZPAJYCw8iFstCjGeDdht3ShB5Xra3VH
         5oDipIAZCxAg9Q1AD/R9EnmtuYSi/GXw1QqL1mQTgAPqipBfhkrg6E989llRS7znS1Sn
         +zWw==
X-Gm-Message-State: AC+VfDxatieAA+LclfIIYAaGVz/FDGznImV/7CanRnqWIdqUYivaC9g4
        Yd/nUw7KRFNCe/kg0GUhRGlSOV+jr92HCQ/NMEI=
X-Google-Smtp-Source: ACHHUZ7i5tMYQqN0sUktrQQv36tTJXqBgKFXYm5+g32ceMpJD87Q1DVIKAMNibii43jpOby3sUpfLIWDua1MIxchY8s=
X-Received: by 2002:a05:6214:d4d:b0:621:451b:6e1c with SMTP id
 13-20020a0562140d4d00b00621451b6e1cmr4344405qvr.6.1685483530537; Tue, 30 May
 2023 14:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de> <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 00:51:34 +0300
Message-ID: <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of
 "high" and "low" for output hogs
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 6:19=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> For active-low GPIOs the currently available nomenclature requires
> regular explaination to the non-enlightened folks, e.g. because a hog

explanation

> defined as:
>
>         someline {
>                 gpio-hog;
>                 gpios =3D <24 GPIO_ACTIVE_LOW>;
>                 output-high;
>         }
>
> results in the line being set to the physical low level.
>
> So use the terms "active" and "inactive" which are less ambigous and

ambiguous

> keep the old names as synonyms. The above example can now be written as:
>
>         someline {
>                 gpio-hog;
>                 gpios =3D <24 GPIO_ACTIVE_LOW>;
>                 output-active;
>         }
>
> where it is less surprising that the output is set to a low level.

As I said before, this does not cover the ACPI case. Consider
providing an fwnode interface for them and then reuse in OF and/or
ACPI if necessary.

...

> +       GPIOD_OUT_LOW_OPEN_DRAIN =3D GPIOD_OUT_INACTIVE_OPEN_DRAIN,
> +       GPIOD_OUT_HIGH_OPEN_DRAIN =3D GPIOD_OUT_ACTIVE_OPEN_DRAIN,

This one is an interesting case, because depending on the transistor
polarity this may be active GND or VDD. All the same for OPEN_SOURCE
which seems not defined (but should be equivalent to the opposite to
the _DRAIN cases).

--=20
With Best Regards,
Andy Shevchenko
