Return-Path: <linux-gpio+bounces-29504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B43CB95F4
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 17:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A09623011F8A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 16:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B7A29A2;
	Fri, 12 Dec 2025 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWbX+/F4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BFB2DC784
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765558511; cv=none; b=JRzU/i6VWNmiOCP66AEW7cQPjKzpced1q2wayLGJhQnopMEVagK+Nwb5w5peqdClhnP8tlOwMAPbQbhzhvyKZejP7nHziY90uVLIEfC+NTvw1exoy6E5w3wzfy4pKJvf8DbcDR1AjckIzfYUBtmjm8T41DlDlMXZebLsqKBYq6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765558511; c=relaxed/simple;
	bh=ZSdEYNBQZmpD2tooK1Re5wdlIsvwhaGcrS9FBRtGE/8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V7GAfyN/oxQF1/sg70o+prQLcXrTXoaAwJa7LjSWNc07XRC1VRtmoHPCCKsEq2aYoWkScSdKRQc42o+KnmIjKEcCMuK4sZW6vMkd921rvkfhGMProwutbtk+cavc/bX5lgsd80kDpulYKiQr8OjhHDV5kVRpd44flWFG4rssMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWbX+/F4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso15897725e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765558508; x=1766163308; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSdEYNBQZmpD2tooK1Re5wdlIsvwhaGcrS9FBRtGE/8=;
        b=QWbX+/F4E2QZje7nQG4bOnogQiugfBB3gK++Zz/i5pyXvG5DyC0eOnEoGJMZIfQaHZ
         te4H9jln5PMWu3voqRdhcpXcdGSleQpQHu3TXbxZXRfosHU1REfVTx0o7ejJa0c82W7B
         ycubrkCIHV9agtbSeMkLfNyJuhv3827WXAIVQ4BTjxmKafkMmc26nxKi3yntI49wwR61
         3DBPQRT2mBPF6DCRsdg00IGgt65NRgODO36x9Qe2gAncaOrxgrm+XapP+81j8Sl78417
         bjkfcVSTsq1U6702JkZomm8xz7LLMkDYV3xvUZj3EPPmVmt/Q1/9H8Dq+yPF5K44E9Ml
         qyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765558508; x=1766163308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSdEYNBQZmpD2tooK1Re5wdlIsvwhaGcrS9FBRtGE/8=;
        b=ekAxmai7iIl49xNUqow69vRw8cTm1D5mtIMZJ59BkCESNjYoPcdRovdsxnSgSV3gul
         tlv/4n4ee4wldQnqU7iX3G6cFuzdPTJmbEFBbDP82zoJtFQzismT5b0OJs9Sj+iFDk1P
         uMpo7QmXBvd2rCGkGvbZwk/IlVvhO6bopDgCR9EvVItyHEk+xiB60ufRKmBu8QNy9Qoy
         cGW7PHMk76vjgtrDn8dz9a6B57c2yZaa1BmOcPjEK7jUGs6TayqJ2EPU/BdG+gAiv+fH
         bSJewYfnNip9J3qs0+WuY0yFkKOUI7fewPII3otoMERhXmjHuXCCg0HzOKpOtBrTqg+I
         oiRA==
X-Forwarded-Encrypted: i=1; AJvYcCXJGOSstUrbc4QiFC7EK3qLTwHlkrR293NbherjhcamM1F6BMxFNHbX8VFzOE26yNedMvVhovt+Wlks@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1xKJeg6kljOTgyv92ZwoEsNBNovdtKtc7Ek/Ie5Tl5ML9RAJm
	IMHx4Ps1NW4QTSBSKWv/DZncV5DdWrxeBPligW0uJAqucpx9SqPPou3r
