Return-Path: <linux-gpio+bounces-18163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF3A78101
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 19:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DAB3ADAC8
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 17:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C7120E309;
	Tue,  1 Apr 2025 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dnv9sZxA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D520D4F4
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527113; cv=none; b=L96cato6uF/H66sJvB2TYR1QVctj/wvt+kN8NEX+BbiPB0QjMuPZwsRQ80J2ngKvFFlENo7oYWMUhK145mxz2OFJFOJzXhycwxGOFgh6cYSi3ETL6+mTRfEw71ag8G3OL8AU1KurGATL/Hhlr/yyy3UySV5m/61sif2N5eIvqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527113; c=relaxed/simple;
	bh=aGC9dm6KUtiiQ68RVH7jvL+r6CQi36l1rZPcfEThsok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7MwnGm/ad47KZmtVtzFXCx9P+RtiEnBV4zQ0mhqW2g+Yt9NUHD1raNMW2jPJznHjirBmnypcN0qyiGbLgUkvhvQIUNx75QiFKVWy+BY2LqDFxMhlv1lMSAx0ps1Ys6HUFwv/PX7Zet2+y3LSRjgF3N3JO/VsHWm7PP1Ww6t4hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dnv9sZxA; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fbaa18b810so1809165b6e.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743527110; x=1744131910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GHNg+GZR1xh3puiq8oEcYCi8euQPRHec8+8+bjsNQ0=;
        b=dnv9sZxA4Fbtq7LdaMS4xRm7tsqaxKj4NjytCh5QzWIELI1bthtiByDtOlxGXjZkyT
         yK9E05l3/Z3h7AmEFCDtZfyCdsPBqW/pZD9OVUJ76GyzwDLQXG59b+FZTDszw1Ot4TpJ
         2nBAFaTuJwKTtoTWDQ2lguABp7ZieQ4pKJzlDFrZ/5AMW/zGrMB4io4Gg8ZALMSvvibJ
         0WZFuHR6cKu6BpR36PcZhRnxujqcKVfgLCMqzE7BMJ4/fpzy4YYkLlYUP5Pa9P1GthxH
         XybmCVqHldrPaasUoLN+N2oM+aMU4a2p8/9raXDLwznu2+6hkhVy9HJJY5EmibWbZ9W9
         zdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527110; x=1744131910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GHNg+GZR1xh3puiq8oEcYCi8euQPRHec8+8+bjsNQ0=;
        b=EYsm+RqJrlzLXHm3/fmG4HuZua5+iO3EQ76GdmL38PEWqa1uTG3+doJ2tLrsWmfrf7
         mpvKU2p7R8JehjAM7zMdg4n2h1cHR6fTWdBlRdPucEurqUSrg2NWJQLWLkr2vHfoGKLA
         5hDV+JFhyQNnutqixEu7IPk6Zsl7p96nwCQZHUygzqhiyAyhV5mKXfNGH+KBbqjKtTl6
         nGepU/2EGb/5GMSfozOlsjjfmkeK6CMQ1MoK5vY/idZQJajxd0VIys6dTHLfXP0/ExhD
         ewC/6rrcD2VHmn/gjx9NV3k61pMVHBbDI6QNhyB+lOBuRO/ONDz9lQHQkjAFlQeGNnJB
         Wh4w==
X-Forwarded-Encrypted: i=1; AJvYcCUhn1ExNEyMRrapCLvsGypOXrwx1FatXaPUShmHekGSSJlI3TKed26K2TgoBL+cl94Y4Ews9WvQQfO8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HBJLGtVNHt/d9x+fo9fmZwVGqRzBUutslY9CKhwiO1dW0QI7
	fef21IyRojvwt2jtz9ePcIBSb79+v6Dlqr9bL0/iDz9iKlHRNB/YH813P1uFi30=
X-Gm-Gg: ASbGncvCuYSmU4Dfki6a6CEr8EKUjCSnMfkwlvo7GpGDDySmXEm6wTP5wsb1QZFqnsx
	dS43KTmlMC5LKYFcaqAtvCrGnRbB8JdQiT8gbGigjjAdjNliqtOYzNu/Keq4tS10cbFpAotjGSQ
	M17eMQpUvm+sP/DSemnCNOV3Z8N76JFv610PYXupBhZJUqr7k5gxorQw9DlhULFBOR/OvHb54eK
	oSKV0tw3tDByTnm/N2tzAR8l48jXkfdwWlYsuAfXFZsd0XJOQfzxJvx9FOqlCjceo6jAQSzFRan
	XgAUawopUPhKERaAu0R15GVSQku3w0f8BtLhuQ0Oa4iIm7TuBKm4xJPNF2qFds4grMQaof9mlUB
	mauG94w==
X-Google-Smtp-Source: AGHT+IH8zT9NfafTp39gA7w1GuQhxmWEGB+Q5BcMBLrZm7s6gO5+wURUfgUr3IvdChYZ47bg36HrsQ==
X-Received: by 2002:a05:6808:151e:b0:3fc:11a6:7433 with SMTP id 5614622812f47-3ff0f637b5bmr6831543b6e.36.1743527110260;
        Tue, 01 Apr 2025 10:05:10 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051aaf60sm2022138b6e.28.2025.04.01.10.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:05:08 -0700 (PDT)
Message-ID: <df59accd-76da-43bf-b52f-8ef5de0db060@baylibre.com>
Date: Tue, 1 Apr 2025 12:05:06 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] iio: adc: ad7768-1: replace manual attribute
 declaration
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <6d429bf18851e9e423e90252d351db550b2da536.1741268122.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <6d429bf18851e9e423e90252d351db550b2da536.1741268122.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 3:04 PM, Jonathan Santos wrote:
> Use read_avail callback from struct iio_info to replace the manual
> declaration of sampling_frequency_available attribute.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


