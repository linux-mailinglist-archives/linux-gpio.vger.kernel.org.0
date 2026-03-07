Return-Path: <linux-gpio+bounces-32724-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPhrL2QkrGlHlwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32724-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:13:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2936722BDD0
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A45B3037EEF
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 13:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36EA3A1A4B;
	Sat,  7 Mar 2026 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ5dp/pr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41927E06C
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889133; cv=pass; b=SJCFDGli6Uxl5FwSsZ4kfOCQKskOpljUX1yIeFfsyfvUQZBZ2ZjHN1o7bI/S/fO2MDSvIKJnkc4qt4xm+SVnkKO8tnrqhQlqPBZWDu6FYwqP3/I6sVDzWeNsBgpsVGMTuC5crWsxTO4SR3wGboCsE0Hwy+2qsyd87PgI/t2bky0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889133; c=relaxed/simple;
	bh=VIWFI1y5VRLZ373RQL/JnbZVRkgBAGhKPHT1hx5Q3QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+y2dLVZmCBr8wAJ0gfB9DhT84LlJZ8GdBmODh8RiYeRKzGuil4oUKrLAEdBQUOzu8fz9UEPIn9A/xMrizow38QvfvWOFOCgOP3nWzMldKIl/TXUJCg1USjdGzPK+QFnwNX6wtGSsH1G4oHxG0dgpRFgSfzG5AeWFBvZ4fJW+sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ5dp/pr; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439af00d33cso7003530f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 05:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772889130; cv=none;
        d=google.com; s=arc-20240605;
        b=A/7E1IT1GhRTy6+S9NBMKWm0oIfQlKumqX4gHXIO0F6FhbCpk4Mrnjuw17SOYHcrDe
         xnL9jTBifTpbmuUTqnpFrDzry3qlpVFUaxIlKb9PKMRZhWKNNA7Luf+08GTmbjVblIz0
         d6HAg104qBCQhaJyNLkDpbQ+jyWaDloZxcTOAycsG7BLu+YNqpXilz7ZhDAgUTl6h+ZS
         2bV/TgzPSgaF9ki21jAqGUNDeiHzDbmVJu5R/EyqN6KbldV1rxvZQYR5czL9RZSoigvY
         YS9kV4qibD1SZK0yVzxyjNuY+QvykpwRvd9uW7JW3Rg1okcwGk67TycmDlo6O3HELKOl
         1cug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jwpJkt0avwp9jkgkDYYA37vOWQ50nBFUmOdRhI9vm4g=;
        fh=NzBGOD+V6YAJXaCPlUEeyUBk/ICmork0PpmZDJmgwgo=;
        b=kd9szjE8GJJNLcMCyJC0RyxzYW1XNcS0gb2r23eRwyUT76sm45QLu+nzr1fYBvD7P8
         0CuDowlKF+0xhzQ94mcExIYb2ctgwPlijxRR7KetT/sb5yU6Rx7nu6AboVfbfC31uUwC
         +/R7Bv7kpspt42uiw4XGo1wliNAQAQjrkS3riWWQwGieQRjV5xWMWaDbtCQD52M2jOew
         9t2RFCzpDRJCNYXbUQSn+aF2afbJpKe8NpA8wgQW/zYZDK9RIBteUfBe2p6XAfosU2Wb
         23X2GHJl18gVFX+uxMEGyHek0j0Go0nHDldy5K7Zj1fBiT99nI6/4AmBGklRr+lDNjKU
         74PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772889130; x=1773493930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwpJkt0avwp9jkgkDYYA37vOWQ50nBFUmOdRhI9vm4g=;
        b=NJ5dp/pr8J6GiCRh5o4uhYUrKCGUSZQzU6KQ2fdqE51GxWIADL5d2+iq1PlF4m3iFx
         xPLpX1/++m89Atunk0PZpshSbhUiP7NHGZ3H45uM19lskys4UdlgmxKPvRAIIaZU3i2A
         PM77oNh4Hf28RXz/B9v40eZDsJA1W5vaSuyj1mriAhSpwLvpbnsfrMnZKUVsiXyQ55YI
         YDOLeQNc7p4bA+nZi+TihsGKxuSX3tXrkua8sFEQBpbmDnKjtjYoHi9VTN9QRdngOezK
         9UL/Ndn/QhsCtmsFzhCVKhckESk6MprtmVFXgUyqMqIrmnvb/VHmIMssb/++L0iLcCZx
         Vu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772889130; x=1773493930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwpJkt0avwp9jkgkDYYA37vOWQ50nBFUmOdRhI9vm4g=;
        b=VpQu8nI3pnbc9Tb1qhb2VuVbBwTtI4m+a3qMDPGu5Mnt8hYkRHjsVMl3IC3Xcd7UTO
         NF+2lhtU9treNZ1C9WkqyU5rGkJzr5jilqVXggCOUsgJSDPG5rYB7vdq7Lm2oPRoWZ3C
         qPCy0s4NDMdS2IDceYlw02GEk43T7xSHLksU0gJKOaoIL36tV3e7ZlStcsONKHFgTIkZ
         fzCv+sXsxiwizOe6qcRlNlt3UF8ghpu4ITPj46O1/c9h5jl+FSNX4CS6QKK0jrnI+5DL
         7yEss0rw9V3SBLNNCgDqVItdtbtFQtOnnSQoLNbwmI0gSuUwHnr7Pon4dEPN+svacT/r
         w0zg==
