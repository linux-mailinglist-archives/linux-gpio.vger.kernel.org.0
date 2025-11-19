Return-Path: <linux-gpio+bounces-28839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14BC70B8E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 19:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id EAC4628D35
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C44D33DED0;
	Wed, 19 Nov 2025 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="cx27ivo3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCB34F485
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763578658; cv=none; b=gTV4+Tkv2PJoOcXJNkOuFdCgtKuy2ebwgaeCKEONF9k+QZNFIOgnQ09uNKVAwxluO7Aywa8pnGaqX4c+3NrGefPckV3pocIbiV/BXz+7mTpTIZPFgvlOSVLeHYI8we+U4Xk7B/K5kFQKhNK1JOoszmpXSRPev7H5ZXIPr69HUTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763578658; c=relaxed/simple;
	bh=DrUMQQIRs8itbSC+3mDznjL9OAtA0LU7Cru6b4x2oX0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=omqyDb9U2gNFjTMTM1Xlurf0K6eBfDAC9LAei/4YjkOYZpgUFwG9fbsfs4/Zi/Uf4kl4pAn7qlDKf9dYWp5e5tsozfTYtfPwfom3FfzPvOfIXiHsIa1B3DZiO9Wk/RJg51yjrqzHk35gn3yh8OnD2UBvuKlFRLgivAY+ksWW/JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=cx27ivo3; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:26cd:b932:ba51:717b] (2a02-1812-162c-8f00-26cd-b932-ba51-717b.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:26cd:b932:ba51:717b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 850926A1E37;
	Wed, 19 Nov 2025 19:57:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763578652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrUMQQIRs8itbSC+3mDznjL9OAtA0LU7Cru6b4x2oX0=;
	b=cx27ivo3T4K8dTrWkdWleUVPkkmWP6Q1UXAsd2PDbaSa2ZswdXLKe9vWQAXfaHC6AdRlOy
	EfoyZz0GGAFwFC6mnyv2W4dKmiTjGuewyafWeab+x9SPR3pu4V43uIGT1edQVnqRzXn4eY
	kur61/YRKh01Ua1QZ36DRCLxbeyJfccfDmwhmWr/EXQuUneibH+e8TargiGJQgIOVqgpIw
	+cpV5F34XTwBCwqt+7cbcFtWU46Ip7QMU9Q1jAf2kULGCxCOM3Jj0Rz17Rswc91Xtf5GML
	j1A0ezogClQB3OlAefD7NYKCLjnIrYW2c5kkTWGlILexmC+7BXI5amYWVCG+tg==
Message-ID: <1e90814b86355384010966f559d185a5b6fea99d.camel@svanheule.net>
Subject: Re: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO support
From: Sander Vanheule <sander@svanheule.net>
To: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek	 <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij	 <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 19 Nov 2025 19:57:25 +0100
In-Reply-To: <202511191158.bVKUDrKa-lkp@intel.com>
References: <20251117215138.4353-5-sander@svanheule.net>
	 <202511191158.bVKUDrKa-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-19 at 12:19 +0800, kernel test robot wrote:
> Hi Sander,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on lee-mfd/for-mfd-next]
> [also build test WARNING on lee-mfd/for-mfd-fixes lee-leds/for-leds-next =
linusw-
> pinctrl/devel linusw-pinctrl/for-next linus/master v6.18-rc6 next-2025111=
8]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/dt-binding=
s-leds-Binding-for-RTL8231-scan-matrix/20251118-055707
> base:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd=
.git=C2=A0for-mfd-next
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20251117215138.43=
53-5-sander%40svanheule.net
> patch subject: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO s=
upport
> config: i386-randconfig-063-20251119
> (https://download.01.org/0day-ci/archive/20251119/202511191158.bVKUDrKa-l=
kp@intel.com/co
> nfig)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20251119/202511191158.bVKUDrKa-l=
kp@intel.com/re
> produce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202511191158.bVKUDrKa-lkp=
@intel.com/
>=20
> sparse warnings: (new ones prefixed by >>)
> > > drivers/pinctrl/pinctrl-rtl8231.c:28:27: sparse: sparse: missing iden=
tifier in
> > > declaration
> =C2=A0=C2=A0 drivers/pinctrl/pinctrl-rtl8231.c:28:27: sparse: sparse: Exp=
ected ; at the end of
> type declaration
> =C2=A0=C2=A0 drivers/pinctrl/pinctrl-rtl8231.c:28:27: sparse: sparse: got=
 :
> > > drivers/pinctrl/pinctrl-rtl8231.c:52:44: sparse: sparse: invalid bitf=
ield specifier
> > > for type incomplete type enum rtl8231_pin_function.


sparse doesn't seem to understand the enum type specifier either. Fixed by =
instead casting
rtl8231_pin_function where a uintptr_t is required.

Best,
Sander

