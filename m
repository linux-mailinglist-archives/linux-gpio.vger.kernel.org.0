Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCAA6049D2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 16:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiJSOxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 10:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiJSOw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 10:52:57 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9593684F
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:44 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id l19so11490573qvu.4
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNzGMsb/0lx48BXp/QEckvaR6CYZKES3RrhSGSaI4Co=;
        b=AIwz1xXDWpPcKTTdu6XWHjnkrJmAJFnEKjbz8gg9j4tAVYOtbQQGsf3+9P/Lm9oBlM
         H45gxOKViugcNLd4jG78tNounBWO3E7bResxwreX9XcWV4XeyGnNUpRQWsCE6fGDKoxv
         YxwzIQWCAyj5GMP4CVuMGoKokROHXsqsxEaZPwtVc6oClwUs7mHDgTAlom2hCza80l6y
         Tuzacv6dqGrGcj2pV96O8YP8ektmC0w+zu6PxhGSOri9dCZgBd44x9XCLX9ycHMtSDq/
         AAZ8+dU2OOWGgIt2ATFrclVdM+sib6Yq+e9THIDs+AUwHI2nD5t70iqQWJHJKic157YQ
         cSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNzGMsb/0lx48BXp/QEckvaR6CYZKES3RrhSGSaI4Co=;
        b=W/Rams2TiWR1ek3ZmY5O3E5ikrTKxrdUUlGF1H87GDHmloKA0IxyBMUyzvmNjpBail
         FaJDL1P++M9FWbw0LKz6/atCm8o6jwyGHPN3ZZw2/E9BagP0bsnXQpofIjSE/TnkFb/N
         Tr4RhMZfraNyWPaSxPGRnahwAulqDL5MTICdDFsVautDYSP/RrpB+bZu/38XytoDSpdq
         C+cp0//MvMVdlwOn1XxE0Vf+xDAWuIY87dKtSJQJANu664EofQ9eqFnYM8EfZCOHa73M
         k0NTY5DsgZDApIzkPK9uBuQbnu5PmrN5vjAql6uLLynp6s38iWLwEd4p3+CqA5frranH
         5VYg==
X-Gm-Message-State: ACrzQf0zBKqms8Z/x3VR0eQBJkEme6f8iPn+m0qO58cMS1Rn6OqEzBbv
        RHQYkLJvBLmjJRxqNHXcAxwbNA==
X-Google-Smtp-Source: AMsMyM5Kps7HKy5d5tJdMyGHd9egJkXrGIz14HAMapdmt+LPeYtCHbxU/3sIa4y80F4kuClHwQaKHw==
X-Received: by 2002:a05:6214:c6f:b0:4b2:b0e2:2122 with SMTP id t15-20020a0562140c6f00b004b2b0e22122mr6814411qvj.55.1666190682690;
        Wed, 19 Oct 2022 07:44:42 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006ed61f18651sm5211917qko.16.2022.10.19.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:44:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 3/3] dt-bindings: pinctrl: qcom,msm8996: convert to dtschema
Date:   Wed, 19 Oct 2022 10:44:33 -0400
Message-Id: <166619067067.168589.4905168465539141976.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018155721.47140-3-krzysztof.kozlowski@linaro.org>
References: <20221018155721.47140-1-krzysztof.kozlowski@linaro.org> <20221018155721.47140-3-krzysztof.kozlowski@linaro.org>
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

On Tue, 18 Oct 2022 11:57:21 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8996 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[3/3] dt-bindings: pinctrl: qcom,msm8996: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/93341a821c2acd305fb70e6f9cda15e465d3c6aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