X-Forwarded-Encrypted: i=1; AJvYcCXjkYMNiciNTpabm582MtyJzUhbUQKp+F8fYB2yVNWfC2x0STWbBtl62ttFRE50eKW8Ja2oAfmis0t1@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVn2XR8zDFMl5Mrh8rLnPSVkWTi5fjcIfld4+/u0FaDNyXoeC
	X6/0ETyQPn7NhNDmDb/Pslx4CfQH2UIf4bAGvik2UQAzR6mG1G/TeS/K7OZd8BkYCWhf1ZvqN4s
	/1ltSwvL8kkSjbnNiUcIO4otezszU8vY=
X-Gm-Gg: ATEYQzxVggUc3MsFMJSUYNhsyj+SHSh+w3lpX0tvWj6bvJratBhy4wzaTSKaBxNDmZK
	wpJtVCfroT4UljG4jR8+pTOKHK4blN4hRD21jfS2IgDdJiGkRudm9pFLhJSH2doxecuky73d88S
	QVex80ojshpmj0P8NANsy8EoGXhqUGiH1m/wP+ipy6mOtjW1w249Iy/k+rd49zEHwwKbUCTkcxk
	wJbbm8QgziHtLcbQyoaTsxxg5DXC4UklObkTQ6YGsPczmOcEjbVoagM5Rd4TGqEt/dv0oYj9tDA
	vBM/k6iC
X-Received: by 2002:a05:6000:258a:b0:439:cbb7:3c19 with SMTP id
 ffacd0b85a97d-439da880b24mr9456804f8f.27.1772889130119; Sat, 07 Mar 2026
 05:12:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306133351.31589-1-clamor95@gmail.com> <20260306133351.31589-4-clamor95@gmail.com>
 <20260307-azure-quokka-of-abracadabra-cebde4@quoll>
In-Reply-To: <20260307-azure-quokka-of-abracadabra-cebde4@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Mar 2026 15:11:58 +0200
X-Gm-Features: AaiRm52JT8p_3rf_HqGYMWaWzNT7LpzzUhIeETfJmIKaZ646udUvob7af9WUE-w
Message-ID: <CAPVz0n3Qj78B9Ga=p5wixu5umY+uVP=Fs7K3nwix1NT2eNgtrg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: gpio: trivial-gpio: remove max77620 compatible
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
X-Rspamd-Queue-Id: 2936722BDD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32724-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D1=81=D0=B1, 7 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:43 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Mar 06, 2026 at 03:33:48PM +0200, Svyatoslav Ryhel wrote:
> > Binding for MAX77620 GPIO function is covered by the MAX77620 schema. G=
PIO
> > controller function in MAX77620 has no dedicated node and is folded int=
o
> > the parent node itself.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 --
> >  1 file changed, 2 deletions(-)
>
> This should be squashed with the converting patch for this compatible.
>

Acknowledged. Thank you.

> Best regards,
> Krzysztof
>

