Return-Path: <linux-gpio+bounces-26862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFBFBC0AFC
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 10:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 512524F4BA1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 08:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E57D2E0B74;
	Tue,  7 Oct 2025 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvtEzi7L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511412D4807
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826032; cv=none; b=XqsdLoMgEdoDpn39LJL+AtVsAqntTHbLIClLSJbzcIBzz/iBJ0CwM88CiyjZWEun9/fD4D18QVKvckrufJ/KfiwoS6otfbyTWGTaRtxvLN0fkZI5gKFhSkvyw7XyIKY9WzHmJlyeLziAwuuN9aooPlOP7YAN4PDm1RMHp4bqMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826032; c=relaxed/simple;
	bh=1iY8dgK/r7VYOZvJEas2P75fHwdABfTnDJv6B71gZwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gssoWQ8e4Ye0UKWqJgtnWYyG9yiJpvHGVyQBOrBfaZAi64PF/+K5PwyCA5t3apI1T8dBWpXvx5nw042Q85ajoX1EsZS7w+ArkPnopfT/E3i+iZEnr85j6rmDNZBliEe05eaiy0AQPjhKx5SnT13yZXDi6HiWuLOo3F0ZrVzeNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvtEzi7L; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so6732890e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 01:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826027; x=1760430827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=56U4cHXm/XO+yZsN8UYLacC0NRz5ruIRpTT3AQstYVU=;
        b=GvtEzi7LO++FCpXY5Pwj6ebSKH/tNsC43rHTbEjrKqP9pbyRAfftAvC/UXWEtYd2br
         tnTvfmfAhtXi6sbjedf+dxL3BW3VDl29qv1VzlLq59hYB6TtF+QD6ovw/exd621bMXir
         EZ3rJwkIMKpK0cbzuZv9VAlxXybRJ6iGTSs3qj5GofZ7aAqEsAAl0twjRFz8Z6hvHpoI
         ElJuWOHKQ6wgPA76saqaP066ZYmuFx5JOVN7xn1zahPLdvBhuKiKacQz64LF4d/UQYqf
         e2V3rJo3Z5jHjwLaYEUMOUfhGcqboT1Outv1Pl1NDP+bp/IsD6kNOZcTnjPZWXGjoLfz
         Xwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826027; x=1760430827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56U4cHXm/XO+yZsN8UYLacC0NRz5ruIRpTT3AQstYVU=;
        b=QOApW8vsQVA8kwT0nPiUtwpga4en/VHV5jfDvhSBmQePkaBXmmpoeI4UvzlgGqQQ1Q
         LKUNpRM0BAGYUWlIOIgC6zv2R3klGrrgpR2l8a+ilZywxBiRQ5J6FeMv6glv+W85Lrnh
         LLWGl21/hAWKLb0lx+CnybekdFsFCbnHN25YSRV5JD7RuQByxDDutcK5ukWdRe65KbiD
         wqMMB4GqTnZD0Cm6OkN7V4HZWsBl4Ipi7z0DtQkJzoiX0H06FjbgaiOFyQCyG4XprCl3
         qcN1Kxuepl8TClxTOKSzLW7ilrAMGdZfiUS8luPeWAdiNMyXK9zj826PhEtz4zk8TGO4
         KKVg==
X-Forwarded-Encrypted: i=1; AJvYcCVvCnimFpJQWq3nvNr/N8OMFV4h/M7xui62c5jc1yX2HEutA6ANhGI5/FHnhnYypw+9UIb+xPgMJsIl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5IRY8gGLIVIaI7Eqh1fplSm/XtGOch0aDIvCsSTSgjoQx6FJ
	3mC8ekIRCgzqiqWK01k2/hlxaqNLzWE/cHLHaymSvKAvG3XRLPtVhWle
