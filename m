Return-Path: <linux-gpio+bounces-14674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A967A09705
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 17:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635C43A70AD
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 16:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CCF212FA4;
	Fri, 10 Jan 2025 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="dXpCr0TS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EEC212D81
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525879; cv=none; b=r0JIXLhIy8Y8h5EUttPT3nymqrQ3SFsOQ3eyXGhQkY2WwgfV0f1kbyx5lilhKPyGh7J2kYdXU0iYekOWIaSxCNDBKJrHYGGzkWJMKYaIwy7xpVPuIs1jEXqDsl+yQIvSdY+GYJr2/e6PyBUpnxzAH7RyHKXEu/SLm6eqCFrMn+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525879; c=relaxed/simple;
	bh=Zt0oYLRy2gA4qiDcwUVvzYtQ2ZUaL8kWI5E0eYhdc4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4zi03WbVW+U8RGG0zU+CHFyNmHYM79DMKVrSpCxroDilfrwOnfy0hmeEwk9u9kAWrifN2dBa2m40WrGCzZGySTnnPcLJDlkAGdBs+3Xavrmy/Y0gfBvuglIY/IQp4D9hJf5gGHI8LuCs8QD8SoC/IAT+PzAL8ueij3CowSH6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=dXpCr0TS; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C061D240101
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 17:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736525875; bh=Zt0oYLRy2gA4qiDcwUVvzYtQ2ZUaL8kWI5E0eYhdc4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=dXpCr0TSMrpauHHyLRc7Ozs7ue+oNx1mkGw/2Tpf/SmH3KCdpaNAfiXD027uUbyXP
	 bE483YmAG0mdf8F8q1bJ+U31wpDfxyYm0fsPBkDoaYkRHFCkLyCwStReVGM1cjQXg1
	 wKeqfIZB0MJBFVNazNwwNiCajnW180VnLq4rYQ/lyIT2dTrBCq8JCDo/b9bI25kMbj
	 vWugoJofoEL3hz4eUbeEqzVNbpn5qOnQ2KpeiDtgfTM1Jif5MaxP/rjod1d4E3jHBH
	 2SOCBmeyqvIvw9XAXeL/LwRHQThLXnpi4WsdvJo2Ei3idiB2zw8g7Jk0gHLQyIg/sc
	 SqJv06Xf2dN5w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YV6JJ6V20z6tw2;
	Fri, 10 Jan 2025 17:17:52 +0100 (CET)
Date: Fri, 10 Jan 2025 16:17:52 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/19] powerpc: dts: mpc8315e: Add labels to peripherals
Message-ID: <Z4FIMM3383gXQ2PH@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-4-86f78ba2a7af@posteo.net>
 <9a517e08-8ed0-40df-940d-10c57c59f2d0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a517e08-8ed0-40df-940d-10c57c59f2d0@kernel.org>

On Fri, Jan 10, 2025 at 04:19:56PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Labels can be used in board-specific devicetrees to refer to nodes more
> > conveniently.
> > 
> > mpc8315erdb.dtb remains identical after this patch.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> 
> Adding labels just to add labels is usually pointless. Instead add
> labels and their user in the same commit - that's the expected style
> with DTS.

Alright, will do.


Thanks,
 jn

