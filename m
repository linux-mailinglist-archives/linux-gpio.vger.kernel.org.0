Return-Path: <linux-gpio+bounces-23459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3CB09E75
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B25E3B0CD7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77013293C72;
	Fri, 18 Jul 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="zUn3DGRL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24E042A82;
	Fri, 18 Jul 2025 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828977; cv=none; b=TJNZBVF9rdJuIL3RONOUdRWquv5e76bgBvlV1mV3+KAifOOODLZtMTs7hZxF7DtGN7C2USLnU2X6RJ1ef5jU9ixQflYUhXfmR10zecXVk0yNsCF7rrM5Wr61io+Gn08UEklBRapLUmMvow8diRBlX9LRO5fPiF9/j3p2lj2ODZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828977; c=relaxed/simple;
	bh=C+k8XDqV1NFilwD/fFmfClM2h5itOLPf8n+geMf0sMY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AfxtTgt8CkFZCuG1o+MATLX4otucIKV9PI5cgSuEcL9QUcqF2WWAxa2bF4BSlweAVLzTyosbN+dk27wv7ao9GzcAvlIAKhWgQ3ikHCIBtoNV5PFZsTmrVcgwrSBz9jzEAaPrlxt5zrG7z3Yvpr5AWuu3mh4VuKXG3mYrAIOZNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=zUn3DGRL; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=isKHZnlk51GPsLmLgEvCCDlYZVrxDlDNVIsM5Dc1NOc=; b=zUn3DGRLNQWsAnNn7gC7zncCGg
	vDt8ltuqqr4WHq+ur3zpUd6d1Y08QNDWZfjEtRdbRPiuOyqd5Jl717Lx1BbXx3MLAXeeJNs7M2Tbc
	1C7RaLVWBWOzRnaPuB+IIc+fr5T29mTbvicCczzWuW2Pe+tmVV2tWqenlbK3Z85QSXE5bXsIAroXS
	ap4EVuN3KWaabMHT3OK5fCuJRY9P8YgQ70ttXE/p8jwFYe1s96Jz078SrhQAv1dt03Nm0D8ee9lpE
	mCFzRY0cebe2bvVz/6Ka+P2KKmE1x+kv9cV5ZgfCsMyEFcO2xyULybe2xMs4a2L+j8k8HhetvzhIB
	Ybk1TdnQ==;
Date: Fri, 18 Jul 2025 10:11:47 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema
Message-ID: <20250718101147.4906bd60@akair>
In-Reply-To: <20250714202829.3011298-1-robh@kernel.org>
References: <20250714202829.3011298-1-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 14 Jul 2025 15:28:28 -0500
schrieb "Rob Herring (Arm)" <robh@kernel.org>:

> Convert the TI TWL4030 PMIC GPIO binding to DT schema format. The number
> of #interrupt-cells was wrong compared to what is in use. Correct it to
> be 1.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for taking care of it. Now it is in, but anyway:

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

