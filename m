Return-Path: <linux-gpio+bounces-13047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB49CDFDC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 14:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293B3283F0E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 13:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED7B1BDAB9;
	Fri, 15 Nov 2024 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2RVY6Yl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005511B85EC;
	Fri, 15 Nov 2024 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731677149; cv=none; b=LIv2A5wQwgQSZbThuOBa6ibHdLalucaiu1STASTCU6xEQxDWwnq2u3h9rgHkgSZSwfr4Wv3Art7g57ZI6Qw0KeBJf5lbfTwDZlvgHgDqqpaBEDQG/Wt6HmaEmEldv0zp39hYceWXDGB7290agqttg2IIvTcbO56j7sK5IWIrpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731677149; c=relaxed/simple;
	bh=4B5oeUK6/jbemP4QwIO7GYzG5tkdJuJsHjYt3C78Gl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aejMVstkQgvOXtdKCd9ymCTbNanzr2RoLNhDySzLF9964VNSyIc+NzHjaCToeA04hBa/XIWY/1A6x3EMv/g6Xic0b41lKR0ObSSjgUKZG5Llj2oWw8ff4zy7KEN8Dvff+44FdN+gcZbVYMZ/JllsO9D//2pkaYnURoInN2JTOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2RVY6Yl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso1460572b3a.3;
        Fri, 15 Nov 2024 05:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731677147; x=1732281947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ucy62BZOJLWyZBpQLjqHTc1f1/F23x403Dd196TgvE4=;
        b=H2RVY6YlIG+Q9n8gglAadGHvsiHfXkU+tL35n9BoPtQX2MjmNLZDXjjcr43lZrOnxS
         IcWYTOCopuH3bZihDqZeSxahomz1VyATCTrul8S7zFQe2cd84WfYzHSjSDZVPk1zHv1x
         kfnK0f1KYqs6rpkmX8yfgp/PBqKJ0smz74pBWI0xXU7KoN6ILvTB7oxeHT1EO4IZT+6U
         oSwIiUrGwbAqhs9NwTfuM6MpVT/h/mm+ij0aayFn4a52fQTtDANwPfLpdoSSzRkdkBvN
         QY9CnEOha65ry8SAiZLRmGtrm0cYWNxU1wMf9pevgR4WJQSbkK0XKU3+yWzASyrrBuuU
         Ep4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731677147; x=1732281947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ucy62BZOJLWyZBpQLjqHTc1f1/F23x403Dd196TgvE4=;
        b=shtb0vEIHLSy58LOv+AY4mCGNbtdMkwiHZFl/g3PBeJyDarT0C9Z4xgBDj9vZY0Tgc
         ODK43LwPR16fhIn2/EH1TVbI5N675ZwJnuqB6k5I1fyDWH3MEigteTydLXpGZPwpsceB
         jGPZX4Br3in1AhWQwRjbH4aRanGAZ3yWqmTmjrGXtrRlv1sDMNqc2lajAep5bBKqMveJ
         VpSEf6aZ95cLo/KgOBqxD3JfiCt0GhjTN5rLkVKxCPVEmxgl1h6/pQjIRF6tRoljbsKq
         sPMY17oK53E5kMgAfWguIWA6+OvvF0EtKqRK/pyiIJhzc6EUVFatjvstdpEcHxRpVuJ0
         hs9w==
X-Forwarded-Encrypted: i=1; AJvYcCUlHOFNm/3YZb5dtRnIq4O0ma1lhe0p5FRJ6sA1WDUQDaB8EXg4a8fvI3xzGOkAp85kvaj2uauRPI26@vger.kernel.org, AJvYcCV5YSpM5I/F4PXOz35aYgDREzaEj4GN4M6Mo7bMX7ujnHTG2/odzkhLe+05e1QYkAY8mptts1iIG9FgtDDl@vger.kernel.org
X-Gm-Message-State: AOJu0YypDKwwM+Vc4wRcTg1oMzZLg8lBEqqvmXZYD8csk9nK6N0CWXR3
	h+O0BfucWRQvNtYxiLEqWIR4Af+BXL5glup95pW2Wo9ZZEZb30pb
