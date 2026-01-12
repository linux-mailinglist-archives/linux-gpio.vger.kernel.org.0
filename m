Return-Path: <linux-gpio+bounces-30451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D42D1274B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 13:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9A430BB261
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 12:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953B1357713;
	Mon, 12 Jan 2026 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Miz1fiQ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46A1DF248
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219493; cv=none; b=gogaFvRjahO6/5RKLyjIQVZv2P/cv7SqkauGspB2cqX2YvIo8xhIrvBpdfnOHtbUZb6lr+FuJEHWNFboUR7H9zr+dmAs2hpHDOBTj6Ab6aLv362dp8Iv+AKBVVlfds+tHqnT82UTnzR+njKT3a/hh9+lFZPq9fkSLLWWwPiPolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219493; c=relaxed/simple;
	bh=7xtefCug/qYG2+PCm4VdtHs8ee1KPuhKc3l5IX/hhTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0574zM4BQwRs1HLx6Qtegfn7S53eQlIbpbFF8uotuN5wcguz9KCbrkTtEMG/CCyQCmL3ZkDA47T8oZAUwfWkDI+0ByIXdawVROwdIULg3XRXDtWHvfz7pMkw5i8bd++W/V9OFxjF0VxmQqSjmrXsw8QZwkzoreud8R1ZMjM8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Miz1fiQ/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b76c092acso3653470e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 04:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768219490; x=1768824290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5B9VOs5SZcPSzW1v2/zOZ9gYxEwx3VMLCzV7S6TNwM=;
        b=Miz1fiQ/s3yr7JPIyhbRUthuw1t/U/xArJLxzMcdLcpt6EHnp6JhZcRuG/WtaX9DLF
         RDa95ZFP412Xf6s0s1G4QySo4PBu0qsIuSUmAWq3OhtCAJYqQ/bMMYfa2+fs8JCNMwpe
         Mjg2yVmmVAXC29dus4/jJYLqPjabb7DARB6WlLWxFvbfJPCDHVYl0n49/rzvxozt/gWy
         JpRo3c5L2UHerrRQlOAVR36936H8oJq7zhc7hdeptsF7ivdP5ItlUCcYrhDpJCMcywen
         Tu5Y84HkHrhRVaxmfhw0MNPPnp+NfQ7QSM5eTI5brSsbMi4qWPQRN9Ahny0etX7Epju3
         WBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219490; x=1768824290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5B9VOs5SZcPSzW1v2/zOZ9gYxEwx3VMLCzV7S6TNwM=;
        b=TxZG8cVIZdnMkBBc3pX3vsa9K67vkO1LlzbGZj2QAL9pvWWOXCAXBBGMsrTzhdoeR3
         lrpPkJEwPqBbHeZGtLr/TqzchYrtW+VNOY0thMfJvUNrr7VGkBMbolsLZht7+Su16dAl
         ajWzpi8g2goQ5TyN0kpvJnHkphruFeBjrDB3BcV6Q2WRfH9qCRd22c/ivAxOwTnKP+Op
         CL5k97xBakUrdNP48o3q4e6SmOG0w5oaRrKBHQbiSwZ1T3Gi6VEFeVnVF72xfCYNfPj+
         S94WwLHjSsHdbkKNldfpiZ/jfaqynGzZM+1lScKbPbblVZYWhPuwN920cQwstfUeqb/b
         /Dmg==
X-Forwarded-Encrypted: i=1; AJvYcCUj8ywUJjuIuKaZrOOtP15OFtROThLzKv9UlRET3RzAm+QbsF5iXxuoBFPhEoVeRUFnL6kFJkOVEjsK@vger.kernel.org
X-Gm-Message-State: AOJu0YylvTs76Z919LAQKRVU9zp5AYVNu2UaxUp0kNYP76i3+F+9N+i9
	XIRg7tJiA6+zpvvQxoXHDlzyXZffIKtM2QNhpginKfaj7si2wAE3XfdN
