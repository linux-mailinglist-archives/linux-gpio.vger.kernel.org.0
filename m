Return-Path: <linux-gpio+bounces-28707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D50C6BE82
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B1AA34DD29
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3B22F83DC;
	Tue, 18 Nov 2025 22:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PisXwAbO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678DB2264C0
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 22:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506473; cv=none; b=iW8wc9ZIAw7J2CgQc1W4tiEJLHruNgpJrtAuxJOIkHYfVm0aTF41RVJn7nCtMMMtYbhBN/z5dVQtk7hUrJwllctleTErkPQIdB66KD4z9JzcL5shmC2FCA0N7CQkeUb6lUjKIk4VmK7VfC49rq97/5+hGYRrM6DG5vkQnW0GA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506473; c=relaxed/simple;
	bh=LLhZvi0meCVMeQgXAgRdSPpGwpb/EWiwKMWyk95NYMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yw83b1KDc+SAZCF4x9kBo4P+NjeZOJgfKxkXn6c0R2kTwwmcfNXVKfMqWbhaoJmSg7vfTWDNQP4ChoZBpW9UZ7o8ztkfZExBFUGbFQ8SWzNQ33S8jkOCtBkLuegDWDnUkDOJ7vsl6f7AdkbBFSZvUoAkpqSVeqxjOCZbkftbqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PisXwAbO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5942a631c2dso7574160e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 14:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506469; x=1764111269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFEslnX5OR/tQTPRQKyOAUirMOoHygQmu7S/WruwlpE=;
        b=PisXwAbOhg+H8X/crJgkyMEVl6oGFTJNJZDrOnYfG0S9XVT8iQNS8cjJnO+MfcWyj3
         KhBbi7CrHMVLLwtPijCU26V/C4oo6cPPCxlFVe1pl9YTPvLAW/rDu8oZxFvOxMEjHYxK
         fCgUCdTuCecfccKjrQQR8Q4zTszhdcWAvkM5JfUtP/L0+fMKeUl24NvNA+dd6DyyPpb/
         59W4BLX/zFD8wVzAXygbb4w7JPBMiM0ksVa5YDfl8ZKLqguYzpqRLC6HL1/C7dyu17E1
         eNhVEYgSlV0tw2EVM56wTwFldeKcqajkO+NcX379lgvjxWEOZXRDXQ38bPEiafXERlRi
         dXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506469; x=1764111269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFEslnX5OR/tQTPRQKyOAUirMOoHygQmu7S/WruwlpE=;
        b=L8CGBxY8mLsbdPArqymsKKfI+8MTECi6Uw9D6ibrDcSlgD2Lw18gRsNDOTavcuY3Ak
         WpGbQhwpnNSn+m7sBcKZxJGs/OeLfDIyfg/Fm+CQZRccgooO0pKUmr9GoVKVAmmW5hlo
         5JyzjrYvq3f/qRQSojXC6ifK26Gb7tka31bRtV1rBvmCThExhpiHr41Fc882CJI8/D0M
         994bOJy10y55qUEvLAB+pw/IsaB8y0AmeDEZ8NUggZOemfx4nrHdRC8+oAUBK+0Zk8el
         zcrTElQdDH5eIErEyxGkSKKk6omlEHabJROvn5xiUqq734dLVqSSKuZVdkFrBxTViQxO
         cz6A==
X-Forwarded-Encrypted: i=1; AJvYcCUklAIeJdTbLg34FfxhmWy4M0ovnx2BdiQpPx+O0cJewVm7qfBFOCvrzecP+mtTeGi+MCRz5NMZH0iC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9N7XeEZIcYLSvEi1H8Dk1Js7kygHnd0wbCZnk0Sn6aO0Pq+0/
	ULLKKUTaLpYDQ0mTqt7hzc+2sZJofj9pLqApUeO079z1jzsX5v4sf696VQFsNtTFsnSDiz76RDF
	Eq5RhvX0Mb1Xd8giwVmN01vt0u5/IJFiThzbtEN49djufTkGNv3PpKMY62Q==
X-Gm-Gg: ASbGncsiV7pTsrxo/RAJwEPrc/C0Kdcfcz4iametb4FGVGrwpqXQRhIwd/1oGEfDBSZ
	VbEC3NevvhwG5KXpVORZOIKBVVO8VB8s4/oYo91h49eXhS4fEV/l04otxSTRVDBh/7M4asnsJl6
	oN54iSonM1ZyZRU/m5pOTD6D9BbRJW+K6YY38sZ1iHFkTjyiHEgzZHuP4ApUvxJHribiqC2je9k
	GUPb/xogY7nB7rA3hdX9Zpqj3vx/g4La5sW7j148NsYuGEQQNNKuoZO8BND4k99d8Wz8k4=
X-Google-Smtp-Source: AGHT+IE9ROGV9vhyVbxmTa2vMAt23JCQD7kyieRaGBhmqhaspo5Oa//PQBSMVno9CBAFwv1ioBpLtLzQtaaKar+Clxc=
X-Received: by 2002:a05:6512:33c9:b0:595:8198:51ce with SMTP id
 2adb3069b0e04-5958419e6ccmr5957940e87.15.1763506469496; Tue, 18 Nov 2025
 14:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
 <20251031160710.13343-3-antoniu.miclaus@analog.com> <CACRpkdYdtcnxyP4xVsqVK+geurEOEURqZO5eLC96YMqh1sE5Sw@mail.gmail.com>
 <3ead5d7aa5e6be2b6df3bb91b35fec37e23353f3.camel@gmail.com>
 <CACRpkdZf9D2PH5AR46Pwi8UoyfwumKS4P3ncJ=RN4iu_cJzZ5w@mail.gmail.com> <0cd7cf10d47683f22a4358635f243a2dfb6be564.camel@gmail.com>
In-Reply-To: <0cd7cf10d47683f22a4358635f243a2dfb6be564.camel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 23:54:17 +0100
X-Gm-Features: AWmQ_bkcaZItZJt2y-mj9N0PnO4kP_ftuxcc-DBEyiPgOFYDOGAP2KTLLB6hcp0
Message-ID: <CACRpkdbZgxWaf7B7vwD3n-OSbt8h8vGKQ_CmB_SNjDG6aXHayA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: adg1712: add driver support
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 5:01=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:

[Me]
>> - Implement .set_config() and implement the generic pin
>>   control property PIN_CONFIG_OUTPUT_ENABLE as 1
>>   to switch "on" and 0 for switch "off".
>>   See include/linux/pinctrl/pinconf-generic.h

> The above makes sense to me. I'll let Antoniu take it from here and check=
 if
> the above fits the usecases he is aware of. Not sure if it makes sense fo=
r a piece
> of HW like this but if the usecase is for userspace to control the on/off=
 states,
> then I guess we would need .get() and .set(). Or some kind of "frontend" =
driver
> making use of the consumer helpers.

There is already GPIO_V2_LINE_SET_CONFIG_IOCTL
in <uapi/linux/gpio.h> so setting configs from userspace is no issue,
just use the character device.

You will need to add I think two new config flags for userspace:
GPIO_V2_LINE_FLAG_OUTPUT_ENABLE
GPIO_V2_LINE_FLAG_OUTPUT_DISABLE

And update gpio_v2_line_config_flags_to_desc_flags() in
drivers/gpio/gpiolib-cdev.c accordingly.

Then you probably want some tests or examples in libgpiod to make
sure userspace is fine. Bartosz knows all about how to do this.

Yours,
Linus Walleij

