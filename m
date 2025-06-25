Return-Path: <linux-gpio+bounces-22201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7FAE878F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 17:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97FA5177D68
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D2126A1AB;
	Wed, 25 Jun 2025 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tzh2zbhz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1C26773C
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864333; cv=none; b=hw8ubmh8igm7mSXzvjIH8vJ+1hPVo1fM8irWf9eTk1Qc/GMsh4q8CvrNdDbqetT6JmBeiqeH6DIwqE2gR70tZBoSAxXVXXLBvJJERrJlPEKoxUpAQ5Hf7kW6F0LNAzS4uVR+xxUmVorbrGXE+4WtKob2JAKRt7wUtj5YS6HUmbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864333; c=relaxed/simple;
	bh=MyOeN1BOVe0tVdXuH6wdqHh3iBo9MBd6JpkNczrI04I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZN6yoQn/s48w3iX5z5hjgd/UkOBh15NU8hqJz2FJR+EQl44YEGeHz6uTnji78mDYTTA6K5M/SEWec1aQLgxTfjdzXLUB+/JzxezWfFCKWHrBbn9tsfFjEX+AtJ3+KDBS0ZfQCm4jR09nx0VdDcn4vk8figZKlG23CTdJxuwgRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tzh2zbhz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453634d8609so13467295e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864329; x=1751469129; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MyOeN1BOVe0tVdXuH6wdqHh3iBo9MBd6JpkNczrI04I=;
        b=Tzh2zbhzXRzrR/6pacGnEH3xrQU7dHwksWZE00xO4o/nTMoPVGh6FStKTEyA429DfN
         q5wvexfNoV2d0pJaLDpznnRkSm6/4G8HYn7uV0/vXNSeP3G3OHhvxp8xnoJ0V5SceMst
         ER17LHEVgd6PRJ0bdejwSquKkHWkHPnHRna5e75vqZ5sMvJgTMZvBXTPz2S7NpCZCzVe
         lDCfkYoLcUTM1BfN05/hyqEoU8HBm1GNWWpKC2KwwR4ABngvOWtG3eMMBJqRv930LbpA
         SpW9WkI/VM3+7QStrsCMjaD7vUqqOiVtBiU9BRFwRw671MLpJBBOqgSYpKi2VAFzjuIU
         KxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864329; x=1751469129;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyOeN1BOVe0tVdXuH6wdqHh3iBo9MBd6JpkNczrI04I=;
        b=Z2kD5aSxW/2de7BNpGd6WMDuPaeYEor7fWEn+9Gt0dbINJzpR6oOLj1aYbjsNWzvdd
         udwk/6RmMbgfvITB4IdsgQFasInUGCy2ckD1ppsw2lJ2W1Ths2vPTF7sTOu7yMpryCVb
         RaZF+PxfczCeS9c8cncAx0SPoL5fwBLTnPAWsDq83FzzM9TYNPIguYjOj8bF+2lT19Tw
         sVmiSAy/QkueXJVS9SD/X4yc4HPv1MVayqUDvQy6l3C4TdieqwNXiVZxl86XwIiggoiP
         FII2/BU0z19m3sjJsHtSJekS5+eiv2goucEfp+RTdsEwWDJQBInfa5aQjGBNyER2KwNr
         /J/A==
X-Forwarded-Encrypted: i=1; AJvYcCXHMAUIAOGvGt2hzQAUtg9n2W+FnQVhy9HvLWnVk9ULtM/zc5QsNPOB9x9bimGSGGToXT+Ui+EbRcDb@vger.kernel.org
X-Gm-Message-State: AOJu0YzEs5n9Jw8UWui+Y/68kKZ0nsntW6yUN/r6ty6NxddITWydxzif
	WCc6ApYtS+p16MIDiojTNscR1c/HHyRv+iHnaxorOcyvRrMMuMytzddo+GQUr4+Oaqo=
