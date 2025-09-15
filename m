Return-Path: <linux-gpio+bounces-26175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED08B57E50
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 16:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF833A6AC9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ADE30CD9B;
	Mon, 15 Sep 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqEXiorW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434D20CCCA;
	Mon, 15 Sep 2025 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944916; cv=none; b=tTXC30niyup5vxndiR3D9gJYOGjE/m3j+f7bkla+Ae1XWLyN9CcPMytFhPCcXm5cfWrgWOWt4WWs7ToZ7VlkeHenFuuSHhd/cqZqAhNadvC4F78skynX5Vlb/eu7BFMdZZ3nF+rArxWqmXRHUfZaXaW0yjqj7WWcJ21nc45sxjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944916; c=relaxed/simple;
	bh=KXhpX+I9cqFa8/Brd3t1pN6QW8/ieopeH5GV9QGl6+c=;
	h=Content-Type:Date:Message-Id:From:To:Subject:Cc:References:
	 In-Reply-To; b=ZSZ6Q5KLpBC4fTrmXLQf9OJ3PDvz+RzJXKG5t9Jia06zFPoNVKD662n5mJ9ooL+z2Qlyow2qkJYjslxhr4aLvleGkeUqL3QfiiFUS0R4aLwfa3V1MF4qLRyCkP/Xic0LdPp2M3Vygi81EMmbh0Zh1F+zX+j2gmrpOqlRhbN/XsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqEXiorW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F789C4CEF7;
	Mon, 15 Sep 2025 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944915;
	bh=KXhpX+I9cqFa8/Brd3t1pN6QW8/ieopeH5GV9QGl6+c=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=YqEXiorWXIlgYi6mGicFLw+n3pYi5983wdej1RWRLNNoTKmoRo7BL/knJC7s2srsx
	 ividi6kdGvcz7Jh/TqWOQ++BySawnRjLPViUhzhkwA2+fEFk47sLu9+d8MboSx4L6w
	 BTk/ynlY1a1GLKBfCOLzTZPlQ2RMv9Z0JW/nzlMy+KR2KBOSsqANDu+3sZmGlETGdz
	 pCV5+lhgf5neMGpPFre+on+VDdUQuUQ4ydsR28CC50O6UhQ1+P0/hHNtyW+paZLyq+
	 Dn9XGF1mD2HRH/lVQmgig8WiGl2LjZUUC4o9Zr27ZWDOf8dr1/vGw1UbOcGsnDc1M0
	 TFfBLUFg7ytjQ==
Content-Type: multipart/signed;
 boundary=7d5ad4a4091b191b6d2051c27ab850068be519bdfceb7bbf813ae88a9b68;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 15 Sep 2025 16:01:50 +0200
Message-Id: <DCTFGN6IH4MM.2UXRHE7M6O9TS@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v2 4/9] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn
 Guo" <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Frank Li" <Frank.Li@nxp.com>
X-Mailer: aerc 0.16.0
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-5-ioana.ciornei@nxp.com>
 <DCTDUJO0PS8B.1LD03WTEMNRVP@kernel.org>
 <4awrlgj33bg33gg4ianqk5ypchrygppkqyyojfliznitbtzu5h@xsgnk25syvqq>
In-Reply-To: <4awrlgj33bg33gg4ianqk5ypchrygppkqyyojfliznitbtzu5h@xsgnk25syvqq>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--7d5ad4a4091b191b6d2051c27ab850068be519bdfceb7bbf813ae88a9b68
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Ioana,

> So you are suggesting gpio-regmap to allocate the bitmap using
> devm_bitmap_alloc() and base its size on config->ngpio, then copy into
> it the bitmap passed by the caller, right?  Yes, that does seem more
> error proof in terms of memory handling. Will change it in the next
> version.

Yes exactly.

-michael

--7d5ad4a4091b191b6d2051c27ab850068be519bdfceb7bbf813ae88a9b68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaMgcTxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i5SwGAmEBY61tAUoDus3BsCNkojKBx5G5zhyBA
wWcea5fgeTWEeDKURrAxtI+kko4Vpkw7AX4vL1ZdiV0IbxzW7vL1yu62fJcxqs1R
jmys1Q1+92kQ9kEedU4DsMD2klPQlJGPUE8=
=UCzZ
-----END PGP SIGNATURE-----

--7d5ad4a4091b191b6d2051c27ab850068be519bdfceb7bbf813ae88a9b68--

