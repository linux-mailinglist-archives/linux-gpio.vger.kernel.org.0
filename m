Return-Path: <linux-gpio+bounces-5875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF58B30D3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 08:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE261F21D43
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 06:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD53213B29B;
	Fri, 26 Apr 2024 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQKTRfnA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA6C13B2A9
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714114501; cv=none; b=CsjusMlaN9XNGYrja3F4ghE4H9mmqlPZyJpi8J3zuw2b/MeCmR0+Dx+08TVGy0wv3I22S12q0mpS+y9w5dz78M8g+tOVmn00FIhIAO3CIC+E4zQ+vRdpARFwgU31YQTqqB0JUFkOERBgH1GxCWrvnlL2qCy3KlnkSP7iOuZ89II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714114501; c=relaxed/simple;
	bh=S43MwIqGxyqXL1DyER6s7+TNli6GpJHEfR0fMgowIqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHhjoKWPaRsEJfmwy6UAV/JEgHwcKvVDNo6H6Q8Xmr3SN0qmOcvzCti7w+JwQ00sU38sP33N6WuAZoMPFLeTDzaX5NXyrOMMHOYXj5DaGEh0beZpgrYeRXF+0SgTeSCkAN7ryMighPsZ5pjuDxBT6zGYOtxPJntzdBPkY16olcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQKTRfnA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so2190069a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 23:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714114466; x=1714719266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRbMkmz+WO9gAxXS1PC2ZjYMV1fLce7waMJaKV9hE70=;
        b=FQKTRfnArNT9BCKbWQkHRVVkCWQDuhvUWKmITlGX2Pl4lvVFZjoOqeSo7SLGjTRf7O
         qmWxvKAD+rGg25shyRXU+PLHIhGmHduqGGX2kBwalnjnPV2IK1xD3Ld4Pq6NvqmoJqwZ
         7nFG5j5PstcyTu9sdqeavp4QejSPL6Gg2LFhVw75uTKnLw4FucQfNMCWrC+6MelT6bsW
         jc8e0NrFzaZaf/AJ5BfKax3fNY++amvLBFSk+s4Ur46Dh0k9hmYdWc2HPHsTttT5Rycx
         AwfI2uGV4Hzdn6SkXYoNSmHkJmGrstV5rmdVT6UUybhuEPhDKKDhF/Mn5PHn2gVup4go
         8r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714114466; x=1714719266;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRbMkmz+WO9gAxXS1PC2ZjYMV1fLce7waMJaKV9hE70=;
        b=jEsMzebRbxHoMAvGhORyXaav3X/ttazBHh61JvCCwb4w5EcKrqHdECpGzvZwsTPNK+
         o4R9xmCu8s2pXbj6qMzNUwazgFJY9y1BbCmwqrrNpgiaUR/uAWWSFZMP8NN5V7W/JA8r
         q7NY4MpNlB6+z2cWRvqjdw/WJqju14Zewywj9ixPAKxnFkKGXOBhihjOHM8SJgzTDkD2
         vB0Th+dzu41vkv07ELr9v6HzrmumSDk7hbov4Kx31f9zUx7z21nyB/lUEPfDhEacVpjn
         Z3aRYP8871uNDwVnt0/Fx/R9wvimqzWwD7fff7GeAv7wzK+qqBARMGBbdo71VQR5V/F3
         ue0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDkZMxFPAgBvPXyoPySNt+BCWcItCs+MvL3rACLPQA16K3cC3n4sVa8riQiwGOHEdAjI1MBmEBCSbaa+BADwXDGZAOEkGY6xAseQ==
X-Gm-Message-State: AOJu0Yygdg96ndEAfbjU1bttnWXw8qVFhrIN9RV6alArqx0XETkBKuPW
	ifKvcq2rfMZzuc5gcoUCS1CWyAmiSq6lHLBb7VcUsK/o0xWHkedRVSG2RVfE8NY=
X-Google-Smtp-Source: AGHT+IFBNJEqyTZSbIwVgrK7GAlTSlYYZAV5VkuvX5rTzmyy/bS4IVdCR/W64mXcWCNqp+vwNH9+Eg==
X-Received: by 2002:a50:bb0c:0:b0:56b:a03c:4eb with SMTP id y12-20020a50bb0c000000b0056ba03c04ebmr1938476ede.31.1714114466333;
        Thu, 25 Apr 2024 23:54:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b005722514c67esm3417808edb.14.2024.04.25.23.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 23:54:25 -0700 (PDT)
Message-ID: <a4bd904c-ac81-4424-b9ec-14549b06ee15@linaro.org>
Date: Fri, 26 Apr 2024 08:54:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Fix "comptaible"
 typo for PMIH0108
To: Anjelique Melendez <quic_amelende@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, linus.walleij@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240425185603.3295450-1-quic_amelende@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240425185603.3295450-1-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 20:56, Anjelique Melendez wrote:
> Fix "comptaible" typo in if schema for qcom,pmih0108-gpio.
> 
> Fixes: 6acc46f8c065 ("dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIH0108 and PMD8028 support")
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


