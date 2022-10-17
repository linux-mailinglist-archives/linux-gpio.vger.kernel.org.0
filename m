Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BABE6018E9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiJQUKp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiJQUKL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:10:11 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1EF1E739
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:37 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id g11so8472111qts.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpjUhA9e71nFScP5jnuC/M8K2wTxtDejv6Ef0p2mJqc=;
        b=Ggao3RnjPupIAPGTDbvFhKB54F0ID36Z5gSefoBrqWYra4ncRJB81487NUGhfj4CUB
         H8AQRX8SvbaHRjNPrsDemooJ5+Tm6VjUWlXmZKE9SOmORpToAuRK50TvMGQIeLBwl9eP
         MrhvnCp4WPB4EXGco8gcyx2pEBRKtQaj2orKDgyqvwLbDu0moFszto9+xiPUaglVmRYF
         avbv2uHiD/CcHOIuq2HQhAamUydXcDWP3wphJ020uAzzUbtWSgDLwmylj1k0LaGdDTJh
         /zGA614gUKN0VFd9ifeD/Z4h0NcZdT+7VGbxHy4jgkfMgpgKTHHc9sZ3ChyhWGoLDpk3
         zruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpjUhA9e71nFScP5jnuC/M8K2wTxtDejv6Ef0p2mJqc=;
        b=W+/zwoLQfMY42+COCeIQAFiyLV7vpSLZI9w66tk+LHUF0sloswBIRofRNUwCk3d28x
         9V2nuvOt+T21TFVqi1jMtnHKehOH6JWrsO8LOHBCJEjoTbeIGNdsvevZzY2MyQC/ZTw7
         kjzDAVRbAyTsWjeCiVl0pKA7AgpqMvvUho2WNidB9kqZ0eIAP+Laoxt4XEtRwZQKSflK
         mVGO0ryB7j0XXFmuCCDhOL9KITugsRm1d52YEd7jMcNjdAtbjv95zhtmFOwzBO8IHfd0
         sb+R+yggPoK+wsvmyvABvFVg5J+rgoZJ8TBLLPlB3TjerIC/6sBof33ttafU+DeTtZG1
         hOHQ==
X-Gm-Message-State: ACrzQf1eVV4HxhFA/Uhx/LNbGHqtmXLgNz8g28u90d0USbzbDD9JPfCZ
        tW3kGE2ducflXdMR7NBfnYHj/A==
X-Google-Smtp-Source: AMsMyM6joWcYRR2aCyJLPrQeyDAdcF8DXM63OCXtucB4/f4wYIv/u0DCugj6VhSDWIsVuxJjH7JHAw==
X-Received: by 2002:a05:622a:152:b0:39c:b772:290 with SMTP id v18-20020a05622a015200b0039cb7720290mr10349837qtw.35.1666037376884;
        Mon, 17 Oct 2022 13:09:36 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v5 33/34] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
Date:   Mon, 17 Oct 2022 16:08:14 -0400
Message-Id: <166603728603.4991.4462934157140687017.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-34-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-34-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:34 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> 

Applied, thanks!

[33/34] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/bb65ee4a3c1dc17359d86147288c9e0e65491304

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