X-Gm-Gg: ASbGncsnVRXVc5VdqAVdEDLVnCw+EIwycfjxJs+TjeENm5eykekoJszmqXoPzR01dNL
	8RJIklx09GiJF4BPsR3GqSMA0JTmxe6SH1ZM3GT/Be+6XMnuf7GtG8bjK0NVbPyir1qXvk+LHBS
	NN1UwByN515QDr3DFjuf+IRQ8kDLp5a8wB/LzAmDI77n5VJZIxf6mONa6Ofz4AFBtblE6UuVazM
	KwOiUoQ+o9Ioyt0JqjV1ognk8F8woIHKyS7e43Up7WIh5cEkfgqpauNdglAL6KpNSmlHyrROceB
	Ikoahlktx0ccDX7QDf4sT7LXb8vbr5uvAGNJv4l2vteHdBAUq7JN23plHjS9IhIjMwEXvJOOdzW
	kUex+w/ngtIVrmXn3MjEQkoSzG3yjmgVvVxtJaRw0l2DEZWqLtroW4A==
X-Google-Smtp-Source: AGHT+IFPlR5J0y/lc2XUcE6O1X+JtlZJeu/GYYDJksj4es7AGQByzJg+EaWCHdJkoi6q7phUr464xA==
X-Received: by 2002:a05:6512:39d4:b0:57e:7040:9c77 with SMTP id 2adb3069b0e04-58cbba0232bmr5051448e87.38.1759826027136;
        Tue, 07 Oct 2025 01:33:47 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112480fsm5865665e87.21.2025.10.07.01.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:33:45 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:33:42 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC PATCH 05/13] dt-bindings: leds: bd72720: Add BD72720
Message-ID: <52a4df1a12f6b480150187d956d0fcd57fe626d1.1759824376.git.mazziesaccount@gmail.com>
References: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hl5GOwGd5SzFL3hD"
Content-Disposition: inline
In-Reply-To: <cover.1759824376.git.mazziesaccount@gmail.com>


--Hl5GOwGd5SzFL3hD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add the ROHM BD72720 documentation to the binding documents.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---

NOTE: The Linux LED driver does currently have: values
bd72720-grnled and bd72720-ambled for the rohm,led-compatible. These are
handled identically to the existing bd71828-grnled and bd71828-ambled
and should be removed from the driver. Thus they are not documented in
the binding document.

Furthermore, the BD72720 Linux driver does not use the compatible property
=66rom the LED node. The Linux driver is load and probed based on the PMIC
compatible in the MFD node. Thus no compatible string for the BD72720
LED node is added.
---
 .../devicetree/bindings/leds/rohm,bd71828-leds.yaml        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml =
b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
index b7a3ef76cbf4..64cc40523e3d 100644
--- a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -10,11 +10,12 @@ maintainers:
   - Matti Vaittinen <mazziesaccount@gmail.com>
=20
 description: |
-  This module is part of the ROHM BD71828 MFD device. For more details
-  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+  This module is part of the ROHM BD71828 and BD72720 MFD device. For more
+  details see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+  and Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
=20
   The LED controller is represented as a sub-node of the PMIC node on the =
device
-  tree.
+  tree. This should be located under "leds" - node in PMIC node.
=20
   The device has two LED outputs referred as GRNLED and AMBLED in data-she=
et.
=20
--=20
2.51.0


--Hl5GOwGd5SzFL3hD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0GYACgkQeFA3/03a
ocWo9ggAj4GBq9go42smGGQBwidPKeFC80081lry80AjjqdeBzWn8ydINnkvdFVU
OboKgpob0WwNIuyoripCr55U0emX7Pdg/SN9pMPanh2oWvN1A3dZLfPW07smIpfC
jv0WPOIeBqCOfjNRbriaGHx3mGlfjcYEJrt4TMb8JlHJpvYRMDjNzDoGI3oUGEgR
lqnXCPRgb76A+OT1Gnx9zDwm8p2PpVpOnutdlxQ3JtLKpH2XjKUqQM9RhOqJ7hme
ElMvS16kznuAMzBGKD5ByXcYOlFaQlg2d8IMcnUM7W9PmkVKEzoeqfE4XHZN8ljy
RW+XE1gvB9Lc2j88vgeXM9rMxGO0jw==
=CW2a
-----END PGP SIGNATURE-----

--Hl5GOwGd5SzFL3hD--

