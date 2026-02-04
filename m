Return-Path: <linux-gpio+bounces-31422-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPBjJ9v9gmligQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31422-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 09:05:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8EFE2E97
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 09:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E7B930305FD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 08:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D434C366043;
	Wed,  4 Feb 2026 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYq0RSjW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8F34BA21;
	Wed,  4 Feb 2026 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770192339; cv=none; b=V2OO3rhnWuDrYTfSJw1dRPOdQPcMIs5tIjQ3lVhfom8B9+Q1ABBa+X7VggqP5uB4AxxdE8FPpRUqTbGrnGccsSO3qrzTqr1VcM3FYPO188ksviHmZDcYKB2DOJPk03ODErt1eeAMgYqsYuwfdIO4Hm1QWdX4Dgrv195iBwsm+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770192339; c=relaxed/simple;
	bh=DDwHMOsMUXm6WJ1FhegVa/SYna+oMCYrxCy4oam8+74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHpk5p9aAQHQjKWInKWDGGf31mWvZEKj+WN+bQSUhn1bWtcEqBbRbZQJOMc9tySyIeWpDFTRrYZxAdToSdPswU3ZlT6osFfpZpCR3uPx8JbIkVd/csFUrBpO2Bu5eLHGaOzI473irOU1hrg6EDRbBCh/3z9ZGB6zMBG027cNXEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYq0RSjW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770192339; x=1801728339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DDwHMOsMUXm6WJ1FhegVa/SYna+oMCYrxCy4oam8+74=;
  b=QYq0RSjWD4FhlgnOnKnw806JzzMCU+39au+5fMTdwjmM5WJgiK4o68+3
   B6/LYwD+k6iGuPVFsiFWiFjAbdPCiNigm7a3ZesdRA6Yn6ibvSag7Enqo
   0v3WsvD7PETcnA26OCjD560tVWvppS5jCO5Qe4C4JjHh5YD2raI52xDc4
   NSMdo8t+eP+iURkEHQd29NkOZsXk7LXLyY0YqF3U5lz8Oazu3YKspTkLq
   04rAE61X/lD+ypzPtH36OY94xo36fkqZJJ/Koh6rGDzE8Qcl2Lay4EbUd
   9adXO0yz5/MgOZ6gTpul+53bGeK+P87xJjCxQbH1IxsBLWfa0FmVyGmr7
   w==;
X-CSE-ConnectionGUID: 0FxopFcgQt6f/AaZj/jgNA==
X-CSE-MsgGUID: cg+kNalkQXK15h39DbzBkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73974812"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="73974812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:05:38 -0800
X-CSE-ConnectionGUID: gieHYdZRQuSMnX4Z5OrgTQ==
X-CSE-MsgGUID: ZLpUHnB4SdKCro4KdvDuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209473784"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 00:05:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5881F95; Wed, 04 Feb 2026 09:05:34 +0100 (CET)
Date: Wed, 4 Feb 2026 09:05:34 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYL9zgEyCarrluvP@black.igk.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31422-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: EC8EFE2E97
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

> > pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> > function, and really belongs in the amlogic-am4 driver. There are three
> > reasons why.
> (...)
> > The other dt_node_to_map implementations accept a being called for
> > either a node containing pin configuration properties or a node
> > containing child nodes that each contain the configuration properties.
> > IOW, they support the following two devicetree configurations:
> >
> > | cfg {
> > |       label: group {
> > |               pinmux = <asjhdasjhlajskd>;
> > |               config-item1;
> > |       };
> > | };
> >
> > | label: cfg {
> > |       group1 {
> > |               pinmux = <dsjhlfka>;
> > |               config-item2;
> > |       };
> > |       group2 {
> > |               pinmux = <lsdjhaf>;
> > |               config-item1;
> > |       };
> > | };
> >
> > pinconf_generic_dt_node_to_map_pinmux() only supports the latter.
> 
> This alone is a good reason to apply the patch.
> 
> I have a strong urge to apply this already for v7.0 despite its RFC state.
> 
> Anyone against?

Quite the opposite! I fully support unloading pin control core from OF-centric
code. Note, please, remove extra '.' (dot) in the Subject.o
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



