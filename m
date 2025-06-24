Return-Path: <linux-gpio+bounces-22078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D858AE6C5D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 18:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41597188AEB8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 16:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA94725334B;
	Tue, 24 Jun 2025 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdJYe4SS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57461FDA94;
	Tue, 24 Jun 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782057; cv=none; b=b+9FFZN2Ik0YPQ6rBuLtM4Et2L9uaZ0NnMGJLkNxncm3ckI183DkMAXjVjxlI7GT/0bvIxLcQEiONF80ChC0z0LAJNgHybN0oU1swH5RD7MIltJqncbjDzD/k/4zJiSZhhRuKK6Vn9NpKqjiZqmPbopFXvnsVSuDiMWSJe+dv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782057; c=relaxed/simple;
	bh=QBZg28W/fBUTxa5iv7HE7VIvLqKke02D7Qw8NzurT3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQgcDqki2aG7AzVZINOwy3O4oyFCesYYrjKeSdU9rT8zCxq6W5IdEk1hBY/cTOUk/emAct+czcSWmm8Ip6WCWxsnbDlF1bwPSuQtekyvGR8DCFpyOrOMYM37FOnKR0zsQhFkNWUmcZybTo0woKh39x7jDUerZhDyHSpnJQX0Gwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdJYe4SS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so31011795e9.3;
        Tue, 24 Jun 2025 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750782054; x=1751386854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=;
        b=PdJYe4SS2WUlwqqR5GYlvkAKX5YE8WC5P3IKbjkRQqo72VfC438NXsgyQ3h3R2WCD+
         ZpYa2Y1QfspELICwBbwuhSN+86zYqMkKfHU0zW48EBdUwElantQ2cVWg/T2gFL+S3nGm
         BBO9vDMpXyE4RUFIw4iSeh5hPo88xhF4uwRzHYZZx5BzCE+PUuScI1AdUyODZkitRcMo
         d1cpZ9M54YzjWmp8YJNSwtr2D+vLHSUOd62akAk+b1j+OoGQ6G7RPH4Lre/7oC0zX7kE
         WY6GQ233lmitAcqnyWUvJPyviEzwmtMSK42wvg1IpwWuJ2S00EAzbptxF4rfHALGIN/9
         D88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782054; x=1751386854;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=;
        b=fEwTFcLCs4k5JAJBFktSDz0RD2YGXfZNwx/tE/mEkBfeU9xorQcULdTTnHXrXEWBvh
         utN9fSFOjTGC4zVv9BL0up7lY8T2iy9bUcEXUG5KdN8UrtFFDIMfh4rAdf2nx+8a30MR
         wzGodQQLIAHqsU25E0YdzEhLTivVgMvJNAKM498wW4djqT4VypE2lXUIYj9Y4AvVnbwo
         8Gszn+O35QU872qBIInv8o2EtcpWKMT1yLjMQYcWEqwEI0Roo40pnOoFGKSST1TDGv2r
         2wvIfN8roH1UV3J1dKh4FtJLTLg/ciaqLBqfMBLUSJwhOSAOzE3G48kP41yqN/EGOUCx
         b7Og==
X-Forwarded-Encrypted: i=1; AJvYcCUFY+95IfEMMLsaEOsgB+7OKLDFPtBjcDq7yKQ1Pq/b1yE0kErfU/J/t3C6FQfyUKQZ/iqK4udJU3n1@vger.kernel.org, AJvYcCUbIAt8w7VKqd/GXRERcM24Fx/b8w8UStCIdvH6GhhJGitUTqGRin0OVwqgPSCmFIoAjQl31QgekZsRSfus@vger.kernel.org, AJvYcCV3+GxZT0QxoUR8ildV0PiFhK9Ex/PtELq9zjLF1aEBt4JW/u6Kv/0RiDGyM1ssNrQ0Sxmw0cYOw+iBYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwGX+Z/eivia1j/ARXFwZVJSNmvFw/Pf6RKqBcCi8OJAaeEVN
	BZKQj2Vcocg/yudFHCOql4Re2jTgXB5lOzY406aTc3ukRVBarc+X2XwB
X-Gm-Gg: ASbGnctpqZCOhnlb45lmtO+1rUQsn+OW4JNvhsOFtY0SRKeeZAUtpdgxZEhPvoMcS/H
	Yc49EoJ8K2O6RpU6OPI3PfuE+uuJ7lyvT22OIn0p6W7tNpVS93ZmKLQXVm8hAOrfg2JrQmsCXwD
	wNC9jK7iL0RUrVQHqN4eQlfohrGjtkyDxf/zXykQ98IkYhm0KtmtVlkXW0e0RmAOLbmgoDbMQG+
	3MhEwe161IwUFgWyTaRhOJJBj9zerAq5cV+bSCRffFb+MvFmSjXFQPyiNHP1lQ+Zubz4zUwrFx2
	tk2oPb+57AC+lVb2An3NwwmgDv9hZCAkyGmxWpt6W42VPBCmM4kTP2o3VHyo0pZ4TjRS
X-Google-Smtp-Source: AGHT+IF6pE2IAJ7Y1LDV5YWms/8jtl6+meXsDEGvoE2TkHeD+D5JYR9IpOTJZUfa+CipAih/vfpv8g==
X-Received: by 2002:a05:600c:a016:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-45365a0026dmr149159215e9.33.1750782053900;
        Tue, 24 Jun 2025 09:20:53 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm183195695e9.26.2025.06.24.09.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:20:53 -0700 (PDT)
Message-ID: <f6847b24-aa57-4ce5-995f-03b3056f88a1@gmail.com>
Date: Tue, 24 Jun 2025 19:20:48 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
To: Martin Hecht <mhecht73@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-7-demonsingur@gmail.com>
 <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/24/25 7:14 PM, Martin Hecht wrote:
> Hi Cosmin,
> 
> I'm preparing a test with Alvium + max96717 + max96716. I can't see away 
> to overwrite cfg settings to force pixel mode or tunnel mode. Any plans 
> to add this? Sometimes it is required to force the other mode than set 
> by pin-strapping.
> 
> BR Martin
> 

Hi Martin.

Pixel/tunnel mode is chosen automatically based on HW capabilities
routing, formats, etc.

I don't plan on adding a way to force it, since the presumption
is that the serdes framework will pick the best use case available, as
long as all the data can make its way to the PHY.

Forcing pixel/tunnel mode shouldn't be done via device-tree since it's
not related to the way hardware is wired up to the rest of the system.

> On 6/18/25 11:58, Cosmin Tanislav wrote:
>> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
>> links.
>>
>> Document this compatibility.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ 
>> maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/ 
>> maxim,max96717.yaml
>> index ab46a5f0bd7e..23f611177a87 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>> @@ -30,6 +30,8 @@ description:
>>     MAX9295A only supports pixel mode.
>> +  MAX96793 also supports GMSL3 mode.
>> +
>>   properties:
>>     compatible:
>>       oneOf:
>> @@ -39,6 +41,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - maxim,max96717
>> +              - maxim,max96793
>>             - const: maxim,max96717f
>>     '#gpio-cells':
> 


