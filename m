Return-Path: <linux-gpio+bounces-37076-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHSzD5cmC2pAEAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37076-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:47:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9EC56F321
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AAB73067FB9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237EB3F44C6;
	Mon, 18 May 2026 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dy5YEmjt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BF3F6C57
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114729; cv=none; b=eMiWnmqzLdj9osA0s3AMCKlv40LCnuLw96G7z+PYqyG2V39gq/Hsp14NTBCNdLTn+oqxuo2bnjloKvT24q+0ViUdg6BNc1NWFJfICTP0ONv+tdUShxrvF7RpooOWVjxIOt4VJcAxdJyD3yBJ3x+k/PoTjMGMVqVAD9OIVJwzVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114729; c=relaxed/simple;
	bh=+BjutuUFC8eAe+s0maNa3+hGXbz20Pc39j0Em/qUI3w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tfMyy+ZnqO9MosqxTe0IH2JOaWTLL2Q2vqdGA5DbzhndOnO5JO+NCnlRU9XpcXqYXIFcFq3PBXO7BHJnUxlUddZpnOyENBzdLaXp7Khquuow9l0cFMsIH4mj8wfREEUoQhSM4c2RtQ6i75ESQNerCRU/+7phHYIrtnFVBCMAUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dy5YEmjt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so13556015e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779114722; x=1779719522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=;
        b=dy5YEmjt1PtPB0v1ZCX1KxYR8gebVypLzy2EZMBVdwKH0vebTgDw59TmlfQBQotJuQ
         Dy+zJV6VyRUQ3IqVs41j1BJsh+OMb1QMLuJX7BFH4dI6LV6OMibt/fsxKmmosj8BY6t1
         iK7hXBS13ppfPSqCMi1RHGLzpdufxEzO+uielZ3mglKWbvDQ+dxk8gGN/oP3jGsUmHCO
         s104F3wqIr7XOpnnrlHPnQ1JKFlT8bD0gy0pe8jJURSgBI8QmINnkxAoWfgFNU22L2in
         K4xNCwYOrK1MF1BqzlWnYqRWgiHYma0NM9f15b5vU/9VeZaKRXI+Gq85+8CjNQ6k/UbK
         lkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114722; x=1779719522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=;
        b=ICtVTHZIJLA8doBcyPrGurGKdGmpzcyTkRnET3VRgNvsNAscYqB6Pj/6f0lEQRbquC
         QnK1NxJaFweQVrayFgLWtsyUDck8q77WmbhjqOiWbn0SClAaeVwKC0ss5gRHCymEP6Fu
         PJNufeOPt/aN2OA+i9llxjTi7FWT3VlEGkoaaoZuTGxbcGOOQC+G+QveDpkpNaMd4J2Z
         knQbiGpVYTukT5m0t1ifPGAI4h6t4QZZQwODMGB98XN7G5MyiJvtjrKnS1Lqxs8+5DLR
         q7Pe1BvKBUd5wxkiy+qPd/o9fFLcdKQbiMiSv0c5Zqg6bAu34gaOz/aGml2jzy4vZ/D2
         nnaA==
X-Forwarded-Encrypted: i=1; AFNElJ/YIEsOKWdFJzFk4J9TqL+DqsfIStpZ3U9d2NtjjePpqhqmSKBhvpknT4/CWnlb8ADPGWjTQUqrE5GF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuj9rfNa8W9mNhCcRoY/lJK2vtUpYyCum5O7URyrA+c+oI6w+w
	w60tqc8eQJ5TIXdqDpirUM+0hyq8t74HA5OJ/E28nVwTa3s30gDXSPdQHfPidNoXHFU=
X-Gm-Gg: Acq92OFgt9l19e+pHvCg5T1C4YnvWoPGVfwifoQR8Q71nFnFLKmt+z7q8VO8f/U3tf/
	gXX9EDcpoGcdV6WVQ8MH5OdaAWiucM48maidr6sAwWOTRVd0HQtgMPSaPmWr4Bz/1+540h24ZBu
	QlfKvBS19Y5vwSM7SwHC9yvwx4IJsFxzkayEVbN4Q6ewJH7c2PZpZgkQHBZWIq1gBBiyfhwlhdQ
	gvOrahG97dZNqfs36askCWHA4TyML8J423acORq6nAj39ZOl+tlv9s+4Qw+Kfq576h7CoBrNnsu
	E8FiKD2gdXFvcQJjZ2BUsLBHWGi6IwZXXELM+sEgasl2AbCn9OFHKl+ldPKLV+L63+2YzcSyzEN
	Py67iH1Y1qhiLcrL/avN+JKhA3VgpF7Z2v4nOTWfQ9KgZYiMg9U7ARuaoagOQRNkoduJ1nBOaIO
	qYAm30VkAcOF7TG4kYXEv09bfHlqG7YpVUi3e2yZ7PHsU4pPHrCT8nRRoT1JyKRhTYuVFh7YbPn
	XAOSkY=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr117236255e9.7.1779114721755;
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm265809055e9.0.2026.05.18.07.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Message-ID: <72b341e6-5ada-48e9-a9c1-a442810b15da@linaro.org>
Date: Mon, 18 May 2026 16:32:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com, Linus Walleij <linusw@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amlogic.com:email,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
	TAGGED_FROM(0.00)[bounces-37076-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amlogic.com,kernel.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: CC9EC56F321
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 10:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> When the system transitions from bootloader to kernel, the GPIO is
> expected to keep driving high.
> 
> However, the Linux kernel first configures the pin direction and then
> sets the output value. This may cause a brief low-level glitch on the
> GPIO line, which can be problematic for regulator control.
> 
> By configuring the output value before switching the pin direction to
> output, the glitch can be avoided.
> 
> This commit fixes the issue by swapping the configuration order.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> fix one issue when set gpio line high.
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index 35d27626a336..1bd58fbbd26a 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -548,11 +548,11 @@ static int aml_pinconf_set_output_drive(struct aml_pinctrl *info,
>   {
>   	int ret;
>   
> -	ret = aml_pinconf_set_output(info, pin, true);
> +	ret = aml_pinconf_set_drive(info, pin, high);
>   	if (ret)
>   		return ret;
>   
> -	return aml_pinconf_set_drive(info, pin, high);
> +	return aml_pinconf_set_output(info, pin, true);
>   }
>   
>   static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
> @@ -921,15 +921,14 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>   	unsigned int bit, reg;
>   	int ret;
>   
> -	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
> -	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
> +	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> +	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> +				 value ? BIT(bit) : 0);
>   	if (ret < 0)
>   		return ret;
>   
> -	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> -
> -	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> -				  value ? BIT(bit) : 0);
> +	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
> +	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
>   }
>   
>   static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> 
> ---
> base-commit: 73d4991a6949eedb51e442d4e81415017d85975b
> change-id: 20260518-fix-set-value-glitch-f43cd366c295
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

