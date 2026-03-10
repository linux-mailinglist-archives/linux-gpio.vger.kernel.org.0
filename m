Return-Path: <linux-gpio+bounces-32992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JeDIMIksGk/ggIAu9opvQ
	(envelope-from <linux-gpio+bounces-32992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:03:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE925143D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0080133281A6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4763E317A;
	Tue, 10 Mar 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcuIkrw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341E38AC82;
	Tue, 10 Mar 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146706; cv=none; b=GpyxX3DBeYww6QPXgwDvbZgt1aB5uAdJ7EeKbaIVqUCQ+nx5FPcJzoLQxYEUuPiTOUaIX7Wpw6mXxbO8BSv00qJEBFtQr0pJf2NlGurr7UFA59fT1j5GKz/OXrFrnIOaCQ7L0EwLnHySd/5wq19zfN8AInA6Nig2yzFf1NdQVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146706; c=relaxed/simple;
	bh=V/tjGRK2XwfIHYXozIh+ONiswzwZY6ml6Vm7sXIhbeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVO+Ia8EDa7N0p1qZ2K9cQm/1A2EMbk4LP0/QXkLdKS5eaU37kAVxQPx1Mv+zx+f2rqz5QC2wZmRlpZaAaYiQw7ZxJ161Thm+ajMHlcJ3dD1SdgqFc8gc8uMCA+MhoGJQv0Cc7xxSOn+r24MnREsMGAa70Wo8lViHhEdPXwBQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcuIkrw1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773146705; x=1804682705;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V/tjGRK2XwfIHYXozIh+ONiswzwZY6ml6Vm7sXIhbeo=;
  b=kcuIkrw1WfI0flgj/1R7UirbthJUklHEdk/uFwpS2tJrwKQ0IlA3CfMa
   GBnMa2V68ViOY8vCgCALS1wGHiLxUPgt+gab/IsPCUhdctrDC93aMjvno
   R5vc/aj72cQJxn0JUC4Gg7STmXNSnhf5/SgA3E/GA4QYzJl6Du/smpFM+
   RxvTp+GmcaKCzjawf8xWq7JMPGr9W65QFcG5yZdfx11iDtD7vRlBvdMSX
   /FS9xwHqt+0cjYBaOuqS7TPyCap7AnyfVQuE7XcIMOTcWLIxUpzbzcCgI
   h41XpzndT06X9HvkeLB9V6NXjsXvXYvquEVIJql/xXAI8Q2ySx77eY20r
   A==;
X-CSE-ConnectionGUID: MddQbK+ETqqQ1fbSyimYaQ==
X-CSE-MsgGUID: j6JxUlgUT5ijx9o2E3SKRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74268916"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74268916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:05 -0700
X-CSE-ConnectionGUID: 3leC/Ll2SQSy2JT5fYwCwA==
X-CSE-MsgGUID: WrAGrw+MTrSMqSyhrAl+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225040186"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.41])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:44:59 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org,
	sre@kernel.org,
	hao.yao@intel.com,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH 0/5] platform: int3472: Add MSI prestige 14 AI EVO data
Date: Tue, 10 Mar 2026 14:44:22 +0200
Message-ID: <20260310124427.693625-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2FDE925143D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32992-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

This adds camera support for the MSI Prestige 14 AI EVO laptop, which uses
a TPS68470 PMIC to power an OV5675 sensor.

If ok, including a GPIO patch to this series. The GPIO patch enables the
TPS68470's I2C daisy chain functionality.

Antti Laakso (5):
  media: i2c: ov5675: Wait for endpoint
  media:ipu-bridge: Add ov5675 sensor
  platform: int3472: Add gpio platform data
  gpio: tps68470: Add i2c daisy chain support
  platform: int3472: Add MSI prestige board data

 drivers/gpio/gpio-tps68470.c                  | 23 ++++-
 drivers/media/i2c/ov5675.c                    | 16 ++-
 drivers/media/pci/intel/ipu-bridge.c          |  2 +
 drivers/platform/x86/intel/int3472/tps68470.c |  2 +
 drivers/platform/x86/intel/int3472/tps68470.h |  1 +
 .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
 include/linux/platform_data/tps68470.h        |  4 +
 7 files changed, 135 insertions(+), 10 deletions(-)

-- 
2.53.0


