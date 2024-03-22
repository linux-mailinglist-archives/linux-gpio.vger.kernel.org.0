Return-Path: <linux-gpio+bounces-4516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3448866B0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 07:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67235285A18
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 06:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D65C132;
	Fri, 22 Mar 2024 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="C1UntLRv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA26410A01
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711088670; cv=none; b=aLXUBnlBQUW6LE93Eoi/dNyZ4hbldLmhUBVJGibgnkRO+cEj+lKWMYet6rv1m7zaXU2XE2e0aNG1wpIg71ykkFHR7jjM/oCcnAbeQCVPz59siMQ8Nz24wQkevg3Fygg3aGPNZtNv2ijFRohCcdfh4rwYz4Y/I97vPNvERd7dPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711088670; c=relaxed/simple;
	bh=rzIPDPuo//udlp9zl0OoQ3bxK3+emEfmtBQLHA7MiXQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdQeudcmpY0oCA3BXYjYWXq9h9KXv33VSvKq28TYUmx+B5r+dibPzANEynKAWquHJ+4P9y1RpjKnbCx1KOwNFlVYzcEjPiFquNhda6xPK+P7pwe+qzQINYekNULjkp0gAqDMZh4HhUTZACB19j93dolZh6Nz5nLkbX7S5r2Erhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=C1UntLRv; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4E35760426;
	Fri, 22 Mar 2024 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711088667;
	bh=rzIPDPuo//udlp9zl0OoQ3bxK3+emEfmtBQLHA7MiXQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=C1UntLRvyYJKpWdHTIePYXkkq4mirX58EtNGvHxgs+5diLWdxnXKbb9p4n1MIrkuw
	 Y0irVfMIf+Eb8TyWuC5WxOBOVu2mZ6HvqbIQNntahtk9oO2f2kFmDWIrgMvmASJgA5
	 yylzSM4C09TomOGwlDk+/aFr5WyQuq4DqPrY+hdDLCDPZ6QK2VvEDNidboC1Rke3jk
	 7AOqoiiIoDQHT+NVcfJAoBe9I19NfPzWJM1kWPuQHTm3jNrRSZqNfwMKamnnlhmes1
	 WUlTy0iKvVWjzNa1kHKvpqd/TP1l4uCISB6nWndoEEHYNBdTh9vGcTlQz6kYoTs7EG
	 ECrcHQWD+6G5g==
Date: Fri, 22 Mar 2024 08:24:19 +0200
From: Tony Lindgren <tony@atomide.com>
To: Matthijs Kooijman <matthijs@stdin.nl>, linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <20240322062419.GA5129@atomide.com>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
 <20240229073211.GB5299@atomide.com>
 <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zflxi8SCzzouP9zW@login.tika.stderr.nl>

* Matthijs Kooijman <matthijs@stdin.nl> [240319 11:05]:
> Hi Tony,
> 
> > > An obvious fix for this would be to lift the handling for
> > > PIN_CONFIG_BIAS_DISABLE out of the inner loop, running that instead of
> > > the inner loop in that case.
> >
> > Maybe post a suggested patch for Haojian to look at?
> 
> I've created a patch (will send in a followup) to do exactly this.

OK great thanks!

> I've compile-tested it but have not been able to runtime test it (I
> managed to compile and run a mainline kernel for the BBB, but ran into
> problems setting up the bias control devicetree). For now, I'll just
> leave the patch here for review, maybe I'll find some time also runtime
> test it in the future (but likely not).

OK

Regards,

Tony

