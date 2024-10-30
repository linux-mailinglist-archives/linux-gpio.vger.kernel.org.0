Return-Path: <linux-gpio+bounces-12316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171969B6B29
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 18:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77AA8B215E6
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164E91F4FCE;
	Wed, 30 Oct 2024 17:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="DRfMLfTz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF4B1BD9C0;
	Wed, 30 Oct 2024 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309928; cv=none; b=TA+RR1PDpeKi7qv/8Zzn7WiK8AEMioLIaKZopvHQrnJ9o2f7YctMbXVbGYuIu2QvQrsPAGSXfTHJNrvsL8I1MslSgnv8vujp972D/8mhG/8NtXoiHht7MeKICfeUvcA1jmJer6Y1RsuC9JYI8SYxUMhUB4p7E0PyfcT3UWW2/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309928; c=relaxed/simple;
	bh=FJ2GZLdujlPzhBjZH3MHuSAIcXkkdbERBD60uDV94oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cslYRh6hyl0O3FI2iKGvkwwVKEaSk5Q2onITf609aj6Pr016q0XNLrmmbup7hEwKxSnKLJZbnf2SP83qxI+9qFyMDuYMkskLvydwlZlh/p8xThziJRqP/dr9OsSLNVHrEZ0o/5S0SxBT/K0BQxlxvfAwoKYSuAwobGu8aLLYCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=DRfMLfTz; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 6C2D7404CC3E;
	Wed, 30 Oct 2024 13:38:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1730309925; x=
	1732124326; bh=FJ2GZLdujlPzhBjZH3MHuSAIcXkkdbERBD60uDV94oU=; b=D
	RfMLfTzfvWQvDg+hJPZCA8RnlXIOdsLcAr7R9Vo78nhV6q4uymYJudaVUhQoPYVW
	BFLlrhqzpxOr774VU7bhl9ltv6/xEVqNZsC5+fC8k2CB+be8BxD4wKS19gDyZiE2
	PTsDc0sO6dsmGu8MC6VKA8TdggNSTAMT4V/b7xn1QQ=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6ffjgijn3Men; Wed, 30 Oct 2024 13:38:45 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 097EC400A884;
	Wed, 30 Oct 2024 13:38:45 -0400 (EDT)
Date: Wed, 30 Oct 2024 13:38:43 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/2] gpio: mpsse: Check for error code from
 devm_mutex_init() call
Message-ID: <ZyJvI_ZaVVC0-kvk@freedom.csh.rit.edu>
References: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
 <20241030153201.2078266-2-andriy.shevchenko@linux.intel.com>
 <ZyJo4dvULIflwhXL@freedom.csh.rit.edu>
 <ZyJt3U-YTpQYwLrq@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyJt3U-YTpQYwLrq@smile.fi.intel.com>

On Wed, Oct 30, 2024 at 07:33:17PM +0200, Andy Shevchenko wrote:
> Thanks, I will fix that, I dunno how I missed that because I carefully read
> the code before adding the checks.
Proof that it happens to the best of us :)

Thanks again!

