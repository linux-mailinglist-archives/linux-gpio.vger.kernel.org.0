Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8AD7662EDA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 19:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbjAISYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 13:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbjAISXk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 13:23:40 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72F768CB6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 10:22:46 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g10so6933648wmo.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I9a2u/ZrGLHIwScZmGllc87eUh/OufbbnBg0RjayAc=;
        b=imulFjmKfL16MFAUV/KLR82FSiH6U2btmRS0B4dqItTP+kGzdlQa19UyW9DQ/O7H+7
         bTYgi3Biswev63WU+wSWP/jPv20/RZft55i6fdJ2QR3u9CQlPWZMFV70FzX6Y84wL+oa
         4pa2OAQ8DNzMnEngg25Y8Ynn4T3Y1q5Gms+1p5wPrh7mGliSwI24rNyePuKIlsAdhemA
         F7Oz5Q5LlbBY3DScIe/p2dLqbT/T/6y7v5xVG2nu/CbfGN1FeUsZLBOmQZE+cWhc22Qa
         dOVy9RdsDRYTZAPi1AB7BSmo3HQlYkf+X1nXE3Jorm1AI+uxxKB65DB3jvQrJTk3dLif
         axaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4I9a2u/ZrGLHIwScZmGllc87eUh/OufbbnBg0RjayAc=;
        b=nOEXCr679bMi0k+hR/crLruVLpqDKhvjPiNiLsMb7b51n4Jhb+D83wcoUcxkwi1vnb
         1e1KuEMmaNyKvE9a8xfAWqFdwdgaSfWVYylGPIt9evKjSJyUrac/Ug1fh9j4gXnDCNuw
         nFV9yFE6bUNArb76/13gOwm/wge8Jlbspwz0b2sgATRLfYAh0L1k8jJJGFklKGMXTiIz
         8VH23qt7ltllBg87izJMG8GAsTSK9PQ+WXkKF9bNHpXgYo6xfNzK9rf4bkQBfyckxcDm
         Owyvz1UIhXD8z2Ahc/7u0YGBvwixHL3QP5uvqy+yH0Qs7Cjh6xRuz32cv+6IseJT40Y7
         AhUw==
X-Gm-Message-State: AFqh2kroF87ScgQE/UNmC6EqZ0YdoO912/0EKUdi4AnXjvH2A4ksskCZ
        Za44kIG1i2fjb4lrlqUBLnsdmg==
X-Google-Smtp-Source: AMrXdXvzOQzmnUHWBiYlOCVrua6gXZN+THvm33Jb9HAxI6MjBJD6kMOIRY3fa1ON2R158EliBRBjGw==
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id fm7-20020a05600c0c0700b003d973fe96f8mr40571156wmb.32.1673288565332;
        Mon, 09 Jan 2023 10:22:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b003d96b8e9bcasm18555195wmq.32.2023.01.09.10.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:22:44 -0800 (PST)
Message-ID: <61b2de99-060c-d37e-60ce-4524ced84033@linaro.org>
Date:   Mon, 9 Jan 2023 19:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 12/18] dt-bindings: mailbox: qcom-ipcc: document the
 sa8775p platform
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-13-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109174511.1740856-13-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/01/2023 18:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a compatible for the ipcc on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

