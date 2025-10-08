Return-Path: <linux-gpio+bounces-26913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B1BC578D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 16:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291A33E075F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 14:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BF72EC080;
	Wed,  8 Oct 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMDQBWcw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07AE189BB0
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759934708; cv=none; b=e/KqZiDDSTkbKXEeRhUi9zJDRhAH8//fNpXgWdt3+HBT/anPhKVq/tdcoMAa7xmNMKpd0BoCBbgP868zfvW/0LxCnHdH8LiVfgS9A+3MyBTmBpfPYQa+7S2wJGNkAz2f7/hxGk4EjFyikn7umX9/8l3+y4Dxx3CSre3DU9a1Xg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759934708; c=relaxed/simple;
	bh=ZpZTp7yLydk6k9ye41mhs7FwaHpLzcQvOs7lUom/qWk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V3czxev+4UwLhGlSJnVRKed7S0ZRi628na4b96EPGKmUUZ8bTxSYnoLAKbScoS79YFJKIMKbmHlj6hF3PI/zGgfZ6qV5uBiizLBdFz+mEPjzozOaX7d6KxBZ1Y708wDWNouxJvZw8QUgvpEcJ8MY03AuNZWoOXxYsUmlCeo7xsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMDQBWcw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4257aafab98so3063713f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934705; x=1760539505; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZpZTp7yLydk6k9ye41mhs7FwaHpLzcQvOs7lUom/qWk=;
        b=GMDQBWcwa0qlc/DOJM1+KmKRduGoK1l8vHWFHXusrplH4HXy9dEhrS5PLR94Zf849h
         /+PDu7egpKRgH2x2hcEzQ/bAeTOzmnkhdLdJdRDC7IaWdU+bcFzLEdpfJHV38mVivb0e
         2YZbCsUesNC/PQLVIHyyGjH5gwxviaquvz1YIqfCa54SaIVmTB0FcKBjvdhiJFW+a9Xf
         FlTJilzT2/7EHX0KdO0FtyfC7IoLw/DvYHTYU1wRerKQv3eFl4DShJ3NTUbZZFdy+MS6
         VGO4pcWVY20ynFfGXobRupXPC+4zg3yFVtBPragWM9H5faYObMX0YJhATjxFLv4AY2Fd
         Lf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934705; x=1760539505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpZTp7yLydk6k9ye41mhs7FwaHpLzcQvOs7lUom/qWk=;
        b=aFu76B3XYnA6IWNSLkF+eii69vaLnvtDjzFhDM2Jl+tgGnx0Csw+dFxqcazwPiE9XR
         HZ6xPNecUyfj7jH+Wqb3lUyxA09Eh6ZbDW8H5v3pt7I9MjRSZMtZw5vq7uzfQtGt/MsZ
         WpygmBrBa+tCjU2S0Xpr0v1iOKg+Lllg4/7DEedof4J9d6QxchKGAR4t7PVX7xQLsuHM
         U+qTzmIosXjgFHXk95Z0uTAgxIoaAi/n9QuSzqpHkaN8P2YA0TRVWVgUAI3xQiYwgeO6
         DvEspGHVjTWPvHqWNhmOa7UVV2iardqPKeAYGZ8JX/lMhlNRvwB7AiYv7IHXWA7Fa9ex
         eV0g==
X-Forwarded-Encrypted: i=1; AJvYcCXPBjZK4z/FtnIWBQGi5vZoUCZqWYw1jnQ/tgvKzk6GRxX6qLs55XiucC7GgG5SPPWywogkKXRiFxeu@vger.kernel.org
X-Gm-Message-State: AOJu0YzyyWHwu0lErbyXE/h0TSnDYkcYGXu+F+rKvWTp3gIN+hbOglsL
	Wdj9kGBSo2ZHqLCntFzDO0K/uNJY8dQrk60kg2LGsrdBpbgmo0aZJ9b2
X-Gm-Gg: ASbGncvEe8A8KEYg5dhvSVD2g4XbYI6EWku+p/MgT6yTIauAYvrsSiP7rPwUoSSAEd9
	EKLPY2XOeOy7F7uBDb/tTv+6nhmx7ZFlhuxkl+lkp8ksTDTcOSVXRsaXie6f7pQ8/+CiULPYAxG
	jZcGBpbDJeXfzjAXOoW0RviMjKIvrFlw4cg3NkE/rhxCiAI9IYiu+LKD0D9yCNZut6sS1UZGI3f
	omqAVazJGlSkDAXsQry3eypDeJHRtacXzgLIczIxjVc5X5Z5DtbEPeOZ1hk8IHcK5atm5oXkIfP
	nD9JEY7sWbxXDqinv2coPhJ7hQF2PFMudOj+9mByzQvd068TnSw9eRVRPMXdxabCxEZNj4PqPin
	/N/NjdtL4xv6ZC4mUDawX5y/Gnvt229h4WzCR8cM3+Qpfw1yRPpLnEdI=
X-Google-Smtp-Source: AGHT+IGyW6szpwhvT6chXdh5vwNAgphskxs4Ai59Y5ewBvd0PpuY0IRo0TwoSwCgStADlhmhCDZqJA==
X-Received: by 2002:a05:6000:420a:b0:3ee:114f:f89f with SMTP id ffacd0b85a97d-42666ac6b77mr2395334f8f.15.1759934704901;
        Wed, 08 Oct 2025 07:45:04 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab909sm29667338f8f.19.2025.10.08.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:45:04 -0700 (PDT)
Message-ID: <fc44bb98125f882af6ded5d812ad271f3fe06630.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jean Delvare	 <jdelvare@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 15:45:34 +0100
In-Reply-To: <9312235a-b051-48fb-985d-be2b1d3c7c1b@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
	 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
	 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
	 <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
	 <35733a7a33301330260c01b1e59af904c8c4da6b.camel@gmail.com>
	 <9312235a-b051-48fb-985d-be2b1d3c7c1b@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-10-08 at 07:11 -0700, Guenter Roeck wrote:
> On 10/8/25 06:07, Nuno S=C3=A1 wrote:
> > On Sat, 2025-09-13 at 04:02 -0700, Guenter Roeck wrote:
> > > On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno S=C3=A1 wrote:
> > > ...
> > > >=20
> > > > i2cdump -y -r 0x41-0x79 1 0x15 w
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,8=C2=A0 1,9=C2=A0 2,a=C2=A0 3,b=C2=
=A0 4,c=C2=A0 5,d=C2=A0 6,e=C2=A0 7,f
> > > > 40:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b004 0000 b00c a03e a03e a03e 250=
1
> > > > 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> > > > 50: e07f e07f e07f e07f e07f e07f 0000 0000
> > > > 58: 0000 7002 7002 7002 b07e b07e b07e a030
> > > > 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> > > > 68: a004 a004 0014 a004 a004 c004 0000 0000
> > > > 70: 0000 0000 0000 0000 0000 0000 0000 0000
> > > > 78: 0000 0000
> > > >=20
> > > Thanks - this should do. Note that I am traveling and will be away fr=
om my
> > > systems until September 25, so I'll only be able to look into this fu=
rther
> > > after I am back.
> > >=20
> > > Guenter
> >=20
> > Hi Guenter,
> >=20
> > I was planning in letting merge window to come to an end but I might ju=
st
> > ask
> > now. Have you forgotten about this one or do you want me to send v3 wit=
h the
> > superficial review and then you go deeper on v3?
> >=20
>=20
> I have not forgotten it, I just ran out of time. Sorry, I do have a paid
> job :-(.
>=20

Sure :). I was just not sure if you were expecting v3.

- Nuno S=C3=A1


