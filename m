Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC4462175D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 15:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbiKHOvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 09:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbiKHOvI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 09:51:08 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1666B13F6F
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 06:51:07 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id t25so39214857ejb.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 06:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5RfhvWt1Tv41V7xOdh182isXRfcqnMCvMMU4ZxjHa4I=;
        b=vgPgq/fKoy91SWpS9t2e6oRNux2GYZ11uz4nq69Ecusn/WQxEr9PnRkXeciq96q9Kf
         Y/uc1JXxwDcE7DZk4ERIHWnMD3xCOKQOkmZ9szh6zLYAHlS8jB3/9Vzu0GTEcRvD273p
         QcJzqGu94FAUp4fND/CyiussZorc4AISQgkF6NZxvG/MLLVHHNxJkea27kaoeMZFf8NM
         MrPmIrciQQHldO1W0L/ICYsoJczxk/E5K1ku/kfcnyWtcEYwFARIfMuiqAHSi0RwOReo
         3xg6N55uGAcHesseexA8+25xPiouSe/QNOgAQpSqMWJsa4JVGZPnnvoO6B0S9mYDKIX0
         HTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RfhvWt1Tv41V7xOdh182isXRfcqnMCvMMU4ZxjHa4I=;
        b=QxqbY68h5l0MzK7TqHRjHgqYZgmJKiHdsyKEc/QzHaJGx73KiD6/uzFwkVgrc12+Kz
         iyfgNcj9Suhliz+rX0oHqEsmv8Z/qVe5F2qPmQRKTA+HTmvifQZZ4mR8WdPxRSZQOtPR
         jCdf9QH8ACDybieL3rNtlJge5RF07nUKhjmiz/he8JFe5zF0AcAK9/VU+wpzxF/1Lnid
         +8m4UEzxNk6gEtJqjYjbproMhi32N0IioMgzYMk4Jtbsoqpx2qmX0IE/7x7ucqiNI4Fg
         RonIruxL9PStkfJ2KoRpTDfAr/MQICqoHTf/MwhBuFz0qM4UMKxjCT67jWTr4FS2YFv2
         mcGg==
X-Gm-Message-State: ACrzQf3caF73+d9gyKuYe2FyABaqavL1FsN/L6HiHQ7KCzaJ2JROuCqP
        Unyyce17lIxgh+TnTzu5SRcBgqyF6kpA3AwRf3MNIw==
X-Google-Smtp-Source: AMsMyM43GACP12dQZV6v3KIC5Qxaj6QVCASShwmiPx6+SaG+30Y/RBMbREK4KJlCmGU7p1c/8UJC8IQmuja8j8BZsDc=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr21471098ejc.690.1667919065615; Tue, 08
 Nov 2022 06:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20221025070255.14407-1-linux@fw-web.de> <e7192d9b-df86-a860-d5cb-8b4b9184e5bc@linaro.org>
 <trinity-889b4468-8a50-4eae-80a1-6bd9ffbeaaf2-1667577856206@3c-app-gmx-bs24>
In-Reply-To: <trinity-889b4468-8a50-4eae-80a1-6bd9ffbeaaf2-1667577856206@3c-app-gmx-bs24>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 15:50:44 +0100
Message-ID: <CACRpkdZFkeX7J9R2C0rhF+WZJXe65y6FfeBEMBGGkSTh4AWmsQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings for
 MT7986 SoC
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Frank Wunderlich <linux@fw-web.de>,
        linux-mediatek@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 4, 2022 at 5:04 PM Frank Wunderlich <frank-w@public-files.de> wrote:

> > Gesendet: Dienstag, 25. Oktober 2022 um 20:35 Uhr
> > Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> > Betreff: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC
> >
> > On 25/10/2022 03:02, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >
> > > Add new splitted uart pins and emmc_51
> > >
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> after talking with MTK for the emmc pinctrl settings (custom pull-up) they suggested me to change
> binding to fix other emmc-values and allow multiple (2) uart-items
>
> so on top of this patch
>
>              then:
>                properties:
>                  groups:
> -                  enum: [emmc, emmc_rst, emmc_51]
> +                  enum: [emmc_45, emmc_51]
>            - if:
>                properties:
>                  function:
> @@ -231,10 +231,12 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
> -                         uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
> -                         uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts,
> -                         uart2_1, uart0, uart1, uart2]
> +                  items:
> +                    enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
> +                           uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
> +                           uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts,
> +                           uart2_1, uart0, uart1, uart2]
> +                  maxItems: 2
>
> i would squash these changes and send as v3 or should i send an extra-patch?

Squash and send av v3 if you haven't already! Easiest for me.

Yours,
Linus Walleij
