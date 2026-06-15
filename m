Return-Path: <linux-gpio+bounces-38431-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTGYMmKBL2qDBgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38431-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:36:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 245436834C8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=B6GVPNzL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38431-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38431-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61A26300A8D1
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24138301493;
	Mon, 15 Jun 2026 04:35:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3945305692;
	Mon, 15 Jun 2026 04:35:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781498141; cv=none; b=QJDKpNaZqjV3iOxPZ69/SFSpaZbzA3U+zMCUJ6iltgfPPdLdl3Q08dVu9HVmEJpf7fIXVQWCHOKqZhfOOIxJJ94rxqhneDPCI5UPNGhCnOAuINQg0Hwj3bp17D0buKnAnRuMX9zbFfkTrEcYHQwEpGDt5z26EEGt0s+YoEZb1FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781498141; c=relaxed/simple;
	bh=yfRH7RprFbObRlNDYkLQ2uHKQDVz+sEkfWGjmv6Ens4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEjkWF5VkHnTkX0589xAT3l/knFNmI3ujRsUtIIv4sQbNB9GB1sHuFATpEcB+fDe+02QJa/FNDi2KiDxnAstI2PEwqSRttUmXURtEdHN96FgScWw6yffqSPP1nztvlfSc3CZzGRkQyQ2jhQ2J0Uj8hcasYTUpkAYD2gjf3lyKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6GVPNzL; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781498140; x=1813034140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yfRH7RprFbObRlNDYkLQ2uHKQDVz+sEkfWGjmv6Ens4=;
  b=B6GVPNzLK41Hdu/NQjPO49iAnrP6j018Y7P6FaC4o4kQsqxbOt5HZ45G
   OT79E7Olg3ncY2NzkuxJIro7z2S9BSjZAc9KwbEuV/h6q4MSgk1l2pfY/
   ki64XL4k1if+NI5G/EbYwPr+ykp2m1ykcTmnJ4xS7DaFSGhMZrkFD7cqc
   pcGX9PJAS7CsqJ7nmeenQWs8iMlXj5OsC2MdhoOQSnqj27j4rmCzajCdU
   AMltnKxNbatcj73khCfM38kdTdq+dwrhkf1vTf6i/n5nSBlpgAro8dpiG
   9ZYVEmlPuMgUCffx/raYFP2dGFwVl0ZvAIp2IDIvBOyiuqMiEx9fOcMiM
   g==;
X-CSE-ConnectionGUID: 5UhjSNDISle6Uz999tUDkA==
X-CSE-MsgGUID: PqovoLOAT86tVa2KywLxNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82294980"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82294980"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 21:35:39 -0700
X-CSE-ConnectionGUID: uXblxUB2RIWqSYeRtaH7lg==
X-CSE-MsgGUID: naHHem3kQ36Sh29TPMRgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="242996470"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2026 21:35:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1137E95; Mon, 15 Jun 2026 06:35:36 +0200 (CEST)
Date: Mon, 15 Jun 2026 06:35:36 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <20260615043536.GZ2990@black.igk.intel.com>
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38431-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,black.igk.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 245436834C8

Hi,

On Fri, Jun 12, 2026 at 06:13:31PM +0800, GaryWang wrote:
> Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> 
> The pinctrl-upboard is provide additional driving power & pin mux function
>  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
>  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> 
> Signed-off-by: GaryWang <is0124@gmail.com>
> ---
> Changes in v2:
> - Add brief introduction pinctrl-upboard architecture in cover content. 
> - Add more detail explaining for pinctrl-tigerlake commit message.
> - Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com
> 
> ---
> GaryWang (2):
>       pinctrl: tigerlake: add some pin groups and functions for INTC1055
>       pinctrl: upboard: add device id INTC1055 based UP boards support

Both,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