X-Google-Smtp-Source: AGHT+IF0jlNXXc3zGvbQG4ypYJEla/PXxxiW6xj1VKhzYV4SFOwlaXUfIWAdDmA37lLspv8Us4pQMw==
X-Received: by 2002:a05:6a00:853:b0:71e:66b:c7eb with SMTP id d2e1a72fcca58-72476cdc9f1mr3317158b3a.23.1731677147165;
        Fri, 15 Nov 2024 05:25:47 -0800 (PST)
Received: from ?IPV6:2409:40c0:48:969e:e221:9e2d:e416:1b41? ([2409:40c0:48:969e:e221:9e2d:e416:1b41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711e39esm1314426b3a.77.2024.11.15.05.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 05:25:46 -0800 (PST)
Message-ID: <090f78b1-88c9-44e5-959f-07b4f97cd1bc@gmail.com>
Date: Fri, 15 Nov 2024 18:55:41 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: gpio-exar: replace division condition with direct
 comparison
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241112201659.16785-1-surajsonawane0215@gmail.com>
 <ZzcWGJxqMJVYd4Tp@black.fi.intel.com>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <ZzcWGJxqMJVYd4Tp@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/11/24 15:06, Andy Shevchenko wrote:
> + Dan
> 
> I have to comment on this change as it's a bit controversial.
> 
> TL;DR: this patch is not more than a (harmless?) noise.
> 
> On Wed, Nov 13, 2024 at 01:46:59AM +0530, Suraj Sonawane wrote:
>> Fix an issue detected by the Smatch tool:
>>
>> drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn:
>> replace divide condition 'pin / 8' with 'pin >= 8'
>> drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn:
>> replace divide condition 'pin / 8' with 'pin >= 8'
> 
> This message does not really explain why.
> 
>> The division 'pin / 8' was used to check if the pin number is 8 or greater,
>> which can be confusing and less readable.
> 
> It's inaccurate description. Everyone who is familiar with GPIO HW is
> also familiar with line grouping in banks. Here is the clear statement
> "get the bank number (where 8 lines per bank), and if it's 0 do this,
> else do that". It might be in the future that (new version of) HW will
> gain more banks and we would return to "division".
> 
>> Replacing it with 'pin >= 8' makes the code clearer by directly
>> comparing the pin number.
> 
> I don't think this statement is fully true. See above.
> 
>> This also removes reliance on integer division,
> 
> On top of that "division" here uses power-of-two divisor, which any
> optimizing (and this code I think won't ever be built without
> optimization turned on) compiler (I think from the very beginning of
> the Linux kernel project) knows how to convert to right shifts on
> the platforms that support that (and how many do not nowadays? 0?).
> 
> Additionally in the cases when we have a / 8; a % 8 type of expressions
> coupled together, the compiler actually may issue an integer division
> assembly instructions on some ISAs where it gives two values in one
> go. Replacing like the above might break that (if the compiler is old
> or not clever enough).
> 
>> which can be harder to understand
> 
> No, "division" by power-of-two numbers is very well understandble.
> 
>> and may introduce subtle bugs in the future.
> 
> What bugs?
> 
> The bottom line is that: I recommend to work with smatch developers
> to amend smatch instead.
> 
> P.S. I wouldn't like to see similar patches to other GPIO drivers,
> especially those that use a / 8; a % 8 type of expressions together.
> 

I understand your points about the familiarity of line grouping in GPIO 
hardware and the optimization behavior of compilers for power-of-two 
division. I initially thought this could be a good fix as I have seen 
similar changes before. Thank you for the feedback—I will keep this in 
mind before submitting such patches in the future.

Best regards,
Suraj Sonawane

