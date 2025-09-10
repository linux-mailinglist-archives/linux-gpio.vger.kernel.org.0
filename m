Return-Path: <linux-gpio+bounces-25908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC233B51A36
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 16:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E3E27A977F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 14:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767FD370594;
	Wed, 10 Sep 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="UDNUv3uL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C670337696;
	Wed, 10 Sep 2025 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515182; cv=none; b=XOWSnJ7vgaxs1855w0vqh4x2bPQ98Vqy2jqJLio8OGuS5SF8l/tkV1XPN4BuELQ3zvVLbm1L0/RFsLZsoEShaSDZ8f3w9ly9FWv84n2u0w6A1hGSuwtAuMox/0q1KiV+NQcZKOP5LWz/jK5tMPLlBoehrT7JB1v27qInLy5hX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515182; c=relaxed/simple;
	bh=MxtjxFZqB4NM6D4mTHBIVDGaL2MJqKi238yF8K4H9AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQdLFrEa3wKQtgH3hbYhVDXwmWhFZeUZsFT4VElAW4XuUrbtKtyREEJ49Bpk6uuqfA2kJ49r8AalK8Fyi3OTZ3GPyGy0+3QMvq4tDnmEiYVxgGFEm56ncvafKkZCOBiQ6xc91TJ5HlrMo7DiRRyTsbI2E0g024PuuTP3TCC1Oug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=UDNUv3uL; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2D34640E2F43;
	Wed, 10 Sep 2025 10:39:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1757515171; x=
	1759329572; bh=MxtjxFZqB4NM6D4mTHBIVDGaL2MJqKi238yF8K4H9AE=; b=U
	DNUv3uLd0VJMz0UvfN5WeXvhWelloKII5YqQjwG/APzYVCGF50PqIHY8jVVev5cz
	70ILovxPPoIx4SxE4JOoKBceqRjRwoZ/I+oREj3XW888SKDWAiLwVzT38za9Khza
	N1f7qlbJWzgrK+P3SM5h/xNnDYcLb1PPsY/FuZGaI0=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id V9o6rRs7apyN; Wed, 10 Sep 2025 10:39:31 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id BBB3740E9C9C;
	Wed, 10 Sep 2025 10:39:31 -0400 (EDT)
Date: Wed, 10 Sep 2025 10:39:30 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
Message-ID: <aMGNoqRaUf722QrF@ada.csh.rit.edu>
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
 <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
 <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>
 <aMF9QFIvXC5kI_9J@ada.csh.rit.edu>
 <CAMRc=MfSOTTBv3spbyiedpMifMyfmTkpmbvuDuKcbs5S1B+Esg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfSOTTBv3spbyiedpMifMyfmTkpmbvuDuKcbs5S1B+Esg@mail.gmail.com>

On Wed, Sep 10, 2025 at 03:46:03PM +0200, Bartosz Golaszewski wrote:
> If these are bugfixes that should be backported to stable then they
> should indeed come first.

Yeah I agree... I'll try my best :)

To be fair, in practice this can never happen with the hardware that
implements this since it can't do hotplug.

...With that said, I think you can bind it to another device with
new_id so maybe it would still be good to backport? Dunno.

On Wed, Sep 10, 2025 at 03:46:03PM +0200, Bartosz Golaszewski wrote:
> FYI: Maybe consider also adding lock guards for rcu read locks if you're at it?

I'll take a look! I didn't notice there were guards for rcu when I
was working on this.

Thank you!