X-Gm-Gg: AY/fxX5ddwssaRYAuJshkDFalTcqNf4NF9zbFr/eSLjKLgKHPGyGs3J5lI+8EsBV60f
	rCBjGrEewykD5Qr6tlYYSyKk1CMTtIUYTSv9fddxpCikgIo5qHvPiK8XqciEojRQqxysfjiPHYC
	NJUNoQIZ6CZ0rVXsldddCY3XggyLEjkaBn7QjZ3bUVJpLdGI/KGomoUTLlNKZ42J0qNYorTOS/s
	IuMEifh/DtJrqZk7sZo90xizuCgDA675wEHGDawI7UKFZLt6eDFcoRorIhgt8FVRD5wat64oa6i
	3OM4483vJNDy4EvZ7s8v/VFMW/6KlEI3mtJHBOi7tEXpnLK5WpggzX2IqMQrGvWWAm2TYDOkGG2
	N4vOHpBHnRlbi9zgWbRJLy5lDX574fKhXvvgmZcDIiIuPi8U2hPgVzWpTWhsv8fpkuWCXugy4N+
	JOo0BC0abu8502et3p1fI=
X-Google-Smtp-Source: AGHT+IG2FHJPf4h+6NnUN/J0xatATINNGdkgXy2Mr82izBMwFzE+zbujDdnvd6sCuR4Ij6NDN+G5Bw==
X-Received: by 2002:a05:6000:2dca:b0:42f:b1c2:c35d with SMTP id ffacd0b85a97d-42fb48e460dmr3260075f8f.50.1765558507843;
        Fri, 12 Dec 2025 08:55:07 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb0fc8d5fsm5630678f8f.2.2025.12.12.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 08:55:07 -0800 (PST)
Message-ID: <f530e0c818048bb3ce5c3505a35c1ef99acdf9f1.camel@gmail.com>
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Date: Fri, 12 Dec 2025 16:55:48 +0000
In-Reply-To: <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
	 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
	 <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
	 <67209860ae2ff5626b7eaa50f2dd4b496eaa06d3.camel@gmail.com>
	 <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-12 at 08:46 -0800, Guenter Roeck wrote:
> On 12/12/25 08:34, Nuno S=C3=A1 wrote:
> > On Sat, 2025-12-06 at 10:40 -0800, Guenter Roeck wrote:
> > > On 12/4/25 08:15, Nuno S=C3=A1 via B4 Relay wrote:
> > > > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > >=20
> > > > Support the LTC4283 How Swap Controller. The device features progra=
mmable
> > > > current limit with foldback and independently adjustable inrush cur=
rent to
> > > > optimize the MOSFET safe operating area (SOA). The SOA timer limits=
 MOSFET
> > > > temperature rise for reliable protection against overstresses.
> > > >=20
> > > > An I2C interface and onboard ADC allow monitoring of board current,
> > > > voltage, power, energy, and fault status.
> > > >=20
> > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > >=20
> > > I finally found the time to write module test code for the driver.
> > >=20
> >=20
> > Thanks!
> >=20
> > > Some early feedback:
> > >=20
> > > - The driver must work with non-devicetree systems and without device
> > > =C2=A0=C2=A0=C2=A0 property support. Select defaults where necessary.
> >=20
> > I'll double check that... But one thing that already comes to mind is r=
sense? Rsense
>=20
> Yes.
>=20
> > is the main design choice for a thing like this. Not sure we can decide=
 on a meaningful
> > default for it? I believe we have the same situation for ltc4282.c
> >=20
>=20
> Agreed, but that doesn't make it better (and I don't have a unit test for=
 that chip).
> Default would be your call. I usually go for 1 mOhm.
>=20
> If you have access to it, can you send me a register dump for LTC4282 ?

I'm doing home office these days and I'm not sure I brought that chip with =
me. If I have
it, I'll do it!

>=20
> > > - Attributes marked as readable in the is_visible function must be re=
adable.
> > > =C2=A0=C2=A0=C2=A0 It is not acceptable to return -EOPNOTSUPP. That a=
pplies to all
> > > =C2=A0=C2=A0=C2=A0 reset_history attributes and maybe to others.
> >=20
> > Hmm that's a mistake. They should be WO and I have the same bug in ltc4=
282 so I need to
> > send a patch.
> >=20
>=20
> ... which helps explain why I want to be able to run unit tests (which re=
quires defaults).
>=20

Makes sense. But from a dt bindings point of view, I assume we should still=
 keep it as a
mandatory property?

- Nuno S=C3=A1


