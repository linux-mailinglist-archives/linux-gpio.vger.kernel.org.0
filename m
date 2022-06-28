Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90E255E826
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346228AbiF1N6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344011AbiF1N6V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:58:21 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E9D2AC78
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:58:20 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id o19so15812192ybg.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/l7W+OssRRYQModKHWxWKmgYil2AiQmmsO4Fs3j34E=;
        b=kzEgPie5pY0c0ahz2zTJxPOw01bu71JnTCUESsurSekWEfS5exSW/cJqaS2kOLFZW+
         IYpmXp4AnNxegO/cntNbrVoKNLN1a9RzN0hByEGTIGZ0L50g7PRTv0/vJx0CM+PPblJe
         jK72CWBbaR5L/ROcbOoguxAUkN/Cnp8hmNqMKpGJQSZABtr43cdVlJ2RzFp5z1Ow1zws
         O7+oGnxVXiWrkzHlM9OKxdq3zauWv5/gmlhxe0S0K8d618YrhFt356dAhBKX2q9KzgVL
         zTfEDnUiI+5FpceqZCWDdH7on3X2Mw8lhq5R5Sb2Mdg4hlGbSrCtepCFMp5Ym+uwCDEk
         Q8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/l7W+OssRRYQModKHWxWKmgYil2AiQmmsO4Fs3j34E=;
        b=nGtvoFIaRDQqy/LI2AYhKaYXSTRToE8Kk0M/b4jCU0ENZBZFz5RrIhSGSHzZ9MK8tJ
         JSzSHprEqwYKWop5VXJanrkFr1/YMbjCtdza4U7TJp5hv9SIFbVdGWL/rTvnbKVht9MD
         SlTB2r0V1ev883mmmGCquVvDBqHx7nIpy/KxSTQ6wxnsS6j5yb+dM9CUR6uwoNt2EahY
         +nheV1yWjMccO9MhbxZBaIAIkobPdafMyU0WKZPaUGeVr+qnM9jN8OK5tBEuIzwxvb8r
         Uwceuo5ogBRRNxYM/qrMpi1lx+U9ueNa+btLhFSa/TljIZwUo+FuTF7CeScYz2s1cDa1
         /HnA==
X-Gm-Message-State: AJIora8b9ogMpvosnFvgVH+W1U1ConXHwan6WlnaQ4upxosX1u1sksR4
        vNROGK+LJIu2dUyS2Rm8zLRFHxYAtTwxLZbb60yu3ffyckM=
X-Google-Smtp-Source: AGRyM1s6T+OzQpi21xhADOxFCQu+HizTLSBGEeUHU6KCbRefmRdacgeQvdx2yDE1xwu1Y/sLnazE19sz7Mfsu8aAT08=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr20150388ybh.291.1656424699840; Tue, 28
 Jun 2022 06:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220623160801.240779-1-sebastian.reichel@collabora.com> <20220623160801.240779-2-sebastian.reichel@collabora.com>
In-Reply-To: <20220623160801.240779-2-sebastian.reichel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 15:58:08 +0200
Message-ID: <CACRpkdausrTN2c3QXLFJu0R1B6WsUda6POeUG2XasqBB6hSCtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: rockchip: add gpio-ranges
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@collabora.com,
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

On Thu, Jun 23, 2022 at 6:08 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> Allow usage of gpio-ranges with the rockchip gpio controller. The driver
> already had support for this since it has been added to the mainline kernel
> in the first place.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
