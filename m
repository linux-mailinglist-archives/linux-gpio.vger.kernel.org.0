Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2584460190E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiJQUMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbiJQULm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:11:42 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5BC26109
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:10:38 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id a18so7427960qko.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zOPF90gyM9WUoM0vIa67OWgTRrG/ozUxdEln13EFmY=;
        b=VZ7NjLPTR4wFxfDJ4hzxzvclWAIz0CZffHS5Rv8NlxG+Zdf2GiMvL+g5neaOUiA1T4
         NABUjojvrTNDpkFuhLildKS/ctrHlLTxFwloqvLEp61TMkeo3XS+gD4lH7RCbnjHg+0i
         rqPIcDLW6g/bVA/dLv1sCLepZ7HZzrWDv1Q7E961DzEY1/8bfYA1lHwjgaBi7Rcaw9hF
         hc64IA3XaAYLlM54Bc8w3uDreXU5ONs1WRne/zCwRwjlEK7Rk7bFxtZ8cA/KVHuCe21F
         KB7TBrn/uK/Ep20s2rUaPnn1Lv5rBwY57PwgkGldzlxau6ifUg4L+NctXC8WkRzMGSAg
         FwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zOPF90gyM9WUoM0vIa67OWgTRrG/ozUxdEln13EFmY=;
        b=5DQstPHZ1mkwCM9bo3Zz6503AKh/gt9cPYMpl3SRZkUPn6gxtp5ny7N+IxzGIPUDYg
         D2goBVMDKgE6MuMc9fx8hjCKwrUclT6M/s2xXQJcl1n/SW6r9PJI0e3GirulRRtY5kEh
         j2q2MiFQ96F7MaVpkji/OS44bykaSUcqIMR1GxzJ2l+3m4YJ92zNBedtOTHe6xxGSeE/
         2MXaZVZdu7j/v7kEwCmgteUO+uYD3FP4sDXd8T1TJGnjGBsE/DV4cFXKXEgAiYPA5G80
         e+z4IW2jupXx4Y+tD3zkRjwoRfASgu374reZyp/+gHTn75yZGUc07TZwzAH3AXnleFa+
         OTgQ==
X-Gm-Message-State: ACrzQf29GVQ0Gt4RtrZnkHlZDjA80T7GA1344CioTcGco/JlS5yU2KHy
        ozKc/63w4TmrPHNuoZek9OeYWw==
X-Google-Smtp-Source: AMsMyM6OIZFWS3QkYyU38tCG1j0jfoUgsk/SodtqGoiCgewWgWBmoYJlKMQYuZfBLo9yiM1TSo0Eiw==
X-Received: by 2002:a37:be02:0:b0:6ed:1b73:a5a5 with SMTP id o2-20020a37be02000000b006ed1b73a5a5mr8746311qkf.214.1666037369797;
        Mon, 17 Oct 2022 13:09:29 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v5 30/34] dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
Date:   Mon, 17 Oct 2022 16:08:11 -0400
Message-Id: <166603728602.4991.18430316152099832160.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-31-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-31-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:31 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.
> 
> 

Applied, thanks!

[30/34] dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
        https://git.kernel.org/krzk/linux-dt/c/4e0434d4788be2cbb44ce1918ac492c1fd6c195b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
