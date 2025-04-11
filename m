Return-Path: <linux-gpio+bounces-18717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE0A86880
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B1337B7DE5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 21:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12A5296143;
	Fri, 11 Apr 2025 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KPw48yCz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8442A9E
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408188; cv=none; b=Jr/f/IFarRLyGMLpg0phBZFJtjKva5jc/3rLdCkBZtWxN8KtIdROhcqeYagADih0PnNuypbVvom91ISsv8Pg/sfU7gT1D+uzTJAAr18ARIeRWoEFBoo8oCNlKjVe2XHj9HgcvU7mrGOqhrESeLQwCqeMyCnCkYDOb1ugQnqpiKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408188; c=relaxed/simple;
	bh=w8axWvAzoBROAbaKa0HkkEJsDKW2aXtxlAmzSHGwG6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePiZf/pXen+GL5h34OvHLWMvEccJLbiRM6u4u14UjGCN4ETDrvA4BkeLNRrxtL8vVLFloRX4gS+2BwTLYpQGx9Tt9Htag5NCCx60cCIvbZkYkWp2jJOklIrOG2R1cjtfx7/5ZkVbIP2ua8TF8OzcmFCJC4OyU7aM7teJo1hfAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KPw48yCz; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72bbc03d436so1474969a34.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744408186; x=1745012986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYQrJT8juYdQFZjLx91E5kJsRhGDw+hb2VRtHNdByeQ=;
        b=KPw48yCzjt5FABhrn6b5ixkhNLaBDrWkixTC944vauDRdVKUdL8lF41NuJAtZ5hZHv
         wrHoyI0wcl2IRTiTbAwN35WTOy/iB+BKXQrV/EURCj0yfl04a8Wex+Kao3ecXfUD1obv
         ZLt/gqgNfNk+roW0S+6/OUvByO2r/4u+fJKdJzB6ca/r2g9n1z+9xNq3+P9UnUgeKRQ2
         5ulWZdQHvntxD70VufDiQDhBpHj7tNyZoolZEqmund+eeMEkrNXZQ8lcMGKLhG4E7hza
         IYiy8jtojwMmJHQHO20UZ5figgjfHONgcjAWc5Vm06HKNKXgQkHia+CAl+SA1+uRmvAY
         w5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744408186; x=1745012986;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYQrJT8juYdQFZjLx91E5kJsRhGDw+hb2VRtHNdByeQ=;
        b=RPhu0DyEupzJgsR46YvvtFc/yczYEdWiAR3mUQzRjImgompvlMQdDfwpZ9+PbyHqIn
         vJqnSyamjSWyk0oh6WwFdpbhBaTzHX/zfGvCalSa5mUmPOvuQzlWYWICaOSNgfYosRxN
         3/EX+OZMM9+b+ND2dd+gbPp5FaoI+W20X06dTiV+46uL1ZS13QBLyq0DcseND0CVObcJ
         D+/BS1rvOQMlw0ZSXVY0xMUwyJvOg6PyUwis2sVGfZPbxp8/L49ohssI9fpiSSIgH6nN
         sb5rHb3TWEbImxGt0GzdXeNxiGU8itO1e5tpNepL7pyDNoXDJ9Sls48w7HM4zd2KZOu4
         hBhg==
X-Forwarded-Encrypted: i=1; AJvYcCUf3YotbXk+skiBebJCukwklxdXxgpQMBO9HU2aCoGImp+Sa9xjuSt7gr80W/vucgMKxFIVVCOoA/KN@vger.kernel.org
X-Gm-Message-State: AOJu0YzYjE8zZ74Rz7zQ7Ek9qjTJ/0JLWs0CDQmOhKVzSgnSfacDgL7/
	vDuUzRUx9B3IAFCoKzImn1qJ0LTRECankt4B7CDPLFIc1e3zSJY9mOao41kzzzk=
X-Gm-Gg: ASbGncumnePgdirBrAzhVIZcCAAGNZECX0phKPIEO87LtI3puUQvZEGwy0uAR/LLKxB
	rFaGg5jeZHS2WROQCM+/FEiX44P97M+MQ5ZrGeA6owbWfuL6C4H6HBg5qYDAKddh1eNVltwQarf
	/PcKeiBZ56It767yb66Fv9EeAeZ1+V5H/Ke/RZoWzont8SImRE80Bkd8BzHbsLku2viXYIPM0zw
	E2fOsIFsOK7BSvTvOkDezL/SHys3+2wJxXNp8+lYfF2zET0Jc0tk9Ouqs3fA4Jn2FPqoH4mc1+Q
	7b6mc5rEQe4kPgHGOGaHxTqvi4PB6Jx+OStHfOCLSJzSIRVjIIvpqQG4XZcddDrFqC+cF96W+KY
	fzq3/d43FhcX8
X-Google-Smtp-Source: AGHT+IHPOikh3UBhCXlw2AR7oEw93OGdTXiRotETPFiFy2ByOFyfOjXNww65p/TJmOhJE7ujAki41g==
X-Received: by 2002:a05:6830:2aa5:b0:72b:8aec:fbd4 with SMTP id 46e09a7af769-72e862d8597mr3308938a34.3.1744408186078;
        Fri, 11 Apr 2025 14:49:46 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8acb4sm1103733a34.29.2025.04.11.14.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:49:45 -0700 (PDT)
Message-ID: <341d3eff-aa26-4962-a357-256472622f34@baylibre.com>
Date: Fri, 11 Apr 2025 16:49:44 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 10:56 AM, Jonathan Santos wrote:
> Inspired by pwn-trigger, create a new binding for using a GPIO

s/pwn/pwm/

> pin as a trigger source.
> 

