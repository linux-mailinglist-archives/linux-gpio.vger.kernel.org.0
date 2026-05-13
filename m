Return-Path: <linux-gpio+bounces-36796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLcBNWcFBWpRRgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 01:12:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745853BD22
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 01:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23975304AAAE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 23:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF363CB8FC;
	Wed, 13 May 2026 23:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O32hodUl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D053B19C2;
	Wed, 13 May 2026 23:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713922; cv=fail; b=CTzNV7OeeRTG1uc39HrlNOe6PKe8H1I2NgD0I9K3dH71Eqm+4fxI4cW5XJUIOfFRHO8iYELgPNO7o88foxxwX+D+blAm948tvhdZLAVyVB7c8UhcxF0Wo0GZ/l8ztZz0HmemsIDsRblTVaqPzYd2eUBAx38fbrnReKYOi999ij0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713922; c=relaxed/simple;
	bh=d9Lofo1wXghID3/wxz0G6EvgDFB0dKHehGhBQVfaQI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YW8QxNBkb7BfcUaRUt8L2OUvpYO9g+l0Yxlal5SHui/DXDMqEd5p7+XQ64XdocL3VZTl04cxHW2fytAlVT/lfPFakZS5RB2lLK3junmQM6mOId0dpJcsc3OHJW0fa10w2zEfAW/E4jK7LlZurLoRmp1GbFl6+2XxcBQyns1DjVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O32hodUl; arc=fail smtp.client-ip=52.101.62.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljfEXqgqSrxnPDv/ixm4rZaO4sLP1ZXYzrbcd5Qw4jDUevuWJjEQtfkAGfO8ur6XYoP0nE+7WQh++GOud3EnbW6afF14WK2Pzd91BLTRzUJt8eDa/H0q4uDBZ/wI+ZU/1D66hm06/XrqOKXQhrLvTU3DpF3Oe1xQxhvfUe1/KgnxISw/l2goyIVLkiGz9He8yty1NAFho/4gn8DXjhtX5hzaj2PrBJjppMmCIRoNFpHMyMMzSEdw4ln9x8zNHYtnnzDClMzwdbAiLvHljGv9yNYJDx68sC2CVlbaddOZhU6lVKbhzrONOLqUsVQSqGnIYkj6DrkX0Dh5rlA8EBA8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpDS66h2quhitSkmLfxaWTTGw1Unx6sX58m7M/iDdTY=;
 b=yy5IBwjoMsJTXgXX7MNnswJyLoYICI0D57jwsk+/ItRsISkWPfnL+zoOvzA4+7URyPiL/MG8iiUYyWF8JyPejGHRzsaRwg+uRE/XqtPsUjxDUO8BtP/eqAKtWSRqBiS6/YS/F0nyjd4YsYh3FvdJajnhq/4V6ZS+wdH09fhogCoVnzJcMkQqA6PouFb/8EDSBSrEM91f5O3uHjXw+o2ZFq31xRpR30tU2rhM2Su7fyDNqoXOhcbsourcXDymHxBgpK9dLJzqBYsyFkVrYNyJNKhAF7apSwZplQ3dlgFiK5x0wEfwIt8G0AvTF4LRlNl2RkXbbzYVVQWmUEQ0mI4zAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpDS66h2quhitSkmLfxaWTTGw1Unx6sX58m7M/iDdTY=;
 b=O32hodUlFzDhKLZP6x5gWUnqaw2XT2/5vV9+O9+c8OM6Q+c8w/YkA9vZwseYddOiMDmgnbjfxVu1qxx0Y15Nj5IX3zZlg8p6iCd1gS1S9eDTY0Rrxsf1H7I7sfuMetSgAGJ90QPJoQAtrH+J2Kqph+ojmscGGWyYo8mFnD/zZtY=
Received: from CY5PR13CA0081.namprd13.prod.outlook.com (2603:10b6:930:a::31)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:11:56 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:930:a:cafe::73) by CY5PR13CA0081.outlook.office365.com
 (2603:10b6:930:a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 23:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:11:56 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:11:55 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:11:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:11:54 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNBsHg469019;
	Wed, 13 May 2026 18:11:54 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Linus Walleij <linusw@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] pinctrl: mcp23s08: Fix probe issues
