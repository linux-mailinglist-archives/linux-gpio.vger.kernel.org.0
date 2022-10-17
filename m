Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EA160188D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiJQUIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiJQUIY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:08:24 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B185D7969F
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:22 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id df9so8075129qvb.9
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKg/EaHtIJ7feo6Fp29A2BsHwIqBL9J5ZWLupDCRows=;
        b=HF9WItqkSHBq9Uk/Fe8BRprJhGWuLy9wvJmUWLuneQK5jWugkH271e2OjrFmp3dQ/Y
         9RLUboFqg6AI4c3I1IB8rt9d8phpx8ViEY7h1F/uERq2e15DGGSI7aYzkbdVuX0UJt+t
         9cp4qkeOTSKTxda0rKxsFhO3MDeuIAzNj2dn3zX1n2bW6K7o5p9p8Q/tYPJDyutdEI1J
         tazdE0ylZmB7v0lq0PsJ8Q9xhKmnd/FlOD5+voNsk9WQF596+L/TTLcmQcq5DBV/pZKt
         0p/ozbVjb54nkloJd+yd8CWYQi1RK6WHeN6HKYGarfnpM3E8NMCX0RsXdoXub3b8E8aB
         FVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKg/EaHtIJ7feo6Fp29A2BsHwIqBL9J5ZWLupDCRows=;
        b=31oS9cMKhoO9/wm6oreiwXTXYpiGDCkNwdk13fNEGJxzCoNstv65H5Rm7qz8Dsohvc
         xi91cPucWM1ROa5Ild85ASm8T5X7AbqYJbS28OcamQebnSls/VtrdjCLsRrgNJCl7+D5
         Ve9sUpqIwGyZMmJYNcDsZe8MkHpjVWQyU1sPLB5shwj2a4YAOoChP4DsU+VHt4Ewx4mO
         ans2YkN1HYliGZyqFstY9gp1Q4jsVxItmknebu5cEacdG+bUU906WPC+FmquSWdCTiji
         Ici5w065Qemr3VNPCTpy5o9s79/3WKQ2vCiLaLzJNciFoVo1BPfVOP/aGLs+k+MQKLUN
         //EA==
X-Gm-Message-State: ACrzQf0l2h4GHdDiX5QJ1Eu43pUgxOpbaGWyFav6oJmfs4LrixRWzLpD
        Cm+d+sguLcQQBCt3He0MXPsaJIYc8MhRGw==
X-Google-Smtp-Source: AMsMyM7EJpRqSeOpbP9R6eETWuDGFgBNa4/luUKWJNNcnA/0Z8s3g1sZ0+KqlVcoHyTa/46NYY8ZWg==
X-Received: by 2002:a05:6214:1cc7:b0:4af:6573:c056 with SMTP id g7-20020a0562141cc700b004af6573c056mr9593077qvd.103.1666037301880;
        Mon, 17 Oct 2022 13:08:21 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 06/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix gpio pattern
Date:   Mon, 17 Oct 2022 16:07:41 -0400
Message-Id: <166603728600.4991.2330573348078959685.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-7-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org> <20220927153429.55365-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 27 Sep 2022 17:34:23 +0200, Krzysztof Kozlowski wrote:
> Fix double ']' in GPIO pattern to properly match "pins" property.
> Otherwise schema for pins state fails.
> 
> 

Applied, thanks!

[06/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix gpio pattern
        https://git.kernel.org/krzk/linux-dt/c/2f1aad93a1d4a86bb1249f7f94f4e696cde20232

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
