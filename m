Return-Path: <linux-gpio+bounces-8663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 547DC94AEE3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 19:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEB8F1F22282
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 17:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6795613CFBD;
	Wed,  7 Aug 2024 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2b8pU1Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0567D3F5;
	Wed,  7 Aug 2024 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723051721; cv=none; b=Mhky9J1/TuR67i59M9c5GWao3aXEDyChcgtj1C+CYz5m5XGgNNhC6sdXiwAxVV9GEaAGbEZ7Uke0f7XUFE6UW/b/iRMS4qzgMAQzXAlBjrF+dh9MwDR5QBcwqRicHYo5UKv150Egg68mAcNFCiRo2whSk1lOvjua6E9QcXWwBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723051721; c=relaxed/simple;
	bh=MUALS8Umpq1keJgbRfbbRTcK0j1X8drt15taBBEiMbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ms74Gz5umapLz1oLc+XpY+anwLnf0W1kFKs0R3/eFsY5pnsKNZkHTwOXOKHaXQX83dLLWZtBn2IijBTaRBizi8TPRYTzKum0PRDlWXCFCuWj63/4Mj3+mnmKy7txtWLU/2Du4ZP67SfqZXLSfNlXlu361Aulx7SmOaD3+xcH3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2b8pU1Z; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bba25c1e15so33936a12.2;
        Wed, 07 Aug 2024 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723051718; x=1723656518; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BpG2opqgTiMlM/9bwByG7p5GesbXYmkZCBUf7QukF2s=;
        b=d2b8pU1Z/B363hNdrSJNrFriWHEYg2HG4Ro0UT5hx0UKNN2bE1c/dm4ahtSlkwxivQ
         me2+OZfcV444+OpaCFx+PWkRydAHkKQWCbXSaIl3ZEW9ADb3V+Z9Qls5R2I8FbGw26YH
         PUPkHnyX4W384985pSgSjHgGscxHwZ6BQYl3zNhY5SiJk5nFBupwgwXDNL9hxtRFu7I0
         nB3aZ1slvE9qEEufp6i1U8DjVKnlh9qy7R2/H/IkwkWMzdT7RjCUW1MZE8MovJALBzMl
         +D+qAE9cI9BgzQ9KBUnwu9+5nqyGk9GkOnkR1hJS0lS1TmApxb1JpAKsp2Hi/EnSVWF2
         dN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723051718; x=1723656518;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpG2opqgTiMlM/9bwByG7p5GesbXYmkZCBUf7QukF2s=;
        b=ecuekpBUhHkyVYNJeMkN7107LuSCY10pHon15HF+1NBQQNCRsqjkoUAVAOTOzEIYua
         WxU0umiVvcukhTZz31U8aacXnLmciwFe8ksLFVobnffASmfSrZ2eF2L9mu8Mv2CSvAUd
         L65g53uslHGn2c6+zuckH8cXfE6zIhc2r/sj1CgpLdXVhUItW0C6Ir74k/6SqkkoYCab
         J3ctLXvqz4Gi1g5TAA53v4SNI/SGEO6PJ91Sm6TX5QI1h9Esv3ICTLxT22YFEYTK1L9j
         XBOzg8PUylTb1qn+2eXiKylGj++08MbLjt+43LAZWwdazOABfhpUx0dJ9Z5H7IucLEfJ
         mY7A==
X-Forwarded-Encrypted: i=1; AJvYcCWoU55XCaD/cbW+YS/xS8c1JXINdN9qb2a8IsRjUdefsGOiPj7WmLE7xk6GUFeAwoYUKMmF2V+iBOYTPGu+za6bTPMTQHXf5v4hrwYI3JaZNwGziiKkLmtDJmrbcI+sN75JVpm39B9ZIwKP3MNSWPPMZcAnVYEhav7ZSZo5VnLV6BDY1D0=
X-Gm-Message-State: AOJu0YxukKA7y13v1Y4sEVB+ue5W2hVHrH4F3XopYINV8532RWvdFUjy
	8U3ibgksG4/G19oC5pbINmZeY24Jj/y9RSHNFPBDdvxzQrKV67nM
X-Google-Smtp-Source: AGHT+IFyQ6tRnNYtpE0HntxxHcQ/7t4dWy9ZE8DPyHF015sSEv6HtzNOSolIxpqZww1lGBr2ZcuEFQ==
X-Received: by 2002:a05:6402:718:b0:5a2:3453:aaf2 with SMTP id 4fb4d7f45d1cf-5b7f3cc5469mr13608697a12.10.1723051717370;
        Wed, 07 Aug 2024 10:28:37 -0700 (PDT)
Received: from ?IPv6:2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78? ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83b82f308sm7200821a12.63.2024.08.07.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 10:28:37 -0700 (PDT)
Message-ID: <225a94c3d0e8f70238aa9a486e7752ad6cb20283.camel@gmail.com>
Subject: Re: [PATCH v1 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
From: David Virag <virag.david003@gmail.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 07 Aug 2024 19:29:51 +0200
In-Reply-To: <5274b8a1-b81c-3979-ed6c-3572f6a6cfc2@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
	 <20240807082843.352937-9-ivo.ivanov.ivanov1@gmail.com>
	 <e6b4e0d8-7183-4ff4-a373-cb1c0c98d993@kernel.org>
	 <5274b8a1-b81c-3979-ed6c-3572f6a6cfc2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-08-07 at 14:20 +0300, Ivaylo Ivanov wrote:
>=20
> On 8/7/24 12:20, Krzysztof Kozlowski wrote:
> > On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com=C2=A0wrote:
> > > From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
[snip]
> > >=20
> > > +
> > > +	timer {
> > > +		compatible =3D "arm,armv8-timer";
> > > +		/* Hypervisor Virtual Timer interrupt is not
> > > wired to GIC */
> > > +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8)
> > > | IRQ_TYPE_LEVEL_LOW)>,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8)
> > > | IRQ_TYPE_LEVEL_LOW)>,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8)
> > > | IRQ_TYPE_LEVEL_LOW)>,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8)
> > > | IRQ_TYPE_LEVEL_LOW)>;
> > > +		clock-frequency =3D <26000000>;
> > Hm? I think this was explicitly disallowed.
>=20
> It's weird. Without the clock-frequency property it fails early
> during the
>=20
> boot process and I can't get any logs from pstore or simple-
> framebuffer.
>=20
> Yet it's not set on similar platforms (exynos7885, autov9). Perhaps I
>=20
> could alias the node and set it in the board device tree..? That
> doesn't
>=20
> sound right.

This sounds like CNTFRQ_EL0 is not set properly by the firmware.
Now, if I read the documentation properly, this can be only set from
EL3, which in your case is... not easy.

On my Galaxy A8 2018 (Exynos7885) I remember the old Android 8
bootloader not being able to boot mainline, but Android 9 bootloaders
did. I did not take the time to check if it was related to this, but it
is my guess.

Your best bet is that maybe Samsung decided to fix this on the latest
bootloader, and upgrading will fix it. (Though if it's already on an
Android 9 based bootloader and it's still broken, my guess is a newer
version won't fix it, but who knows)

Or... Exynos8895 has a known bootrom vulnerability, you could force the
SoC into USB Download mode, and use the exploit to boot into a patched
bootloader. This is of course pretty tedious.

Your only actually relistic choice is submitting without this line and
manually adding it while actually using the phone (or making the
chainloaded bootloader/boot wrapper add it).

Not optimal, but it is what it is...

Best Regards,
David


