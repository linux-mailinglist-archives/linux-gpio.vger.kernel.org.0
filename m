Return-Path: <linux-gpio+bounces-26764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B3BB42E0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 16:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4C03C81CF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 14:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810F4312805;
	Thu,  2 Oct 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="MPltKSJ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23993115AB;
	Thu,  2 Oct 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415803; cv=none; b=jeFsfnZ8ghYKcSGdx9trKRCNIRaOZ61X656R7nhpSNFBVnecB+D7tOKg2DpsnmL1C6jCtzy/J/dwjGurE9MKSbEOZihKwj+OTXhp2Pdt8Czzlh5DHHLagJVeADnkFhZvTcghDEqmjX1MR4Fqpstug/lo3Dp1sb9S6hgUsHGqdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415803; c=relaxed/simple;
	bh=qTslAmpn8u3MI9/9S7DNqh6q78Pgezv3rq12tjzWylI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbhaxKfclTIP/epjLA5olJ+PcWQU2SFWoJkhGbz0MKbOIO8YENsMUYzAp2Ywgyb6pg4Yc5+vC5bASWt0UgSvXDDcTwMAtgAXfPaGDBUI4ahjYhejSwXQwv4HYTWIztrZV18Ny4bRzPkyFuVM/WeHRY58C31MTaHV+2HKDVo3MMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=MPltKSJ8; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id E9334456DF5D;
	Thu,  2 Oct 2025 10:36:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759415794; x=
	1761230195; bh=qTslAmpn8u3MI9/9S7DNqh6q78Pgezv3rq12tjzWylI=; b=M
	PltKSJ8igyRrqCfZyXKc+Kf9uRaQrP+qGM4UKE8t0g3v1D8N7tILTI0B0D6lK29U
	OWlnfpjsaFYFtQarMj4ZtW7mV0UNqEN/d/eMjBUcUsYfU8j7HuqRvXQYF8H8jz1h
	9XmRs644+t6l5FI/BV11mSsUKc/jjuE6+1eef2o2bE=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wfGF-XWVGgG7; Thu,  2 Oct 2025 10:36:34 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 723C045735E9;
	Thu,  2 Oct 2025 10:36:34 -0400 (EDT)
Date: Thu, 2 Oct 2025 10:36:33 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, linux-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aN6N8diBxVk1k9pi@ada.csh.rit.edu>
References: <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <202509290823.hreUi6Tp-lkp@intel.com>
 <aNpH7gfhJXIBbCQZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNpH7gfhJXIBbCQZ@stanley.mountain>

Hey Dan,

On Mon, Sep 29, 2025 at 11:48:46AM +0300, Dan Carpenter wrote:
> On Mon, Sep 29, 2025 at 11:46:24AM +0300, Dan Carpenter wrote:
> > a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
> > a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
> > a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
> > a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);
> > 
> > This needs to be list_for_each_entry_safe() because gpio_mpsse_stop()
> > frees the worker.  Or kfree_rcu() inside an rcu lock or something.
Really good catch! The loop above this one has the same problem. Will be fixed next revision :)

Thank you!

