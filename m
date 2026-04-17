Return-Path: <linux-gpio+bounces-35207-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAxfN/3U4WnQyQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35207-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:36:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F054177A6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82A9530087C0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 06:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B362F9D85;
	Fri, 17 Apr 2026 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkllPCYq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916DD2BEFFF;
	Fri, 17 Apr 2026 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776407800; cv=none; b=VcwDUb7bq8y+x4+NJY8QTupL5RknQkCTQpSoAMGs4MJpOBqRMa43fGrwic3wMftY+cQWS64CZFXmXE0jvhN42PkCe+DNFYKDn5rttJo7hFzxFOIfaYPqn8zAZblZJTQwKQmTN93j4mPJyVMhu27PCa88jJ1ASjHlbe6fzpz4Tr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776407800; c=relaxed/simple;
	bh=HsWYzrj8gPtX8e728gSCZLXEC+FGdWtYnzZCr0sxSwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m233Z9n8taDSkn+TzdOh3Mw6SS0TX+Y869OX2+X4qCgY0yqP6e35HTyOtWmDaLbbbYYiC9BA9+Nt3hnCdSuabo8R4Fqt72R3JhsoSEscdz2/zuQvJte3NLTSWZDApTHIc8asGfpnOvhsDut2IpPaPF53yyVOi0Sdwvg0F9uwlWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkllPCYq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776407800; x=1807943800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HsWYzrj8gPtX8e728gSCZLXEC+FGdWtYnzZCr0sxSwo=;
  b=hkllPCYqbCOWPU6n8cy/K/j98YSy5tefnvsa3KV9pmtvcUipMgkJXm4q
   hfoNE+HER2E7+MHaEF7OXnICNBD1pXboUAC6inajQ1QfX077VurtUegMJ
   U53+fxAJ706QhfImpTLF64TUN5tRe4BMEBuaeeDrL6c9bgTr5+gIs8Sis
   ZdKw2PbQm/HHpumhBvacMAj2sRwkx8+Ems5UmvUsOjZmc9xwJTcGKZeua
   DWj8u5xXgLjPCNa/C98ecCob1rrvId60dnc7C+f6OXVdi+IP3/bEMito0
   0HAU1I4sN99OYTSWirnKCbpNPTXJiMJh8MhBJf41yjKd6lhlMV00gY6+x
   g==;
X-CSE-ConnectionGUID: /L08ajspQI6W4QGZjHv+rg==
X-CSE-MsgGUID: FvTmqySCTWCzPM0mdbOYrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81290578"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81290578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:36:39 -0700
X-CSE-ConnectionGUID: 7ES7TtaARWadXYodbokNqg==
X-CSE-MsgGUID: 5SZvv9XlRgWFrlmjDSfyvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="231209223"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:36:34 -0700
Date: Fri, 17 Apr 2026 09:36:32 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Deep Pani <Deep.Pani@mediatek.com>
Cc: Fred-WY Chen =?utf-8?B?KOmZs+WogeWuhyk=?= <Fred-WY.Chen@mediatek.com>,
	Lei Xue =?utf-8?B?KOiWm+ejiik=?= <Lei.Xue@mediatek.com>,
	Mandeep S <Mandeep.S@mediatek.com>,
	Qingliang Li =?utf-8?B?KOm7juaZtOS6rik=?= <Qingliang.Li@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	Yaoy Wang =?utf-8?B?KOeOi+eRtueRtik=?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Cathy Xu =?utf-8?B?KOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>,
	Shunxi Zhang =?utf-8?B?KOeroOmhuuWWnCk=?= <ot_shunxi.zhang@mediatek.com>,
	Ye Wang =?utf-8?B?KOeOi+WPtik=?= <ot_ye.wang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Message-ID: <aeHU8AIEeeqBY2ed@ashevche-desk.local>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-2-lei.xue@mediatek.com>
 <aSdBt937C6Cjj_8s@black.igk.intel.com>
 <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
 <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
 <892cb5455b0306edfb98b3c7df99b88c58e303a9.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892cb5455b0306edfb98b3c7df99b88c58e303a9.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[ashevche-desk.local:server fail,sto.lore.kernel.org:server fail,intel.com:server fail];
	TAGGED_FROM(0.00)[bounces-35207-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,collabora.com,vger.kernel.org,linaro.org,lists.infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 74F054177A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 06:02:34AM +0000, Deep Pani wrote:

> Any updates from your side?

Sorry for the delayed answer and thanks for pinging me.
Since it was a bit old thread, can you refresh the series (addressing what you
agree with) and send a v2 for review?

-- 
With Best Regards,
Andy Shevchenko



