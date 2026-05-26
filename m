Return-Path: <linux-gpio+bounces-37490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIVHMqFIFWqLUAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:15:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2725D1977
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E517301225D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 07:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96643C7E17;
	Tue, 26 May 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2MqKXTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720C36DA02
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779687; cv=none; b=MqApkbSGz5p1XCc7Aehz1Jz0jsXaqrP6rXhwQyiUFZJ3wRDa4Aa3XzYmICKrKPiwTmdNO107S2ztvjQSGiLjV49xu4H9Onv0X8YvteHIt1YpnGj7soR2tQY5bGys0vBV3zCcJffaxIo8u1cLW2wlJNxZZZqgL7kv6+kJ1AjSNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779687; c=relaxed/simple;
	bh=cjmSgMZBQqtrDKgzXep52C68RW11t7FWOD5rw1BSI/M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p8BzEkZkBNBhWu9WZ6xVxYFXunwzUsQ9wJzMa+ZzWkNJUmVXxlQCXgBsrFDtEP5PzQIxUNwuFPiGXdrDO99AkcGmHldGS8lIAmJD80prAY+wbtalzcWFB5cMXtT6dgZSwUFNeRfLS8Ev2JbA/pVkLpWCuxQmakDC+CvZaQlSaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2MqKXTC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso8228450f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779779684; x=1780384484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=;
        b=q2MqKXTC71t9DsOh3SdPTtOUnxCBOFaPJoXN0MqguQ76CbZyFiDcDFlF+sEjxLPuKI
         bjz37aBSeIKrNDboMSETVP/PrImjuw6j6L6TACW27MChbwavpiu/6g5877V3zCDWQkBc
         hEZikSh5iPmA8FmtVsgaWclWkQ86SfaPD7OVzuJesLuLOlVHgbvGwqesWbCrD2v41IeH
         ZZ5Y6s2W26j1DmWKEV58oUgBWSbDwc27iqK+weKZlN+xyopvA5EVO98iNDGse5D7Gnk+
         f+HlrKYNA5MfyBW6RFDeJgtWNB8+qvqsCYslb20wbUiot+BZwfwVqtInShrekJklXtkx
         DL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779684; x=1780384484;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCUC1w8o3SPo/dQIjvTcR6pWtcHK4WC6Ve79t1hbi2E=;
        b=JZLWdSLYGKABfs978361k2aVfHIK76l5d9DUoAYzuqaTUZ28qoPYaOCHgKtajmpimX
         zOPFA7OJ6LKfHqCOYmvIymFnfkwa82ca9feq6CqdlOolObrQz3up+qsgX7WXP1QlcM34
         ma4edlWRdYCMqkLRzbiNTwsg8yVN056xXi4x0oJbJpgpzGFEw67Y6XWbzMEnSD0mWfw9
         VqhCF8zUprSzxbGEuzoefcXnCXUZ2GJ+W0Hou/wHlxbG5JmVaeisWWbMCKjhA7GycV8+
         tr/IZ/K8i4vNp07H5wo++teT+rUfk3Xw06va8i6YgLin0A8Bb7/Q+ZuKIsADs5vsu+YD
         WZOA==
X-Gm-Message-State: AOJu0Yx7pogBkElrTZ6ZHSQrzjy15cjMmI4b0pJFZh9hr9Ca1RfJLWEB
	Mu0jhw+amzFip76JqqVqFEJ4mpMAprebSGDKQEHKuglkdxhEQyBtR1iN7TodO1gvVc8=
X-Gm-Gg: Acq92OEjuBBlj3iR6LAHhgEHbxJM0tHrdo7M0CGTc+cK3qACYaYo3InlBXit3fqVwKK
	HFxVERaH96DEMN50zENSSOATaMK5SxPWlnAGda8pIGwX3Ck7Zoqx7ZN5TLuqcbUbMSBmsZUeoK5
	ncZmz0JVBUi2IsJBjuVtfE2uxZ71GghLrYUBEsIH4Q2LnEd6PuVOc58vmJ6CXPLkaqc+KPbhHS+
	VqmeEuAQ6Ltm5yOimc78BSQk5sW+Xpbn5WGg04dtSe+cz2XHMsQoiJYZhVJhljH6Hi+d93EUs4I
	qDVw2eefmDittsDpUiBY4/T2FIoeH5SFydzIzDPKRFn7x1Sk0Dj6eKMnT1oXK6hvggn1E5cSudU
	mF1opGj+OzSyLww4sciXCX/PCgNG2H+/DmrkBt0Bix2bKyBFjuDGR9VJX8VtkCGzgHlXckgf2Se
	gCuECslz0FQqo5KhKlG4Ib6rMV+y1Vk7+ayQG7IdM7LQuGfkVn5UeIsFDa6YSmc9EkOLizCUP9C
	RABjL4=
X-Received: by 2002:a05:6000:4283:b0:45e:633e:a7cc with SMTP id ffacd0b85a97d-45eb38bade1mr29186012f8f.24.1779779683519;
        Tue, 26 May 2026 00:14:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aba9:2be3:1465:636a? ([2a01:e0a:106d:1080:aba9:2be3:1465:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce01asm34146772f8f.11.2026.05.26.00.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:14:43 -0700 (PDT)
Message-ID: <45081b91-7b49-44f0-998c-af9927deadf0@linaro.org>
Date: Tue, 26 May 2026 09:14:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
To: Jun Yan <jerrysteve1101@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260524154954.385778-1-jerrysteve1101@gmail.com>
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
In-Reply-To: <20260524154954.385778-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37490-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 2E2725D1977
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 17:49, Jun Yan wrote:
> Clean up whitespace misalignment in meson-axg-gpio.h
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>   include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
> index 25bb1fffa97a..a0d42bcd9bd3 100644
> --- a/include/dt-bindings/gpio/meson-axg-gpio.h
> +++ b/include/dt-bindings/gpio/meson-axg-gpio.h
> @@ -23,7 +23,7 @@
>   #define GPIOAO_11	11
>   #define GPIOAO_12	12
>   #define GPIOAO_13	13
> -#define GPIO_TEST_N 14
> +#define GPIO_TEST_N	14
>   
>   /* Second GPIO chip */
>   #define GPIOZ_0		0
> @@ -52,7 +52,7 @@
>   #define BOOT_12		23
>   #define BOOT_13		24
>   #define BOOT_14		25
> -#define GPIOA_0	    26
> +#define GPIOA_0		26
>   #define GPIOA_1		27
>   #define GPIOA_2		28
>   #define GPIOA_3		29

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

