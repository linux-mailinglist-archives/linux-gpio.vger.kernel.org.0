Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED2662BBAE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 12:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiKPL0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 06:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239185AbiKPLZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 06:25:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36126A45B
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:16:31 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id l12so28956592lfp.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qtt5iQyuun+aYchyK4oCgJSc0xTXNRkk++OYQe9BFFA=;
        b=zrp0um+zg+Xx8L+hZRBscnd04oU9Au5aRn7hZnIuDOV24paVdL2LAtdz+ZACpuLOkQ
         Ihwo/6kZi6pta1zGZzTShOFYiQRpP31WZMLP9j8Byzn3laQktX+sanP2Ov//QLCljcpt
         +znqVGwaE8kkr8x981kwE/LjLcLYX2GzF1yWt5dOrP5jQPyXvPqeHqacDKKOEeljFrbG
         lpdJy/PRVfzG7ibcxrOaCghln8hZhwu84WbqzdgPOqPxmXXpHnjR1ShIf2Jf/cre0hlF
         9DcWTMeK1PDHnDjmDQorjMs/e/HzVgMMP0PdMtrDA9tEZRiZhJxqfsQJccdm78zTrKZX
         IRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtt5iQyuun+aYchyK4oCgJSc0xTXNRkk++OYQe9BFFA=;
        b=rFxMNvCA7H4fq+GM+Zl2mIiD+Xyb3p+s0H0eUpqdVC7iTxzNTa29Bz/74mybFXCsh+
         eRzojEMjUp9xF+Ta/Qw6ewaClYSK3aVf9JFetc11G7rHcLJ/h2XIa0Xkvqd21OqwWsXx
         zOApVj0OxilKKlYrPnkiNSCt+vepsKBI7i+JUiUnV3swOatMCkoDRT5ESpKECLqek9mt
         yuYaqY4Y2ecqzQfY3TNonhmlVJqHVh1puSpdmBdEL2zofF4neR2s6MRoYARMMCVOSoe+
         kyBYHR9nV+WPIQZSBGqp1g4Ok2E58xU6/6U0yfWhBJqs3xLdBKfstebvLYmj0cKLD1hl
         0k7w==
X-Gm-Message-State: ANoB5pnDHF2pyeubFNVEM6I/yKyJbJzD5BOIRRTq/tT8K7dLIhuAqNRM
        Mo1Ydag3BMaLw568t+DfdU8z6A==
X-Google-Smtp-Source: AA0mqf7FtWJOaUGu171nqAPAG+zdf7rfwaOniaHNOL5wur4Byphw9QHkphNSurYRtpLnlBxNoq/1NA==
X-Received: by 2002:ac2:4e13:0:b0:4b3:ec7a:6752 with SMTP id e19-20020ac24e13000000b004b3ec7a6752mr7777961lfr.79.1668597389601;
        Wed, 16 Nov 2022 03:16:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a3-20020a05651c030300b0026fd3d906d7sm2942390ljp.133.2022.11.16.03.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:16:29 -0800 (PST)
Message-ID: <f3338d53-a0bf-9fc4-fcee-959e2b9a7e22@linaro.org>
Date:   Wed, 16 Nov 2022 12:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/7] dt-bindings: mfd: qcom,spmi-pmic: document pmr735d
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-3-6338a2b4b241@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-3-6338a2b4b241@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/11/2022 11:11, Neil Armstrong wrote:
> Document compatible for the pmr735d SPMI PMIC.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

I think this should be squashed.

Best regards,
Krzysztof

