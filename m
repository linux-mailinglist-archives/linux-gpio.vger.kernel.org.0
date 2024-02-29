Return-Path: <linux-gpio+bounces-3905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC186C296
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 08:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA03D1F22259
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 07:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE5613D31F;
	Thu, 29 Feb 2024 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="UR8zJFNa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64144C9B
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191947; cv=none; b=AwyJj/up3kg2SgUhjmHmbS3k+AjxoLA04GcRb/fbzRoCRtQC9+YF7X99wrtmCtND4C6fRkOYysY4SwJVNIdM2A0akPZpCT3UbKadcxpFy3kUUqp3Ul0imBhug/bYYPKv09NRHOvPuyiy8yRXajtzvAXpvqHFg8edBXfNz+2k5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191947; c=relaxed/simple;
	bh=YSPryk5LuFEzr6tzDSGQ8LtRBTJFX8hBlmTVK6Bjo5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIecERzQa/Mjawh2x7gcFbB3OtalGgMrvoJCcHI2RsYjDW9t8nP2frp3mqAgP97cObtj/np5n700HfC2ymNsZu46SU/K96v2gux5pw48gqTpNWk483Tf/YxvRgG9t4N2UXIb3vTRh0ajdAQzTg1qR8s+ihRcxHnefVlZExHRlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=UR8zJFNa; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 6A5A0603C4;
	Thu, 29 Feb 2024 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709191945;
	bh=YSPryk5LuFEzr6tzDSGQ8LtRBTJFX8hBlmTVK6Bjo5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UR8zJFNaNKSWnt2JSiIOOBxn7XyBeQfTps1pPuqFXfNUrjw7Lajc9MFY80JkvAKOt
	 ErDsIJUIL/A74OOmXvDfFYwPk6oZ0KRIK692NbpM8G+2ipprBanidxxFGzhpMRCQGR
	 VJtAa4B7PnlEYi0e08Y8JPxjRhxAInKefKd5irNpf392tIjopxWy2QgtQ8iaDJik0Z
	 AszsBaeKl2Y91wGNcp0JQ77YxvuKLCA/Aq8/lZgYTMmmM4sfMJr7X5AOF9B7I5PqMs
	 LKwEZj8iSUJCKLl8tInE/IIZOvgMLpBN2+SHaawSIdDS6LuKJqX/uSoeJXVcSVLjPp
	 mZt2nnKVonPrg==
Date: Thu, 29 Feb 2024 09:32:11 +0200
From: Tony Lindgren <tony@atomide.com>
To: Matthijs Kooijman <matthijs@stdin.nl>, linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <20240229073211.GB5299@atomide.com>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>

Hi,

* Matthijs Kooijman <matthijs@stdin.nl> [240228 12:04]:
> While figuring out why bias-setting on the beaglebone black did not
> work, I noticed what looks like a bug in the pinctrl-single driver,
> preventing it from disabling a bias once enabled.
> 
> The short version is: It handles pin_config_set by looking up the requested
> setting in a DT-defined lookup table, which defines what bits correspond to
> each setting. For PIN_CONFIG_BIAS_DISABLE, this never works since that setting
> is never defined in the lookup table (so the code that exists to handle this
> setting is never actually executed).

OK

> It seems this code has been broken since it was first introduced in
> commit 9dddb4df90d1 (pinctrl: single: support generic pinconf).
> 
> An obvious fix for this would be to lift the handling for
> PIN_CONFIG_BIAS_DISABLE out of the inner loop, running that instead of
> the inner loop in that case.

Maybe post a suggested patch for Haojian to look at?

> Note that I have not verified my analysis of the code by testing. I did
> confirm that if I define the (what I think is) proper DT definitions for
> bias control for the beaglebone black board, I can enable bias, but not
> disable them, but I cannot rule out that that problem has a different
> cause. I also do not have a good toolchain setup for compiling custom
> kernels for this setup (and limited time for setting up one), so I do
> not expect to be able to provide more testing or a patch anytime soon.

The buildall script should allow you to easily build a cross compiler
on pretty much any current Linux host. I think this is the current
git tree for it:

https://github.com/nathanchance/buildall

Seems like buildall should be hosted at kernel.org but I don't know the
details, so adding Nathan to Cc too.

Regards,

Tony

