Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79C0600AAE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiJQJ2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbiJQJ2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:28:43 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA5E5A8BF
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:28:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id y14so23452975ejd.9
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sRtEfip02EGTBP4edB/FwprEzOq2fm0X9yp+s1rBwQ=;
        b=YXpYCsv5+YtJS9nFNCTnfXQoxWyKwouTACKFsv1aW+KbYaKZCek7o/3jG+L8xEZsqf
         7zPB1Fr/yQcVuML6gTYNsQQ+MTjuJ9V3ZVj4VHpThUHlsdGbX0ogkQTqGbFY4obGMnUE
         epCdcvPypicKcxIKcqE1uIa5ZuUAKZdvMSIder/4CAk9oBObw/Rg4sz06LEijFofnSJG
         cUITormZ/20kpZrMTy7f+k5sHjOQj+qzHWVdBM+1snu1CtAqzOGRyPjmEtjmtrwj1l0h
         EtuU/E280qJyPr17TKISuvCplOcFo0h6A25BhnJpob5ZXC1SJadmQAkkX9wnQS5KN6fQ
         C+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sRtEfip02EGTBP4edB/FwprEzOq2fm0X9yp+s1rBwQ=;
        b=i8cFZHgNdfo8Sfj2CSD/pUkn1bqYTzUrF5NtlnH5PtdE9IudZZh+FYMpYU7oVh+opu
         jfPIyIZY19S49DfO1IQwzLzG7JOpXJSJKN2hk9DCCm1XviEx91faVIzLzYH5i5Fr/tfN
         d1h4W6HlKBDKgrDfkaJIpNzEYeHgevNzIHl9ooydKP6RMiBQs/U/xkbF8jJMepiS1VF2
         cmzxJ5ptgX2gsXfnvIAvme5nviiRgL+bmq1tAPzFKTyLec+hdxj0ZXc5+AGseX+nOR1P
         jSxUpuZrhtweFUV1Y8boDrxYMd4mg7+hajq5ShYiDbqyP33t2Q5ESDOBYyW1dYVFpCqB
         eLwA==
X-Gm-Message-State: ACrzQf2U3CuckXLVWoi8rP3RXDdZr+r1m5s/qL/7kGfY3Pq9OorvrPcM
        Xig5UG8sGnF0lYTNDKeffcTSafl0FQ1yCKLpIM2f2A==
X-Google-Smtp-Source: AMsMyM7zVSF2Vm9e9Kcc/3t2zaFVm1cTq77AMTmUzQOQIvXXviKdVM+f4K26+4QfCm+FM6tds5RPSL9QvATZn+arnS0=
X-Received: by 2002:a17:906:8a48:b0:78d:acdc:b7d9 with SMTP id
 gx8-20020a1709068a4800b0078dacdcb7d9mr7999946ejc.500.1665998900480; Mon, 17
 Oct 2022 02:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221014001934.4995-1-mailingradian@gmail.com>
In-Reply-To: <20221014001934.4995-1-mailingradian@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:28:09 +0200
Message-ID: <CACRpkdZ2uTrbj7RpsznV6=JgZxBgFMYtMP0YBsJe16WQ0Dra+A@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] SDM670 Pin Control Driver
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 2:19 AM Richard Acayan <mailingradian@gmail.com> wrote:

> Changes since v9:
>  - add arm64 kconfig check (3/3):
>    https://lore.kernel.org/r/20220925112103.148836-1-krzysztof.kozlowski@linaro.org

This v10 patch set applied for next (v6.2).

Thanks for your perseverance on this patch series!

Yours,
Linus Walleij
