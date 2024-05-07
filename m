Return-Path: <linux-gpio+bounces-6188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68C8BE15B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 13:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CFE31C21E0C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 11:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31BE1553A5;
	Tue,  7 May 2024 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uf9H3qsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A66F525
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715082516; cv=none; b=hHp9zcPj6WE20FXXz47EQWNchl4tbiStuH8yqny6XZ0//IA0puVsQrl8xP/Elhi3fEyMxFPoGWowCIxRJj35faodyUEr5JZiTOWjQJWmoCgbTj4tqwAbltvZGniv8iFdFh5qgaVgfXLq7Bq6tP26DEd2oGaDbvIbEdcNLBLu8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715082516; c=relaxed/simple;
	bh=ZvJC+HUC23cfgfMiVTigE+cAqOZWAnz9vZbxnvZ8ru0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVIb5HGf8VkTOQtxfBvVZt6VRzeM5vSFwpReiYU0AAumA6cKanmNS/9Bqssp4uOC8TGY3oLQG2KudY5YzBjJKEOc8sPPisnR/7khu/eJbnia/k7aqi30X5dpy+xq7wZEQPLF1ZEqsUJcLhPxdsnaKi1PpMz05xenEAJMIPMvtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uf9H3qsB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f300b318cso3641635e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715082513; x=1715687313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72j6zNVVvGNrYMrCouTEzvFzVcRHh6PlR7ef9XOXTgQ=;
        b=Uf9H3qsBB1mG3WF0plN0CboxxB8ch2s0qKwTRYjag5C+BU+IlXgsKM7hYhx0tiDts2
         qc5GbbkGrphWjfcS+9odIxupiYn3+72eaOnbOPvQApgPU0thtOqJlCDYUz1XGu+dDaAH
         Huc5tLjXXOFf2KLEjD28m96nOAVqIW7n0/sfFcMoSK8GYpQbS0s1RNUZb1eADTOmrwuz
         8DuYQ7U+k5T+XgM60SVoz92dVdmP3eZeZh/Rxt+VwAlk0G6GyUUTIawqDpPuhDZL7exM
         wtfjhEQwpPR0lbTGLdPgex00KjwZGJe/yoEJtW1tBOfEVywhncSXW2k1RYA7Lg1XzDiS
         hyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082513; x=1715687313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72j6zNVVvGNrYMrCouTEzvFzVcRHh6PlR7ef9XOXTgQ=;
        b=CkNlvTQMwhSnM75e8+XPnUW6/5M+Vm0RKRbQSUlDwlIL673IWWlpOmkj+6OfnWBrbN
         AYvUmrEFEb+X+BFjJPSqU+1IzSNES9mUAO1hBizkyg5e+EqadZUX1pD9koYs73b713UY
         8s4Rx7oA4EdFsqUnRpkMPdf5kHeg2rBKm+PBZv0NWwAsLhVbHYpnsuv+jfNTJ7mSQO78
         hmvDBGKu8Cl90olBnOK7xCB2zXyieTIRNKfaOsomWhGiA8BJwd14CB0RDK5qPHyzcCtR
         Q7+PRyhdvoVM6OBVzZX5QcvKeawYn4rPlHuBwrEmR+TlJ7tlTJayErJO2ibNElXlC8Il
         Z3MA==
X-Forwarded-Encrypted: i=1; AJvYcCUYK/NYeBpv29Qg3AX9IxcaV8kRziQv3y3ezGDi90ojJNg8FTqsuN7y0qrEVLsuccb3s2xMhEUz/71grDbAAEblhTITgVZq9rjWrA==
X-Gm-Message-State: AOJu0YxFDrPrWGleNLdwoPu89WQp8TfYV8PowZvSHWdLp4gMu2OeNLME
	sr0gF81mmLj9lmAT3NfWLmiC+7YZ1KKJ8OhVABxHyQmcy6C1xOe4fObC6C4tlfo=
X-Google-Smtp-Source: AGHT+IEztQUsixU46vbtT83NzSNtDU2V2kQ90UiEWc9l8x732HZwYxqrdp6DKhIl1y8iyklIcrQtPg==
X-Received: by 2002:a19:f713:0:b0:51d:3675:6a08 with SMTP id z19-20020a19f713000000b0051d36756a08mr7293073lfe.66.1715082513172;
        Tue, 07 May 2024 04:48:33 -0700 (PDT)
Received: from [172.30.205.144] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b15-20020ac2562f000000b0051884ea2a32sm2086190lff.31.2024.05.07.04.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 04:48:32 -0700 (PDT)
Message-ID: <6dc632b0-792c-49c8-9f66-43f7a14789cc@linaro.org>
Date: Tue, 7 May 2024 13:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
To: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240506150830.23709-13-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/24 17:08, Johan Hovold wrote:
> From: Satya Priya <quic_c_skakit@quicinc.com>
> 
> Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containing
> seven LDO regulators. Add a PM8008 regulator driver to support PMIC
> regulator management via the regulator framework.
> 
> Note that this driver, originally submitted by Satya Priya [1], has been
> reworked to match the new devicetree binding which no longer describes
> each regulator as a separate device.
> 
> This avoids describing internal details like register offsets in the
> devicetree and allows for extending the implementation with features
> like over-current protection without having to update the binding.
> 
> Specifically note that the regulator interrupts are shared between all
> regulators.
> 
> Note that the secondary regmap is looked up by name and that if the
> driver ever needs to be generalised to support regulators provided by
> the primary regmap (I2C address) such information could be added to a
> driver lookup table matching on the parent compatible.
> 
> This also fixes the original implementation, which looked up regulators
> by 'regulator-name' property rather than devicetree node name and which
> prevented the regulators from being named to match board schematics.
> 
> [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> [ johan: rework probe to match new binding, amend commit message and
>           Kconfig entry]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

I'm a bit lukewarm on calling this qcom-pm8008-regulator.. But then
qcom-i2c-regulator or qpnp-i2c-regulator may bite due to being overly
generic.. Would you know whether this code will also be used for e.g.
PM8010?

Konrad

