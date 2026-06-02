Return-Path: <linux-gpio+bounces-37809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCyEN7ysHmq3IwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 12:13:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4236F62C569
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 12:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 503CE305092F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 10:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC6C3C8C70;
	Tue,  2 Jun 2026 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhRZ+sFo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53130EF89;
	Tue,  2 Jun 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394659; cv=none; b=QaHTtpY/2LZzFuaF2ASQRnVdvX1qGwwRPpY0e8QQVxzc5Em7I1Gcp8+CxGeePnLMd5PWtHzGnfdzvLeNG8xp5S28BL6TjXVDnnAY37b3Nw2qrRQpv0F+48NF6QRhkCy35VR/R1r9mMfnjvXoezg157TS0Dl+THydYIX5SCIFaEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394659; c=relaxed/simple;
	bh=YdPwtikXRDaKpAOURi931IMQBXVu9ZmCKgykjG/ASVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7IUYsZQtEheYzJONf+o/6gNcKkeQKi0Bd1fQKykL/ZA3hhl2sMjvUqoo9iiRc/Ajzn+z7fyKQl5LA0hrNQXM4mnCFVFpdvL8v7Kr9zUgoGPrA36xJB9KLy/fIy7D8nyIa5WWhZ0LIuK7CDM5fnKd5oDMlvqwlvlXh86YgkY3fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhRZ+sFo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780394658; x=1811930658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YdPwtikXRDaKpAOURi931IMQBXVu9ZmCKgykjG/ASVA=;
  b=RhRZ+sFogQAhBasN5PvZxVe+Lirc0L3e4+Q3LykQx4JdhtdgCsUdGxIb
   /Bby7jQwNQvNlENkKHbFHAOB98bN39u8p7MbhRy5cgp3l1fKbZEl1mv/6
   h9PrpveFQBD9bwVNau4RVA7U1HP/tp7LwIGy9MFFN55V215E5EXTJjJ8G
   qgULHzvR3tHNoXrjpUFW/OvwXJlMnya+3Sa5AqpeoXf2Jx3Y/OHYqitZY
   3qHBPUp9/uIQ0kNDK66nuT/IuL6uP4y1fDxXb1CjFTIp5rEuITaV2jTmb
   kYDMaXSNiZa53E+AZh52LqGy+6UwAgy2U3fg8o4bkiatRzh7blND2RrPe
   w==;
X-CSE-ConnectionGUID: Pv2dGPB9RLqskjoz6Oo+Vg==
X-CSE-MsgGUID: F5FNRG7fSG2XhvGtRrSL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91860368"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91860368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 03:04:17 -0700
X-CSE-ConnectionGUID: w/1ggkKISzKwlP6E1Ef5Wg==
X-CSE-MsgGUID: dTroBSPuTpK9ONqmP5wXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="267510766"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 03:04:15 -0700
Date: Tue, 2 Jun 2026 13:04:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marco Scardovi <scardracs@disroot.org>,
	Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: Re: [PATCH v4 2/4] gpiolib: acpi: fix resource leak in OpRegion
Message-ID: <ah6qnf9ij6Fu967D@ashevche-desk.local>
References: <20260531120816.17255-1-scardracs@disroot.org>
 <20260531120816.17255-3-scardracs@disroot.org>
 <20260601121815.GS3102@black.igk.intel.com>
 <ah6M_vEIREG0w_mV@ashevche-desk.local>
 <20260602095346.GA2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602095346.GA2990@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4236F62C569
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37809-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[disroot.org,kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Tue, Jun 02, 2026 at 11:53:46AM +0200, Mika Westerberg wrote:
> On Tue, Jun 02, 2026 at 10:57:50AM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 01, 2026 at 02:18:15PM +0200, Mika Westerberg wrote:
> > > On Sun, May 31, 2026 at 02:03:09PM +0200, Marco Scardovi wrote:

...

> > > This is really complex solution to a problem I'm not sure that even exists.
> > 
> > The problem that potentially may have an attack vector is the malicious ACPI tables
> > (via SSDT overlay, for example). So some of the validations (like pin index in the
> > pin list) would be somewhat useful.
> 
> Yes but with SSDT overlay you can do much worse things than passing an
> invalid pin index.

Still my point is valid :-)

-- 
With Best Regards,
Andy Shevchenko



