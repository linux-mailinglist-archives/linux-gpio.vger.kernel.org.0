Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE310675BD2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 18:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjATRnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 12:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjATRm7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 12:42:59 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD9A564BA
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 09:42:56 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y1so1009337wru.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXxDJVILWzNGImHcYBDjtkkRHu4msoDg+jCitV9yT+g=;
        b=ViIz/gLjXv5KxCzh3B0pbF/nHKt7BTJ6LohH6UVyBXYeQal8UNNVucUdAAur8ll60X
         0BNwWdkRdi69bdw5PCXnI5ghV1aGedv8NK6lDDPp8k8IENPJf+URcx8IOe/6FPpz5M7C
         02FOgf92NWeCFYQygmk4z8PHRzBNAcvgZ+LFvMY9n/AGt1Jdh76J55zh0nVNNSl7vsrU
         LizEGfUQIeOSWyMDV9n9uVX41GSt7LWRZ5Wiy1QJ6580y4EaGPTsxT1tfMNkRT53JSDx
         kp4nirAev8aQXfEBXJvwX9zF4V2hu02cmVk56O+ONEniuOGOhn1hnHoHshOxnaeyRwep
         QHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXxDJVILWzNGImHcYBDjtkkRHu4msoDg+jCitV9yT+g=;
        b=fG+cG5Me0Y1mr+reGp+f6ONG4Sz1sWFiCRbnntbOsQBDnQ6uS1r6TT1rVs7QjM2cI1
         Ud3i7Eh0TwAuHtruutJzIqzsM5acdcki8wkmYnX5KZImHf6T8AYB9kGW4uw2qSXrZ9hj
         Lmfipx12MV1inHr4uaADDapVrboofZzTVgMQ0XaHNGuyQ8H+y7flcJRJjpD6TwTsiFgK
         bZSyx4RtvWkz6zs7g0Q6vlQxcCZJ8QcGZHX+7+9tmsAZiOjiheqU+8il0J23gzq+ZCml
         6aaf8SyihZ4PCk94nYNHyuvX0SiRgaHx8VgvBFaFfmyx5E4weeAiaS+YpiMx26Ik4RnQ
         oVSw==
X-Gm-Message-State: AFqh2kpcjkLPIYW29kqKoeHUGnzyK0yKM7n8n36RByzO0QwZdbgWaYeX
        UyC6EyJ8Kv4O6D9CaUeCcHMrAA==
X-Google-Smtp-Source: AMrXdXtzzNIF7XraOrNH0+hup8VYPt+S3b7S2atV+7nc+9oxpWKJ/VtBCFZu027CC4YZ9Rtw4iQPXg==
X-Received: by 2002:a5d:6b50:0:b0:2bc:7fdd:9245 with SMTP id x16-20020a5d6b50000000b002bc7fdd9245mr12870266wrw.5.1674236574785;
        Fri, 20 Jan 2023 09:42:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w8-20020adf8bc8000000b002bdc39849d1sm24589861wra.44.2023.01.20.09.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:42:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp" child node names to "-pins$"
Date:   Fri, 20 Jan 2023 18:42:47 +0100
Message-Id: <167423655094.352486.17564121663586668814.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120165103.1278852-1-robh@kernel.org>
References: <20230120165103.1278852-1-robh@kernel.org>
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

On Fri, 20 Jan 2023 10:51:03 -0600, Rob Herring wrote:
> Just 'mpp' is a bit ambiguous for a pattern as it allows any prefix or
> suffix. Change the node name pattern to "-pins$" to align with other
> Qualcomm pinctrl bindings.
> 
> 

Or instead of review let me grab it for Linus:

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp" child node names to "-pins$"
      https://git.kernel.org/krzk/linux-dt/c/5682f23bd3daf8d66f0a4c0fa0e5645b324e7014

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
