Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F6C625539
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 09:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiKKI1v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 03:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbiKKI1q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 03:27:46 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BF47C8D8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 00:27:42 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d6so7276480lfs.10
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xx7LXGsQ1UybmGpbrTODqg39yWDhEchfX49PVTgfsiQ=;
        b=Dv2m87uGwk9M6MuktyNavmEClgVM+K6T3sS9jKf0PJuFe+TJsNESLx8l5EypLjRTpr
         0D86vIkiX8Tviw5NUYsMWvWu29TUXBbWc8N5ldKgMY2VAOBk7dbqLK+OEm+PBxKdU2zB
         0Bog737EpaHTQZ3aEwgXUt8PBsVzTdVQb3hN8eGZgxNStU5xqnjD7fd67b1Oj6jGlghz
         KT91ppeO2QWpKZ6ifxEAOvKFKlJb9ZbkrNHJc48YC00dnSl6/F724AP1PfRgPJTrKoQK
         75UFKfY06UJNT+Nol++auIGHm9bhCVFKetyVCZLMkshnmBM8aSgpi8wfm/dYhavmiPPL
         hBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xx7LXGsQ1UybmGpbrTODqg39yWDhEchfX49PVTgfsiQ=;
        b=aA21sG8zo7x85R7uA848/cqaGIM/c7OAFfuqQAGrNusdRft4p7VeY7Px87QGRMgUdu
         8EGcCfdkX2qGsmfRIHVfNYNWYx4vkp90lxx7m1Ofqnr8BvQuGsBJ8MO33sgy21ENaCnd
         E0coaxw/d/tAeIq48dfh6WqdcRP3N86kV0w3wm7P557Acg/+BqBOevqwY0GaU3ftRA3V
         3pwQgH0129I/AFmS0/clQkWMbvXl7z9D9+XqndBcSaOZ0PtK4RUjyYR6CKItrdiiyDL0
         ms8YFqh53G4ytzU7pjpoCX2fGWJ2KMl/GbJR2LxEijqWBRoPcOSV5ftVo5l92BPM4pRQ
         0zvg==
X-Gm-Message-State: ANoB5pm5CXSyaozO+L4QqR9M8LB/qxavWSxYy9dThX4uGAsJ5BvSFNBr
        fbVJDp1ejCHBJ6lFMTv+LqoYdA==
X-Google-Smtp-Source: AA0mqf77hOpbW33UTEyrvrjdY4j8ukRUH+BixcU7n6vB6+hL3EoiEVloZPKw3opau7Dr7zr/Ft5tHw==
X-Received: by 2002:a19:8c1e:0:b0:4b4:6460:24d with SMTP id o30-20020a198c1e000000b004b46460024dmr378243lfd.386.1668155260865;
        Fri, 11 Nov 2022 00:27:40 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e6f11000000b0027754bdd667sm265888ljc.109.2022.11.11.00.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:27:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: pinctrl: qcom,msm8660: convert to dtschema
Date:   Fri, 11 Nov 2022 09:27:37 +0100
Message-Id: <166815525483.8898.4129334640616218143.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107185931.22075-1-krzysztof.kozlowski@linaro.org>
References: <20221107185931.22075-1-krzysztof.kozlowski@linaro.org>
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

On Mon, 7 Nov 2022 19:59:30 +0100, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8660 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,msm8660: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/aa191ab79a3e94d51a52155ad85fea40620c1dc8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
