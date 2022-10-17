Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B236018FF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiJQULn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbiJQULN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:11:13 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D367C74A
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:10:25 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id y10so8075686qvo.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzm+M5ql46bszDpYpsIxOAKsDfJiO6WNCJCvd9/U0/Q=;
        b=cdZlETIVhA37euKh0E3sevOaniHAYMkDTizXxr1/mhO32MUiUFg4826GhPk41Nj4Kw
         V8dVJPBFPCSOMMkVSQ7CMo3cE9I+CuaxmAPRKkf0+XftUN47wbgHit8ReszikP0GfHCl
         KqH82YjHiBdUQZKPIYa4B89xKLqTaj6lvDUkpiiE6BkDbjnGKqlJ7IGuR5s9C+L8ZjM+
         7LSfKHb81sDdDi9hKIgzk7O4XZ+OJPh7i5r2HyS4egxkwDxRcVqAbSiYf7x6ffzNVaGs
         /v2ssl2BYd0S1SEuZrdY4kDuF5fVbPkv5Bc2UBlplBmPUxz+4oseVRMoPUm5kUU0fZno
         VzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzm+M5ql46bszDpYpsIxOAKsDfJiO6WNCJCvd9/U0/Q=;
        b=Q/ely252CtzkAJSZO9zQNsSkWfZLFVuECmHqtg4tp7JlFO+FA0rahmLWhAwlkR3Hgi
         YD8yz43CvMwt8sEM747b+K5AR4qeFJY3JLxXiYHuzwd3Bwu5/aBuDHQNaJpIEUcDDamC
         iBJ1TSba7l0m12O8zNKNKfnokak2lkSfLolarDZTPUDZ5pa2QhCdUvj8Ta6vAiLzMmYT
         vo23zBHLShsjDXE6+g8JYgwkzL3BAiFeucqs2FaSdMtPIKCEzaDHxsj5XoD6OfOm6kD0
         wvLmYW392OYWauRGCuDKRvtyx+q+HJ+JCJxo9ZEmsRiny9DRH/AusftrXcsOS2ItAdfb
         tv/w==
X-Gm-Message-State: ACrzQf0tu7szMXNfembu4Jtuje9FsDTnhaPA2dAUF2Pex8i87JPNoVWe
        oMp1xNmsWSDuSZufju+yGeyUSw==
X-Google-Smtp-Source: AMsMyM45O5yNXGm1rcoajle3WznZSfPM14DUXSr2gRl8vgwluPvfYKOkS6qO0fWITLfvKwRSAs7nqw==
X-Received: by 2002:a05:6214:29e9:b0:4b1:8d19:a2e8 with SMTP id jv9-20020a05621429e900b004b18d19a2e8mr9689423qvb.46.1666037366099;
        Mon, 17 Oct 2022 13:09:26 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:24 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v5 28/34] dt-bindings: pinctrl: qcom,sdx55: fix matching pin config
Date:   Mon, 17 Oct 2022 16:08:09 -0400
Message-Id: <166603728602.4991.9934501805858220351.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-29-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-29-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:29 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.
> 
>   qcom-sdx55-telit-fn980-tlb.dtb: pinctrl@f100000: 'pcie_ep_clkreq_default', 'pcie_ep_perst_default', 'pcie_ep_wake_default' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
> 
> This method also unifies the bindings with other Qualcomm TLMM and LPASS
> pinctrl bindings.
> 
> [...]

Applied, thanks!

[28/34] dt-bindings: pinctrl: qcom,sdx55: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/8cd7d9e14fd861c402ccdf243678439036ef7eeb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
