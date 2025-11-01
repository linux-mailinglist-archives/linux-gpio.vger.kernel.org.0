Return-Path: <linux-gpio+bounces-27918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D924C27A5D
	for <lists+linux-gpio@lfdr.de>; Sat, 01 Nov 2025 09:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D873BF73D
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Nov 2025 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8480829D28A;
	Sat,  1 Nov 2025 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDK96r4K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66D20FA81
	for <linux-gpio@vger.kernel.org>; Sat,  1 Nov 2025 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761987359; cv=none; b=HprbQCUWqhAIfVHf7D2/WDh/3+NAWtb9oTxxx1u3ytQCpACvGIB/Ay8M/nw9UU10KCpv1HHc1HIwsT4EOysX9c4UHR2XjI8s70qNeGj1We9TfbKudEn/kA7WjwUCR7iFSYPdV86HaFvdKhwbGA2RqrXrFwlD+cc2D+Th8lBK978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761987359; c=relaxed/simple;
	bh=HjEdYqREUrg1G1zHDD0GbBAZ82gBr2EXhhZwcjhiu6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4Tm7+io6Wv4ZCPhUiLYSdYR02E1yjAgRzmzb2atyTV1EEErgpvYeFNBcbky9Qg2fIPkiRQfHoFB9LjX5u0cR+Y8MpwGiUPYcZ7npZbpdvcJoP35WqStIe4BN3O5YG/1gwTl8aHfgOSqEo5aIQUeG4eZtpqCsmvAD4w8ySDBhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDK96r4K; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a2de30ec5so116201fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 01 Nov 2025 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761987356; x=1762592156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCuF3sQBKPeNSZaFaIXY7RcTzKaeV2kNFH9FNBLKQFA=;
        b=RDK96r4K9O/lAimKTAfgrm7Ql0xq+YatKREXGl0rK/zT8Tia+UrjZjYxoKQD/iIxRp
         OAnNWgadj4lfkbC8LZ7o48MPnVPl4sdRyGdRBRkflEwe6F1nLeP8YqBnqRQvMXx21ZDp
         a9VNjs8Nwsnf1E8QyUexmUSBUqiO4StGimiHcjJdO8aIKfNfUso28KT6qAajzvD2pZ9S
         8OrlNXiRqj/1FDYq2iOn/RUbjB5HCx8sdeONjIqnHsY0hQfBRSabbHgGpQxsqm5wMRZc
         EUvENUHjpv45dilreFw7GTWXHThj4H+hhiOglRItG4af5VO9WMvpWy2XGXSMUgD2ojPa
         nn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761987356; x=1762592156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCuF3sQBKPeNSZaFaIXY7RcTzKaeV2kNFH9FNBLKQFA=;
        b=OVyPJ4ML/IcRko+QPumzFLjm6+ZqgrNPUHWhtTBegni3THzbwujM2grB7OhI9BE2Zw
         EfeGZxVphV42Zt4k0F82IWbE7Sn4AvQh2W1Q9lcY8vZMG+yLUVuQEFFcGq+seR4Xk3Tu
         eSz4ONeUBnSWhFzQxZIJWDuZ7ZBGN9gzkdLKp7nLIbh+wviIhuQ2leX1meWHhc0F2MW5
         R6YElYst6kTX2G+wRn85QGCO92p+XeuRKN1txlSn3fQKhKtcSuM45sLwltM+hWPr7Zaq
         wW8ZmbWCT+etL67v4RZqk7TCV8m0J1g0Iimib0u5eO5Vc+xmfzugRf+NYfSajjSIPWqQ
         qSiA==
X-Gm-Message-State: AOJu0Yzqb7paw0WigR5RbFj2mUtNYULdOAr9wpaWrep7ZZTr4OttG9mR
	izNQm+YVzSBbxy+sDRDt+nvnNUi+OmTFEB/j+nMYg7jF/gCVYiXVGZKS
X-Gm-Gg: ASbGnctzpdQoLPheMP0cqICN1WduJTDKUEFZB48+vflX5W6urc3wDthGyzYBn4EctsU
	YzbDp98qjJZ5L8LhCylkS3Eki0dzIRIEmwqxRvyNLEBKM4yYxHGJAzkZFYzZ6cHvf+UEok1t2em
	cC6Vkc0CSY3Y5fCvId4qo6Y0zIjO4kLzYmWOm3o628I/l3qI2WDJQ02lDkMe8CERCDvaQsfEOw0
	iI4ou8BXZ/X9csp8U/vObJYzsr2tQekYDvxLM+4DMTS2NTpv6KwRCQO/XM7lZWTkRXnRGN9VzvF
	GyQMxURf8Gbvk0/xNXRUBruJPndVaLPTYgiIWjdzXxkUBwiYbUdBkEbbrvhpXMQu2R4QK/yrD6x
	5z9+L3fYgQgSJXR3Saniad5oFdft3LUyiwCd0OIUWqampQIZ6QNgVMyvv1OUIx4FAJBsQnvL21j
	lPISPuE7oKWetZTF3cGUT9u0SemR7SOw==
X-Google-Smtp-Source: AGHT+IFOLRkKBuiKe8YHlJwc+bHkenX63SBW7lDZI2G9P2qChZ3G072Bm1SCxHyjvpcpET4kMxy8RA==
X-Received: by 2002:a05:651c:31d2:b0:378:e752:a351 with SMTP id 38308e7fff4ca-37a18dd4b9emr10642891fa.3.1761987355289;
        Sat, 01 Nov 2025 01:55:55 -0700 (PDT)
Received: from [10.0.160.19] (ip-91-219-65-180.spb.avantel.ru. [91.219.65.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1c0baabcsm9598931fa.43.2025.11.01.01.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 01:55:55 -0700 (PDT)
Message-ID: <2f6730c4-74f9-4c07-a30a-11d6fdcb1b83@gmail.com>
Date: Sat, 1 Nov 2025 11:55:54 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: fix invalid pointer access in debugfs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251031150631.33592-1-brgl@bgdev.pl>
Content-Language: en-US, ru
From: Ilya Gavrilov <ilyagv@gmail.com>
In-Reply-To: <20251031150631.33592-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 10/31/25 18:06, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> If the memory allocation in gpiolib_seq_start() fails, the s->private
> field remains uninitialized and is later dereferenced without checking
> in gpiolib_seq_stop(). Initialize s->private to NULL before calling
> kzalloc() and check it before dereferencing it.
> 
> Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This was brought to my attention by a person under sanctions. This is a
> simplified version of their initial patch.
> 
>  drivers/gpio/gpiolib.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a81981336b36..fdb6a002dbda 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -5303,6 +5303,8 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
>  	struct gpio_device *gdev;
>  	loff_t index = *pos;
>  
> +	s->private = NULL;
> +
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return NULL;
> @@ -5338,6 +5340,9 @@ static void gpiolib_seq_stop(struct seq_file *s, void *v)
>  {
>  	struct gpiolib_seq_priv *priv = s->private;
>  
> +	if (!priv)
> +		return;
> +
>  	srcu_read_unlock(&gpio_devices_srcu, priv->idx);
>  	kfree(priv);
>  }

Maybe in this case it is better to signal an error and
explicitly return ERR_PTR(-ENOMEM) in gpiolib_seq_start(), rather than ignore it?

