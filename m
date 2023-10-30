Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520D97DB6CA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Oct 2023 10:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbjJ3Jzo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Oct 2023 05:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbjJ3JzO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Oct 2023 05:55:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A351CD6A
        for <linux-gpio@vger.kernel.org>; Mon, 30 Oct 2023 02:54:08 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507b9408c61so5900101e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Oct 2023 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659647; x=1699264447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Kv5GaHiGoPqgcAUfLFcNkfO5czZau50rZ3piG5o3ec=;
        b=v2aMmw/uNTe9uUygobQSQJZ2mdXTj+zGhMGeEKmIXN4+efeNxNWVNPQXEgGc7idT/X
         +Au9FC0UJtPEvEHJvS1aaTXxhv7Qa1+OpywaOqEicTJPVgiMTr21FCyFLZa5mJqeV+LE
         lxlAlt3t8DnRk/DmhVE6PhzzNGuwBN6HY+CtxWj99JbbV0yPHLc1yUY7EWfJPnEUMr1v
         JnU3w55ySVen3SPXiRZzH5hZlXFwTyXaMbXxMH3YVNVZB7MIWorduzyADcHmSVWxeKW2
         5Aop69l0xBkNA5Pq1CLEQF7ykdF8qC1rZvDiHX1hRHJwuaXsp9I69JGYUM/TRa+rrZpt
         WAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659647; x=1699264447;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Kv5GaHiGoPqgcAUfLFcNkfO5czZau50rZ3piG5o3ec=;
        b=TI8pLIpp8y6WzGPqkcg1dA+HYEkKOZr+SJuEisMCd0zsZsGfj+xB2Isg8uodBrlMkI
         qFOGIhe2rM43uUNPo6Ph2e+GV1Q4VUQjOwcLEbSrxNKmON0uXeYh48iyq8cCPXJFfrF+
         SUBNDOzuA5IpHE44l2aayeMhFZA4aulf8EdcKDQLr5fdLPtlXxc0DAUpiA+lQxbd6Zl6
         uBApQhzyHeHEm5K630thEQ9kYnTCPOyCY8KYGpwKC7EcZIt/am9/dbh1Ar9Q++8a+7+B
         Kt7ZTgS0647e/zeTM4WOkR5RReSxHRt0cafca6XaMvVThP/a7iT21um6YTez5Tw4YgVB
         /tcQ==
X-Gm-Message-State: AOJu0YwNUsNE6nK9l5mukEdHTGmW7T4QQ0Do1etHAIR73z9CCNempbNG
        2O6sUR24LIKkFEHTtoX0CSynuw==
X-Google-Smtp-Source: AGHT+IFRiuOaMoccbCh8N5l49OFoBYnZ8TndEo9XuPuZ++kqxCcATW21U4C3aA9b9hqPf8f0McHszw==
X-Received: by 2002:a19:f508:0:b0:507:9a64:adf0 with SMTP id j8-20020a19f508000000b005079a64adf0mr5887287lfb.10.1698659646757;
        Mon, 30 Oct 2023 02:54:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a05f:dffd:3e08:6b03? ([2a01:e0a:982:cbb0:a05f:dffd:3e08:6b03])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c314a00b003fe1fe56202sm8785199wmo.33.2023.10.30.02.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 02:54:06 -0700 (PDT)
Message-ID: <96a09732-8923-4af6-b063-0944100c24c7@linaro.org>
Date:   Mon, 30 Oct 2023 10:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/4] fixup! pinctrl: qcom: handle intr_target_reg
 wakeup_present/enable bits
Content-Language: en-US, fr
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231030-topic-sm8650-upstream-tlmm-v2-0-9d4d4386452d@linaro.org>
 <20231030-topic-sm8650-upstream-tlmm-v2-4-9d4d4386452d@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231030-topic-sm8650-upstream-tlmm-v2-4-9d4d4386452d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30/10/2023 10:50, Neil Armstrong wrote:
> ---
>   drivers/pinctrl/qcom/pinctrl-msm.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Please ignore this patch, I forgot to sqash it....

Neil

> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 2489a9ac8455..207b41018580 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1197,6 +1197,7 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>   	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>   	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
> +	unsigned long flags;
>   	int ret;
>   
>   	if (!try_module_get(gc->owner))
> @@ -1233,11 +1234,15 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>   	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
>   		u32 intr_cfg;
>   
> +		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
>   		intr_cfg = msm_readl_intr_cfg(pctrl, g);
>   		if (intr_cfg & BIT(g->intr_wakeup_present_bit)) {
>   			intr_cfg |= BIT(g->intr_wakeup_enable_bit);
>   			msm_writel_intr_cfg(intr_cfg, pctrl, g);
>   		}
> +
> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   	}
>   
>   	return 0;
> @@ -1251,16 +1256,21 @@ static void msm_gpio_irq_relres(struct irq_data *d)
>   	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>   	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
> +	unsigned long flags;
>   
>   	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
>   	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
>   		u32 intr_cfg;
>   
> +		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
>   		intr_cfg = msm_readl_intr_cfg(pctrl, g);
>   		if (intr_cfg & BIT(g->intr_wakeup_present_bit)) {
>   			intr_cfg &= ~BIT(g->intr_wakeup_enable_bit);
>   			msm_writel_intr_cfg(intr_cfg, pctrl, g);
>   		}
> +
> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   	}
>   
>   	gpiochip_unlock_as_irq(gc, d->hwirq);
> 

