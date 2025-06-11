Return-Path: <linux-gpio+bounces-21354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BCAD4F60
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 601651745BA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C27253F07;
	Wed, 11 Jun 2025 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="volHhDyH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB62356C7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632902; cv=none; b=TWe1u7Ks2MV6xeB+ILmJrmGbgs/eEllI1ZZx3UHLa/EYJra53ZaoKeymxoU7Bg3kqzcnE8DooOU6gv63YgYzFiKR1O0QQf00dj5Kr7V+2ULlfITrz/hIqFZW0TJSywlKxKLGAqfI0ETdgZTXsEtblZLsRKbcv+9U1CKkaQub79s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632902; c=relaxed/simple;
	bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m3p9yDOWgqA4V7E+p78P2thDTjheHXy5qI19dVcePL+82OeAuAQhN9wL7n81SEf+I51CCxxOA09NvkEJsIzyPtgqVWpT8dgGHSl+mdHrsClAMetyEt6ceUDMD6n04j8O2bPK1fK2wuUuCC9WVTwpAFJh/eoPc501pJ19fqcCdc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=volHhDyH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so54096695e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632899; x=1750237699; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
        b=volHhDyH09v3nDkjEPsHoS4m7mTkTHd8/bUsINK0T0c5j5qXLpe4xTZanBXhOBaINA
         JWg/megBqwymRpHiUmDyrdxbiEJFk3DlhZY711SPmcZPq1LXTim+IHquIzB7OZy/NI2Q
         K88Bn0OUTKPi0oMl2Vuj2/iN3ZCQX3NQJjJfDpleWKRKS3Yk7DpzjQX1xQ/FtNlgqhSk
         qQCo24+CfG/rdWdLG+b/3hqmmYlFx1DN86onnyXmH/JjTDsaSXMkVrdhPpefUG8hP8Xb
         eRl+SYrv2zJOqFX4ns8VGxip2+iu81jLlQIo13qFt4uT/R+ECASuObjup48vD0FJ6nrW
         IhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632899; x=1750237699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XI9MRgqXRnhIDDskprAJ7Lp7MjrJKOdvMtsvO4mRxYc=;
        b=YWd1p5rqnVYu55QPHkRWtcUuCH83aZcyLcsXTi5Cc1vYSw59fCUMdwb0imTFttLAt4
         D3wHyiJ8xqKp3CttOm1HILCmjABnSuIuzWghMWY8S5m0KB7gw6JmF6gGg9cycswqJYN3
         kroejUnDoDjPno4EtnN+2+yZs2hjDSaHg+F6QgNmjuaU27DE//32jdIrTtvuBmBKjys+
         dvcB/f56BSG7Z577c9IGauic/e5jQRDl1nUUsdnZX7dBb7nC2ajeDljDXOH/LKRVHSPp
         mw5NfwAJaxblh12pYxRSQOrV1xxV1zb5LdiOAArWyC8q+FR1eLDlzgMul+ky1TuPxb1u
         pDcg==
X-Forwarded-Encrypted: i=1; AJvYcCXLk5c0K0QZg3bpIYd1bbKJQXE8CkR5kXeZ+yPpBYMWiDux4VmK0SGYTqlKRobx0JzTmWHy/tEnCl71@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ojWN/DKdtRH2mv+QKnaevKvWAK0ZjCS2M2qcK8/57ZnYdmGD
	v0Jlw53ggETJb0KUOMurqRYZ0syEIrhxPng8pNgzqsZ4OIkKtJr2S7LhrJV3SkA6XgA=
X-Gm-Gg: ASbGnctW8yb52me+5vZG+Q1R7Vhy5bEkbgsACmohuqFhjoeCR0ErDloi/mdAPuEHiMC
	hXx9fnH+03s+1xwoemY0F8bVP8YVN3gvICyy8uTD5eh+GwJAvbVCWgbkXUxTgFlwh9C1SnQ7U4w
	lLfs5QZmT5rkrQvr0g8Y4yqSv/+6q+FZwj/LR9aMtv4HSETSvaH3T2qR68Lciae6OfMgAWoilsH
	rOdhZWi43ThuOmWH3mSNYKnC/c91xG/mrA5IVxXdTYG3ZN6RHtbA/7AYwRrz6H6z6tgaVOeLWC8
	8uqrPft2HOIXkzWv/u74Tk52ShC35eeQ7f1iRyhlh7OduvneLa/4kH2nlnrZffgQ8A==
X-Google-Smtp-Source: AGHT+IEMk6D24rAbr4EjAYiW9bu//xAst28BwxOZGS7RIT+PIp1VlXvEeVos4jHxD+q9aHTVPlGzRA==
X-Received: by 2002:a05:600c:4e4f:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-45324f421c8mr17677035e9.24.1749632899307;
        Wed, 11 Jun 2025 02:08:19 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244e0e3sm14903832f8f.68.2025.06.11.02.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:08:16 -0700 (PDT)
Message-ID: <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
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
Date: Wed, 11 Jun 2025 10:08:14 +0100
In-Reply-To: <20250611-robust-vehement-dog-2bf6ac@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
	 <20250611-robust-vehement-dog-2bf6ac@kuoka>
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

On Wed, 2025-06-11 at 11:04 +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:02:57PM GMT, Andr=C3=A9 Draszik wrote:
> > Using lowercase for the buck and ldo nodenames is preferred, as
> > evidenced e.g. in [1].
> >=20
> > Convert the example here to lowercase before we add any bindings
> > describing the s2mpg1x regulators that will enforce the spelling.
> >=20
> > Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5=
bcbf@krzk-bin/=C2=A0[1]
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> So this is also a dependency for the rest of the patches?

My thinking was that it makes sense to have it in context with
the other patches, but it indeed could go stand-alone if that's the
preference.

Cheers,
Andre'

