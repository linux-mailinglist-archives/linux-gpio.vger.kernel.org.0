Return-Path: <linux-gpio+bounces-31992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hLJ1JtnumWm/XQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:43:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADE16D68F
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96506303935A
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 17:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE81329E49;
	Sat, 21 Feb 2026 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BlDw8brg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D60319860
	for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771695826; cv=none; b=eehz2A+zFuzBHEMce/P3Fh1TmfWOZe88I/m7Vnt0bDMoRAA5OKrNo2OfA7ruVlJXOqUqPCsLA1OTX2RGY329VQ3UBnDggkqAn++rYQL6cuOBI6KD7R8bsiNmWB3u8aIubdSwnmiOl2VjzZ9z6VFmArkEWGjGYf2mV2vi3nBWtwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771695826; c=relaxed/simple;
	bh=nJumRRbqfdNmn2IGqF/Uly0EsPFk2xrL0YCTdj2iRqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxKG6Qo/uOSCl8M7LazqGcIOZGp+VHsr1buKXwik5hrHCLKBcrzCQKrDMQQzDMYQQeraWK2TCLeCtcJzUQcoLsAx69wNk9F2b3oqYFN6iEJzL4EhGOZhUjRMT3FAqJEX9k6p2agNTf0IhZsumJ15jwwD2ljYUwtZstBKrKlLGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BlDw8brg; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d1890f5cafso1042311a34.1
        for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771695823; x=1772300623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRCibtW3MIRfvX6LQTp5cSh9t1XPZOYyYIJvnHLTP3Q=;
        b=BlDw8brgA/MjL/hXyXQVFhFkE1qmzpcfsdzIy7gjfhED4VIgU5Dq+2RdGPO99F4EN1
         eK5HIePFQpHagF2txYZpdfEZAn8X0vJWA/TnqFuhP+PRC8P91SHvix67gTkoTDi4pwGa
         6ojwBsL/FhyUHNAK8C5zcr/L5iHAWcYueNR9I9IzFGjh505EGpI8//SVAVBxU9ZWbekY
         m0DxWaMm5KXIThPjkuA9vWfmn56WLB0LwbKcrj5e+zCLGxOA/MEZLoK13YTmI/EWaAFE
         O939ixrEUAwUx5U9Np68SCK8o/Cs1e7IL/9/oCnbZDLohBhKNcJX4Nv1y885kFuuuP12
         pIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771695823; x=1772300623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRCibtW3MIRfvX6LQTp5cSh9t1XPZOYyYIJvnHLTP3Q=;
        b=iwyaOy0CP2mmRf77HZeOQFnDYsj0EFJN1LM1e82dnvVUJf/snqjw+IFCCWRUVMu49b
         0bUQ57XIUAcgtWnbUPbqaLW+NrYH1SpKvC3W/+Vt810zNK3qPmCkcGdN4XoUmJrXiiPN
         XvSElB9H29vIstbRZakSgBLYsfONWcUtBLOIOAUbhEwlN90zMV2Je14nLHcj1g9OLVxc
         4RLKgaMaknAnHBl9rE14qmzzBEDHgGShQBysSaadmn2c4RC0ga5d+3epBOGp13T6WGqF
         4LTiYdBZpcr4D/mvVeT4huL2hm6eHjfXE+YJI/RqICbQTbvcCo/D2+0OZCkrfZPyJEZY
         sH+g==
X-Forwarded-Encrypted: i=1; AJvYcCXvnR/lx4M6XiuTdesm5+EEszf/jUt3vtuo7wCzd6Y1QbekcmFABp8fz+vmxHhxBVXUc1V4MQShVCAO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+pDRPSNNjXJZOqPT1SYQs0femcJ9Dmt1M8iULO577I3gD8/ow
	HdDTB74dsd7Q/7axD8pl0Xio2Q35TQCmMDm+b9QziNl/V9GbOlLYBJhjst+s3tbGENo=
X-Gm-Gg: AZuq6aIKvTgPM+IYvwZR6naJ7wfwzBnauySX/igSNEmQwKugNMTm+fxAawscGLwaVI4
	yDZhDVox8xlolJQndiHVf/GLsyQt1pFhpRxRVu+w/pW2w3kDAnejyCzhsMSPMpWlmtlLEXZUTwV
	ipSR9HS8QZ2NJEtjefhUs1HP6Mul58Z9tvW1Ns066O11w6fOFwl4AImxiIqyq3witkLX2ZoFiB0
	Y3UIF/8RAqO4ehjJo64fo55PN8HlbWHVBsQ0IUSUVFQkylFSjpuo7Kg5QZ3Ojf8L7l9VvvOELN1
	VhUugd7WOX4ofIjxC8LPcw1sDzHGFcmIiSnWR4nAFu/xufCkMJkunTcul/n+RKDFVuWsQqkJq+A
	2kE5mN0LfBMxluEEEhLw4Xy+/x28jylbekdWXrJjpnRUMafsKvLvidosscKK4f9/979T+EXW5qW
	wCBsbCV4J64JRM/5Iq9xTBPI5Ss5yx+UnrBoat/H8RcjjLrxoXUsQ0hKqS94KwvaumYK3OCQ==
X-Received: by 2002:a05:6830:660e:b0:7cf:c613:d301 with SMTP id 46e09a7af769-7d52bf530fdmr2120582a34.23.1771695823282;
        Sat, 21 Feb 2026 09:43:43 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:611:96af:f385:64bf? ([2600:8803:e7e4:500:611:96af:f385:64bf])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157d2d7922sm3143078fac.12.2026.02.21.09.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 09:43:41 -0800 (PST)
Message-ID: <a8267ee4-783a-4f04-a94c-d05d4c689658@baylibre.com>
Date: Sat, 21 Feb 2026 11:43:40 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to using
 managed resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-31992-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 0FADE16D68F
X-Rspamd-Action: no action

On 2/18/26 8:29 PM, Dmitry Torokhov wrote:
> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/iio/adc/ti-ads7950.c | 98 +++++++++++++++---------------------
>  1 file changed, 40 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index d31397f37ec4..1c53e000bdcc 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -528,19 +528,26 @@ static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
>  	return 0;
>  }
>  
> +static void ti_ads7950_power_off(void *data)
> +{
> +	struct ti_ads7950_state *st = data;
> +
> +	regulator_disable(st->reg);
> +}
> +

For the regulator part, we can simplify this even more.

The part where we call regulator_get_voltage(st->reg); in
ti_ads7950_get_range() doesn't actually need to be done there.
It was something that I just naively copied from another driver.
(This was my first IIO driver after all!)

Instead, we can use devm_regulator_get_enable_read_voltage()
in the probe function and just store the voltage in
struct ti_ads7950_state.

I would do this in a separate patch first, then the rest of of
the devm stuff after that.


>  static int ti_ads7950_probe(struct spi_device *spi)
>  {
>  	struct ti_ads7950_state *st;
>  	struct iio_dev *indio_dev;
>  	const struct ti_ads7950_chip_info *info;
> -	int ret;
> +	int error;

As in the other patches, please do not rename ret. It is adding noise
in the diff. (And I like ret better anyway.)


