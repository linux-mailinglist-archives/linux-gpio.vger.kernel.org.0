Return-Path: <linux-gpio+bounces-30017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D5CEBF58
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 13:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA7A63008571
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 12:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A36B32AAC3;
	Wed, 31 Dec 2025 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="gW97Na2E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27331CA50;
	Wed, 31 Dec 2025 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184146; cv=none; b=QmlD8N8kfEc8fT+h4aVrKyNH3pZBBZzXB41H2ofAy/4n0/3OJ8hEjk2jrabKQfhJ8uGiYQoDLsposyjfYhCXgfsUxgXmYC3XadQFpz9qFbKWAiMUo4WOX9nwH1nZ1ObsEv1mX32N2+Bcz/ovUnQmHfu61x3Df/wVfuBfHLa9/bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184146; c=relaxed/simple;
	bh=9rLreqkh3KOaBoBE6zwFaHYZmSbkF23wTl1G/WkHYfM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYhMHNbPzEAGTkLg89pF5mXBWqdv6akzJpfBGR6EyOJQgr6+vlydAAELwlNirFMVgjB/oVfwR6pqLRPWNkLvAB8tx7JAMeyW0EnkUkC1OIbrtoW14DfZeQ8687xDG17GfL+Vju9tQngOyY2Q7ebPmj0mBFpOJ81epHL+Q5GaONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=gW97Na2E; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767184133; x=1767443333;
	bh=9rLreqkh3KOaBoBE6zwFaHYZmSbkF23wTl1G/WkHYfM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gW97Na2EOh7XeoR+ZPLRj590d53u8hvmVD5biXySbGbYF8aaTo8wu/pS4/4xzLwzi
	 5mmO8XPtCeBJz57RtvTSKzDdV7aRQR1RVf1jVv1ys1GEL/wKlt+ORrvVP4hSwQ/+Ij
	 rrp0cIFFJ5BcUvKcxduCVogMEfVSNuaaMA67x106ReSZSs0S0yewhxnKror9lLcrDs
	 +MkN27KPRpKWKmBrumZqOHYMWRPfoEtbNY4a7uLb0fgzwXd7Nx0guoMQUe8bGYM3fV
	 ee1U0WmxIUxJUzGoefq8t8UOQZVKWUBVNLsYMA+E4Fa0jzBonnivbwVl+oVeT4iWM7
	 S3UxlorkVCk5g==
Date: Wed, 31 Dec 2025 12:28:50 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <yB5WFgsxeeqHQgi87UeNPD8K2OlQbWWC6-BovxADBtgusN3n8UOrm7Gi6jz6Th0dsMA9J-LEpx69sWjNmWTH_-jx9r7AgvXNTwR2hQW7-SM=@chimac.ro>
In-Reply-To: <20251230-dramatic-gregarious-stallion-15bc07@quoll>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro> <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro> <20251230-dramatic-gregarious-stallion-15bc07@quoll>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 438c4b314bd6f15975c0d8bc145d9e4161d2dfb1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 30th, 2025 at 11:51, Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>=20
>=20
> On Sun, Dec 28, 2025 at 06:05:52PM +0000, Alexandru Chimac wrote:
>=20
> > Add a dedicated compatible for the exynos9610-wakeup-eint node,
> > which is compatbile with Exynos850's implementation (and the
> > Exynos7 fallback).
> >=20
> > Signed-off-by: Alexandru Chimac alex@chimac.ro
> > ---
> > .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml |=
 2 ++
> > 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-=
wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,p=
inctrl-wakeup-interrupt.yaml
> > index f3c433015b12..deb2730855bd 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > @@ -48,6 +48,7 @@ properties:
> > - enum:
> > - google,gs101-wakeup-eint
> > - samsung,exynos2200-wakeup-eint
> > + - samsung,exynos9610-wakeup-eint
> > - samsung,exynos9810-wakeup-eint
> > - samsung,exynos990-wakeup-eint
> > - samsung,exynosautov9-wakeup-eint
> > @@ -107,6 +108,7 @@ allOf:
> > contains:
> > enum:
> > - samsung,exynos850-wakeup-eint
> > + - samsung,exynos9610-wakeup-eint
>=20
>=20
> This is not needed. Device has 850 fallback, no?
It's not required, but I guess it would make the device tree look better. I=
f this patch isn't to be merged, it doesn't functionally affect anything so=
 it can just be dropped instead of requiring another patchset revision.
>=20
> Best regards,
> Krzysztof
Best regards,
Alexandru Chimac

