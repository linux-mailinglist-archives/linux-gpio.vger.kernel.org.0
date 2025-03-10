Return-Path: <linux-gpio+bounces-17373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E2A5952D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86F63A8B83
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9893F2288FE;
	Mon, 10 Mar 2025 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDju+CZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0632225416;
	Mon, 10 Mar 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611187; cv=none; b=mGNqx6HdUHm+ltou61cBEH1/0DEPIXLBfHC6VN8n2W95JP5SOUMbrHzF2KEBKhlK6yp61ZRW8fWij596O08FJzow0Nyq9EWHZ6u/H0R1E0diApmDkb/753ye+WhyblRb9syKzPsSyH1tQ3j0ctdk3AS831yQDZFORNNU9L4uvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611187; c=relaxed/simple;
	bh=o/3MJR4W9NItfw0SrVoJ/M//jzgjRKVDn1Euno7ZE0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeGBf5lq9pTaycMo3u5OwMP6Yclcr4TlIPyvecbsa693kbq0wR0U03pXOtQl4v15/S5Mu5W2rVU3N8/lr2D/vmA6tJHVB1Ua0dXgUlZc/4Rq5BdkD/TP5yhJ/ClwGyeH5x/5NkB9qSxf2XoFDZfGhCtszoxiW8FbNRu7vrtl9WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDju+CZC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso444717f8f.2;
        Mon, 10 Mar 2025 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611184; x=1742215984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sWDRwWoRdNhoRB0y9hERNCky7r+xUDq97SjfCdwVrk=;
        b=jDju+CZC3nVUIuoDjoRIN2qmK/93Fffc4SVn26bdiC4CPYCjQ2W9WQd8g4BRMF6nfU
         Flkq88Gv/zCjNcXvfx5SPiJuX1jvEaXrJ0pi/dAQE5T0VxtNIzFdL8Rl7gKLI2G1QkC0
         /ZxC7W+dirjMMxmwP2bJkAFrR90Gna0t+CBUCkO1ZmKIeI4gRDULPIDztM9ngj3cE9IT
         7yoh5+vJHleApXce12aZ6Cma/5Huo/KrCGJGRnnxr/ts49FRbdtFpkuzoV5pLMhbbtSa
         kei8HHOuu+bGiYQSwwUnqtATuNIxd+N1Tbqrdm6n06b1iTCMg0JAn3hMUAqi4AQKklpU
         I7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611184; x=1742215984;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sWDRwWoRdNhoRB0y9hERNCky7r+xUDq97SjfCdwVrk=;
        b=isk42CSnSrsgWwooYPwqtt4DUxyoLyh+jh+yWhLNFVjeFid8E3WkImBw3yMPJ/R4KA
         Yy0n9OxCuk1KH07LH+ekT3Oa/j59etdmgrTTGfpKatZZU34z2LFoSqzrZUx/Qa7XxYbY
         wadlXjzacvUK/39ONC99Wr+XN4jOVy0XBcP1PHFA8QYcpKljOZrdXKPqB3QFqXfSgQ9W
         /3o3MVNNXHnj2X2UvFD0A3yy2yGDdllLX1iWRk8jarjSYQ5ZmR7WnPh+31vWMh36k/5M
         Du3YJnkyc63Nye4xNjD3zocx5GP4Yl17hhGq2zzHMipmxVUM0ob+ZlUYNTObqBS6SJlm
         0e5w==
X-Forwarded-Encrypted: i=1; AJvYcCUWZtkC42JPXqIZV5qPDN4bx2tl+B4+YAo/ZecWvNGbXPyaO5NcmqHAXds+gdSGoXR2Og+/SecrZGDEMsE=@vger.kernel.org, AJvYcCW1WZSbR/uvaUv5YNH+T0aInTbG+nSCqhQVPRBg+WQJIbduWd7eo0U52A7ZIemWDDbOpL8moPvA71h+dA==@vger.kernel.org, AJvYcCW64nU7u3BxnOCmzWtNm7WthDFeov8K1Zv7eAlfJXaGheoo549gVmD2MeVcpcSTFwLF5r+KjsNl2K5+269R@vger.kernel.org, AJvYcCXoFkULD8VR5bJBdy/NyIl3FQFViUr7rHDlwgYIH6TGlebJJFxHgMM3sOPcH/qfLTYIskzzswPbnBsd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/l878cBkMjL332Q+SaOtrGOTT9iFafv/a7pp4QbmbzG947bgR
	WppwzCRUWTZW24qWpTAuRKxH3SVDAm4w96fEsTVNW2zlCX7ljMi7
