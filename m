Return-Path: <linux-gpio+bounces-31901-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOkbCENkl2kmxwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31901-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:28:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57448161FEB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B0F3012BCA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137EB306498;
	Thu, 19 Feb 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wnd5YSoO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C248F35977;
	Thu, 19 Feb 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771529277; cv=none; b=JMqNyT6wp8nd5Vjgj2fcoOk7Alr6/Kf16O9v5Bm8G9VJY7vZ2eq5DOAACrENSidSdFPHVhhBeng9hnS2mcs9PsorqhmGKwA1hacYQfKLmS59H+HruFeG/JltGymbGwLpecglgv8Pqo3c5b5b/rfOpC8StM926UKdbva/TLnH500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771529277; c=relaxed/simple;
	bh=6tdxTOqQ9EBkt/TSq4dXOlK1C+FYCD1bFcVEFXK9PHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRqyVF35a8aLMapNTCuWRlfxIrhZck3mmSKAnyo0DO44g/gs3U0rMiO/u9bBW7ExPg2JcfZ0qP13IZq/12HJFtvGvhR8l5E8dMnIGWaqUTLoY/3mLddq+Jyde73z/C+9t0Vm+blWP7Qi1V66Vw3hHv/TRycCbUAsmlwYYPyLKsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wnd5YSoO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771529275; x=1803065275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6tdxTOqQ9EBkt/TSq4dXOlK1C+FYCD1bFcVEFXK9PHs=;
  b=Wnd5YSoOcXQibvhodg3Jn687q/mylXINjB7dZGBIK9OhgxFH0NQ4zu/O
   ahTRKJk8dvCXEWI3F+Jt5MyQ+dKSYno3sy+wy8bErB7g4mAKV+/6oDoXU
   +TfYcdfqarVDivHpHrEU6jp+CQbi/lcFO3Dx7RYmnXEe0Lwwk0SLoKgAf
   F0ItBl3ftbuaVROejkD0RdUdqK+CVzuRLG4w9zmEuBpTvpAZ0HSrAZ6le
   NsSCwBlU5d8h0ZepUkYIiAI4b0EcjCYr6+8QqWWnPSHQarAYKszLB+VAc
   C53IKnm9qcFfK82rtvsiGEIw8TEGV6QKP2caQOfPL05k78d6cui+wfmIV
   w==;
X-CSE-ConnectionGUID: t4v2y2PlROyWRjyjec+few==
X-CSE-MsgGUID: d6Rxyo74QrORCZvjtixqJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83343042"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="83343042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:27:54 -0800
X-CSE-ConnectionGUID: 7/q4bQYWTNWxTIQv4BFsCg==
X-CSE-MsgGUID: coIDv98CRHO6vN5fpQA1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214744421"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:27:54 -0800
Date: Thu, 19 Feb 2026 21:27:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZdkN2zje5CEaar_@smile.fi.intel.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,oss.qualcomm.com,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31901-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 57448161FEB
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:55:20PM +0100, Danilo Krummrich wrote:
> On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:

...

> Also, is there a reason why we need both device_match_fwnode() *and*
> device_match_fwnode_ext()?

Yes. We don't want (at least for now) to dive into bug hunting in a 2+ years
horizon if something goes wrong with [currently] working drivers that use
device_match_fwnode() against the cases when there are primary and secondary
fwnodes present.

I won't put my bet that extending device_match_fwnode() won't break anything.
And I don't want to invest (waste?) my time to learn each of the existing cases.

The proposed way is robust and safest. And for the record, I will be the first
person to push back device_match_fwnode() upgrade without a comprehensive testing
on real (affected) HW.

-- 
With Best Regards,
Andy Shevchenko