Date: Wed, 13 May 2026 18:11:52 -0500
Message-ID: <20260513231154.2703292-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 32019178-bc04-47c5-e76d-08deb145071a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bi90uPBsD8xKzZ4IQiN0mAOuxjeWC6tCXyIHahBS54u0lYzRosMPryBApU0CwAgo2D65NQhRNpb9f1D5LDAm2B+9pUNhUlWbTsy5PKf2RHhinWLwiGCO10jPe3cUL+72+ZYAXQdW13W7pSnfqpjyi/MUfy1g0dVDJhXiM/gLW3P3lsTjPpdLBIiLYIEq2iIx+D6wVX1Syr5ZMye+5xaZ62MWHzw0LkAP2sHPmFksWA6odHYy9RcfleJGE0de2rBxnMvzpjn2BKyuLuyFU5DjTkk9dKNF7nxgkmrGilIdLi+j54gXmfYWMtJsdbOta8AVjhmgUXW1L4dYbR45uDvMlppA2zzW0N9B6eZ1IAIsxFjZSmZwJmswoygarWONdnrvQ8tEn+Rgx6Jt+B9T/YOr0820XmMlAgI9ZdMlEVsTV/CYuiMZvqPucnjw89IfgfM+dIy3XKfgqR4KCMmnqyIWdtGQeBQVbBzf8DMgXkTHVcuAGLQ1c7ERAc7UJXFIJqrCF7FoLuhZwP3PkrHjt9sAupaxElpiQM4jluAHkSYp7tUTj7ov/pPTFcyvwtau5IW3zqVWUEjVfdS9cO3VDoeNHO0wavR/O5bMFe7ZcueOjX8oQi8h/ZCMMZht6HZ4p/+BXGglzjqhPy7lz0mTZyduQLupCjCEaCmPXlohrBy1la3YI7SAM97SDc0xB6ngy3FYWqbwvBUMnXeJybcUkM3lbvlwy1xLp5yoeNvtSw0Q2BU=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i2R46sXssKesSZ6xUjSaYifYAdj8G3VfFENMBWtz2hKmuKly1xZZVgEJ0hzICzHC8wd2ETqt7jNh2xjOOJBe7BSl8AzsFgGTHahH/rlk4qoCNJZVOzXj9d2mcvUBW7Tl4lwYvZlrSYK6HMKm9KmV3FdGBzVBcv1vXb+wF0tuhmwDXD+BiL76epnMZ3GGxC5+ybVMCcxXiJdkEXJV5OmTdhK8ldEv7mVjxjWAJJl2IH3DMHYJJ1Ut1dAqYdz6lUYWip9b8IqUk/YglNhXovneqFbMnIFANtAyC0rf9K9fyTyyXvcQ8mFXXuhUh4v4fx5/CTxh4Eycw+N/2FcCoQp6blmHTHC84HMNjXG7RTNiO9dTmmMvPxzeLgcyQr/5cVARb8d95STp5D8y01zs/YVbehYirGISEoKkQnOPIxAwuxrOB+onI2PYYAWutLpFI0Xo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:11:56.2216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32019178-bc04-47c5-e76d-08deb145071a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Rspamd-Queue-Id: 5745853BD22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36796-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

MCP23S18 driver probe failures on AM62L3 BeagleBadge[0].

Fix MCP23S18 probe failures found with BeagleBadge which has a MCP23S18
on board chip. Fixes are made up of initializing chip data before regmap
init, and using device_property_read_u8 to match binding spec. First fix
prevents kernel oops and second fix prevents MCP chip probe failure.

[0] https://github.com/beagleboard/BeagleBadge

Changes since v1:
- Add #define for base address & use instead of 0x40 hardcode base address
- Add patch 2/2

Judith Mendez (2):
  pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr before regmap
    init
  pinctrl: mcp23s08: Read spi-present-mask as u8 not u32

 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.54.0