X-Gm-Gg: ASbGnctiQvZDm7DYj9LvtRGEeQF+gsHo3S5j20+gE5YAtwMQiQuysbesjqu17zzRwDs
	hJdgqUO/N5WttsfhrIAeOZNnhkyCqgek+hk0k+deXs8ejc3K45LN81nnfiO23xtzQIl+z12ieQL
	4IUCC+a2xhZCoCyRpwxUFnvo5xuWuK1yJjj0AXNtRkKsctZCSFxxNJhp3XpJwBZo0e8bmq/kId1
	1Jm1uNaR3PfNsYwIhHQnDMPaEAVixLNqjvTDDTgymdJQV5gfLeRG8lLRuUTfGPfw2QMh7gTElZI
	7gbtkt0NefxvNcG8v4r1+bLmHID2hfGjJAe29dR2E176OA4JGHzFrtywN5h9MQ==
X-Google-Smtp-Source: AGHT+IFXHPnb5VsbdVssO26dYn3ROjMGlquFXlpHNlrLpPV4oHZpx61k7zyc+Kw7eGGnGWzsoTXBrQ==
X-Received: by 2002:a05:6000:144d:b0:391:2e58:f085 with SMTP id ffacd0b85a97d-39132dab192mr8031238f8f.54.1741611183673;
        Mon, 10 Mar 2025 05:53:03 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0195bfsm14704645f8f.48.2025.03.10.05.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 05:53:02 -0700 (PDT)
Message-ID: <a678823b-de37-461f-991f-fe8b3a7e7c40@gmail.com>
Date: Mon, 10 Mar 2025 14:52:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make
 i2c-gate conditional on compatible
To: Rob Herring <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Julien Massot <julien.massot@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Taniya Das <quic_tdas@quicinc.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-10-demonsingur@gmail.com>
 <20250310123207.GA3853920-robh@kernel.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250310123207.GA3853920-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/10/25 2:32 PM, Rob Herring wrote:
> On Sat, Mar 08, 2025 at 08:33:38PM +0200, Cosmin Tanislav wrote:
>> Devices to be added in following patches don't use I2C gate.
>>
>> Make this property conditional on the compatible strings.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>> index 2f453189338f..d0a2aaf7df9c 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>> @@ -84,14 +84,6 @@ properties:
>>       required:
>>         - port@1
>>   
>> -  i2c-gate:
>> -    $ref: /schemas/i2c/i2c-gate.yaml
>> -    unevaluatedProperties: false
>> -    description:
>> -      The MAX96714 will pass through and forward the I2C requests from the
>> -      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
>> -      subnode to configure a serializer.
>> -
>>     port0-poc-supply:
>>       description: Regulator providing Power over Coax for the GMSL port
>>   
>> @@ -101,6 +93,19 @@ required:
>>     - ports
>>   
>>   additionalProperties: false
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - maxim,max96714
>> +              - maxim,max96714f
>> +    then:
>> +      properties:
>> +        i2c-gate:
> 
> Leave the original definition, invert the 'if', and here you just need:
> 
> i2c-gate: false
> 

Hi Rob.

Thanks for your comments.

After noticing that my dt-schema validation scripts are failing (because
of the jsonschema version incompatibility), I fixed them and then fixed
all the issues and sent a V2 where I introduce a separate file for these
bindings since they all have a different number of ports compared to the
max96714 one.

So the V1 of these patches have been superseded.

>> +          $ref: /schemas/i2c/i2c-gate.yaml
>> +          unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> -- 
>> 2.48.1
>>


