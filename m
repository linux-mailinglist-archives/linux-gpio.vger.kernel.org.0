Return-Path: <linux-gpio+bounces-16680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E413A478F9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 10:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 704997A5E4A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0DE227B95;
	Thu, 27 Feb 2025 09:23:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D715DBB3
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648183; cv=none; b=dNXvSDZvq9kzHeNPKnVNdWVHdO2ZPRXiLCLBq45iAiCounxaaS+7BSsT8o93P25+WQgCAJP7f2wOvq1eupqqLWN0JxYXKUzh+QpL28UPBKZ4zqUVXt0eFteHjWeOLiuadtDHE8dew2MyOTx57zgTwxs6wzq068TPaAY0OggSv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648183; c=relaxed/simple;
	bh=eOp/FD4D8eR0d0RGSRsU2yTkVoBv0KN5V+bju7bAM00=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KER1HHkvjoE2BcD8dq1MuILO+J6LDDhb8xOBcRmjiDuEBPMrEIJF9rzFt7qu4inXb4vrA1PEzXQxC59DpK++Dnod+QdW/k749MCGKGHKunLzIC5tfs2KBUiM7TVMX2igelntqTodhgHOdAuAxXkwL+nG8CB8o+1rGCk5Vmz0P/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 652a27b3-f4ec-11ef-9d7a-005056bd6ce9;
	Thu, 27 Feb 2025 11:22:42 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Feb 2025 11:22:41 +0200
To: David Laight <david.laight.linux@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: use the required minimum set of headers
Message-ID: <Z8Au4WwXDlPQwfn2@surfacebook.localdomain>
References: <20250225095210.25910-1-brgl@bgdev.pl>
 <Z72fBfM4afo5SL0m@smile.fi.intel.com>
 <20250226214613.1e814f9a@pumpkin>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226214613.1e814f9a@pumpkin>

Wed, Feb 26, 2025 at 09:46:13PM +0000, David Laight kirjoitti:
> On Tue, 25 Feb 2025 12:44:21 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Tue, Feb 25, 2025 at 10:52:10AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > 
> > > Andy suggested we should keep a fine-grained scheme for includes and
> > > only pull in stuff required within individual ifdef sections. Let's
> > > revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> > > gpio/consumer.h") and make the headers situation even more fine-grained
> > > by only including the first level headers containing requireded symbols
> > > except for bug.h where checkpatch.pl warns against including asm/bug.h.  
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > 
> > FWIW, I have checked the current state of affairs of linux/bug.h vs. asm/bug.h
> > and found no possible issues with the dependencies. While linux/bug.h drags
> > more than needed into this header it won't prevent cleaning up the rest of
> > the headers. So for now we can stick with linux/bug.h, but at some point it
> > would be better to be more pedantic on this.
> > 
> 
> A 'fun' activity is to pick a random file add "#define _IOW xxx" at the
> top and see where ioctl.h is is first included from.
> (I've not got a build machine up at the moment.)
> 
> Then start fixing that include sequence.
> Moving a few headers around is otherwise pretty pointless.

Have you tried to help with reviewing this?

https://lwn.net/ml/linux-kernel/YdIfz+LMewetSaEB@gmail.com/

-- 
With Best Regards,
Andy Shevchenko



