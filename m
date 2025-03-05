Return-Path: <linux-gpio+bounces-17115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E1A5004D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 14:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C41A93B5AE9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C37C248876;
	Wed,  5 Mar 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVRcSRqb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7B247DDD;
	Wed,  5 Mar 2025 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180389; cv=none; b=luOHcBNnQqve5WCAAeflDvJso/mTcB9iql60X08WbnPoBE1j86CowYj92tBCcTKSiyclUt63bpaCr+NYCbcihaE5HD9T0AZzJf068AGPKiP9X3IPDXu84iUr3fmd6+74D8MtJkeDpZbQ8AitiPYGtFjQG8bJk2pM6wVZ7pxIuII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180389; c=relaxed/simple;
	bh=uvmG5QJWZ2Ye2xa3dR6GgdJ0KCYJpB1tdF5a0t9tvV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2xmtwRbSFySgpTSMywk2Urt5zobpgzudmtu2YqfVU+NlO7RgjUc3tXdBaw/SOgsE2gECBR4F2SAimVelsHSamYQvfSEcZUaK3NP3kx5+rOwJUZ8Ef2ufcFe4T0iMkdJ8ep7HcY501eggOBP++ffSke+LQZZg6yJoq1hFZwbs2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVRcSRqb; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so7533743e87.1;
        Wed, 05 Mar 2025 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741180385; x=1741785185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHvBs8LqDr1CyCcVZ4KGUWjU6v/QgTZS9xOG0QkppUU=;
        b=hVRcSRqbrt9GtTiHrugfkjIUJJtd+XpJqZ0fyRvHX+kiIWD2BnHGQ1zJiPNkODKXkm
         rrCc7rhiYMc8nqVBI65Tsx99P/Pfmk0FJY0Jw9m2BqZX2TrchVeMC70290n0ZPYtSSEw
         bR7zZlYtNNCYMR5VqmgQFsmTpkoVbEb3V76zZhKnA8ZlrOo4ueRZeOCgrenw+bFPWmDS
         bKiqBGQaJalSixzK5fUdokJSnT4PDyTtKUsK1VDIWD5C2F9iS9f1fPLijJM9JyRz534w
         F+4OnqXzyody4DxQT23EOfKkkXVysmNDJXuPqSNsw5pwaGnMrZnJE3n6L+uQlCODnQFA
         c4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180385; x=1741785185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHvBs8LqDr1CyCcVZ4KGUWjU6v/QgTZS9xOG0QkppUU=;
        b=le3+L6O1su7LrMa2E7sT01cTE5CeZDY8jtuL2bco0Z+AKzf/eHjtR671CzmR8Hcwv9
         e5oIUlVleNYi6vHEcMi3W7qQVqZRpaj/NzXt0tnMP+VfgXdbl1wyfVcrhkM6S75qPBAV
         KdqevIVaOFA9qH8hI4kj5w3qR4u2mj/8YiN1LPKtgyoglBX54m3nW02VpshAc88n2eSb
         esGuhusOcjrYV3lMVIPQEqj3HaB89FGu3T7qGsCnvgLpFY0JpDQyUw0pUNxwqMm5GUjI
         h8YXAEmTBDWDpwxQM5l7ByRFybuWkgyurOFRZD7/AyvPGMqDrvxzHFs1drHm3cDJoZWW
         7u8g==
X-Forwarded-Encrypted: i=1; AJvYcCXLk0vlVLPToVY2HiGMdoeQ2Ft5YDHufry0HWpQ1guFoxzA2F4t7wWdzkAYPquQL3xPAJulOsYAVdeTfptK@vger.kernel.org, AJvYcCXbOzDONFws0H9lOn7fkzyxjVGkrISRFzTOZyGQRKBvZLP8EONrdn9kV6SiHUR6SER51Pq17lTLZRNy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4nV2IJR2cRxcg2nrVHYEwq9tk2uALXMlBn3QbVPaslEihPbq0
	e46UE+LdOl4jsDYcOkXvdRxGCjYPGqR67lBT/Bo7G1IfbwTx3HQC
