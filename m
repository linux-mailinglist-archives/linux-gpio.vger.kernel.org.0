Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33CA879B7B0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241791AbjIKU5V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236647AbjIKLJA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 07:09:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893DFE40
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:08:54 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso69655881fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430532; x=1695035332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=;
        b=wiqYEoqFcRjvUJ+brPwmPIQsX601vW9w8Tsnu1Wq2ODfoOBinAdHwM3udjpT3NfpEK
         zLbJBfRuKP+MLBUMAZiCe99wJxw+X2fQ+VR5yT1EBUSGY8AabfTWSoysZYMpfXQyc9Du
         JrVYOLgEK9BfgDRt7NmU0QIVpWCeIAPrR7CgOhNasQf94iOBsDOvQNXcXZeoo8hdosBD
         GeXkBMRu2nGTISH60Aytf/E/4KtaK8E3go5IWxtzr4bUnt5hao6xA8gkHo0WPp3c5F1H
         Lm+XJ1OnEGwCw4FIdj0HoZtu9/RtexxM4UGAmSMmV730x5eC3PaZXJVp5MklhADw4O3o
         r/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430532; x=1695035332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=;
        b=WZlJXa6HtWPBnnMTqCctHoNjclz811KL0xXrv2KH/Notlzz/R8XaDnn23pFjhH70V8
         Sug4tU2/xCMbnaKjh8dY/mTT8bcKw5CN4iLGw063KANlrdwxVAhOzXtW6rcnLJl3M2LH
         nAZIdA+Z0YhKDtmAtO0In3pBjSrankcYkhlUn7XImSEummeykqYi63SmlccPP9pIDX55
         1iZd5vTvVT6bjlDsJXhjQyvohstvwnA1FxQiyy2q1/0y6lwvPL9y0RcPOn2rdCzhnI7U
         v2k0Zbzz4beG+1z6fkIKkxEi7QP0rrTwPYNFjB32N4843ounSdu1U360lP+APcW+Btx4
         FujA==
X-Gm-Message-State: AOJu0YyEYazoqKnpjZkDnRQZbzaGk1yKJTdYvg/fq7m5ferYamk+g+at
        ThJHa8wZEpHvGEIo0gka4U2Y7g==
X-Google-Smtp-Source: AGHT+IFhJr6aCH0nOA8CkPBUhMy540nMaAY+Mvm7js3Wpv0+d0W8u8lZbEJt3lbAgLcQPiDqKMNL3g==
X-Received: by 2002:a05:651c:1994:b0:2bf:789e:b5dd with SMTP id bx20-20020a05651c199400b002bf789eb5ddmr5800990ljb.53.1694430532675;
        Mon, 11 Sep 2023 04:08:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id si28-20020a170906cedc00b009786c8249d6sm5244877ejb.175.2023.09.11.04.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:08:52 -0700 (PDT)
Message-ID: <75466db4-3d19-33f6-b2de-db714186a96b@linaro.org>
Date:   Mon, 11 Sep 2023 13:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 07/17] soc: qcom: minidump: Add pending region
 registration
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-8-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-8-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/09/2023 22:16, Mukesh Ojha wrote:
>  static int qcom_apss_minidump_probe(struct platform_device *pdev)
>  {
>  	struct minidump_global_toc *mdgtoc;
> @@ -571,7 +688,10 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	mutex_lock(&md_plist.plock);
>  	platform_set_drvdata(pdev, md);

Why this is locked?

> +	qcom_apss_register_pending_regions(md);

Why this one is locked? It seems ordering of your operations is not
correct if you need to lock the providers probe().

> +	mutex_unlock(&md_plist.plock);


Best regards,
Krzysztof

