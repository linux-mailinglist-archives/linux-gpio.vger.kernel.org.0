Return-Path: <linux-gpio+bounces-30554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A3D1F5BA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E26483055707
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 14:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390DC2D8371;
	Wed, 14 Jan 2026 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wv8GtboC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26202D73B8
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400108; cv=none; b=nOBw2KsK3dhADwBiQn2x4n4h39+Be5wP88BrDyC4RCTo7RtnbJzx3cxeUBVkcQW5TRWnGdC0ruTrE25Gsna05Zkwje6aepIIKfbPKk3lnus1M4Z+AgLi0vomG0MlXOtes1T/qNmm/kNzR2Fuizb5Kks1nL3pss3jb3pI1YnaQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400108; c=relaxed/simple;
	bh=NKlOFQD6uXj0VWLLS8qWtWdchxZnwtrtwtRRdnryD+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dsyzzSH6RepnG0XW1qSaloVEd8oqUBIoZCF7FFiZiLY/BhS9tkj+cWo6s/5jT7Dqk0+rzEfvvADYxj3Bx0nqKeWKbturpEQrnzTf1Zz+JXbiE1+HXQYXOxwc37CyDx+BDxdvfslHIvbFxVAj5uSEVJ/NxkQusHVA0lW0F4HeId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wv8GtboC; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so511447b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400106; x=1769004906; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NKlOFQD6uXj0VWLLS8qWtWdchxZnwtrtwtRRdnryD+E=;
        b=wv8GtboCLQVEKX3PxvU0xn7QrVV8gNToyphPCAMqAL7T7WFhU8eTGxMoH+NDoFP8no
         akGDuzs0wBcK+eJsp7Wk9d9l1M3gTdI2UNqHMQWablpOzka3O9zIV0SAiwsSzEMTkOg+
         oYVE4Q/aaiFymr4zjme/8z8hkfklGGkVzVN6RElslZp7LjL3bqHmiLiedVDuUdS2/qZt
         rTt1IlsBqcFZUHiVXgZkam0cHwnxa+A6itw71WYhgwXEErqkSBjtGLyew4JOzm3AfYn3
         5gKhJwoyVlmZHsj+I4XWEuTU2CJXTr3A/tVO6SBs4cI3RX/RoZNjB+LPf19O+hvN5nO2
         4AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400106; x=1769004906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKlOFQD6uXj0VWLLS8qWtWdchxZnwtrtwtRRdnryD+E=;
        b=rOuwvfGNkxny/Xnr1/xBN8rdmq4XM/2cXYQ42QfTA0ZcuDII1jPQZGbOdbLFil8d3r
         4yd2FHRu2qbhSbFdrKOD5yPoXPsMeveYV9WCFis8VoDFtXVixXgLcjzbUgL6SWXSGTZ+
         DDDNRH3Zvn/kR5TMm5yk8TccOBLvzsZzwylTAKptyzuJW9ZvFHbziUJ6w+Cq4LL16rIC
         ams3v0B9VMHu/D1TITMzlcClhMlJJNubFmdAKsFJR8+cvKtjNK/C5jf4UKdPWQoFd5NH
         rF4U3badIU47I32jFVvxyZ1ejfGORR/G2/DrVCC1AAMqv7eRYLQPJ38kwqkqlpN1t1yJ
         S40Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9SJu0GEroN2Q0ZEWGF4e+5SSFP3mC4xkT5uIi8vVrODui5Q9OdU8JvaX/r6NWnXHcpc0qddeVSIwC@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiZmaGkH3c56ekHUSJsZCZkxYpREfZDo6lUNFQckovUpwKbl3
	rS/kYWaeCpAS+Vd6iWbctwR2BGc+ZzdUbkYuXrqMmNrDY29OBQDUsoexTkuHBX8F1yg=
X-Gm-Gg: AY/fxX4lG3U9altZz1cvGC7aVWFb2u+P1WNmR+krobNQ7Yg+fjs8HaZkJJcU70+Fa0v
	5q7cTF1fZuKsTgiPtfesz+uw7uZOUSwOSQo+XFja95JNzx89jI0EGwUahIBuq/hsjF/sh8kEDTu
	WGn+wpHpMnOKukswuCczaMvf/+55+OKwTJKaP42l59k1YwUcT8hs/lohd+3VV0mVpTZHhnMR4y3
	2Or09PDPAtBNKKtIHoZVLdoWXKbCM3SOFeTdw1Ut3FR/vbJ0iF+TCAkMBotukkUIhieAuInOpA2
	Yf545CaX9v+KCT57cf2946MpKjq5pgcCoNR1cBjA6IjbPYaslDcpcdAZ6pHW5g97moZjx9SJtMa
	5JP8gR37mRigTW1ngdoaFywTePTu2TJWE8QGxYPFfVHiD4M68d1Igs7RgrITI00bE/PSx8kYKY4
	enuo72StNbUE6s6ZLK
X-Received: by 2002:a05:6a20:430e:b0:366:57e1:3919 with SMTP id adf61e73a8af0-38bed3b0a3emr3088839637.26.1768400105900;
        Wed, 14 Jan 2026 06:15:05 -0800 (PST)
Received: from draszik.lan ([212.129.75.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f88casm23418638b3a.34.2026.01.14.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:15:05 -0800 (PST)
Message-ID: <08a972c7a0fd17260a91f09ce0201167cb6ed7fd.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 14:15:34 +0000
In-Reply-To: <4502ece1dc8e949e23f971a93dc06dab2d4f0bf7.camel@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
		 <20260113112244.GE1902656@google.com>
		 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
	 <4502ece1dc8e949e23f971a93dc06dab2d4f0bf7.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 17:28 +0000, Andr=C3=A9 Draszik wrote:
> Hi Mark, Lee,
>=20
> On Tue, 2026-01-13 at 16:20 +0000, Mark Brown wrote:
> > On Tue, Jan 13, 2026 at 11:22:44AM +0000, Lee Jones wrote:
> >=20
> > > MFD pieces look okay to me.
> >=20
> > > Once Mark provides his AB, I can merge the set.
> >=20
> > Given that the bulk of the series is regulator changes I'd been
> > expecting to take it?
>=20
> Just FYI:
> 1) I just noticed I have to rebase/resend this mainly due to
> patch context of the binding updates.

I take this back, I got mixed up with a different branch. This series
doesn't need rebasing and is good to go.

A.

>=20
> 2) this series depends on another MFD series of mine
> https://lore.kernel.org/all/20260113-s5m-alarm-v3-0-855a19db1277@linaro.o=
rg/
> (again only due to patch context) which is still pending.
>=20
> I was under the (perhaps incorrect) impression that changes that touch
> MFD always go via the MFD tree. I guess that's not the case. I'll update
> the relevant phrasing in the cover letter with whatever you two decide :-=
)
>=20
>=20
> Cheers,
> Andre'

