Return-Path: <linux-gpio+bounces-37795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLXQBbKOHmpGlAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:05:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78162A1B9
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 10:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B5F23075403
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507E53B83EC;
	Tue,  2 Jun 2026 07:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2aF08p8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172BC2C029D;
	Tue,  2 Jun 2026 07:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387076; cv=none; b=svCPTJWnXjvGkni+WVWBgh52X/2XllAA4IopZO6h6Na6xKF2C6d4idfJ64PxR7WF/f1OYFLkOnJ0GcdI3jWi7EVHYeZKVeDW1dncM38RAUnDM4VhXx6qjI3uD8rqeuJgqMTGvq05yTDjTcxGI3UYCTg09kXaV8rNgbxzc9GiZkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387076; c=relaxed/simple;
	bh=bBKiNNyBzJltkvW3PgKnrj2O7lyxZd1trFgrP36YX1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy6/o3BLXfXvqztxdZHAtCpEyTdVa/e9deNcwWvXrEpw1UVbrkbnHq5VPzOkwIJwldIT7xNbLBIwUhHQ7ZzdrKlp3XloCrDkYhxYmA3t2SQGEGVMOOK6CUlD6wVUqpG1Pa07U+I2MOKw+FrlkNq6+TNXI2x0mLutbcGGIqWn+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2aF08p8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387075; x=1811923075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bBKiNNyBzJltkvW3PgKnrj2O7lyxZd1trFgrP36YX1g=;
  b=l2aF08p8q0r8oGLw3XjKKKSVrP/Ti0BmhVSqWRio7/i73Q42TzbEQsl1
   RtYk0bpbzmXMmDGFqDdDu1/0jNRuMR9UQ+0nBXqUYsP6i4O47zOnq8uM/
   YQUGPG8cn6hODmeS5NbyRNZX69+A1uu3LVGat/R9qNPrRy5HPqimBpBVK
   mWgfTj31Gal2kHuQa/gnChnUyIcSQP6imDPkAaf1SpoM98A4+r9NoBNa9
   5mZ91EpkhdHLD+gPMr6W4WG8S3i47G7NPbZ0WpeBylpmfHacttP3o7yoe
   Ith/WAcx06PJ20USwfi8rK1YmL8kVqLb+Lzp3VY6bGGp0YfrNX21AxqH3
   A==;
X-CSE-ConnectionGUID: FvPG1bzdS56vpA3RgDskjA==
X-CSE-MsgGUID: 2U8EU18rS7mEfpVmIOTcQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91851443"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91851443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:57:54 -0700
X-CSE-ConnectionGUID: 84CDJKt4QuCgWYlI8dEZiw==
X-CSE-MsgGUID: pEMs7etkRPOv3y7vAyLIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="239666291"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:57:52 -0700
Date: Tue, 2 Jun 2026 10:57:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marco Scardovi <scardracs@disroot.org>,
	Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: Re: [PATCH v4 2/4] gpiolib: acpi: fix resource leak in OpRegion
Message-ID: <ah6M_vEIREG0w_mV@ashevche-desk.local>
References: <20260531120816.17255-1-scardracs@disroot.org>
 <20260531120816.17255-3-scardracs@disroot.org>
 <20260601121815.GS3102@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601121815.GS3102@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[disroot.org,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37795-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 6D78162A1B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 02:18:15PM +0200, Mika Westerberg wrote:
> On Sun, May 31, 2026 at 02:03:09PM +0200, Marco Scardovi wrote:

...

> This is really complex solution to a problem I'm not sure that even exists.

The problem that potentially may have an attack vector is the malicious ACPI tables
(via SSDT overlay, for example). So some of the validations (like pin index in the
pin list) would be somewhat useful.

-- 
With Best Regards,
Andy Shevchenko



