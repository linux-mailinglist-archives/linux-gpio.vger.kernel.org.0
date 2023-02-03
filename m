Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B384468908F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 08:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjBCHRl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 02:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbjBCHRk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 02:17:40 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D328E698
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 23:17:38 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1668292wms.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 23:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnepfZGlcKkzb0IGO8f/azfUq4gMfArcym1565cHpoQ=;
        b=ASFJlA7bIWOrU84pY3Z63MdHIPjLaRkR5sWVIHpic26zAxMK5h2M1uUQ3vV43pQ0Vj
         BDTJxvE/x1EIghSE7/YzgkA9hq+eT6QTZM/HjXRmXGIFDG1yMiyarZNB6Yy7Ep6Ms3N/
         DyxbI4LpTbTy53q6B3RV8EtERGm8baOkLs9VkBhwCRlUdxOaW1pfA6EPL5ZFHXk/hBmL
         dkG3hWle+cO2/DQHMrYtjGM5w0IQD2SoWbQeT2xVXWqdW5OZ5B8evnErTM99NmRyhjr2
         yjVw6iQHx0/BPdFX7HW4auZk1lDxCGJiSXm9tQbohLJcFqvabvtUqL7xt0AKAWfPp8bP
         69Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnepfZGlcKkzb0IGO8f/azfUq4gMfArcym1565cHpoQ=;
        b=sYuoRm8Pyds7G9nfivaBbjz90pad3U11gm4vZam7diEPk38O9A6V1WaGbgbDDD2J+D
         AGsXx2KSX4HlIAuXNSqKa/FybnC6fIJb18Eq7cWahv3bEk/kQahY6fH5PMTK44hx18m2
         4lu1qNsQYMsWgvQxjB/RJZRziX4wqqGzPp5/SXH3kYhYVgfITmrhzSupJetWCY1EWxdr
         bTrEKnsKKmn5VsnYuHn9d/vKNchYP85lz1hsOmpXNXXl3nzju8A9KF2pZ17HO9c+VKZj
         hJePPWJXGW5LxuDgdqr5e8p0B4lyGDbqzs/Pi2jsXFhYT09CQ4elwGpEyS/VI3HrOJ3H
         IkNg==
X-Gm-Message-State: AO0yUKUx4E7uKaPqeW6PlQEr1M5SfnDKj1N5MrF8Lvd8RhHyOeOCx7a7
        I8UW0ITxWMYuTMpJ8n09C8JQ0w==
X-Google-Smtp-Source: AK7set8THCtWjYnzqP2sbxXc4qGcEgXjwRb4BYxSTB/EwSRBo5nm8LyB74aJC/33097VyckQyKaXaA==
X-Received: by 2002:a05:600c:19c6:b0:3db:2647:a012 with SMTP id u6-20020a05600c19c600b003db2647a012mr10740167wmq.40.1675408657166;
        Thu, 02 Feb 2023 23:17:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Iskren Chernev <me@iskren.info>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH v2 04/10] dt-bindings: pinctrl: qcom,msm8953: correct GPIO name pattern
Date:   Fri,  3 Feb 2023 08:17:24 +0100
Message-Id: <167540864401.6835.12227254658728601440.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-5-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-5-krzysztof.kozlowski@linaro.org>
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

On Thu, 2 Feb 2023 11:44:46 +0100, Krzysztof Kozlowski wrote:
> The MSM8953 TLMM pin controller has GPIOs 0-141, so narrow the pattern.
> 
> 

Applied, thanks!

[04/10] dt-bindings: pinctrl: qcom,msm8953: correct GPIO name pattern
        https://git.kernel.org/krzk/linux-dt/c/913137a1cd1e792587e8ae2a43d31389fdbaddf6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
