Return-Path: <linux-gpio+bounces-28357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18DC4E1B2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 14:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2503AD093
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 13:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BECB33AD95;
	Tue, 11 Nov 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biphaIgi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E532C938
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867701; cv=none; b=qT1pgXjw8uif6JjzEkZD46J7dUqazXfzLsBL+ya1SUyzatDVZ4jFBAn7oElqWBkX8WVJZoLATOJ/7wGVDx27osDFup1nnYMVzavvkJS/gz3vGPqRLFMwS+CKZs23cuF4bt7dJgwJq6V7EmQ6O0N1qEmBQhWqErAmhDeacRjqf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867701; c=relaxed/simple;
	bh=Ps3gQmpslE/MDFfUlSXSWxtYwxFYzuGV/LZBPe3oXNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vy8bE7XY0B8r99NM4ws6r8xfS+iyHBO82SOwLvGBiZW17xOOqvyMkey8j3I2PHSRqfmrMVLjArdzUQvtp97fQ3cZeZn8OruJcrZv6KIOquMX/UnHofgArj77GjN6pQvbtsqZP4k8TjPPfSa1Y1aMoGfio6SJfFPJ9iznI5DXDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biphaIgi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so6852108a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762867698; x=1763472498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DsffIE3Ut5DM8ko3+QK0VsDuxwCG+5a0A0i4trOLW8=;
        b=biphaIgiFboNYxuvMrpABotpYu2XtMn4dnngVvy+3IC0mUX5a9uNosPbxdc+eL5EAm
         zcuRXVEeW6zL7UrJ8WlsqYETPeR7+fKFO+IGmbQ+112nAtWbQvBz0KpUV9goPqLMGHRI
         uiJ4s8iiKUtmjBwCICwQb2AHuu27/YCfGGQQRyFu2TH/URHnFKmFf1td9Vwr3OK8ZvLh
         XbWh4G9XQrn4D60ID4Vl0tFG1OLueFI5RZjCNQYnred9mv9EYTic0wdbM/FVXOJKMAmr
         1gNrfiUstSF8Tg6jkOM9yc3An4goiwCIcu8K5ENXx8ruWnZiPhsiIHIXHF6f32FtZqdx
         K0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762867698; x=1763472498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DsffIE3Ut5DM8ko3+QK0VsDuxwCG+5a0A0i4trOLW8=;
        b=vftaRDgN4ik0NjbMhwjoilG+saxngSdqUz2g64y1usIB9rsWenAMQzlH/bsZd3tHqg
         B73+6qmgmuqU+jZDbDqyZIvG1bUOq1Aph6NI+qzAjk5Cfimpj9MeuqGwR0OD9g8ebdXe
         i1tU+mQzqRnC/T5gGVyUjPdl+Bvt9FJxqTs1sZNekRuD9prabQKsHQONjDIBlosPgSdt
         UsQBBHFxmGr7i8eGriDkav1YBFH3Qbniz2+xcS64WSVYDcivlYYQu8aY4+U9+RpnmIAj
         oiiDtKjkOyo7abAfI4UBNDiNGE7ITo+xlC/qF4KZeCCGwHRhX3lpcbvexIIj9Z3AcSl5
         6b3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlS/C7LE82/bFswV7TEa5YlY1ZZY9kVTosz18dm9+Kscd86k+kt1Z2plrc1/e7pnLy0qHWI7Q62UUW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9ryNPC1QKjtZEk1BZYTIr9AE3pd4QK/G4GLWzdgDTX8tREnk
	+je64TL7ac4UyQnqumjzIxLTRk6NAfOpG8na3d/vdg/XDCNH/aoJHJneZVlR4g==
X-Gm-Gg: ASbGncsfL5SjnbD28usvNuPND0ZfY/0tn3WU9w8pkL119fgoEpAGErhm7Odf76xInES
	qkIwF7l+SSsojHmS7ZqJr86vXMkvfTNN4VNQ6GLREHIgSCayXdGxgBLUiwsiNkwrVPawKrlCWeu
	eU1PiBBJCQE6KSxJtJHXquD/cdv7xGZ2Qq2Myg3CnM+ovHuVuDmpfH9KWKPvO5fk3WEfhg7t2PY
	PWb/qHNa32REwupqUJY4+P0FQtN8mkGj9Y4edvBTap69dsmQnRLPfF4mcEhIjtl3UvRAvP6E347
	rkGSO3Tfp/hHJRJoE4B5PPAnKey9JkMEcWM3Lln8u84Sup4iW+mJHDrpHyiBKTn96tZHrinjS0D
	TDMjNMWDd3deowj3fbqbIHUfi8Bl2PInOxRzVbW3IHuQdSa3QSy29S0NPWg/1DBTgTpFCWI17P2
	CmaZCpfqHyuJpxFl6VPqgDu+GbLJSK8XB2aUcVYEYrWG6rOaV/rQ4rkFdTB6D8P+6oLb+mR9uzb
	q3MYsYnbJ0Kpg==
X-Google-Smtp-Source: AGHT+IF5Dj1MIXDn+W74uXHIewjQZN4zVvvvgRaDGdjD9YPnaJjpUwWG1pTssah7cODBcp1Kuh1Rkw==
X-Received: by 2002:a17:907:7b96:b0:b72:b495:827a with SMTP id a640c23a62f3a-b72e041274amr1311048866b.38.1762867698259;
        Tue, 11 Nov 2025 05:28:18 -0800 (PST)
Received: from ?IPV6:2001:9e8:f12a:4201:6800:ff88:97b6:8eae? ([2001:9e8:f12a:4201:6800:ff88:97b6:8eae])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be184sm1334911266b.56.2025.11.11.05.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 05:28:17 -0800 (PST)
Message-ID: <0c77dc63-7e85-4085-b48d-1885aa52bdd9@gmail.com>
Date: Tue, 11 Nov 2025 14:28:16 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: add gpio-line-mux controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Rosin <peda@axentia.se>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251111092705.196465-1-jelonek.jonas@gmail.com>
 <20251111092705.196465-2-jelonek.jonas@gmail.com>
 <20251111125716.GA2560355-robh@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20251111125716.GA2560355-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On 11.11.25 13:57, Rob Herring wrote:
> On Tue, Nov 11, 2025 at 09:27:03AM +0000, Jonas Jelonek wrote:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to the multiplexer to control access to the GPIOs.
>> +
>> +  ngpios: false
> No need for this.
(...)
>> +        gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "SFP1_TX_FAULT";
>> +        gpio-line-mux-states = <0>, <1>, <3>;
> gpio-line-names is defined to have an entry for all lines. So 
> gpio-line-mux-states is not necessary. You can just do:
>
> gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "", "SFP1_TX_FAULT";

Not sure if I'm getting this wrong, but this ties the GPIO line index to the
multiplexer state. Is that still the correct way if my multiplexer needs
states '15', '17, '18'? Then I would need something like this:

gpio-line-names = "", "", "", "", "", "", "", "", "", "", "", "", "", "", "A", "", "B", "C"; 

And it would cause the virtual GPIO controller to provide more GPIO lines than
desired/expected/needed.

> Rob

Best,
Jonas

