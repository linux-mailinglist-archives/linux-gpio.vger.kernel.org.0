Return-Path: <linux-gpio+bounces-10936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D399262D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BADA21F22EC8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD9F17D378;
	Mon,  7 Oct 2024 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEluj1GM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B717B4E9;
	Mon,  7 Oct 2024 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286820; cv=none; b=lRoIJPFq/K5LvlqYRfObxD++g8Zfo/zBjZtYoC07wXQgjXdSI49S0b/P5P7T/j3fKcwFZAud1snn6+6Vz5WQ7TcKS4e5yJv8nsBgu+KfD7YA8Y2pRGN68RJf5NV3/zXzGb8zcdvlTPN6HZ1EFBNaPCk5PpgS/tKxUlpQGKSAv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286820; c=relaxed/simple;
	bh=zdg8YnhjZ7nxf6XtOzbEgWYVwPDaiwFftbgSTx9Rplk=;
	h=Content-Type:Date:Message-Id:From:To:Subject:Cc:References:
	 In-Reply-To; b=KqigZHWItqxdWbeD604TcfsAPMvbVFbJRl9fSCzWRgaDDrg3hljYDGE8jjz2ohQHWPivYLAGL2nCnpqDT/HogO/ojllZ08Icb1oUmoTUUdXBISoW401vc30nS7RAOjb6qF4/OeXmMK/Xzw7aGS3/Xk5atMXMzM9RAwbrXdRM/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEluj1GM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D17C4CEC6;
	Mon,  7 Oct 2024 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728286818;
	bh=zdg8YnhjZ7nxf6XtOzbEgWYVwPDaiwFftbgSTx9Rplk=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=AEluj1GMYTpHfd6eiGMDIdX1oN6yA1qiq+yjVfi3ZLVy8omYCI9rPXODXNuJ1ibV+
	 dGLLzLxoZbWY7Qp0BKhNLMRfwI9piV3olQQnmqxeIylbUiWsEuZ7pVoi4EfFDVqKnP
	 XQLHnUy3f+1LTRypj03lZOT6+osMpujrVXSGptJ2YjwTw38IjRI3L9bzJpq3OgF2kK
	 1t0cWS1sL6RexY6I+t5Bba4VVQ0RA+KP72qL1cY24cOf7pRpIPvv3xkgNexveGdNSX
	 7EOZLpYNPeycQtxgILj2D300Q8tdW0o3VmoCldSoVDEjbqmnSuOYpY2bEs8OInNo4i
	 N0A1CW+GAJaSA==
Content-Type: multipart/signed;
 boundary=cd38d601192290cd67178060d3d7a847098ffd7ba9d6a04e2a3883a4cb67;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 07 Oct 2024 09:40:14 +0200
Message-Id: <D4PEJLVLCWU5.3288NQC9F31D7@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Heiko Thiery" <heiko.thiery@gmail.com>, "Vaibhaav Ram T . L"
 <vaibhaavram.tl@microchip.com>, "Kumaravel Thiagarajan"
 <kumaravel.thiagarajan@microchip.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Tharun Kumar P"
 <tharunkumar.pasumarthi@microchip.com>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] misc: microchip: pci1xxxx: add support for
 NVMEM_DEVID_AUTO for OTP device
Cc: <stable@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20241007071120.9522-1-heiko.thiery@gmail.com>
 <20241007071120.9522-2-heiko.thiery@gmail.com>
In-Reply-To: <20241007071120.9522-2-heiko.thiery@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--cd38d601192290cd67178060d3d7a847098ffd7ba9d6a04e2a3883a4cb67
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Oct 7, 2024 at 9:11 AM CEST, Heiko Thiery wrote:
> By using NVMEM_DEVID_AUTO we support more than 1 device and
> automatically enumerate.
>
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and =
write into PCI1XXXX OTP via NVMEM sysfs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--cd38d601192290cd67178060d3d7a847098ffd7ba9d6a04e2a3883a4cb67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZwOQXxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ixRwGAvOasOnSALNMDJcdDGoUChpXj2fvSrl9+
Qu8UGt9J0MINViD0F6qJskCgeNDwe1TMAX9+LY5+6vSenGe+g9p/p/A9DGiFuBPp
0kw/btEieV5JQGAjOFbhb7pDc4HvEwhbk5E=
=6c4E
-----END PGP SIGNATURE-----

--cd38d601192290cd67178060d3d7a847098ffd7ba9d6a04e2a3883a4cb67--

