Return-Path: <linux-gpio+bounces-34253-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGnBET1kxmnnJgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34253-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:04:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E93430EA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9633D303AA8C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDF33E5596;
	Fri, 27 Mar 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaomqVDK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB983E0C79;
	Fri, 27 Mar 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609359; cv=none; b=ig5DghOPmiaFF6AAhX6M7civeZ9RMmXXVM/O7MDk4WtlRT1xaNikNfpYV44C4G/M+tWQ/hoUkVL8zO3P/dAVK+hNEnctNmAjQu4q9vQVvNg62JPsZiUJMQdLz/SoTYbEoix8eJBndIfv9PcCoPQ900HhhYTL0/u5yZ8NQCqybT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609359; c=relaxed/simple;
	bh=0NyzZrG0ijup/rdGuwn2wtHzsPvpuLTdzFcqFpL0uww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUjGtZ0wliUl3X8B4syOdA7gTSUcFR/YUhgr19/yrTREPVeJVCj3ofahQwbWGSSdi2ZQtGtHVEg98nQwp1kJ2lQ6iLDgW7HirIMdsc6Q8hFuDHUG4kBETbGbvOAA0xcOvCHQU+QYiBEfddTuT20K42kjfY0Gj8fHuhbiAI3qfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaomqVDK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774609353; x=1806145353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0NyzZrG0ijup/rdGuwn2wtHzsPvpuLTdzFcqFpL0uww=;
  b=LaomqVDKvFOTi4SMMJxmHQxfBJkaWjDU4M+SkLn6ZvdTkCkXCeeXwwXH
   0Tyn8jhv11mKixwDAnwOUH1Mpexop4P6vsM8NsIsNFwev4ie0qi4H4fYs
   Hnj/qd5qztya9j9svMvS1z1DAMefZLFZwELLhdNyf8YeKsoSvEocGYZuF
   ewTneLvQYZb0XT6pRBBWb3eEMFXQ9u+YV1xz/XlZelsL2S3SCxiuTdame
   v7i7sCYLkOlx+6XFIUmhSFBJmLhMjtGvJfL0TZfe+HWBQTAIhu0BQlbam
   JLwz6hM7UH82awXqj2d2ruTTC1end224qcbRsXgWhQyfC79YzBeVQN4k6
   Q==;
X-CSE-ConnectionGUID: hgJiCbYhS/aOQ9hp9nFz8w==
X-CSE-MsgGUID: NUjh3zNjRPO9ZxNjXtA99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78275579"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="78275579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:02:31 -0700
X-CSE-ConnectionGUID: 54LjT1ZwS0SfeKId5jpAsA==
X-CSE-MsgGUID: 2fb0iEu0ToCGMuZHhpvPlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230057497"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:02:30 -0700
Date: Fri, 27 Mar 2026 13:02:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
Message-ID: <acZjxK-dZVijE7h_@ashevche-desk.local>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
 <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34253-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 7F0E93430EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:49:07AM +0100, Bartosz Golaszewski wrote:
> This symbol is only used inside the timberdale MFD driver. Move into
> the .c file as there's no need for it to be exposed in a header.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



