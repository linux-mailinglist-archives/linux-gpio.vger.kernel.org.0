Return-Path: <linux-gpio+bounces-25853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D515B50E83
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 08:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A748E1897137
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 06:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5C5303A1A;
	Wed, 10 Sep 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezNvTq1t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10219D89E;
	Wed, 10 Sep 2025 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757487168; cv=none; b=sLn0VwOF2IovQgiyDCzLTki1hH+5Py4vjOTT7q7mtiU1WP2YxMISr2w999mn7w8I0R78Z0CQWNdHQz8ht/HPtldEaWE0fseRhq02KPIsvkIoa4X9oRJmVgj6+dc8cPYZCjP4Q2pal76G4tUOz03kVaowO8qGhJhLDM8E3g2Jryo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757487168; c=relaxed/simple;
	bh=Xbxzbd9N/J4R8JD9GiiHN7QemzWWqNtVAcebecs6kMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW4GA04T9cqGtsmMaowyS4OdAtCwnyRj7/0hOMmGbK0EkybW+/VQ0A98ibnq35/6kFsbIEbg6s8PPnLOP05k8oCN4thlcNAjcJH4wx79/RBTMEqFf3/dvvPn9cka/9FimnHO6HAq4AJmfty12OEAkgkaV008/gLCkdKlO2gtox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezNvTq1t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757487167; x=1789023167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xbxzbd9N/J4R8JD9GiiHN7QemzWWqNtVAcebecs6kMo=;
  b=ezNvTq1tO5XqYhDZlDjPmYguvYxgjfCw3cpMG/gxQot8zN/WCRC5eba9
   YIdLH69dpEPtOnZ9DG0++mzBs/TvkhtpZ4sD0CMByffacD1bVmebLkBwz
   OgapBoyIdWnWq85fLN/Xx7Rca3BeZAvOty2SvqdPyq080omW4MolxGf8X
   QhFM0dxLrRMTfQnP2VBP7ZJGl+9rSEta0kYyoCxp5ZK+3lJN/h2zJwwaW
   zsOszKL2Ee6aNQHnB/H0t6PG/DOZMbpnmdStuvDyXkLVNLrI79htlSDrh
   Pgmgh3n0wsSitnNKqGkKYvhnx4TX6lUhbUysE6B3Y0p1lJ19HFlZzX7UI
   w==;
X-CSE-ConnectionGUID: FuRUlq+LTf+HZHuex1/yeg==
X-CSE-MsgGUID: XvsxKj7PQbquIsvk25WMvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59009251"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="59009251"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 23:52:46 -0700
X-CSE-ConnectionGUID: hrfBlALWRS+/KWf7YVGKMw==
X-CSE-MsgGUID: S5OAHpV4SDW3E4KxEva7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="177579067"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.14])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 23:52:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 932A71201B4;
	Wed, 10 Sep 2025 09:52:38 +0300 (EEST)
Date: Wed, 10 Sep 2025 09:52:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aMEgNtjcy1-NuBds@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>

Hi Cosmin,

On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
> Hi Sakari.
> 
> I recently left Analog Devices but I will continue to try upstreaming
> this driver. After the upstreaming is done we can switch the
> maintainer status to someone else.

Ack, thank you.

> 
> Here's the output for the commands you asked, provided by my
> ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
> 
> Do we need to fix anything based on the compliance tests?

Looking at the errors, it looks like some fixing is needed, possibly also
on v4l2-compliance side.

Regarding GMSL, are the image width, height or mbus code used for anything
by the serialiser or deserialiser drivers?

-- 
Kind regards,

Sakari Ailus

