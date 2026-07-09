Return-Path: <linux-gpio+bounces-39752-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6A/RFFjGT2rBoAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39752-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 18:03:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D42CE7333E7
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 18:03:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=SyFWovOc;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39752-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39752-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F24CF3007944
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 15:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAE742B338;
	Thu,  9 Jul 2026 15:54:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1D347524
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 15:54:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612483; cv=none; b=FGQ8c/mnkXjP31ix6w6GppPh0r5NpzXB4aU/LQDZ7SILRWFmiLiSi9j8UjAPwimSTrgkfF8oQcLaZzvDTdXL0UfHT1EJ5EvW0BOlpNHjFlQ7A+J1tR7/Yjsl6OCfAmBIaYW4PxhCBy+bDw+7jGDt6HdIuTdyy13eyT2TWEbB4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612483; c=relaxed/simple;
	bh=PLoGulolsNch+biEk21nQng2ImxUq6L8OXGcxAC3fPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S93snidgFw4+XD7ajkiTQx+g76vOQZeol5MUh6qxBRtBGHMPycBwoNQUixi2vI2GJ0DS5ce4PxSILFADWPJ2PJVDpoiKOu/l59KoQb4FzbPH6wAcogIUopKsHokYlfHEwFR25QX45LTnZk77zdO6cXjHHcs0z+fC0rkphiTeU3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SyFWovOc; arc=none smtp.client-ip=209.85.167.172
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-48751bd4abeso488171b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783612480; x=1784217280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoJZzYBp1oB4KO4xVaDbxz5nVfTJ4PzYKcsEvK7N4q4=;
        b=SyFWovOc2/JnIM7UW2tlc0zHngTi1DwrmYmGFPF/ZXAaeuHvpMevVR2+i4J1gZG/0i
         lUMW95P0nDvl1L/NDYUh05FQc0Hg7FzpQ+UYiRmmgl7zteZvEfbHyjoHN4QhA0c8kN1J
         rBPNiKw2PJ6lYoylU6epf4oIH5M9wg3AuOdn4iTkLjNjyen+BixMjmQG46H5hn0/lB57
         yR/oqVuDF/oyw4vWN1S/ToGOiDr67+rZ1VU7aQDuvovEZtZwO+Qs16+U78s3yg0v1hNM
         PCDlfHGQuxWREDgcN1WbOeBSw7o4FPCF/GjjmQ5UPuJEjL977pNIYiZzP45ZtNc5D+Bz
         nb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612480; x=1784217280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoJZzYBp1oB4KO4xVaDbxz5nVfTJ4PzYKcsEvK7N4q4=;
        b=GruJ/mteTjFsWbPorzkGq3lP80i32ckewhi4xXKG6F5dIywUKBeO/jHmvB+SheqJrz
         Mr7724a1b8zj6ArQuaofgQ6n2mfYD4WxiQzexKpWRNLqqweSiWy1FfMRXFxU0xAbUc26
         3nECPvJz6xm3OPsS0/lJtoStsbSQuoV/1gL0K8kE9G2kQOMlfuY3PnLdh8rLUrMGSVkN
         1jQ0Dzw3aYxajX5iIFLYvlTAmSvKNEDnBUNBL3aKJaA5T84gTd/dKKXjJ933r7iuDdpQ
         fW/9am3qL4/DMiAZ3oS/yC/bkNHcXFgi2XLDQWyOQy7l+qmVYGHrziUsQ1K8DJ3IoeSv
         BjiA==
X-Forwarded-Encrypted: i=1; AFNElJ+BRFMjck04nuXy/nAZ5RcKHgYhYR9dDKNJly6fYHm4SuQ+9xuRAWvg0WFJHi3PnpdZ0qqxG2c59SkT@vger.kernel.org
X-Gm-Message-State: AOJu0YyOIfnNDciWu31v4w4sBlFK44iWuI69y+X87AcXg81PBos1jrx+
	Yb3JlmkwHoyIjvn42CBepJpv7ouApEX01v1o0+c2t2BwrnVTf7+pr1LQGYg0jGjP4QI=
X-Gm-Gg: AfdE7cnFMuRGnhkBVbQSxRCqIwV27Cg+lCK1G3hUtnohCQ/c3V28GcP0uvnM20KTNiS
	01GGEwB7ena5/DIfH0Lm88UN/3kqQ6vlIJ8fUkgdkR+jLu2BagJmGzYjUaP70EQ0Rr23eLuW07V
	I9xFZxDbBzAX77iKP5bYM1xS4u93/kmxerUzY8Y6f4QB4FYF8029XYob2Ce+EAADEpRy6R3Tojw
	Wo+yG6hl+k/TjshwbmdVuQIbHE0meq3VtBQKgWdZS1dXkrbIcDIr6tGMLFHad4XkCjRPBGIhwje
	R8HG8dr4cUeQbYuhEkcxLBVMKtzZU+6XxErCktUeP3SMFhF9EpVJ+MzQjaP7xQcRBGrF/UWUG0L
	sAOWJD9PBv79qpNI8S5paRwMVH03GUhKhJmTxHo7TLT4nVKUd3Tlke/GOudKLGn6+ftZwpVDNsU
	NIVJXZ3RskvLQa9TzRSnjNjMPZZV5ta4odixUx2hdHaKoPGesBKI/wYQgG8K/1IKM=
X-Received: by 2002:a05:6808:3086:b0:496:b7c:274b with SMTP id 5614622812f47-4a202e98156mr8019702b6e.19.1783612480192;
        Thu, 09 Jul 2026 08:54:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:2a8b:8d9e:f359:9a35? ([2600:8803:e7e4:500:2a8b:8d9e:f359:9a35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1adca6bedsm4124082b6e.8.2026.07.09.08.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:54:39 -0700 (PDT)
Message-ID: <517f688a-6958-473f-bd4d-65dcb56278cb@baylibre.com>
Date: Thu, 9 Jul 2026 10:54:37 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39752-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,baylibre.com:mid,analog.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D42CE7333E7

On 7/9/26 3:50 AM, Janani Sunil wrote:
> Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> processing in the AXI ADC backend. CRC provides data integrity verification
> for high-speed ADC data streams, ensuring reliable data transfer between
> the ADC frontend and backend processing systems.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  drivers/iio/adc/adi-axi-adc.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index 26b9c75bd4d8..8af42d26aac0 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c
> @@ -47,6 +47,8 @@
>  #define    ADI_AXI_ADC_CTRL_DDR_EDGESEL_MASK	BIT(1)
>  
>  #define ADI_AXI_ADC_REG_CNTRL_3			0x004c
> +#define    ADI_AXI_ADC_REG_CNTRL3_CRC_EN_MASK	BIT(8)

	ADI_AXI_ADC_CNTRL_3_CRC_EN_MASK

to match the existing naming pattern.

Also, add a comment that bit 8 is shared by all AXI ADC cores while bits
7-0 are custom per HDL project. (That is why they have names like AD485X
instead of AXI_ADC).

> +
>  #define   AXI_AD485X_CNTRL_3_OS_EN_MSK		BIT(2)
>  #define   AXI_AD485X_CNTRL_3_PACKET_FORMAT_MSK	GENMASK(1, 0)
>  #define   AXI_AD485X_PACKET_FORMAT_20BIT	0x0
> @@ -567,6 +569,22 @@ static int axi_adc_reg_access(struct iio_backend *back, unsigned int reg,
>  	return regmap_write(st->regmap, reg, writeval);
>  }
>  

