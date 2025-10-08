Return-Path: <linux-gpio+bounces-26910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1049BC5205
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 15:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB0094F74D4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364D5257422;
	Wed,  8 Oct 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aticjHYl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503FC25A2B4
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928813; cv=none; b=SgwuBUv4h8lrZ69UfIpV34JNFza6gqsTJ0Cd1OEiylwrEnQNkc1sL6xG5bpw5sBXQHs5ufVSBWLVFNSDgvQrepLbUio37g7iaJ+ycfJa9X/2PdAJsUer4kAZSVVMk0o1QESBDaPjMNTdADFq/9rXimeEQf82n+aHVYu2VXMhcmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928813; c=relaxed/simple;
	bh=F/KLc0AJ5qXXCxdc7wYUMS/kUrn3DDkOw+Xg9ewXk84=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UrwpvnjIYFyl0ifaVgSOz0+54usfw9nq1YiRE09O/joJLT6NHoQ12Y0tWCQf059XGH1pfuiRWCBQR2SQYPg58ucDx7Q4OSUpgVge1+8IT3+mWzFEvesXePHi7F33bTyeATbarwSgL0mOkE/GxFo2rGq39tvKVBQTGv+Gp1BL9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aticjHYl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6625506f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759928809; x=1760533609; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F/KLc0AJ5qXXCxdc7wYUMS/kUrn3DDkOw+Xg9ewXk84=;
        b=aticjHYlXfEiVK9zv8gtiCSG++sw5pjXRsCdnK6qeDkWDKmzGsg5xZpudCfgB6bH7w
         q+SB6P2FbQYVGhn/7VZu0wCM5gBMTVOb+WBEjcAAFbEaa7G1eF6+qz0di8aDHBwtKPfy
         5II0FDkHZvmIYuUXGsw/nl4ZPwy4nXIGt2oeuTZsxC09EuKFovK+PNQ9PksZDkeIGQw/
         EbXXqpRhguQuOrkwdf1qypfzAF9Ji4g+2Co3+cs+Q+EY7pAOeStv9BZATMOqHGloQAXe
         bxT5oNz7OE7kjBCLO4fqsio9N+VP8ZcAJCy/RWRAcEHpVS3qGtHS6Y5+8FIpz6e1nTzh
         ywjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928809; x=1760533609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/KLc0AJ5qXXCxdc7wYUMS/kUrn3DDkOw+Xg9ewXk84=;
        b=RS/usbZHAfJL6+GPcuK5W6njvlaKpDWd87+37uu7y2N5Imf98N+fn/IowYhuR3LbRB
         42Xc0MtxBwCVSGbhGNCPupQ277EPXwZYLfGzbq3wcP5wnruajhskHlxaotsW/V7bsObJ
         E61bRW5fLtvZ7GbGalq28wGDsCN4M/xqkncyAVw0b0LTfKmxeYqHQcKd5cYAGaIsDklH
         Zz45gR5355K2e6lAlD7Ad2iMto2QxVTkV4psbAACloNeURe72IZbSDzbwy2aW6K0T67t
         k0IXXhF2+2ND66sSEm78n/5ITrmg+HZj1alBXcGAuEumvaqtZkhELYIz0b+heHm/H9td
         xa5A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3/Squn1HbdE5HgjNHH4D7ISeMmhJCycspkGRSVdFPZBXHlh5FVKuPEsXWkAcSKCG49HrTGBtDAX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw02v1WY76xcMZofGT948pH/MxZA7HEAsn4oKC39mamXh+4cWvp
	pqj/tvJp4KRswRXX+3hjfG4GKu1YFa5M4FmEJb8vL9H8Zz+nilNXBv03
X-Gm-Gg: ASbGnctvdVdrjLu+rV7Vuxm3ddWyaHH8jttBgdSc4+IQcGcYLNnHDi1R34cowXqdX2f
	syCuEFXP6Cjly5S7EPCtR1QRUXyDoCpHMkFXQ/jOtsaBKxwlq4hE3F5QXjszsrzRJ3e5yuj/riL
	+ksKzgWExFAFryh980CtGguklzVPh9K6csgvgrwGrtXJkpiRvEnnJ+9qeH1o5UfpRwZjhEqb2P5
	4ADIFNjKkAvpdUCsNbgVOZtHYRUqxuY6jv7YGVrFx8JNOVMmGu5VuMLjMRC7Qq7JNzEYEeS01PL
	CPN+6Q25YdK1bePmZLWuxTrWU3uE0Row4sWBgALtXPF0O8GUtck576NgM/+vWUnlTwNgkzyuZYQ
	gZMKyIXJWhGCfLo/1KaFAitBwzT/OQWi7DQ5OoqS/vTDH802/X3aF/a4=
X-Google-Smtp-Source: AGHT+IGs9TvNL0rmTcrQDR+AU/z45s+tapDQMkY0alK/pD4CF+hA5wLEMmSe5+LpHyH6FGvPYm6apw==
X-Received: by 2002:a05:6000:420a:b0:3ee:1521:95fc with SMTP id ffacd0b85a97d-42666ac6a8emr2097091f8f.14.1759928809216;
        Wed, 08 Oct 2025 06:06:49 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b40sm29969759f8f.2.2025.10.08.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 06:06:48 -0700 (PDT)
Message-ID: <35733a7a33301330260c01b1e59af904c8c4da6b.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jean Delvare	 <jdelvare@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 14:07:19 +0100
In-Reply-To: <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
	 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
	 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
	 <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-09-13 at 04:02 -0700, Guenter Roeck wrote:
> On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno S=C3=A1 wrote:
> ...
> >=20
> > i2cdump -y -r 0x41-0x79 1 0x15 w
> > =C2=A0=C2=A0=C2=A0=C2=A0 0,8=C2=A0 1,9=C2=A0 2,a=C2=A0 3,b=C2=A0 4,c=C2=
=A0 5,d=C2=A0 6,e=C2=A0 7,f
> > 40:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b004 0000 b00c a03e a03e a03e 2501
> > 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> > 50: e07f e07f e07f e07f e07f e07f 0000 0000
> > 58: 0000 7002 7002 7002 b07e b07e b07e a030
> > 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> > 68: a004 a004 0014 a004 a004 c004 0000 0000
> > 70: 0000 0000 0000 0000 0000 0000 0000 0000
> > 78: 0000 0000
> >=20
> Thanks - this should do. Note that I am traveling and will be away from m=
y
> systems until September 25, so I'll only be able to look into this furthe=
r
> after I am back.
>=20
> Guenter

Hi Guenter,

I was planning in letting merge window to come to an end but I might just a=
sk
now. Have you forgotten about this one or do you want me to send v3 with th=
e
superficial review and then you go deeper on v3?

Thx
- Nuno S=C3=A1

