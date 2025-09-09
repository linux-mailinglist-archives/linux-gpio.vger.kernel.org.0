Return-Path: <linux-gpio+bounces-25808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FA4B4AA96
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E2BF1C6024B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6E631B82F;
	Tue,  9 Sep 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJU83v/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EAC246BB2;
	Tue,  9 Sep 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413609; cv=none; b=Ll48k7LGBiyBITspDZymaQ3jqKMRa1xvuhbKQx/drqJo+9Fe3B5d3+hXuUcX4vVIXvsXGvPWHRiMhd/Dlf46kw15trDGsMDVGLiXxVbrzAdBjf4mzXF1Amosfi5CXFuJdKuSWduHspowzB4NpBHqeE2HL/990vrzKar1jHDzGcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413609; c=relaxed/simple;
	bh=rEz0aN1DZaeSmkFl20TGtczLu/dTU/7sWsuulGancGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ajB2bWuEXRaOGyFQ5s+QO8QG7b5lGib2kNEik5ppp7Pbdacx23Mve1J7nwWUh1IAMG+ph+5dPfIj9mJ7BL/xhxigniLMkRuSUSlgh4iGF0U3TkYxUKALzp8E2UStR+/JZPgnP2fjwAktRtJKzxs49S7nJgj8fEQ9tYu/9wo+rfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJU83v/2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b0428b537e5so867026766b.3;
        Tue, 09 Sep 2025 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757413605; x=1758018405; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p9/zMINkp6I2G52UnrSGVXR31frbbxrSuqpqrNwzaTM=;
        b=AJU83v/2f5O7Pi5c2E0NR8rcv5b93hIAJFqX2yk8oTvfy7n2jOaABsRIwv/5eveufK
         KTS15bnUxUYRx7Dnc9TD8iiLtpSxx4neQIKCWQpcqXdSK3+3M55ky2anAXveWqvcibcb
         3e1DPsckoEu0eCJBZ0yc6t5KRt1CQGE+HuvsZrRYSJGZL/UgKPFPxLJonhgfIt2RBqKw
         q2RIsUlJafxzzyaNJSD47INQfwS4h06nxBJ3KQwb2An5aodScXnACf9y50ih63iFnh2+
         mEAwJCuGJlU0VVDSU4/y96hhjwbsJKPXXXhtPF/VOKoW5mdi6ruSwm7+BxJCPyom++VV
         /4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413605; x=1758018405;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9/zMINkp6I2G52UnrSGVXR31frbbxrSuqpqrNwzaTM=;
        b=HW0Oh2396IR8Zte5mnVthL4BLdOUCDV0fxksBudW/yDFjpOsFcTep3oUdi7AnEu8u3
         fWB1V8Bn6GqKpsmlmzhUZwr1K3faALllCZoAAJGAiD/qAQxvOmUjwrk44bhk/8HkEIAo
         GMrzt4IfQpm2Dc8JNnUYtwCHS18CYXvGNkWM6nPCUoFB6HZpkHdIZxkJyvb/Io1ZWmST
         bUy/y4TWD8GPj31X3srdD7+gpSbCPgU/0aP4TU2NN4G02n068tOhgqxGYYhwJqeknxqJ
         ugWdWnrmUyLOzn/H3ZM5KDrJRp/mdT8xUXa/7plSuRajSHK3z7MA2PFFttDpZf1/b+Ai
         LQww==
X-Forwarded-Encrypted: i=1; AJvYcCUmr4zmy0TXnsgsZzyIflFhgrvcFus0Q42TK8ismMrRDrC3264pp7GZpR2uEuUoYjOd5bRjMuWqeCQ45A==@vger.kernel.org, AJvYcCV2v9G8qfxFYkCuH5Tcx+JbOeQdNswVQHY8XubMj+DUi04IVNmu3/PFTcRLUwct2pxVsu9QWxMps6yw@vger.kernel.org, AJvYcCWqzRXJEE984Wo6H/zjdlubPEOqbt+HWhZzreQO35Xp1kPvqcAss6eO1J+lumY14FGQL59maHeqHfDd@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRUbaGey7GOl/YJzvGpHX2bhN/jO5Xti+m3DghgW8LYpQwwIf
	UwFJ78FGOaAF0Msyhk3fVYJG5Lj5ooiHL298NVT8wzeAuHzCoJZ+p1uZ
X-Gm-Gg: ASbGncvSYUcfeGknWx7GQkVlOXMG4a5UCzWUtVl2uCxwQGcuyzmM+4lF/QynvUpiS7l
	RVV46R1D0JDAMXTIswe2lBeCjZRR7sjWvoCjY2yxJnCUzNjAHONrLX7fX4inp5zoL/GbXD6HOUx
	0GYv5NnGCQeyK8oev1V78j/cQozSdN3ZEq9Qt5Zrd+Y3SArvWaaAZ6/F0DoLmyfKh2Kg3Clcr9C
	ZjFUAUSf+uFC7PSW2pHFMw40Ct6S/BaX6bEWHCgnL86WXuRrnq9XATILyoZMDGdh04XTF3NsY5Q
	m35CopRi70/Ur28O9h3lmo1SFWMs7BwJhpzdSQxcMb9Izqjm0yTr50AGs9nEQcq8M/0V7mcg3c0
	e6DpCgFTgYcV7w7JyvK5GoOOX92hz1nhEVA==
X-Google-Smtp-Source: AGHT+IHTXH3Df1Rf1dqjI6E2PBSsbTywdy5Yo3QMPRxh9sB/665p1tcmA0c/zTxPmYuHMcmfSR1yfw==
X-Received: by 2002:a17:906:fe46:b0:b04:1a1c:cb5f with SMTP id a640c23a62f3a-b04b155a027mr1221883066b.33.1757413605262;
        Tue, 09 Sep 2025 03:26:45 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04190700a4sm2245694366b.63.2025.09.09.03.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:26:45 -0700 (PDT)
Message-ID: <4123c67509c54e78b5a24d2704e4bb2b0a07d585.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare	
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet	
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:27:09 +0100
In-Reply-To: <aLgl_9X0_2082SkH@black.igk.intel.com>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
	 <aLgl_9X0_2082SkH@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-09-03 at 13:26 +0200, Andy Shevchenko wrote:
> On Wed, Sep 03, 2025 at 11:05:01AM +0100, Nuno S=C3=A1 wrote:
> > The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> >=20
> > Note that PGIO pins are not set as GPIOs by default so if they are
> > configured to be used as GPIOs we need to make sure to initialize them
> > to a sane default. They are set as inputs by default.
>=20
> ...
>=20
> > +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1)=
)
> > +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) &
> > (_mask))
>=20

Kind of agree and I remember to see some work some time ago regarding this =
but
it seems it did not get anywhere.=20

- Nuno S=C3=A1


