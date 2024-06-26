Return-Path: <linux-gpio+bounces-7739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB48918596
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 17:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A05C21C20B1C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 15:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000BF18A936;
	Wed, 26 Jun 2024 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJkSd9No"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E85186283;
	Wed, 26 Jun 2024 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719415264; cv=none; b=ts0BG8WhoKtEY8su4wvrvD8ccd3ZWUmfARXsfzOLzByt6+UWWlLoJZQzM20sMLipctMkCCQVvsfo5hi1+Dzufuf/w1p0PXCoBCHIsH9PWwP/mfacumYycdtce8edyrv7htuv3va6Qtb+3JYf2Irnjan1qOimAq36dnh29gsxy6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719415264; c=relaxed/simple;
	bh=d0JMlJF027JTX7t21lFfPdjWwSUj+MiRdfmR5IGD4j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdJF6deNnuKo1muWUxDCFXCSb295tc0bX/isV8oiZS/vXCmJOixqDZym+VOQ0rDTk77cDKKr1ZVoEqM80iFaCgyIrTMIsYHDrsEIyOIdpk7gBv2Gi4PplmfWbc1dld+bnmJEliLe5NiqtXWhewyT3lcELGJuDvvcpylZ5YyZ/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJkSd9No; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f480624d0dso58222125ad.1;
        Wed, 26 Jun 2024 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719415263; x=1720020063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0JMlJF027JTX7t21lFfPdjWwSUj+MiRdfmR5IGD4j8=;
        b=LJkSd9No0bP6ajMPFE8IhztUwUncsg5cXkmRQqDRFP32kmFvDjHPMlLA19T8wkWe10
         0GrePo1lqVxB+kBptmwMZK4aSba8tmamyoDuuy4trl18fpIgrkBVzAOncfCE9CX10lmx
         FA3gHttmys3KSnI92465UjBV2FjoSrv1mH8L0/s6aBW3XlokZ5ShIDuUqpvz74Lt7o42
         DrbE7kFhLb9W2rQBFljKtG3SjKRiDUP4i0RH0lUw8H5retWZEFj3c5jwu/mYm74v+gp4
         LOm2TR8g0FTBO8k6F/jUsBujPDngLgU5aOV9TAgzaah/7yV6CjwYCcR0TmYMK+h15Grh
         76Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415263; x=1720020063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0JMlJF027JTX7t21lFfPdjWwSUj+MiRdfmR5IGD4j8=;
        b=VFWGzk6RRJgPBy3lI0HT+T5LG5R+kxnea2wLWUTF/LPiD3V7jX0Gc5vqz3lfWbCDHk
         nLoAxoE4tjTidBsyYVu7sADFi65llPw4C0BgKqG9jy/Zb4KsVf2i12jBmKqzoq3u7JyL
         2QSZgpjKsHbXTmvxSeh5MWx+EPLFTNSR/3DCQgXiSNXrCBQc3+bAW6mESkFdI3yAyetv
         x14zfcs9NAhm81c4d0Z2u4sRluGCOWZWH9InxxuQT8xd65ZFXhD41SMU0+1VhNfwVkJ3
         ZONX1xH2K6/Q54sjF8M1FVEPDA5WSn8WzsVa5Uvhm62SX9jlkRxGmrsHdfoznzydGvqK
         I5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWbqMtiWTO6FNOI+Kv6FJD3/P0wVSMdPxYyi8n4bsI7Ekcvnr2jN6kzQOBOj6JKSjFl0iK1sm95+s7Vhi6vJS2wr3MhsgQcLGCRaWDLgSff/gDH2LL6//qlMKGgpzBcz6G5UvfHRs+jng==
X-Gm-Message-State: AOJu0YypMvfAZ0OxIycJzwThi4+KxaiVDwxAp2ypUQcvMK4qhoLgeePD
	xxHdiF9nmUztryVyysWlAFgsgbylc3LLHd44jgwg/pGzc9kGP8hoFQYnE6yTlGig7//2TbukCGL
	4Jv4wezHLmgUn7tpdjGs+7oWci7Q=
X-Google-Smtp-Source: AGHT+IGKYGjGPkoMH2bBw8e8oRcqSVujEYV8vSFMKuZs6Qia2qGz/EeqMBy/sXjNjSKlZqEWvK88zSVaMa+2iKPVsVQ=
X-Received: by 2002:a17:902:d4cc:b0:1f7:3332:65bf with SMTP id
 d9443c01a7336-1fa23ec2d20mr148964335ad.16.1719415262775; Wed, 26 Jun 2024
 08:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
 <PH7PR12MB7282BBF9E42265E18CB72E09D7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB7282BBF9E42265E18CB72E09D7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 26 Jun 2024 17:20:50 +0200
Message-ID: <CAOiHx=nssvX-VYySmpLZ8bvBmitT87bX2AYspdkH3y9iWTB+kQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Shiji Yang <yangshiji66@outlook.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Mentovai <mark@mentovai.com>, 
	=?UTF-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jun 2024 at 17:00, Asmaa Mnebhi <asmaa@nvidia.com> wrote:
>
> I am not sure this change is needed?
> When I initially submitted " gpio: mmio: handle "ngpios" properly in bgpi=
o_init() ", It was specifically because I have a 32bit reg access but only =
16 gpios. Initially, I did not add the else and so Andy suggested to add it=
 with the roundup_pow_of_two to stay backward compatible. If your system is=
 a 32 bit arch and you only use 16 Gpio bits, why don't you configure that =
in your DTS?

Because the registers in the datasheet are specified as 32 bit wide,
so defining them as 32 bit in the dts(i) is the most natural way of
defining them, even if they may use less than half of the register for
gpios. And on big endian systems you cannot just use smaller
accessors, you also must shift the register offsets. So this change
broke existing devicetrees.

And as other theoretical arguments against doing that, less than 32
bit accesses may be inefficient, or the bus where the registers are
may require 32 bit accesses. And finally, the caller explicitly passed
a register width via the sz argument, so we should listen to the
caller and use that, and not trying to be clever by changing the
access width based on the number of gpios. At least not unless the
caller explicitly requested that. Like e.g. make 0 a special value for
automatically calculating the number of bits based on the number of
gpios.

If you only use 16 bits of the 32 bit registers and you want to use 16
bit accessors, IMHO it's up to you to pass appropriate values to
bgpio_init(), and not hope that bgpio_init() will fix this magically
up for you.

Best Regards,
Jonas

