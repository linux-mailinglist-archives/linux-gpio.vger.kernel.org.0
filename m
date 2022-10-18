Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBC060302E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 17:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbiJRPvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 11:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiJRPvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 11:51:00 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB19A2338C
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:49:38 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id j21so8882230qkk.9
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9tEAtSjkgBDWj8QPVi6yQZrx/H6+hRcPlKGGXTwClQ=;
        b=o7t+w4inujl5ukRGnSAhWqKaQdk8vJzXthn3RAYBlVnNLCzz0YBlXHMlz8LHLjmSH8
         AXKaZbzQrDk5/Skf4SxroryEXoASB8wNcgKhVm3T8jpG6ym/4QJLk27O4GTr721Ps2Qh
         cBKY99VLALmfTtgnxB4/CecoBreXi8cFLcyfNnCOBDRfFg0Fe8+TPEmC5b9aD0XNta+E
         fHsp5HSCp7BdOAB3UShi+/UYyjEo22pWyDsPNWzbljqOTCg919ADfYL6iLoMS6NiuNvs
         lm1jgBYB+cbanPRJrDCteIDyBVq0b85hw+cMAo9aI824ATJ9k33RJtdjfv1o8X/mzIHV
         tLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9tEAtSjkgBDWj8QPVi6yQZrx/H6+hRcPlKGGXTwClQ=;
        b=mRJm5b8tQo1vuFmsdvtmCnpTznH3U0wjc6VaXAmVLX3G8KN9qWURYslQX8PWy+QRix
         Oa1er+mWFTQRRKLrJ938qdeJ9GnGMdR1yPksUxjAaFbCt2fNMOqqtyeNHzsJl7gOJXvc
         oP6orkkEAff4tVj7hQjVNlszLlcKkrfc/uKNF+P8W86Bey7a6zkqODH8XQJv4OIPVPEW
         0stcGG+iOJmtNjjkPeJdNG45O4mZNMx6TzaFLCtumG+HHbDz8GVdIbkHcwV4amIukcbg
         ax+aJZGzhNb8FTVlhZFschqN6ab3bfvf21dxBqZvIJTxIgWMkWpTWHHgPUvQO/CozRtn
         bL7A==
X-Gm-Message-State: ACrzQf0IUWKsTIUnJUgqFH7MEVrfdtXnTkjsGwlZbkVKWIcX/yomrZMy
        /YI6T/ss4Nsh4ey8n172fjijnQ==
X-Google-Smtp-Source: AMsMyM4PbPL3AfSazbPioxozgRI55jAvxjW34k7FB8cj0EHe35KkQwFjllqavA5OE/bwsWsNgZwmkw==
X-Received: by 2002:a05:620a:454c:b0:6ee:ac69:43 with SMTP id u12-20020a05620a454c00b006eeac690043mr2304592qkp.328.1666108177780;
        Tue, 18 Oct 2022 08:49:37 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id c25-20020ac86619000000b0039543f89109sm2029202qtp.96.2022.10.18.08.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:49:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 17/17] dt-bindings: pinctrl: qcom,sc7280: use common TLMM pin schema
Date:   Tue, 18 Oct 2022 11:49:09 -0400
Message-Id: <166610814672.37912.9775772605676284248.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-18-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org> <20221016172212.49105-18-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:22:12 -0400, Krzysztof Kozlowski wrote:
> The common Qualcomm TLMM pin controller schema for pin mux and config
> already brings requirement of function for gpio pins and the definition
> of drive-strength.
> 
> 

Applied, thanks!

[17/17] dt-bindings: pinctrl: qcom,sc7280: use common TLMM pin schema
        https://git.kernel.org/krzk/linux-dt/c/b4997c1cb7d4c3900aab6fe5dad521f59369f93d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
