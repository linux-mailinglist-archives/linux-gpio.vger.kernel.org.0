Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1FCC60E5E0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 18:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiJZQ5w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 12:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbiJZQ5v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 12:57:51 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107379A299
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 09:57:50 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id z6so2492007qtv.5
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMH8yy0K5bjEVyDE5fQG7VLZrpH6VjDBSTXM9KXwwlM=;
        b=P81nZevgmYL2bPtSvUe4m5gPskkpK50V39SxUOLOClE4XtiMninGSwcah33MKucLTD
         +xvtP0gw2lQxDx9tvWt+jiqT+W+CM8s60sszqToHUtwt1WdGfGabMTvVMQ9CkABVqQrV
         aGXTkf+byIia/LBDKAU10K2IIJpy3RDBEEgttY/I5SCrkGpSootnZ6OY6l15Mn0j8PFW
         1V1n66alusQoaQzWuIhYULr1Uipz84f+Xx3uGqMIs99wjVS7Xtna8QFLdtWU7dGbQB2T
         0eXKPB2sZytkpbMZVbPDNaz+y9QtCER0trUT2au22M2Q50Wzx86qeGiH2tzeZBWSRv9O
         zZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMH8yy0K5bjEVyDE5fQG7VLZrpH6VjDBSTXM9KXwwlM=;
        b=BMXxynSkIvKZocaFfYC3IyQKgW34tU2BXTMUGSNKO9ihL/KmOXxCuBnc1X/BET0itH
         l55PBq5qJYq41g7DSKosS62nPAt7OBhhgyWNCDiEKCNEPdmlW3uBznhH8X4jJBXvtZST
         hUXwdALvKxkDB6/72BvYtTYfIrIhjzZwjMpcRasUulyQn1jGVep1dB6hWW2s4UMyvA1o
         Dx8ot/010QIfHlxjOwvEKF1edt2hWxoRRuTF2CQ/dOMfoF6HVNqfi/dTYPDdMlfuMOnt
         75g+sjIrQ5+EsXv/bd2RXmNVDSopKF4XD42qRcp0p+e7Niua0AgNf4sfwagZ5G37Shrm
         602w==
X-Gm-Message-State: ACrzQf2qyT8x/w75bHtDNsG5LJ+oLyVZ9zA1nAyRhi9JU5T6Y3yFKDhT
        2czBL14ZJA1QrjjNH6gvMKZfBw==
X-Google-Smtp-Source: AMsMyM52kSo4dwe98KsHb5B/S2GCroXLBYzzgP/n4SM7/4xO2UyexwU8NZBrIReXZn5PgBSiTxoyzg==
X-Received: by 2002:a05:622a:2488:b0:3a4:ec00:2811 with SMTP id cn8-20020a05622a248800b003a4ec002811mr5170836qtb.487.1666803469255;
        Wed, 26 Oct 2022 09:57:49 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id g21-20020a05620a40d500b006ee8874f5fasm4360759qko.53.2022.10.26.09.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 09:57:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: pinctrl: qcom,msm8916: convert to dtschema
Date:   Wed, 26 Oct 2022 12:57:40 -0400
Message-Id: <166680346262.49767.13769629485836334119.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024002356.28261-1-krzysztof.kozlowski@linaro.org>
References: <20221024002356.28261-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 23 Oct 2022 20:23:55 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8916 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,msm8916: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/70af922b7f23bc03b89b3f80b679d11d5e7c2045

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
