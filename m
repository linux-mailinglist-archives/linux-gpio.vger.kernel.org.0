Return-Path: <linux-gpio+bounces-32324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LLMN8DJoWmqwQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 17:43:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC91BAF1E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 17:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 145ED300B548
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3386D348883;
	Fri, 27 Feb 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9aV2aTE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C338329E53;
	Fri, 27 Feb 2026 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210622; cv=none; b=otHFjDCLBa7wo88Lues+9AsY9chF64+whTEd+VBck3ohETe9284P7tTzu0v8pk4REykNLSTLRd/aBA7t8ZJ0LiK41G4rej9d5IT9WyIPRMr5AVIWXYoV5hTNAqyrAcISsnndeDxioRGIc4+FaObgiBZEMui13sjlsaAUqgR8W9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210622; c=relaxed/simple;
	bh=psEK3lVJ4PTFQZHJMZzf27/FD3RDqqwLBhrqVOvttCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwJsh2D5ycBQVijqSZjI615FTLbw2qbzNu0vHD0kvf/NXSw4CPYKkZ1r/q1jO6PoFmfQavyaMqWwEb7fZH4JN8CMb5c2rCJbTkCNxJoK3gTkWpgwjf45kGxvUxCCdkkkREp8NYIWehrSG9XVPAV5+dztQER+UGYIsakbhDDXR7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9aV2aTE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772210621; x=1803746621;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=psEK3lVJ4PTFQZHJMZzf27/FD3RDqqwLBhrqVOvttCE=;
  b=D9aV2aTETCyIKtzTYCeSALtS0SRNQ2GOAJsj1rVIbvQpQS4CorKj7cOt
   1PPm+uzhFTqotNhhJuNQ13/PkleIIz91EmftVBI/tUF/yVR0ubaAEZmcs
   dhvn9ZpQEBR3kR64uxlsJpOORvoll2US3Zfx0uXieXFYQNjU/g6SrFDAh
   FMatzIsXqBLXpZg5/z+5qssUp+y1INgrkYH6yMR/bR4qByab12VaOjYEt
   wyhM+qANUSmdLKfQUlpswC0FU/QgzHGx220aiX21NqDzKMzlxX4YzDMQs
   BoCtXgvNVcgS50s7TBVZU38omfqFqJJO1lnLOt5u7HsljiBP13/WZBv7i
   Q==;
X-CSE-ConnectionGUID: b82vHrDpQzSPUbWsd5hXLg==
X-CSE-MsgGUID: 8DMc9clvQ/y+iMaosgWGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84762515"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="84762515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 08:43:40 -0800
X-CSE-ConnectionGUID: FdCne6RwSjig0iYk+osSpA==
X-CSE-MsgGUID: FT41dB0fR2CMCuxWwE6e5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="214775897"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2026 08:43:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5853395; Fri, 27 Feb 2026 17:43:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: cy8c95x0: Avoid returning positive values to user space
Date: Fri, 27 Feb 2026 17:43:35 +0100
Message-ID: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32324-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 58EC91BAF1E
X-Rspamd-Action: no action

When probe fails due to unclear interrupt status register, it returns
a positive number instead of the proper error code. Fix this accordingly.

Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0d295ebc33d1..ace0be5ec679 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1300,7 +1300,7 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 	/* Read IRQ status register to clear all pending interrupts */
 	ret = cy8c95x0_irq_pending(chip, pending_irqs);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to clear irq status register\n");
+		return dev_err_probe(dev, -EBUSY, "failed to clear irq status register\n");
 
 	/* Mask all interrupts */
 	bitmap_fill(chip->irq_mask, MAX_LINE);
-- 
2.50.1


