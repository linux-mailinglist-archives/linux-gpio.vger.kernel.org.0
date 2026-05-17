Return-Path: <linux-gpio+bounces-36998-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AaDAPkSCmqkwgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36998-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 21:11:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE425637A7
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 21:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5D29300D696
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 19:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FF12F8EBF;
	Sun, 17 May 2026 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+14Dy0u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94891C84BC;
	Sun, 17 May 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779045094; cv=none; b=auOGxTwLiDamdpcFcp3BDSzkx0XmLGFwbB0wVkn7MYFlGDS3sJU3M5NXAgWlKwXP7+JmRb5zfhWvTOSZJ1GQGxeSi2XJlz+9vHgGZD6cCp4Xh3PtoVgy7W7u3dEsFA0pGs0e2T9GHbbiwxFw2ZU4L2+AhS8EMeaMRCEMufGENi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779045094; c=relaxed/simple;
	bh=2DV3FjQRAgdpfnPiQwThzIaOissXREDczzOFjjXSuf0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PHUbxUoVepArtG1XxXGuIfkPMDLcRrwHTgDpfiF7ovjju8syCd/1iaUaiGmTifMpKc5Hv1JpCqsj3w0EYFpOfqV0KDtyFd15BP9fERHsvI1Xo6UnDKmJy49zpuuWSF64SxOE0SQqEbr/w5BVd/aXnQCMHJ4Mp4Fry9P+oUjnapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+14Dy0u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4D4C2BCB0;
	Sun, 17 May 2026 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779045094;
	bh=2DV3FjQRAgdpfnPiQwThzIaOissXREDczzOFjjXSuf0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=t+14Dy0uZopMfsbcOHeEBX6ll2mgnxKImhtuNQw69DjjOyNclBAxzCVWqjL3S7TLj
	 rh/6ioVIROIRFtMHuo8TX9quuyjHHURMYv4HquGD3PMG9mK1b1fLRFiSwiymiwZn68
	 rn1W/VnmcXNmPNi3dXxmIBC2v+vxBjaZ91ppLzgeA5Pn3JrOIXqry3/oRq5QWgJhqA
	 3YcUFIMun/gn5hzbOIXoyi1t1QTpdWdiKHB9EmUEwoGhM8ALwQ1RjDOx2UW7zvPypd
	 +7zX9s2vLIaDG/Krc8mhY0f7ArD6Btlhi3WV42SALJI5ook46Ep/NTlz0RWBdgIzkH
	 0fIav09UP2qCA==
Message-ID: <7b5ba8321b530cca24ee2fe988f5d025b6c3f518.camel@kernel.org>
Subject: Re: [PATCH] [v4] wiznet: convert to GPIO descriptors
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Marco
 Crivellari	 <marco.crivellari@suse.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Sun, 17 May 2026 21:11:27 +0200
In-Reply-To: <bcf1d4a1-e99b-4ce2-8849-8cb1d10aa3f2@lunn.ch>
References: <20260427142924.2702598-1-arnd@kernel.org>
	 <bcf1d4a1-e99b-4ce2-8849-8cb1d10aa3f2@lunn.ch>
Autocrypt: addr=nsaenz@kernel.org; prefer-encrypt=mutual;
 keydata=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
 K0vsFJA6LwvvMJooL7dQzwIU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9DE425637A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36998-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsaenz@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 2026-04-27 at 16:48 +0200, Andrew Lunn wrote:
> On Mon, Apr 27, 2026 at 04:28:29PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The w5100/w5300 drivers only support probing with old platform data in
> > MMIO mode, or probing with DT in SPI mode. There are no users of this
> > platform data in tree, and from the git history it appears that the onl=
y
> > users of MMIO mode were on the (since removed) blackfin architecture.
>=20
> A quick grep does not find any .dts files referencing the compatible.
>=20
> > It would probably be possible to just remove the MMIO mode driver
> > completely, but it seems fine otherwise, and fixing it to use the moder=
n
> > interface seems easy enough.
>=20
> Last real development work on this driver was:
>=20
> Author: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Date:   Wed Jun 12 14:25:25 2019 +0200
>=20
>     net: ethernet: wiznet: w5X00 add device tree support
>    =20
>     The w5X00 chip provides an SPI to Ethernet inteface. This patch allow=
s
>     platform devices to be defined through the device tree.
>=20
> Nicolas, are you still using it?

Hi Andrew, no I'm not.

Thanks,
Nicolas

