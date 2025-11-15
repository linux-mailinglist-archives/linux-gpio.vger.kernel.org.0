Return-Path: <linux-gpio+bounces-28530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F81C5FD4A
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 02:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8A23BAA91
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 01:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE111DE3AC;
	Sat, 15 Nov 2025 01:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHsT/8hN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E61D5ACE
	for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 01:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763169969; cv=none; b=JdS8Y8y9NpgcJUcbN3WdiiRbGSRoCdt0VAo6A3Nnva5muDz4ZInWqlNKitkELxwS9mF8eZpym0Qkhc/NTnA2dPJgQNF8ltQ68PzLuSjmDMO/5KaAXHaLy8g2Lr124UVerIg0rylN+f02+/l2RHAbbP7LjkoEbpG7Q4nFrq3ZluY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763169969; c=relaxed/simple;
	bh=Fc/2LECSauEg8ifd/nb3H70h+5XEWPPCPxt6MKnMOiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckeeQ0n1rtMcnYT/iCSFIAPkOWGX9pcFS4a1SG68asTxL6aEdGwRTD/RqwxhrEtHJoOuQf7Yl4jJHiMcNvou/Q3s3GgSokatpBQYknm92BsNnuYPlKwDx87fs/idOhjse5d69A756jodTHmm0ii1LnLKfB/7QgXkPte7Jx1lHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHsT/8hN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297d4ac44fbso27367995ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 17:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763169967; x=1763774767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/NAdrAJXJ7V++HAwaXsRm6bl9T7tiP6tNNPXSHhIbM=;
        b=eHsT/8hNUfkXf8v5M0PTzDQS4yPdMKnjDzjRVlM6hQ+IidGCa8FMGl+KIxUm2xn4Jg
         5w9LJOxPU6zhRfdg+rA8lSodaMwXD1dRTrzl4BTqCKkjY3lFRQRhALNT+fnERgZN7qov
         TFo95yYj2V/TXOiHxSih+GeOXc+cTA8/n9aqC/usffaHNU8a6jAKTIsG9e0SRUq+1dNp
         g6PiPn7+Y9cRGVJW/vh+ADKPkHk49l6iruwSU9jvM/xGWTnHTN9a0Kr0jCHKLWzkHjW3
         ZunMFkXKrQqSLpdh6CrdyQoX3Hbrf6tfuJrpJEbnAq1Fot4CR/MN07JTEug/CY51XX7N
         Eklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763169967; x=1763774767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/NAdrAJXJ7V++HAwaXsRm6bl9T7tiP6tNNPXSHhIbM=;
        b=gz9YUxlk43+WR/fiDnGLpry9RgwdMdW9RMC8WFN2VaIe+rs9AnL61J2jVMuZ6mKNgm
         8WPLG4VOzrjgAdqJ7Uw7nr8oh4DhebkH5/ZbHlrGdbuXRDT5ZQH8FsY3PXF2MibHB2pr
         v8qi5EvrOkfJ/ogEkRphMTRZa9svBialiW5M9mf3iUQav2NNmUjqWTAduROAQb0AuWM9
         g6DK37ZEvd2Dsq3aTHLIv0H6YZWEWpQkkVcfD0G2a88SAWFK+NBcaEfhRGEJLnZ4aasp
         x3wuimv+ILD7qEwTXvWntKCdUGesMciSASAlnY1+bWylME8yL+iN2UQqq+Fk/rt9YWgR
         V7iA==
X-Forwarded-Encrypted: i=1; AJvYcCWgL71k1QYOi+jPMQj2D6biWK9EExBY3S5d99It9QI4wBKqNoroJfvNa3RyGVPmXcd0vP5vsRfSScLX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3rzrYRDs5CLLD6ve1BtscBABMiaOGq6UOIEY9x8NTFKNETqP
	b/AUA8PGkN4amY3OYhpAw/T5YSjlQ5e1hQKUaCx5UIYBFzzqlvn/1TnZ
