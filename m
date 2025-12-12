Return-Path: <linux-gpio+bounces-29486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A05CB8BE9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 12:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DCE13043F5C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 11:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3382877E6;
	Fri, 12 Dec 2025 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIcYaKp8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073729B224
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765539999; cv=none; b=J6H2jhc3UURrysZWxsQNTmuVpWnoalWVmFj8HYACYuZjEJ+Q73aVZhx5rq9TUVPcsLGSKDxXUBrGEEhNf3IKkQD8GfKSuoMN3Q3i8IHym42e/dAap0pKiG9YfSJS6TsTc/fWRQws0zGdXhprWjWunvm98bGn5eYiuVZZ2QqR0uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765539999; c=relaxed/simple;
	bh=sXo03spb+64sVluQ3HnVV/CmFwHu6V/cHKPYeIo1fuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAlE8D8GfXPxC9SJxrWI6seN+NoyZYlA8ehwYwEQgodlrXabT6SYbUDAE7jjIGpdzEi0g8CbZ6sn8ccex3pX0pC6/uiaQwaCeNsVf5j3VZYmWf/hbS+UObONJKeT3d2RBB41sgeMB5DyHOnvFxGkmXqgHCsJ4+649MlhzutcLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIcYaKp8; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bd610f4425fso677486a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765539996; x=1766144796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z4GMPobD7IxP3ob9nUYxNPU1e+JR9o/OtQgZwmUoU4Q=;
        b=PIcYaKp8DcmTbY4uPFX4Cw9r10nl0NsbGcz/dM8IKdC6TtlZjF1PuISmygwP6HjsG1
         WQifnMDHTbYyxsYX5u0fq2Htha/IiH/guVhPL9fT2ArTcvVCk16J4jycEdUq4kjW8YZ2
         0mD+NMmRpJ1ZUO9WqQN9jgeYHfhQm10TTvVSwepvG4bbPiSOR3FAQZ9jn70C8Ftjn7T2
         wB33fuAJR6/BgGFVED/f0HqlOLau+cDzkCvqaOou2nebNlkuSfbHAgVwwa7Hi2AQ977G
         Ttzbszg2MaoDr4N33eW0WH4NaDXgLS3tXWmKHwjoS1OSUA+RHZ0C84xUzAmH98/6JtDS
         CMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765539996; x=1766144796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4GMPobD7IxP3ob9nUYxNPU1e+JR9o/OtQgZwmUoU4Q=;
        b=CYPOtQGYK7V9/Dh1MbmD2008MXOVce0ZpImBWs++dJTh+LhaZVR5yUfAIYxyMELinS
         5Dn9DUpynXfBiC+JBqrYMIaXbIWmxtvBNoat/sI5kQ2kiLZ9kfB1uQYdNXpALLeM3mT+
         N9Yk0IonUIRJEkKYFnk5BawEX5FldJb+KG5IiEQ3KYsS6JTm1YniqQJNe6G9QV0GJuqv
         mFB4C+yzKKIvfAcmmThv5yPieiyTpUcOc2FG4uibjvpWPGbzjruefnt1c+emzVWjNeWi
         TNdb916BEhD3i4SUC/cFru3oHWpFP7iLRoSIxTmwFrBdRMNwMcCz8vnyHsqsKk9AEqwb
         A1sA==
X-Forwarded-Encrypted: i=1; AJvYcCUlMwDByGGAA0XpRQmX6xBCDOwb/pmHtNUJus1XvsHHD+Rlf/wmopV08KfvaxSGwXiCLfCesre6M4KF@vger.kernel.org
X-Gm-Message-State: AOJu0Yytbh3LZSyNVihOVq1pfFfnkY+GIRVfpA3lB6tps9k+iXT4dXUO
	O7XDPW4bRbK9vDW+5tMpS0SEW85l6G9lZoV6BHpi6XqkUv9lppqfQT1S
X-Gm-Gg: AY/fxX6Wnuk/5zkSt3sUuKtWBcwqwGwqwxloKMZLPROVUxuzP8IpXfhEeWJv0nbidFX
	tSi9a3br0NKG7xs+HWPsRb0/I+v17yVGugy3mn4d3DxSRgqN/zRvJo/gUE0ElrUaUMBXej6E2NR
	RnQrRfGIPvTgtBnG9aqmdjlsUbov8eJs4vT6wcX5RFmvPN3bTjyrZhU3dJiNc5vqkFuC/Ry4rnP
	w8962zYTvcFu4+8si/Z5+QKLXzb02DgHh0qLTEdT3iUboRm66n+ihAocvWO/vWjLwaCrzxDg6cw
	2K4DV0vM1QAAnoh+nwV0wM5miiXcS2dZfIyZZHuihaZF56HtNJdgx8YjXyccZ2IgQDKpRjBcNji
	Nq97kg3RZ0FJCV5Y9F4I1rFPUZBIgLncJUGQ0F0XTuN218314rkgwD28w9yhKPohq7NPLo1XAoH
	oYjTeD106CzVvTqecvpdU+Q6PCpPEnrCoxADOIavoJ9zjfg5SHdREPXwb4DoI=
X-Google-Smtp-Source: AGHT+IHR46BSZtOI324yzAFj0w4+1e4VNfwgJW+ezGfESsq+Vo0qiOYkxIP4b/0EpEPMS2QFY6BySg==
X-Received: by 2002:a05:7300:7b16:b0:2a4:3592:c60e with SMTP id 5a478bee46e88-2ac303c944bmr1236445eec.31.1765539996404;
        Fri, 12 Dec 2025 03:46:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190acd01sm14309187eec.1.2025.12.12.03.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 03:46:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cb8031bb-9213-49b7-a85a-5ca9091aee5c@roeck-us.net>
Date: Fri, 12 Dec 2025 03:46:32 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: watchdog: Add AAEON embedded controller
 watchdog binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-3-6bd65bc8ef12@bootlin.com>
 <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/25 00:20, Krzysztof Kozlowski wrote:
> On 12/12/2025 08:41, Thomas Perrot (Schneider Electric) wrote:
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    watchdog {
>> +      compatible = "aaeon,srg-imx8pl-wdt";
> 
> No, that was discussed many times on the mailing list already. Fold the
> child into the parent. Your driver model really do not matter for DT.
> 

Theoretically there could be a 'timeout' property since this is
a watchdog driver, but that isn't supported by the driver, so
I agree.

Guenter


