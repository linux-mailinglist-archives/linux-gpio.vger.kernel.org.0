Return-Path: <linux-gpio+bounces-22199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3CAE876A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 17:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94700189FE91
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2BD269AEE;
	Wed, 25 Jun 2025 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKSQ+wo9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6147269817
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863940; cv=none; b=XgAjhCwQ55Pr5UFzZpCvdIHT1d7LOJqfxDJk4wTaqTPpgcK1+VE25wdD/V8teVdseRJbVdHpzIkw8w64Y7ZFoPUastknWj/plLQKYXbIIghj2dhrwgvTC0mtBHxYlSdHZ0g+KyDtJPe8c/P4xc3FiOOHW8rvHvi5omyHqRS9ddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863940; c=relaxed/simple;
	bh=wlj7HklWXe5YtCatjQKwWuAP/xP3g/dB4xsuny3pKlk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tuBPXlZC/nHreol0FviH/s9ScmEY2EGRLqaW4TFVClMM7buML3E9AtwkU3BNrnuJmOo/T83G4mPK3j8DUsBJaa82pOKlP2yd4DTiiwh11Qhp3Oyk3pVs4kAFfPHS+qG//2AMxQqMTmqCr4CHvVFS6z4P5CAL48nmeaqtrXWR6JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKSQ+wo9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so27787f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750863937; x=1751468737; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wlj7HklWXe5YtCatjQKwWuAP/xP3g/dB4xsuny3pKlk=;
        b=kKSQ+wo9oT4PkbrUUZKhpI+S+N4jOlQGfiE8lvJWDeGpX8dhARAQSHw6Zd5qkTLbm2
         /rZ2srKSxSFCLeipJLGV85UllC0v60+4WdUdKmS3isHvluM8yN4kDtgZTXPd9vBQ+0xQ
         b1kdAw0P5xPgiohw1eb0X5AZCd7OoRz3Zgm5GBJOw2DuqhJhGCuHLHEJ7IPxTdVPE01U
         WOQhacOtW/oRcYO7YIoJYvu01RheQr5c0MZYn1zEBXmung0hdZ5XO53Vgl6QYTASHgm5
         tF3a/cpD7F59refays/NJAGYlVtedrQg+YKWKVy21xnxMrgNolepnscnjbgHrZO61LDA
         MY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863937; x=1751468737;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlj7HklWXe5YtCatjQKwWuAP/xP3g/dB4xsuny3pKlk=;
        b=UA5ytzSjRfcuiRfsFtmMJhfeh6U7yOugRDPLPylmF1K7tjoNo4Iy9Kaxtvf8qcYu+N
         eUW1/XG/rAlR29JkyQvqwjMB1155xDDX7BDWLfMjiH3DsmjLMSOsA48JrHj7dMuIV6jw
         hpZ8pmjBP4W7ClwEilaDpt6VxpoOTTYA0epf6DRZCPIwPlkA/GnrxVJ0eZ5fm2FhsOD5
         xEJGKBBuFwUQP5Qi/XYYBLc7040cn0v3Zo974ROVujoPE7RGekdLrX3/SiYMDwUc2aKo
         XJ3sOMb0/L7HqfhMFv+qe0bKrGkx8+JMt/jPZ9o2TEZjeRHmShheeKpqxa4m0WCmIwp9
         mQLw==
X-Forwarded-Encrypted: i=1; AJvYcCV+psUyKhaJGLv3TydXpVpGQIw+2lwYX3qyYlTVOBtOEsiPzeaLel8TVBs3jJ1KIAs+rWaJLXjqHLaT@vger.kernel.org
X-Gm-Message-State: AOJu0YwhaRg43kDtlXKTUznMAqAAUHt9yXDsS/Ne5yFrrncXpbtgglah
	it9kCrRFP6Vq3QFV151vufYr85Fwb+ulSWiwA+iS4pEwQAJJRcLpuJ2bsloXXrtocVs=
X-Gm-Gg: ASbGncvhPB73aMVJ4eYlZ3Isg9RtYaxWEs+Po0HfjMplITwTHP+CEuE/gGJOON/4l0F
	AXt/F0PwsunflV4Pj3fpOhMMM1vXGOyiOfZqjzmG4gMVCd3D6kunZfC6DMYJp3cvEifokhhfsNz
	6nxcO25Enz/YgkmdyqQd/mYEuTBlELX3PzR/EK2dLNjb5epTRbzSEXCf8RqHsahcNNcB4EBCajX
	0swxbLXiJptcw/L+peNar/hQ47IkajR7defCgDeSwtVCxB8d3fhM4n7i+75FdHpni3uR6c6UdtQ
	cRZajJmWezIOYOfx9tlI84xoolz1oBHghAACIW2LHQVdW3Xhhihx3InTX8JpJLNrkg==
X-Google-Smtp-Source: AGHT+IEQo60y4nSkYuBCYnImSLe6MfyhEpVaq6bM9xHgfeeGrTtXV15DQSuydeKSFGHOA76Afhx/vg==
X-Received: by 2002:a05:6000:1882:b0:3a5:5136:bd25 with SMTP id ffacd0b85a97d-3a6e71b8792mr7030428f8f.1.1750863936643;
        Wed, 25 Jun 2025 08:05:36 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234957esm22170335e9.11.2025.06.25.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:05:35 -0700 (PDT)
Message-ID: <1ada43bbb20b806975d6b0503e36a3b464287612.camel@linaro.org>
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Peter
 Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 25 Jun 2025 16:05:34 +0100
In-Reply-To: <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
		 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
		 <20250611-robust-vehement-dog-2bf6ac@kuoka>
	 <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2025-06-11 at 10:08 +0100, Andr=C3=A9 Draszik wrote:
> Hi Krzysztof,
>=20
> On Wed, 2025-06-11 at 11:04 +0200, Krzysztof Kozlowski wrote:
> > On Fri, Jun 06, 2025 at 04:02:57PM GMT, Andr=C3=A9 Draszik wrote:
> > > Using lowercase for the buck and ldo nodenames is preferred, as
> > > evidenced e.g. in [1].
> > >=20
> > > Convert the example here to lowercase before we add any bindings
> > > describing the s2mpg1x regulators that will enforce the spelling.
> > >=20
> > > Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-=
e5bcbf@krzk-bin/=C2=A0[1]
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml | 4 ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > So this is also a dependency for the rest of the patches?
>=20
> My thinking was that it makes sense to have it in context with
> the other patches, but it indeed could go stand-alone if that's the
> preference.

Can you take just that patch as-is from this series (then it's at
least out of the way :-), or should I resend it separately?

Cheers,
Andre'