X-Gm-Gg: ASbGncvgYdPRiGAZLpYRKWjHsF7BRPrbSOzWmLyaAWH0FkoUCGR21QSjk/19WcObPod
	p7vzDlq1FquOH2LsmMyVo1rQCtsUuPAYi0kacgdZA9FHf4Sn3xkvBz/UhJtl1ktF6f+ZzfAQRpB
	hkDLIfOHil7pJQ3xzMyua3hlnlALKiV9TES1ajosXa2H9K0wgEj3fBowqxnwKmQtO8Pw+CIRXLI
	wSrmSI/qUAbzdjuoh/dnFogzauZqfBW9wIZV7cevrvcO9enStsf5F+JriRSA9MoNNQkZK8LtXJo
	ZahH5EHd2XDw2DirdxF3Z3uW8GL1khXrzSbUovEALqtxeCROmu7yn5yQl9zrCpJK9F7r2JBbO3B
	cuC3KHnm8ClyphAXu6CJaPyTaSrEL4+ARgAQX45XX0ZMlgdbKhbuvvaEXkSL/S8/XEeQcTzPWXI
	dV
X-Google-Smtp-Source: AGHT+IHeqhLvVvlM9/xTM+0AaLsrpTomwoR7pKv2D+U8a04CPxe4gwL0u+MLY6wNTBQ1PmV9r66FFw==
X-Received: by 2002:a17:903:1112:b0:295:7423:530a with SMTP id d9443c01a7336-2986801b5a3mr60472515ad.29.1763169966379;
        Fri, 14 Nov 2025 17:26:06 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed39sm68345165ad.77.2025.11.14.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 17:26:05 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3A37C4209E72; Sat, 15 Nov 2025 08:25:55 +0700 (WIB)
Date: Sat, 15 Nov 2025 08:25:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Levente =?utf-8?B?UsOpdsOpc3o=?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
Message-ID: <aRfWouKGA7q2ufCV@archie.me>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QdtxYz/JQTq6lKFi"
Content-Disposition: inline
In-Reply-To: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>


--QdtxYz/JQTq6lKFi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:48:20PM +0100, Andy Shevchenko wrote:
> diff --git a/Documentation/driver-api/gpio/pca953x.rst b/Documentation/dr=
iver-api/gpio/pca953x.rst
> new file mode 100644
> index 000000000000..4bd7cf1120cb
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/pca953x.rst
> @@ -0,0 +1,552 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +PCA953x I=C2=B2C GPIO expander compatibility list
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Author: Levente R=C3=A9v=C3=A9sz <levente.revesz@eilabs.com>
> +
> +I went through all the datasheets and created this note listing
> +chip functions and register layouts.

Nit: above first-person intro can be instead edited to:

This document lists chip functions and register layouts for all chips
supported by PCA953x driver.

> +
> +Overview of chips
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Chips with the basic 4 registers
> +--------------------------------
> +
> +These chips have 4 register banks: input, output, invert and direction.
> +Each of these banks contains (lines/8) registers, one for each GPIO port.
> +
> +Banks offset is always a power of 2:
> +
> +- 4 lines  -> bank offset is 1
> +- 8 lines  -> bank offset is 1
> +- 16 lines -> bank offset is 2
> +- 24 lines -> bank offset is 4
> +- 32 lines -> bank offset is 4
> +- 40 lines -> bank offset is 8
> +
> +For example, register layout of GPIO expander with 24 lines:
> +
> ++------+-----------------+--------+
> +| addr | function        | bank   |
> ++=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D+
> +|  00  | input port0     |        |
> ++------+-----------------+        |
> +|  01  | input port1     | bank 0 |
> ++------+-----------------+        |
> +|  02  | input port2     |        |
> ++------+-----------------+--------+
> +|  03  | n/a             |        |
> ++------+-----------------+--------+
> +|  04  | output port0    |        |
> ++------+-----------------+        |
> +|  05  | output port1    | bank 1 |
> ++------+-----------------+        |
> +|  06  | output port2    |        |
> ++------+-----------------+--------+
> +|  07  | n/a             |        |
> ++------+-----------------+--------+
> +|  08  | invert port0    |        |
> ++------+-----------------+        |
> +|  09  | invert port1    | bank 2 |
> ++------+-----------------+        |
> +|  0A  | invert port2    |        |
> ++------+-----------------+--------+
> +|  0B  | n/a             |        |
> ++------+-----------------+--------+
> +|  0C  | direction port0 |        |
> ++------+-----------------+        |
> +|  0D  | direction port1 | bank 3 |
> ++------+-----------------+        |
> +|  0E  | direction port2 |        |
> ++------+-----------------+--------+
> +|  0F  | n/a             |        |
> ++------+-----------------+--------+
> +
> +.. note::
> +     This is followed by all supported chips, except by pcal6534.

Do you mean aforementioned banks offset arrangement?

