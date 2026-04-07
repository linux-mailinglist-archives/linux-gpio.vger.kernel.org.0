Return-Path: <linux-gpio+bounces-34818-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPKrFOUX1Wm30AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34818-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 16:42:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039B3B03C7
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 16:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24CB63010165
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 14:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60CD2C08C4;
	Tue,  7 Apr 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUR/aohk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151928C037;
	Tue,  7 Apr 2026 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572395; cv=none; b=ZhVjyct5cQjhf2aXvoy5BBoqcO7MJyeaEY4yVHfhkfFt+nDYnov51hPL181QEjjsVpznx9qDmhlmzVW/DWNzKl9Fr+EQ4JAr97/JvfyCPiE/tTbqPWYYhBlUnSDqVO4jcAAxNMhyz8hBWtwDpJFyqxQu8VF8ssjw9r/S4HPjiTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572395; c=relaxed/simple;
	bh=RTf7fSdKbOlG+Uqgt+xipV/ZZjbunaObxcyZXfjW2Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnAi40wbm29ugX7rGjpEVjoL+S4Cn+vF8T84RNWGoLAh4/PeHunEKPqeE7YTk/uRqW/mfhkeLsPqEUD6DnhfLLDV+mUWyzYOUGL7Z8m3aeVxsJ0n0zqlvdw7/Hr+rNdyhCJ90tvX/edxDNHd4mF3KUQy1+Y50B5zatiDkfbCv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUR/aohk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775572394; x=1807108394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RTf7fSdKbOlG+Uqgt+xipV/ZZjbunaObxcyZXfjW2Kg=;
  b=aUR/aohk6NZQcF7bZ0/6pFRIPm7vo2whlftkFLVybwznj3bQqUMB0LJr
   hyt8beAtEZYRhHSamubLM6tcJoneepfLHxVl6N09aR7HhzlVLn6D9hsfV
   xalaQQwwxjhV5YfNG9yliyVryObOtJCpz6/h7Z7rCjgyY2nzlPOogw5Kf
   QvzpVB6pgvvsXoxJ2n53CCcpqfWl68IgHYrjCTSYkma0Dws8nsAneDGFd
   Og4LChrIrE093L2mZu/nksx4zo03cyW1+xy34njkNf0iRbiDBv2c25v8b
   jImzWR5qV9ADuYLUdSzONDJHjTo4uns77YdlCVwzQP9UTT8fko5f45Cid
   A==;
X-CSE-ConnectionGUID: amwbAnGVTNKwrTADkn2X9g==
X-CSE-MsgGUID: movWTWikTWyxTslMtU5CqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87163644"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="87163644"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:33:13 -0700
X-CSE-ConnectionGUID: zqijq4DTTA64NzhYME3UXQ==
X-CSE-MsgGUID: 3r0YnN6ORSObwk2CRP3d5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="221609845"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:33:08 -0700
Date: Tue, 7 Apr 2026 17:33:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH v4 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Message-ID: <adUVoiVaOkVq1C4w@ashevche-desk.local>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
 <20260407-swnode-unreg-retcode-v4-2-1b2f0725eb9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-swnode-unreg-retcode-v4-2-1b2f0725eb9c@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34818-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 8039B3B03C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 03:27:58PM +0200, Bartosz Golaszewski wrote:
> fwnode_property_get_reference_args() now returns -ENOTCONN when called
> on a software node referencing another software node which has not yet
> been registered as a firmware node. It makes sense to defer probe in this
> situation as the node will most likely be registered later on and we'll
> be able to resolve the reference eventually. Change the behavior of
> swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
> resolution returns -ENOTCONN.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

>  		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);

>  		if (ret == 0)
>  			break;

Maybe check for an error first? Dunno. Up to you.

		if (ret == -ENOTCONN)
			...
		if (ret)
			continue;

		/* The reference is found, bail out */
		break;

(Also may be done in a separate change no need to mix these things
 in the proposed change.)

> +		if (ret == -ENOTCONN)
> +			/*
> +			 * -ENOTCONN for a software node reference lookup means
> +			 *  that a remote struct software_node exists but has
> +			 *  not yet been registered as a firmware node. Defer
> +			 *  until this happens.
> +			 */
> +			return ERR_PTR(-EPROBE_DEFER);

-- 
With Best Regards,
Andy Shevchenko



