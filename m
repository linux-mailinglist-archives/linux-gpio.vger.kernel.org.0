Return-Path: <linux-gpio+bounces-5325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A8C8A083F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 08:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4684D1C22F61
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 06:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B910E57F;
	Thu, 11 Apr 2024 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PurAvv+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EABE13E043
	for <linux-gpio@vger.kernel.org>; Thu, 11 Apr 2024 06:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712816089; cv=none; b=bGblH3v90oM1tk9woiO7kCov+7V2ej0WFI2LQ6pmnKvnEVMDkIAqC/mS9jnHRyuHVLvfKh/4xeEM+GrZw/2/8AH7rRUOfBIBbUOBR1L/FfZ5jflrb6+zGXuauyLOIJFgb7ZtTaq3FYK/4H9Urx+nOciR3l30fhQW9jujBs4c/+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712816089; c=relaxed/simple;
	bh=0LZSrLRPogzsfW4/8pt052No9XiEWklPFL31WEUCd8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJvU9f4D8Z3rjJ4U6P0c1cYdtg99BLT6nUAxdwvPbRcjdFo+YDQA/hPDWuXXr3SktK0PKdOHsgxSzRWOAtucYc1fsoTcfCm6MFTbcJ6GmwxUqoNtU0bugHA6ThRjRNf8PO5mmfLTCm9XtybqGVH1BrWIQ/D+YwwdTb0ptuHu5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PurAvv+c; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3442f4e098bso262301f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712816084; x=1713420884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nilkLxBgfDXqvdRilOpPnjqsvdV2sXmTESpSzKdW5iw=;
        b=PurAvv+c8l0ncc/0V9Ghve78HZalKV3vJ3KkiwM3Yv7NU614R+4GP2QnsIE72wvqmW
         1K2uN4DyvC2cqJDVr5ORWlasPSGtJrnxygNUn6ocxbV2r0Vc3CAagxlYy5lST9WQJBe4
         E9gxMIrugBB/O8X5m5TWdlYy8LGEuKqd8w1gLHmLu7NnbZwxs3E6qMAZZ52NtNiFbtv8
         rJY3lhCjPByKtAwgVsieemMcuqXh/A8nfnGMOLF1mM+f6i3B4c56J/GP8c4+D++r1DCH
         frwheVap96TJnAkUh/iWQJzNmizR7/qtRD0DppGkBYyZdf4Eeze30CTPI9Jgx2nfkLH0
         fBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712816084; x=1713420884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nilkLxBgfDXqvdRilOpPnjqsvdV2sXmTESpSzKdW5iw=;
        b=oQ1Tm0cveA4rv9OeF3Gztp5NuOJJQ2xyRzvrdi5Ep8EZy4PS5A/XYqHdYGE0/OBiEX
         kwF7BCtugEhrMl0F/9NKIQXm10CcGUfJqcrDwPg2I2pxxuv5D3Dsqp6wyS6D0ezRdJBN
         JW7Q65XPUWV7oJnNDNut3/ZChgB72f6hAz8MCy08NmC2jYPD53o/FnQZMqE9miqRsZbl
         AZ+pCxfs9xIfO8V7Aei8uY132QdGoYvNsRUwJICIjBsl2itCEWZX8tLulfNsHX5rPL0x
         y9xE7hTx8JEE6Z6V4uY6cE/N1GL28d8Lic3bkUKO5e1pbuuazXs+59Uz+3zPZ4NkPN3K
         dQtw==
X-Forwarded-Encrypted: i=1; AJvYcCVqz9skAEejUPjqiEi0Jq3TLvZGBMtBTYAhy4DWcD5prDMxwfK3WbFyTu338Qn5LezKwIEcWS1MwT02j/wm/vDV10renHGRvRZx6w==
X-Gm-Message-State: AOJu0Yyi/Vxlbugv2w5G8cY0K0ZzTFl7/OjSa0/5bp7zR8IGAWtSKMTl
	iPargrk9ACtlH9t70Ws0efa9Juym5x9JU4uJgM0EDH/eKmzA+VfyZErVvsEy/k0=
X-Google-Smtp-Source: AGHT+IEFvxG1x5KIC+cwgKNU6cxZTA9djTgXTAdFrVWV33uRarxA88ssIE7xWTwLS+TzjqFy0E1PuQ==
X-Received: by 2002:a05:6000:1d1:b0:346:a69e:5afc with SMTP id t17-20020a05600001d100b00346a69e5afcmr1351305wrx.4.1712816084284;
        Wed, 10 Apr 2024 23:14:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id m4-20020adffe44000000b00343e760c637sm959933wrs.84.2024.04.10.23.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 23:14:43 -0700 (PDT)
Message-ID: <975a8554-a299-4394-be15-c910cf9688ae@linaro.org>
Date: Thu, 11 Apr 2024 08:14:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: reset: mobileye,eyeq5-reset: add
 EyeQ6L and EyeQ6H
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240410-mbly-olb-v1-0-335e496d7be3@bootlin.com>
 <20240410-mbly-olb-v1-3-335e496d7be3@bootlin.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240410-mbly-olb-v1-3-335e496d7be3@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2024 19:12, Théo Lebrun wrote:
> Add bindings for EyeQ6L and EyeQ6H reset controllers.
> 
> Some controllers host a single domain, meaning a single cell is enough.
> We do not enforce reg-names for such nodes.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/reset/mobileye,eyeq5-reset.yaml       | 88 ++++++++++++++++++----
>  MAINTAINERS                                        |  1 +
>  2 files changed, 74 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml b/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
> index 062b4518347b..799bcf15bed9 100644
> --- a/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
> @@ -4,11 +4,13 @@
>  $id: http://devicetree.org/schemas/reset/mobileye,eyeq5-reset.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Mobileye EyeQ5 reset controller
> +title: Mobileye EyeQ reset controller
>  
>  description:
> -  The EyeQ5 reset driver handles three reset domains. Its registers live in a
> -  shared region called OLB.
> +  EyeQ reset controller handles one or more reset domains. They live in shared
> +  regions called OLB. EyeQ5 and EyeQ6L host one OLB each, each with one reset
> +  instance. EyeQ6H hosts 7 OLB regions; three of those (west, east,
> +  accelerator) host reset controllers. West and east are duplicates.
>  
>  maintainers:
>    - Grégory Clement <gregory.clement@bootlin.com>
> @@ -17,27 +19,83 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mobileye,eyeq5-reset
> +    enum:
> +      - mobileye,eyeq5-reset
> +      - mobileye,eyeq6l-reset
> +      - mobileye,eyeq6h-we-reset
> +      - mobileye,eyeq6h-acc-reset
>  
> -  reg:
> -    maxItems: 3
> +  reg: true

Same mistakes. Please open existing bindings with multiple variants,
e.g. some Qualcomm, and take a look how it is done there.

Best regards,
Krzysztof


