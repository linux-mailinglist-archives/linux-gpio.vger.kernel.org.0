Return-Path: <linux-gpio+bounces-31843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPm+MELBlmmzlwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:52:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471815CD1D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77CC8300B449
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B860D332EC4;
	Thu, 19 Feb 2026 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W35kfMZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700433254A6;
	Thu, 19 Feb 2026 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487549; cv=none; b=qhoIRSuF66LxbCgPCNRr4x1/+4hw74XE4fJAqyXZSf7CTG9IpW67OvcZpxP9YNPHe174HaAec4HdNmGucacqRjdawlOHi+gJwP4L/2c9F8DRevGapeI0E3Xivnq9ZcgD4AWjOs2Luy7IM1SW/EzcaFCsBSED5REU1faN2LNcvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487549; c=relaxed/simple;
	bh=TrI9YhEni0imOcWCGxOjyXuIpTO2mZu8aihX11q1nak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4y1+3xgUXVQtAAGH7bYITa35na/WN4gcv2fDRM1Ai3JhfCV+gc+Ga86WEHidXEdYFTsN3T6iJVywNY4zth1NtIT8O/IO0Bzm+Hd2pvMhtA5ujf2SbKsLCwB+7Uv+HR6cAQ0WAJy+oV6v0o6DvBotBPjmL3wgVEnNu1XyPZ4Mpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W35kfMZ6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771487548; x=1803023548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TrI9YhEni0imOcWCGxOjyXuIpTO2mZu8aihX11q1nak=;
  b=W35kfMZ6eeVSlMUr3ug+T5jUwbvN4PvETumOj9bDibihSCHKd40yurhG
   IcyNXq6DZXc3dmsMVpFNZvkV5ZFDM/4whNdauLgH7+cMNxhmDIrfnpYn9
   eHXqIXqfaxY+Rh9szRg3SaMVHu4zhMz9f3tzU5vDbL6pIDz31GBueN6UV
   qCm6dWCxdANl13gIc8oYzsmgTAo1iZF+s3Hp6DkRu/t4xux9Pc63t8GOj
   hYqXOZEZMwenidHl8SGBsKy06tMtOHDjQJ5Aj5DwsNesj/7K/MllL9vIY
   rAGjlCIf1ud+iyecKTOcYBzMPes700T48jh3MhjVB0d2RtgiPYBNaBr9U
   g==;
X-CSE-ConnectionGUID: u9qJl6fpRRSaVKXWv91Wgw==
X-CSE-MsgGUID: LCkF+1RnQYW0sPFRpqRyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="90149633"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="90149633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:52:28 -0800
X-CSE-ConnectionGUID: IBSUlyFRTK2TeQW26ksGCw==
X-CSE-MsgGUID: jGXnlIRFS9WA9FPw7Ue28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="245042921"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:52:25 -0800
Date: Thu, 19 Feb 2026 09:52:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] iio: adc: ti-ads7950: normalize return value of
 gpio_get
Message-ID: <aZbBNtjFDU8KL8RZ@smile.fi.intel.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31843-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4471815CD1D
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:29:25PM -0800, Dmitry Torokhov wrote:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by ti_ads7950_get() for output
> pins is normalized to the [0, 1] range.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



