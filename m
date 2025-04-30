Return-Path: <linux-gpio+bounces-19515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD4CAA53FE
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 20:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD169E7F45
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 18:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35019274676;
	Wed, 30 Apr 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZtV8bycx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714514AD2D
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038611; cv=none; b=EZDnRZQ/yHATTU2kfUxWtqdVZLfSMSLZ1pUVf/aSX/5RJVwdT3nnIwRBn0KGgfkvefnyAxd8fLwsLMnjKuqK4GwRqkOeSNlDCLbtmZUK/MMNmHI9weS9cr0c+TUStyJL3Hr34RWNuciIswwu+SJfdVzy98XaxnhWfhZuwxhS5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038611; c=relaxed/simple;
	bh=Pb/efMrKg4+HQ6/2NfMbs7Yh7bxImHsK9yrL75Whraw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0I9ZtYdpBxt4aaF0Q+6ySvRUgP2eLQzozTQMS5gc03x22LKRJNART8sCpb8mWhJn8oLgYW8lrIVihFrVjkzpUOj07fAjGRWM46VQ0pRpPxYeryox9Y6VVGijUP0ay53yD4aRO1TzodCMh5DapVqeoqvALTbDwE8zDnbw5QcQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZtV8bycx; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-601ad30bc0cso877835eaf.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746038607; x=1746643407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRXIk2lKOYAihoanpH8QfdOUyxAwjsmIpzrb0u3+vUw=;
        b=ZtV8bycxyMd8Oo2aCtRDHSBqDpXEvKtPS13YV11fWJNa3apDicwVUT33iToiV32Jsk
         L6lPAP8s2Wox4fHf5VRJdPRnjBKE5zZJIQWEpaH/K9OqAM+27TuIbcjfGDRE9GfwfXRy
         FFcDh9TjW6VINlRGFLjV3IZnk9q1NuiZ2UtYtLywb4BxvdtQluuy/XudfUZBbksaHufi
         CEdfGBMLgCQrEgP+/+DTTAQfmm5dlEhQjNi21Tk6jTMCb/tLsBGd8fwi+AVs1VIVSBvk
         anhdXrudaY3V2uzuLn4fDzVwgD/DvVHYpuYm2fsafeNymG2ADng+oIUX7Hta/viBOWPY
         +coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038607; x=1746643407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRXIk2lKOYAihoanpH8QfdOUyxAwjsmIpzrb0u3+vUw=;
        b=ZUgtCFVarK+DKMXpNd1Sdxs35xjO/0qOw3GN2nSUeheJU6ycKQLQ9wBg+x1MvMRDEx
         p1iC6aWrq57mrHWF+rafaO+Dt9B5fe4LtyuMvGeW3pe7Admw/8nRXkAHKxucLtLK5IXC
         TPs47oMtWJuj5FR80XggU2h/gytmx0EwabZIHsk/SehtW1xovAyhAQH+RdG5Zc2lq8+L
         POBP9Bv9voWkjsvp7K9wL1ooYbJcMgscvUlLH8Cto6GIjpg1+4xmhLJPPl8JR1EsU+S+
         Q147ZyhVjDYukQhWDJpvRlUlmwvKchWCmf/YqDWLmxzBCjjBfIAmKZwdTzLpHlnDeBvV
         8/3g==
X-Forwarded-Encrypted: i=1; AJvYcCVBZBDz76e1yXgoEWScyj8V/xyUmOsSu9PTWPZnsPbFyh4YabDVVjRDk474HzGW9ZCa6HMxhDn06570@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDlRlakgHBC2Rn0AMNgD0LL4vUO/F9DSnp/IKzZUIwpgzxSc4
	oPVlH7H0Qu2LxiEGN3c6LHlt6g1OTPmqFFSxJfnqasuuqmVUZ+O+xJZ8bbvVipQ=
X-Gm-Gg: ASbGncvawcjk71uDCTofGGHAgzp/e4xDD103Ir6ogI1LRedQKg76138j3vhKDTmPXbr
	R34n7sJT9FMfNr8PEO3+KnyB3dXNFWz3dqC/eNVqvM1cmvmdHBeSPvV50+pEJybK/CuRR8XwL67
	8GmDpEB5EFizq3eKJfyzI1M4/6HDiAUl972Ts7DDQFEiYh6BHONk7BGG4QZkAzjSQdQ0UjOBhw9
	KZ/Kekve8pinKs6rQ7TUrXxYTFCugRV+nuflcpg7ilx2DqS+NnYXJKsfcKz+doVYUM9IG7ZfZO9
	sKTA3gjS1gtBuruaT8OI+V2zplaE06GBVn1a5qbEHSGQaukpfTMjzcaLclWIueYI2PQvs7HqR8E
	gdYW2nKNyNhMC2l8=
X-Google-Smtp-Source: AGHT+IFJ7NsTI0Qgevug+avxKfif9V5H032u+ML/0KNagUrHEeVV4ThgLTtzw4bhB4wmXUjY6rLWXA==
X-Received: by 2002:a4a:e843:0:b0:604:99a6:4e90 with SMTP id 006d021491bc7-607df5e5f9amr353602eaf.0.1746038607385;
        Wed, 30 Apr 2025 11:43:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:359a:f1e:f988:206a? ([2600:8803:e7e4:1d00:359a:f1e:f988:206a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60686e96dddsm884171eaf.2.2025.04.30.11.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:43:26 -0700 (PDT)
Message-ID: <996aedcb-f4f6-47f1-a818-ac89de0fa459@baylibre.com>
Date: Wed, 30 Apr 2025 13:43:24 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] iio: adc: ad7768-1: add regulator to control VCM
 output
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1745605382.git.Jonathan.Santos@analog.com>
 <8a04f8f1e9c14d57b1db2f38a8433a0367c0c9dd.1745605382.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <8a04f8f1e9c14d57b1db2f38a8433a0367c0c9dd.1745605382.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 7:13 PM, Jonathan Santos wrote:
> The VCM output voltage can be used as a common-mode voltage within the
> amplifier preconditioning circuits external to the AD7768-1.
> 
> This change allows the user to configure VCM output using the regulator
> framework.
> 
> Acked-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
With the issues that Andy pointed out addressed:

Reviewed-by: David Lechner <dlechner@baylibre.com>


