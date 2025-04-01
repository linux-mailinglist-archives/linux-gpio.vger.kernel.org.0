Return-Path: <linux-gpio+bounces-18161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EACA780A5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 18:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4AD16596A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 16:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A820B194C96;
	Tue,  1 Apr 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MACl2xXx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4320C469
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525530; cv=none; b=dx844995flh+Pp/lWfKEcAJ9L/Mb9L60K871leTkqzejXwYOPEbd/FOMHZ9PpFZoiVW/IMQ4W1lKsL0bOxCrXreckmL8bL9CoIlFnuW+yBJghfvCh3mzUd923iMeYYBXjVPw+fOAPIzhRXMh/HE+HMgcXyl4txgCDE9/h8s5oBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525530; c=relaxed/simple;
	bh=L/QUB900bn4/5qxSQgXevW35Ho7xDBeu2EqGEEQtfrg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=snehkQp3co5a93yu0njZQ8kWX9G/flJTsiQIMNema5YhtSnn0Lg20NQcmYIe7/OQJq4DOuXdfUBI2RpxOD32Eb+4sylGAIBy+XWeugLN9zGazo5Yj9w/4f+QgFR0wnsyE3c8uJFv+DIjOM67uARu5ofAIuJ3yUu2xRipUYZ5K78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MACl2xXx; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2b38896c534so2864886fac.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743525527; x=1744130327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn5wscEL3RLQT1/gL56P3oGMeI2WM/NBihFUEPIxOCo=;
        b=MACl2xXxoVtGErHozFr5CJb9eqqbVUZ/dvBEwvg8G3c69v05Q/fPITlDwnJPfpfV8+
         rfMB4z52zAXCGJC+jh8z1WZK0MHalEw/Dcr8uHEm/DBBELQTD20WvB8hAz51Zj4UeFw4
         eAaTuhDmsx+MdayDPaN46ux1pZIwyFIIdLQ2kukOAb4MPAXQtp/hrQwlEWTxraC1Sm+i
         Y4vBU+Q/B3kGfxTvMFk0nB/YJ62fzf/TKePlrQIxNpvuY88BiMPIU0OLS/1QSZaxgFKJ
         WV/If6czgmUyJqFBlsC6IZNVrdYqUNXEqX3pZKJABCSEbR2xMpQi0djgjupBwCuCRtuw
         YHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525527; x=1744130327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn5wscEL3RLQT1/gL56P3oGMeI2WM/NBihFUEPIxOCo=;
        b=wPoDa+JCmu2Fi8ICwFuLiX15L/8KufbFprYE0d42QItlCNXe2l6161a5u9/oPIPCB+
         rpYsttzOqcLy13uNle/IVH2+m0rYH8v0pWhz80Ih4y4QiIPh105CHn9WlzaVLt4435ei
         uAiAutQ0zx4w1QJYjB+jpiHTSSXE3x5g1OY5Jr1regaNM5gm+5flFmpsRk+F3QczhBy1
         P3sUjoeQ/OHLMV0UCCZ43/2TFdyyP3srTyyyzd0s1BvdudpQBE+UGiKJLXqCygmlfG+2
         CAD6RhkakCGz7oxBiDiGSPQEvQG1x+EvVI3jeRzVWcfCui6Nu5QU54x6m3xVuA/4xDrp
         wrbg==
X-Forwarded-Encrypted: i=1; AJvYcCWPcTn/lugCejngLJgl0FXuDZHCZtveajQixdDcUSYoHRhz72H2gUX6rqcaz7gxmpdQTM6n5hcv2xU9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ZtkV8NB/D36426n5SHUNotDhj0sl6uoKWSYVZeY1kq9yPCI6
	MoppzCFHnbBfD/zb5VSWLu4FdiOF1LBZo+wbi1rA6NJGqZbFDiWDmJQ1T/VJtI4=
X-Gm-Gg: ASbGnctHhy/anDVA924vnY8GghwrMZpPmEfy7kUC0oiFCU48WazZrJ+VjW+kVGw+26E
	nDmo+oufG6kTnTur5qQBmHTfflonmnm9taC7WU85dradyFOcQ0QNsxmOPo3QQNtoOe6i8BuPjlH
	SYB3k6RjBvpqanogsBdTw2fl0vOlsibv0lyryxoKwN+YbNVan87DWw300A/5JaFJcu6B58/glx7
	MGqEdCLYFYmM0hHwwqwwoFvXVf2Zx/LKaKo798o0l0IyVjhLrKuCxntoaBIQO5V0e0wM0cxEgeO
	oVgwcNdiKTKI/1rQO9Rb84lJoQWJw6HbcQ1utWqsSWUB5dzVEF6ohxovp5/1U5+mjzUuK6i2VLK
	UwfVnjQ==
X-Google-Smtp-Source: AGHT+IHU9FmD92LPJ3uip+4pws/5mX50Amq6nNJFvx9VLdxVBV3Kz6b76Gzjd/YUI+o3AWOY0Nu22Q==
X-Received: by 2002:a05:6871:69c6:b0:297:2719:deb6 with SMTP id 586e51a60fabf-2cbcf477394mr7400077fac.1.1743525527071;
        Tue, 01 Apr 2025 09:38:47 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a856e16sm2378333fac.37.2025.04.01.09.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:38:46 -0700 (PDT)
Message-ID: <6b9cce5c-6d4b-4be8-ba11-74b3471e358d@baylibre.com>
Date: Tue, 1 Apr 2025 11:38:44 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] iio: adc: ad7768-1: convert driver to use regmap
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <b0c7976d4bc817b7056ef40e3ce870b42e8a2d80.1741268122.git.Jonathan.Santos@analog.com>
 <c72e422c-1ad0-4314-8171-1c3830f63fa5@baylibre.com>
Content-Language: en-US
In-Reply-To: <c72e422c-1ad0-4314-8171-1c3830f63fa5@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/25 11:31 AM, David Lechner wrote:
> On 3/6/25 3:02 PM, Jonathan Santos wrote:
>> Convert the AD7768-1 driver to use the regmap API for register
>> access. This change simplifies and standardizes register interactions,
>> reducing code duplication and improving maintainability.
>>
>> Create two regmap configurations, one for 8-bit register values and
>> other for 24-bit register values.
>>
>> Since we are using regmap now, define the remaining registers from 0x32
>> to 0x34.
>>
>> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
>> ---
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 
>> +static const struct regmap_range ad7768_regmap_rd_ranges[] = {
>> +	regmap_reg_range(AD7768_REG_CHIP_TYPE, AD7768_REG_DIG_DIAG_ENABLE),
> 
> Technically, there are a few holes in here where registers are not defined
> so we could split this up in to a few ranges to only include registers that
> actually contain a useful value.
> 
>> +	regmap_reg_range(AD7768_REG_MASTER_STATUS, AD7768_REG_COEFF_CONTROL),
>> +	regmap_reg_range(AD7768_REG_ACCESS_KEY, AD7768_REG_ACCESS_KEY),
>> +};
>>  

Also just realized we can drop the AD7768_RD_FLAG_MSK and AD7768_WR_FLAG_MSK
macro definitions in this patch.

