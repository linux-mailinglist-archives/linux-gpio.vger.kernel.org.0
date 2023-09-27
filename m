Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF53B7AFF73
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjI0JHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjI0JHI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:07:08 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C733497
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:07:07 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59bebd5bdadso132684387b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695805626; x=1696410426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm+CmHkCFmEfa7cbK5Jo56DJl1QMiUb2TNUipR3cFWA=;
        b=wFoqMyCPnhrGGvtGG6Ty7huovmS1iNqXw09OYVwSNF1mHXhzZcAWuAxClHWBh+WEHD
         WLyPO618gCB9c8BOUw0MITYpjCXXeMkUj4MG9afhcXkEDE2YxnGiJhjeJo17Gc4kx5Ty
         NZism+708MfpgQhu1eGO4bXwMzFy4tg99rtN9GnW7y9nFwBr0IKdjvEnNkLwt1z6OjcU
         MMEYz3Nrevi+eIc0q2DCn1Eg8LWiqy+APRijx5imqU27TMiOrjMRp6Uma5oB6zMnlVKA
         SEgZf/7sku2qlyyEryjW7ziKWbCMBQyvH4E+zVtiDNtVL2pVFi4t5s5GLER1w3+iJKWT
         GcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805626; x=1696410426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm+CmHkCFmEfa7cbK5Jo56DJl1QMiUb2TNUipR3cFWA=;
        b=JWb7vVOQ7ynHDNLS9AO90RjCL9kaB3YyX48sXOrYVDfthaU0lS5PUaw8rN2DA0CRnR
         0jRqDAC5lEGj6xso6u7IkXACqNwhRHRuSB40OU40j4v/mPdPNQy0zj023G4llp4XuIF3
         2WG4yXVKc6qt9PYp5HPrRBKi28ZSJLbpu/crxkpB5o4OHOSut/KPYj3LqS0B55cpVGw3
         7prx+Yla4LMOYsMVmurXQ4HD+9ZnLYLNwf0MTdwZQdkvFWfosbif/vMp6aEC+anTQR6E
         K/PqrJ1/lbMQkVulPZhCb39Roz4LVZjlH6Gey6Y0euSYW1fl0m8CUcntmpPue9eVjizb
         xflw==
X-Gm-Message-State: AOJu0YyUBzqeDgwCkuH8RgYzgxTnlREorVyM2WWkFPKN2kloxDSJSbxI
        t23itIz0/ZdvcSyKhaujSneRN3e1Qu9jThMVRoDTMw==
X-Google-Smtp-Source: AGHT+IHOJ7uJz9wRRMx9WyJXVRZIxp98VLGc6U0MGhD6EvrOAqvdnUU1XL6wd4Dlp0oFyLPgxgq+FoerK6agjArWnwY=
X-Received: by 2002:a0d:db11:0:b0:59f:5895:6e38 with SMTP id
 d17-20020a0ddb11000000b0059f58956e38mr1693957ywe.4.1695805626721; Wed, 27 Sep
 2023 02:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <202309270234.aJGlDE0P-lkp@intel.com>
In-Reply-To: <202309270234.aJGlDE0P-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 11:06:55 +0200
Message-ID: <CACRpkdYHUVno_E0iFE_Gxuoszr7TbtnTKaZGcAWz8_cnifwQUQ@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 15/25] drivers/pinctrl/realtek/pinctrl-rtd.c:180:29:
 warning: '%s' directive argument is null
To:     kernel test robot <lkp@intel.com>
Cc:     Tzuyi Chang <tychang@realtek.com>, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org
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

On Tue, Sep 26, 2023 at 8:48=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

>    drivers/pinctrl/realtek/pinctrl-rtd.c: In function 'rtd_pinctrl_set_on=
e_mux':
> >> drivers/pinctrl/realtek/pinctrl-rtd.c:180:29: warning: '%s' directive =
argument is null [-Wformat-overflow=3D]
>      180 |         dev_err(pcdev->dev, "No function %s available for pin =
%s\n", func_name, mux->name);
>          |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~

So:

>    155  static int rtd_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
>    156                                     unsigned int pin, const char *=
func_name)
>    157  {
>    158          struct rtd_pinctrl *data =3D pinctrl_dev_get_drvdata(pcde=
v);
>    159          const struct rtd_pin_desc *mux;
>    160          int ret =3D 0;
>    161          int i;
>    162
>    163          mux =3D rtd_pinctrl_find_mux(data, pin);
>    164          if (!mux)
>    165                  return 0;
>    166
>    167          if (!mux->functions) {
>    168                  dev_err(pcdev->dev, "No functions available for p=
in %s\n", mux->name);
>    169                  return -ENOTSUPP;
>    170          }
>    171
>    172          for (i =3D 0; mux->functions[i].name; i++) {
>    173                  if (strcmp(mux->functions[i].name, func_name) !=
=3D 0)
>    174                          continue;
>    175                  ret =3D regmap_update_bits(data->regmap_pinctrl, =
mux->mux_offset, mux->mux_mask,
>    176                                          mux->functions[i].mux_val=
ue);
>    177                  return ret;
>    178          }
>    179
>  > 180          dev_err(pcdev->dev, "No function %s available for pin %s\=
n", func_name, mux->name);

I can't see it, what am I missing? Why would func_name or mux->name be NULL=
?

Yours,
Linus Walleij
