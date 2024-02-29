Return-Path: <linux-gpio+bounces-4000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D386D258
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 19:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D521C21554
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 18:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3171B160653;
	Thu, 29 Feb 2024 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9A36gHM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D03715E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709231478; cv=none; b=gLnllVUpWJ8GEVkA6hoqJQmPf9JLhxJppuorhmer0dU0dqiQhaXt8iMB6/5NLOJyojPNSgSwJSNPbl/KWThZVwzKAGaarKuKytqTk4kc28b9WzIUH0GAYmjEr71svurHYjM8ebgfqfiAb4obfPXX8KVihB3cqNal6cGvNTz9WzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709231478; c=relaxed/simple;
	bh=dhVoM9lST+Di/1TN0FzkiwCYQVrRAFCzxPX9cOzmrcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIVyQZXU11jGUT2rkBU6OIJf9WqVYP7wKYX92j3hM5iP+0rgEFae2VZH0dfkw8yXQ8gPo07AAB6us4fbAUT1iszxgT8a4PVS+csG/71smaMMa8zqeVOWHjn5IMYaKnpeBlb6YTrohafBoYEVxCkQ6Ieb16PZYG7B2z4S3Z60FU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9A36gHM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270A6C433C7;
	Thu, 29 Feb 2024 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709231477;
	bh=dhVoM9lST+Di/1TN0FzkiwCYQVrRAFCzxPX9cOzmrcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9A36gHMJpFmRFEjeTS5Pm1GaoejXKXkFPjQaNkEFKkY3y7WicAXe1ODg5JFJ4xr5
	 svrxGcjPXhTT6iprKsUKZxeV/rmCwHlVbRVT1PJBGJcyinQ3Zed+/WjJROgqrwY1+2
	 ne+bT0q4v19BVrbYW1/PRyVlBfTsjTLMK+gEQi0oiLuqpX7ui3/taFo0Ce+vdxm3lx
	 3Ao5e6yhxLhG0FOxpKLSMYdnCRnB0xzDf/3WLB3WbtoIOHreTkuim8qeCDuJKrjArc
	 bgOg2NNtHBUmmR9n7CggogW60oDSt1P9gZm4W4In2nQWNiJN4OIdK6ZgoEdxclc6b4
	 sqQXiwlrrQp7w==
Date: Thu, 29 Feb 2024 11:31:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Matthijs Kooijman <matthijs@stdin.nl>, linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <20240229183115.GA2905548@dev-arch.thelio-3990X>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
 <20240229073211.GB5299@atomide.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229073211.GB5299@atomide.com>

On Thu, Feb 29, 2024 at 09:32:11AM +0200, Tony Lindgren wrote:
> > cause. I also do not have a good toolchain setup for compiling custom
> > kernels for this setup (and limited time for setting up one), so I do
> > not expect to be able to provide more testing or a patch anytime soon.
> 
> The buildall script should allow you to easily build a cross compiler
> on pretty much any current Linux host. I think this is the current
> git tree for it:
> 
> https://github.com/nathanchance/buildall

That is actually a fork of
http://git.infradead.org/users/segher/buildall.git from Segher
Boessenkool, which appears to no longer exist, so good thing I did that
:)

> Seems like buildall should be hosted at kernel.org but I don't know the
> details, so adding Nathan to Cc too.

For what it's worth, there are prebuilt GCC and LLVM toolchains on
kernel.org that should work with the majority of distros on aarch64 and
x86_64 hosts.

https://mirrors.edge.kernel.org/pub/tools/crosstool/
https://mirrors.edge.kernel.org/pub/tools/llvm/

Arnd maintains the GCC ones, I maintain the LLVM ones.

Cheers,
Nathan

