Return-Path: <linux-gpio+bounces-32725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EIECIIlrGnnlwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:17:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15122BE52
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92312302205C
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 13:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1BE24677D;
	Sat,  7 Mar 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ+3V2Ul"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0623AB81
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889466; cv=pass; b=n+cT9a10mWLa6fcaRKSqEVlIAmdGA5adIrjy+3jgTJfQLAt2DHFOYn9AFxBB1ghIyBw+2i69DSuRfAEazv5PmPuvKVBDfVIf3VC1FPdwwG+RzlVL8f81F9mjti03QukcxEBS7RgrJ7Cucp8WJBUk6Z0GzejfYYqOVFc3vQ2zOK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889466; c=relaxed/simple;
	bh=BGH5fw1KTyI0IIpta/ctbnM5IMYss8VocaP1z86Flns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVt7fwWGly4xBDU7hGhfNrOigNdBw45TQUYBtgKSU8YGcqPv766efyLER9JBJBAKqrQkUo4b6iZc6IAprmr8kIU3KKyIUbauMUSL87bT7rT3emuUjgq8JwkSBrrJShW5WgfhFz4WsLYGHJRoPxxDGpo5b0oROTEeD4sIt7vWOYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZ+3V2Ul; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so6789376f8f.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 05:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772889464; cv=none;
        d=google.com; s=arc-20240605;
        b=AaWOQttxDtotq2hRJSN0vROLADDIWtwxZu7eN83vbdhWyhuU1NmNP2O4FEcRZoBQFM
         N8+boF5TNn6ZR3rzE5fiYCWKVQ7ue0Zvl9516KnvAHJDpF7QZEDyp4XW+9Rscahx0bai
         gAGYWXNVqZLov/qKL1MWQM9UhVVnnSMowEMdsfVL63egMtjPVEA7mjzJHCiFrvxYhfXI
         SLym2fPOdDqsp4upVHdOr5YHZuEK4YvgTloKCysiMriIygx7k5/qGONHcL2b2LgZRwtm
         NVvSUAHz5tAOvhzjGghqi4F9St5zwtygtaEsSyBnRvv83xSyKcOqIAAmj5A2vwpEtCsg
         PQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjwpvT6wtYJv8QceRQPyk3jFj/BRY6zuY97whk5Cwg0=;
        fh=TfwGEONA9y0z1GvoPVSfUwbU1mvcwiQwtWKWRFiD4bY=;
        b=NQTX15K2XSBNS6K+mOO+1JePMLtj3Kf4BzZcUyj/gICbFUkGUn6fqXmceKqhITE4kn
         avE5lNsgVJh0+vLSvymw/UI/DSjoTD1E0x6Rt64p0UIrht91+RFgrGmjbxfCuBD+X2Vm
         2J3HR4Tne/vNSa08kcfo7eCuxu7QSr2LlzE44XaX6akVkH8Ukano/5Qtz8RAWDaUuvrk
         4Ptdeei6yByRNWhkInrwbzdjOmI34EzzvKKu6EcpMREl1V19cp3pO3nvaK4ZZBF8wTw4
         iIg5CNWz/Gtr+JfStPCLgZrkl2U38H/SSc7a9zXBhY/msw9ueMkgMuFOwromDUox6vIp
         qPkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772889464; x=1773494264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjwpvT6wtYJv8QceRQPyk3jFj/BRY6zuY97whk5Cwg0=;
        b=cZ+3V2UlBKXkxskZn/S5bW2/UthLRJU36cWn8UpQOyqj6mYbssGEBjAhD44JwZfqjK
         nAlhV/x3iY5cZ8UhRDe1OPcd2zrcq+4C8nz6AwfLDG5HcfAxhhJzbvet7W9VYa6wFbKi
         sl4EPnb7ROE9cUHk1WDUh2XwlBILsoHr0lHPuOxMkeb7bJxwZX5wAvG8ABocP+Y7Ty/K
         kPHjk0lN/3H/7YKIbT6VBPumPusLYSGyYXPANg+bDLLVyNyyuGV7aa4kxy9ImXY3+uzs
         dqMQWjaFRi41vJwdNbfQqAIf9gfeuvGznpfZAfYHFwvg/2GBCyBYDMvd8g2NBnYTHUsr
         aJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772889464; x=1773494264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjwpvT6wtYJv8QceRQPyk3jFj/BRY6zuY97whk5Cwg0=;
        b=vBJ1/vXQGd6yGFjLV3zdfuxr+Kd4poIsJut8e+521btOzabgCXNKN6RuAGjCfOW/kx
         NjspBUQdHurxEvbYyyHA/WCZLu8we1/IS363JsF4YQXVvdZJxl6sN6kPIiynL+aNDtzQ
         CQUDdLY+68vilD3jFHYsKDU5m0567NjF3e0BjII5TY24pSwq1xeheKBZiJnXN2B4OSMY
         SG1nO/lS7yRGZP2oUEkgeHpPobx+J+HHzhVaZIHXPv8SdQqhLnWPo4yhJt7DrHDyWxkh
         zKsDRTsGzBJYTIYXPQXqhzko8s0PZapLZoYPjTBQI5jPHVay8dZQCRuqb8l49u3RxNh3
         /uZA==
