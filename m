Return-Path: <linux-gpio+bounces-9113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9749795DE68
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5492B283142
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F280C178396;
	Sat, 24 Aug 2024 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RDf297Dm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FFF176AC7
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509971; cv=none; b=ZHjM0DOVvwoFllm4nnuSnmfQzEnwvTfMpAsRjAm7qRQf2AZnOuqlY79L9LhUGCFy8aPNtq+pTHrfKQz2d5+sTnj5VrnLzxz8woP+pzVLT4MJpUP03aqeLmePXB3xiZcHC4GUmqI7UYPTxaD+nwF8CfdMYmSfnqGhNqVSKWNIGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509971; c=relaxed/simple;
	bh=1PsfB+rHrgqHbrQN86fjVZ6rZhaJdcoXh66gjlAH/F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MC8Qxnxnk0nZbP2vafzSLjYH4b7BoCeTvvRW9RM43aZ+6hxRT9Vx2MIs/srOdrqTKkuwdY+mUw+GoO9k7rZWwmtFvw6VDLiuLgxa2KGS9bTZKDsfFLEn6+KVYVZ6G1Lkuw+9SBeCKtW/Vip8JRi1QxM4ZW1l9hSoAWprTb2DnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RDf297Dm; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso3588064a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724509969; x=1725114769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/TVnTWQZLeuF1YlGpoUoliOWJccvcVuCE3y4qrw9zA=;
        b=RDf297Dmv8sOMnWnnTeaZm6sa6JICwDvf3YtcdqFEYX6gfTFOlUzQI8VR/FLGThwfS
         5Pw7ajvU4yOHaQA49HjJ01IWPt5sK1i6ZcL45KCVD58KND/YYr2N8pc6Ys62g5HHTFTH
         yXP7cdkYWQPgtUJXtNujNIxKRfOZ1kylEuVCaRtG1ifIWY356tyUMtAYmL9cd1o88U28
         y053odkIodhTCrZP8loNMxytXVc9/KiUgBm1YxyudGKHYopd4JojaJhBh6tjbiDzjBTY
         TIKgxyVpNTrui9Fcjyph0RlhdE2j4m6AlFg8OU1CtxqynNy827VdifqXQ6Q0fHSa9auk
         ZzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724509969; x=1725114769;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/TVnTWQZLeuF1YlGpoUoliOWJccvcVuCE3y4qrw9zA=;
        b=RIutVnqI7yyqAC7+oCCC4+rNoLl50rUwHp0TyXh8QZstdsbRNzV/lnFswzO/ghuzw+
         wc6dOKJrx1CY+uV0QvQmr4LLeXYyt+anq8ilT5W5RZp9cXHDVwXOBxkqYPe4BG5ee89A
         wU5+0y5lMJL0jMuypEFljAmYckHEmZKfpxb/+FrdBvDNSzyskRJn9NRnCVKwK8vbfwcY
         QA2bXp5L3qB/snsuCn4MD0xQDzX5MKKVYcA75Jxr0CVBO5jopfdalV+w3kS7n7sQwLSd
         rbO/jfXcoW3yHrhaPie2WPLoDIKKprZvsO+GewDElj2cREDjDfOQSBkonsxee+zHUVZt
         mHMw==
X-Forwarded-Encrypted: i=1; AJvYcCUBj3TqYZY7ikeKG0KBXggHUirUctJQmyw2Hqipnn0vsu9Tm0WFgbw8VKRGMfDajDWz9E9XowUVjtwx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LF937VWmd4iyxC0FYKI+TaW5otU4fhPiRjdVfpt6v2MqcvfR
	NsS+m/WpYTYjI3c5KVsw+h/4ThgJnafCRDIJ0v+ce9KV15IQQqwfTt4HtwHrRzg=
X-Google-Smtp-Source: AGHT+IHbxK6aJ/f3L9Ar5x/8h6TtLTBqamTkvlvejj9FPZTtGh+zJ2LUqF9K0UiRaNvGOd4HXoT0WQ==
X-Received: by 2002:a17:906:fe4b:b0:a7a:bae8:f2a1 with SMTP id a640c23a62f3a-a86a54899f5mr423380466b.42.1724509968522;
        Sat, 24 Aug 2024 07:32:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f222b23sm413681866b.19.2024.08.24.07.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 07:32:47 -0700 (PDT)
Message-ID: <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
Date: Sat, 24 Aug 2024 17:32:45 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] ARM: dts: microchip: Remove additional compatible
 string from PIO3 pinctrl nodes
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-3-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240814061315.112564-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.08.2024 09:13, Manikandan Muralidharan wrote:
> The driver data specific to each pinctrl GPIO bank compatible nodes are not
> the same and declaring additional compatible string as fallback has no
> specific purpose, hence, removing the additional compatible string from the
> pinctrl nodes in DT to comply with atmel,at91-pinctrl.txt documentation.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to at91-dt, thanks!

