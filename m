Return-Path: <linux-gpio+bounces-21674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2FAADBBBC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 23:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 127F917393C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 21:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826C821ABAC;
	Mon, 16 Jun 2025 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vW48Ws+G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465AB218E91
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108293; cv=none; b=bBQYks6G5IH2RYRC/nk4UALAsnBIOSjJmDb5K9zd+usgN6Yq7duBdJU+eDmyrOvF/OUVcjfXr65zp7+r6QQ4ua2yc/oEPQ88SGFT8y92aaCwBXLSao3eY2buGbaCwp/6jVF6zneqkkVRHgK42M/BKTDGqjv6ODfSUR/bbwsD4SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108293; c=relaxed/simple;
	bh=QDEJC9lNPPxMJgzIsPCXcaBWEEtBKY1BQcD54BSSUUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKF63rxkprbLZru1Zm1Cofz8lfch0DRyVIt/MfSuXcfOqgLDzV6vOP57r08IGwk7xpUJZ7i5fbB89/IOL0Tn8ey0w3sk0JFOEbR7amMy5lmtxSoGjH9QSRWaFGjj1yFQ3uBgFHiDaszYsRAPksIyoHN7hxcD8P38NTphoMGsLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vW48Ws+G; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7311a8bb581so5048076a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750108290; x=1750713090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYkNHZ7Min5h27AdAztgUbznbIMSIi9ilTeWa8MhK+E=;
        b=vW48Ws+GXJxUskFWMuXzMMaakcBhTzo6DQIB4Hnm/eaH2/XJrnM8kfpk+QSoMN6Hml
         UmyofMcVvMYyz/Y8FD6h//WFwJshRvWvRsviQ6zQhemWgrshK8HvKPj3iXnQehT+LdYZ
         uhYwEQ2iJPB4Klvzd0boMZclTzEQPaYu160d+jJYQ0I5eDVt8GeetyAkz+aro3mTZbQw
         udSUS0Ul61J0cYppKjdW8kVV9l8ANeWeDekwx+LC7EUC+rvHrfIgbNDw0qXwh66llwuK
         r+zK59BasfH+NGffR8AVavN6DWhhNjs1DZgzPQj47WR0Kgjkd0rawP5wKk29DpKuWP/M
         ft6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108290; x=1750713090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYkNHZ7Min5h27AdAztgUbznbIMSIi9ilTeWa8MhK+E=;
        b=SdHiwhslexr12Tx80Wqz3KDbQotSVEodu4dWL4PHUze524dIaJpjmc/HOe8PkzM37r
         2nsb22K2ltSEvdCF4R3fixq0lS3LT5Z/fFIHdqx8OKa/moQIPAil45GMdJ9PS4yFzEa9
         4M+MMoUE9hZrzhjem1yPV141ZIsuccTeKM/Uhoje4iTfocyhOl90sP21Ujuc/5QA7/yA
         8Hz95msd2KsSqwunu5Tut6CU2EQeYhUDCL4RHYBWD73F1+ILHjmZk4NlUzXCuMNzE/a0
         j9sowxpMo8g6yGR01DoXCecNa0H5GHfqE0Dmy86wakR/QKQWndlex1f17jjUGiTrXeRt
         MVhw==
X-Forwarded-Encrypted: i=1; AJvYcCVCysp0HH7FkeG8Y/NeQBxH3yICIn1NBrmnyLmI/bqZvEhve3hfLmg0FJU1SLkubg3mGjEdvSnGaYp1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe13W7FUWs47+AJEy+OrK1IxtqG3KjjzDfOzFTf1OGtH4OCU8N
	5/ubkOSvswT14qVNnMk8SQum0ZJKosLUGTb3SLR1cOsqz8efgA6G30cV5Z0xSDYZpI0=