> +
> +The table below shows the offsets for each of the compatible chips:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +pca9536        4        no    00     01     02        03
> +pca9537        4       yes    00     01     02        03
> +pca6408        8       yes    00     01     02        03
> +tca6408        8       yes    00     01     02        03
> +pca9534        8       yes    00     01     02        03
> +pca9538        8       yes    00     01     02        03
> +pca9554        8       yes    00     01     02        03
> +tca9554        8       yes    00     01     02        03
> +pca9556        8        no    00     01     02        03
> +pca9557        8        no    00     01     02        03
> +pca6107        8       yes    00     01     02        03
> +pca6416       16       yes    00     02     04        06
> +tca6416       16       yes    00     02     04        06
> +pca9535       16       yes    00     02     04        06
> +pca9539       16       yes    00     02     04        06
> +tca9539       16       yes    00     02     04        06
> +pca9555       16       yes    00     02     04        06
> +max7318       16       yes    00     02     04        06
> +tca6424       24       yes    00     04     08        0C
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Chips with additional timeout_en register
> +-----------------------------------------
> +
> +These Maxim chips have a bus timeout function which can be enabled in
> +the timeout_en register. This is present in only two chips. Defaults to
> +timeout disabled.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction timeout_en
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +max7310        8        no    00     01     02        03         04
> +max7312       16       yes    00     02     04        06         08
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Chips with additional int_mask register
> +---------------------------------------
> +
> +These chips have an interrupt mask register in addition to the 4 basic
> +registers. The interrupt masks default to all interrupts disabled. To
> +use interrupts with these chips, the driver has to set the int_mask
> +register.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction int_mask
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +pca9505       40       yes    00     08     10        18       20
> +pca9506       40       yes    00     08     10        18       20
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Chips with additional int_mask and out_conf registers
> +-----------------------------------------------------
> +
> +This chip has an interrupt mask register, and an output port
> +configuration register, which can select between push-pull and
> +open-drain modes. Each bit controls two lines. Both of these registers
> +are present in PCAL chips as well, albeit the out_conf works
> +differently.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction int_mask out_co=
nf
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +pca9698       40       yes    00     08     10        18       20       =
28
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +
> +pca9698 also has a "master output" register for setting all outputs per
> +port to the same value simultaneously, and a chip specific mode register
> +for various additional chip settings.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D
> +compatible master_output mode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D
> +pca9698               29   2A
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D
> +
> +Chips with LED blink and intensity control
> +------------------------------------------
> +
> +These Maxim chips have no invert register.
> +
> +They have two sets of output registers (output0 and output1). An internal
> +timer alternates the effective output between the values set in these
> +registers, if blink mode is enabled in the blink register. The
> +master_intensity register and the intensity registers together define
> +the PWM intensity value for each pair of outputs.
> +
> +These chips can be used as simple GPIO expanders if the driver handles t=
he
> +input, output0 and direction registers.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +compatible lines interrupt input output0 direction output1 master_intens=
ity blink intensity
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +max7315        8       yes    00      01        03      09              =
 0E    0F        10
> +max7313       16       yes    00      02        06      0A              =
 0E    0F        10
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Basic PCAL chips
> +----------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +pcal6408       8       yes    00     01     02        03
> +pcal9554b      8       yes    00     01     02        03
> +pcal6416      16       yes    00     02     04        06
> +pcal9535      16       yes    00     02     04        06
> +pcal9555a     16       yes    00     02     04        06
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +These chips have several additional features:
> +
> +    1. output drive strength setting (out_strength)
> +    2. input latch (in_latch)
> +    3. pull-up/pull-down (pull_in, pull_sel)
> +    4. push-pull/open-drain outputs (out_conf)
> +    5. interrupt mask and interrupt status (int_mask, int_status)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +compatible out_strength in_latch pull_en pull_sel int_mask int_status ou=
t_conf
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +pcal6408             40       42      43       44       45         46   =
    4F
> +pcal9554b            40       42      43       44       45         46   =
    4F
> +pcal6416             40       44      46       48       4A         4C   =
    4F
> +pcal9535             40       44      46       48       4A         4C   =
    4F
