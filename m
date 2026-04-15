Return-Path: <linux-gpio+bounces-35160-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHw6M+9u32nqSwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35160-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:56:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41240373F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A53D8302E329
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 10:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E5B347FD0;
	Wed, 15 Apr 2026 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kYRhflMn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992113AF2;
	Wed, 15 Apr 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250603; cv=fail; b=QOOAORrX8hCwbZNcyxE7thriiLYnMClv4ByaAHAAXzJ+pCRjOEieY91Y10JWxpnImoslc9dldPty86D91j55u570FeHPDQiHtQQB9fUywMQgq5Ujn3xD1aj/akX5dLrnQLHaArvEHxElr7FYC4gzIaYPQqvPvv4hrEW2gLrXQeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250603; c=relaxed/simple;
	bh=MKFGu2/ngrBB0SkQ6KZo8d9kTpi3zkWEIkaCe5aDYxA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BRGD2g22AyGibYQtaZ2UJVaSiICJAgwRGjtuc6CFu8RsnzcrkWJ4XfUDR2f0/VIOjAz70z24Sv8xwz76Pz9R7ILiOUUg203zrut0DkBOLua8ZhLgm94/jY1owSEcUYoQm99AnmYjI5vhbIttUia8spAj0NYe0HBjil8dHDzl9E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kYRhflMn; arc=fail smtp.client-ip=52.101.56.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5ir10i0ENcCcxpGot+fZcRZ6KV/4Ye7hERB3cvqVvmNXv+vseIUKkdPONhtjLSM3IJNg4gTn9AdJ1DVjbo1GRCGygEznAEKwbgQxT8QTLNWHiLkegW5RMPU3mwkIzmpFWBSOKiI8JtbMPc7vy1HsEeMHbUkS/eJ4Eh2JTHo+D+4Pd264yIobCEkxj+zJJ9eCC3Y2JRcEQo99nFeLia94HQGcVqJY48P2Ln9Ni2cCqkrN0seOTGijCs9CqWlKmTxQqrcng9J5bA/5+OMSaHBbEpvig0/eiBK+3j8sCcUWgiuxEcZxyyQ9+EAwp+GjOFi2qCuQsIsRJ83fJj02nLMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORMkIirTVyqhAbhva6OfdO9FUeMUmniBJil9afulF/I=;
 b=GmmI9gHQaBKYCyD9W6r07CejRy2OSfO44OjzKVs8hdUIlpy/Jwf2jUyrAL1cOsjqunfkmmBo61j7LrSlwZPWUlaSzhWJG51yRzLAvWA0Ax2hA6/7U52W8rfKZnHzCRMOwrrKcd27YrKRgD60A5+wt7baFExamWRAU3QfXMZ4s/IzUDFnAtEqhBc4EF21P7bsxuQ5wjFfys0TarGVVl63Z/rUEKDNHGcx7fY6yq0dZQpNCLgodJAaltDyNqQNQxIpyRMY2PHw76GC8GxnEpd/MpNt/iKsoruort6VuoC6+MXJZlL5Wv5wWHOZ8OzMV4zdgfX885vjhjOvWqxxctoQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORMkIirTVyqhAbhva6OfdO9FUeMUmniBJil9afulF/I=;
 b=kYRhflMn7THtqu3fvMmykj75kg5F1A2lvpuzNkSubo7xHgAQpRMoFRGb7FuZTqEOL3/y2ur/ITz8vy00XJho8yH+ez1yo9CCpRLiqye4i6S0Xm7/BYwfoCKNQ/aSnBkie3jVfkAWXym0CwiR+xiamrni2RVNneoNMLteB+EgYJY=
Received: from SA0PR11CA0003.namprd11.prod.outlook.com (2603:10b6:806:d3::8)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Wed, 15 Apr
 2026 10:56:38 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::28) by SA0PR11CA0003.outlook.office365.com
 (2603:10b6:806:d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 10:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:37 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:34 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>,
	"Michal Simek" <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] gpio: Add EIO GPIO support
