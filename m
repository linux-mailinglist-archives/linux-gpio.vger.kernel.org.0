Return-Path: <linux-gpio+bounces-32063-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBOuGymZnGluJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32063-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:15:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1D17B5E5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B102030723E6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A8933C1B2;
	Mon, 23 Feb 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Au2m3xom"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1044133B95D;
	Mon, 23 Feb 2026 18:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870145; cv=none; b=EnpB4SP0qRtu16iXgN2ggfpj/nULC85lfHj/z/lwADF04amHky3hmmBawpHHEiCpBkWG7bc2d74Q2wkp+E7CxqtTlwyuI/pDD79iLz0EnY6dDE2087aiEdJOKMcsP7ciKG41unD6zgZm3V9v3GyeLqmNKqN+4eQbnR18uPPZjkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870145; c=relaxed/simple;
	bh=+C/z0Joop50N9OnTbsKTZLcnpOMhlCHMkiHnoAvdL0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hx2c93Q1Ccu1bvscqk1P3Kbt8qDOSeHzhNRdzACxu8JAVVy2APBILwuVq4euF0DLCiBPmk1MM6LgEx/Uaryo37DGyS3+KkDwh1UIyT5C/hIL2no1PnIHx0LI8TDL3o7N/4d56PlC3egTGOEhKCP2WXaVSORYscLfoyctsRQ+p+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Au2m3xom; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870144; x=1803406144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+C/z0Joop50N9OnTbsKTZLcnpOMhlCHMkiHnoAvdL0s=;
  b=Au2m3xomy7iPbh+x9uChx1W8FRWUn/aRYm5d3k0RN1dVlgqal13ZD0Ed
   dFcydNKlk9aI4fC76y3gfAhnWnfIgbaK4bS5uQfmOWTXFtO/KpQgvtw5p
   jmxigfhA2sLhK8ecNFhBC7+Q1zWP7Mmg0K8j/DwU8lh47XF+9J8Bb11fo
   Z5F1jJb55zNQUt+5TwPXy0vW386TnvHHE+jCQDT7vEsQ6M0XpyWKyk1Ib
   FSXx9bQf4HXp3vNGJuVGCKv9P8+1ySQBToZui3feYMe8Dp3lW5CajwhR7
   kosoWkH7cMzD59j3DZkdW5EbcDAyTnBKz+0wuIj4HKpJATf4qM9LPyCkB
   g==;
X-CSE-ConnectionGUID: 7d0cojfGSpGkI8U6yjXmlA==
X-CSE-MsgGUID: 8zBIRxYvQm+ouTbrRgbmSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737692"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:03 -0800
X-CSE-ConnectionGUID: l3aODQlARxmlypL+H4YReA==
X-CSE-MsgGUID: dDL29c91QLufWQ5oSrveTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369507"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 23B0295; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 0/8] pinctrl: cy8c95x0: Yet another cleanup series and a fix
Date: Mon, 23 Feb 2026 19:06:50 +0100
Message-ID: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32063-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 90B1D17B5E5
X-Rspamd-Action: no action

While playing on with Intel Galileo board again, I found that I messed up a bit
with the driver. Here is a fix followed by a set of ad-hoc cleanups. Obviously
tested on the above mentioned board.

Andy Shevchenko (8):
  pinctrl: cy8c95x0: Don't miss reading the last bank registers
  pinctrl: cy8c95x0: Use devm_mutex_init() for mutex initialization
  pinctrl: cy8c95x0: remove duplicate error message
  pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
  pinctrl: cy8c95x0: Move driver data to the local variable in ->probe()
  pinctrl: cy8c95x0: Drop unused 'name' in struct cy8c95x0_pinctrl
  pinctrl: cy8c95x0: Eliminate fragile use of I²C ID table
  pinctrl: cy8c95x0: Gather ID tables in one place

 drivers/pinctrl/pinctrl-cy8c95x0.c | 97 ++++++++++++------------------
 1 file changed, 40 insertions(+), 57 deletions(-)

-- 
2.50.1


