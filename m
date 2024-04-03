Return-Path: <linux-gpio+bounces-5042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7668969BD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 11:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F6628BC4C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 09:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7603171B32;
	Wed,  3 Apr 2024 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="Szw3lfbS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFEB6FE2D;
	Wed,  3 Apr 2024 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712134803; cv=none; b=PlLb9FClXLEX8pqQQ1QYcN54UZIogFvSpGtP9A9wriJ2L/H4zklkFUbRtToHgxmxuD/asiWKZLZ8vQDK4KGErAATkRJ0KeKmJERogDXzj8ghOEz1jaATKENY1eEQzM4/w/nVcWEzGz+FtAy4gxo56NcPfmMd8b/uYvOjgPGzdIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712134803; c=relaxed/simple;
	bh=b7WHWZU5OZoYiC/XRJOtyWMbZU6czCQ7KcDpAbsJodo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fvp4Y/h5Y6Z2GMwYyPLknqm+hNO9yaIahGLiemphVz135BTMyk8KBmyI7YNneyKaJ4bg0GzbktRDLA3FqFJS1fiK4Zelu8JEpU6Es+9CHoisymnoahjYOnQWltJxq02v16cVv9+TTcrEiNoTdpMC8PMron6qX2mLK9GnTylldjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=Szw3lfbS; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 6520060857;
	Wed,  3 Apr 2024 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1712134800;
	bh=b7WHWZU5OZoYiC/XRJOtyWMbZU6czCQ7KcDpAbsJodo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Szw3lfbSyO6omGRGsybYFAki1EmPMME3PEw8owPoQYF8RPKBd8GKyLLa0TMpfoajR
	 ZikRpIsXsdBZBLnmSGy04wy8BoSjZ4FEx4p8Ct4pX7WjMBlJv7bUoKx+6AFTv4M9nz
	 wAt+Ij+IwmndNelJ46ORXuc8sggyBWe2bFbMzvvybUvUEaqIGbGOQdoDvUKWZurZv7
	 QXN50176SSdtR5P3bALRX8YZ9/gvo03GJB0AZzSdLIwjDdKIRJ2ZmV5DZSWl6m1cee
	 64O5V7A7OStKwybW9z4HQWAcxy4CwrFli5va9Om9haIQZ4KiVEmQohyeqJrho01h25
	 YF2FM/xACXH6A==
Date: Wed, 3 Apr 2024 11:59:47 +0300
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthijs Kooijman <matthijs@stdin.nl>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
Message-ID: <20240403085947.GL5132@atomide.com>
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
 <20240319110633.230329-1-matthijs@stdin.nl>
 <CACRpkdaRM-uqp_Y=gT=FMC48=835dQnB0YomYkxR9ag-SW5cOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaRM-uqp_Y=gT=FMC48=835dQnB0YomYkxR9ag-SW5cOg@mail.gmail.com>

* Linus Walleij <linus.walleij@linaro.org> [240328 21:02]:
> On Tue, Mar 19, 2024 at 12:07 PM Matthijs Kooijman <matthijs@stdin.nl> wrote:
> 
> > The pinctrl-single driver handles pin_config_set by looking up the
> > requested setting in a DT-defined lookup table, which defines what bits
> > correspond to each setting. There is no way to add
> > PIN_CONFIG_BIAS_DISABLE entries to the table, since there is instead
> > code to disable the bias by applying the disable values of both the
> > pullup and pulldown entries in the table.
> >
> > However, this code is inside the table-lookup loop, so it would only
> > execute if there is an entry for PIN_CONFIG_BIAS_DISABLE in the table,
> > which can never exist, so this code never runs.
> >
> > This commit lifts the offending code out of the loop, so it just
> > executes directly whenever PIN_CONFIG_BIAS_DISABLE is requested,
> > skippipng the table lookup loop.
> >
> > This also introduces a new `param` variable to make the code slightly
> > more readable.
> >
> > This bug seems to have existed when this code was first merged in commit
> > 9dddb4df90d13 ("pinctrl: single: support generic pinconf"). Earlier
> > versions of this patch did have an entry for PIN_CONFIG_BIAS_DISABLE in
> > the lookup table, but that was removed, which is probably how this bug
> > was introduced.
> >
> > Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
> 
> This looks reasonable to me, but I need Tony to review it before applying.

Looks good to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>

