Return-Path: <linux-gpio+bounces-24348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09CB24443
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 10:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB90918939B4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5F82D8382;
	Wed, 13 Aug 2025 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZikyTQhy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC8D2D321F
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073480; cv=none; b=TKiduEoG/0PJQicHKfAppNsfhoS5GONV3zOZ5VPxPYe0L/yLAO/9tizYN65ZHbU72gL6GoJTcjvzTityYLXnn5DMXoDZw3J/PeenP4QBx+PB4e7HDtLl7XkoGB11ZMfT+EfOwwglD/T4DL0UCTJK1Z6HhHp3lFem4luwfvVY9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073480; c=relaxed/simple;
	bh=eH0iDwrV/6utvvXB+CkUz6MJJYuqZosXUH+qJBkUA9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=lGCRe0GR5hrbnUzmm9hMlMnoKIaEo6XJuMnhB0i1Lsm3EoAOvqcpV+7L5JNT0N/VPqD4oozNCbVNMM9DOgpQfQ3E4FL4pAA68qLsuYntqPhp0gX75uTtCqgVPIM9H3Yydo6rmtBAVdOMCMImXne+SHQ4itdP3qEgG15fzvtSG40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZikyTQhy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-458c063baeaso34374715e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755073475; x=1755678275; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL4JTlkBnUU3pQbHWqqEnNHyehFqc3nhwRIbxa3a468=;
        b=ZikyTQhycbQ55Y//XZBlsOcKsbgs7k9UAMxk7B1zAy3zLHl+sGiGvGPUdwvQY31x9y
         GHbQA7J7kJIrz8O0gbQc67Ae1uWxVqlFTVUu//kjJkd4tIll33sODmhoIovp0BcMmIPl
         UKAH6gBYIblEMowvy3BXw6UVrGUeaOg6mn5JnVQhwG9+fjzrhrVL76/t6t/PDkz41s7B
         04DlF3qjx3DRUfULHvicXMUYoCig932XA3QJ/XOkx6ZuJBmdVnb/3XYA1Fcm7wr7DyMZ
         xxtgxtnf5raP07wrJ1u1izAPk7wpZcVm5SzgtHDg4A6m7QmbnlYQA1nJtZw4iab6NYaq
         MlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073475; x=1755678275;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BL4JTlkBnUU3pQbHWqqEnNHyehFqc3nhwRIbxa3a468=;
        b=uUUmohsljDaogjNcYfsXwHLOo2jYTuIU0ENaBN7OprWg5Rl+LRvhbkYwFhzlHFJNzr
         WBk3I3o7X7cljY6ZwySUrR3o0DkjemhB5hPEIrpEXHN8jyaDcfcrBAktdok7A5D3POvr
         tWi2UNdLdSffirOdEV1DZqr8jM9Ahfr/EpKx1tqhLZ0r21sEsYfP4P4jIQgCltiqh36i
         /IpXTWoxn8S8qs4TNpRuyHC2jKNjX6sISxDmzZIwf2E7ur+JMJPGggIQGG8nMus+F9KO
         P9aeMV/zOcrFQ4J5BceeK5qxQWRGVeZ4FTZLmcjdJSeFSJSHoXYkxMmZJcvzwB+ZbT1V
         Nvew==
X-Forwarded-Encrypted: i=1; AJvYcCVT/zAUqBWkqINNvrzt4z23tN14waroBEg9mAwrRauiBX5lpcpRqP4VYc9ZA3RAADCMYvxgezNbTqZy@vger.kernel.org
X-Gm-Message-State: AOJu0YxVLwMT59N6jNNY08Fw6nNHEUzt+OUrnMpg7TM48EzOUwu53utH
	Z+xtQk83vOUCv4C2aIdXbY0cR1wnMyXZDuxvQKbU+2AHJmdxNRr5KLpcBy8suhoK+5TmCwCo2Pv
	RI3Kj
