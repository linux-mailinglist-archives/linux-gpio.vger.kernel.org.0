Return-Path: <linux-gpio+bounces-29492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C1CB9450
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 17:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77B603082D63
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 16:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3BF2BEC2D;
	Fri, 12 Dec 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7+2NI56"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316A2874E0
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557232; cv=none; b=k41pHbAjanfwRkBCYaDN4msXZ/8jbl56cCuPX0ruAttxT9q/JdOs83uXbCzoYkZRN8TfL2zGO6Mqrlw6kAzlNcPXjEsTZMPMAEcHbx8VnPCyLhWXmSVWpif9vfyqnNbkuAqE0klPNiOurJB7xCDqb6z6k1f1i2z9mA85LAPztP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557232; c=relaxed/simple;
	bh=vTwFW/M5orw9Y0dilyu2imvoiT3dfkAfNeGwFzDzihI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sZEF2dmaXDKKu6xKv1SufdSMHqMdlS/L507HwcmFtm+HneXxEHKvA2HAqsyvPoAGitmuPrzBShLhvqI2vMF8OdkrAdQ0PJOHhQKcMbr5a+oeqbU65uclR+fLUheqvFwSd+sTDoKcmzT8kUi3AnReZZhcvXSBdXj51qrIRL3p4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7+2NI56; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so12050235e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 08:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765557229; x=1766162029; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vTwFW/M5orw9Y0dilyu2imvoiT3dfkAfNeGwFzDzihI=;
        b=H7+2NI569vSc69UiOEvuH8qkQmjtOOcRULQTsOVgVh3JRQg+alKiDPEsrTkBLlHUK8
         aFF9vrrQg5McISaMC0mnCQj7uC+PfgTa0nSKE5T0E6yS0JLh2prQPHLkM7UOWa+JZ/65
         vNWUoT2n3kCacb46OlKe/PzpRkmHVM3PZXOx1eDN608pH141z/HYrVpOXHJQe2tmPWOw
         JVK3LYQ1kuQymGTpLpCTKpdulPGL92y3pRr0QEMK4PDlEuUvXA3LhsFvTwOCPDv6Iyy+
         3OkOEykEsKjw5IpBvFgjhBE9vCLF/UaG9FgRcwVTlHDDv8kWyL+h7LAaJ0C41gLm1ff0
         0U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765557229; x=1766162029;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTwFW/M5orw9Y0dilyu2imvoiT3dfkAfNeGwFzDzihI=;
        b=jbXoiAdDS86MW/Ygg7lEkGXTvTWWPJcff5Z543Y7+iofQ4ljm9VuMz19Pak4pgbQ/Q
         i5IGeQcOUkGm4ZtnftYHFr4Axv+HE255vmsqf4BVbWWSRvqF0Kbz3yBJV5QVH9qsNykH
         HasXIvc9lfAZgp2gFtAXPpYNmFgU2JEObj+hAuaPQ5d3ZavMAjtLOBn4v/gr303Sgu0n
         iZ2+i0EZ3igQ7XC0NDnWgj/SawsJf1Xozjbw9+M+0llt7WqsKB0RH4NiD7PFkrbIpXAs
         jZCTarjsowpaFrT1ImLVtPFVvzCkQItDaX7uV68O+P8HGOOCIRrVAI0Zb1NCIXssG9HT
         dS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVimxNcid4Nqu6lluydhqdHWuyvtkPhIto/D6tYsx7qGh8tkN5WvXtNYamieOiv+ExE3I50hgcXuwJq@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDBTr5C3Stbo2b3lZK6rl56wUybgjQHwCJ47Etn2KSiWnIGKf
	rI6mdPV53Hq+ioe08Pa0FtB48lIfU7JExbAYQSkiyhh352oJfzuZOEKP
X-Gm-Gg: AY/fxX4nCyFeYC0+ZuXVUA+SuOp6c8xUkWVhJRurjFqvLWtTiqvzBfdp/UzztPJx9eK
	6mJ9l8nSjkf7kUjD6PU6WKDhtWJ+8GPirDwqIra1XpUgi+2kYMMJhezMFY8bCl5iQZrrWZPQYYY
	f5AIZxasFqxm120Zh/5EgNIGRfOMBxDEnqDu80CSN665azN9PTpBzoB4MRampdcTV+lALR6hy9r
	ZGZlXngrncV98uODtzhfFERQ0Jx6iavsgpOFf6qDD5TLi115HocNRQdP33xiGOLbMVjk92LxZSi
	U5O3u4d4g8fbKv4hvNS8KeWiNvWRnaEbB/j5mkM1mCNnvYxSmzGG9WNEDa7gPFAfLdtTcY/UMyB
	n4/2qLwY6OoYwZq1nm07EpyDzb62dn8AX9a7psqLSOqZNLLdZTiI9JlYke2dgs15V9m9A1XrLCf
	NbJYawwnhizbQ7yzlV1pU=
X-Google-Smtp-Source: AGHT+IGZ0L9l7A5Odalp5J0/0NIl+zjmCJtcDKPahPJ7kG1ItBw9GgpXroQrL1TURDT38jXXgCfg8w==
X-Received: by 2002:a05:600c:4f86:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47a8f9071c6mr29585235e9.21.1765557229319;
        Fri, 12 Dec 2025 08:33:49 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a7044csm14112522f8f.15.2025.12.12.08.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 08:33:49 -0800 (PST)
Message-ID: <67209860ae2ff5626b7eaa50f2dd4b496eaa06d3.camel@gmail.com>
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
Date: Fri, 12 Dec 2025 16:34:29 +0000
In-Reply-To: <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
	 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
	 <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-06 at 10:40 -0800, Guenter Roeck wrote:
> On 12/4/25 08:15, Nuno S=C3=A1 via B4 Relay wrote:
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > Support the LTC4283 How Swap Controller. The device features programmab=
le
> > current limit with foldback and independently adjustable inrush current=
 to
> > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOS=
FET
> > temperature rise for reliable protection against overstresses.
> >=20
> > An I2C interface and onboard ADC allow monitoring of board current,
> > voltage, power, energy, and fault status.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> I finally found the time to write module test code for the driver.
>=20

Thanks!

> Some early feedback:
>=20
> - The driver must work with non-devicetree systems and without device
> =C2=A0=C2=A0 property support. Select defaults where necessary.

I'll double check that... But one thing that already comes to mind is rsens=
e? Rsense
is the main design choice for a thing like this. Not sure we can decide on =
a meaningful
default for it? I believe we have the same situation for ltc4282.c

> - Attributes marked as readable in the is_visible function must be readab=
le.
> =C2=A0=C2=A0 It is not acceptable to return -EOPNOTSUPP. That applies to =
all
> =C2=A0=C2=A0 reset_history attributes and maybe to others.

Hmm that's a mistake. They should be WO and I have the same bug in ltc4282 =
so I need to
send a patch.

- Nuno S=C3=A1
>=20