> +pcal9555a            40       44      46       48       4A         4C   =
    4F
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Currently the driver has support for the input latch, pull-up/pull-down
> +and uses int_mask and int_status for interrupts.
> +
> +PCAL chips with extended interrupt and output configuration functions
> +---------------------------------------------------------------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +pcal6524      24       yes    00     04     08        0C
> +pcal6534      34       yes    00     05     0A        0F
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +These chips have the full PCAL register set, plus the following function=
s:
> +
> +    1. interrupt event selection: level, rising, falling, any edge
> +    2. clear interrupt status per line
> +    3. read input without clearing interrupt status
> +    4. individual output config (push-pull/open-drain) per output line
> +    5. debounce inputs
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +compatible out_strength in_latch pull_en pull_sel int_mask int_status ou=
t_conf
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +pcal6524             40       48      4C       50       54       58     =
    5C
> +pcal6534             30       3A      3F       44       49       4E     =
    53
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +compatible int_edge int_clear input_status indiv_out_conf debounce debou=
nce_count
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +pcal6524         60        68           6C             70       74      =
       76
> +pcal6534         54        5E           63             68       6D      =
       6F
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +As can be seen in the table above, pcal6534 does not follow the usual
> +bank spacing rule. Its banks are closely packed instead.
> +
> +PCA957X chips with a completely different register layout
> +---------------------------------------------------------
> +
> +These chips have the basic 4 registers, but at unusual addresses.
> +
> +Additionally, they have:
> +
> +    1. pull-up/pull-down (pull_sel)
> +    2. a global pull enable, defaults to disabled (config)
> +    3. interrupt mask, interrupt status (int_mask, int_status)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +compatible lines interrupt input invert config pull_sel direction output=
 int_mask int_status
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +pca9574        8       yes    00     01     02       03        04     05=
       06         07
