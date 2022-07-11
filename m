Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C5E570157
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 13:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiGKL4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 07:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiGKL4R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 07:56:17 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD98326E0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 04:56:16 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 75so7012825ybf.4
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASd7dm6lYrZdAzK3N6daMmc+CWirepg6OyYYSdtPBtQ=;
        b=zHlbUAwwapxF0MLHHEdAUgC30UDRWwnmS4vWTffZbOif1EEJuaKGsHMyFKMaHRVznO
         wPDPGav91x3qQXQWMV961AiC0MaN6ftXSo9GLdhSM7sU+DS7KZx05CPvL7TM3mp94Qtg
         n7TpdkJwZxF3XZegob+8sngX6WiLYZExfCCR3smH131STPnOCJCjALZhH34nfL7ebw/H
         B4xiKKGBsN9200igRrKqn1QfUWJLrck3SgRhJcg3NdFEhQmWHHvEXU9U/NxFVC2PncJ0
         Cjx5HdHf+VjIknNmNKTYpkBKGAULzRObXs1wHI5fABmFmyMtSytDvpoYEFSKNC+1Mk9z
         1Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASd7dm6lYrZdAzK3N6daMmc+CWirepg6OyYYSdtPBtQ=;
        b=ijviKR5PyWIgyyaBrDXd3uCGpdinS53STIqOxMXyLXE0GPeMtslxjwxDcr7/k2pjJi
         9UJMBYUScPGKo3OJ9LEeGy4k7gYndIfT/604wvOzV4fOcwgj4bnfQIiJ8YVrJ9wuFZXy
         Qvla2dUQ9y0wfkVpRH87bFT9PUxB+dMNUFe897u0Zz7tdWWev09XmsnUzj419yu0wFlm
         aYCIH+S+bc1CNZM7GZiweJ05indb75kNJASaEyX4yW4HmyU45gM2RGrTL66Uju3pCsXE
         Ec5r/5v8n4ia65O3bwiwYV2oVt0EigKqXDda9zib4pTrNqkbSy2UGx78h2H4TzFCNN/z
         CRGg==
X-Gm-Message-State: AJIora8O+xx8GiuHXy36/9gCRMULO656qpPsAJngmf0HN4/2fjC7jI4f
        s+/nUeQlItNFYun6pPQRrxdagHsEFHZEuHKE1PoAFg==
X-Google-Smtp-Source: AGRyM1v5CLjNTsjcq5fYn7SA01Pi7mP2T5BVXZXBSbQVgj46pIJy/5zI+faxrUyGQR4WPVtKoUIQ5lemEHunE6+RpE4=
X-Received: by 2002:a25:d07:0:b0:66e:6c0e:a2d1 with SMTP id
 7-20020a250d07000000b0066e6c0ea2d1mr15127181ybn.369.1657540575867; Mon, 11
 Jul 2022 04:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220704212402.1715182-1-robimarko@gmail.com> <20220704212402.1715182-9-robimarko@gmail.com>
In-Reply-To: <20220704212402.1715182-9-robimarko@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 13:56:04 +0200
Message-ID: <CACRpkdaAb14TGF0atvbB8NHygsRGNCKJCf_S2gOzvvTxxDEeRA@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] pinctrl: qcom-pmic-gpio: add support for PMP8074
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, lee.jones@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, jic23@kernel.org,
        lars@metafoo.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org
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

On Mon, Jul 4, 2022 at 11:24 PM Robert Marko <robimarko@gmail.com> wrote:

> PMP8074 has 12 GPIO-s with holes on GPIO1 and GPIO12.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Since there are no compile-time dependencies I expect to pick
the pinctrl-related patches separately to the pinctrl tree on next
v7 iteration.

Yours,
Linus Walleij
