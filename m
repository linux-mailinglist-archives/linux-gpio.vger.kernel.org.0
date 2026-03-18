Return-Path: <linux-gpio+bounces-33761-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ8UEIXDumkGbgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33761-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:23:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA832BE1F6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E757432B5910
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B5A3E7159;
	Wed, 18 Mar 2026 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuoTLm11"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3115C3E51D7;
	Wed, 18 Mar 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846786; cv=none; b=omO3LYDPLUO6U18ZBjOSpjtWA9DE77McjJwFnE4yGaeXtYR8Uf291Dv9tmaziL+7QFgjzh38rtrVUpU42UgX5U5/uTBL/h4PF8aw+XEWSNtKLY2aQuXBSsS84XZ9xzGHwCv1Z4NuhUNtcmFJYGfVBnegPluHPCj9rV+6qhlekvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846786; c=relaxed/simple;
	bh=N4E9MofA7yHn7hf0WsvFavhtlFkPDtGVMHDY61cFV4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VE9STwpNcxpqoSMnZi0aiTm+w+etzQOOoVdOXIwzqvzZQD0cuzfTiF87D99zFp8+zpqHAno/6R08SO2AWsTg60JSrUUI0PurnZS6rQUE60GsxHi0vzAJeBinOM0QoudVCHqvsgeDKAVabu5xCZ/zwLSqkA9/iGMTpq0wMhPue0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuoTLm11; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846785; x=1805382785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N4E9MofA7yHn7hf0WsvFavhtlFkPDtGVMHDY61cFV4A=;
  b=nuoTLm11mpaU8r+BrgIT6kaKfA9Kh4qAUhq0Yr24aNA4sTb9G5u8vjRe
   7/uDIhvj3acR9JyBfEmlUcLfW0P46fXjUfVGn5H3z3DLZPcA+o+zteKsx
   JSLUOMDu3iiWws9gUWDUDaiaNEYJ5+Nmd2srnn64XfTg7y4OVYdWLO3k7
   tNKpRmwioxqAT4SvRqG4g8ogQ/buXPkAnjcJp3bXRC1QuQNT6CVEFDtcx
   xmRzDqPB5zsw8Sm2ie+T/7kfc2D5nrfhQS0AZtjY3xuTK8+EpMoQI7iKp
   KZu21p2AUzpjD71rCBX/IdNwdiv8kdEABIu690hUcHF1sp9oVi/Joa6QH
   A==;
X-CSE-ConnectionGUID: W8c04fC2T0al+OoF7CXCXA==
X-CSE-MsgGUID: MVr7a5ThSSWpHLJCEm4feQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084540"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75084540"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:13:02 -0700
X-CSE-ConnectionGUID: B3q75GKjR0WJSOVxfrm83w==
X-CSE-MsgGUID: C7QpDV2rRF2CW0sPT3CQ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247122455"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 08:12:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0D8F399; Wed, 18 Mar 2026 16:12:58 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 0/5] pinctrl: intel: capability handling rework
Date: Wed, 18 Mar 2026 16:10:14 +0100
Message-ID: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33761-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BA832BE1F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During testing a new feature (see patch 3). I discovered that the
handling of capabilities is currently limited and in some cases may
even lead to not-working but announced feature (PWM). Hence there
2 fixes for the existing support, 1 enabling of a new feature, and
a couple of cleanup changes.

Andy Shevchenko (5):
  pinctrl: intel: Improve capability support
  pinctrl: intel: Fix the revision for new features (1kOhm PD, HW
    debouncer)
  pinctrl: intel: Enable 3-bit PAD_OWN feature
  pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it
    shorter
  pinctrl: intel: define iterator variables inside for-loop

 drivers/pinctrl/intel/pinctrl-intel.c | 87 +++++++++++++++------------
 drivers/pinctrl/intel/pinctrl-intel.h |  1 +
 2 files changed, 49 insertions(+), 39 deletions(-)

-- 
2.50.1


