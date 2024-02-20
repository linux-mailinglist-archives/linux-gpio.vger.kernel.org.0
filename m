Return-Path: <linux-gpio+bounces-3482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900A085B522
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 09:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A48E1C20D7C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60B15C903;
	Tue, 20 Feb 2024 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8DDGgBH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9A5C8F3
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708417725; cv=none; b=mBXYvBqFCsJYPnV4wlgKqnCVPoSZc6rWm5UKYACXQB88Z3Ga3I7GQWk2wm3korQTcj7n1p/tTtm38/5SYflLtXzFqU9ofRJOxXQlILf8aFMIMFCf0NCcDjXWhfAvgSPs+Lqtq59GQqdgDd2bbrMJh2ewQAvSLQLUxKRM3mWfiAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708417725; c=relaxed/simple;
	bh=EzBYJYexz/R7qydxMo7SSbDoihFTE9YS3BlAvcA9ylQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLdWdL2Ls32vjzSwv2MP+JIZ3vc+irI1yHzWHvTqgOUdv7MeE/ZZFmc0Kp34hCqxx3455xvBcgoNQRHcWnEqIqbn9wzp39DHe+um0lZQ1fxKAVZM7ZeKgJYBQgGf4p3ZMF7cnpUycZaMyuSXP2t5PIJt0y2H6btNtaMaXsP8f1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8DDGgBH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4126cff604bso4694785e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 00:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708417722; x=1709022522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MLCi0s2a8fWThVWbSeoCMwkrcUJx51WlIXcaXYg5fk=;
        b=g8DDGgBHXhvtqMmUwTK8WjJPD6DMOsKsHzylGoDMEynNJFJbCUI8Au95tlutHoQ+fY
         2bnSmtTjmKv6Cx/kPk4sNjwIg1cnhFqei/tdhDTOQVjl2zx/1cdechqj0cZIHbHWiOXu
         6l4YkN6fe7AbNavO30uQ4dQoBC8U9uaPMldpoxc9N357MtumCTJcRMzMNgj9EVYpCqPI
         8ahQ5+cD9xiZW209LVmO5WAu5E4aNnxYbfPRtYbpJAVuNpvNZU+QOubSPtBC/jrh/3DI
         9raKGMOFbgVbVpUwomnEcZ/82bXjfzCq52ZgUEMZVWMveIWw8axcQNOCNyQZ7Voyj0MP
         4gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708417722; x=1709022522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MLCi0s2a8fWThVWbSeoCMwkrcUJx51WlIXcaXYg5fk=;
        b=qF5AqgEAR2+S+8To8YRq/63ALlvMipPofuK43xgWbrkAlDSRpS7IO7uYAedic+Lmln
         PHGGapCK/ZcQGmeNCMfzdodcZjQzN+LKBzlqlUmj05yn5lW3WrpwlnkrWJhX/GyzclgI
         PEpy2yKZ6mjjMsC640aPZ4uJMcJTRBq5vEiZcmwx2V9rFZxEevyXJLmtFvG3/j/htS31
         DM2TwIzq5RMXmfbTdMVWTEaW+KTQZQHcNWm1FfIBQ/KAXTNJpaswH0s1nQ24a6l49ORq
         ulQdkFsRjrZZUTTH38vkUuXP+gks+DV5OJptppIEdgg/1VNUQzg6DRWuJVLQQkxzwFet
         5bzA==
X-Forwarded-Encrypted: i=1; AJvYcCUSS4ni5/VsGJ/Obg21xdx4/LprDHUJhxeppWinP159nRbOr1JNla8JbsAiIL2L373vlwtw15z4UqQ5fCCq/N+bPL3A2hQ0vfZfhw==
X-Gm-Message-State: AOJu0YxfQARfzxz02WaTSntD48Se+VMqlgAGcWFpbLt4tFwYNbOgBreZ
	Zqv/YnDfbCuEQJ8wDNhh0WNW4+eATnGYHDV7wt0x5rVph9Z8ELVRoaDFYGLK7DA=
X-Google-Smtp-Source: AGHT+IGo74P7nUZYWJ+oeJU9HEqF/cs2IsJIyQfohwej4deJHSLY1vQ6vvoY9GE2up63pJfNilKt2w==
X-Received: by 2002:a05:600c:4f96:b0:411:e7d5:cc5 with SMTP id n22-20020a05600c4f9600b00411e7d50cc5mr9420809wmq.4.1708417722242;
        Tue, 20 Feb 2024 00:28:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id ay23-20020a05600c1e1700b004125ff0b572sm8943595wmb.8.2024.02.20.00.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 00:28:41 -0800 (PST)
Message-ID: <b40f5b2d-d41f-47fa-8aae-30290e0d2737@linaro.org>
Date: Tue, 20 Feb 2024 09:28:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO
 driver
Content-Language: en-US
To: Jacky Huang <ychuang570808@gmail.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20240220004159.1580108-1-ychuang570808@gmail.com>
 <20240220004159.1580108-5-ychuang570808@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240220004159.1580108-5-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 01:41, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add common pinctrl and GPIO driver for Nuvoton MA35 series SoC, and
> add support for ma35d1 pinctrl.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  drivers/pinctrl/nuvoton/Kconfig          |   19 +
>  drivers/pinctrl/nuvoton/Makefile         |    2 +
>  drivers/pinctrl/nuvoton/pinctrl-ma35.c   | 1211 +++++++++++++++
>  drivers/pinctrl/nuvoton/pinctrl-ma35.h   |   51 +
>  drivers/pinctrl/nuvoton/pinctrl-ma35d1.c | 1797 ++++++++++++++++++++++
>  5 files changed, 3080 insertions(+)
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.c
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.h
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c

Driver cannot depend on DTS, so please reorganize patchset so DTS is not
in the middle or even split the DTS to separate patchset.

Best regards,
Krzysztof


