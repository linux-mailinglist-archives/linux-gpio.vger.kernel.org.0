Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261A16C61F2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 09:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjCWIiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 04:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjCWIhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 04:37:47 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF9335241
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:36:28 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id p203so23838523ybb.13
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUuy98YfrrGR9WlMIlTaa+4F/lCxj6Hdgjgj3ZONIGA=;
        b=Q7owO8OcLsAk4Smi2JWsWIKAzqfBJpGOHyVtF07hxl9piqNLJCWoW7ed4RVNmHjhGk
         ol3NRAXqNtaHo6lDY/g//4xjwt/zxo/2zoFknjy1zGZhizSaFw5hdgDuLK8RdU/zZVAH
         dCepbf77TgGhUbiTSUqhp684enkT1DtfqWYiu+D4zXHU39Q95c87S5jHYzWSUjmQidIr
         CR/bcZ9UWgx4ZwxmbVTnGPjgT3U1OF+r4Mp8yx8TwvEPJeXshXVD54tjYJO1ApHYyVfH
         z4fQSasarnufBSTBhpRbCiJTIbgj3WYu0exC/3/6OArXM7pWXh8QX0awOx12n+r31erH
         QTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUuy98YfrrGR9WlMIlTaa+4F/lCxj6Hdgjgj3ZONIGA=;
        b=sw8XLQfyyj/voF6NfKVDtEgCUpxkBwy//5SGUeG3Hn6lt+JIzCEwDDhY4iE0AW1XAP
         EIJ32IxUO92pgf7j5ZRbmRTb5yVR5x+PeNyB11HpA8ZE8dfkunXcX3ufYYhEBNhEw8n8
         PmhWEVhEkYUFlL4/1f9IUxYgKyZTF3rvrq04ecEXpEdWkCa4pG6SO/Q9s2iAC0ROAOn+
         OigyOI3nPUq1TWljm1phFiDHuEkHhjpy9WM7YpObkuDC06eWoYYBxmVsqfbhZRskDZyK
         uWSXF5f/aw4cTCWH6+zeaTDN3tDmmPYBQ7u2RpJzF19bQHTZ4ow8ZQD9Y/Z+mRKKMGod
         DAbA==
X-Gm-Message-State: AAQBX9clJCC/bC197TOGbT9oPzkDzLCgcc0lTkclRt9MNUA8vthJaJqa
        OtN+Ob3/ZhETQajh+07x6AuNvouaS5l9OU1tDRuO7w==
X-Google-Smtp-Source: AKy350bcnM7cm+AyBPl6E7Dhs+RovIUhLWC1y2V4vCJ+ybMyh+qGNl7hbQ/eRRAdXm8YoocIetQrjs3e6tsPxiaKuts=
X-Received: by 2002:a05:6902:a93:b0:b23:4649:7ef3 with SMTP id
 cd19-20020a0569020a9300b00b2346497ef3mr1654862ybb.4.1679560587513; Thu, 23
 Mar 2023 01:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-5-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-5-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:36:16 +0100
Message-ID: <CACRpkdbkCEPOV9xEXx20qm5idG0p2vdoyU09FRwXmMyj5gGqoA@mail.gmail.com>
Subject: Re: [PATCH V4 04/10] dt-bindings: timestamp: Add nvidia,gpio-controller
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> Introducing nvidia,gpio-controller property from Tegra234 SoCs onwards.
> This is done to help below case.
>
> Without this property code would look like:
> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
>         hte_dev->c =3D gpiochip_find("tegra194-gpio-aon",
>                                    tegra_get_gpiochip_from_name);
> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-aon")=
)
>         hte_dev->c =3D gpiochip_find("tegra234-gpio-aon",
>                                    tegra_get_gpiochip_from_name);
> else
>         return -ENODEV;
>
> This means for every future addition of the compatible string, if else
> condition statements have to be expanded.
>
> With the property:
> gpio_ctrl =3D of_parse_phandle(dev->of_node, "nvidia,gpio-controller", 0)=
;
> ....
> hte_dev->c =3D gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_node);
>
> This simplifies the code significantly. The introdunction of this
> property/binding does not break existing Tegra194 provider driver.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

It is fair to assume that other operating systems will need this too
so I interpret the commit message as an example of the issues
faced by anyone making a driver for this HW.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
