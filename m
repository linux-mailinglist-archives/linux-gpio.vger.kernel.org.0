Return-Path: <linux-gpio+bounces-26824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F0BBE0D1
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 14:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB8223BB6B1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 12:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B527FB1C;
	Mon,  6 Oct 2025 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="eMVVVJwg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF7276049;
	Mon,  6 Oct 2025 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754349; cv=none; b=jpCyD9HhHuWroll2wKet1atxNZ50gCgw5hjmzqPX5Q/AdZuT9Z9jtU2CiDLtCRADnH03TLxR8BHBptr1BPTSbMpzySvKuHtxsjvDqFums3DIh8COJ3WBABJEfRdFI30Gvsxgo5wt7P/5TUK9d8FbJLWxvregoqi9IjVHlduDcsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754349; c=relaxed/simple;
	bh=XQ35ABgL2asjcnCvWO6XYTGDsZBke6iUOYGx7Zzjy4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4UuIbywb1qsmnJdqw27SuzNC7eDMWJJ9ATuoxbwrlmaq6z8aN+NHin0HVvjlbv1AQX+AJpnNY5RK4ggD0k43GKAXJI0zqP3KyIQX6/fidqMTn8gtue8Sx3uhco0krgbghah87PZtTKtZ4HRhbmI+qjbR+DmEm9L3m6Cnq8M6qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=eMVVVJwg; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id D5923457363D;
	Mon,  6 Oct 2025 08:38:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759754335; x=
	1761568736; bh=XQ35ABgL2asjcnCvWO6XYTGDsZBke6iUOYGx7Zzjy4Y=; b=e
	MVVVJwgAhClZnT7HvDto1Yr9/HFA70J7hWphnGlKHisv0lhvS55zMWqF70mCGOhp
	dRXIac61LKj0spkOdxApATStMq0KbM+Jaqak5sHIs24CU4Et9tTnqzMo3W7hVaxg
	lIslQUpp45X1wXR25+pjA9sQPqnHqFLSOw6bzl0nBM=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UEHysZZRY4mP; Mon,  6 Oct 2025 08:38:55 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 2E115457328D;
	Mon,  6 Oct 2025 08:38:55 -0400 (EDT)
Date: Mon, 6 Oct 2025 08:38:54 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, tzungbi@kernel.org,
	dan.carpenter@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 0/4] gpio: mpsse: add support for bryx brik
Message-ID: <aOO4XuzFm4lNyN0P@ada.csh.rit.edu>
References: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
 <CACRpkdZpFvzu+UFkQjCLO20P0V=QOY6dC9O15LP3LJx6NuifWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZpFvzu+UFkQjCLO20P0V=QOY6dC9O15LP3LJx6NuifWA@mail.gmail.com>

On Mon, Oct 06, 2025 at 11:09:02AM +0200, Linus Walleij wrote:
> Hi Mary,
Hey Linus,

> thanks for your patches!
Thank you for looking at them!

> If it doesn't have real-world regressions right now it can just be
> applied for next, if it has implications on deployed systems, they
> should be tagged for stable@vger.kernel.org.
>
> If you have some idea about that it will help Bartosz to choose
> whether this goes into fixes or stable when he applies it.
Mehh, I think since the old device wasn't hotpluggable it's probably fine.

If you have concerns about memory safety or something with the old way,
maybe that's a good reason to do it? That's really the only thing
I can think of though.

> 
> > Mary Strodl (4):
> >   gpio: mpsse: propagate error from direction_input
> >   gpio: mpsse: ensure worker is torn down
> >   gpio: mpsse: add quirk support
> >   gpio: mpsse: support bryx radio interface kit
> 
> The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij

Thanks a lot!