X-Gm-Gg: ASbGncsPXi7Bm/ATfNx2avO9AycHC7SqZE4fpn+cIcgOsRsqzjs4+j9d3S0S9jriXxW
	oJIlZMWgTk/L2XyG7wtC04G8t5IVIlx90WepYnmyVXS9rdBi00Ql4c7lDdv+hJqJGibULt5JJSk
	Yh0EK6AxIxAwhIxhg0TZBzq+psVXScwNK3bE6is1SMtP3fI/ovsrbnZ9gxis3vBySBCsq3krRJd
	JjogxOZYEnMWt9cIhH3g5WFLIuw7zaeAQn0BC8LaVuT8WOH1l2A8okPX2QWVktCNbygF4POR2/U
	sFgcx0efFtbOCB6SXdbeCmu4uz1gzjWByeoIyeO9MkLH2PxDyxnP/YIwhQytuhA6brVYei8TZ1K
	PiR+gsf56wqCCvmSP4L024decn1QKn9tkBWKa1qw=
X-Google-Smtp-Source: AGHT+IEVfg00pTGaPRzK4Tu/NTTi24yJzRagmZrO6SxeTxUYhm24UeyDhh597dYIx3cwF5Ovt4WWcw==
X-Received: by 2002:a05:6830:7203:b0:735:afba:ba99 with SMTP id 46e09a7af769-73a363069e3mr6270036a34.4.1750108290314;
        Mon, 16 Jun 2025 14:11:30 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a283dbf9asm1344501a34.12.2025.06.16.14.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:11:29 -0700 (PDT)
Message-ID: <656c43dd-c39d-4e35-a9d8-70383c0836a0@baylibre.com>
Date: Mon, 16 Jun 2025 16:11:29 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] iio: adc: ad4170: Add clock provider support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 marcelo.schmitt1@gmail.com
References: <cover.1749582679.git.marcelo.schmitt@analog.com>
 <5ac4b2d54f426d997cbb067530ab8e9af9bdcf16.1749582679.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5ac4b2d54f426d997cbb067530ab8e9af9bdcf16.1749582679.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 3:33 PM, Marcelo Schmitt wrote:
> The AD4170 chip can use an externally supplied clock at the XTAL2 pin, or
> an external crystal connected to the XTAL1 and XTAL2 pins. Alternatively,
> the AD4170 can provide its 16 MHz internal clock at the XTAL2 pin. In
> addition, the chip has a programmable clock divider that allows dividing
> the external or internal clock frequency, however, control for that is not
> provided in this patch. Extend the AD4170 driver so it effectively uses the
> provided external clock, if any, or supplies its own clock as a clock
> provider.
> 

...

> +static int ad4170_clock_select(struct iio_dev *indio_dev)
> +{
> +	struct ad4170_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +	struct clk *ext_clk;
> +	int ret;
> +
> +	ext_clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(ext_clk))
> +		return dev_err_probe(dev, PTR_ERR(ext_clk),
> +				     "Failed to get external clock\n");
> +
> +	if (!ext_clk) {
> +		/* Use internal clock reference */
> +		st->mclk_hz = AD4170_INT_CLOCK_16MHZ;
> +		st->clock_ctrl |= FIELD_PREP(AD4170_CLOCK_CTRL_CLOCKSEL_MSK,
> +					     AD4170_CLOCK_CTRL_CLOCKSEL_INT_OUT);
> +
> +		if (!device_property_read_bool(&st->spi->dev, "#clock-cells"))

This isn't a flag, so device_property_present() is probably more correct.

> +			return 0;
> +
> +		return ad4170_register_clk_provider(indio_dev);
> +	}
> +
> +	/* Read optional clock-names prop to specify the external clock type */
> +	ret = device_property_match_property_string(dev, "clock-names",
> +						    ad4170_clk_sel,
> +						    ARRAY_SIZE(ad4170_clk_sel));
> +
> +	ret = ret < 0 ? 0 : ret; /* Default to external clock if no clock-names */
> +	st->clock_ctrl |= FIELD_PREP(AD4170_CLOCK_CTRL_CLOCKSEL_MSK,
> +				     AD4170_CLOCK_CTRL_CLOCKSEL_EXT + ret);
> +
> +	st->mclk_hz = clk_get_rate(ext_clk);
> +	if (st->mclk_hz < AD4170_EXT_CLOCK_MHZ_MIN ||
> +	    st->mclk_hz > AD4170_EXT_CLOCK_MHZ_MAX) {
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid external clock frequency %u\n",
> +				     st->mclk_hz);
> +	}
> +
> +	return 0;
> +}