X-Forwarded-Encrypted: i=1; AJvYcCU8LuRBIHxB7WjnhoyPvLOXmH2f4yGAbteaCkLkzN2DWlp54OrbbOEyDgtXTS/d8c4c+h3lXTiRSnL5@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTErVNQ5g8xJv3WHKHjS/eVL162zFbE8ANYzD6E/mVabLAJ5v
	+TN1iOB/cqtuD6ATqdc1Ib3V5wGai+ooGMzivpXRl+hiBPDy9xo7yc2WAoun0V/Ns14bzfeSsFO
	Z8kyJKS672DWwliAdW9GbLeBtHLyj+Nc=
X-Gm-Gg: ATEYQzxdtWTaXMFaYBqZWpBfpNh+GlEKmvxhv9TVSk3qkhIc4thNjaY3iIznanTevui
	DqVEfC1DILcVIEVwmnKA3tMHigsQGone+PyXf0OO5ta0CA76JTvUiQ3tDk1mRwqFeVWoB+sq9Qs
	RNb6VRnKWtFnzKCXmW0+sNIfu0TOvc+ka4d7FG3ZQge8V682MIrU2vva4hwifFuJyv33VVMO4Iy
	cW68p/uCea/fARt7hhmscXa8lhpbmC3eSLc7u13XCcvHgrniExBKg7PA2HVRvjvE/yeEFziqCe5
	eqoOFZcy
X-Received: by 2002:a05:6000:2509:b0:439:b7c9:2eee with SMTP id
 ffacd0b85a97d-439da656ae8mr9474585f8f.13.1772889463755; Sat, 07 Mar 2026
 05:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306133351.31589-1-clamor95@gmail.com> <20260306133351.31589-5-clamor95@gmail.com>
 <20260307-huge-excellent-tench-0afefc@quoll>
In-Reply-To: <20260307-huge-excellent-tench-0afefc@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Mar 2026 15:17:32 +0200
X-Gm-Features: AaiRm50GLCk_SOmhHd2bvwAI0azWxfEbywfHqltNh_WJ56961YJKr2R5TU7KTzo
Message-ID: <CAPVz0n0Mfzt_rXKxQisrOmNqiEaZKE19yXFqJbgCWzcrFpHwAA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: mfd: max77620: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7D15122BE52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32725-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3c:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D1=81=D0=B1, 7 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:46 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Mar 06, 2026 at 03:33:49PM +0200, Svyatoslav Ryhel wrote:
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/mfd/max77620.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        pmic@3c {
> > +            compatible =3D "maxim,max77620";
> > +            reg =3D <0x3c>;
> > +
> > +            interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>
> This is odd interrupt. It's I2C device, so how can it be GIC?
>

I have used layout from Tegra device. I will switch to smth simpler.

> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +
> > +            #gpio-cells =3D <2>;
> > +            gpio-controller;
> > +
> > +            #thermal-sensor-cells =3D <0>;
> > +
> > +            system-power-controller;
> > +
> > +            pinctrl-names =3D "default";
> > +            pinctrl-0 =3D <&max77620_default>;
> > +
> > +            max77620_default: pinmux {
> > +                gpio0 {
> > +                    pins =3D "gpio0";
> > +                    function =3D "gpio";
> > +                };
> > +
> > +                gpio1 {
> > +                    pins =3D "gpio1";
> > +                    function =3D "fps-out";
> > +                    maxim,active-fps-source =3D <MAX77620_FPS_SRC_0>;
> > +        };
>
> Messed indentation.
>

Acknowledged.

> > +
> > +                gpio2 {
> > +                    pins =3D "gpio2";
> > +                    function =3D "fps-out";
> > +                    maxim,active-fps-source =3D <MAX77620_FPS_SRC_1>;
> > +                };
> > +
> > +                gpio3 {
> > +                    pins =3D "gpio3";
> > +                    function =3D "gpio";
> > +                };
> > +
> > +                gpio4 {
> > +                    pins =3D "gpio4";
> > +                    function =3D "32k-out1";
> > +                };
> > +
> > +                gpio5_6 {
>
> No underscoers in node names. Use hyphen.
>

Acknowledged.

> > +                    pins =3D "gpio5", "gpio6";
> > +                    function =3D "gpio";
> > +                    drive-push-pull =3D <1>;
> > +                };
> > +
> > +                gpio7 {
> > +                    pins =3D "gpio7";
> > +                    function =3D "gpio";
> > +                };
> > +            };
>
> Best regards,
> Krzysztof
>

