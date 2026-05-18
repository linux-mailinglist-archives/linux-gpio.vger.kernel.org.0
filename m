Return-Path: <linux-gpio+bounces-37009-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8r0dNMmZCmqs4AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37009-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 06:47:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B672A565B93
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 06:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D225B3009503
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 04:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B6F346E47;
	Mon, 18 May 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXE3w6f2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4055270552;
	Mon, 18 May 2026 04:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779079621; cv=none; b=iKq+Ii7guMzglUPHzJBif6Et6Cw0ksqOVEDkg9wSbdFBgTsK+EbCx96gWCqFDVAwaYaK7zLwSXNo7o1RD/J3htJjhRSRAcOugOnOMSCQvEGgoEL6806bS3cF9cVMnJcyICbCCg1bbyzqHmb76FtZzzPgux35Am+vHCL2fZCxaaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779079621; c=relaxed/simple;
	bh=C3wr+QsxojRwPkqmgGBjE9I6yp/0fPwWgvRLdUy5oWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUiWF7RYHtThVfx2tePTHKfZ5oUs9lz/EZ5hWXxmPCxLDv3C1IXqZoB7/I1p7WcATatebgH9sKEq/3MLXE6IeoA13DTKXwdEtORkPNMh18pw2kpM3p0BOa0w+U5JjV1Lu4XSp+9fuOzowzLntEnEV2xKjcRp8Wj1PeWXc95Z7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXE3w6f2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779079620; x=1810615620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C3wr+QsxojRwPkqmgGBjE9I6yp/0fPwWgvRLdUy5oWo=;
  b=nXE3w6f2PJt4sjCJZeBFZigIo751144oSt6goZaNP9tR8ivNY14AJa6m
   eDTFtR4jvSxu65SE3R4diDTXfCg+LnYla85+jNIlii/t0aa+clPy+3eG1
   +Zt30hkM0jIqeorqBjp689yt6CcGHW74Bp6x/38oASw8nLPky2wF1nGKX
   RyS6bfzWh4s55vEkkQTw9D8jT1pDUbMWAON+swIsaOjxSoP7ThPGRYuE7
   myQsn3oaE+AVNeMl2ml7alyyUVlJswgTSUZTobzsjumxm65ZXT1gt3MeH
   0nMwz2NyOSxvM7bJuvKlrQwoPDo1ifoePpwzN4sKFfYZgCxGjaQLSlOGR
   A==;
X-CSE-ConnectionGUID: 3kfZMLA/RzClpwEqili3ZQ==
X-CSE-MsgGUID: kKS1aJCDQCSUhIs0ore9Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="105387034"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="105387034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 21:46:59 -0700
X-CSE-ConnectionGUID: aNfO0zljTMKlfFjqqNkbcQ==
X-CSE-MsgGUID: ZH5/ZjxpSbWiozOiF2RUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="235073048"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 17 May 2026 21:46:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 23ADC95; Mon, 18 May 2026 06:46:57 +0200 (CEST)
Date: Mon, 18 May 2026 06:46:57 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: andy@kernel.org, linusw@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: intel: move PWM base computation past
 feature check
Message-ID: <20260518044657.GL84797@black.igk.intel.com>
References: <20260517161530.1037-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260517161530.1037-1-sozdayvek@gmail.com>
X-Rspamd-Queue-Id: B672A565B93
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
	TAGGED_FROM(0.00)[bounces-37009-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 09:15:30PM +0500, Stepan Ionichev wrote:
> Compute base inside intel_pinctrl_probe_pwm() only after the
> PINCTRL_FEATURE_PWM and CONFIG_PWM_LPSS checks have passed. Tidy
> up; no functional change.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Link: https://lore.kernel.org/linux-gpio/aglu5jy5SbW9Wjwj@ashevche-desk.local/
> Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

