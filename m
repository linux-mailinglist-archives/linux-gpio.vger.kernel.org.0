Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E72D6018C1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbiJQUJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiJQUJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:09:11 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2EA7AC14
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:45 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id j21so7382743qkk.9
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=If++LWwNOyF5ckswXDXoJMcl/1wNn/+tZFQPJ0x9ifc=;
        b=A/WODgLgG9QisvodAGpil800z8s1QmDZtrFEdgMFl35IIUExH+9pvqPuG9Opg3ToEC
         KFifzTXak8KK9cVK6UDStGXI24wtzzFlRw4NhTzGG3be9nP46lvpafWfGGh2z+uUkHMm
         8lWZP1RlTPiLAStaRolll5l3DDb93iKnijY+KFoyZzg+NgUnutShBtv+KfknUNZPUpWl
         rrAlENki3Xf/tdwIvI2r1kET1g2SFBEtqay44fbqdi/Fb9dT9f6hP1uu/2OCin/qMmL4
         UEE37E6IWaMr15aFV921WKkJx2+7WAhTVHbXKq6i0C3vgeLvgJV8n5XgbBEUVL7eGNzF
         mC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If++LWwNOyF5ckswXDXoJMcl/1wNn/+tZFQPJ0x9ifc=;
        b=zWX4BkK6qFBe/o+qIuz7z3ouJd7gl3I7m/URtsOqyHHGo5yJ/XCf65MDRgV/OhslNn
         Q1PqUTUClz6IXSKSRDmoBGpNJYdOiUoPqtXeaE22UCOp3xQ6AnMufMzwKv523S+abc44
         USERzS04czR0RSJU+Ci9fBz1n55ATaCqmbgKtUO4XMGrApO9xJCwLQsSYW7IjSMpxMND
         mFYXYIoGB7+57C6y47mQdNe2DVmmTYbkDd5EJRWUtmPGyZb3H6rT1IlXHdKlIeDheL0C
         wjraeQH4+3oXhleW+Hm7XRX8MNnkU0GifXegRr3aA+2qIk+o0VZPtwh7k369lbipOYH+
         2ahw==
X-Gm-Message-State: ACrzQf2zfLnrJPhGq8V9uKzURZtkR+08xRegPDOy7Y7JSoKJFlGzeFzd
        w/m0XGhNSkr3KTBZaml0/U99GQ==
X-Google-Smtp-Source: AMsMyM52Y94hvGcj5U2IpCSpWfySJ2gJLLod14skiexkKS76t1cB8Ae+bnM+BJZ2SfT4XWXwOUq5PQ==
X-Received: by 2002:a05:620a:454e:b0:6ec:61a0:1865 with SMTP id u14-20020a05620a454e00b006ec61a01865mr9205339qkp.414.1666037324435;
        Mon, 17 Oct 2022 13:08:44 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 13/34] dt-bindings: pinctrl: qcom,ipq6018: fix indentation in example
Date:   Mon, 17 Oct 2022 16:07:54 -0400
Message-Id: <166603728601.4991.17627005332347004343.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-14-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-14-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:14 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.
> 
> 

Applied, thanks!

[13/34] dt-bindings: pinctrl: qcom,ipq6018: fix indentation in example
        https://git.kernel.org/krzk/linux-dt/c/4c05adcaa6054a2a6f229b1598615028816aad19

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