X-Gm-Gg: ASbGncvlUDyRN5nNYvcNKDEK1zgEU5A8v/qo3X0Gp7rmECd3V1KfUnlitA7gcEfBUow
	dKSPTpMJLaizC63Rr3i4GcVRcfhcwQhsIe4omv4WTmxGqz7oIpsD6Xoi58T+hsAPiqzyPj2DG2c
	h898PVDBxplztgHF2yh5piCfSAGBRCt7sodKFahTGpVSIjXYN6KDPPjNjq0xmH/i0QBA+7L00i0
	Un6Q/FFRY6AdASk5zjlXW4ycRI+tteEmw20g5WQ+s2V7v6fPDJC9MwYafzwH2wKJXQ/P3HwXWIx
	2jMG+RFj9lUX4ESduAcSWjD1+qtes8Yb64ayBXfSKWuk1aHDqOQ=
X-Google-Smtp-Source: AGHT+IF25Q3LO1//ZI187Q5Vs3Za5Zt5D7e2lU8WSZqluXp3dyXsXaTJkHllLhzz99SR/KOlX7Lxgw==
X-Received: by 2002:a05:6512:3089:b0:549:7394:2cd0 with SMTP id 2adb3069b0e04-5497d337e68mr1064479e87.19.1741180385016;
        Wed, 05 Mar 2025 05:13:05 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494bff2636sm1674670e87.219.2025.03.05.05.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:13:04 -0800 (PST)
Date: Wed, 5 Mar 2025 15:13:00 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 2/4] gpio: Add a valid_mask getter
Message-ID: <026f9d78502eca883bfe3faeb684e23d5d6c5e84.1741180097.git.mazziesaccount@gmail.com>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ep+lPcCHAsNg9p+A"
Content-Disposition: inline
In-Reply-To: <cover.1741180097.git.mazziesaccount@gmail.com>


--ep+lPcCHAsNg9p+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The valid_mask member of the struct gpio_chip is unconditionally written
by the GPIO core at driver registration. It shouldn't be directly
populated by drivers. This can be prevented by moving it from the struct
gpio_chip to struct gpio_device, which is internal to the GPIO core.

As a preparatory step, provide a getter function which can be used by
those drivers which need the valid_mask information.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Revision history:
v2 =3D> v3:
 - Rebase to gpio/for-next
v1 =3D> v2:
  - New patch
  (spin-off from discussion to v1:
   https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/)
---
 drivers/gpio/gpiolib.c      | 16 ++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b5f472beb3bd..4c15a70d4d80 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -723,6 +723,22 @@ static int gpiochip_add_pin_ranges(struct gpio_chip *g=
c)
 	return 0;
 }
=20
+/**
+ * gpiochip_query_valid_mask - return the GPIO validity information
+ * @gc:	gpio chip which validity information is queried
+ *
+ * Returns: bitmap representing valid GPIOs or NULL if all GPIOs are valid
+ *
+ * Some GPIO chips may support configurations where some of the pins aren't
+ * available. These chips can have valid_mask set to represent the valid
+ * GPIOs. This function can be used to retrieve this information.
+ */
+const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc)
+{
+	return gc->valid_mask;
+}
+EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
+
 bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 83e0a7e86962..e3b59fda62e0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -720,6 +720,7 @@ bool gpiochip_line_is_open_source(struct gpio_chip *gc,=
 unsigned int offset);
 /* Sleep persistence inquiry for drivers */
 bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int offset=
);
 bool gpiochip_line_is_valid(const struct gpio_chip *gc, unsigned int offse=
t);
+const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
=20
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
--=20
2.48.1


--ep+lPcCHAsNg9p+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfITdwACgkQeFA3/03a
ocUo4gf/Q+NC0QKnIMARZo9X2BFgPG5YZtjjw0Dmr5GKLHWjEKAPF4fJkBYhRLzo
5EZaSC50CGZyOGFpNdPmhvgUWRmMGG7XiqP4dNxY4ioUwUfXpTLB5oZurYHzxUzc
XHbd1hrcot7q8/lUe6fdJ0PffDYsqvQnjGpgjhAEBafUjuYuaOR6sD57/8IZPBL+
xeF/w7JCczQZDPLzn65TgcMFOrkcXVg7Ma5wyfwXSP+Z0PFb39ym7WQ6NfXYIa4f
O/kbzz3CCRuD9Tvh79sLsyz/z3eRtRQ2To0dO8V4RhaVQbcDusqiTIjFuJGTpqIr
vHD0jXVktgBJz7PgD3Q2Banhei8moA==
=zAIr
-----END PGP SIGNATURE-----

--ep+lPcCHAsNg9p+A--

