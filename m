Return-Path: <linux-gpio+bounces-21673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29490ADBB8B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 22:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C386E16AF85
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 20:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AE0214818;
	Mon, 16 Jun 2025 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3e5LjKGi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61639211A3C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107190; cv=none; b=DJcJiMCfMXKclkVOmEnKog7sLDuTiwMvC5baMyosxDnRjy2bqV4GYyhIXRc8s9fKjqzHA0iXDdJ3N0UohunUmLSKO8nI438hCQVPMqSZNfpDBT2Zu3dKlrp0e4X+Sa5opeQ2LTo81aZLgMT1tOj5OhqYSynYHINexPqHZbmnM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107190; c=relaxed/simple;
	bh=Fgc2WWVhmZSNbwYEBSqxyC8hN2ImBZ7wr5GI6gGURtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/6RUvf2vrj/rXYbN8Ox5YqLoBtI3DkLlBQqyW/o2NoM/AOWhRBsIcT1zt3IJg1sExXeBQoRlZY9GmkDJ9SODPJknz8CYNfXLA43S/qbg7BHL+W91M+HDbb99ewzpRvMKZW9Eos3eoDTW1dCMYTvs7CQMV/UHxtwu0skoVq2JIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3e5LjKGi; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4066a0d0256so3242003b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750107187; x=1750711987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8tqSOUPgM1bEdf4klAOUys4IG+Ji9moxOsELLoPJnk=;
        b=3e5LjKGi+PaHpPwAxSWsy05puAGIByyAtxpKsXJe3l9dzhTesO/jCjl9ZLznA7MK1I
         fnn0eSXXdYgyxvBH6soKWMdtwD7wM9P292MVT8PNw5XTIgBIW3lMSZTHL4gd4YI4btJ+
         r/Rw7y+8CV1Zf+oU2t0QFybi8Mh29RsLg/ltE8YCuY5VHtsrNt9jeH71VAIpCzYcrqV+
         oTgy7A+0Q8YrdRB7dwjT9cwjHMq5P5I9GawreWlDA2rWoM8Ez2laX8A0AdK0fZyLadpG
         l3XeGRpgcoIWbcAmM1nm+WK+lHijSoOaadGkn6EMVIwVH25xWVbfXj108PhDWSziLd16
         tiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107187; x=1750711987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8tqSOUPgM1bEdf4klAOUys4IG+Ji9moxOsELLoPJnk=;
        b=rheYB3RDMT2Xm5jd4xZaEi20f5d6tdJJBqepDYDz5ec0n6CQoS6KQGx1fZEf20IQXR
         Txz0wO9vW389aTdMyWxOurWZunGM4FHgWBPHlIJEth08owpivp8aXEyqkJK6vyh9q6S3
         cvska2BpOkWRUZsvCfOc6x78w6so1WAZ0waM6Xq34W36pmF7MnmrC9Vqsv0Aykqj3A9m
         rdIE7dTI3suZpmW+A+IJv947S12tAa83E3+MZLTF+xVsiN07uVOoQ6XPPy0grdjpsdTH
         peuPYOM37PdICUrBtkpyiRBYryF/z1WGQsEyCZ/iBAg+26EoqZqDKIuY0HLjHN27g/d7
         TFHA==
X-Forwarded-Encrypted: i=1; AJvYcCUjk3gDYhxvazqUq5x8QY79mS+AtKPEpy427rF+KEE/F+TUzw24X8mV82lMgzW/2cWBsNhxVztZOAGf@vger.kernel.org
X-Gm-Message-State: AOJu0YzKfBXBYfPgq2YDdMzcZv672GKvyZaRKFfVXv+kDFjoscYNKHqO
	QF/b4fpAKogZ/9kIEtukr3CoXA3jpcYovnwOlA84/XdbK50OJ39Oe13DnKZbyTG81Xg=
X-Gm-Gg: ASbGnctRk/0Cex6OUOz32fseZWUy79GCNQx2UxVrnbHxf2GW3eUPVn56mb27wQGnbp6
	SQ63Y+MXfwNs28aR67AaS2GEBpb+C/dgOWr7/uR1pgKilr4B5l0MC2BF3PdGksmlCMNqdUE5JPN
	+7Ybi2+9zuAE9ZUjXaOp/zkb8Y3WLwbZo8HVScQBjGc1HDDI3+GxrwkX+i8JnMVjddiZ0i5UERm
	UHN3OFx5EOhl0oN/MaYuVes29xKcjXUrYWBIKKNQYtQ4vSX4luUnwxhczLvnXlnwKBv9BUanoFV
	UlfutBn8hjkT5+TiCSJ/UZQFKkSb6+AQnyJdSve0ihrnX4/n+Bs98UFw9/eK+3gtIJhPB5rEQQU
	TovuAMlPbSTCia7EDlcTc4ohkE3dE7RItidO1uo7hze4ueqZ22A==
X-Google-Smtp-Source: AGHT+IHzYq6GWzIf6b3qYtzYTGBw6n+PghC3rAzoIMdm1SgQulh9Kqlg0au1m+bSuRR9JTofx3sYSA==
X-Received: by 2002:a05:6808:2026:b0:406:6d79:49d2 with SMTP id 5614622812f47-40a7c24c65cmr7434326b6e.26.1750107187404;
        Mon, 16 Jun 2025 13:53:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740c2306sm1627122b6e.11.2025.06.16.13.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:53:07 -0700 (PDT)
Message-ID: <ac4aa95e-2309-49a0-b498-2bc3ee232a36@baylibre.com>
Date: Mon, 16 Jun 2025 15:53:06 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] iio: adc: ad4170: Add digital filter and sample
 frequency config support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 marcelo.schmitt1@gmail.com
References: <cover.1749582679.git.marcelo.schmitt@analog.com>
 <dd8a615936dfebb6cd7c8110db2fbe0b81776608.1749582679.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <dd8a615936dfebb6cd7c8110db2fbe0b81776608.1749582679.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 3:32 PM, Marcelo Schmitt wrote:
> Add support for sinc3, sinc5, and averaged sinc5 digital filters along with
> sample frequency configuration.

Wouldn't mind having a sentence here explaining why post filter control
was omitted.

> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

...

>  
> +static const char * const ad4170_filt_names[] = {
> +	[AD4170_SINC5_AVG] = "sinc5+avg",

Do we need to document this as possible type in
Documentation/ABI/testing/sysfs-bus-iio?

> +	[AD4170_SINC5] = "sinc5",
> +	[AD4170_SINC3] = "sinc3",
> +};
> +

