Return-Path: <linux-gpio+bounces-23132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D040B0150E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D814D7B37DD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 07:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7981F582E;
	Fri, 11 Jul 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K577jTrm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363D1F0E24;
	Fri, 11 Jul 2025 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219862; cv=none; b=qyTzjjYjdgrhOahVUyguQ3gkI1ml0cOtkNEhE61Bsr34klXAPTG3HJGqxzpnQ65Hdb3w/JJ9npmyf+bO2EaomHqaRMvCzVVioH/Y3gqXSf7Ld8/FDAMpSVj3mgEGpkblhWsagvdBNod5FKv0a674mM/pAbfkV7sjkso8f9XNFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219862; c=relaxed/simple;
	bh=mJ8f0o4lu7/7z2kky8W5rnqHSfBhvDECmO3dfujPoko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDnesCb6FQvctXkL8M3KmbOMuR8ehmPKsWWB3aDK8bEk+CXqvRZp/N1qJ1DYhyRQbchlS0a4v4QfqUMXPUCUq5jogWJHbq8blsoFFa20uYHOC5Uo77vNoGLrnK58qK0YdXcLV5hMYTrKFV1HY0hIGZa2sQ0aSsobWdCZAVAGlHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K577jTrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DB7C4CEED;
	Fri, 11 Jul 2025 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219861;
	bh=mJ8f0o4lu7/7z2kky8W5rnqHSfBhvDECmO3dfujPoko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K577jTrmkOxDdg3Tnq0u8ziyEvFSwFZMaHhSd1j+ngRE/JDj6+K15g4c+5VMx56Bx
	 WS1jufZqmt3z94c/LrQuyxIMjzGE55ioQl+ofJPsLPOObRIa8/VipCbc42GRG2pKfK
	 cC78IdNJSvS3XAWWxC6FTQjycJomYzCFcLBzGqkXJY7YFQCSnlRXneWsxdWq4IpYwr
	 wFdEEJgTI35efM+LTgFw0GfmWo3sgg+14J1FztUcTki6KCm4KrohC6ivf255CNTFw6
	 Q960jQGwIaKXKjCRZTuB1AumE5T33HX7fFA3KwmIxWVc1AnoV6JM8pN7D2XhYNkuHR
	 FfOUwBedIQA6g==
Date: Fri, 11 Jul 2025 09:44:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 06/12] dt-bindings: pinctrl: deprecate SIUL2 pinctrl
 bindings
Message-ID: <20250711-inquisitive-dainty-foxhound-6feeb4@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>

On Thu, Jul 10, 2025 at 05:20:29PM +0300, Andrei Stefanescu wrote:
> The existing SIUL2 pinctrl bindings don't correctly describe the
> hardware. The SIUL2 module also offers GPIO control and exposes some
> registers which contain information about the SoC. Adding drivers for
> these functionalities would result in incorrect bindings with a lot of
> carved out regions for registers. For more details see the discussions
> on the community [1] and [2].
> 
> The existing SIUL2 pinctrl dt-bindings will be deprecated. The new SIUL2
> MFD dt-bindings are to be used from now on.
> 
> [1] -
> https://lore.kernel.org/linux-gpio/20241003-overall-unblended-7139b17eae23@spud/
> [2] -
> https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/

After fast glance I see only nvmem is outside and missing in these
bindings. I don't see a problem nvmem being a separate device node, so I
don't see justification for dropping old bindings.

Anyway, bring the full raltionale here - describe the memory layout
proving that you cannot add nvmem and GPIO in your system without
breaking ABI or without making this binding unreadable.

Best regards,
Krzysztof


