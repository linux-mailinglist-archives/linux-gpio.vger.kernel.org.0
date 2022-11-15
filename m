Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00F3629E81
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 17:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiKOQJk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 11:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiKOQJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 11:09:39 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76EA1CB04
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 08:09:37 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id l8so18104325ljh.13
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPBg3aPup1TQrck1IA/Yv4HNABzho1ILiMaAmTFfgE0=;
        b=J2H4Z7E5myou0P94ccP1VezICVHOCg9j1V9hyj6oTeYMShonkKMCxchRDEF4WtW++z
         oc2zj743sE+gfFI/bgkhBneMySmqq1ARc1G1sU0SjvaouB1HUnwV0723wnuv6u1469Jo
         ya4LnWztcX5F4bu6SqC9Szf6fsCut0aR4LW6lghE6yKQayaprxfeHUi8Ua1zolYmtz9y
         eCiFwYILjnL7DaRVn/Og4cnaHHYhIqcCJd3eHjyKj7aYXiGpdNW24hvgagGVoikOmPMN
         Vk+pIZt0L3T1xLaBbpfVyKdHUZXlbWldJFLWuBObCPTzlfjm95KsCMn17vY/jZceYT4a
         ScZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPBg3aPup1TQrck1IA/Yv4HNABzho1ILiMaAmTFfgE0=;
        b=iDCm6MpDTHKEjdTq2JqhfdLQYbkAGNBe8FHRemOwR/1dnly/AS2UWEFQZ18hY3rYVo
         TJM+RAnwPTHhcdMogAyOmkLfTqHETTEgGNvs8cOxGf9+JNPLfr2shIf3vDD6gernd8sv
         nTNZ/HCKxe74SWsP8W/nOYcvfGzdWXYR5wi7JJbj1xQu/gNZpODGTp4qYw6hy0pfa5A6
         9saFRbi+W3ojAcgTJ9iQGIgx3lUokK9qHcxqv8dEzPgyhFtSWxzVatkPruy8DM99WrHF
         0QkldNqn3CUZEQx6UpoDxBmNdrnMdVDYlFyUh16OMxJbidLuFLzNUOcBBJ42pP39Iq1z
         aJAA==
X-Gm-Message-State: ANoB5pn+SU0YY0NHO8QZmVdfCOJpNj/+UsnMBX5Deg2vdPdrovz2xcnW
        ++EPZGTEDfOQdvxLRnRtEVUEBQ==
X-Google-Smtp-Source: AA0mqf7yzjjbUJbfMhhx5CM/cCMWU0lHJVOEzMQnKBEhluX3cCqwirDxVh/yWeaZHBkZ4WGhQ5pjBQ==
X-Received: by 2002:a2e:a803:0:b0:278:f5de:8478 with SMTP id l3-20020a2ea803000000b00278f5de8478mr4436665ljq.65.1668528575904;
        Tue, 15 Nov 2022 08:09:35 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s2-20020a2eb622000000b0026fe0a052c5sm2555134ljn.129.2022.11.15.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:09:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,msm8976: convert to dtschema
Date:   Tue, 15 Nov 2022 17:09:33 +0100
Message-Id: <166852857073.244019.11894552754264671717.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110085230.15108-1-krzysztof.kozlowski@linaro.org>
References: <20221110085230.15108-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 10 Nov 2022 09:52:30 +0100, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8976 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> Changes during conversion: update the list of non-mux pins (like sdc1)
> to match Linux driver.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom,msm8976: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/966d0a44f103950265db458180b581275a225b89

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
