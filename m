Return-Path: <linux-gpio+bounces-7877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 722559242BF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 17:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F78B2899D7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 15:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC951BBBD4;
	Tue,  2 Jul 2024 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nbWt8gbR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B007D266;
	Tue,  2 Jul 2024 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935182; cv=none; b=jmUS/NB4H0JBJbdhdhF4l4oHLPasQ1RkWSzECYKqBDV5K7Xk9s69za6z0ItS5wlQvXgkmz5CtWIz3CMpUolxeRUFTq2eM2IXhknyhtIO0whGw7iuQ0vAXIWFtxZWk7vMpftopr8e+MeI5k2XwXRdxlo/avpPiZWhN41bQIM0T6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935182; c=relaxed/simple;
	bh=0ibR360hPUqQ7hgWtx3NG9BBOAI0tL4aSNSl8jIXVrg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=kVc2c+vkIgs0z765dO72ni1C51shC4MP0XUwaVxjOK9IXpHBQC+pD7B5mrpfU82Hel5o7uVJIyiDSTi/BBgcW71SWZ6KBZu+AOOo5Tj9WtJQRJl7+c8x2FbqStfjfCHLiysIqDTTc0nf3TPIwAR8YL0NwuxMykNtEqSScIqtqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nbWt8gbR; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16644FF805;
	Tue,  2 Jul 2024 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719935172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXc+8fEuYxBnCX11OGCVRsvxNL2Mw6mHKpkE9BRDssM=;
	b=nbWt8gbREQMCfAcf84382i0POulvVG2BhOSx/zeMZfMFN87iTQxOcuZYtMtDiGLGFZhOVk
	Xxp8eT4x07nnhud4srCWWMZ/nd2xNVJ8YVAL+VkRkKYJQQmXj51T1ipbRMaOSau/stqZ8P
	pEE6BFxwH601uiBtLS/vc/6/Glie8cYwHYKnwplFxvI9Qat8STAnKtj0LIjN4d+0TZbeK6
	WJDIrxwin1CKcBt32szaooHJeIX+aKpmRwwT9HNFbgJFPnxKjfKC5PE9K2gOvWJHQYxuWA
	MPVf2DnKhBJvBu18vfYJerLtZFq8azVk8n3oBETGRLpyVleNueaSzF8gta7nFA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jul 2024 17:46:11 +0200
Message-Id: <D2F64U1H2P8J.16H1SVRMYFROM@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 2/2] pinctrl: eyeq5: add platform driver
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "kernel test robot" <lkp@intel.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240628-mbly-pinctrl-v1-2-c878192d6b0a@bootlin.com>
 <202407020641.JqMWvOOu-lkp@intel.com>
In-Reply-To: <202407020641.JqMWvOOu-lkp@intel.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Jul 2, 2024 at 12:49 AM CEST, kernel test robot wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on f2661062f16b2de5d7b6a5c42a9a5c96326b8454]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Th-o-Lebrun/Revert=
-dt-bindings-pinctrl-mobileye-eyeq5-pinctrl-add-bindings/20240630-070720
> base:   f2661062f16b2de5d7b6a5c42a9a5c96326b8454
> patch link:    https://lore.kernel.org/r/20240628-mbly-pinctrl-v1-2-c8781=
92d6b0a%40bootlin.com
> patch subject: [PATCH 2/2] pinctrl: eyeq5: add platform driver
> config: m68k-randconfig-r131-20240701
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce:
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407020641.JqMWvOOu-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    m68k-linux-ld: drivers/pinctrl/pinctrl-eyeq5.o: in function `pinconf_g=
eneric_dt_node_to_map_pin':
> >> pinctrl-eyeq5.c:(.text+0xe0): undefined reference to `pinconf_generic_=
dt_node_to_map'

Argh yes, pinconf_generic_dt_node_to_map() requires CONFIG_OF. I'll add
that to the Kconfig entry in the next revision, as a "depends on OF"
similar to other pinctrl driver config options.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


