Return-Path: <linux-gpio+bounces-32741-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCsTOwidrGlargEAu9opvQ
	(envelope-from <linux-gpio+bounces-32741-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 22:47:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6022DC19
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 22:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFC72302260F
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 21:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3D9377EA4;
	Sat,  7 Mar 2026 21:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DZdu02Rm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BFC2F8BD3
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772920062; cv=none; b=YWmfSCzi8CTrmp3m8iE3E5IehwTtnHS5e5CcmVixQJf/51kNAZ2sM4ZWA4swTtE7czwMYWrHFY2GakqwwfjmI8kdbKbc1uZXO98KYvTRYpEa6gHVnafo6oiChVf/HbBw1sgUA+S968Q36ARqhAiUHNEkueOoTnMQz27rukHcbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772920062; c=relaxed/simple;
	bh=gTc+rU5U7u1LSuR+IKx+LpKeYrIe9j1L7M/z9tGx1ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONdsM9YvsfV4kinK45XIep3E9PTCapm6gIMt7JsrDv2ufwhH7TlIikMPV7OrRrkz4wv6b386USXTGBr9HueAqSaO/RTUdl1iGMXdmsB9+p9tP5hfqclBy7WSPNjLYjMfzB28MP0OODbQHlTEfLLvJ+4uoImS1953gIyTXBrt0GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DZdu02Rm; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d73be007a1so722623a34.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 13:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772920058; x=1773524858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTCotYBdAN3jxjaSaFDq5B43vwPdDrS7INYqiQC34CY=;
        b=DZdu02RmiBxJXMMnk9oFmdbhBEoURATV/eU74Oz60YftRLBA4Q47xbLSKeV+PHy/De
         0C47PzPZJjGB0OVdic2DtU679AMQYh/5U/20skx81Yj9dlZoT/TzrYII3Cvo4wCpKCzN
         E0ok0mTYSyW3TtuEInQa/Z7Svospr2DhRWnRilqaQWSnNjxspHiNKfbIvoKdfhb1nWna
         QVX+aefGmHt+ZSSpC+XKi/ZBf5wvoQQfN9U025MxD72Mq2fCIgBU4SfYtE0AVioomX65
         zREFAMH+VtDYabA0dCzrM7FJdqGpjsK+HQP2gYM5bY9DdAYv/JFusdG5GQ7yOykHngat
         11lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772920058; x=1773524858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTCotYBdAN3jxjaSaFDq5B43vwPdDrS7INYqiQC34CY=;
        b=L82Kv9ue0TobShtJ+OeSRFRll1frghV1eDXGAlJZImqZyTdMS+AqCm46/D7uIcREJl
         T7LJkuG1IlShsUteCqnyhUSp5eCBYltYqla5ggKBPF2AwtesQFCa2DXIHq7thqEE9maZ
         XIxCy1GpeXGeBwYxyjLPYTtMWKSsEbIFNdMZR/5ROWcj7HRf/5HsP7MEpUfcfVgyIp4w
         hS8N2fOHF9PSiav6gbaQQzdE7nlf7XDFK1lJ/vZvGDYR0rDmNK/KEF56jvqrSIXNz+dW
         QB13xDJfLwy+HJI6tW8Kr7B71AQPW3eEm6W37SFoeVGOM722uG2TY9J8yo/W9gYGFOuv
         ZRZg==
X-Forwarded-Encrypted: i=1; AJvYcCXs3lpzp6MBkfBa9XZWvZSGXVucz3jNYiOLJH/qlUVF9gvfAXmtLFuQTYqs6jEsHNIHtf5/sHphHaAs@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1cr0DEeoIWv9sXkyjJPBsYMlRQaRp0/6xUBaUKQq4Ogn4VSD
	7VyhYeifZswv9FPBnMVIyADwJzMKqokDOTTgH8sslZPwIHJSRYnZrbhkgd5XB26tBXbSBrH30ys
	rNM3/
X-Gm-Gg: ATEYQzzQCOWNC2EWuNP9+JLk3iZhhCCb3Ts5d6L/CaPZYhqwy184doEctpU8zPrCnaF
	WW275yH1VNBTB7xR+7HEfKrb5NMlUtvVOq9hvKk9XSJROISHVmFp2s8+eankX1/5CpUqf10YloC
	aYM2P35nh5u3YKIW4LDkgO098MfDdhER+d23esGZ+wKcAaR5GBZrAJgGipoz/vGVMeOrLAk8HeA
	Grsl+HG/dWUmmjlthl+oAkxitNo4xSPEzk/rqO1907TLTr7Aw8kUNJjW94M+LPNDT4Ezl62XfTR
	YhgdSWgZne5c4w6JB06wtvGRbI0f60iSjGOjBk29b2FNqCGTaYnmkYW5Si5/mmeKoVavzmmQ4W7
	FSomkiuTpLlwvGVwV1cgBuQz35T73kKzgZt0+tzkGZYIQFQKEakP17wWsTaUfUB71nPiX7SXMwd
	lf/Q5zik4Lulgj98IJ3k1fqwFyx+T7aZnMzN858H+nu+8egK0nVqEE9s5OoNdS2/DDZtHwpx3nI
	g==
X-Received: by 2002:a05:6830:d18:b0:7cf:cef1:50f7 with SMTP id 46e09a7af769-7d72704b8camr4420944a34.27.1772920058500;
        Sat, 07 Mar 2026 13:47:38 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d728c5ae94sm3557563a34.4.2026.03.07.13.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 13:47:36 -0800 (PST)
Message-ID: <7eff9f93-cb69-419e-9fc9-a7d3392ba02b@baylibre.com>
Date: Sat, 7 Mar 2026 15:47:35 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] iio: adc: ti-ads7950: complete conversion to using
 managed resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-6-a23fdd1a079e@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-6-a23fdd1a079e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4BE6022DC19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32741-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.969];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid]
X-Rspamd-Action: no action

On 3/5/26 1:21 PM, Dmitry Torokhov wrote:
> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

One more small detail...

> -static void ti_ads7950_remove(struct spi_device *spi)
> -{
> -	struct iio_dev *indio_dev = spi_get_drvdata(spi);

Since we are removing the only instance of spi_get_drvdata(), we can
also remove spi_set_drvdata() in the probe function

> -	struct ti_ads7950_state *st = iio_priv(indio_dev);
> -
> -	gpiochip_remove(&st->chip);
> -	iio_device_unregister(indio_dev);
> -	iio_triggered_buffer_cleanup(indio_dev);
> -	mutex_destroy(&st->slock);
>  }
>  

