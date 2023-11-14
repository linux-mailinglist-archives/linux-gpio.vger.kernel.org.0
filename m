Return-Path: <linux-gpio+bounces-100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2507EB0C5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79FED281238
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4703FE5A;
	Tue, 14 Nov 2023 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUlllQRK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DB3FE53
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:21:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CEF132;
	Tue, 14 Nov 2023 05:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699968115; x=1731504115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrkpp6VYa3MiK2YRsNxBj9zmBpPttdha2PSEd1OiIAQ=;
  b=MUlllQRKTQroHBb6ZmOTprz+UUK3YU51XRC9jk6+uxYt8/HudbH3Kg8I
   vPAX4iUqGgvvRDsLsQr20Gee9HlbLMSiL+OZoO4hdoK/HCLX18ZGGieo7
   zdOE7JSY68knemhCTLM3b5spvLKRKO8m61SytAP5llAxC1JytCjHEy0ES
   JWyNo+TdJDraG8RD1GAGmt8rdW/sFQLB5nk+gi+dCJLByfiOzu7V7SUSZ
   Sxyuijp3fgr9vRG8jhw382+JuNRHcF+FKRdjjAjOvLpMudq3xq0nDPa5C
   M6+ZkjUK3omEDxSv0M586GwRYZDo965FygRuAbXTiWgCGEwgrLc4bcz0I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9291539"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9291539"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096095488"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="1096095488"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:21:51 -0800
Date: Tue, 14 Nov 2023 15:21:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, mallikarjunappa.sangannavar@intel.com,
	bala.senthil@intel.com
Subject: Re: [PATCH v1 0/3] Use the standard _PM_OPS() export macro in Intel
 Tangier GPIO driver
Message-ID: <ZVN0bNduYm7UHP3s@black.fi.intel.com>
References: <20231113131600.10828-1-raag.jadav@intel.com>
 <ZVJHqrj5OzoWav5Z@smile.fi.intel.com>
 <ZVL5tMZLTDKNLfP2@black.fi.intel.com>
 <ZVNetJdEEuWMxl2a@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVNetJdEEuWMxl2a@smile.fi.intel.com>

On Tue, Nov 14, 2023 at 01:49:08PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 14, 2023 at 06:38:44AM +0200, Raag Jadav wrote:
> > On Mon, Nov 13, 2023 at 05:58:34PM +0200, Andy Shevchenko wrote:
> > > On Mon, Nov 13, 2023 at 06:45:57PM +0530, Raag Jadav wrote:
> > > > This series exports pm_ops structure from Intel Tangier GPIO driver using
> > > > EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper and reuses it into its users.
> > > 
> > > Yet you missed --base...
> > 
> > My understanding is that we use --base only for the patches with explicit
> > in-tree dependency, which this series doesn't have any AFAIK.
> > 
> > Will start using it for every patch if it makes everyone happy :)
> 
> For single patches it's not so critical, only for the series as I'm using b4
> to treat them as PRs, so cover letter goes to the merge commit and b4 tries
> to guess the base (often wrongly).

Understood, will take care from now on.

Raag

