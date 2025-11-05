Return-Path: <linux-gpio+bounces-28136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1BC36FDE
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 18:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824BF6467AE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 16:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2E6343204;
	Wed,  5 Nov 2025 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1ZDJ0xv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70033F8D4
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359309; cv=none; b=HTxLwTdSuYWD3ASVfpy/57MtRLyoQqn7tduGajt0lVF7KMkLITY3qiMOMeAPorDPvbswX2jP8cIeV5Dm+c5sn24ilUVCQd3E79sZp9uAZrHbvKxHx2KFSjVD3Rf0E0YfFysthwM4gJclkshIkrCtNCX9fvtSWeQ34hiqTEpRbL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359309; c=relaxed/simple;
	bh=uO/6iVYZ1vFXrKMD4kA3PYSBEGhevKLmMat7U8ijANM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9A/6ecZLT87iHZ3egs2hQYPFEKUKyQ/XPQGLyZLEOa+oW0NqsBitg3m5qZHUxuO5qCq8tV4SiI2ilEaIXilDrZ7dyeIsbSKbmPdtJ3Bt7yha8huJFO/g9sROOMABEnOdcbmZev2x27Ja49qIzKpEFj/w3GSzQtKZeOEcSdcNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1ZDJ0xv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so5818674a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762359305; x=1762964105; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PW+009+mxrT5Q7b6yvU7pEoFhY6Kftp+LN/SDJfngBw=;
        b=V1ZDJ0xvb7uRoFrhxUzsIPQlte8MdOkz2Novsgvdv55wo47Ukt/fgjcSmjlWY/lsvC
         XcqnnhuDP8NgVHCCOv78l9UxIkMfrdRjEyxElJK9TUX2Xb0g1N7v1XafyyGB/JzpoSeb
         cLmFdgZUMjEjd8euY9cicGuhRfaIgOhSDX6F4MJCoZ/FKodLgpmePVnBQQB1Rc3FpBGy
         Vr1iAx+UQA8rSz9UYWy9Bq2Ij3BsFxmq4PeALc3ZsCRaJzdLolTvH6k/CWrCAAeg77WD
         wF1XvZWMBgAQ8RjEA4pyqTEQlxWWWfu/mfHlEWMtlBXDSB1LBihExDRK6dcmSN/sdupe
         yfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359305; x=1762964105;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW+009+mxrT5Q7b6yvU7pEoFhY6Kftp+LN/SDJfngBw=;
        b=HQAix/syL2fuBNLn1Xm4fJUdSk0T8ANFio++u6piHKiWEB9XG4Z57lyclSAuP6Po5/
         YZYGsmUlaOkjnDFsoQ47boJmSqO/3r2PTz5VDWxtE4hM1DjFsNQwHE7QraXIeQFb2/Mu
         Z6TytneW4IGDd4A+xcutVIArtCqkylGHXuWQdxE3Td7X0ITX0bNguu45SkCoAfJOfYiR
         /k+sI2YuujPTSvnHsAZjxnvOt+pCEPmiYvIyfPNEOsx94jWzDJ7cm3GySwjgvsSBCqQL
         d5Mli5+DXJYDj7vQlVDzmMVnnPPjdzro/f4SJlR2FMLdaBzlC/7s6GYtD6SlO6UV9J/5
         x8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUCY76qTIlSRCj+NgkLQcePN0EAbspgVR84BnbuFHREhC/YuRJfqZeWt693THr7RVZ3iWGZMCvSjj3S@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnZnu+uH2s3yLavMXPk2c5HY2wHuhpVPipO4dv/ZDVvYb3bW2
	qASMM8jTdI65Pw8T74+aSSXLJ+wN3XrSIyAYWpsRApC5iBKSgStvNB2ZCnOR+K8fNyc=
X-Gm-Gg: ASbGnctOtDsTbuFKCK41IHQGyJrjGaBFqeyv1E0AQ5qi0/DhXKzwq6C/zssJKGjOgBJ
	9fvAgt5/rdgmFpLjl4Otg37bRSGuy+3Ev7ev0VU8ezZw2vz1Er4va3YvP/M0W4kIwtV820F/Aq2
	8wa2i0iavK4At59VcEujseK9i5DbZf3zXHI7mWm/RhPkIGA5e7h1IkEj0gVIqWqPBlH6Pyg7dtm
	ZZhXpJvyRrlnZNXS3lYzK6Sh0ZFLQpogkTt+w/obQHqFv/G8PSR/SB3l0+E2C2blWWkl5D9VbSS
	SAqy/VycXwqbAoTLAqlHNLy57K6uVV3vXQQEOyFnnIqRy98OTlYDOZwWaOMvzVl+Jc5TSY1vR3/
	Qxb1T73kdzC/rRLAsR4sAE/ls/pd9a3mM1Wafm9Fpt65RDwmm7A1eJasrzIbYaeXmbHoK1kJbMS
	+E6/oJkdUzRLYK9uR8wP+pVA==
X-Google-Smtp-Source: AGHT+IF4JPIePgklGlaLoqm71Bu7ApcoRu6iTmJ5L4gpcRDvE83BvmdQI2sf+Wxgg7a+5Eyn5thE4Q==
X-Received: by 2002:a05:6402:13cb:b0:640:d0d9:71d3 with SMTP id 4fb4d7f45d1cf-641058a2312mr3606599a12.6.1762359305340;
        Wed, 05 Nov 2025 08:15:05 -0800 (PST)
Received: from [172.20.148.133] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e680578esm4923886a12.10.2025.11.05.08.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:15:03 -0800 (PST)
Message-ID: <8f05eb9644d1920f7158c19d769c943fd5dba9a1.camel@linaro.org>
Subject: Re: [PATCH v3 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Lee Jones <lee@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 05 Nov 2025 16:15:02 +0000
In-Reply-To: <aQoNPvwUCE9PijJ6@finisterre.sirena.org.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-10-b8b96b79e058@linaro.org>
	 <aQoNPvwUCE9PijJ6@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks Mark for your review!

On Tue, 2025-11-04 at 14:27 +0000, Mark Brown wrote:
> On Mon, Nov 03, 2025 at 07:14:49PM +0000, Andr=C3=A9 Draszik wrote:
>=20
> > REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
> > allows a more natural declaration of a voltage range for a regulator,
> > in that it expects the minimum and maximum values as voltages rather
> > than as selectors.
>=20
> > Using voltages arguably makes this macro easier to use by drivers and
> > code using it can become easier to read compared to
> > REGULATOR_LINEAR_RANGE.
>=20
> It does introduce an additional layer of indirection into the validation
> that the configuration is correct, the reason we use selectors is that
> they should map directly onto the register in the datasheet.

My datasheet mentions the range more prominently than the selectors, and as=
 driver
author I can easily validate both (neither macro does any validation itself=
). I do
believe code like this:

    REGULATOR_LINEAR_VRANGE(200000, 450000, 1300000, STEP_6_25_MV)

looks more meaningful and is more naturally readable than

    REGULATOR_LINEAR_RANGE(450000, 0x28, 0xb0, STEP_6_25_MV)

as it's much easier to see the actual range without doing any additional ca=
lculations.
I'd prefer to keep the alternative macro, but will drop this patch if you r=
eally
disagree that it adds any value


Cheers,
Andre'

