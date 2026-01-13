Return-Path: <linux-gpio+bounces-30484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57182D186C3
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5CE53090865
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2268E36CDFC;
	Tue, 13 Jan 2026 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4TFQdhN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD97C25C6EE;
	Tue, 13 Jan 2026 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302743; cv=none; b=Xhr+8ORMw5WOIZ84gSDe14M3APEL21jORS6X4NWu4o1hSZBZx660wx5tSEDxfSEYpRoVOlDgHwT+/ooRQigyHaGIG4+E6m0fkF5BDkmvtChncRwMk94vqwm9+tvdRzEUrNPpIm+iPu/up5QQoSwVxtjEksLQHp5KNstjKlSuX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302743; c=relaxed/simple;
	bh=MxswM+sfcPKom8rtIi+1Ux4vIfG0U20qrh1tK5c04dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QELT6qRG/PHl8k4WWkKy3JUbyWWfe9fbq/DYFfFCqCxeluEpTuSepN1Ja6rr7oKnqcYg2XKDM8G6kZi7R2T1hSpfrPqjJkNgF25hbVWGAT6AECopLYekDuTodj2EjlciLdTu4CFn5OPTznC7TTAUnu80E/HK/4ceFWh/zwR6310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4TFQdhN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302742; x=1799838742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MxswM+sfcPKom8rtIi+1Ux4vIfG0U20qrh1tK5c04dQ=;
  b=V4TFQdhNsEBLS3yKv+9UAUBHaR4SpzF2Tl1hUSx4vXdZvhg6SWMBE9hv
   2xzfvRxsmbCnn9Aee+WDyRF5sVPuUZMx1UlN3wly2O2aqccqG8wBTLOOK
   A388ayjfc9uuQYPP2NfeeVRCdJvJvZgBkyaWeQ6hU26UZTV4JXl2PcMQm
   a9DO/BvqLF1cHrvOqOuwfTzJRIYr+GoEe2hDta8haXu4O9LkIUvpXQNrW
   3lf4UUrYPEJlHLZ1h+x6bPnAHuB8Ojpv0TKNdWkzmlYv0GJxwOfL1P+xu
   VqCoJaUqHfVqdJB9zr+qPAolpY8AD7xDHQKw2gxQQ8oXJQNB9QXhwQKZM
   w==;
X-CSE-ConnectionGUID: 67mJzyj5R4GYiSYavyETPA==
X-CSE-MsgGUID: pvlBTxIUScmJFQe+HGR2cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69664895"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69664895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:12:22 -0800
X-CSE-ConnectionGUID: 8UAaOiWmTOWCxpLLWHWKvg==
X-CSE-MsgGUID: QVtrmH0iQo6bckipW/RiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209192914"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:12:21 -0800
Date: Tue, 13 Jan 2026 13:12:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/3] gpio: pca9570: Use devm_mutex_init() for mutex
 initialization
Message-ID: <aWYokvE-HsUysloR@smile.fi.intel.com>
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
 <20260113100913.136777-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdngvVWs8KZb+bOkS=qEcMp7FTPQArAvsAHxbei8RJq=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdngvVWs8KZb+bOkS=qEcMp7FTPQArAvsAHxbei8RJq=Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 12:01:40PM +0100, Bartosz Golaszewski wrote:
> On Tue, Jan 13, 2026 at 11:09 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Replace mutex_init() with the devm_mutex_init(), to ensure proper mutex
> > cleanup during probe failure and driver removal.
> 
> Well, I can almost hear Johan Hovold yelling at you that this is not
> about mutex cleanup but merely a useless debugging feature.
> 
> Though personally, I'm fine with it. Just reword the commit message
> because there's no actual cleanup happening other than freeing the
> memory allocated for the devres entry. :)

v2 is sent, thanks for review!

-- 
With Best Regards,
Andy Shevchenko



