Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648B86FE01E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 16:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237280AbjEJO1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 10:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237375AbjEJO06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 10:26:58 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349CADC55
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:26:39 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bceaf07b8so13555489a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683728795; x=1686320795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIQPhYtqBosQVm2m9V/olCqkEptW6QZ61h/6KfT0E4k=;
        b=FHQ3FpJPwOTUgYBnspviACSV7j5Qj4QMDvrXoB9NFtLLxIoyqracPXEhrsSUsP4D0E
         4aKktP8YVVG5JhxiCCfdVrQaShEqAcyXRQ9RcoVOc3poxEDFKSg+h+9xHlWu6VIRy3U0
         cM/H/4NdAFELm8sAggm9C3c8ucfzXdqTKXXtpSTwjJRBu5z++GIzO6q7VcJLOkVWOQue
         MYfuMBHwBoZ5kdsCTV3aWyEjqKbkCU/pqgMzU5myPufPVF4123aXsm+imIbMp55CYMgz
         F7CeZX2KJVZl1fs0OeauaTs1l/Emg8RznE+gsrwZoMy1+1gVx9bLi3SWjzmdaQpVlZsU
         J7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728795; x=1686320795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIQPhYtqBosQVm2m9V/olCqkEptW6QZ61h/6KfT0E4k=;
        b=htqhLvt2M3GmzvQLA8DAVOCryTAti1oXLjgvgxd6NW6n5Rwb91/wq8tzNDBlOdXaNm
         cQZiVlG5kc/fv31VZqczqmiuMPDqzlBN6iwkQvSiENZI+g52UK9FykpaYmTX3YYEgHLI
         6gdDMZPMP7tL7jGJbXIS5JgKtjUYpi/0o5dnQYqES315w46fS4d8TSP3TJumqsuN8PM3
         ZBbJ7sL7febgMpHTFx4TCh2qAoaXgJNXEDp+Fb+CJg68U12C2oxYj4mP9eAb9iux7gbs
         57IvIW3xzFYqKVl0Wi96cSwCuXAXmYkAQDOJ3IbBYj7PHbECgT3K1wR29vSEGg87ueZl
         4JDQ==
X-Gm-Message-State: AC+VfDwtERT8nUkYnaJsCdPP+FrccEED5g6iCX7zR8nGSjAYut+wCofV
        2KqxIDc4V9Ga1sMEzZFqocygfQ==
X-Google-Smtp-Source: ACHHUZ4kFwEQKZh206/3VwiwKyEUVQRybitZ/IwLHqaBtdLRuItDunzkv8CU95Is7HHu9KPxG20ujw==
X-Received: by 2002:aa7:c0d7:0:b0:50b:d53d:7ceb with SMTP id j23-20020aa7c0d7000000b0050bd53d7cebmr12915261edp.40.1683728795357;
        Wed, 10 May 2023 07:26:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id ay20-20020a056402203400b00502689a06b2sm1911779edb.91.2023.05.10.07.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:26:34 -0700 (PDT)
Message-ID: <51a332f3-10ec-4fac-971b-4dfd16d018eb@linaro.org>
Date:   Wed, 10 May 2023 16:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 3/8] dt-bindings: pinctrl: qcom: Add support for
 ipq5018
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230510134121.1232286-1-quic_srichara@quicinc.com>
 <20230510134121.1232286-4-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510134121.1232286-4-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023 15:41, Sricharan Ramabadhran wrote:
> Add device tree binding Documentation details for ipq5018
> pinctrl driver.
> 
> Co-developed-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [v4] Fixed all comments from Krzysztof Kozlowski


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

