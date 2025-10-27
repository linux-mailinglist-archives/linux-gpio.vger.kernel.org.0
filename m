Return-Path: <linux-gpio+bounces-27646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334ADC0D374
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39FDB188D5B3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507182FDC5F;
	Mon, 27 Oct 2025 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODS30pIt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22D2FDC4A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565514; cv=none; b=CZxfEfuqCAWYBPdPaozhfqpOfmb+s8xjEcRtjJIlrn9Auau4y4jUQMOFdjSiA2IUCo6oDaqf8mxhEE9dDb1RC2UxaeifRJP4X3MKxKdFfuoFrOLWKAZjLLHWk9HFsdFeblIUbbyX9Ffj2T3v4Tdec+yLJ2cxbjBrVZiR3Wh4qoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565514; c=relaxed/simple;
	bh=IjpBU42ntX9XaYmyRucOHQzBqWEweHkDi9vYXmN8LMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP9WhkAGt6ahWTyh4SQ58sl0L2D0pejsoxQejSl9qkOi0aMbl16igfvb54qdOU/awG/NWSO9pUBvYvyXlyfagob5wVTUs9E9mXL2QARpzD5KV+bl8Jx9l/xw/HgtIQoKu8IcybH49P5E8Qb+VVj8qf0t5dDo1pJlwVw2QQbe5Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODS30pIt; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378ddb31efaso53709161fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 04:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565510; x=1762170310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3bvBuQH05UYV7qQeFG6dlKCPrhvCySjKkIncy7Gx44=;
        b=ODS30pItJia4v+EkFJTKwrB+i3DItT+o2TLpFP3zZnYPf30k+e3X/2CFVI3LZPYyMt
         /A3bOyjc+akTrbysEXVFYcA3GtLMHmOoCJfM/a65nt4ywNaerdGGp7ig883OMS7C+Rhw
         QTODaKXbrQhd9TQAhM/W0e4CJsp9wR2V7eHqemIgavolDfE54e43gllAbJ8UfIeis93x
         sTQGtT3tgwYUXWeYarCaWM6ZpfJ/Mjgv4jDsdDHvcntuB09SG2FdKVhnHVeswuhVyQOq
         SXxsSy5BwY5kw/DX1PNL/b/tJHKFWMYWPgwYMpI//dqEkWZkM3pzEe2QOam+okXFSWnf
         eYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565510; x=1762170310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3bvBuQH05UYV7qQeFG6dlKCPrhvCySjKkIncy7Gx44=;
        b=OesFpdzbVGu8SiEbObxt/jmZrySPtTx12jdBWw9m2nJJbUI7KFRX0jxNGiqiMl5J3g
         bneApFgX6XOA4d4OXIWj/e7Ug9INyOLyxZz8MthD7wpO0nNavbv8OLpIsMVBb7lujka0
         7weG7iHlDfv6heNTE7Ds5g/xjSilJ2Wso+nBiD6Ru3SyWe7IDIOUwE3x2Bp8gJN5Kgie
         O+hvPvcHgftzbI69FQqBLpXPdtnVG0AvVbNJqek3hJ5AgP9VxuuhghZk7BwY1HFy6lzf
         tKEuWnOi2w33oy0sY8tJ5GgU0ldMk0aH8Gj3cCjdNL/DWVmYPG9V+0ux7uwvn70jFGdC
         Jq+w==
X-Forwarded-Encrypted: i=1; AJvYcCVBpVj4j0QJ+Vp4C21pHmLyFgdAS9ctKoSk3OKMrx5BhXUE4SIwAPMyEaDjzYKOdd+DXC7UCQyeidF0@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOqpWKneiinruFyh6sSddkxOdihK09d9Z2IeiIhe2vKiFpQik
	LzdrJ8uq/TJd4Se6eftpYKzKg+CXePHIRBvbMxSzHQnlBcwaXQNBuhYF
X-Gm-Gg: ASbGncuT5jG5GLOFY2wWoFUEdjhDglDDxNu40KFb7BuFKZcnZw2t0rwHdS4v1r6M0L/
	hSI7SFvfRhMG5V0pkOdK93s03NhhYn4H0IH1ur/AgYodnZLSW5XhFv64mBz71Ecuy1wDfrVC5O+
	y5tT9+lVuBvC79vU+dGAhc3CDe2wm/LfrkrpxmP86MqNNoUl1UWJ+LhD9+DIoC5CGPauHXVl3Bv
	i1ULUXMuDrJBivLzo2qVEawWWz8uaK/QLElcmc5hP0NXZtfR+hjDp5SNOUHrT5xkQDebBG5VT1N
	7Cm7BlVGOI84AZ+dL/418Vrf02Tx6C1RKPAdZmd/ORX7LhqZ8LX/7imOp2r8+JC761plAx/iA4q
	Od994Y5q0c/TBexhyLH30QZMddIswYibss3Hzjjr73FIHWq/7LGY2MyCmcBNQ2Q7Hb/MYSZUtVg
	3AblZjOuM=
X-Google-Smtp-Source: AGHT+IG040q7cqWV71VuTHnX5coaOHS5RsTVRj/7BqmGOTBNKnaNhaPjcm0wBLEa4smz5wwn4wiKuQ==
X-Received: by 2002:a05:6512:4022:b0:592:f5a4:ece6 with SMTP id 2adb3069b0e04-592f5a4f458mr5888071e87.14.1761565510170;
        Mon, 27 Oct 2025 04:45:10 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5fc75sm2207808e87.59.2025.10.27.04.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:45:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:45:05 +0200
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
Message-ID: <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0aGnDoHzYmHLbrXY"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--0aGnDoHzYmHLbrXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some of the chargers for lithium-ion batteries use a trickle-charging as
a first charging phase for very empty batteries, to "wake-up" the battery.
Trickle-charging is a low current, constant current phase. After the
voltage of the very empty battery has reached an upper limit for
trickle charging, the pre-charge phase is started with a higher current.

Allow defining the upper limit for trickle charging voltage, after which
the charging should be changed to the pre-charging.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 Documentation/devicetree/bindings/power/supply/battery.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/=
Documentation/devicetree/bindings/power/supply/battery.yaml
index 491488e7b970..66bed24b3dee 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -66,6 +66,9 @@ properties:
   trickle-charge-current-microamp:
     description: current for trickle-charge phase
=20
+  tricklecharge-upper-limit-microvolt:
+    description: limit when to change to precharge from trickle charge
+
   precharge-current-microamp:
     description: current for pre-charge phase
=20
--=20
2.51.0


--0aGnDoHzYmHLbrXY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W0EACgkQeFA3/03a
ocVHlwf/WmMG+VHvvbW2L2DZtJpJaw0EfC6PYPUNs9yBLXDr+CfL0pRslVccxRKB
Jmbbt/J+CQ5jhDcPysdGvd4gvl2XqZlNW74w9zBpGGeoAXN3RepiLjwPu07tbi3q
KsMyf0UBeVGeZMD89Z0iyf+i9uAPjIbL7jsJ67Im5cg7H5xWctMEjPmQSAYOZI3n
HLbSqG7+HsWQN/9V3fqNVE4g3O7gipBY8F0ZZQzdZcU0EEimtnwhpyUz1VHnQVIQ
R9MRt7+1ynYb/Hr3y/3yUjLfNmwvD5atDA2znKphM6acJ/LgYTJA4sg2Nvco36Xw
A5pNMofVjUgxD7NYCslLgrj9UeRj+Q==
=OPBq
-----END PGP SIGNATURE-----

--0aGnDoHzYmHLbrXY--

