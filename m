Return-Path: <linux-gpio+bounces-16708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2DAA47E56
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D537D169710
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF48270043;
	Thu, 27 Feb 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWz7TU2l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE922D781
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661008; cv=none; b=Qd17oRdAqWpI35KP1mWSMefNY6jn01A7e8y6kPs/8PaFUmXeAe9ER6fXoQ4z03i3JVS2DtcKkWhE7s0ClO2pFCqejCksIig91MFKh1c/UQNOSI+rdGiDZBPEw38I3ibYDs7EvtnvP+D2CG7EkR0m8a/FL45cqI8A7T/Q848Q+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661008; c=relaxed/simple;
	bh=fGUVzR1B88At1tVx8Gm7GT+20MR8uqyEANIRvn83vWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TCcHok1Ks473sc/3cBhnSKb281u5jPuVwXFpKD0RuyiugSSzicgS+V/tNKvEqMWOZClU9S7cx3xe/falORt/d8xvjXDwmY9nVQ92v6yIuGD+6HYsWskzBeIjH+ZLhYbaj+a5fPpJ4sfvpBY9l+InCLZZOloMRs+62LYADfIk6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWz7TU2l; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390df0138beso493602f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 04:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740661004; x=1741265804; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fGUVzR1B88At1tVx8Gm7GT+20MR8uqyEANIRvn83vWQ=;
        b=yWz7TU2lhoTGdvjPsFwGS6Qfi1BGhWmryyNLLx5BiSCm9mi4fRDLrWKFa5DxhOLvaI
         b174a5YxWFZE9SLbAVBJpgDO/tKkokRc6ApHcHSN16uJNI/5QfRSzQwNX7y00vAjfqjk
         SwEpLX9sEAjw7PkdK83UDZSQfYFwCyRPOLc/3drquVeWlxW7mko2r8WSSXBQHE323rbJ
         FwXcc+z4/pdAdx/eS1HSjE0of2B4hVeYHiHp6gFeGzHBNyxUISe368D/mOlhEDZ3Xtun
         tBKkmtH8VAm7UKJ9Vt6D48CFxdQ6rBwdoWnV7d4z7MwpIZukQeuuyWguWyr4A3PL6e2T
         yuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740661004; x=1741265804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGUVzR1B88At1tVx8Gm7GT+20MR8uqyEANIRvn83vWQ=;
        b=Y51OcOXOKxZrGdLDkZKCo4B5SUVvyMRZOYYc7+HcaytY1vZbS7BRwr3y8CLv06wr+u
         8/BvMGn+I4u/gtSqv/sa1IbTI3feGvWFenWlWMaoPzJRZQrpAIGdp0SmYZQhm6AV6kfy
         MoXXxi6zN4XaqrXUTiYANWGl6K9X2FO7R6/kPmkAcbfhTQQM7TwUbmiajmO335iKCdYp
         Io9ywJ+dmR1Zh2KjOaCce05XEzEcHOa8C3e6uQu9CJ390UODXHQFQw6kHa5ciae2A6Ag
         Alk6az9rvcHC4tAcOIj1xxVNjXcl5W/oikBViAb38G7siuvOHF+V+cCm/p2X4WgYNEp2
         Uggg==
X-Forwarded-Encrypted: i=1; AJvYcCWA9icCFAjRwiixw4iGTozXL+XMEQO/hoyupT1b2jTbzTeugt0RwruMxqAO4y/rGMdUPY48laN66t3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlgNKOlfH6oO8X29DNZf1eD5wgz0VoaG8uYEC6uSd+Z6XSdNm
	KZ2Ln869askiobRDXrpiCj3/TKv53j/imEsZe6UXui5oz+GspkE6KTIgTCum2+I=
X-Gm-Gg: ASbGncuaRJ0OpTW5oSVAngMviHl0XaaoR+4hYSsFF8rEJ5NBehD3XdZvNxoxoZNnvlF
	/vtBAaQupUCHqB4HlzUPerKfmYhv5V+78PyJRONXdcN1g0FFw2KJyR1TkloRZv0FLJpLm+9Eovi
	9A4rEJM9QfolkBDqy1CTsMaIzGwMQGnGMGQ85o0uVfd27x8WxTCclPWjw9/vWh6XsidZfrE2Af3
	cffPZtBRIVn7w4VZEBsp6c97hfcsyQvKJNibTobslvDoXh9DXUNlLmdw9wQNmQL5wPyC/5CtLGy
	Dn+kwLsebgMPnmTsyAN9Ad1c8ibXJg==
X-Google-Smtp-Source: AGHT+IGgA8QlJ26ze07J+YhYIMSkHS/YQRwZ6iJpXVMPjcqdJ2RpD+8zTEtTBFTsbNdl8L7SmDd0HA==
X-Received: by 2002:a5d:6d82:0:b0:38f:2b49:7bfe with SMTP id ffacd0b85a97d-38f6f0ae7eamr23284725f8f.47.1740661004532;
        Thu, 27 Feb 2025 04:56:44 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6739sm1953462f8f.22.2025.02.27.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:56:44 -0800 (PST)
Message-ID: <77a8982401fdd8e986255a70e22f4fef290669cc.camel@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: gpio: add max77759 binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 devicetree@vger.kernel.org,  Kees Cook <kees@kernel.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla	
 <srinivas.kandagatla@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
  Will McVicker <willmcvicker@google.com>, Conor Dooley
 <conor+dt@kernel.org>, kernel-team@android.com,  Bartosz Golaszewski	
 <brgl@bgdev.pl>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Lee Jones <lee@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 12:56:42 +0000
In-Reply-To: <20250227125143.GA1672649-robh@kernel.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
	 <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>
	 <174060184807.3654907.17826939583833772128.robh@kernel.org>
	 <f3db83179b405ca056fd55abdd6c38adaedbaea0.camel@linaro.org>
	 <20250227125143.GA1672649-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-02-27 at 06:51 -0600, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 11:19:55AM +0000, Andr=C3=A9 Draszik wrote:
>=20
> > The error is because the binding's 'description:' references the
> > mfd binding using the complete path and the mfd binding is added
> > in a later patch only in this version of the series:
> >=20
> > =C2=A0 >=C2=A0... For additional information, see
> > =C2=A0 > Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> >=20
> > the error goes away if a relative path is used instead:
> >=20
> > =C2=A0 > ... For additional information, see
> > =C2=A0 > ../mfd/maxim,max77759.yaml.
>=20
> No, just ignore the error. I believe it gets fixed with the mfd binding=
=20
> applied. I'm not too concerned if refcheckdocs is bisectable.

Thanks Rob, and yes, it does go away then.

Cheers,
Andre'


