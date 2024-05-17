Return-Path: <linux-gpio+bounces-6420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF868C8207
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 10:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0A31F2271F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 08:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491E21B809;
	Fri, 17 May 2024 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="k3eoWmSs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63112E62C;
	Fri, 17 May 2024 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715932861; cv=none; b=rD74SmuDRa7qqfNrs1zwZFoP+BPqyTpmxe4RqE7uy5FUXidopz6djKo2cehGnDjRSiwuewtHYx34feA2Ews3Y4m36ReCgZ/FsTP4OiXT1B+5esQ4TYUK7/W7wqCgesy+GAx+o9dQS7C7T+CzvoZLeHsIXajenwHgrqvG4ipY8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715932861; c=relaxed/simple;
	bh=Vdoo6QU/u39c9Rgl96CtP6qcbMot2KPUxgfcFSgZyBI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq+pR/kSgE6TkYwJk8tRVjRONhfmRDV3FFipGRSO2zpv0QB9B5pCLqQqhKoS6PBbUJFKLgal34mW0a96HYiaTtZB5rm2rt/G2566/067ZqZW6k2Zm8woutCnEbrEUmKdxdlahdQlNZvdEmtEuhs1jHs8fYFDQeBOit4RqzXVFCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=k3eoWmSs; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715932859; x=1747468859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vm22BVZO7WVhxQCWzSyuBh1sHNc/VQxR59e5eUx+xd4=;
  b=k3eoWmSsD4hZMAzQad/QUuCfeJvJavE2aFhdzP3v/u44N/uhF68VFZ8O
   3pqmmSqE/IHdWEEwOaplIWNXFtvmEQEmKHRA1RP4MROnsURM7mcpopkrQ
   3wDMgIQG/kGd6M/XG+YQvFTcp/Gp9o5smWtlA/Gj5v5oLDEtGCzEsBUy4
   A=;
X-IronPort-AV: E=Sophos;i="6.08,167,1712620800"; 
   d="scan'208";a="89887872"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:00:57 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.10.100:16909]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.18.108:2525] with esmtp (Farcaster)
 id 8a5c4799-5210-44e6-a13c-cf4505886cc0; Fri, 17 May 2024 08:00:56 +0000 (UTC)
X-Farcaster-Flow-ID: 8a5c4799-5210-44e6-a13c-cf4505886cc0
Received: from EX19D002EUC003.ant.amazon.com (10.252.51.218) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 May 2024 08:00:56 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D002EUC003.ant.amazon.com (10.252.51.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 May 2024 08:00:55 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com
 (10.253.65.58) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 17 May 2024 08:00:55
 +0000
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id D32C420C24; Fri, 17 May 2024 08:00:54 +0000 (UTC)
Date: Fri, 17 May 2024 08:00:54 +0000
From: Hagar Hemdan <hagarhem@amazon.com>
To: Kent Gibson <warthog618@gmail.com>
CC: Norbert Manthey <nmanthey@amazon.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <hagarhem@amazon.com>
Subject: Re: [PATCH] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240517080054.GA12268@amazon.com>
References: <20240514122601.15261-1-hagarhem@amazon.com>
 <20240514124221.GA76024@rigel>
 <20240516125742.GA14240@amazon.com>
 <20240516145540.GA116534@rigel>
 <20240516162239.GA184911@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240516162239.GA184911@rigel>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Fri, May 17, 2024 at 12:22:39AM +0800, Kent Gibson wrote:
> On Thu, May 16, 2024 at 10:55:40PM +0800, Kent Gibson wrote:
> > On Thu, May 16, 2024 at 12:57:42PM +0000, Hagar Hemdan wrote:
> > > On Tue, May 14, 2024 at 08:42:21PM +0800, Kent Gibson wrote:
> >
> > Now I need to test your patch to see what it actually does.
> >
> 
> Tested.  Fails.  It does what I thought it would - clamps the offset into
> bounds BEFORE the call to gpio_device_get_desc().
> 
> The appropriate place for this fix is in gpio_device_get_desc(), after
> the bounds check.
> 
> Cheers,
> Kent.
>
yes, you are right. The speculation macro should be after the bounds
check. I missed this property this time.
I will fix it in v2.

Thanks,
Hagar Hemdan

