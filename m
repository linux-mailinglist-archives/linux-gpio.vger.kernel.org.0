Return-Path: <linux-gpio+bounces-25207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5224DB3C1A9
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 19:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 840FE7A77D4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 17:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06840340D94;
	Fri, 29 Aug 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RStnj3AV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13842221D9E;
	Fri, 29 Aug 2025 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756487997; cv=none; b=rF0qFbPR7+wDuFkB9Tf+4tLB49T40sOfW5tebvMHzsnUqHXVz+VKtE+Z99eV6oMr2+fad1Hl2A3yX41Ma6amDNVgkmuG86ZnTawTiOITTGlazoTxz3nfJXy2lWDZQCnsvQOZ/04MCyKxunbyzMeIQ4xygwKXMlXRPYMVRLLCVJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756487997; c=relaxed/simple;
	bh=2qsAWr9dLs25g7AJIJpGJAXqbnutOibWBWrKMjvxtf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNhbCLA9NGsObTAHLk3ZCTGwxXKkQ0/9mmOAFSRRXzZV+KXP05ydsxvQ4vRsFHe8uppyZQPi5RWVsndTpjT1fgFDjRViHUV6aNWJjGLOuf4E6vV6TGZgS3jqPSfXU0SZIaV/X7nRIBEVF/AdPSlN6ZaxD25kKkaKvvuguSGI43Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RStnj3AV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336c79c89daso11891fa.2;
        Fri, 29 Aug 2025 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756487994; x=1757092794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ScTXD3WRR2mms/OsCHXl+xvPeMxlsaHMdznQHAQIxE=;
        b=RStnj3AVB4LeHXF0xZ9obBddea9HW1c7KknvW3A2LpU2ZUkNPXLeHfh25zuTNfpvVc
         /i/bn0wy6h+bfaLHjM2e7oOeR88Q/NLNtdXUgvnm+bGoEUteq9RgPgbtGhCWL61wsB8E
         3uv9PuAWC/knofib9WOWdUn5aX6lzrartqltp/8+dn24Y5FQhbrRChATg/MCbMBPtvoZ
         yswC+9RsT3hZG/ubFOFBTZTTknYxm0izJALA3hFeXbkdyL44ukqatBmIJHNppzualYvt
         hZo8iMehDZVMRNLQoz4FWHP/WH6Dyl1tmr5EDUO735qb8/rSlQPP5dfTRCBYSC4OWs+X
         otCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756487994; x=1757092794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ScTXD3WRR2mms/OsCHXl+xvPeMxlsaHMdznQHAQIxE=;
        b=ML6Z76z5I0s5hA4Qg7blB9Z9FH9mrlxAwtIHCNjoANTOie81hevDyv2+SG05JsyZDd
         PYu4mXNGLyxfkULAvfdTv7+EKPf3CwQmm0nJb58wmZ102k1HhdCRGbvIoVWDWcd5LuvG
         6ugdqPSIr0jgl+uraGC1WwkgvWhTFfPLPjLnV7lKloa5ZQ4VDwpfYh+rcqcufOUYBIyN
         1wlmrs+DvjOjGe2mhqHcKbitCH86Wig0ZocjhP9cc9SpOIN8+qEd/7qmpvH+o0JBw+Jm
         BZqmyXSHHNeo+mz5zrL1psbnot16S4vbCcE8y82ooMPiIsjCQCXcLpZI94zzh1NBDJHg
         yPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoBZojKzr73VdbgV8HjiaKElATyewsZ+HfCfHhTQn7Zf6JC9rXrov6MOjSeY7tWM3NwlHsSqPT7gPuvw==@vger.kernel.org, AJvYcCX3oAnl0rgP99g/POu89umio/jkClX5IW4323HW21G6MszJ3rCyyOxfqqsos+bYhw/AcloJ1ByrjDoCggBd@vger.kernel.org, AJvYcCXwMp3poFiYtcCK2XrnqP5QSE7WQBExX41bfum33JBczR5wcSLIzjObgNlfbLlZHD7BOfcpkrMXf1uF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JaN8PEIoOcrwfvru6Yvo7KSe1NfwGjyyeuAzEqJqIRFlHYrQ
	rOiGc2JFf6MrPm+GZuN33o+jhYr22UOWsJDOK0thfILwgfeRUM6b8mVs
