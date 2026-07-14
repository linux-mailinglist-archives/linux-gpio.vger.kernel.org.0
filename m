Return-Path: <linux-gpio+bounces-40039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ofX/Hb/wVWr+wQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:18:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C57524B1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:18:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=a2LD4ttM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40039-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40039-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EADEF318CD22
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07C13EC2EF;
	Tue, 14 Jul 2026 08:12:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437AA3EDE63;
	Tue, 14 Jul 2026 08:12:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016728; cv=none; b=PgMRc+L2JnBrh8gBh0w9TxJZjS5uxqB/3ZD7qESUizz4FJXU6vTA4nir2ssFq/ansfBo7ep2KMaZmLvIjOURY87XWhKawuNceqHgBf0cGbaF/xKqWeogejrth3iVx1Pz7SS2MctwtDFk/pTn+T3jUKVUFQXHI26FqPn1oPAkwgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016728; c=relaxed/simple;
	bh=rfTOXgTDXwpw/9PssHmYPPTjvOKznc5I4kBnHY+qN4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIsGxK/xnmYNv4tnTgdCwx7XDf/W+30klkZVo/1V9iN8ZGXymF2RuN3TzjZSYqoP5Ur++Udpv6vp4TzA/+rxw8tg8mFpb1ni6m3worXBTX3NrOAtFqc3f6q+LqQBUYD0i8haToACV5x/anYWpkIV8COt2OLKGGkU316mWh4x5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2LD4ttM; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784016726; x=1815552726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rfTOXgTDXwpw/9PssHmYPPTjvOKznc5I4kBnHY+qN4A=;
  b=a2LD4ttM+YMyz3RDUGSvDmr/xkjA7QQG4Frr45iBd/FV2IZBfa2iULBn
   seY7LKvCPEtsFU/Ctb9fOQmrDQlYMgIgM5gFt1VCbI1yYEKPq/j0by7Hf
   RzU/gfPjRrq0cUSZAYAdhTLQQcWQonWyF4upYmp6t4AiB1eKtOW9JmSLB
   cYn5o6lyew/Gn1Zh3c5wz7pz/oYHW8531j6CrdnoBWHqG0h/T3pgxfolk
   RN2M/bllTJhZJOCJbNZPYn72+Du0gp1lcJYjZ2o5MPBPsugBI/RL/xdyf
   A9I8hI4g38cJXKOY55bT3nVGifVZ/t55J9UaqdbjjAt3IIB4HT8VPo6S3
   A==;
X-CSE-ConnectionGUID: /NL2A3nMT/alr0Ikf14UiQ==
X-CSE-MsgGUID: KtGk8KA8TNKeGaGLELY12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88456315"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="88456315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:12:05 -0700
X-CSE-ConnectionGUID: l7HM4br3RIO/0VjdUfEKEA==
X-CSE-MsgGUID: Qynqno7xTcmEHZVIqWSk4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="251844829"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:12:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A19711F8D1;
	Tue, 14 Jul 2026 11:12:01 +0300 (EEST)
Date: Tue, 14 Jul 2026 11:12:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 04/20] gpio: ljca: Drop unused assignment of
 auxiliary_device_id driver data
Message-ID: <alXvUWDNXqK1gb-F@kekkonen.localdomain>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <0ae42630bcf5e07ad7db5568f3e87a8196f69c84.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ae42630bcf5e07ad7db5568f3e87a8196f69c84.1784013063.git.u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:lixu.zhang@intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-40039-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.intel.com:from_mime,kekkonen.localdomain:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF5C57524B1

Hi Uwe,

On Tue, Jul 14, 2026 at 09:24:05AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly sets the .driver_data member of struct
> auxiliary_device_id to zero without relying on that value. Drop this
> unused assignment.
> 
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

