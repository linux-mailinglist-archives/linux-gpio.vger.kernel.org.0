Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6466D2039
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 14:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbjCaM0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 08:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbjCaM0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 08:26:37 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B93826BE
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:26:36 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p203so27123416ybb.13
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680265595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t9CjXOgWpSz/pLs1pfLzGpzRhlP/Dqfbs5hEbKF6gY=;
        b=R9pkgLb7mWPyOZ4L56pd/LRhL33whlm4RfOyb6AVCPZWkOdCtX5pB/dGciOyJdNo1F
         UJ9pcp0won9n97KOfPlybTH/LHSNxMAYInpfBMlZIBO8nqSXv9jmCpJEKUD8FAH0SwBX
         Ix9VoBozTAXhOjygTOgTTC4TgIvzfv5kJc2ksMQBXrABeeSLHUe4eF7NNJX7kgWLcJVF
         NzPih5ISz8IsiDdp50m5JLj2HT3Gc/4FCE+UWkniarbN0EHy2Mbspjmh4FVULaEpzEQC
         WCrA/gP1+1rtJxgSTfjseWFYOLhirRHlUHSmttcSGDveDkeapU1hCtvwWzVs4L4B+SY5
         X8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t9CjXOgWpSz/pLs1pfLzGpzRhlP/Dqfbs5hEbKF6gY=;
        b=TBRW8E+OOdXcyc44oYYg+wa7vi27wXA5S08GPj+zNltoW5TYYSfsdrwhKf8GOZK1Fa
         1hIqq1IXOnRxM/B3XhQRIjofc8fovZtjnyqud5bFxGrsuNiEN/mf+J8LyqKD1Y+jyUb2
         u2+C+3dbM5U+Fm9+/nuAH2Gwj1/a9n0Nbzp6d8ypzSUaVUg+McK7bPuyDildpzIJNeJL
         GUghe1C7iD1MvqTIpGr9x1rmZwQ4oFTmlMNHctMKk4Hh+0IYADfpZMXsRNEOplltnGAb
         ni24tbjgO2b5K/QOFu/6RVIcrR36Ia33t2YraesOI/B4Hs8bZvEXluNC3s5sbdn+GQKI
         AnYQ==
X-Gm-Message-State: AAQBX9eGv/j1fxQxEtP+eCw5GmVgFHHXogAbac7dAEyLuXk+OC2QeOsw
        aUE18vFxoMuSCZGF2ooqNoNFwR1ZPX34P6uKuiKDyA==
X-Google-Smtp-Source: AKy350aGmjtep9hI2AVm2TnZACla550tfInyXNn4xaLkBqIuJrOGxBjqFPRSg9J8V84Q1tehJLEqGdguSBByYK2io84=
X-Received: by 2002:a25:8712:0:b0:b74:3236:2fac with SMTP id
 a18-20020a258712000000b00b7432362facmr17176959ybl.4.1680265595278; Fri, 31
 Mar 2023 05:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230330100550.2049687-1-peng.fan@oss.nxp.com>
In-Reply-To: <20230330100550.2049687-1-peng.fan@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 14:26:24 +0200
Message-ID: <CACRpkdYb6PhGdeUuZvmiUDieZr+tAqO-Ls7+hJiaTgeoPCaAKg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: gpio: fsl-imx-gpio: update gpio-ranges
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, Mar 30, 2023 at 12:00=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> And bounds for gpio-ranges to address dtbs_error.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> V2:
>  Enlarge bounds to 32, since it max supports 32 pins

Saw this after already ACKing v1...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
