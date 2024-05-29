Return-Path: <linux-gpio+bounces-6828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713B8D35DB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ED01B2271F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC64180A60;
	Wed, 29 May 2024 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3EvFLQOi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867214B973;
	Wed, 29 May 2024 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983915; cv=none; b=H69ZuIXzbR9jdwMwUFncxxmXnVxSgYheAmVvmCY8nSMAeqIs7R/pPIQLnrYYv768zuaxZbBt9m+SKt4G83WPMaero+UWm1aZKDyHDohNxScFQTvkXaSy1n1Ln1WqzHQtocgYtWdsG3yVXsEuMcDF1qPPdmWMgBRNJ2Az61itnpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983915; c=relaxed/simple;
	bh=RN2F5KBZC9SnXB/uFzmDSd3jwR7lp+h/RVvI9nd+Z24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5VbgjP3cSNv2+4uKNGvoQWjbdQpsQtRoUJDnmYnR4xqUmc4D+2uID9ayFc6icZnGlIn5qqGzMKfboLkMVFVQrsJCazjZ1kM/nq1oElSMfCnCSAm1UHvwRjqw7gd56j2sQk8xQ7lToJ79OmXeRDajQ7S3aL4hIr1bJoF8VFy0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3EvFLQOi; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=b2nFeiMyyhteV5kxyTOxPwfRk+5aQ8yJtVWCZJI9F/o=; b=3EvFLQOiDroPFvFNGZ7JfciuCq
	78na7CHj1j3tFpXTyHXHG4TIKzMxbnmtJyTjcgAuOC0eUzSWPljgscqXnl9PMc8EdLUBXx3MjUxPn
	xr/Y6XwCZWKCvVpJ6AyCr2KDNn38zRdNZBkUpGVEr3jSgzpXnPgWjdksQILIT7iEJbi8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCHwm-00GFXf-MT; Wed, 29 May 2024 13:58:24 +0200
Date: Wed, 29 May 2024 13:58:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/8] gpio: tqmx86: fix typo in Kconfig label
Message-ID: <dd4e6115-b2c1-43e9-aabb-e5df04ceaad5@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <34ad6390a48ffccfe905dafcd4e478157b7828de.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34ad6390a48ffccfe905dafcd4e478157b7828de.1716967982.git.matthias.schiffer@ew.tq-group.com>

On Wed, May 29, 2024 at 09:45:13AM +0200, Matthias Schiffer wrote:
> From: Gregor Herburger <gregor.herburger@tq-group.com>
> 
> Fix description for GPIO_TQMX86 from QTMX86 to TQMx86.
> 
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

