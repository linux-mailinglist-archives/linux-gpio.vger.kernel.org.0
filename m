Return-Path: <linux-gpio+bounces-34013-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PeLDrwbwWn5QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34013-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:53:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 950B42F0924
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 769543086870
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAE23914E5;
	Mon, 23 Mar 2026 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdTV8Pu0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE35390C8B;
	Mon, 23 Mar 2026 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262835; cv=none; b=iPbqEvw4jqdbLtSqGpn0riB6Wrbup4hxUBpcvckt65gBJvKYOy1ZQ33iw6DBuczaVpV7s7neXS12667qKT+sLl6I7Tinq2h/Rded8IK/KJvi7A4Mi7f2mPigiQ1JPx0HJX9DvaRazDMDQ9XIkDyXRDpQAN2ojrtEanxNlmH1fMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262835; c=relaxed/simple;
	bh=0NUK8VRmQ4Cp9kanzBWCjpNq1JsmARXiiQF5DxHJG3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m/6FUuNcLaXqQi6OhZ4bR7Y3+IVALgPQebiqAAVJkz76FTnd7iQK74wvmtz9pdnoVAV75fMvTq9F4xgyaKVgRSAePjO7ux89JJd/FDHhjAgQ26iYV3zKghZE5VFNTJqS1BW6AOpvXrtY3bjeQr0VT0CH/5AZu1XIHFoUQ8b0LFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdTV8Pu0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262834; x=1805798834;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0NUK8VRmQ4Cp9kanzBWCjpNq1JsmARXiiQF5DxHJG3s=;
  b=WdTV8Pu0Qh71go/2du5fFn/cwIYr/0zdxi42luZg/7KS6qy9N0/33XUS
   Ay3+V9EpdfKmMBpOtyZcmRw64NfbuVqjOjbF3/dxvi5FhTWrCPe0c47ep
   UljBMCNeTX0dsxWEpLLZM4cXELNxEExdIZrHT2NWECXgSyCba3KV1bxYp
   JFeS1Pr02OJwJ40/YNvhsOItuNrK3Awzqhhsu6Ba22XGin0OSWN+rfZ43
   EcJjCIu345nmSLroRahagkL9eTEiVThc3qCcl4BKczRH2jKffj2kCgUEa
   vZrO/bNssxLnKHpk7lQpDOfqmkGOoG6xmTSeSWjOgYdRaA4Ia7IT+qTAh
   Q==;
X-CSE-ConnectionGUID: jSFxS+PPTWugN1XWijh1lw==
X-CSE-MsgGUID: 01Sxq0mIRPGQZrZt2b35aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85952795"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85952795"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:47:14 -0700
X-CSE-ConnectionGUID: YwYpkmxMTB+9arGjCnRqEg==
X-CSE-MsgGUID: R0kEfuntT5mDG5AEER5Nlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224203600"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.49])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:47:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
Subject: Re: [PATCH v2 0/2] barco-p50-gpio: normalize return value of "get"
 and convert to guard()
Message-Id: <177426282270.8512.4556036830475075786.b4-ty@linux.intel.com>
Date: Mon, 23 Mar 2026 12:47:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34013-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[barco.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 950B42F0924
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 19:56:16 -0700, Dmitry Torokhov wrote:

> These 2 patches fixes a regression in the driver arising from gpiolib
> tightening its API, and converts it to guard() notation when taking a
> mutex to simplify the code flow.
> 
> v2:
> 
> - added reviiewed-by and fixes trailers
> - added new patch using guard()
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: barco-p50-gpio: normalize return value of gpio_get
      commit: 1c9d30d37aaffe3454d70b89a77f8aaecda257bf
[2/2] platform/x86: barco-p50-gpio: convert to guard() notation
      commit: a5877e921389178f994a5ec15a145d7e7ba3ec65

--
 i.