Date: Wed, 15 Apr 2026 16:26:25 +0530
Message-ID: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: c755bf1f-6314-4c7b-1f43-08de9addab4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mg9AcbgcY/WBKznRiMtAxjREuuCVFgxiBknnO1mhc/haSjtmb7f7mM0Z0LEkJHvbx9Urqbcsc2qjyZU91y1MlCegYF1X6eKku3yojTL2DM03b5sbZ1FHYXmJu96oJgZyk4ieyg0Y3fUM9RlgvCTdV0eTi8AmFTlry5N//xuGeyAYuZWudevkANgHDr2MxYcUjIfkd+2J+jGXEiSLLkDmMgI477iFSdRBcKrVrb8LyCdNrW1mb/K1DP/SLN5WAjUuMPplaHu88zTJq6znA7xJ8x/9zS7hQyiv8vlAycQVqyFbe9pukiU+/4g+bXR9RXDvgokX//cgI4vJ2nwJ+2whVM+8iRn8ZtyKaECMZI3Qr9yTqiME7ZenmaUa6husVnRU3bmrtgV2yUq1JQuenx5L0SWv843a1cCEc9BkK1qycACvv8/xa37TozwFYBXHVsZzF4kjpX32T2y+NS5PAVrKreh6DhiD4DRAjvB7V9+5CCqxLcK7KxCVCSPZv9WSirR4wjqMh7wh4AJBGLDmFMgTGEuElDo4JIOohMd4QWyVxQZ7Z9xpm+FvapAyjdvZ8k5mKAWpTdf8VMcwJyoUKSmVq1wBAdnssfGLQ1mxrZyzhi5Vsb42jyo8YcuPDOU5WmHVdKqfBfzxVocR9lbpzqykd029RKnTyxAG93y5uJS+dVbrEoVyqRLCynBtwqQTjcsB2TLp4rcxEF+PEfJqGulewAL24F+lN7CC0zASBv8rCiDhwE+364LS1OMA6JUnIIr/Gh01DiJss2Yz7zgpdLxRRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rus2fJN7XsQhXw4iQTLnaf/uEWwWO9jNcaNzEoQekmJLcZG6Qm6tt6ULfNkc6AKwRvoxB8B614SzqTOaQi4NLSaqvH/g0HU3D8PJb0QDcXquxiVJAI2FoaRdU/cpcRhRCJbtqG7MlV2kDPHsBEO2KzhRAVS6smWrdQF9aG0apTPUWTlmVooX5AKv5kDyfuP2Vdy6sN2/h0COIf6+HqpKcziofpPdTAe65bHFjN9Cer2FCBD3gkKN1ZLsFTjwgHExUAQhg0mOI0m62E797zGql1fnF72V6gHhBB2eut7OSXhpJf4qZdsuWv6HSnLLAECt33WC1KQKxfFb/FFuDkjIxcM0Ia+7j/ITVxoSfo0wVEkvtB3yq7udmyBPMdXVaYPwScS5vukdqe2cze9OzPqIhCwbfSzeo5mnkiIVJ/lQrfLceSY56DHZT79XYAgwegBi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:38.4880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c755bf1f-6314-4c7b-1f43-08de9addab4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35160-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2B41240373F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the EIO GPIO support.
Add the dt description and the compatible to the driver.

Changes in v2:
- Add new patch to sort the compatible strings alphabetically
- Add description of EIO block in the dt-bindings patch

Shubhrajyoti Datta (3):
  dt-bindings: gpio: zynq: Sort compatible strings alphabetically
  dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
  gpio: zynq: Add eio gpio support

 .../devicetree/bindings/gpio/gpio-zynq.yaml    | 18 +++++++++++++++---
 drivers/gpio/gpio-zynq.c                       | 12 ++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.34.1


