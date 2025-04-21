Return-Path: <linux-gpio+bounces-19103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65CA95685
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 21:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A268B188A76A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 19:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23121EDA12;
	Mon, 21 Apr 2025 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="L1+m4H5Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF51EBA09
	for <linux-gpio@vger.kernel.org>; Mon, 21 Apr 2025 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262682; cv=none; b=mQdzc/31j30s3knTHVKV51lK7B+7MwWFgtJaDoPQ6VyrwZfmIG19/HZKi+Ha4y4GC+Y6DTq2q9af29wlNlT9smxf3j3gTF1jHcU75rwRhxFZk3Qhxx5IYS+TLcNAUzhKyCeuUhujRWz5ykpslcpvUce23nFS4Tfe9xBBXghUJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262682; c=relaxed/simple;
	bh=8PYakAlyro5zJa4mSrGo6B1JdD1Wy5Jt8irra5IfyBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg0GB2EnPRDftC7EwzUx75zd2nnuFZ6vzKdSWMU8Nbvwx77ondBLFexIsdEM7l7oys6m1lyBnGB49F34ekEAj5wRk2azwcca2Bg/ko/a9iZehDIsfKGhGje96O7Lc4b6BYpzLFQpGcI9x9JUkx8EZQlgip/mG2dUE+63SaQb604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=L1+m4H5Q; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47664364628so44644851cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Apr 2025 12:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745262677; x=1745867477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=L1+m4H5QksqPuVnjhjlNhPJVN3ad9fnKtt5TCKCop8dFcFBuzA62pasdgTVObmdyX7
         yZZD456fHjCEkh52E1sZ0mFxIvXCb9Nh06klOlxqj5WkKXWsKPHxhiqOPt7KOgIPO82i
         v94naqfOGXbHtK3NX0Zuix0hRIOHL/lDIAkQ5KKatO88At6yHhvkLWGBr+LGRl+9bYAL
         Cw1559TdbuXqxKeCR+FULzcPn34UdAUZP5Mr0J9CeyIWTWRTHbY3Gz4QaIkXAnnrvcwj
         MC+fkYsX2lXZSLocAVs9IETFnf3B1fQeUunc1/yTdxkM2fNpmaiM9hwWyhwVcGAGaQIz
         6WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262677; x=1745867477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=jErVvDo//L6j3MO1vf2xyhLBZwNNZ/0w5O7BtlUk8mIQNgNN5phMdk5MqS/zx38ZDU
         AbxN+tOq5LZHweoKqT0g1pk2Wh0rFfM4sLhZ4drLDRIQJj8E8VIDr4cYd3l4RmCqdJ/V
         0Qcrysm8GVC8+NQTIq3DsEn7Vg29rxK1Tswcsx/6dZ481zrr+kkxM/zzsrdl2YtXsLPD
         CdA2B7vWRtuwEZ3V9ewyWmkJthpsT1lKyl8Dcq0iHEs6ajSkJlVusdgV0k8FAc7B+WO5
         PzZHKS0Z3N2OmNPXofndDs2ee/EOLHtBDoCDAu9xBsqyd9rCbmXoEqwnuZAvMwabUxUS
         SCIg==
X-Gm-Message-State: AOJu0YyL5bvlWAs2QJxSCGHLaIcTUI+du4YIf8RgSn2uf21/C8dgjK2n
	FD9xgf36m2pp16usZ1XzmsRn4pvJt0nbfszqR/z/8cI/wUlXxG063RvvrUUKa9I=
X-Gm-Gg: ASbGncsgtAWigwEj6lcyCJBZEHyMfDcHli9vkJY8w52+qE+pXYY+w3pS9BA/ATA+eqT
	L6Lj8Er2VE74ZU6awMaUhGzrZ7YA/hhG/kNTwO4TnMBZRA67Bz6iRvV/9eW7Pd5oeipAQ88Dw7A
	RKq//UNruxZqpZa0+udeTlFWVmP5kNNdQDAiKoEGix8ZdPmQf4eymHgpQPOmp7Jmnq7o/bK7L8e
	ESaZ9d7ZXm1WSDGJg0a2KLahftKW/haVDlz66GLKEoibS2Uw051CoMBQyGwLgvh7UfBKmV0Wp0V
	foJqfjYLWWF+jEw1zlGC0hsXwTCJzxNwByWyOwW7yFOnoVoJhbrciimO2HU4HlwqI6y5shQF9IC
	rqRq/
X-Google-Smtp-Source: AGHT+IE8DZnLBNjUXN98eE0o/f4gMGDTtMaO/BL+aNlsPXo+fPOuUfQ1NdNuqmT1zTZSez0uNY8scA==
X-Received: by 2002:a05:622a:1c19:b0:477:84f5:a0b with SMTP id d75a77b69052e-47ae96515c1mr236320951cf.2.1745262677629;
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c188a8sm45206481cf.8.2025.04.21.12.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Message-ID: <8e7cdada-6623-41ee-8839-b6db1d24050f@riscstar.com>
Date: Mon, 21 Apr 2025 14:11:16 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and
 reset property
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 7:15 PM, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work properly, also has one reset line from hardware perspective.

You mention the reset line here but that isn't implemented
by this patch (or the next).

I assume the reset series will be merged soon, and if that's
the case, maybe you can add two more patches to incorporate
that in the next version of this series.

Other than the description, this looks good to me.  You'll
want one of the DT maintainers to sign off, though.

					-Alex

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index b01ecd83b71b5e9f47256adde23bc8b183bef05e..d80e88aa07b45f4a3d90e8217caf93d32655927d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -17,6 +17,19 @@ properties:
>       items:
>         - description: pinctrl io memory base
>   
> +  clocks:
> +    items:
> +      - description: Functional Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: func
> +      - const: bus
> +
> +  resets:
> +    maxItems: 1
> +
>   patternProperties:
>     '-cfg$':
>       type: object
> @@ -94,6 +107,8 @@ patternProperties:
>   required:
>     - compatible
>     - reg
> +  - clocks
> +  - clock-names
>   
>   additionalProperties: false
>   
> @@ -108,6 +123,9 @@ examples:
>           pinctrl@d401e000 {
>               compatible = "spacemit,k1-pinctrl";
>               reg = <0x0 0xd401e000 0x0 0x400>;
> +            clocks = <&syscon_apbc 42>,
> +                     <&syscon_apbc 94>;
> +            clock-names = "func", "bus";
>   
>               uart0_2_cfg: uart0-2-cfg {
>                   uart0-2-pins {
> 