X-Gm-Gg: ASbGncuhlpBRPNQcQh9D7TdfYVWt4BTUE8pyVuxYGNr0mN/ov7QjSCnIX8y+4LBz42+
	w3mWc+m2Mk/M6tod7IoAnN/0D4NseksjEL6IsjdZ2GDzqu6sNkPm/beJV8h3zfEqHWJ3wDbkV7L
	WiTenRtpe8lfTPVMfWBuRKwH1NSOjjOv0ZaPog8BW6ehZNQ0KaxnN0vfq+whAnKWdAzP6p4K9Vh
	bxAM7lOdJbl6VBQysqgPkiWcSHlDxBFt5Fa6gZJ5doCL89RQGe6b/nesyNiDOuwtKG1fTvAp1Pp
	Scm0dRxQJjuIh5+aM6LbR9Cc9cOqMWkH795u5+l2ONVc0Pecv3w4wncMWLvqwKrOncEOjdTPKLm
	0/TkfgCS6/VbYvTjX2fMBFT31UeRwy1GQt581VrT1pV1+6e7ovXL82etXykJ1TLmNUz9NEhfZpu
	/VC62UNwXJ78onbTc+qepc/CDTDZ4=
X-Google-Smtp-Source: AGHT+IHyaOCEqiRVeMIjL+9RhrrVYAtmuR+CmrHxtLFotjNXXocev+w5teNbcAcN6gd38Oz+ysT57Q==
X-Received: by 2002:a05:651c:2344:20b0:333:f1e5:7819 with SMTP id 38308e7fff4ca-33650f99607mr62952361fa.23.1756487993788;
        Fri, 29 Aug 2025 10:19:53 -0700 (PDT)
Received: from [192.168.1.152] (95-24-95-119.broadband.corbina.ru. [95.24.95.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336b490c18bsm6095701fa.66.2025.08.29.10.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 10:19:53 -0700 (PDT)
Message-ID: <8bb9d7ff-3a50-4ea7-8c89-757fc7ae75cc@gmail.com>
Date: Fri, 29 Aug 2025 20:19:52 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Richard Acayan <mailingradian@gmail.com>
References: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
 <20250828-sdm660-lpass-lpi-v4-2-af4afdd52965@yandex.ru>
 <fcd25026-97f0-472a-a274-af342b1dce9c@kernel.org>
Content-Language: ru-RU
From: Nickolay Goppen <goppennick2004@gmail.com>
In-Reply-To: <fcd25026-97f0-472a-a274-af342b1dce9c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


29.08.2025 09:06, Krzysztof Kozlowski пишет:
> On 28/08/2025 21:23, Nickolay Goppen via B4 Relay wrote:
>> From: Nickolay Goppen <setotau@yandex.ru>
>>
>> Add bindings for pin controller in SDM660 Low Power Audio SubSystem
>> LPASS).
>>
>> Co-developed-by: Richard Acayan <mailingradian@gmail.com>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> Completely reversed/messed chain.
>
> ...
>
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sdm660-lpass-lpi-pinctrl
>> +
>> +  reg:
>> +    items:
>> +      - description: LPASS LPI TLMM Control and Status registers
>
> Clocks missing, maybe some other properties as well.

I've read a downstream LPI-related dts and didn't find any clock-related 
properties.

Also sc7280-lpass-lpi dt-binding doesn't have any clock-related properties.

>
>> +
>> +patternProperties:
>> +  "-state$":
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-sdm660-lpass-state"
>> +      - patternProperties:
>> +          "-pins$":
>> +            $ref: "#/$defs/qcom-sdm660-lpass-state"
>> +        additionalProperties: false
>> +
>> +$defs:
>> +  qcom-sdm660-lpass-state:
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      pins:
>> +        description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
>> +        items:
>> +          pattern: "^gpio([0-9]|[1-2][0-9]|3[0-1])$"
>> +
>> +      function:
>> +        enum: [ gpio, comp_rx, dmic12, dmic34, mclk0, pdm_2_gpios,
>> +                pdm_clk, pdm_rx, pdm_sync ]
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +
>> +allOf:
>> +  - $ref: qcom,lpass-lpi-common.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    lpi_tlmm: pinctrl@15070000 {
>> +        compatible = "qcom,sdm660-lpass-lpi-pinctrl";
>> +        reg = <0x15070000 0x20000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&lpi_tlmm 0 0 32>;
> That's quite incomplete example. Missing at least one pinmux node. See
> other files.
>
Ok, I've got it. It will be added in the next iteration.
>> +    };
>>
>
> Best regards,
> Krzysztof