X-Gm-Gg: ASbGnctr+VhRUdHRzyQCzW8baXxqiV/i/1zAmJF+IenUuwBjY7cvsegj5BG3dJ2zpx6
	/HDaiER3W36MG2YCuUWx+AQkQtPIGBPO42H6r9sSztPGnBtCp4pxalRMMxp2otPQB623/zJUXW/
	HR40Vl+eicRmE9vemlIjpr+hgedMnOsv3pqIQCti6DARwqSbOdE2YYHUVDXSel3SV3kXKLqRYou
	x+63UygKTzs+GAq0AmXZbCBClcOff6Yr1VHDS2TrwGBEXHdqaQb3/MNISu4ySoPG21Md62ODS4y
	CzrxwIfvWRw5U9vWKPNmRvuTJdQxYgcajRDoy1miZPCaNG3TMexK7odY8eNRtPX4WSMizVKy4A=
	=
X-Google-Smtp-Source: AGHT+IHQ6Q9mrzkw2ATP9LdprTkeXVwozFH86WFv3bA7LkFluoq3q40WFAFjLtu1zstG+dgkgptvkQ==
X-Received: by 2002:a05:600c:46c8:b0:458:a7fa:2120 with SMTP id 5b1f17b1804b1-45a1664b182mr15590015e9.25.1755073474770;
        Wed, 13 Aug 2025 01:24:34 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b4:9700::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16def069sm20282745e9.20.2025.08.13.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 10:24:33 +0200
Message-Id: <DC15MF6Z3ARY.LIP79ED7CRB3@riscstar.com>
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 08/10] bindings: rust: update intmap dependency
X-Mailer: aerc 0.20.1
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-8-372d698f23e8@linaro.org>
 <DC13RGU9W9ZT.CZ5AF2NIEABS@riscstar.com>
 <CAMRc=Me2GchOakK3Hb9g4MBESqZ_tnO87ycnZ8QUc-rbJib=6w@mail.gmail.com>
In-Reply-To: <CAMRc=Me2GchOakK3Hb9g4MBESqZ_tnO87ycnZ8QUc-rbJib=6w@mail.gmail.com>

On Wed Aug 13, 2025 at 9:18 AM CEST, Bartosz Golaszewski wrote:
> On Wed, Aug 13, 2025 at 8:57=E2=80=AFAM Erik Schilling <erik@riscstar.com=
> wrote:
>>
>> On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > Bump the intmap dependency for libgpiod to the most recent version. Th=
e
>> > IntMap type now takes two explicit type arguments for the key and valu=
e
>> > so adjust the code accordingly.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > ---
>> >  bindings/rust/libgpiod/Cargo.toml          | 2 +-
>> >  bindings/rust/libgpiod/src/lib.rs          | 4 ++--
>> >  bindings/rust/libgpiod/src/line_config.rs  | 2 +-
>> >  bindings/rust/libgpiod/src/line_request.rs | 4 ++--
>> >  4 files changed, 6 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpio=
d/Cargo.toml
>> > index 8b719b7647910269ca2c91fee685da7fcc67feb7..d7fbe7b3669750880b8158=
32a2e5d7c975ed4d7e 100644
>> > --- a/bindings/rust/libgpiod/Cargo.toml
>> > +++ b/bindings/rust/libgpiod/Cargo.toml
>> > @@ -24,7 +24,7 @@ vnext =3D ["v2_1"]
>> >
>> >  [dependencies]
>> >  errno =3D "0.3.13"
>> > -intmap =3D "2.0.0"
>> > +intmap =3D "3.1.2"
>> >  libc =3D "0.2.39"
>> >  libgpiod-sys =3D { version =3D "0.1", path =3D "../libgpiod-sys" }
>> >  thiserror =3D "2.0"
>>
>> This lib we also expose types through our public contract. But the
>> explcit 3.1.2 floor does not seem to bring any transient bumps of
>> rust-version or other libs. So it seems reasonably low-risk.
>>
>
> So just: intmap =3D "3" make sense?

Yes!

- Erik


