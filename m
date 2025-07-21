Return-Path: <linux-gpio+bounces-23569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DFB0BDFF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220F5189DCE7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09941D63E8;
	Mon, 21 Jul 2025 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="K4vho48R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC8E555
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083945; cv=none; b=O/QLnaKNyzh1U3fLw5+A1+EqgsbdtGIC8WxsWCtWN4lXvdBUblD5uVzIc0hHW6v4ZTv+ZO6KlWl+6dCXCroUczQMmeNGOLvPr6mVs3uQmterinf1Zo1l2xgTzsVNCMTXGkcm5gcZ4Y/w4eYeYdEfKbmI0yBP9faGqG+vJU8IEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083945; c=relaxed/simple;
	bh=TZNR4qgkd9OfIsqNVEcgXDdq8O+lx2AYFEFmvnKRiTc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mRr/Zs2TSsTush4T8puKDhNHGiriIUGTe6zpi+UjPOUNX2KfasA4z/wMiPghScJsFtckPUSzELqkA2YKJpXKV0Yx09TDCEdvwZvGqoNnc0Xc4o1/sQ0wO4xIuTWlF71Ye25Wn3KG3e1SJMEJLEafZbn+c3j5F1akN2iNgfF2afs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=K4vho48R; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so769202766b.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753083942; x=1753688742; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVlByqVECXSVvsFBpLueeWBVpAgbpTJdOYnjCweSLCY=;
        b=K4vho48RnKOECyEfwk11LPvXqRSshDjRMiHyLEAeovQzFd9xzhIGMOrtn74GRf6cbm
         4ldkzwa3zS675hc4lbRmJGv6bnAKA4qJgWCWTKNuHsfNEPilgK4m9X/Qoq2/3EgFbCxJ
         wbf4gtmLDoO7KDa5jMtdVR8nSxp0uUSB4NNBk3B5OHAzSEVNjr7P6wNzc94rO2hJsCs0
         Hol4lCKyr8tOsnTLpMDv0KRAtQ0tL02j1xlA/SxsvjGSZkq27CWeFyVu7FCxw13ktiwo
         iV5fGAPsDfYcxWzQSmkEa99JRJoeBfTjYQ9zNuGVyltFcjHg/PH18Aq0QxTZiDyVDYAb
         yqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083942; x=1753688742;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uVlByqVECXSVvsFBpLueeWBVpAgbpTJdOYnjCweSLCY=;
        b=NjkEhl6MU4Y08EiUbRiJOVTSvhgEOQbCX9ZkJlNpgpbTwZvMtMcK/N3+Zdp7YAYaKJ
         uZnWzZ8Z9fx6eYocabbIxay6d0xVVZI+muA7lwe8eJvyUWGKLppQ91is6XKXEmnowN9c
         +skc1qqokbn6SP/yE65BC+y/08T6LA2Fc0GWIvOMZIYmU1ECfYdi0yAO8prf0LLvUC/g
         noaOMN9wOi7n1CkvBv4dH8nVjjqwFuDKqItcVzmkU0Wlk3uMqUW8yy/7IAQ2yiB3+On/
         nWxh7WSgJlVFOA+3Iy0PPI9DB7t0/ezPMXoOP8PI8ODW+H4u3BpEP9fBPm4kg7qT76zn
         7ljw==
X-Forwarded-Encrypted: i=1; AJvYcCVZUvpuQyX0qEUeEhepV/TUELPGFCtzK3uCi87o5mjP0X5os6i06DeH1rBiZbozsyyhBAJGgtWVuDB6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70+vtuNKffp7R463exD16GgxOi2pkHVN3FeIfLS/0PfxiTtZc
	vvbXKifyOJGP0CI4Nm+IKRpHxUDdyROXL84QeJ3PmCNNnQWqnpUjgFYrue8Q7ZukYg0=
X-Gm-Gg: ASbGncuJWFRhHpALAUHtvcdpwzlahvZyV2dpmxjabqcYGBWPWDLDbhHOBWwOJhrmNDT
	J+yMQB5jbwC3fvkkaM2TjSs9gpW9WoJ6vFNC45FdjkKAQlZaixhmoxhUxp3Etoss9Ck5DvGjmqH
	2aZnxFB5N2F0f7XnDqp4H/aVeigvfa2KbrfZKTEFiFwM9TOabCqcQ+EqorrEsfQd0ql23r7NvhZ
	ecQlqrpWyg/tnD9JnOfrAw1vWmX/DWclf+g1zRenvAOMoKl8Hxa9r9AGFxkCXlo2Mkji0VAysHJ
	0SzM36MmxSHRcu4R9gQvH7yaTMTPUi8mhLrVoWsO/GMWjBaGrPFDVhOIfVqvOz163LmHQz+J2OQ
	=
X-Google-Smtp-Source: AGHT+IE1xctQC7ikwT6yxDF0P8FZHTIIqdM6YJ8llSuFM5vh79Vg8rY/ExuGuZueqdhMN1mDq3S9PQ==
X-Received: by 2002:a17:907:d70d:b0:ae3:6038:ad60 with SMTP id a640c23a62f3a-aec65abd497mr1089079266b.1.1753083942046;
        Mon, 21 Jul 2025 00:45:42 -0700 (PDT)
Received: from localhost ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm629952066b.83.2025.07.21.00.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 00:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 09:45:41 +0200
Message-Id: <DBHKE4GL37MI.1Q2HBRTVT4ZW@riscstar.com>
Subject: Re: [PATCH libgpiod] bindings: rust: make
 Settings:new_with_settings() crate-private
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>
 <DBHK5WGFR034.SME6DH80HYRV@riscstar.com>
 <CAMRc=Mej2oAp7B3obnBv-pB1sg3P-1EQnUkpneoVqu2wCEwwCg@mail.gmail.com>
In-Reply-To: <CAMRc=Mej2oAp7B3obnBv-pB1sg3P-1EQnUkpneoVqu2wCEwwCg@mail.gmail.com>

On Mon Jul 21, 2025 at 9:36 AM CEST, Bartosz Golaszewski wrote:
> On Mon, Jul 21, 2025 at 9:34=E2=80=AFAM Erik Schilling <erik@riscstar.com=
> wrote:
>>
>> On Sun Jul 20, 2025 at 8:16 AM CEST, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > This function takes a libgpiod raw pointer as argument, is not
>> > documented and should not be part of the public API. Make it visible
>> > only within the libgpiod crate.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > ---
>> >  bindings/rust/libgpiod/src/line_settings.rs | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Reviewed-by: Erik Wierich <erik@riscstar.com>
>> [Changed my name a month ago]
>>
>> But, this should also be `unsafe`. Will post a patch for that.
>
> Feel free to supersede this one, thanks!

Sent it as small series on top of this one. Let me know if you want me
to resend with your patch included in the series.

- Erik


