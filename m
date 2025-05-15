Return-Path: <linux-gpio+bounces-20212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9AAB7F1E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 09:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67551BA5E57
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 07:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3851F0E50;
	Thu, 15 May 2025 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBpWSsL8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A417BD9;
	Thu, 15 May 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295145; cv=none; b=baoxgDmICqPWRWfNhf4KT2IW7lPhtmv9UlF+gpJkPaw4a2caZB0+uNXi/ewIW2BOJk1vYqzw4DJhm0LarRuVmjPz0UqDxhG2nFdm9DDrGj5KrZnxSSzQycuUUsZ6r5ISiTmClC1UaY8B7LcwGZUfQZd9nLh9jROJikLm7RtEDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295145; c=relaxed/simple;
	bh=FUTGQUAOkm5bi73IlMsoeSedRcN4KCV84hEa6dEH/8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soaTtzs3dWlcm1uu2x96j2lHKmuwoMaGQgV3QTvJN++TZhgottajAsJO0OX55hoDj6A7Yd7hH0IdByq+ITkooWWoZLMv1nk5z9QNBcN91E/CT0psC4e9IDPEvcuM3hgBhLZ0YA25RfDMd8vZRbJKvZWsQmuNmkHUQ7o8BorhAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBpWSsL8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso6446165e9.0;
        Thu, 15 May 2025 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747295142; x=1747899942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ji/KKSHoP7yY7aJyBCvNgq977Um77Yq/cN+M0anXeoY=;
        b=QBpWSsL8ZxthIO6ryC4ulXaTHIYL5cCR0/mwSNZTLrVcz3APUQhYebWpq9j4dBW2/R
         hReVbx0zNqesO+63Azk7maVM3oqiOKMqKGMuis0x+CAV/g0ckWQWWSOeJKMmg7pPGkgD
         pDopgSSZ4wjGLcFjeA6YdG3WRg/1SbWD2Sy9fLFQB8Y3w/hbMXLhnNdbMNl+OSNnuzlv
         vzG76vHA0vtr2X9NlmtTovNXv4JGYrxOMAq7k0XSwLhfVE+BKOWanx77UWrOLr4Rc3A6
         h6stuQ9C7kqpSGWAQtboXs0BjA/t6YNLL/ew6surf+rbaignP22MzdM0VGZ87zWtBbiM
         B4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747295142; x=1747899942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ji/KKSHoP7yY7aJyBCvNgq977Um77Yq/cN+M0anXeoY=;
        b=DDKkY0+yDwV7h0zY/6T/l2ipLCK06CO9xiU3HR6X+La1KERJiagwbwLhYGjOPz+5+N
         0UyWf6W9TWhSoAB7cjIRmzjv6vxRTHuBZ1qZwJpOmFV0TiDUnynwwdutK9FlYYjeSY8u
         Fc6MslXn291UepfYX//eEKcadHQcA+XfoG8i/qtrqpcMuqekiaIPLr6T9oFptZaDpLcN
         JSOdGiZjgOsC1vyd6SfXVC24wdxizUMngJBCkeQSVbny8UbCYdMURgL5eSuNu5bQLEd4
         daDB6B5GLwb7n+FP2uDiYsVxcjBRmEuhgYR7qklePYwvEo3/NoUK9KLSjtuOD/ak9rYz
         1Vhw==
X-Forwarded-Encrypted: i=1; AJvYcCV1AVQuJcsbp8ZHUgUEO7NfMai5vPECQ3zwr4EF3cD6ZjJ8p5pVklqDQAI2nf+uzXhYuPjhXvd4tMce@vger.kernel.org, AJvYcCV1XKVY/2HNCKVvTzmGvLFYB5WXJIsS8GrMWF4fCDQApMPgeqUlRkzZf7PECyaJWvjHfTU6M0VBrZ8tNl8/@vger.kernel.org, AJvYcCVqVkXNVH/asAZfS/I8o8aHEdhlVfA3thnns+1KE2I+yt4cpjrIQIAsRZFO7+TwDoqzZBLqls3J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SaU9p506vHMdqvKuiwZ3v5C2WAOlCXRvp4uo2rFAJEyL0VlW
	0YaixyyfObiEiEFjfoyFA3MGXcqVN8YbgtPRafPSTtic4KgLxpQF
X-Gm-Gg: ASbGncvvks6ZN3vnqckAnJj4D6rS6ivgpLlkTstgw0A/rJghmdIuozNIcPs/+LAj+Gk
	c9wee562PgTd/Mx2dxNtIeEnyUXiRWoyZt1RjD/LxCrOZjBg4QDfTkwoqc5fVqR+xYE0ghEZD7+
	+Mkio7oGIfqIELfuapYc0EHROpiKCu+us52tEdxbkfGjYd2jC31jv3mcC/Vs514j6qAGpUZM5fF
	cxw42QDvJqwK7Dm0ACkOVQBHiB7PkZg6fGY0vqbJixCLpflQCyaSBS8boHMGhmiiBeKNxjRoJVH
	5Zd0z5kGn2SHP/UNb4ng+YyLFcJC48YFzHCTWO+3jjCZWkCgp7uI8wT9HEhB5VeDjDE3uSN1ifX
	gZZzObarLChaPZaWw
X-Google-Smtp-Source: AGHT+IEnXEKhyoqKyql7HmWJcCHO+Gr5r3eS6SUzYuWVl+B+RTKRMOQwn/WGYHQLnofQqru7Sv/AKw==
X-Received: by 2002:a05:600c:3c85:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442f20e5547mr55352885e9.11.1747295141986;
        Thu, 15 May 2025 00:45:41 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395060esm60261815e9.17.2025.05.15.00.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 00:45:41 -0700 (PDT)
Message-ID: <d5083f6a-e39b-46cb-8551-ca7a5f6f6bed@gmail.com>
Date: Thu, 15 May 2025 09:45:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
Content-Language: hu
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Imre Kaloz <kaloz@openwrt.org>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
 <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 05. 15. 0:28 keltezéssel, Linus Walleij írta:
> On Wed, May 14, 2025 at 9:18 PM Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> The series contains several small patches to fix various
>> issues in the pinctrl driver for Armada 3700.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> Patches applied by applying to a separate immutable branch
> and merging into my "devel" branch: we were clashing a bit
> with Bartosz rewrites so I had to help git a bit.
> 
> Pushed to the autobuilders, check the result!

Checked, it is fine. Thanks!

-Gabor

