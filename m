Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A486B725A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 10:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjCMJS6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 05:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjCMJSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 05:18:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B372CC69
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 02:18:48 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t15so10562464wrz.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678699127;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=819sPWiRDLbyXTj9lMI3wSZfzf6rbkGsUCg2JBu7bxs=;
        b=HEuvy6TUvSYW5RtpVkz10SjI+9Ax3kWRYRPXvmBLU3VhxDaq0cDEwvydJKd+cxoUjc
         3busOreQ9i39DHCjQqAO2/NIV7WATtltZwTZB0JclxrU9Mpjg4fs8aWnzLbVv9Ca9++g
         Rac5GSjH8A8qS+nqaKXi9ONuQsIkX6fxpMKGfsl9EqUJvwUrRX15dQ1AxSI1TYd2ttBm
         qUoCp3LUtxevls+mep5w0NCD4+/TQBHA3KLIF2ArkX83Kch/4drsZIexiDFywCJ178rs
         dolm91ISx3Xf09e/BGhPyo5Xg18GyMCxYvmVvk8Mqkg3ulkeT6FF5nYuEy70HTwDSIRB
         ZZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678699127;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=819sPWiRDLbyXTj9lMI3wSZfzf6rbkGsUCg2JBu7bxs=;
        b=YvxGfeWeW9Vxaowgmp1YWdsClQNM3aN8sARfXAyw0+YWQomiNylERp38M3NzLIinOV
         q5rFxtgOxeSnJ8RTJ+HsdIvl7mClLIb3dFsnBfpRL/9daPP5aM2AZMTg/fwY1i7m7Qj3
         Hc8E2PUjdYSte1N+P/Tdj5mbb5I2oyHwY5zPyCT44LwCVFncxM122MNKPkkekuumg5co
         3FSNJXIlUxnRkjX0tCWS3eqY0pl3OcZk+xMIZQLcDzyFfA5tdoSO7rnhXq8LAEl5gU4k
         0gNOxsxkkGNcwlnpsTT/FB3VM1tjzLD+wu+0PjgLmps5JirKVBtkQJg2xtUTViEKHh7y
         CDfw==
X-Gm-Message-State: AO0yUKVXfNIwpH8W7DyoWWYMZmOBxkZ3FNIxM/BDlzOr5Ox301Mf7JbF
        RS1yN+MqKncXaxTW0wZV24go+A==
X-Google-Smtp-Source: AK7set9TLdu1nH2qB5bjiwDrkGH1cNy+YauBVt/YbewUUWhgEQWBNzt8sbYpWdKlwBvw5FPmT3lLWw==
X-Received: by 2002:a5d:610e:0:b0:2cb:5b58:74a with SMTP id v14-20020a5d610e000000b002cb5b58074amr22200673wrt.56.1678699126908;
        Mon, 13 Mar 2023 02:18:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:28d:66d0:7e56:113b:5d10:d06b])
        by smtp.gmail.com with ESMTPSA id b12-20020adff90c000000b002c71d206329sm7356587wrr.55.2023.03.13.02.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 02:18:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 13 Mar 2023 10:18:45 +0100
Message-Id: <CR556BV2M4I4.2L3LLJ8V1I352@burritosblues>
Cc:     <linus.walleij@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <a.zummo@towertech.it>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <jpanis@baylibre.com>,
        <jneanne@baylibre.com>
Subject: Re: [PATCH INTERNAL v1 1/3] rtc: tps6594: add driver for TPS6594
 PMIC RTC
From:   "Esteban Blanc" <eblanc@baylibre.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
X-Mailer: aerc 0.14.0
References: <20230224133129.887203-1-eblanc@baylibre.com>
 <20230224133129.887203-2-eblanc@baylibre.com> <ZAcbJxrNtWTTTSjR@mail.local>
In-Reply-To: <ZAcbJxrNtWTTTSjR@mail.local>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue Mar 7, 2023 at 12:08 PM CET, Alexandre Belloni wrote:
> On 24/02/2023 14:31:27+0100, Esteban Blanc wrote:
> > +struct tps6594_rtc {
> > +   struct rtc_device *rtc;
> > +};
>
> Is the struct actually useful?

Good catch, it's not. I will remove it for V2.

(...)

> > +/*
> > + * Gets current tps6594 RTC time and date parameters.
> > + *
> > + * The RTC's time/alarm representation is not what gmtime(3) requires
> > + * Linux to use:
> > + *
> > + *  - Months are 1..12 vs Linux 0-11
> > + *  - Years are 0..99 vs Linux 1900..N (we assume 21st century)
> > + */
>
> I don't find this comment to be particularly useful.

Ok. I propose that I add 2 constants for the -1 and +100 in the month and y=
ear
calculation. This way, without the comment the computation would be a
bit more self explanatory.
What do you think?

(...)

> > +static int tps6594_rtc_probe(struct platform_device *pdev)
> > +{
> > +   struct tps6594 *tps6594;
> > +   struct tps6594_rtc *tps_rtc;
> > +   int irq;
> > +   int ret;
> > +
> > +   tps6594 =3D dev_get_drvdata(pdev->dev.parent);
> > +
> > +   tps_rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct tps6594_rtc),
> > +                          GFP_KERNEL);
> > +   if (!tps_rtc)
> > +           return -ENOMEM;
> > +
> > +   tps_rtc->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > +   if (IS_ERR(tps_rtc->rtc))
> > +           return PTR_ERR(tps_rtc->rtc);
> > +
> > +   /* Enable crystal oscillator */
> > +   ret =3D regmap_set_bits(tps6594->regmap, TPS6594_REG_RTC_CTRL_2,
> > +                         TPS6594_BIT_XTAL_EN);
> > +   if (ret < 0)
> > +           return ret;
> > +
> > +   /* Start rtc */
> > +   ret =3D regmap_set_bits(tps6594->regmap, TPS6594_REG_RTC_CTRL_1,
> > +                         TPS6594_BIT_STOP_RTC);
> > +   if (ret < 0)
> > +           return ret;
>
> Do that (XTAL_EN and clearing STOP) only once the time is known to be
> set to a correct value so read_time doesn't have a chance to return a
> bogus value.
>

(...)

I understand your point, however I'm not sure of the canonical way to do
this. Simply calling `tps6594_rtc_set_time` is enough?

> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks for your time. Best regards,
--=20
Esteban Blanc
BayLibre

