Return-Path: <linux-gpio+bounces-21500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF8AD8779
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05A1B1741F1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 09:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3413E279DCC;
	Fri, 13 Jun 2025 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="drMl2ouI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A75256C73
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806072; cv=none; b=ZGJDG9mx2B81ShPew5A+2P14OAx0C7Eu5k8QChcxGcveF51mwgZaX49zl+c2W5EXUsT+NdjIr9+RM3zrFAL4naVm8wZXaMPwMWtuNk54dzGF5K9DdT+Cg/YyJkeRcpeNJEVL9X5+l7X0pn/AdZh/MdStNl5OLQZut9ahfgsFLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806072; c=relaxed/simple;
	bh=U4FrUnxsS+O88EpMRs/X5M2gy9Ob8GhzpGYbm/BQic0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z0o06+DzvuDgwIYNW628/b6ZoH4mnkdoKbYW56sTPT4h/dpjjmoxOREujgiWl52SlB3kNAubrp2RBRQnX2hbtxrsfVRE5rrK5NE5aoQKzU6IowxaEmmMcpfIyirI312k804jEAlvE5rsEfPaPGRQHP6Bou8kuPDtQRjavMNeH1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=drMl2ouI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1161470f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806068; x=1750410868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=drMl2ouIyRwSgLVGzBBO+OxyEw8y6A925wFGgIxqaVkyEfE0xv6gu61FEuK8Hpkgeb
         N2NR6k1A9YZ2niw/1atorWIanTvHGeRBf5ATXHzo6IfV5ZwA1oY0HEApuGf82YuQ5Qnp
         by+h0QEcA1zfuyfLEED9qjyLRj1cQUnRvMb1RBqadP7cfMbNa/dYOGwbui4xUPWokPnU
         1/MTJH7a50xneWgw+zhfMF7FVIS96iv4tvh2Tup4HzJlvEFv4QpvFBI3HCAl3DaVB3jG
         kaGf15RN/johiJ/pxleH/kICA0Qr163AiBXQPzQd5hIOg3PM8vFRbHMBnFkRl4i0S0O2
         0++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806068; x=1750410868;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=daRW23MQq+8N8q2Tpqe8O56q+ZI7YTgWFCjIMIiexYTEQkk7OVMu2DwIqPTEyPQAHr
         SYwQWNoG0MoIFnZ8tGd0wIVT+iFOfHIMshNghfwTyJ8EFy/13RnMe27XRRVNP++xOLT0
         0Wb2BkZpo4gUNVB8fhACgrzWxpaf7lPr2Fvig1XiFyz7B3QfB7z52yi+CBYdMBr6cYi7
         aRDeK6KGxaaFAworyrUdXaJz6dx+NraOZvX78UMeAzTl22dNNpPftz1ddThMJ1kFUPNZ
         XJBZWcoQ2DMfD2geNIySNhMdG2lwIVjme3GmDyuRTWbP+XZ1cY6GABR5+huug4RVtBF4
         gmqg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Pt8PLG32RAb1AWRYmbHHzF73BswPFc8Nlp8es3svvoqO8YBMKDkjVcbKIXtZrg3Oi3ozwNgbavgo@vger.kernel.org
X-Gm-Message-State: AOJu0YzHk8gw4r4mGtiS9rgsEONXIfDqKz87sBCNqQkik8JFby1flRVV
	SzBTw8fOt+W2buxSVhHYKubt08DawLZrAMryfuh6sDuW3ffkCZeFrkN+Nr1oLKzzsps=
X-Gm-Gg: ASbGncv8ck+wOIWCugMZjGDgadNhWty02LcbZnrzwVQmgpeLQnIauwV5ZUQ9rYwNmtT
	SJ9+oltj9CmUB9ggBajHlNzXZVK6/3kApKWShiRx/XD7OjT8Egpk5pzm5yzMqmlwvvfIR2icxJU
	UlifpcYHxiofIGa/D4Bo3vGGhwjS3UolUSAdYgTiq0zMBKc88jqEbpCgcJfUz3PxDPklSnNQdCi
	Bs9n6ullkz5Jurs+wbjX1JYVTYGRvl2dnlzPyotcUfsF5a69JDfX9dtCgj+NhMZmOjdQF6hJHXP
	TW5YCaYcT+ISh7h5dmVb8XO+YF5621WecA0ashhuXOfKdGm76IPVjAaTvmVAdQR9YOrzyC1z6Xl
	XXBE9YObIFZ8LFU7sNM6d/+59qbs6+Fw+dSghnR0=
X-Google-Smtp-Source: AGHT+IGQOFD/EY7S2QDUIKx6X5WFj8qb8/qrnjFsfEXjcL1hzrA6uPRMdM2o+qwKrI1AezZg1EjOrA==
X-Received: by 2002:a05:6000:1445:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3a568655fe0mr1850481f8f.6.1749806068043;
        Fri, 13 Jun 2025 02:14:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm1781165f8f.15.2025.06.13.02.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:14:27 -0700 (PDT)
Message-ID: <5d624bce-a46f-4b75-b785-56def0c7f108@linaro.org>
Date: Fri, 13 Jun 2025 11:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org,
 linus.walleij@linaro.org, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 05:29, Jacky Chou wrote:
> Add device tree binding YAML documentation for the ASPEED PCIe PHY.
> This schema describes the required properties for the PCIe PHY node,
> including compatible strings and register space, and provides an
> example for reference.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>   .../bindings/phy/aspeed-pcie-phy.yaml         | 38 +++++++++++++++++++
>   MAINTAINERS                                   | 10 +++++
>   2 files changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> 

<snip>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5a650812c16..68115443607d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3696,6 +3696,16 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>   F:	drivers/media/platform/aspeed/
>   
> +ASPEED PCIE CONTROLLER DRIVER
> +M:	Jacky Chou <jacky_chou@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> +F:	Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> +F:	drivers/pci/controller/pcie-aspeed.c
> +
>   ASUS EC HARDWARE MONITOR DRIVER
>   M:	Eugene Shalygin <eugene.shalygin@gmail.com>
>   L:	linux-hwmon@vger.kernel.org

Please move the MAINTAINERS change in a separate patch.

Thanks,
Neil

