Return-Path: <linux-gpio+bounces-32994-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGSpNu0ssGlHgwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32994-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:38:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26F2522D7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBCCF324793A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A300F3E4C71;
	Tue, 10 Mar 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l23bakWS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034333E314F;
	Tue, 10 Mar 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146718; cv=none; b=El7J7uXeA1zA9acJiMvvHAcB/uy5q2ybJy5Ml/bHxpKmynbrCZigYk2a6W1/HIey98Fb3FIzHaEm70INt19mQpLnbI2pQk+rt5hNstUDRaCrciYhKXej9ah1gaqmdK3RIUZhumtFiP3kSRTM95HEBINVdGWK++4EaPZXy8AanrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146718; c=relaxed/simple;
	bh=b7v4/4OAx2WNxqk0TKlPa4hNxFa/e/M/YBXjcSP7gTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKtz9/B4EQS6rIq8rUx0WaS1rh3FYeLq51oCYdVH1UETyFjNHtSU+I8dfyVbKJoJ2GuB8gYxEa1pt64/0Ew47vZkyIoUBk3FMZifivWY2Cn1pmUMk6TCmOaqPU+rhS+XFsPq8VRTJqh8tAC4I1YBUcMzV/GYePS7/QOr2xAMF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l23bakWS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773146717; x=1804682717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7v4/4OAx2WNxqk0TKlPa4hNxFa/e/M/YBXjcSP7gTQ=;
  b=l23bakWSnahkG0LO0BGWNpeIzuTwYcDlJuMHd3d15EGN0H4YHmcwEkro
   JyTrt3UNzM+DmyBta9xI15/P2aVP74Y0lXnqXPDXjliqHf4J4SdhVQa5k
   Oit3tiDKIrRHPMV0sfc709zlLfWTk7jBcgyWIJU6EKJPRJijnttEebmOg
   isNwsZvBavEOP/DGToUatTGS8RXVAWvR8e9zDfeSZuNAeDfmKxCIdPTeS
   Rru9Tw4PGZlbB6TtG1dBB0NXA1vRKoxhgnSa0wboKIR7dPtDCy2sOQTo8
   M0jg0IEvrDjd5+QTcm3wZaSxZUKC4hZdeJdYcrR+FIgaSjZT8hPqSX01m
   g==;
X-CSE-ConnectionGUID: F5lVDaI8TA6979RMtvNRMQ==
X-CSE-MsgGUID: LmmOsOkTQFCxUoLyHBCjyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74268930"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74268930"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:17 -0700
X-CSE-ConnectionGUID: WbrudWFxS5avYnIudslaug==
X-CSE-MsgGUID: //ZeLKUSRTCUfGiKQpnEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225040229"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.41])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:11 -0700
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
Subject: [PATCH 2/5] media: ipu-bridge: Add ov5675 sensor
Date: Tue, 10 Mar 2026 14:44:24 +0200
Message-ID: <20260310124427.693625-3-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310124427.693625-1-antti.laakso@linux.intel.com>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC26F2522D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32994-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

The Omnivision ov5675 is found from MSI prestige
14 AI EVO laptop, for example.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index c895584e25a0..ee070d44d5f1 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -91,6 +91,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV5675 */
+	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.53.0


