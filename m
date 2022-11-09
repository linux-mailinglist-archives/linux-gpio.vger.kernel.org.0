Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F636225D4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiKIIwb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiKIIwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:52:31 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16151CFF8
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:52:29 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j16so24611573lfe.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcjDd/lm00iOIMjBe66K3M3s2N/FuI+pQLTgS77Ikwo=;
        b=Fp/t1F2CriHRD32+99jMYT6ghjTow1oACbcMHG87PwiFJBKV5qgwYgUVldt/x8FPNK
         +X+fEi8ZQwcJBhy21Ol24Hlcr4ATxEQTYpfHmjMih/XGMLzODtH9JD1KQ6k1/KiX2C8w
         haJiDyzYPojTHBsvuP1hLO0xni1Dy+bMkK/ULunGCarapm4P3yqXhSFrVs2R/gohDz7p
         4aIKOkEGm/nH36OSklj+H2D5UN++YDxhFOofIyoHIl6H2Hj8EyXJcW4CzKgYHTCYIW56
         DT83kT1cV/XEE9awTLOEKS9GVdkNnZ69htTFpDwNAFsCsvZYlW6JWan98l3SH8pdM92w
         Ud8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcjDd/lm00iOIMjBe66K3M3s2N/FuI+pQLTgS77Ikwo=;
        b=0RBCN1fBrNnaX2/QDjWPpjS4Dm99PzHfenpitr/x7HzG8pq4ZntbsugrKuch7AMle5
         f6JZSlk4JKnQqCHt4D14mabyD5a9AtdGIFFAEyWFxG8XnvcFhJoimACPQ+0UEx23Ib7l
         6hW1EwTXMBfh8OnkY/oML2zLTLLIrVDfYXpK/chyjRuh32sTuHBUwXkrKL+MFKMfWh8k
         1BKWtQAJ7ecMfpYJtDwV+eKt+Y6aRptKvWW5gj2ODWZenLMn95hTA7Q6jtsIIkvKOZwH
         idYduEQv0m4Gtut8CIkyd0I4PD7wJHPA6wxevNLGIxWfcOaiyLOXM9E/xkaM9lGxvOF9
         aaFw==
X-Gm-Message-State: ACrzQf0nUKWLyBHBFa55SpzyQdp+jvX5nYB2j0OpBoH91oc1zTt9pvfC
        66fFmRNUjjsYZXypNuUCqXRhtQ==
X-Google-Smtp-Source: AMsMyM57FxEZQJkbfvchH8DemKEgrGl5Qg/jMKh3/vlWcf4kFo6Dvds0lHpsv8FnAzX7jsJcpMFNjQ==
X-Received: by 2002:a19:6749:0:b0:4b0:8869:be2e with SMTP id e9-20020a196749000000b004b08869be2emr20495512lfj.632.1667983948195;
        Wed, 09 Nov 2022 00:52:28 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id k7-20020ac257c7000000b0048b0696d0b1sm2132164lfo.90.2022.11.09.00.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:52:27 -0800 (PST)
Message-ID: <81537449-d6e5-7677-dc3b-d4a34b5900fc@linaro.org>
Date:   Wed, 9 Nov 2022 09:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/7] arm64: dts: ti: k3-j7200-common-proc-board: Add
 TPS6594x PMIC node
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-6-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-6-mranostay@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2022 07:55, Matt Ranostay wrote:
> From: Keerthy <j-keerthy@ti.com>
> 
> Add TPS6594x PMIC, GPIO, and RTC definitions for J7200 common processor
> board device tree.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  .../boot/dts/ti/k3-j7200-common-proc-board.dts  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> index 6240856e4863..9514751739fe 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> @@ -333,3 +333,20 @@ &pcie1_ep {
>  	num-lanes = <2>;
>  	status = "disabled";
>  };
> +
> +&wkup_i2c0 {
> +	status = "okay";
> +	tps6594x: tps6594x@48 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

