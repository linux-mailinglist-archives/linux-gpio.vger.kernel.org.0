Return-Path: <linux-gpio+bounces-14931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46444A16424
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jan 2025 23:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6AC71884F88
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jan 2025 22:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD5F1DFD84;
	Sun, 19 Jan 2025 22:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Vw2AklHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3F1534F7
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jan 2025 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324243; cv=none; b=Y9PqaB5kaUgO+c8NxHTpRX0qYcTMsx17oLnth7ZSLn8buBIkxog862DOW5RJYTm1oFgiIJiu6zGPN2BQFHlxi0kxQ1/LredkCWQvYmzmWHV2qlEvXDzmFU7nv/JnJpTtIt1+dnBxnAt2/d6YUNMLD8imsQUvRhiY5EN7tkvAFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324243; c=relaxed/simple;
	bh=ArPJ+jv3dFD/o+3NmegfZMC45T4/VEy47JZvGQTyNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC2bI8HpsnIhyO4eyMPSk9OqKeLK/kF9ZZo9mgKnijtP0fXnHXJSxF2YO+SxlwZDXqdCjbyeSm/sacF+LYPqrk6Avb0rPsvWqS8Jmi14pDRTn08Txk1NjI50atFCciu1Tf4WLAuNEk/5gndDHCtdk76K7mVY7gGnBVc6DUfodJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Vw2AklHm; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 319EC240027
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jan 2025 23:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1737324234; bh=ArPJ+jv3dFD/o+3NmegfZMC45T4/VEy47JZvGQTyNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Vw2AklHmzuiw0cZp6msIUW85tSIkfQpdkv3RCpESXOxdgiXPbBkN/XtWfdLqfWIQQ
	 ot8Hqx64BI6oHDarCL/5/dncvmpAkuIbh9k04DHIwMS8nJ/exnOXZkxKwe9RhF6t4C
	 PuPlE1le5TWKyDWavOMpKJ/5BnKzRc5QbujifhnRJad27b2zUoMMUmUtxCDuJA25l8
	 //4fc4D0+r2TH1+l3pkLbErlg1xl1lXVkJCqZo4SyPpbvPkjoT9qTzfB73rw1EYWSx
	 KVVNCmUz3lrDhwUIAiFp6AOIhm8sVacSMbqDLIz1AL+ZqEO11uLUIzb4oUU27+Tkli
	 UJ6qkp21emciQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YbnYL43NWz6ty9;
	Sun, 19 Jan 2025 23:03:50 +0100 (CET)
Date: Sun, 19 Jan 2025 22:03:50 +0000
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
Subject: Re: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
Message-ID: <Z412xoyT7REyAejU@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
 <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>

On Fri, Jan 10, 2025 at 04:24:27PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
[...]
> > +	compatible = "lancom,nwapp2", "fsl,mpc8314e";
> 
> Missing bindings. Please run scripts/checkpatch.pl and fix reported
> warnings. After that, run also `scripts/checkpatch.pl --strict` and
> (probably) fix more warnings. Some warnings can be ignored, especially
> from --strict run, but the code here looks like it needs a fix. Feel
> free to get in touch if the warning is not clear.

I'm currently aiming for 5-10 converted/new bindings in YAML format.
Should I rather put them into a separate series, or include them in this one?

Best regards,
J. Neuschäfer

