Return-Path: <linux-gpio+bounces-33134-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF79D/VrsWlVvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33134-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:19:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39E26452F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C4CF301DD56
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FE03112B2;
	Wed, 11 Mar 2026 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDKKaHFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD91284896;
	Wed, 11 Mar 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235186; cv=none; b=ujoIE2ShLw4HYbonQODeMVNB5pCX7RcQ2UVLqZyCc0BYbjov/4p0Pv49U7cvmD/TS7/ioEI7RUgksenb742xemqAT93IrCbgyvZ46i2DIVSjHUUDNHbiLdBqX2S7KWNagZ/KIMVBqSlczErnZul8YmTg7QLWh2W6CdSK24LEzbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235186; c=relaxed/simple;
	bh=ok2ruo2GCwVrf9XIrhRhncW6ucKl+R+H4UeEBH2E8gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S633PfXYm/CnG86sFAMcPQnmP8oOBD7fc/JOUCvuxTZu0o6J71vwB969EL5n8U10y5G1xAiGDiYYKO9JbOUCEQSlhxmsYiQ7BwpOpuT/N2i/K+PvD2qmSqXwl+7zvu38/xA3fKu6qRjp3+wYvOSbbW7NHwVwNmrJoY6hxN1PNaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDKKaHFp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235185; x=1804771185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ok2ruo2GCwVrf9XIrhRhncW6ucKl+R+H4UeEBH2E8gM=;
  b=hDKKaHFpgDD+7r2/9l/HLgv5VhNlsv069srSsUIpe/ZxGMF8R1aMuIwE
   M0jHlVoo/SpThCBraQ5GWlzZj4YR70zTEw6kwBWuLSB0xgfEJ50nUaYm2
   u3gYF8s13Lz1TI9EgaRi/KJb1aeoYltUf8zd/Mmb1e7ikYcO9W//7wf4O
   nVDJ5EVeP1IbriTldTlCc69rU0kbU1wXVkO/eUbXrEiRzF8ZmLZLo99Gb
   JllMYRK5ECBr8AtoxAfZhrzLvf9hp4zh0y/NrCAV1E9+UYwxB/+VIf+mV
   gKwLy4CDUjguGBqDse1n4h5xCsc44T2rw27IcWZZVYyIQ4l/ldecDzaRx
   A==;
X-CSE-ConnectionGUID: kPiIH66PQAOS4O1QKauIPA==
X-CSE-MsgGUID: /elWNJH0T2WsmyXElBbh9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74211552"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74211552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:44 -0700
X-CSE-ConnectionGUID: Koz1K3+iQISBzmOVaiy0cg==
X-CSE-MsgGUID: 89r7qE//SOeOQX/8856Alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217131226"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK.intel.com) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:40 -0700
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
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH v2 0/5] platform: int3472: Add MSI prestige 14 AI EVO data
Date: Wed, 11 Mar 2026 15:19:05 +0200
Message-ID: <20260311131910.835513-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DC39E26452F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33134-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

This adds camera support for the MSI Prestige 14 AI EVO laptop, which uses
a TPS68470 PMIC to power an OV5675 sensor.

If ok, including a GPIO patch to this series. The GPIO patch enables the
TPS68470's I2C daisy chain functionality.

v2:
- Add lookup only for ov5675 reset GPIO and use GPIO_LOOKUP macro.
- Use software node for i2c daisy chain info instead of platform data.
- ov5675: fix error path in ov5675_get_hwcfg().

Antti Laakso (5):
  media: i2c: ov5675: Wait for endpoint
  media: ipu-bridge: Add ov5675 sensor
  platform: int3472: Add gpio software node
  gpio: tps68470: Add i2c daisy chain support
  platform: int3472: Add MSI prestige board data

 drivers/gpio/gpio-tps68470.c                  |  21 +++-
 drivers/media/i2c/ov5675.c                    |  32 +++---
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 drivers/platform/x86/intel/int3472/tps68470.c |   1 +
 drivers/platform/x86/intel/int3472/tps68470.h |   1 +
 .../x86/intel/int3472/tps68470_board_data.c   | 101 ++++++++++++++++++
 6 files changed, 141 insertions(+), 17 deletions(-)

-- 
2.53.0


