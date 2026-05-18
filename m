Return-Path: <linux-gpio+bounces-37054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO4fJ6ntCmo89gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:44:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590F56AE52
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC03530B2C0F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B3D3F23D7;
	Mon, 18 May 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZm/9+ao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA031F9A1;
	Mon, 18 May 2026 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100407; cv=none; b=jGW2zKV3cu5/9ZNV4xpXmWdMEKPMbYgNrq8r+vmunpIlTwkw08E3BgXJbaJEpcifr6rTObnJauDT6M/UPvUrGbDZD+Lt3PCchCuXE8+jXRWAP0x3MaXCx4nnZ73VI/e857g8FwHcXi2npgPufUBjqKBKwHfOD2x+5GwVzvBJ8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100407; c=relaxed/simple;
	bh=bSdp5Hmni6nlC/msTnQJkqgbtW5vfUlCw6F3huYpeL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7vBEpMo977/28S6xuMYj826zGwb+Z2gtzDNwvGSDA0/rLrDeYqHmn02DIh4z1CNUuZTNPNKXwRM0TkxAESlqFZBhmr68Z0AfOpWopHV87Rw23K+9k9Z0pFZasT5oLL99iy8RJ82ofMcCy4eQAMjcF3PFfF9zPISeA9Jn8vsVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZm/9+ao; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779100392; x=1810636392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bSdp5Hmni6nlC/msTnQJkqgbtW5vfUlCw6F3huYpeL4=;
  b=bZm/9+aohUMiXz4cJziEaJy0KTzLa2h3RANEi6HBv6QUBQBIQttHwJLy
   bbQXv3s7cyUGLr+6AdQM0Q3ROQf8NLXJhlib+pj7F5UFb6KVF+rTpqbQm
   UiVqD3H6wSLUjaY3qoZUplLJzU4QsvIxDFilG+dTjnXF3tIXo9ttZN801
   5lPqxcYK8Uckath3L3qgHc6vCMUVWRVELJ6Ow74jVMer+0U7MgDEO7Z+/
   v4CP4AfxpIjbT7TQnTr0dsC51XAX24HPU7dMXOydujLk4rW86wCjv/pIM
   bGpbk19kFg8EM8ynp3nmXFqUnD8WcZNzqXuRtBqar+Zy5aIQXlhtsRptt
   A==;
X-CSE-ConnectionGUID: 4mm8AHyVQMWsCvmqzuMoww==
X-CSE-MsgGUID: sYh34tQmRdOhY28i8P/XrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="78973356"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="78973356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:33:05 -0700
X-CSE-ConnectionGUID: rylxNbDURjW5NgoHgujAKQ==
X-CSE-MsgGUID: RdHlbWu3Qd6R53Kd7HlhcA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 18 May 2026 03:33:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DB65895; Mon, 18 May 2026 12:33:02 +0200 (CEST)
Date: Mon, 18 May 2026 12:33:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] gpiolib: acpi: Add robust bounds-checking for GPIO
 pin resources
Message-ID: <20260518103302.GO84797@black.igk.intel.com>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
 <20260518075357.112584-4-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518075357.112584-4-mscardovi95@gmail.com>
X-Rspamd-Queue-Id: 0590F56AE52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37054-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 09:53:48AM +0200, Marco Scardovi (scardracs) wrote:

You are missing here explanation why this patch is needed.

> Assisted-by: Antigravity:gemini-3-flash
> Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)

