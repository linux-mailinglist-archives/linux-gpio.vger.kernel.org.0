Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72560700CF5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 18:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbjELQZb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 12:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjELQZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 12:25:29 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18E176BF
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 09:25:27 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bdd7b229cso18359383a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683908726; x=1686500726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuFZ6m+fFzgdN2W932Vuy7HHTtN2YUBZfk79Gh44ozY=;
        b=bhhC80ahk8a5U9h/oCBwm0aL4Hh9+Icp2Y4A1dGkEh6B5gX5MGdiyjxvdfQOWX+SKe
         nGJyjHgvmVvbRxZK+eTrsp4WXfVIQ/m9he0kjUEKlqRvNs89ugH/d3aLRNUF5qVODq59
         s1OMnkKB0w2aksdnxoRst2Gn1YyLhttNuzmp8NRKovjghZmEpRLEVEd/oCyu7pOk6vHP
         l2oiVcW5Q/i3AzQXHMhTvOje/6n2v7OuI3ArlGGhW08l3qUB4Z373GcKjU/+iTG8u+cZ
         K1fkH2XBFS02E+wKh5ZAyqg5KhcgucuWRQjElAvKY9SFyYFykNWmB3jiF9uEkhAnaUNR
         K90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908726; x=1686500726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuFZ6m+fFzgdN2W932Vuy7HHTtN2YUBZfk79Gh44ozY=;
        b=XnTWBNZejwkUZx2Bwt7soCPcKe+iT8kMQNlj1YTMmYTCWys7ZzhD8E/2dtxxRCbPE6
         o31PE8BBcf/O/OgLyybZz4Yt7/lY9tHITOiQtujWz4nl0vgTlmUHJPZDQD7QSp6YPjTi
         5duOsszVuN/Kg3McvcpZ3jEp0Qh/DLx2rR8/RXf/URT//NJapLWsr1OnWMqalFslLrif
         fMRHfWgFluRJ2xOen5XeLzchH+uqmGrbnji9S1q4WR8Jv0Ctc96nVibX6zGg6LVLfal/
         +e4bio5P8rDEe4iAOUGemfSIdMi5EdUwfBJmWlylaWxpOx4VT6pyeE7h9ubRdl/ORngL
         oAIg==
X-Gm-Message-State: AC+VfDyaFbyhytTlC83Kxg/rc1TMHwR/MVOSqhvwMs51SS2dvms+9to4
        bQEPeuV1mUFct3XPi2sIaM1XHA==
X-Google-Smtp-Source: ACHHUZ5ukyIzzF29iJmPdJuqYE5gu7qtVskWJVRzl1Ruk0i71y9hb0z/dSiJNp8grgNztOIPY34kHg==
X-Received: by 2002:a05:6402:12d9:b0:50b:d77d:53aa with SMTP id k25-20020a05640212d900b0050bd77d53aamr18905003edx.38.1683908726164;
        Fri, 12 May 2023 09:25:26 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00506987c5c71sm4144116eds.70.2023.05.12.09.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 09:25:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 25/40] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: simplify with unevaluatedProperties
Date:   Fri, 12 May 2023 18:25:17 +0200
Message-Id: <168390871587.209400.15664181524901122694.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407184546.161168-25-krzysztof.kozlowski@linaro.org>
References: <20230407184546.161168-1-krzysztof.kozlowski@linaro.org> <20230407184546.161168-25-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, 07 Apr 2023 20:45:31 +0200, Krzysztof Kozlowski wrote:
> All Qualcomm SoC Top Level Mode Multiplexer pin controllers have similar
> capabilities regarding pin properties, thus we can just accept entire
> set provided by qcom,tlmm-common.yaml schema.
> 
> 

Applied, thanks!

[25/40] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: simplify with unevaluatedProperties
        https://git.kernel.org/krzk/linux-dt/c/aeffc733e66fb40491ff79c1a53ef8cf6390ee13

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
