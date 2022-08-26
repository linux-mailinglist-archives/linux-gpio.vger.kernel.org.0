Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1A8B5A28A5
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 15:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245543AbiHZNeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 09:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343803AbiHZNeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 09:34:05 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9093DC5F3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:34:03 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-333a4a5d495so35919157b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
        b=Badek9Z3Zw7k7MP3T3YzVdM7CAxTgNBC24Y9sxs8xUcI7ApWgF7W8s+Gcvz5ZVhKP1
         Gv/BM4JpKuQ0UsB3GLYAcuMHJrwhuMYNb4FXaxY6qW5KzLK0QVcBuDwguYH4jNNxTedj
         lCUZuv+5g6OWaGpzsg7CujNCCX8jo0zwxY/d62havl0hP9HtOY07Lla1ygso+jhceuRo
         c6zerpixbQK+eKtQ2/j8/OVTJ7t+7dCHSEbF6H4JAlv0ncMGq4l8alqAwd7ZBJWq49W7
         dduQbKTdmgNjW5trp2/imaB1kqDb2eJN79QRGfSzutp/zKzz9em/stAFPeeyWGJku245
         agtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
        b=6C7WC9+VAhkqFJmpV1tdpuw+X3F+FH3WVsSFnZVm7VgXHQtDG4SANgmYAina4UzPPd
         Ewoz7QA2o4xGbjIQ8fdwnMq67uyKIfz7sp3p3JLKMFgeru8SkIoGu2eLWJ6aTdRiN8tD
         MUlxamPRU+M6P9lenCDUNoXSXGutQ5UNjZNmNVr74qj15ZWFT2I1UOYxhAodmiaVALR/
         A9O/B2C0HirmEA+pJLegPN30dTal6aCS77LhiTcoK+L00tnHM1F4cWWXGL7lN2O9KEdo
         QyDZyRopSyJkk8QpuZ2GomL1bSn4iIykxU3nbtUxBbcRE913whFhq1mZZdgq+cs6iFOY
         RbmQ==
X-Gm-Message-State: ACgBeo1wm86dU6OJDlGDd8XvR5rOn5P4YMgdbVw4Dp1LWbn5WK3+G9nJ
        35m6vQDZUv81732Th8XuZRcMn3vMObik8yGJOgCz4A==
X-Google-Smtp-Source: AA6agR4cSYDUjHjKqgs9zKaZ58NNESabUJfIrLT+OTCGH4HwSfACpDx/ctbx5ozgIrEgXjQk7zDpKuMhmKfrTiLRGm0=
X-Received: by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP id
 t14-20020a056902124e00b00668222ce8damr7302689ybu.383.1661520843052; Fri, 26
 Aug 2022 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-6-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-6-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:33:51 +0200
Message-ID: <CACRpkdZ3syQzLaZJ1aksB6o7Q_xOMGSC1RfT_9iVYgpXHi_mfw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Add missing (unevaluated|additional)Properties
 on child nodes
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Teng <andy.teng@mediatek.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 23, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied to the pinctrl tree for v6.1

Yours,
Linus Walleij
