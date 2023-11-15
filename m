Return-Path: <linux-gpio+bounces-85-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304D7EA9A9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 05:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9C61C209FF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 04:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778146FA9;
	Tue, 14 Nov 2023 04:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNC2Cq+H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81A8801
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 04:38:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE103CA;
	Mon, 13 Nov 2023 20:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699936729; x=1731472729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ohzo45t/HD0va0rMadusXfp4O2Je7Z3oQh5TAr5oFZQ=;
  b=WNC2Cq+Ht6eDp+FXa1b+DnH6hmQZzgdrI1yAgS+AtT5UyOzmFScGYS5x
   eUm4q1Tftu9uMQwRmSUdM8IsIs49NLmPjla2lWuhulVkMabqD1s2t13Gh
   Fxz+teiT5JVqFiUqTNqqkm2LYDSQHA5mSxMSU8+jIVtOcUEsWiXCdWGnp
   7x3BNcQ3txbPtI00mlY2Ze8yI1hqY0aC6WskqT1XvkAP6cfUWqYk/S1iU
   G9ExiC/uVCJs4YJPexlhIrBTXeBfL36U70XalJxtKfa/9XAPvPAIToJ/9
   XHVfzwtNmUZit7vOBofQ9SY4kzVY5CAIZ1bgx+bssngx43d6FCgTn9ky0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421676432"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="421676432"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 20:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="768133012"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="768133012"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 20:38:47 -0800
Date: Tue, 14 Nov 2023 06:38:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, mallikarjunappa.sangannavar@intel.com,
	bala.senthil@intel.com
Subject: Re: [PATCH v1 0/3] Use the standard _PM_OPS() export macro in Intel
 Tangier GPIO driver
Message-ID: <ZVL5tMZLTDKNLfP2@black.fi.intel.com>
References: <20231113131600.10828-1-raag.jadav@intel.com>
 <ZVJHqrj5OzoWav5Z@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVJHqrj5OzoWav5Z@smile.fi.intel.com>

On Mon, Nov 13, 2023 at 05:58:34PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 13, 2023 at 06:45:57PM +0530, Raag Jadav wrote:
> > This series exports pm_ops structure from Intel Tangier GPIO driver using
> > EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper and reuses it into its users.
> 
> Yet you missed --base...

My understanding is that we use --base only for the patches with explicit
in-tree dependency, which this series doesn't have any AFAIK.

Will start using it for every patch if it makes everyone happy :)

Raag

