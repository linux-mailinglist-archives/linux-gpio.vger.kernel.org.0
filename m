Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC19262793B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 10:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbiKNJlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 04:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbiKNJlE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 04:41:04 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8811EAD6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 01:40:51 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id a15so12382564ljb.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVIrJB62xFytgyX2hXOIwCkUIaWq9adGnSjJaoKJxng=;
        b=IL7q4QAIccunJwfWqTuHGQi1izpTEyFq8ufXrX5+T7lwl4pEYmRVyDDS/Wf4wBVEtm
         A+h8yErXUxZzGoavkINF6Ihw3pmO0QuJG5v28i/FL+0FnjkKsQsg86PIqkpAuWbucUQl
         JLJ1gmB9ioWwwqOG1oh/cmCpieV7flF9QUF69BP8m8jYWfCm2Luz1Hym1r90TmOITXNm
         v454W6JgZTm7WuHTXFieVdrXoBH1jXsscukcueTuRUl4ev4h2P/RDYi1d39ZrzM01bwR
         bhQsgMBqoFQA9usFOct05Kbb0KdZc0HQWXt1ZMTpuwkwBXJ1IHNvQfoW8iHZynKH0fh7
         R61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVIrJB62xFytgyX2hXOIwCkUIaWq9adGnSjJaoKJxng=;
        b=f+av4JGNtUNcYgIV7nX8CGLVCFzry3IX+7OTOzea3DHBfe3Iw/wD/4rpAT3W67B2bd
         RM0mltPPfDiudpQFt6/eY4uOvVfoFnmsWDN1SkVUybf+rq9NnBzIYBDHjWixKoGlDyJu
         E2KoawCAqr85V9xtB1gsvCSonbfbj/D/jKNX0d2B2FFJMjA4SiN7lDDSCasGBtAQ4/rp
         xl1w/s9D0X3tQExaTRU/s1KF7IQx6q2xURPR/wjMkASbm48SaxhflSJKxewQIQ/EUXC5
         PbgJ3pP6XktryU8/4aEnADlU79OnDj/edWE2XswbkaJVkx0GQwapmEzkgpD1uphanaTO
         jbtA==
X-Gm-Message-State: ANoB5plFgZtFfRlMOydFgktDnuENW4J7y8TRbWLakXGKFpClBfxyh0XY
        LjqKdREScIVOcvyP8K1CK/0zVA==
X-Google-Smtp-Source: AA0mqf4/jxt2YzhS5bqE7d3oZSnRUYxSjcA4QKPtBPsohUR7PehtXB8E2onkoMJ2R42SbsaUTYppbg==
X-Received: by 2002:a2e:b011:0:b0:277:6f0:523b with SMTP id y17-20020a2eb011000000b0027706f0523bmr4271345ljk.297.1668418849464;
        Mon, 14 Nov 2022 01:40:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b00494a603953dsm1762430lfi.89.2022.11.14.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:40:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: pinctrl: qcom,msm8960: convert to dtschema
Date:   Mon, 14 Nov 2022 10:40:46 +0100
Message-Id: <166841878696.36382.16617765528924868503.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109105140.48196-1-krzysztof.kozlowski@linaro.org>
References: <20221109105140.48196-1-krzysztof.kozlowski@linaro.org>
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

On Wed, 9 Nov 2022 11:51:38 +0100, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8960 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: qcom,msm8960: convert to dtschema

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
