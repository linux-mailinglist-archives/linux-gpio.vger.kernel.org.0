Return-Path: <linux-gpio+bounces-31902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJZ2JnNrl2lOyQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:58:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E996D1622F0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C472C301C971
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E70A30BF55;
	Thu, 19 Feb 2026 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXhTS5NE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321F2DB7B5;
	Thu, 19 Feb 2026 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771531118; cv=none; b=TaiUfu/e3ByAme12Ql6VGGSukJGEhQ2p3SKVMSOmAocR7+f3CaTvL795ZsdI86QBux1vm3n5TlWun/XzO7874yZQ4qC9+tIBaRissdc7nlA8D/8h8WRgPxxM8U5c4nJst8w15k8I06yjFXzBbMr9Q/oCf69G9PDulLNYzK+DsGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771531118; c=relaxed/simple;
	bh=yvE5eA0gx1SDrwniVbwl1AzlSDBvPiWFCo50o3GItIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NT1gpqdjmE/nVi8RQzdztmXBjC1cNX4vLwumbELr2tzNwQe0jXVlakdO0uuyWZQIYZ31NfQLzbf+MA0WCw3FO9odmv9qs/BEfU43RaFw05G4SbrM+29hoHbru8udijrMlovAQBzo2UV2XDHquY24ssmzIAWDKLFdm2ZslLV2IuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXhTS5NE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771531117; x=1803067117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvE5eA0gx1SDrwniVbwl1AzlSDBvPiWFCo50o3GItIk=;
  b=bXhTS5NEcxNUbE3l00cP7BmLOm3np45f5qf52o343xplP9UDGCAv7lKS
   JXjxcVF4o/0T9CXxupcqvDfIS2iWMxPhzyvhS6U6/rvZCb2lI37SfBWCP
   hQYkMlI1ztf09apQ39XLA+n0lPg3qrrjcAIRV8KLP4FlHlfdEoOLn/WM1
   lPfAXZkXwrBpXQyQDdMt9KphjsWEpCoLp+xkvcmX++1DfuHgz8xoOcPWL
   1LX3SPZXMZV77J4Bbp6YZNbhjbzNuZfJ/re8Rjqh/hRpx547FTNIZklCF
   TZU3tFFkJi3pjDlQHGxVfsUf8CIddzalwb5QVpUsMTsn74kto+nTsf1kP
   g==;
X-CSE-ConnectionGUID: izWac9yuTYOHRp4eNc3vxw==
X-CSE-MsgGUID: ZSem/TCCQuWAWfTBPdNXoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="75237251"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="75237251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:58:37 -0800
X-CSE-ConnectionGUID: wUD0FBEaQNyCGtY1ZTjsXw==
X-CSE-MsgGUID: NNiv7kreQN6J7By71tavMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="218783169"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:58:34 -0800
Date: Thu, 19 Feb 2026 21:58:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZdraIXlkAHwP-Pm@smile.fi.intel.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31902-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: E996D1622F0
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> Provide an extended variant of device_match_fwnode() that also tries to
> match the device's secondary fwnode.

...

> +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> +{
> +	struct fwnode_handle *dev_node = dev_fwnode(dev);

> +	if (!fwnode)

IS_ERR_OR_NULL()
If supplied @fwnode is secondary, it might be an error pointer.

> +		return 0;

> +	if (dev_node == fwnode)
> +		return 1;
> +
> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
> +}

I think we can refactor this.

	struct fwnode_handle *node;

// I would name it like this, because in 3 cases in drivers/base/property.c
// 2 with node and 1 with dev_node when the same API is called.

	if (IS_ERR(fwnode))
		return 0;

	if (device_match_fwnode(dev, fwnode)) // NULL check is inside
		return 1;

	node = dev_fwnode(dev);

	return fwnode_is_primary(node) && node->secondary == fwnode; // NULL check is inside


> +	if (!fwnode)
> +		return 0;

> +	if (dev_node == fwnode)
> +		return 1;
> +
> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
> +}


...

> +int device_match_fwnode_ext(struct device *dev, const void *fwnode);

Perhaps ext --> or_secondary ?

-- 
With Best Regards,
Andy Shevchenko



