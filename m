Return-Path: <linux-gpio+bounces-33616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBGcM5MvuWkYuAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:40:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF52A8190
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE474303FBE2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C8A3A7824;
	Tue, 17 Mar 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGabG+zK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7CD3A6EEF;
	Tue, 17 Mar 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743903; cv=none; b=j8Z7P4GUG3Q2OLwRZM4Zuos29Zfw4YW48IkE4sCAggJOtbDgUxU/ytgo23/mrVjcTih2fFRxhZ8U3S6pU98CT2PbqQRdlHVvxarU2EVhqa+SrmX6hLhDaLxAZqD5kd1uFAns1NkJGKN4ym3f7FEvjDLWpgC+x7eAfbpZKiLhvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743903; c=relaxed/simple;
	bh=BnmrPm2Zjjhm82NmB/7it5Yex9GkgsI0xHfoYMDY6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vARWeEm1Q51RUR7Li8gHX5ycy1BK4G377UohXGXOqbe7M2FCfTTJZK8zkIoffF3VSCN3mwo8k0zpJuuMmRBNDud9KXXokGVTgFgDd8HyUAgBqXVALfrO4ks03xvaCu6+qQK5a4G4odqvWmhwjuB7iq97NbJbspJQmqZxO38mNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGabG+zK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773743903; x=1805279903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BnmrPm2Zjjhm82NmB/7it5Yex9GkgsI0xHfoYMDY6FQ=;
  b=ZGabG+zKqTTUKnfy1Jn7q/wAVKGUZWuJuXTGrt9wSIowATlL/+SnVpZZ
   O87MTIhIp0W71rw2xypSfQz7+UygqQqpOaM88myV+PxxYOSr6/2pEkCLq
   nOMMHdFbDQAYqpB9m9MHYSHFTypFgjhx5OfVurj4H9B9Rtozgi6WCUjz5
   HgUyRZ22TMqOqKir1n6p85Zf0OzJsqPkgfIl78+MiMBMwxL0+H6sXysgN
   XcDWhbCPmH8PrsXAP7eGyzyr9JAyLsS5YVV6uH6SPwaHLVLku/0foMj/7
   AhzjtuizaBCN2r7LFuqMr4FOPMaHVod9w1GrMkU3a+0SHSYPdVQkg8oRV
   w==;
X-CSE-ConnectionGUID: eCP0DCG4Q+a9bYIj7+ml8A==
X-CSE-MsgGUID: cF40eLumQt29v8jwyS5MiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74659058"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74659058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:38:21 -0700
X-CSE-ConnectionGUID: 8Jpe78yPShmapIMgsRSi/A==
X-CSE-MsgGUID: Nwz0Cs1TQIe221zfEXQPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252713536"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 03:38:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 372C298; Tue, 17 Mar 2026 11:38:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/3] pinctrl: pinconf-generic: More fwnode related conversions
Date: Tue, 17 Mar 2026 11:36:10 +0100
Message-ID: <20260317103817.1982584-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33616-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: BBEF52A8190
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While I have noticed some inconsistencies in the pinconf-generic code,
I also found one minor issue and a room to convert the code to use
fwnode APIs instead of being too OF-centric. This might help in the future
to use similar data structures in software nodes.

Andy Shevchenko (3):
  pinctrl: pinconf-generic: Fully validate 'pinmux' property
  pinctrl: pinconf-generic: Validate fwnode instead of device node
  pinctrl: pinconf-generic: Convert ..._parse_dt_pinmux() to fwnode API

 drivers/pinctrl/pinconf-generic.c | 37 ++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 15 deletions(-)

-- 
2.50.1


