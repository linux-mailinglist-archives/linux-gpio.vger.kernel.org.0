Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB5DD7B75EA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 02:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbjJDAgV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 20:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjJDAgV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 20:36:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A11CA6;
        Tue,  3 Oct 2023 17:36:18 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso2808843a12.3;
        Tue, 03 Oct 2023 17:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696379776; x=1696984576; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XJRvSjw9vE3ViTEA7+Fc+ROzh6Ut2Xh1WXhdCCyUoM=;
        b=SJnvMIYlfk71S+W3PJ+xoj9DqYbrE83H8xqquNwV94TBGXJTBSFkdAkz4SCqlarYME
         qDlPjAF/Tt9h+gRE5VEgzmIYk6OcLQ0YckprDAau4Aoy4FbqW/lP9agMQReihIgIiWHN
         JcXO5BJUrskKjEvHu1iRkzE3Q4CgXuVfYEBC/7xutkU5owvuefir5SmvpZrnJ0UweF1i
         gqbJlBjOizNlT8t5gBEtLqMi2hTTTrzVGW67E4TqoWdLMvVegwFXNFP6KFPvuh6NsH9f
         pmhHyWavFvr2rOomlcytckNr6dDQAxSzw411G8LCiUAF/a6UbwKplKHiCXucTVXNwXtc
         vEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696379776; x=1696984576;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XJRvSjw9vE3ViTEA7+Fc+ROzh6Ut2Xh1WXhdCCyUoM=;
        b=rDgjaVCkEOAa78aP/rV/QO2SzMrOTPCv3Awu6y9MvrxYIlEcbG397vVjC8QSG1HS85
         9kCJhNSwkG+w+njriA/T0JskUG7ZLfJsCBHW69e5WDiIY6kwfi6aEYV1IN7LX/qMfKye
         A5CG1qaROgg1E86ZzpCqdk4h42Ih4Fw6O2CUt85g0LvaX8tTHJqsApWDSWVlcfBT3yaB
         1bIRgomLH7Ob1zIegJlZhQYOWyG3g3JbKNH+Imwho4I+Nkct147LXhSJM5JULZXdBkHZ
         s6lou70COBzOgTL/BcjYA9ql+zWMOTWcrmZ6Tkicm+ZvhhbTIZb0tyi5HzQVj66MTcO/
         0/fg==
X-Gm-Message-State: AOJu0YyuH/g4eUtRTvPBELMTRV3Iw7hEHiJT0s/OBIirRbhv4xpo74vt
        vjtFb5S3UxZ00VGTvxWeUa8=
X-Google-Smtp-Source: AGHT+IHmdDNcvb1k/uz4FIW9trWjcu9894h81mL2637ya7mGbZk+fy69n/xEa9hiU+L3T6dxpq2o7A==
X-Received: by 2002:aa7:c409:0:b0:530:a925:77a6 with SMTP id j9-20020aa7c409000000b00530a92577a6mr653446edq.8.1696379776395;
        Tue, 03 Oct 2023 17:36:16 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.dynamic.inetia.pl. [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id c4-20020a056402120400b00537963f692esm1575392edw.0.2023.10.03.17.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:36:15 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] OMAP/gpio: drop MPUIO static base
Date:   Wed, 04 Oct 2023 02:36:13 +0200
Message-ID: <2298936.ElGaqSPkdT@dell>
In-Reply-To: <20230926070953.GV5285@atomide.com>
References: <20230912-omap-mpuio-base-v1-1-290d9bd24b23@linaro.org>
 <20230926070953.GV5285@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4836419.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--nextPart4836419.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] OMAP/gpio: drop MPUIO static base
Date: Wed, 04 Oct 2023 02:36:13 +0200
Message-ID: <2298936.ElGaqSPkdT@dell>
In-Reply-To: <20230926070953.GV5285@atomide.com>
MIME-Version: 1.0

Hi Linus, Tony,

Dnia wtorek, 26 wrze=C5=9Bnia 2023 09:09:53 CEST Tony Lindgren pisze:
> * Linus Walleij <linus.walleij@linaro.org> [230912 08:45]:
> > The OMAP GPIO driver hardcodes the MPIO chip base, but there
> > is no point: we have already moved all consumers over to using
> > descriptor look-ups.
> >=20
> > Drop the MPUIO GPIO base and use dynamic assignment.

On my OMAP1510 based ams_delta with the patch applied on top of v6.6-rc4:

root@amsdelta:~# cat /sys/kernel/debug/gpio=20
gpiochip0: GPIOs 512-527, parent: platform/omap_gpio.0, mpuio:
 gpio-512 (                    |data                ) in  lo=20
 gpio-513 (                    |data                ) in  lo=20
 gpio-514 (                    |data                ) in  lo=20
 gpio-515 (                    |data                ) in  lo=20
 gpio-516 (                    |data                ) in  lo=20
 gpio-517 (                    |data                ) in  lo=20
 gpio-518 (                    |data                ) in  lo=20
 gpio-519 (                    |data                ) in  lo=20

gpiochip1: GPIOs 528-543, parent: platform/omap_gpio.1, gpio-0-15:
 gpio-528 (                    |keybrd_data         ) in  lo=20
 gpio-529 (                    |keybrd_clk          ) in  lo IRQ=20
 gpio-530 (                    |modem_irq           ) in  lo=20
 gpio-532 (                    |hook_switch         ) in  hi IRQ=20
 gpio-540 (                    |rdy                 ) in  hi=20

gpiochip2: GPIOs 544-551, parent: platform/basic-mmio-gpio.0, latch1:
 gpio-544 (                    |camera              ) out lo=20
=2E..

GPIO based hardware seems to be working correctly.  I'm only not sure if=20
we should maybe change the name to something else than gpio-0-15 (mpuio=20
looks OK).

> >=20
> > Root out the unused instances of the OMAP_MPUIO() macro and
> > delete the unused OMAP_GPIO_IS_MPUIO() macro.
> >=20
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Maybe Bartosz can merge this into the GPIO tree with Tony's
> > et al blessing?
>=20
> Best to wait for Tested-by from Aaro on this one.
>=20
> As far as I'm concerned, good to see this:
>=20
> Reviewed-by: Tony Lindgren <tony@atomide.com>

Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
--nextPart4836419.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmUcs30ACgkQ2WqSnlts
jBrU9Qf9F6VXtPldEIdUb7pt3KTUg58jkYvLTvNhaMxSQqqjU1Q/xkMtpw+LPEDu
DYdApDvzsunX458kK6XW3biK43fNMTAda6dYCRGIY993q4y9UIbpwyEqezIoJgAs
cs3lx8wrFDGKAXhISeDfYry9PjDv5YOwRqI6efF0NBSb7hhxkHn46mKdblBl0CIR
HpNzQahyC6fE4bBGdZ+TgArmLC5C4vxBc+VNWXQMAmuNk24J7Vpw9mgViflMaclE
8E6prcJQ8R8bilvQzDTB5jLYQhb+K4jVdiwqKdzHHfCVA3ftvNm8sWpP8VmN6Wr3
9O8MIfAyDbmk9ML33M/3LIK2Mamibg==
=wcDK
-----END PGP SIGNATURE-----

--nextPart4836419.GXAFRqVoOG--