X-Gm-Gg: ASbGnct5tYyYZGJiM7RiMqe0GIgx/e+gIytHaoz9TJ0e5xtWceprvrgx4+0P3Fu3mWD
	r+q1gfQsbtu/10UBOQByt3nsyvb2paOxdN8j7sNMM84ns0Nta/naHcBYN+nLPWRrWDIPzY/W/tN
	qdTjad7BixXTlEVd2aZtPEtiCn6bt5oH6ptGlEc/XxgYKe7B5cBtBuykqBYjrPNAYB16An65aCc
	bbNLm+RZ062ZdhkUprkl6e+rdC4unf9HyfK6j4XRZeSU2BYmn2c3cfIqq4obqEBMDs5I27xBlwz
	bor24yXEPKCX4rDF7dxKgF7PqBJsUZpUN+FPoLSbIetgiqi5jDC0LuaQe2+bwEW9wQ==
X-Google-Smtp-Source: AGHT+IFSg3dibVTIEpD6FpD0UUWYk6yh5yAs3N7EJ6HO9SoNfajU5TZY11EXzo28LUVmj7JsxNhSvw==
X-Received: by 2002:a05:600c:4f07:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-453886d3649mr1206935e9.1.1750864328873;
        Wed, 25 Jun 2025 08:12:08 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069534sm4740368f8f.44.2025.06.25.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:12:08 -0700 (PDT)
Message-ID: <e29a3494986d78ca964846b54fd3e5bc78e4afd4.camel@linaro.org>
Subject: Re: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski	
 <brgl@bgdev.pl>, Peter Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 25 Jun 2025 16:12:07 +0100
In-Reply-To: <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
		 <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
		 <20250613141902.GI897353@google.com>
	 <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-13 at 15:49 +0100, Andr=C3=A9 Draszik wrote:
> Hi Lee,
>=20
> Thanks for your review!
>=20
> On Fri, 2025-06-13 at 15:19 +0100, Lee Jones wrote:
> > On Wed, 04 Jun 2025, Andr=C3=A9 Draszik wrote:
> >=20
> > > Bucks can conceivably be used as supplies for LDOs, which means we ne=
ed
> > > to instantiate them separately from each other so that the supply-
> > > consumer links can be resolved successfully at probe time.
> > >=20
> > > By doing so, the kernel will defer and retry instantiating the LDOs
> > > once BUCKs have been created while without this change, it can be
> > > impossible to mark BUCKs as LDO supplies. This becomes particularly
> > > an issue with the upcoming support for the S2MPG11 PMIC, where
> > > typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
> > > rails.
> > >=20
> > > The platform_device's ::id field is used to inform the regulator driv=
er
> > > which type of regulators (buck or ldo) to instantiate.
> >=20
> > I'm confused.
> >=20
> > There is nothing that differentiates the two, so why do you need to?
>=20
> On gs101, we have two PMICs, s2mpg10 and s2mpg11. Several s2mpg10 LDOs
> are consumers of various s2mpg10 bucks & s2mpg10 bucks, and several
> s2mpg11 LDOs are also supplied by various s2mpg10 bucks & s2mpg11 bucks.
>=20
> So we have a circular dependency here. LDOs of one PMIC depend on bucks
> of the other.
>=20
> If all s2mpg10 rails are handled by the same instance of the s2mpg10
> regulator driver, probe will defer (and ultimately fail), because the
> supplies to the LDOs can not be resolved during probe.
>=20
> The same goes for s2mpg11.
>=20
> The result is that neither driver can probe successfully (unless you're
> _extremely_ lucky due to parallel probing, but we can not rely on that,
> of course).
>=20
> By splitting LDO and buck rails into separate instances, this circular
> dependency is gone, the buck-instance of each respective driver can probe=
,
> which then allows the LDO instance of the other driver to probe.

My next version will have that changed to be fully granular (one mfd cell
per regulator), since I've come to the conclusion that the high-level
split is non-ideal, otherwise important supplies might be turned off during
EPROBE_DEFER of a consumer, affecting unrelated consumers (rails) that
haven't probed yet, since multiple consumers share the same supply.


Cheers,
Andre'

