Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32CF57A76C8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbjITJDV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 05:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbjITJDB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 05:03:01 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3B1134
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 02:01:36 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59bebd5bdadso68404497b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695200495; x=1695805295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYvirtTEHfvn8mKnPG5A91Sh0MgTtcoSl/PA6YHPo2E=;
        b=e67SKoZXfFeMQUmerjh6yyRcmC80eeCa1feNmPVuynm/J+GCmXkW/9Ev8w9zQYYxl1
         gIk0CMgsA1WjPdiYZi9caw6Syt3B6C12lfapGutfdqz+NTr8tbZYLH5042aJiYxzhl43
         W5cK+ZvBfjdfKGDGpBLHzXDDX6qi2hf61iWRkiD2hVDHurmlHFJUtgHL9sJceBruqBHp
         JdlQTV4Y86r4+yCGp40UVUifJmKDQMKzhNBnG4aPjiZO9QKpkhcfXvFgEKsyYSnqttbL
         5xbDMK0s5w77gprYbgoq+lSRGNNksqNbUa8DFOI81yLUD7caa1NFWSBDTPAW5wifgdzF
         GJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695200495; x=1695805295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYvirtTEHfvn8mKnPG5A91Sh0MgTtcoSl/PA6YHPo2E=;
        b=bGCBmKMMKH8vDNwiaELeqS4MjRSTmQVXY86OBmKCCmIRYOEG/gvwNigG0H2yawts3F
         AM/QE2D0iWmNdAsWN0CJfrTDghGcpwGA/Feat5ozBYtRcFJRE7KA3NTYiF+zNIuyoIkt
         DsGlQIgk6HxOPf2GUZynvhSqbUWpsoVAsUWmDS4rpEFta44+mfQrCDO1Z7cFgy84zo49
         P5s9v43qR4jNGYf7yOq8at9/sLh3PDq3yivg1Ap2zrMK7nAQGRrL9wiSHNdxHlkw7JNz
         UpOo3wdeoolU8AZ65CPhvwQn9b1ZVWNm2iVqrWCrAAKojmPMsVO1/JZeHRYZK+98EVr9
         OhKQ==
X-Gm-Message-State: AOJu0Yy9XS6mOLoLLNXLDfgxMEyjI7vOOk9qzoY7h4abaWxW+cTxGtKI
        xC9EW2kDepJHW1eDKeSlawTmBchi/A9RGAMnkGqM1Q==
X-Google-Smtp-Source: AGHT+IFYLO2eNKBLqWVJQogBfVy7gr+MrzJaAmqy5D9Lx5g4OrGNYLDqAwhQN3dOD8W4tqRc3FI0bLkqPu2G9bCLMcI=
X-Received: by 2002:a81:a111:0:b0:59b:49a0:eec0 with SMTP id
 y17-20020a81a111000000b0059b49a0eec0mr1942407ywg.12.1695200495386; Wed, 20
 Sep 2023 02:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230915150327.81918-1-brgl@bgdev.pl> <20230915150327.81918-8-brgl@bgdev.pl>
 <ZQf6zTsoZDFaIgHO@smile.fi.intel.com> <CAMRc=Mc9k9Brxw9eQxLS75ukin1o3D6P6FrX=nbfhgM7_e9W_A@mail.gmail.com>
In-Reply-To: <CAMRc=Mc9k9Brxw9eQxLS75ukin1o3D6P6FrX=nbfhgM7_e9W_A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 11:01:23 +0200
Message-ID: <CACRpkdZh5p78pVCS6MJ=fkxpP+sbYFRpM2-icGKr5wmkhPiTNg@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 18, 2023 at 10:03=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Mon, Sep 18, 2023 at 9:23=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> > >       for (p =3D &table->table[0]; p->key; p++) {
> > > +             struct gpio_device *gdev __free(gpio_device_put) =3D NU=
LL;
> >
> > > +             gdev =3D gpio_device_find_by_label(p->key);
> > > +             if (!gdev) {
> >
> > I haven't got the fix for gpio-sim, shouldn't we have the same here, i.=
e.
> > definition being done together with the assignment when __free() is in =
use?
>
> It should but I only got yelled at by Linus under the gpio-sim patch
> after I sent this one.

That happens, it's all new.
I guess ideally we should patch checkpatch to just moan about
this, I wonder how hard that could be (I've only patched it once in
my life...)

Yours,
Linus Walleij
