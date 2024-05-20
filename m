Return-Path: <linux-gpio+bounces-6471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD088C9A78
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 11:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0D51C2140E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 09:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B11CD0C;
	Mon, 20 May 2024 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IM22dIZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549817C67;
	Mon, 20 May 2024 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197903; cv=none; b=TudHRwA+2ia1O24nb4xW8n71Yp6NOeLA7LQqxnbrBWrxeEv6MWgkK9LOVIxc4urFmZBPQuzuI/5PMpsVUwtJQ1eZze335NO7qyOO1bTvn7oihTYWPuDJl05ylz/Sv3fRzqyU5fJUxt+/FQFSgS0JvV9IqPffL4FFRladvxdUSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197903; c=relaxed/simple;
	bh=7vN5e/K1La2b80PJh96PuKYdGFVnT4q1dY7sER0cMbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGnxEcUcCxEMwSenYsytgzlR5MIJ5lRtKPMz4rPeN9Qc6KfC4ZJ283Tj5q9N/qw4eWTZ5d7ukZxHNsiHIbCB5f0imYVhnYdq12vcHKiZ6JyETnxU4F6ALe3WfEDaz6cMazJwcsegIyUqVUmo2jI/lKfWYyMgqy5tSNWmjdMLaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IM22dIZi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716197902; x=1747733902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7vN5e/K1La2b80PJh96PuKYdGFVnT4q1dY7sER0cMbA=;
  b=IM22dIZixnzDuLlwn960Zw1uLSg4oC4fw3qTz61iwYODfFcQaKECN5rE
   KvZn0EneRMzIz1EU7pBa9pnso2rkfpR1j7p4ad43KNUi3aGA3Df4ttnBu
   +LvMzWBHBxMHNZTaobHDYeh31VdnJ8N/qYpEWdK4oWWP9N08KAI8B57CK
   TgUNHj7kueQ8sqerm0X7xELkH8IVycCLSxOte9epMaNziWK85hI8GPcbd
   5JaCpcdXARhblHkzIeDOi4ieeVtFLQkRovBCespNQVPOE78HkZO5JrTw1
   yzeaJ3/zJveNlzp+2dkXQ3zLCmZEPB/zQ18sQPuttzFizaqJsG4xwmb5R
   g==;
X-CSE-ConnectionGUID: A/QmbHg3RGejI5GCofHv/A==
X-CSE-MsgGUID: CyfJcm+pRJy4+kwyD9Otqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12113493"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12113493"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:38:22 -0700
X-CSE-ConnectionGUID: HVYRY2VASlW/L1solPB1jg==
X-CSE-MsgGUID: u8prfVkOT72xkMMf/eGpyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="37296745"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:38:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s8zTE-00000009GRh-44IK;
	Mon, 20 May 2024 12:38:16 +0300
Date: Mon, 20 May 2024 12:38:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
	Basavaraj.Natikar@amd.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Kieran Levin <ktl@frame.work>
Subject: Re: [PATCH] pinctrl: amd: Set up affinity for GPIO lines when
 enabling interrupt
Message-ID: <ZksaCG3Q5qHthNcN@smile.fi.intel.com>
References: <20240519124109.1523-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240519124109.1523-1-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 19, 2024 at 07:41:09AM -0500, Mario Limonciello wrote:
> When a touchpad's attention interrupt is triggered on a different
> CPU than the GPIO controller interrupt multiple CPUs wake up the system
> and can cause higher power consumption than necessary for operating
> the touchpad.
> 
> Waking up the additional CPUs is especially unnecessary as the
> irq_ack() callback for pinctrl-amd doesn't do anything.
> 
> To solve this save the affinity of the GPIO controller interrupt when
> it's set up and assign that affinity to the GPIO line IRQ.

I do not much care about AMD :-) case but I think this is quite a big hammer
with possible undesired effects. It will basically put _all_ GPIO IRQs on
the same CPU which may slow down other peripherals, like UART, with potential
of buffer overrun (on the high speed modes).

Ideally it should be done in a way that exact consumer may ask for this from
its driver. Yet, I have no idea how to achieve this, but it would be really
nice to have something in I²C HID to

	set_the_same_affinity_as_parent/GPIO_irq()

...

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

You can move these (Cc lines) to be after ---, that they won't pollute
the commit message with the same effect made on email, i.e. Cc'ing to
the listed people.

-- 
With Best Regards,
Andy Shevchenko



