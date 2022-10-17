Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EDD601C8B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 00:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiJQWm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 18:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiJQWmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 18:42:23 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736667C30B
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 15:42:20 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id g11so8710360qts.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK1pyh7kUvkDRwV0vj8ejMcEDOQab0zTlOv6+bJOCW0=;
        b=q7/qR629zQuAi8jRKTHoyT4Crtw3fPi7+jOF4kmT+aXmj92IWXhUS3cRMYMWMUnnse
         LZiBMKxoZFms725z/NJiGxpEYBx7TwUfa08yuDhm4q3HAxrqbaqDhX+Sbp6QNqMHjFxg
         pIgKm37d5j6cvJ00fzBW/uHQDaOtROIYmO4Wm+bLnceS8U51kR/myfYabbWPZKyDIdoj
         JdRcoo3JvGQcmu0+SQS6/CSfrJ+e4wRXQPTPbm2oAQlAsY4p+6UFZZMM2wnphHif3Lk1
         qnW1tlfKIGz8p9WjED+BEx2e3yd5gdCt68ncLHh0qXmgBaVXPejC/lSAHPcZAfCNEgj0
         FNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK1pyh7kUvkDRwV0vj8ejMcEDOQab0zTlOv6+bJOCW0=;
        b=v8KWhQ7v9+vl+kVb4rShTcMHNPcYWg/QvCesGeCxHUfq3hm5zQzfk6r43SJ8EcuK3C
         NVD2SiVQZDCYXzTV5A/gOP/+1RXPpGiQ6o64XF8KW/tdjC1kkeKqniy975IJvbPrM6kl
         HGzuEpULOo1FStZThgSNgP9SZOkLr8Lxctf1NfvI+rYJuftwx33WSLETh0wgQjPhv9QQ
         8v4+Z1x1CguYp4nc5Rb+hotUfKvZt/WvTlR5Vukgke5gEgGTGZlqXzc5gChOoWC5yPzb
         TBYxolBVyrkklV8cMhlHsvC8gJJSsE6Ndz4YWdHPpZ2mYOX0Jt54Pzu+8r/nxOl60m7j
         VX5A==
X-Gm-Message-State: ACrzQf1YCOkHqt7wuemOsFdJltf2vlAF80WQL4E6T+xpitvLhQo8YqIL
        vKiXFoU1+japLoxtFVUt11V8Rg==
X-Google-Smtp-Source: AMsMyM7LOqEy+cLD21GH7xp4KdxrIvEJbneGyKwqQ+2okxi8pwb3Fb4lMWbB600Oh+TNPhsBezo04Q==
X-Received: by 2002:a05:622a:653:b0:39c:289c:6dec with SMTP id a19-20020a05622a065300b0039c289c6decmr10818108qtb.165.1666046539534;
        Mon, 17 Oct 2022 15:42:19 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id l3-20020a37f903000000b006ee2953fac4sm746462qkj.136.2022.10.17.15.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 15:42:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH 2/2] dt-bindings: pinctrl: qcom,sdm845: convert to dtschema
Date:   Mon, 17 Oct 2022 18:42:16 -0400
Message-Id: <166604653346.43400.1553085215819756291.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930200529.331223-3-krzysztof.kozlowski@linaro.org>
References: <20220930200529.331223-1-krzysztof.kozlowski@linaro.org> <20220930200529.331223-3-krzysztof.kozlowski@linaro.org>
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

On Fri, 30 Sep 2022 22:05:29 +0200, Krzysztof Kozlowski wrote:
> Convert Qualcomm SDM845 pin controller bindings to DT schema.  Keep
> the parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[2/2] dt-bindings: pinctrl: qcom,sdm845: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/dba79c34605d60cb02c2951c701ea0bc16937153

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
