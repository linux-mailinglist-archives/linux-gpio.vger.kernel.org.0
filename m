Return-Path: <linux-gpio+bounces-25890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1BB51736
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 14:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E31464C36
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 12:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC9E31A55F;
	Wed, 10 Sep 2025 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="RdrqhuLJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0006315D59;
	Wed, 10 Sep 2025 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508445; cv=none; b=sg1ikEDlFvLt1kvUknJ+PH2cekMcW0B6S1sbAIhzHomNNrnPPKNRv1zAKMfqiQDrL4YODRmZODlwcyMea+P+EXUvrtvYjaZSBjqYrEZmBDy+I/nmS82OIGldOBRLt21rrgqUeiUpk0ugE1wdi5RUmsUHWUQzhSGcNBFRXACaGDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508445; c=relaxed/simple;
	bh=t1fJRuXU/a38aPuhlxIeVdENiyKxjXl52JKvZlKaua0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imJ6h0Kr6zGIp9JVFS0XnCWJn0tSveOdw9lVKafa/bTjbG3gGt8KbxC1lQkpzmq/dg90vLc6s6ITUXu0UDZu1j03IH8kvDkIONiPXcQSc+xxG/af1yCZ+l4rJcy6NtdXt53VJ4VLOt37K0WZtby4BbxHRNim5xVx1n+7pxgd5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=RdrqhuLJ; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2DAE340ED4BA;
	Wed, 10 Sep 2025 08:47:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1757508430; x=
	1759322831; bh=t1fJRuXU/a38aPuhlxIeVdENiyKxjXl52JKvZlKaua0=; b=R
	drqhuLJCV81+161uciWYnlWrz0yI7g0AnFXVxmSeUwe8A1gnaHSGiVIylTzGLgH7
	5FgX0hlyrAkPlzPIZEI8/QOj0+Td9hkNjgp0MSfFImNkPdhVJlXv9ZoPlUr7x7pX
	kpWikuYOSEZ+09PTeeCKJ192gdTp+SGH9g5FSOeKqk=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7VS5oyVckk4Q; Wed, 10 Sep 2025 08:47:10 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id B626140E9C9C;
	Wed, 10 Sep 2025 08:47:10 -0400 (EDT)
Date: Wed, 10 Sep 2025 08:47:09 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
Message-ID: <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
 <202509092305.ncd9mzaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509092305.ncd9mzaZ-lkp@intel.com>

On Tue, Sep 09, 2025 at 09:32:09PM +0800, kernel test robot wrote:
>    drivers/gpio/gpio-mpsse.c: In function 'mpsse_ensure_supported':
> >> drivers/gpio/gpio-mpsse.c:211:25: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
>      211 |                         "mpsse: GPIO %ld doesn't support %s\n",
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Oops. Turns out this is m68k-specific weirdness. v2 will convert the
result to an int and use %d.

I'll hold off on posting it because I'm anticipating there will be some feedback
on the actual code changes that will need a revision anyways ;)

