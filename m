Return-Path: <linux-gpio+bounces-33300-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHpNBuwos2ksSwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33300-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 21:58:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD0279A2D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 21:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58D5E302FB3D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA10398900;
	Thu, 12 Mar 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkM434Hz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0F386C04;
	Thu, 12 Mar 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349095; cv=none; b=DCVu2JJDvPyB3KTWTG+aCGW2Vu6hK2MSSydDbW6McJ+LmNDj+88d54/NDalVUvZFosZo9DSYBmcueKhoST39zcfzHvMEW5lzlTt8azdn2v2Gfb9gL7q7fMEcxvdjtQFC2cCvuEse3OacH2uzIe45RVesr7QsN2lUI4Hf+xq9euM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349095; c=relaxed/simple;
	bh=vhOYrw/DVA2RJTCv7jox3hLnZDAXlifzBNUjQ3RzxEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEQF4ZJmjpMNvUXhHzIcpRxePBOoTd0G90XA8lkiTd/nqp4Mo9vpMGTamDlvw1cbUffBVVrJpXeV3UFhhOjojz1JhlsIUsoSM5U6g+xv8wM1jTxrV/xmJ8KDAucF1MoA8Nv7ZdhmwpVB5TnPmxMtl5PlBxBJE1dT4o6thsm9tcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkM434Hz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773349094; x=1804885094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhOYrw/DVA2RJTCv7jox3hLnZDAXlifzBNUjQ3RzxEY=;
  b=PkM434HzQlrhLUFzJheAZyrnQIeLEGYduXU3HooUFV+5zgBkKtqgDaMq
   dOIdA2kEnJYtDSsYZujfkICpbEyJPgrUFx/gCTN17VdgBcpjNWZpvgSzZ
   88DHm3vBapAvjCFW7T0DGNh2HPhHcs1hNN5rFROzePcz+8t0fRrfdi7mr
   N5mgwDBvaBOmMIByqLT32w2MlIPp65KTmTpJQNjyn5ZxLRNuhRH6nbLHt
   8dUZDgH+YqgtZ4eilcHTJ3I07t/pK1GCMGePB7BiQPKx5xFkWxpAY/5p3
   yLdu+SmmY3jRy+zGCWt/LL7Aa7qlkvFXuUKFNke2m1cIcZ+vPfs+6D7/z
   w==;
X-CSE-ConnectionGUID: vVc4Uz4ERWSgYysdNK/enA==
X-CSE-MsgGUID: ieXVVdHuT1WGiQegEzohYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78059313"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="78059313"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:58:14 -0700
X-CSE-ConnectionGUID: CxUCfibIQBeOYVMw/D3uLA==
X-CSE-MsgGUID: BA9fVZzwQhyvjPI767iWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="225640039"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.184])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:58:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 57EC1120E92;
	Thu, 12 Mar 2026 23:00:06 +0200 (EET)
Date: Thu, 12 Mar 2026 23:00:06 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linusw@kernel.org,
	brgl@kernel.org, mchehab@kernel.org, dan.scally@ideasonboard.com,
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org,
	sre@kernel.org, hao.yao@intel.com, jimmy.su@intel.com,
	miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
Subject: Re: [PATCH v2 5/5] platform: int3472: Add MSI prestige board data
Message-ID: <abMpVo1eCvtBObv_@kekkonen.localdomain>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-6-antti.laakso@linux.intel.com>
 <dc7f24b2-ec57-4937-92f1-f80b1f1e785a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7f24b2-ec57-4937-92f1-f80b1f1e785a@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33300-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EBFD0279A2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, others,

On Wed, Mar 11, 2026 at 03:35:28PM +0100, Hans de Goede wrote:
> > +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1800600,
> > +		.max_uV = 1800600,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> 
> > +	.num_consumer_supplies = 0,
> > +	.consumer_supplies = NULL,
> 
> Nit (no need to fix unless you need to do a v3 for other reasons),
> these 2 explicit foo = 0 initializers are not necessary and can
> be dropped.

I can fix this while applying...

> 
> Otherwise this looks good to me:
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

...assuming everyone is fine with merging these via the media tree. Let me
know if there are concerns.

Thank you for the reviews.

-- 
Kind regards,

Sakari Ailus

