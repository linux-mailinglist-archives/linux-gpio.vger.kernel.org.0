Return-Path: <linux-gpio+bounces-35714-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBNzHv/Y8GkLaQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35714-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:57:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A054885AA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E7F23087BC0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4F73C3C03;
	Tue, 28 Apr 2026 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi9K4462"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7B125AA;
	Tue, 28 Apr 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391604; cv=none; b=MnzKFj2js0J/IqJmJQpV6yg0ZdTwtdSl2OuyXCekrYwhK/9J17iU8tYwt2g7xgnyBG2iyJL1j4UcLpZszQ6XnLQP9/up1vdoex0YCtgCPtSVwzDzCG+cAzaKuD1ZNz5SbQ3NfXi3corAPLpkG7Arl/kcxRYdcDXDiQbWNv352Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391604; c=relaxed/simple;
	bh=JMt8H9iAMk6x8ihJgGd8qy1rGIfkjZMj9pTiUslgLfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaeNI9wz+31rzMb6B++tnzEURa7juWxyZwqc66LhexpxFeZ5lRQtNBOw4x2FYdYYCfawddUQsOv5nNNeXTJ8cMaJQtYVqBfIlyY+IMjPw8ernEe4jziM7JJimt/WDhmwDz5oRLCOxNgQ+YJgue0ORWp1MJUZ5Y5YL4e3eZD5+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi9K4462; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777391603; x=1808927603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMt8H9iAMk6x8ihJgGd8qy1rGIfkjZMj9pTiUslgLfk=;
  b=Hi9K4462NVgg9lmwSu5qKlBe7CrzbmDEvu0ICtTfHSDkAvu2vHhQlGoB
   uchyuKujG5ZCoT3PCcEKUOm+UmFXez2hnuWFVhnu18JMVTmYVvaJ2DAeT
   VN921lXGMb8IFo49HkrgRIW0ZuvcZLZ/ZnPKd0ZbF618oU9PROipJnWqC
   QPxgqOvv4qnK++NFm9YllrXOyasuijljCV9bk9jaRgmLRKlczAIJPaFiO
   Ctuyn7Yj+CtkS16VbwShKq4PG/SyBgoL7Q1HT0/e/5fGkXU8OJ96bLar9
   7wgIqGen5KtY1l5OMn1Rj7wWHb2UF+GQifqAVFm2MtXISu8M2w4mqxNG7
   g==;
X-CSE-ConnectionGUID: RlIHUVHjTfOmuFrE2lto2Q==
X-CSE-MsgGUID: kjDuego6R4CSYEqJJX0IDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78323095"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78323095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:53:22 -0700
X-CSE-ConnectionGUID: bblyab2ZRMSKiRwhs3bZkA==
X-CSE-MsgGUID: kg7dTy14Q0iA8y8QJSZlNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="257309931"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:53:19 -0700
Date: Tue, 28 Apr 2026 18:53:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: move legacy interface into linux/gpio/legacy.h
Message-ID: <afDX7WabVPVce4kc@ashevche-desk.local>
References: <20260428154522.2861492-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428154522.2861492-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 25A054885AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35714-lists,linux-gpio=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]

On Tue, Apr 28, 2026 at 05:45:07PM +0200, Arnd Bergmann wrote:

> Split the old contents from gpio.h for clarity. Ideally any driver
> that still includes linux/gpio.h can now be ported over to use
> either linux/gpio/legacy.h or linux/gpio/consumer.h, with the
> original file getting removed once that is complete.
> 
> No functional changes intended for now.

But I'm not sure why. The idea to kill gpio.h completely, no need to keep it
longer than legacy stuff exists. I don't take 'clarity' as a good justification
here, since the old header are still there (however just a shallow wrapper).

-- 
With Best Regards,
Andy Shevchenko