> +pca9575       16       yes    00     02     04       06        08     0A=
       0C         0E
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Currently the driver supports none of the advanced features.
> +
> +XRA1202
> +-------
> +
> +Basic 4 registers, plus advanced features:
> +
> +    1. interrupt mask, defaults to interrupts disabled
> +    2. interrupt status
> +    3. interrupt event selection, level, rising, falling, any edge
> +       (int_mask, rising_mask, falling_mask)
> +    4. pull-up (no pull-down)
> +    5. tri-state
> +    6. debounce
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +compatible lines interrupt input output invert direction pullup_en
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +xra1202        8       yes    00     01     02        03        04
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +compatible int_mask tristate int_status rising_mask falling_mask debounce
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +xra1202          05       06         07          08           09       0A
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Overview of functions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This section lists chip functions that are supported by the driver
> +already, or are at least common in multiple chips.
> +
> +Input, Output, Invert, Direction
> +--------------------------------
> +
> +The basic 4 GPIO functions are present in all but one chip category, i.e.
> +`Chips with LED blink and intensity control`_ are missing the invert
> +register.
> +
> +3 different layouts are used for these registers:
> +
> +    1. banks 0, 1, 2, 3 with bank offsets of 2^n
> +        - all other chips
> +
> +    2. banks 0, 1, 2, 3 with closely packed banks
> +        - pcal6534
> +
> +    3. banks 0, 5, 1, 4 with bank offsets of 2^n
> +        - pca9574
> +        - pca9575
> +
> +Interrupts
> +----------
> +
> +Only an interrupt mask register
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The same layout is used for all of these:
> +
> +    1. bank 5 with bank offsets of 2^n
> +        - pca9505
> +        - pca9506
> +        - pca9698
> +
> +Interrupt mask and interrupt status registers
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +These work the same way in all of the chips: mask and status have
> +one bit per line, 1 in the mask means interrupt enabled.
> +
> +Layouts:
> +
> +    1. base offset 0x40, bank 5 and bank 6, bank offsets of 2^n
> +        - pcal6408
> +        - pcal6416
> +        - pcal9535
> +        - pcal9554b
> +        - pcal9555a
> +        - pcal6524
> +
> +    2. base offset 0x30, bank 5 and 6, closely packed banks
> +        - pcal6534
> +
> +    3. bank 6 and 7, bank offsets of 2^n
> +        - pca9574
> +        - pca9575
> +
> +    4. bank 5 and 7, bank offsets of 2^n
> +        - xra1202
> +
> +Interrupt on specific edges
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +`PCAL chips with extended interrupt and output configuration functions`_
> +have an int_edge register. This contains 2 bits per line, one of 4 events
> +can be selected for each line:
> +
> +    0: level, 1: rising edge, 2: falling edge, 3: any edge
> +
> +Layouts:
> +
> +    1. base offset 0x40, bank 7, bank offsets of 2^n
> +
> +        - pcal6524
> +
> +    2. base offset 0x30, bank 7 + offset 0x01, closely packed banks
> +       (out_conf is 1 byte, not (lines/8) bytes, hence the 0x01 offset)
> +
> +        - pcal6534
> +
> +`XRA1202`_ chips have a different mechanism for the same thing: they have
> +a rising mask and a falling mask, with one bit per line.
> +
> +Layout:
> +
> +    1. bank 5, bank offsets of 2^n
> +
> +Input latch
> +-----------
> +
> +Only `Basic PCAL chips`_ and
> +`PCAL chips with extended interrupt and output configuration functions`_
> +have this function. When the latch is enabled, the interrupt is not clea=
red
> +until the input port is read. When the latch is disabled, the interrupt
> +is cleared even if the input register is not read, if the input pin retu=
rns
> +to the logic value it had before generating the interrupt. Defaults to l=
atch
> +disabled.
> +
> +Currently the driver enables the latch for each line with interrupt
> +enabled.
> +
> +    1. base offset 0x40, bank 2, bank offsets of 2^n
> +        - pcal6408
> +        - pcal6416
> +        - pcal9535
> +        - pcal9554b
> +        - pcal9555a
> +        - pcal6524
> +
> +    2. base offset 0x30, bank 2, closely packed banks
> +        - pcal6534
> +
> +Pull-up and pull-down
> +---------------------
> +
> +`Basic PCAL chips`_ and
> +`PCAL chips with extended interrupt and output configuration functions`_
> +use the same mechanism: their pull_en register enables the pull-up or pu=
ll-down
> +function, and their pull_sel register chooses the direction. They all us=
e one
> +bit per line.
> +
> +    0: pull-down, 1: pull-up
> +
> +Layouts:
> +
> +    1. base offset 0x40, bank 3 (en) and 4 (sel), bank offsets of 2^n
> +        - pcal6408
> +        - pcal6416
> +        - pcal9535
> +        - pcal9554b
> +        - pcal9555a
> +        - pcal6524
> +
> +    2. base offset 0x30, bank 3 (en) and 4 (sel), closely packed banks
> +        - pcal6534
> +
> +`PCA957X chips with a completely different register layout`_ have a pull=
_sel
> +register with one bit per line, and a global pull_en bit in their config
> +register.
> +
> +Layout:
> +
> +    1. bank 2 (config), bank 3 (sel), bank offsets of 2^n
> +        - pca9574
> +        - pca9575
> +
> +`XRA1202`_ chips can only pull-up. They have a pullup_en register.
> +
> +Layout:
> +
> +    1. bank 4, bank offsets of 2^n
> +        - xra1202
> +
> +Push-pull and open-drain
> +------------------------
> +
> +`Chips with additional int_mask and out_conf registers`_ have this funct=
ion,
> +but only for select IO ports. Register has 1 bit per 2 lines. In pca9698,
> +only port0 and port1 have this function.
> +
> +    0: open-drain, 1: push-pull
> +
> +Layout:
> +
> +    1. base offset 5*bankoffset
> +        - pca9698
> +
> +`Basic PCAL chips`_ have 1 bit per port in one single out_conf register.
> +Only whole ports can be configured.
> +
> +    0: push-pull, 1: open-drain
> +
> +Layout:
> +
> +    1. base offset 0x4F
> +        - pcal6408
> +        - pcal6416
> +        - pcal9535
> +        - pcal9554b
> +        - pcal9555a
> +
> +`PCAL chips with extended interrupt and output configuration functions`_
> +can set this for each line individually. They have the same per-port out=
_conf
> +register as `Basic PCAL chips`_, but they also have an indiv_out_conf re=
gister
> +with one bit per line, which inverts the effect of the port-wise setting.
> +
> +    0: push-pull, 1: open-drain
> +
> +Layouts:
> +
> +    1. base offset 0x40 + 7*bankoffset (out_conf),
> +       base offset 0x60, bank 4 (indiv_out_conf) with bank offset of 2^n
> +
> +        - pcal6524
> +
> +    2. base offset 0x30 + 7*banksize (out_conf),
> +       base offset 0x54, bank 4 (indiv_out_conf), closely packed banks
> +
> +        - pcal6534
> +
> +This function is currently not supported by the driver.
> +
> +Output drive strength
> +---------------------
> +
> +Only PCAL chips have this function. 2 bits per line.
> +
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +bits drive strength
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  00          0.25x
> +  01          0.50x
> +  10          0.75x
> +  11          1.00x
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +    1. base offset 0x40, bank 0 and 1, bank offsets of 2^n
> +        - pcal6408
> +        - pcal6416
> +        - pcal9535
> +        - pcal9554b
> +        - pcal9555a
> +        - pcal6524
> +
> +    2. base offset 0x30, bank 0 and 1, closely packed banks
> +        - pcal6534
> +
> +Currently not supported by the driver.
> +
> +Datasheets
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- MAX7310: https://datasheets.maximintegrated.com/en/ds/MAX7310.pdf
> +- MAX7312: https://datasheets.maximintegrated.com/en/ds/MAX7312.pdf
> +- MAX7313: https://datasheets.maximintegrated.com/en/ds/MAX7313.pdf
> +- MAX7315: https://datasheets.maximintegrated.com/en/ds/MAX7315.pdf
> +- MAX7318: https://datasheets.maximintegrated.com/en/ds/MAX7318.pdf
> +- PCA6107: https://pdf1.alldatasheet.com/datasheet-pdf/view/161780/TI/PC=
A6107.html
> +- PCA6408A: https://www.nxp.com/docs/en/data-sheet/PCA6408A.pdf
> +- PCA6416A: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
> +- PCA9505: https://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
> +- PCA9505: https://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
> +- PCA9534: https://www.nxp.com/docs/en/data-sheet/PCA9534.pdf
> +- PCA9535: https://www.nxp.com/docs/en/data-sheet/PCA9535_PCA9535C.pdf
> +- PCA9536: https://www.nxp.com/docs/en/data-sheet/PCA9536.pdf
> +- PCA9537: https://www.nxp.com/docs/en/data-sheet/PCA9537.pdf
> +- PCA9538: https://www.nxp.com/docs/en/data-sheet/PCA9538.pdf
> +- PCA9539: https://www.nxp.com/docs/en/data-sheet/PCA9539_PCA9539R.pdf
> +- PCA9554: https://www.nxp.com/docs/en/data-sheet/PCA9554_9554A.pdf
> +- PCA9555: https://www.nxp.com/docs/en/data-sheet/PCA9555.pdf
> +- PCA9556: https://www.nxp.com/docs/en/data-sheet/PCA9556.pdf
> +- PCA9557: https://www.nxp.com/docs/en/data-sheet/PCA9557.pdf
> +- PCA9574: https://www.nxp.com/docs/en/data-sheet/PCA9574.pdf
> +- PCA9575: https://www.nxp.com/docs/en/data-sheet/PCA9575.pdf
> +- PCA9698: https://www.nxp.com/docs/en/data-sheet/PCA9698.pdf
> +- PCAL6408A: https://www.nxp.com/docs/en/data-sheet/PCAL6408A.pdf
> +- PCAL6416A: https://www.nxp.com/docs/en/data-sheet/PCAL6416A.pdf
> +- PCAL6524: https://www.nxp.com/docs/en/data-sheet/PCAL6524.pdf
> +- PCAL6534: https://www.nxp.com/docs/en/data-sheet/PCAL6534.pdf
> +- PCAL9535A: https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf
> +- PCAL9554B: https://www.nxp.com/docs/en/data-sheet/PCAL9554B_PCAL9554C.=
pdf
> +- PCAL9555A: https://www.nxp.com/docs/en/data-sheet/PCAL9555A.pdf
> +- TCA6408A: https://www.ti.com/lit/gpn/tca6408a
> +- TCA6416: https://www.ti.com/lit/gpn/tca6416
> +- TCA6424: https://www.ti.com/lit/gpn/tca6424
> +- TCA9539: https://www.ti.com/lit/gpn/tca9539
> +- TCA9554: https://www.ti.com/lit/gpn/tca9554
> +- XRA1202: https://assets.maxlinear.com/web/documents/xra1202_1202p_101_=
042213.pdf

The rest LGTM.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--QdtxYz/JQTq6lKFi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRfWmwAKCRD2uYlJVVFO
o3+sAQDXySP2ut4Kww3pvhvjcByonRU8zGBYtXBJdQ+tRIv0HwD+JboozY1j7U+u
Np1XdyRkYgljEQE7f7p4wXeGJG7Wkws=
=M/qj
-----END PGP SIGNATURE-----

--QdtxYz/JQTq6lKFi--

