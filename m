Return-Path: <linux-gpio+bounces-37033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCN8C2vNCmq18QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:27:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD0568B9F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5DA3024C8B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4145D3E1717;
	Mon, 18 May 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ekg9FaBF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B043CDBD1;
	Mon, 18 May 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092493; cv=none; b=OV8YJmEvL6diRvPpwmoAs6sOdveBkctmRwn5NKC4PzpoNdwP+DMlBi7z3G+Emcie84GUuiyMfDGUdgiNTw2M3ert4qXe0F4Zt0k5Yzb/xhzhcpf7jnERJmdQcIGoYnf6Eg82S0OQ9trlWN4a/c0WjHW5LJsT3ofy5n3rbi1cy8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092493; c=relaxed/simple;
	bh=82kI6rMYEPc5uBRIfzk6fvMZ8SlyuXwco88bBS04wVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKjOU/y33wHT89BwmleRw8yDXG/CVIIqbzlncp/OZOkN2ERRacJHts5sm79GlZlPki9OsfLObEjzzn8NxWCH5lftsMRf/LfVO7vH/YekRbd4gPMWNh19xzjrteXK/o+NbDBmqm3ElkhVnK6ISQYwSr+2h40B/Wa0nOhA2fsowzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ekg9FaBF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779092492; x=1810628492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=82kI6rMYEPc5uBRIfzk6fvMZ8SlyuXwco88bBS04wVQ=;
  b=Ekg9FaBFeWOMbaO6xpICGhmGLqr1754UzYSdB80Jtsm/teAXPu683bIy
   bysJLO7eXVp1GXzLTSHkcUVeyUSqB6mxKJiLw+SGFIVwPxXib+Nd0MbdH
   Wx3a8oPrfT25OEep8VbBOMucn+EsEnFrh+apyXo0UVneyhFwa0joCYrxp
   +3n82DArL3KO/6jFne50SyfIdVGv0iUztBKf5cmg5fyv32z2zqB+ad//8
   PqRtcqDVq6D1NlSmYdebgggeTH7R7zwfKZRZR5dU4TFZeRF1wXzmiaMbB
   2gg+BE9TNQC4RYQFl1T/mFiKOXS51y4XlJOF2o4e6pxzpg9tRkyEFk0r8
   Q==;
X-CSE-ConnectionGUID: w0pu6x3CRm6EkKW2FC4blQ==
X-CSE-MsgGUID: a3bUkg3FTE+x/6BUZD5oew==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97370617"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="97370617"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:21:31 -0700
X-CSE-ConnectionGUID: UkExTJRPRICB7oAD7lKVAA==
X-CSE-MsgGUID: nasTs6r6Qf21lGYULFX98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="277454868"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:21:30 -0700
Date: Mon, 18 May 2026 11:21:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] gpiolib: acpi: Declare shared structures in
 gpiolib-acpi.h
Message-ID: <agrMBwoNpcAGv5ia@ashevche-desk.local>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
 <20260518075357.112584-6-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518075357.112584-6-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 8BDD0568B9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37033-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 09:53:50AM +0200, Marco Scardovi (scardracs) wrote:

...

> +#include <linux/acpi.h>
>  #include <linux/err.h>
> -#include <linux/types.h>
> -

>  #include <linux/gpio/consumer.h>

This header was specifically made into a separate group.

> +#include <linux/interrupt.h>

> +#include <linux/list.h>

We don't include headers that are not being used. Follow IWYU.

> +#include <linux/mutex.h>
> +#include <linux/types.h>

-- 
With Best Regards,
Andy Shevchenko



