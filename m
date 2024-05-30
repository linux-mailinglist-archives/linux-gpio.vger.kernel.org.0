Return-Path: <linux-gpio+bounces-6894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81188D428A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 02:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3199CB254AE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 00:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5C3C14F;
	Thu, 30 May 2024 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="T6bqyRov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD3E556;
	Thu, 30 May 2024 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030355; cv=none; b=XV18jWlU62FZdv5kvx51T3wfpwxuAq3bVcKo76PyILXfyxf/Fv8wt6mIpXrNzoyqAcRi6T/evMaNYQqV7zHF7iCYx4y56GMxOliM9BfUR1NpvAlILGTaOKAKHEtqb6qpDF7UGtSBDaQjF/D52FPv7Gg3DAdy9xqUje9652lMU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030355; c=relaxed/simple;
	bh=n01f9haUhpidbjvmciLoZrlzyDDS830l30cbA3EuZJg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VBlrvN8PvoRN/8O6CcGkp9pLcnWFTYLzOtgeObm4Udlq4YTMnWl6McNzh2+pVbi4H+lHgo2Q+DA3zuIhK85wYcT1rz7Zlf/0lEpzAP7bmmVcoWhbRREuCYD1LEBie35SzwSFBRNTxFqVRPvVNkn87+ireaQpiw8F7fK+1zliFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=T6bqyRov; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3384E2012A;
	Thu, 30 May 2024 08:52:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030351;
	bh=n01f9haUhpidbjvmciLoZrlzyDDS830l30cbA3EuZJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T6bqyRov8LcXQkQXJ0uCFoJfmBQzNsyePRnJ2UWV6Ud+Eni2Dafr+3yPFhupAE9U0
	 DkvbDTKacaBVLodFczqds0yNp0G6knPS6eh8uFxoZq6iNpUV2C3BAL6PkL/0dDXRch
	 nIvyvB5+lUQVl8M6qFWE2mgfCqDVNhIyQSKnavemtntuFQjj1H4mZ+HMJD0Ud02fk7
	 mRN+g5pXbt8xhk24c7eFtUsdb8D5MewXlilLP2TkZFVOzHS50smi1rRcKA9XyuQw7m
	 vTQkzvvx7Kxwzb9Dy8ZlQeY++BMcbhH8Qmbi3aXjdIGcMLm01goRd8Zx/R+JwkjdGA
	 tk7vFxxUuJPEw==
Message-ID: <032b986258c92b6d400b2514cc018b8622ecf355.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/4] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 30 May 2024 10:22:29 +0930
In-Reply-To: <e40041ef-fb1e-4348-97b5-64487859a7f9@kernel.org>
References: 
	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-3-91c42976833b@codeconstruct.com.au>
	 <e40041ef-fb1e-4348-97b5-64487859a7f9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 09:28 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> > ```
> > /home/andrew/src/kernel.org/linux/build.aspeed_g5/arch/arm/boot/dts/asp=
eed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#interrupt-cells' does not mat=
ch any of the regexes: 'pinctrl-[0-9]+'
>=20
> Please trim the log from unnecessary path components.

Ack.

