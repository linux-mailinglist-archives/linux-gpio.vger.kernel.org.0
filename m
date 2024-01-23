Return-Path: <linux-gpio+bounces-2440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 063AD83893D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 09:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 758C81F29328
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 08:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C624A58ABB;
	Tue, 23 Jan 2024 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGl7MfO+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A8858238
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705999072; cv=none; b=Ogr16R6thy+LG2WCcVQ64LWwLSxtSF4QDEQ/DmWEee9myIvOKmCdwAJC+c8cagl1bX7fIlp8bBLcBByGbuwRAbJSYIASS25BPBLCbpT+BVdMZf1tBg1X01qliJSYgY0KljmkyjFYTgsLLglPpT0DebsRazpeN0ZON5L83bYjP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705999072; c=relaxed/simple;
	bh=11tDvkn2462PH4jJLODQKJ12o4xYt9hI/uEwDA/uaYQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=sl1RUx0C27fg0TOLsR8ESRmLLzguhHiMO7EJRyCs5RMCbrWsIEztu7Wvh62xFZilLrEoxiBX1F0X8j+ty8qv+TN2bYHLCFqAdJA/YbnZUNR2ReYURPmCn56CoXTXudT5bKa+N2dcJw4/MZgAhMszSo+dagYm/rY64Z3fSCWYIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZGl7MfO+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33931b38b65so2006832f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 00:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705999069; x=1706603869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBsEPkL9C1nc9BB56ipg4dcCdJMuHydCT/0qtNDKizo=;
        b=ZGl7MfO+kxQEs8dF4ebXTWPOLNw71MVnjW6J6HTawchBm/CvBll6fyqYw/B/t3b9Ky
         YxOVQLGOLv8FU2xJYFPXpLkmB2motUvjxyFCYzNm7Y+YolkD8PRoE16GMK6IGk4Hok2O
         WW87wHbrzj+lUgxEFFQfxFS5sUqg/Z05Zk0QHrssE9GPsfFV5QWhTZPUClpiSYkB1xqY
         fLtExOANFKhr4xHViNs+jaGxcHWcdEuDq2/f+9Ws9+P3hvtAR9zEWnKloImUS6PEss1C
         9oxEL4z66K3JZFknyG5a+Z6ua1HHBRYSuVeigan2e1s8UtRoN1T1GvbypLxqrmsSsOjz
         9Ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999069; x=1706603869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lBsEPkL9C1nc9BB56ipg4dcCdJMuHydCT/0qtNDKizo=;
        b=FpPcYHoP2JHxTruyUxtUrpkz+5Qtj7WJHYP092jK4HR5gDwAvzo3f1QQFdXCvucof8
         ZqwUsTESk1Jlf9OjXBXhvcJ8RPFefKe/3ybMFnBVUbliYyj7I9DuCO9jnJRefOEkjxKr
         6+NEY6ZyZkL339F2hoZvMckitPD1cjZz0ukgywZfHlghhbz/IRPLqPHrDKO6jUe6hcIz
         R+kaYKjc+sYU427WF6sgxuz9i9Oolgu9Deb3iOzX/1MMZzsM56z4vHdcUqZGtrZzWyEJ
         kThqJkwjRDOWSRdfaNXGKoRora1QIRv46T8v9DTQrMwxAgPqpvrS+KrbaK3bGTjGyGpz
         ItuA==
X-Gm-Message-State: AOJu0YwwI2D7f/3x5iI3EBxXLSw7lSHDUOHFO8JIEFLCRgHGSSHX2yiS
	pW8DrlBbeABN6pX+JSktQKt+ZGlYvWAAMq3d7Gorz2R+U49vtF1+8aSXl3BUMpc=
X-Google-Smtp-Source: AGHT+IHSMZJ0bwQErms6IhPKh2wJm0ffRn+UXIJEQKtYhy4afZa6O/xFK0SayBgF0P3Iy+Oel9EjhQ==
X-Received: by 2002:a05:6000:100a:b0:337:bef1:5091 with SMTP id a10-20020a056000100a00b00337bef15091mr1675562wrx.279.1705999069190;
        Tue, 23 Jan 2024 00:37:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e70d:72be:6c73:25c2? ([2a01:e0a:982:cbb0:e70d:72be:6c73:25c2])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4b10000000b00337d4eed87asm12750162wrq.115.2024.01.23.00.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:37:48 -0800 (PST)
Message-ID: <d20dfc44-43b0-40b7-ae04-4559942e5210@linaro.org>
Date: Tue, 23 Jan 2024 09:37:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic: narrow regex for unit
 address to hex numbers
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/01/2024 09:35, Krzysztof Kozlowski wrote:
> Regular expression used to match the unit address part should not allow
> non-hex numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml   | 2 +-
>   .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml      | 2 +-
>   .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml    | 2 +-
>   .../bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml          | 2 +-
>   .../bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml           | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 

<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

