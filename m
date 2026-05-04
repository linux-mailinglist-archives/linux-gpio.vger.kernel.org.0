Return-Path: <linux-gpio+bounces-36007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFOyGOw9+GkxrwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 08:34:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F44B8F12
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 08:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A847630075D5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 06:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D2329CB24;
	Mon,  4 May 2026 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGd/XRBU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B579B283CBF;
	Mon,  4 May 2026 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777876414; cv=none; b=DPxCEDh8+T1BUdNJBCYKawnfoHoLKkN/OlxchLiRrHB12aerwBJoeXtLBsnGjzeSlJTKcGvwTRdY8R+D4WJQYE0fT9GSYHCbSBSr1hxJty4OyGYCp0pGkfm710s9oVG1Zhary9EOFDAzH+s2qheUP/67nEmK+bd+pqKFErAuhMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777876414; c=relaxed/simple;
	bh=Qc1hNRiJ0MUMcazZAndRA58GUbWn5T8Uba1vYnuZrr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwLrpftZMQrEBTQ/K1p28oVNgZvQcLUdEUK6lSx8i0gUeIXw3FDY+2qw24AWQFv5UUvHrzsUzii6TZl0WS1DHFLXARD8GsFt79KZ3StDnXFhu6UQgf6PKeH4rDbZOrJyoRsyTGBl1fqTHp+o/PgVNfPq74N0IZwT9frLlo8SbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGd/XRBU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777876413; x=1809412413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qc1hNRiJ0MUMcazZAndRA58GUbWn5T8Uba1vYnuZrr8=;
  b=nGd/XRBUrxK6emto3P/W4MlEz9/apjEPmdsTXIryjGK1ekNbXxndaR+B
   stJxrapIMjsOcYZZCo3sJ65+1vF6lu2AY+EEGVF6rbbzLG+vmC02HQ4U+
   3rZ47EWVeECZI9PIlUe5p6tAagdTJsCu74skbEoixED2zThYFUYOJJ7rA
   4fsMoVk0P8g1ZLp+QMYgOwcTzFICVG6uACWbujdX9qIGCj6kjTQqxRWuT
   5ZWMStshmNnORFXyBgPXOrQi/livNDSJ/MqZu1nnjTAjwKFf71xFsLu0t
   A98eg9mQchgvTsTwfIL178ILsp9zUPmhOxfKrOAozfhw0ABpQx6E+SRnc
   A==;
X-CSE-ConnectionGUID: NS39jxxZT4SybmKb0d/dWw==
X-CSE-MsgGUID: ahZX9HSvSOC8gX37DPjcCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78829976"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78829976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:33:32 -0700
X-CSE-ConnectionGUID: eXcZzIjPTfCZWuyqpU/kaw==
X-CSE-MsgGUID: 7QuJrlyATkC2MSQWE3M2xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="230829042"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:33:29 -0700
Date: Mon, 4 May 2026 09:33:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>, westeri@kernel.org,
	linusw@kernel.org, brgl@kernel.org, bentiss@kernel.org,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Armin Wolf <W_Armin@gmx.de>, mika.westerberg@linux.intel.com,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
Message-ID: <afg9t3acIMDkXWgh@ashevche-desk.local>
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
 <6f359bec-2525-40e9-9994-15b16fb82f12@kernel.org>
 <afHcUTi5QNq8LlIb@ashevche-desk.local>
 <c7fb45be-f53f-461f-b7a2-8298e5c7df05@kernel.org>
 <a42767b8-7a0c-4202-9132-be8fa65baabc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42767b8-7a0c-4202-9132-be8fa65baabc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: AA0F44B8F12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,protonmail.com,gmx.de,linux.intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36007-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]

On Sun, May 03, 2026 at 04:18:57PM +0200, Marco Scardovi wrote:
> On 4/29/26 13:01, Hans de Goede wrote:
> > On 29-Apr-26 12:24, Andy Shevchenko wrote:
> > > On Wed, Apr 29, 2026 at 11:48:13AM +0200, Hans de Goede wrote:
> > > > On 29-Apr-26 04:52, Mario Limonciello wrote:

...

> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> I tested it personally against both kernel 7.0 and 7.1 and can say it works.
> 
> Are there any news on how it is proceeding? Somewhere I can check the
> progress?

It is in the Linux Next already and after a few days or a couple of weeks
I will send a PR to upper maintainers to pass it towards upstream.

TL;DR: It should appear in one of the v7.1-rcX.

-- 
With Best Regards,
Andy Shevchenko



