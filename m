Return-Path: <linux-gpio+bounces-28003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0DC2FF8A
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 09:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10931881242
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C0C24886A;
	Tue,  4 Nov 2025 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xr47rKB9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0810116DEB3;
	Tue,  4 Nov 2025 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245116; cv=none; b=LxF1gMUecC952Zue640XKhJQmuxHiyZM+lcxvjfe2jkicSNNVya48hBQOd8opJG5qFiuxCR6ebjUEu5Mllove6hh5agBk0YcJGe/NNDrE95IOhDJY3Aj651vLt6AiI0SlYTARnTQmImyuphLHJZriWZI6HiWbRZ5rhessGZ3CKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245116; c=relaxed/simple;
	bh=NRPqpk454Svjw6JkLJ7dzxiZvAbGUo7w27T5zy4aPY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmRlrhzPfA37sUqf6KxxHSGdwReSTU7pq5xriVEwwK9JZhtvA9X7JGIG/4uynH8s3paBX0zbsPR9zIoyZrOAjy7ik04VnQdVRriOl3OVgfrlS0M/NxYgpcgR7yhdvodL8TB+BGcDfKXAEedzcbCxTi4Ap+rpCfRb5z2gK/RLD8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xr47rKB9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762245115; x=1793781115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRPqpk454Svjw6JkLJ7dzxiZvAbGUo7w27T5zy4aPY0=;
  b=Xr47rKB9vI99wudq9FTC07RH0k2WgM0y5pPUe8qTx6X6cHVwpP8vyDQ7
   yQMqvyPxXjaD8rMWEBndmu0N+1WzDVkFPDktYk11v6y57czjN3Nwf56el
   cLpRJFVMWeTBxobj0W+Njh6Q3LjV6soT4wUMvJONh/pmGD1e8L1tfHcxz
   K3ZgOT75kIwmOg1AGMSje54DW0QmIhrcRRriwS1TGw5ps0FRVZaD6R9sa
   BXCOtCqzprqilIguQXipc2KfUzooKUeMbVjYxRaboBI6+T7sJn+FkEIip
   4XLeGYYufYh2a5rnsidT6vjr9cZZFEtZUeq9Vosn8EKc0VQryT08prK3L
   A==;
X-CSE-ConnectionGUID: Im/FT1RDQRGdipUoDg+SkQ==
X-CSE-MsgGUID: 16V6Y++ERXecCT640sDmDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75782795"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="75782795"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:31:55 -0800
X-CSE-ConnectionGUID: YE6BX6aaRlGtLwiy1jlvEw==
X-CSE-MsgGUID: l6wvsBA6QwuCtkBerSi//g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187827704"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.146])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:31:53 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGCSE-00000005PFL-2EVA;
	Tue, 04 Nov 2025 10:31:50 +0200
Date: Tue, 4 Nov 2025 10:31:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] pinctrl: intel: Unify error messages
Message-ID: <aQm59ugqxlGEaimk@smile.fi.intel.com>
References: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
 <20251104052539.GK2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104052539.GK2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 04, 2025 at 06:25:39AM +0100, Mika Westerberg wrote:
> On Mon, Nov 03, 2025 at 08:58:27PM +0100, Andy Shevchenko wrote:
> > Unify error messages with help of dev_err_probe(). This brings
> > a common pattern with error code printed as well. While at it,
> > make the text message the same for the same reasons across
> > the Intel pin control drivers.
> 
> For the series,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>


Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