X-Gm-Gg: AY/fxX5b+BjSFKx5OUcUUjbldOCNtfLsWK7oJt9V7D+39oyqX9BZAkciVAHZ5h29Q/M
	EmgM9KmB4ia8405RGda0tfJHR0AkUXiEwB70IkGqZDDIY43kFHZ0qf+1bbeKSUlouM51yx/rmcN
	o/NAEzWkRL1NlND+yZGL3vsWTUB0x30MYHz39ckQq2A4wV0E4f/54pIDJcpWmMklCLoeVlWOCiL
	fm/WBOuQNKLlYLr8ruaBqcbzC7caxrW5/jIHsSecc33mEZHfyWyoYIGSanZ3RzyuNJSryB5Jayy
	NXxxcJvomLcNN9LN8u93+64ym/C7x8SS1wjzTozplP2s8KOyzKhGlJDGBlrcm4mTbBfX6AyY6UV
	//0Uprr8ah3vY1y6c4LP3rWSI/Ejm9V/PNH3kGYCb3E6jAwxKtLk/mS3fze4y5t2PnlGaGpqmIx
	2Gq8skYYE0I0AdW9WsflH7VPr7zaTID1J6dvkiwpk3KjF1oJAwmtVmtMEYzJa/PGtbxnkQ
X-Google-Smtp-Source: AGHT+IHIOma4TS1LvpaF0nAI7hxAzfTZfER7LKZt7Et+nsHWkt6YVR8gJlh4cjrPjzNGz/ehF3S4wQ==
X-Received: by 2002:a05:6512:3093:b0:599:11a5:54fd with SMTP id 2adb3069b0e04-59b6ef028e5mr6174554e87.4.1768219489595;
        Mon, 12 Jan 2026 04:04:49 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6ac0a769sm4379781e87.21.2026.01.12.04.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:04:48 -0800 (PST)
Message-ID: <ebb14cef-9927-4211-94ef-2f209abeb406@gmail.com>
Date: Mon, 12 Jan 2026 14:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 00/17] Support ROHM BD72720 PMIC
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
References: <cover.1765804226.git.mazziesaccount@gmail.com>
 <20260108172735.GK302752@google.com>
 <63bc889a-b97e-43c3-9f46-9ca444873b70@gmail.com>
 <20260109093831.GB1118061@google.com> <aWRFs3CJvd37BaoH@venus>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <aWRFs3CJvd37BaoH@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 02:53, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Jan 09, 2026 at 09:38:31AM +0000, Lee Jones wrote:
>> [...]
>>>> The MFD parts LGTM.
>>>
>>> Thanks Lee!
>>>
>>>> What Acks are you waiting on? What's the merge strategy?
>>>
>>> I think everything else has been acked by maintainers, except the
>>> power-supply parts. I think those have only been looked at by Andreas and
>>> Linus W. Haven't heard anything from Sebastian :(
> 
> Yes, I'm lacking behind quite a bit, sorry for that.
> 
>>> I would love to see the patches 1 - 14 and 17 to be merged (via MFD?). I
>>> could then re-spin the 15 and 16 to limited audience as I hope Sebastian had
>>> time to take a look at them. However, I don't think any of the other patches
>>> in the series depend on the last .
> 
> Sounds good to me.

Ah. Since the 15/17:
"[PATCH RESEND v6 15/17] power: supply: bd71828: Support wider register 
addresses"
was now acked by Sebastian, then it can also go via MFD?

Also, if it is Ok to address all the "dev_err() + return ERRNO" => 
"return dev_err_probe(,ERRNO,)" conversions in a follow-up, then I guess 
the whole series, including 16/17 is good to go? If this is the case, 
please just let me know and I'll send the follow-up. Otherwise, I will 
re-spin the 16/17 and add a new patch for the remaining "dev_err() + 
return ERRNO" => "return dev_err_probe(,ERRNO,)" case(s).

Yours,
   -- Matti

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

