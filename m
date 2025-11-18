Return-Path: <linux-gpio+bounces-28706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FEC6BDAC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F4044E526F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE103101DB;
	Tue, 18 Nov 2025 22:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="O7Hdl9mB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4930F929
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504646; cv=none; b=jbJxUI76vNpKoGJO4trVqnvuQwxGKddy4hjERb4hJu8p6Ux3QuNwpj/jECkyzGnHj5jrtGpJiNyDKYTSnAeb9IEkLn5pzgl1S8GxwJ2Mq9S1xX3Uvn6xdQZI1oPMNm3lrERSD1tntx1gOWNypXj2/85ZV+lRwB+8qT3Y9ivYkfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504646; c=relaxed/simple;
	bh=svpK52mxw2R/BGvQibMTyc4I8dCzRhhBHywfqdbMC2M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S80xknGNxA5a3ZXBtg1lmv8Q5DVOVvm9beh1jAb/aeDM4RyPiRgVZ0gDYccIceIuQvNuHkoFGDI06mxykaakn4K2Wiw+7bBHvAWnHlY97VdDuZWaIAaz1dA2ZDd5TK/8bAiJWiMbDVBrIsMNSpzM2rFpZ3Ui+gA94udnY165ySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=O7Hdl9mB; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:110a:5400:17f3:a8ff:d314:780e] (2a02-1812-110a-5400-17f3-a8ff-d314-780e.ip6.access.telenet.be [IPv6:2a02:1812:110a:5400:17f3:a8ff:d314:780e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 90C996A158E;
	Tue, 18 Nov 2025 23:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763504641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svpK52mxw2R/BGvQibMTyc4I8dCzRhhBHywfqdbMC2M=;
	b=O7Hdl9mBz/1QBSmYAGWqwwsxVsMNMmczdNYv77u01hwqGKSWy3QBCPpg5mSBT90M8194xH
	R7BiLtAirzVOio42wiV+iEc7aKWRZje50b7LOVRNwhVLbDvIQHng193c4nK/gJwUPtxgGP
	IvrERB2g/+VYC7f3cdOzvnNlu7XXHWphjTUbHJNNB6wTNWzTkSgFVCyLs9cdecx/sewLNN
	wQFDf62Ba/OF1KIl8kU/dXU0A74N0WYQ/wffjpE+YKUPrH6NerooLxLoDwVAYhEfIGfP6O
	wFK1CbV6ozekQgOg7R3mGd88dEW+UOW1IdoSfn8+mNd8vMohE4i8iVsSHL+U5A==
Message-ID: <0aadc274251ac1627c4b10e96cdc21bbbbe1bb57.camel@svanheule.net>
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
Date: Tue, 18 Nov 2025 23:24:01 +0100
In-Reply-To: <202511190436.9oQLbI8A-lkp@intel.com>
References: <20251117215138.4353-5-sander@svanheule.net>
	 <202511190436.9oQLbI8A-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-19 at 05:19 +0800, kernel test robot wrote:
> Hi Sander,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on lee-mfd/for-mfd-next]
> [also build test ERROR on lee-mfd/for-mfd-fixes lee-leds/for-leds-next li=
nusw-
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
> config: nios2-allmodconfig
> (https://download.01.org/0day-ci/archive/20251119/202511190436.9oQLbI8A-l=
kp@intel.com/co
> nfig)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20251119/202511190436.9oQLbI8A-l=
kp@intel.com/re
> produce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202511190436.9oQLbI8A-lkp=
@intel.com/
>=20
> All error/warnings (new ones prefixed by >>):
>=20
> > > drivers/pinctrl/pinctrl-rtl8231.c:28:27: error: expected identifier o=
r '(' before
> > > ':' token
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28 | enum rtl8231_pin_function : uintptr_t=
 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^

This isn't supported yet pre-C23 and before GCC 13. I will look to ensure t=
he a properly
sized integer is stored into the pinfunction's data pointer.

Best,
Sander

