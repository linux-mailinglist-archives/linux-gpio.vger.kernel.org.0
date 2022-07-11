Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891D35700E9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 13:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiGKLm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 07:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiGKLmk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 07:42:40 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BB3280
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 04:36:03 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31c89653790so45336247b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyotnNOLxu4d6Mvp/libEObY1gMazKn9YVoURGnCpNo=;
        b=KNC/+Tniy2AR2/uiYxE6Q33lq0YDdyXqLR6dNJKbpYyua5ojQF1U8qHe6EDNX+Oht4
         3tnnMrvFAVsRwllxT1esLoJqzvWzlbNFIOuWwAmssh9mBvg/bnhb9B+5uKIEGaKILTJp
         8d06qOT/FEVPWInRSZUG1gPDdUmEnLL7aCmVssbE3ICO4NV0YNbJsBgyYc2Bb+uIR1CK
         9fuHRkY50OORHNGwPdB9kABnd45TSGcNWvUYgg6RhfT9PKZs+TPFZS9Aa6Ea8dAk/oaE
         1hfbQ17DnHsWUlEVgbmvIGTnTPIqqWuDES+06SSSlPXhhkfa/ebxCznnJpL5geyX77qN
         Txgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyotnNOLxu4d6Mvp/libEObY1gMazKn9YVoURGnCpNo=;
        b=5Gb3fdiCvG8wTjYccZX04Ar1jys8W4brTDav2S204cC2BKti3PsmkrAs4HxmAZsXsJ
         NrzJ3qyzmFW0a16fHua+2bFjKllW9wu3/1xHPYWtDXnUXouoShgDCw7L4jnNeqTbWDoV
         kyj65ix5IPDslSd9IIkxr3NNqAUTEv2S+1nDvmpqzmYtgUnPIVwlviANgIu/aJeOlu8p
         lM+gkSvoFm89C4OfeAYLz7nSE+CjP/QblAxkvDi5P1yf53/zBsPmJfwPcQq09rtGqyUa
         Y1rhZ2H32QsiiNZE1lIql16sSmrpYM5pK1Gv1n1dzbPaVmJT83SL7IU1yDEJTzaY4pwu
         CfZQ==
X-Gm-Message-State: AJIora8YVuAW+0hipdEJtF/KlKIVruSJ5kjal+PpMVo2ggvNoqPxl0Zl
        CMAQH7Algymz2PVUSRrzLjhEtgIqK5uo1AgA+qr1WA==
X-Google-Smtp-Source: AGRyM1vR3CYsGSvN5IChbUxJnV1KcYa3r/2ea0mYxc5ursMO9ayhR76DO5Ujyz4RqWvJJ4MRsWxBCiEswq6ZbOyAcYQ=
X-Received: by 2002:a0d:f801:0:b0:31d:851:96b8 with SMTP id
 i1-20020a0df801000000b0031d085196b8mr19000116ywf.448.1657539362896; Mon, 11
 Jul 2022 04:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220707182314.66610-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220707182314.66610-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220707182314.66610-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 13:35:51 +0200
Message-ID: <CACRpkdbhDJq9bJKHM=1pq5+HrVasrT_WuqtAxGWFfnAXMWSr8g@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the properties to handle GPIO IRQ
To:     prabhakar.csengg@gmail.com
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
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

On Thu, Jul 7, 2022 at 8:25 PM <prabhakar.csengg@gmail.com> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the required properties to handle GPIO IRQ.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Is this already queued in Marc's branch targeted for next
so I don't need to do anything with the pinctrl patches?

Yours,
Linus Walleij
