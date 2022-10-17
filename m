Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D473C6018D9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiJQUKZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiJQUJx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:09:53 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E96CD79
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:21 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id l28so8458689qtv.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkfY19Z8rIrVFTu1TtNfrJ52Tlop9Rl4OnJC/RUurMQ=;
        b=TnLFN3iPa4UaiXE2wsMScCERV/nk8oZNSgyuRyAC6xessJRvYyE65jFZAcwa255jFq
         JHBfVSpM2y3s9pFSK+/k8xXupwXC2LzAjrNMb4sEkc05r3K9tFNEcDfQzuCC3FojCj9J
         gjK7w9LGZmOVYkLYhbP6waYT4yDACKl24+sqVC0QaXwDsqQP12zCcwnh/r+V1tnVeGT2
         0Tnigil60WpzSyP9AFLmgdoupl4NoKZ7WWZjsIFQcE91vvkyG/arbZDMa9Y/kWsrXQdS
         ghVZqLcmSkDE+sEOLqTbDQ2PmTRdZQ63ZGSiDuiMyzAcxcQM+GZa61hqPnvCKDoPQPeK
         YUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkfY19Z8rIrVFTu1TtNfrJ52Tlop9Rl4OnJC/RUurMQ=;
        b=RCZFngvlsqqpZmyipVfB4ryDRVsI/ABb5Y0cNZgDyECRL/DDiR6pZz7TAKR2nuKYMe
         5W1yMGSTdusUZQBCGEhycBhV7eYCCUwrKhk0edgrAKay/w4XkSaU3ONOAEvOSVXsfkJP
         88/F3eDd4fnzzFRMKxKDQ6nof3CNs3RfyS6M/AbPwJV7HaQ8pKnjokiR0U7Z/qhUCdRh
         sV3iGDN1bQWcj1ttoxTgKg1v/B2Zgj+f1bHqwYxPQ4vViO5tve+gU7rYdtZlWycKG+d3
         fZN8B/qWu+cdeCFi3Z6diwkypsgkYkR/kJedfR2WF7xebbvYQSFJXqoqF/Efahm89uvR
         g7Zg==
X-Gm-Message-State: ACrzQf0Hs3/j7tDe6b/OHReb4kuCBvzn4oXC7qFqvmg2rCkOhAtm7ySt
        oK9wI4jdcbkkWkOM7YiTQ2k3DA==
X-Google-Smtp-Source: AMsMyM7YKK7r65732mFBCXddEPMQRqg/w9h2rNf6WGsGCmawqtokvokp/Yg9qeK3S0oDmyeQCPVuJQ==
X-Received: by 2002:a05:622a:64a:b0:39c:e12f:7c84 with SMTP id a10-20020a05622a064a00b0039ce12f7c84mr9764822qtb.530.1666037360678;
        Mon, 17 Oct 2022 13:09:20 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 26/34] dt-bindings: pinctrl: qcom,qcm2290: fix matching pin config
Date:   Mon, 17 Oct 2022 16:08:07 -0400
Message-Id: <166603728602.4991.8167754247616925634.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-27-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-27-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Oct 2022 13:00:27 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> 

Applied, thanks!

[26/34] dt-bindings: pinctrl: qcom,qcm2290: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/7d3da666f2c0f9416f6d1a2c436b87a6d9f61e79

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
