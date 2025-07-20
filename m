Return-Path: <linux-gpio+bounces-23524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C2B0B5C1
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 14:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90C3C3BF2A9
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 12:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39057202C5C;
	Sun, 20 Jul 2025 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6itdLCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7F1F3FEC
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013369; cv=none; b=Z5WhpbWh8YOuBSuf+nFLK3OcfxotaJfo08V4CzdDJ0Lqne9ZOrYvZujQyzKNsKBVpK3Xjf/vITFoALaxGL/LPRSCJlzDkyBxxuOyvI8Mguug2iQHL+3hyDDfi7f1jl9+6dRb5HfTWpZ4M0gAY32oPhMQvY5a82yA/CLNcAEDDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013369; c=relaxed/simple;
	bh=Jopo4UGC0hzZfenG92CWK76ypqMqLd8YZPeM7hLeq+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U337aezmLx0EwmPiATXzv+3ctFNJod4YNKXx/mG6/D6vrViInskHbmjmIDWzUiMxiklQANrBxIeQ00PWx/vb4z52Wz600gSJTh6WQdB0PjnWO3LCsn8eGmNvIP6DxR9nMTc572ZFVSPNW01c4YyMnNrd1/Yfe+Ak8s52FcgSS1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6itdLCq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607247169c0so544681a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753013365; x=1753618165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5dngmF7RxUnwp2FFulLPbgAhN03C1hWVB9WfkRY014U=;
        b=T6itdLCqKknFQlOoQIG+Zx1bcj2CaUq8PYlNdM0T0HPMzvLkAxm0OmpyvPkjzvXZ20
         SneDDnCVBXKpJ72qOeAz1Tcwln/4pWZk8b1HcobeNWRfV+31U5GcbbT0fy37ceIBsIi7
         WhRJzkhGrtBhWLxe+MRbA9+R36sLNlWcJxTjR5dXDNG9lzsB+6RllSf+fmwMiqutV5MK
         0XL1yVfGGrx9c58GVlBNyMT/kBrJDaLU/WP3Y++z+39qR0owawq9aJVs4sraKOz/0il6
         h0gLitAVXEl+goumDrhyvTAdYvM1D9SU15VXEg1Yux9WrmKHPi50BSwqcou8cSuQDQHc
         +6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013365; x=1753618165;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dngmF7RxUnwp2FFulLPbgAhN03C1hWVB9WfkRY014U=;
        b=M/0rpfvNxHrXiq8NdFr9NE+UaddtaFlUDPS1dI9LCjICNtpHK4Vq+BzGLhsOykgVi0
         Hr+k6CHiVRCrgse33eNh+3y1FIMGseffuJoJdjMoV/GAU2jxzpeQlFE+s1DsAMbpvdnv
         W8mt78qtnalcWnY2LZdscx94G6nj3AmBO9KVeXaLXYc1b5gxsr+SLnwi5lGW19vO1diJ
         WUaGnbBcNjha68i/vXN/NpTC9PqzXlScKqTJDJCVSQva+aCBEE1oRWVm0Ti9JpvTtcHD
         4ibBiAT9h4In2BLJC9JRuFK0ERM/x58RfmWRMopPomnFArZysKNAc+bctHudwF6j1Rxn
         6W2g==
X-Forwarded-Encrypted: i=1; AJvYcCVX2Bci5jC6nojCx9LJx/oFP3ihuezbHkpOGLaY3kLwDRR+f7HTb7BY4vo0MifE3aMDZdYpjKSk/DZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGBl9onz+W+op8w4JKIqu00lzKhFJgx4hOHrt2n2P4YZ9+JdUr
	WJiaRMObOabTskgzvgp4GQ9zyBwmrqHvxGe2dispRHMsZupXl9+Pdx7sXisYMZJ+Z8A=
X-Gm-Gg: ASbGncsSfqseVCGJ6uLxvoCXLzU2pVDsgJzfW/G+xzGuh5iU4wfrRSwZOPH4GFiBUj/
	tN8ZFjJSPmcW/ql+QUgNmq9pXPHZNGw8SfygHNUaDttdnLxhkeh8gdFKYRq1h9ndGSSX6pLXgIU
	Q/1Uai7gXX8qjHUpVv46Mycnl7GSe0eaEno6ibGGKkHEsEwALovwYrLleilqtkcDDXc+91imHzv
	nrg8n+Vc35ZEkXm45inQrCKqGAs9kkT1DcdKGGGVoSjEkf3mrLN5Wrp7B9N8dNNEwCf7IvIrEjK
	vyBJXarSNjq9J2L0c+01BYfOByg46Q0wueB8iNm7A9pKq+m0nUCRxpWakSexfuR3IdbLX8igp2F
	QTDoidQettN1pKXciI5w1hiq+ebqQPdUS/8+WgbFI+A==
X-Google-Smtp-Source: AGHT+IHrzefygyqO9fMmkmrMFf9WOiacpbBxnamcgRCXplTdrv6UqBqckrEEpwbLnx+lw/ADNTQtQQ==
X-Received: by 2002:a17:907:3c8d:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-ae9c99ed384mr626193366b.7.1753013364927;
        Sun, 20 Jul 2025 05:09:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cafa958sm480360466b.166.2025.07.20.05.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 05:09:23 -0700 (PDT)
Message-ID: <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
Date: Sun, 20 Jul 2025 14:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jan Kotas <jank@cadence.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?=
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/07/2025 03:09, Harshit Shah wrote:
> On 7/17/2025 11:14 PM, Krzysztof Kozlowski wrote:
>>> Hi all,
>>>
>>> This patch series was reviewed by Krzysztof, and I am wondering if it’s
>>> queued for the next merge window. Thanks in advance!
>> It's not, unless you received clear notice about it. Please read
>> maintainer soc profile how to send patches for merging.
> 
> Thank you Krzysztof for the reference.
> 
> We went through maintainer-soc.rst 
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-soc.rst?h=v6.16-rc1#n73) 
> 
> 
> It mentions about the special case where "Introducing a completely new 
> SoC platform." we can submit patches to soc@kernel.org directly.
> 
> However I see two different points in the doc.
> 
> 1. Submitting patches directly to soc@kernel.org with email
> 
> 2. There is also mention about the "Branches and Pull requests"
> 
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-soc.rst?h=v6.16-rc1#n186). 
> 
> 
> I think if we need to use this approach then we need to create a new 
> branch on soc and create a pull request based on the same. (with the soc 
> tree[1])

You do not create branches on other poeple's trees (like soc). You
create branch on your own tree.

You can go with 1 or 2, up to you, I don't know which one is preferred
by Arnd for new boards.



Best regards,
Krzysztof

