Return-Path: <linux-gpio+bounces-4024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79386DEF4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 11:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71D4C28581E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 10:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC9F6BB33;
	Fri,  1 Mar 2024 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="tBKpiB3Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02936A8D3
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709287487; cv=none; b=QmA8h/HmKTpgBDbzh3SbBA8PuFC6phHqmGnPn0QQ1Iih4kd+hDRnfh7kJr9zKTktCTdP1bi2voSPHkqK0H0aDu2d1oqSzTQ9tkL+E2mDxEYeD97EilKkWKGQCsJfQUyXuSQ6b+Nnlfkn5vt9azn3EQpnP7KlyqTYgXw7mH48eWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709287487; c=relaxed/simple;
	bh=6feN6yOIheZ+dtgydgU6GgCDdFRyE1viQIGzzrMdBes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtEsD6ZgVBH01INvd0I6Y/NK9luFoDS6LCuZ1No9TVqA63nwpR1nzfi52cw2VwetRmTqtC9r/neM/xoPB7pS5FiO+TS4C3fwOmw3P1ny2ciO89C9wk3VMzfnf9rAw+j2F4odBT/G1/uaZZ+e4pQ0D4gMmnEIEv114a2Epl+4zUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=tBKpiB3Z; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id AD51F6051A;
	Fri,  1 Mar 2024 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709287478;
	bh=6feN6yOIheZ+dtgydgU6GgCDdFRyE1viQIGzzrMdBes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBKpiB3ZNFZSvZOXmhc/oRO3BfBLuFk0rFqoa3vkg49tfbxsXtw0rJkvu3ovRdl/f
	 cImNKFZBOQdm/t7Kad6NvPI2yFvhXor/S1D0NSt8sdT+XCcvYTarZ6Jx8RpcdREiNw
	 H9q5RnJtJBWw9OXcc/CZeB1ybdaqlWvd3MYqF7L/Clb6LmRaXZeehBxZ6QDUJ0hzyM
	 LWuXXxmj0bbXf2nIxPSen2juqtu7ai2/pvx9sfXADrlc6LTzNLhcpBc39fe84MhUm3
	 km9rdBT7u3hMFEFcgMo+D6Un2OjW/E2oPCvg1pong7pW/e9qLBoewj7FjnCW3/xIvx
	 WqXEIsTsEWnuw==
Date: Fri, 1 Mar 2024 12:04:27 +0200
From: Tony Lindgren <tony@atomide.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Matthijs Kooijman <matthijs@stdin.nl>, linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <20240301100427.GE5299@atomide.com>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
 <20240229073211.GB5299@atomide.com>
 <20240229183115.GA2905548@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229183115.GA2905548@dev-arch.thelio-3990X>

* Nathan Chancellor <nathan@kernel.org> [240229 18:31]:
> On Thu, Feb 29, 2024 at 09:32:11AM +0200, Tony Lindgren wrote:
> > > cause. I also do not have a good toolchain setup for compiling custom
> > > kernels for this setup (and limited time for setting up one), so I do
> > > not expect to be able to provide more testing or a patch anytime soon.
> > 
> > The buildall script should allow you to easily build a cross compiler
> > on pretty much any current Linux host. I think this is the current
> > git tree for it:
> > 
> > https://github.com/nathanchance/buildall
> 
> That is actually a fork of
> http://git.infradead.org/users/segher/buildall.git from Segher
> Boessenkool, which appears to no longer exist, so good thing I did that
> :)

Yes, no idea what happened to the original git repo.

> > Seems like buildall should be hosted at kernel.org but I don't know the
> > details, so adding Nathan to Cc too.
> 
> For what it's worth, there are prebuilt GCC and LLVM toolchains on
> kernel.org that should work with the majority of distros on aarch64 and
> x86_64 hosts.
> 
> https://mirrors.edge.kernel.org/pub/tools/crosstool/
> https://mirrors.edge.kernel.org/pub/tools/llvm/
> 
> Arnd maintains the GCC ones, I maintain the LLVM ones.

OK great thanks for the links.

Regards,

Tony

