Return-Path: <linux-gpio+bounces-39563-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MXt5DTuyTGo5oQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39563-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:00:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3276718CE7
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:00:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mD6pE4Oq;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39563-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39563-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 518F3303B58E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 07:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202AA387375;
	Tue,  7 Jul 2026 07:57:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9842F0661;
	Tue,  7 Jul 2026 07:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411063; cv=none; b=AtNG5LG9V3y8uSd2p8VGmRvYGAmUb0lxDNz55iQkSuf0rN8npleeqM6KaEXEs0KaNKfLvV5Za3ySdE/vUWsUIhb7YpJClZ6FJlKUmWq9yyXTiiSgKsnuYs53O5E0c9fJOJiRsv7SInrYcZ4EsLcuBD24nMe20hm0a9BCqipkJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411063; c=relaxed/simple;
	bh=fhVsQgZpEtOHcCVdgw2Mnnouie2yBxLY+aHerA5Kjes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xky8xdvDNS9Dnno91j7TwP81dMnk5f8TJEHSNcxiyFSZVtOIDYacNoj/UNtY1jHD66wh0+pKtobes8Fiv39qsySoI3ggWH0GdozPWf9m/6KZ7+HgRsv2g42tKys5Y9x81M07+Leyu5KuBa84LZrmHRS0E+vN+g1xOZFOEUNnXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mD6pE4Oq; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783411062; x=1814947062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fhVsQgZpEtOHcCVdgw2Mnnouie2yBxLY+aHerA5Kjes=;
  b=mD6pE4OqWuAnySFIF1+4bUR4zmGJjaoqMU39ZmiF5viy/lTffuE5Ocyg
   HnQlGE629Y6r089K73AJDtCb8DPKZbig7IcuF5CnvRMSBkd8qckgn3vaw
   1qRdFH/hpL89NmXUbgmNIbNadL6m5bp1wNt8T5kJNOTNOCDiLeAI+XU1M
   7A8nSMs1NtMEsQS65OzgupHQ0oqSDSNZc4lVCNwnmu6pstoAR8BNW6MVa
   rHACrgAhWSN5r59O+iuga2gfmHW2Ufu1YOervQADyGpJNNXwjIsTbGtdI
   7U6yUxUP2sPNKLJY3vu83ZMv0zKKbLaTCR5g3ZjuBScqHeYAflpMFwnwY
   Q==;
X-CSE-ConnectionGUID: N2JiHUY0QyGOuWy0wIF0qg==
X-CSE-MsgGUID: ju8UlahiTmuaQ8n7MXkynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83028712"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83028712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:57:31 -0700
X-CSE-ConnectionGUID: Q3rftImfTt6V5zB4LeF28Q==
X-CSE-MsgGUID: ovKA5NWqQHqtoOhU1y+fSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="292095574"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:57:26 -0700
Date: Tue, 7 Jul 2026 10:57:19 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Message-ID: <akyxXxtj8nyCs-yf@ashevche-desk.local>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
 <a00c475a6ce0469682305c4b4269b181@realtek.com>
 <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39563-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:eleanor.lin@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:tychang@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,realtek.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3276718CE7

On Tue, Jul 07, 2026 at 12:24:16AM -0700, Bartosz Golaszewski wrote:
> On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [林祐君]"
> <eleanor.lin@realtek.com> said:
> >> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:

[...]

> >> Applied, thanks!
> >>
> >> [1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
> >>
> >> https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
> >> [2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
> >>
> >> https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
> >> [3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
> >>
> >> https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e
> >
> > Thank you for applying the patches!
> >
> > I'm currently working on v6 of the patch series that incorporates Andy's
> > gpio-regmap patches, and it should build on top of gpio/for-next. However,
> > I have a conflict with the driver patch that was already applied.
> >
> > Could you please revert that commit from gpio/for-next?
> 
> Can you just post the series as a follow-up? I try to avoid rebases unless
> absolutely necessary.

Would be just leading reverts in the series appropriate? Otherwise it will give
a lot of additional work for peanuts.

-- 
With Best Regards,
Andy Shevchenko



