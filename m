Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAAD062D59D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 09:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239633AbiKQI5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 03:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239491AbiKQI5C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 03:57:02 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC18742C3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 00:57:00 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id kt23so3379205ejc.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 00:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SeApCFj63aQwxHKSi25tdgf7E0/rMGNESKYxLsFqjeI=;
        b=DIl45lRzv6JuWxa/tm7EfBn1krGYmnE+7rDk6ABGaT1oukMRkiZcJbaVPzvpDs9h2O
         ne9IGtFtQ7+vexoesrAoxkWKbYMu3IJTL60J2MqTodSw7hVVTfIKLOPXRunLg3HiqzIt
         1Rxh4Zj/lUO/qEbUTNxEbH37zvQcTuNFmkAqQnsE078qz0bmdblurrjmIZ0NusWGOTWW
         Y1wN393Z45sV1vBtrr+skiyeLZmRb6m2MVlnJn0M9k7PZNxT5IsaiRMOLeI6jAc/STVZ
         FwFJ7JWuSdBDhUP1iEElqAmFiTil/9ZdJI8qCc8i2qevymtLTp2WZzbA/zadY3TgaYNj
         d5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeApCFj63aQwxHKSi25tdgf7E0/rMGNESKYxLsFqjeI=;
        b=sQ+gn2qe/OHE/XL16l/dnkCq7eKsEnWJ0PQkO1Yiyb05R03rJWKU1WdfzL433wa55b
         KhM4/7YZXdy6zJ9EtB6RF28lU+vVFw7JaU+pMNxzOa+yxa91zU8aVeY8z607ls1gBcOm
         uWFIO2i26bTb6dRjjWC/vz0SomUL/zCU+NN/JThXWKDXc9lyove73LmPrOd8PzWkz+sZ
         8l7hNHucSkxJxHmTyNe2Fmpgv+hnVPW2xiwvj66QsN5m1WHYKK3AwUvvBm7JRJ7QgJRM
         nVn8MQ7sDtorYurnwLqDnOzYVS80JXeYzyupsSmZZjlLGlTDQAcMknAbF59gGvdyru6U
         Csug==
X-Gm-Message-State: ANoB5pnuu6SpBWXQJL0gtGi9McaHN2BY1nZpVu1qqJEvTBv0NXpfIk53
        RMG5jdZv+JP91qV0djzV72uweswNG02Yfqs8RGrj+RYHMhc=
X-Google-Smtp-Source: AA0mqf7rU+dXTwN3jSzBosObZDYXrJK1CUa8WONpeBqxR2oWdncEgtNUGXM/hlvzsftBuYVOMcCNAHRK1qXETN3lEH4=
X-Received: by 2002:a17:906:ce35:b0:7ae:215:2dd5 with SMTP id
 sd21-20020a170906ce3500b007ae02152dd5mr1358583ejb.208.1668675419254; Thu, 17
 Nov 2022 00:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mdm9615-sx1509q-yaml-v3-0-e8b349eb1900@linaro.org>
In-Reply-To: <20221005-mdm9615-sx1509q-yaml-v3-0-e8b349eb1900@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Nov 2022 09:56:47 +0100
Message-ID: <CACRpkdYCUTb6-RdT0LPbmesxabUR1yMs5-YKCxxNcg+MC8Gf8A@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: convert semtech,sx150xq bindings
 to dt-schema
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 11:06 AM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> This converts the Semtech SX150Xq bindings to dt-schemas, add necessary
> bindings documentation to cover all differences between HW variants
> and current bindings usage.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

The binding is a piece of art. Excellent work!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
