Return-Path: <linux-gpio+bounces-20243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F811AB9259
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 00:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FED01B68041
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 22:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107CF289E3F;
	Thu, 15 May 2025 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S6stRaRY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB811D2F42
	for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 22:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349182; cv=none; b=EASFwzfHKYDOtlrNcteqlquq6geCJkt8Ao3VXSPu83wTeH9FVZsOQ5b4Ahqw3rGiA948qVrnbaYUonjMSchx6nh2oJQPWvuhBWUqjL9zfqPdMNcGk9qG9NsHoporQ+J2y+AsqMjuHRNrJP8inAGhpJIjPNPpda5Msf33u3RTImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349182; c=relaxed/simple;
	bh=Okbe/2KWqIm+KMjrFf4qyw5wHvB0mk7h6wO98sc3Dis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmAFc+M+fGC/9rPfwsdASfXc3VZO5uGlWwXYcZe4met7YNXKAfOno4ih5x9xsMCJCRzxXZ6QINMe0i9ul9peVFldMcTqxGvkiCOYi5srFusbbawg1yfbsT7NVFlKMSFwgg7HwnIxV40sdiTmAh0HyRuUO/uAA8H3/DRRhEwEvF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S6stRaRY; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c3b863b8eso1240874a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747349180; x=1747953980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT+5zkbFGy9sTtFziMZdKaBTQT2P04GP8qxEZ3+rxaY=;
        b=S6stRaRYD1ieg/ZD3bGSnRW9mEqlnVxYUK/Qldgo0hyWZPdqto6Rf5RQZ7P1Ta3UC/
         wM/GSs8TZ/f+Q7t4et8cnQnmSw16zeEnpHxoaDZlaCkUwFXf6yj32nrYN6EsyvT9/t3O
         ekPr+x4yhN4UG81ApHMs8AFowz5eQFzemEO+tbDOa7w0w3O2EV6+a+P9eNlnSDHmrpPj
         jKVjC9iNlm/RxBxYnYEki/t2DZU1Q3YmQ0ogP+z9tEoASpzSIsi2eYltn51MQEAakuzu
         NpKjgTkat0721kEDBzPAIN9P5MQSsSs9A17IlyNcyBDSAaF12Iabpcu/KnkvzXdP9Cbe
         8Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747349180; x=1747953980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT+5zkbFGy9sTtFziMZdKaBTQT2P04GP8qxEZ3+rxaY=;
        b=ozBhKVN/KprN1JaN+6bsFHgAsdet8YYUNVzeDqxVHRNwPnSSqRFrJt75YwIKK3QLiX
         KdyCSXQfj3FMaUK+7ulm63M1Q+qL7gfurDORQkeL8x6wAwLePehweHYZBtm1vKLOfKbH
         sxWSOfsy5GVKtPXF0LQrXTDZlNBzglVElS33JCoDwFW//uokmblgqFlJpDEJGUgEUIQa
         3jrGzKx7oliLAq2DxfEcH/hK/PfH832NPrX42EWURqRI+eHhwL5osAV1YZUtrxijPCw/
         Jg3JwwqZwjinpbbO1qVTIY1tpArf7FmQejDoAJgfac6eIc6pi76dIQM75rT8iXBM4tvQ
         T33Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXMxNsB+xNBWdHuxIIO1qFwCiTdu+duz7mxk+ijrPwnaM+TpCzKzCDy2+Ahxdv2FSNkZ7sk1tKKsbq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+OPgQLLV7faRYVdCVWwrnGME4Hvr5tow14dlcjKeluNPN51k
	sl5jJtaL9vKRiHXEYovV0ANrpd+ajReDF6/BwTT2P0NKoxt8HScWRSdkDyZN1CHlqXA=
X-Gm-Gg: ASbGnct/ErNSDeGc4CS6Uqm2ukb7yqCq6zbnFr3AWxbxUpbpLo8wAKif0eVA6qRxaKd
	GKN5ywaCzJjKguXfV+Y8swCecb54ZNmgEttT6qDI8dwHQl0sZC48vCKL7R54SvnMo2euq1AANTv
	sGTtoGlN/jr5zfmbZlQzUF+uulTrMW/4/HEHc3tb2zbTwuh+Asip5ltc+9CieR+Tr4aV4HtYWOe
	rRVLqsubWnIy6yhSjDepA5Xq2CEAxK7GxTPt2J4Yl5rwp7ztyc59oZ62lPTLYRR0gj2AySTgwYZ
	f/Qra9K95xg6yaFAqn5uZg3toxAppx/blAJGqQsfmuSXnn9auVCyqXqv6AA2P8rmu51Vy8vff7p
	/MO3GgF8NouTBVMasmF/pHMecqA==
X-Google-Smtp-Source: AGHT+IFhHozagJiiH8lFQ/5BLvvM2ieE+0AF/NY8f1iOOJlNdx0dpvjsxQ1MIqHxkc+4/QrKfbvXUA==
X-Received: by 2002:a05:6830:2a17:b0:72b:9cb4:acf with SMTP id 46e09a7af769-734f6b851ebmr978464a34.25.1747349179789;
        Thu, 15 May 2025 15:46:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d2f:9b08:7c22:3090? ([2600:8803:e7e4:1d00:d2f:9b08:7c22:3090])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b3ab44sm133562a34.43.2025.05.15.15.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 15:46:18 -0700 (PDT)
Message-ID: <4d3b02c6-0cca-45c8-827d-3ab1dac401af@baylibre.com>
Date: Thu, 15 May 2025 17:46:17 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/11] iio: adc: ad7768-1: add support for
 Synchronization over SPI
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1747175187.git.Jonathan.Santos@analog.com>
 <59f45c9af16fa68f2a479f824129f5a9f2cd0997.1747175187.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <59f45c9af16fa68f2a479f824129f5a9f2cd0997.1747175187.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 4:13 PM, Jonathan Santos wrote:
> The synchronization method using GPIO requires the generated pulse to be
> truly synchronous with the base MCLK signal. When it is not possible to
> do that in hardware, the datasheet recommends using synchronization over
> SPI, where the generated pulse is already synchronous with MCLK. This
> requires the SYNC_OUT pin to be connected to the SYNC_IN pin.
> 
> Use trigger-sources property to enable device synchronization over SPI
> and multi-device synchronization while replacing sync-in-gpios property.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


