Return-Path: <linux-gpio+bounces-31554-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ILzD2JLi2mWTwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31554-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 16:14:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1D11C5C7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 16:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B9DB3004693
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 15:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E1C3815ED;
	Tue, 10 Feb 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSQnuzSg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C9D374724;
	Tue, 10 Feb 2026 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736458; cv=none; b=cjoxXJhPZFg+gZOy+4yAz+CqvsUhz/2gRx7/0EIeYsLnXnE2U0k/YAVv86zw0NsPOpuSMYt7u/cf9X0Bcp36aUG+BpHtDTK+ykxwPv+2tjxhQ3m4Bos2qbNWwI4kmijzxvhaDLV9IsnkaKgQUsCyYblLIQ5CTFRpxdbVHjZGC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736458; c=relaxed/simple;
	bh=5XHstcK3GNmPCCnMCyYj61+dg73mEfAPf1RQMlNT978=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+wGropnpKZWPJKmR3p27aKG47OnVrpergeOvAoIU3K7FsvWVPYKoDDLXQ0c5lhvPwnqh8RaLkcPQTvg6hei3dOENsDzgVf5UZX7AwkpsPE3p9piV8V9Tv/V+qhMgDLoEuz9ZfFvc3gaLsFbpwET1pcZpoBFN9LULPHViQMHeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSQnuzSg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770736458; x=1802272458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5XHstcK3GNmPCCnMCyYj61+dg73mEfAPf1RQMlNT978=;
  b=OSQnuzSg5WZqJFW9A3B/2TlHUCGhhR4xdYEwcnexMzQOr7w2JVnGLYfe
   VcCZe4PEOJnJ0VrM4ZmzLnOB5W7PRV3IsHEkpgUWW0g/gRh6CExvibJ+Q
   grGKGqoDkzV5WrEC8LFmwMOdzAquitfP+9MPLtEkiGqUEhKBIQLPOQVNE
   Tl2h87ES70u+rz8y8gNDY7qPFru6eSuxlNiToJ9TUHw1Zs9wlxe4gwO6J
   NCy+7wG18t0rc6ntSTibCipCprWgFGCXyOIy2Yu13V4PGNGVBvsfmVtd2
   HxlrKqWG+oTj44jAOQ5/7R1XuJQ8WISjgIirz7NyCtOaJUykzsTMBz/kU
   Q==;
X-CSE-ConnectionGUID: LsmFXGVNQC6B3xsfHQMW/Q==
X-CSE-MsgGUID: U/l5H4XdTJObaefFa95t3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82505014"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82505014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:14:16 -0800
X-CSE-ConnectionGUID: PLTW0sgvRr+sZIyjb4ObHQ==
X-CSE-MsgGUID: 0j9FHxy/Qi2fCSVgALjwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211778201"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.131])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:14:08 -0800
Date: Tue, 10 Feb 2026 17:14:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aYtLPHmZTg8oFxfL@smile.fi.intel.com>
References: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
 <aYo60vooftdem4Lt@ninjato>
 <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
 <aYsMCVf1qpLSCXTs@shikoro>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYsMCVf1qpLSCXTs@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.alibaba.com,vger.kernel.org,foss.st.com,arndb.de,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_FROM(0.00)[bounces-31554-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84D1D11C5C7
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:44:25AM +0100, Wolfram Sang wrote:

> > > And if so, would be this series acceptable
> > > as-is then (modulo the better include-sorting mentioned by Andy)?
> > 
> > *From my experience it's not the Q "will they or not?", the Q is "when?"
> >  they start abusing it. I really prefer to hide as much as possible from
> 
> I totally agree with you on that.
> 
> >  day 1. Maybe the structure can be split to two? Currently IIO has a
> 
> I also thought that keeping some internal header might provide that
> safety. When looking into it, I didn't see an obvious and somewhat
> elegant way. Even more, I got a better picture of why Bjorn named the
> current approach "unergonomic". I got some ideas which look doable in my
> time frame. I will try going the full route, after all.

Thanks!
Looking forward for the rest, the cleanup is quite good, no added lines.

-- 
With Best Regards,
Andy Shevchenko



