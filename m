Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED1E6018F7
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbiJQULT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbiJQUKj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:10:39 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03929748E7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:59 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id c23so8457849qtw.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jvo28Wc1qMgS7OyjETHgic0qdepe2ml/sCpPc/o89Kg=;
        b=AGR49KrhJgDvMrQuowFqk+U9rHEACUdAftAqf70y7RGt2K1aLKMBaGoZbugnVsSoyl
         cdvo+WexCrXD5YM/CfTwKJ8zQAhQ8OFDwhbVnN0QkJBuYwCOBu50Qy39mLSSWFpi0rIv
         J/6iNOg3dquDpYOj41qRz8V+tLZ8P7IZkFgDXyFHTODdimquDIorESftqWYO00+dDMDU
         DUpmatrnRMu8myVfmWpEU4wwJRp8ymrS6jkp5d/3dw4+Vr+qd4JOmNsCO0M9Xz8bj8+o
         ItquZ7B5EceFMVviffFTfROcbHPU54RvcMBmaR+N2mNq5GkbhvVSJeaUVi0byHBZPwJS
         0Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvo28Wc1qMgS7OyjETHgic0qdepe2ml/sCpPc/o89Kg=;
        b=y493cq0jBMkdJyFTLKtIdffpsHUdPbl/GFt8WDxrgAmdQYsAwbveUonjdaNOjBY0cm
         wX9M8MPLyjqDl3mFD/VHVYsrTn/lkE7ta6GZiZNxRvrWw3ivOUKteLFhaqPvcYYTRGVk
         E912sG9rQXAjCGSJsAa2VDY5LDS77FttMu6NrznVVhiQlXSweYryIfNikSsc/AzKA20t
         IR09cFD8Hfo4BnetTIn9fI2PM2yMiZ9mrhKTWnEF/MHQKFeZboPO/qEgBnpSlr2buYbg
         uqSjhvbt4JoT7yAET1qfxqFsFe0y+kAvscbAXQ4zqbEqpH8lBxffF3TBZAUCcw+GwDJ0
         hdWw==
X-Gm-Message-State: ACrzQf15CiZMNZqX7q1HshL2bOC9DnSV4e0MOHCr8oANGOfxU3RJ9tTz
        HdqN/k0puJYrQ8RVO4sXuO22Xw==
X-Google-Smtp-Source: AMsMyM7yUfq5LmDlz2IzxG2aEoO5mrqbXm33XIA4owFsw2w/gXrGJxs6Bx2Zwi2Wd/zI2Vq6ggj0EQ==
X-Received: by 2002:a05:622a:118c:b0:39c:32a5:d285 with SMTP id m12-20020a05622a118c00b0039c32a5d285mr10325556qtk.414.1666037358697;
        Mon, 17 Oct 2022 13:09:18 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v5 25/34] dt-bindings: pinctrl: qcom,mdm9607: fix indentation in example
Date:   Mon, 17 Oct 2022 16:08:06 -0400
Message-Id: <166603728602.4991.2117945101964115867.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-26-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-26-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:26 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.
> 
> 

Applied, thanks!

[25/34] dt-bindings: pinctrl: qcom,mdm9607: fix indentation in example
        https://git.kernel.org/krzk/linux-dt/c/9fb8c097b933c42b15c0c67d52c24e26e2fc7c34

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
