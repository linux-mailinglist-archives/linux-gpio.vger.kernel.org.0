Return-Path: <linux-gpio+bounces-38538-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7wbVHu7PMGphXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38538-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:24:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF94868BDEA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:24:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=abqjVM5b;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38538-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38538-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7364B3186369
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6196F3CAA2F;
	Tue, 16 Jun 2026 04:20:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD63C8C5D;
	Tue, 16 Jun 2026 04:20:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583622; cv=fail; b=kfYYjzGvnn4ze/eqzvpsKot6qoSKE+NW3nIv36ao/mVwL2tjMyMrgwcsTk2nfELoQ/gUdkxebgykyQFEQWv6JdOr+FClT/Gv8tZaLTJtOCNRgRfqppVIKNQ2HgAr3T9kTL2FwU5GDMsz8aTX5ZWkwJzzFuNo752Qo6zBLooNKlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583622; c=relaxed/simple;
	bh=bHWT4kit8S55Be7fHoCC0rpSyzOJZ+kVaojRuh3BBOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=susoDIFsKwtnxzh5gBdYpTcumE/SECGbZtFITpov+/w5G6xAmqn6oHxNJuQnwsjqON8V3b2MKcCSacs4Yzf9IYUaKfudfTKeB4+7DksnFvfAeVXJGsDBzp2EJKq9tUaq3kiBqf/cizHTdYKHeL7bR0/74upV4tf7XcSPGwesoO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=abqjVM5b; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfnRzDb5RCsPvqn3zZdEBCM/H4fyRNt9mgyCFtyWAPMnfxhsm+LXwcI2j/Ivu/w2vJI1dGWeHkJGtwhYM3YcKfkl3+vTT2vPALoCHJs379IapNhMnxln0YdDAfGM1wdreKj9o2G8iA53BLvtTc1nifYZOHxNV055UExYsqbR6TeMgqv+DQyOFLZHoDB7Pwhpk80DYEhADnrqVsNqJxawZaKDW9BMksWEJLt2/jv/ILuNYvv4Djm9lmXfRXF85LDRAgVfEnsdhsArTniz1wKgMPfhLPUfxUUG1ncmHAODOSPlCA/L7E0UbCKEAn0Ig54zwh88auS2gkq/CvM3sa6nHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm6ygMX8R8yh4P12lg7I0hU5YmvVHA64BmVBOhvlHVk=;
 b=R3yDCbhOVagQlvcVl762mrCuHQiGztBjm5uzz02uOmMl9d+zE0cWQbaEAypRmYTZ0KJcWwIzUdcMpT3Xhx4kVoqAfFikETNmKRy268AZ8piHaX3+SGW2SSdH3DvzYaTrOSitR2TnfZMRCghHF1EKnVFqpq+TsznARw0z/wnCJI1CFX08+dwNyZn2dti6a31J4FXYEnGHwJiEnXAdlDGtcLQv6W5wqXvFimF8SuK9MNTS0hJ85ETUmj5pjfTkIstpe+lbAeJrRP/ZFkN/bQbE5C8cq7hTJU3jm5xjEzzOdkQUF/OY36v8HLVMksFDb7RzFZur0fkvoB4TJ+IrQBcG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm6ygMX8R8yh4P12lg7I0hU5YmvVHA64BmVBOhvlHVk=;
 b=abqjVM5bIIJH2q6vmXNeXumcr07nqKoeqZpZ3gwqe4DWYtXuWeUUARS/2TLvcZQuwa6ijVceuRTCKrsBNbUTcVI1z1+QcBnRHAZmraDMQF/7guI/HeOms9oIJ5SxdoFvPXMtq51s6vKL4haIKPnCXV0KizJrbVY9ypdsjewVGG5gTAbDbmfg9IvtyXzoHIg70onLmkR6NWanvoyySLKPBtKlRiU8jP6PWRSn2c2YOM1egPeIegGuO75RUTFGfASH3VhbwNE34bduOzVGqkZrvmHv15h/EyG6MOXIJQrm0lcaCImnHDIUBEwHf+uHkf8+nxYuKVNT/0UCfCzM+qREmQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:20:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:20:06 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 11/12] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Tue, 16 Jun 2026 07:19:38 +0300
Message-ID: <20260616041939.2587012-12-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: b79b9925-f239-4742-8ed5-08decb5e8b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	akT2+H/vny7UapKlyENs2G7+NW2MTg7QYGR0tbxwffsGCggPzqgDeIKUtNUqy5K+9Hp/QN/u/IrbuWCIRpAJfzbXEB/NtwawF9CsbPo2nyQy8mfkTpKzBSDFkEmnLMn4G/3ifPTVR5V7BO6aYAxJyrHFfrJSB3ik049hftTdHLG/sB+1bfECrwDUct2QSwE5HtuYlqB6fRr6Fhe9eLhHHDRxec2NqtdovG/VVENv9nbUlJKiL6rbmRh3QHEB900IRrUiq4Zk27NnRnobToCjMMzwXHgBGRJfnHfgGRdeaCylTGW0JkMCpOZ0VjnLaGgPxewaQlT9VtRFc1N56i9oKDz6P9blQVQnjBcubN4CHGvHZK0f7aTvI2ma9CXU5uU2LDx6iazp0fnQFqrQCnwmjj59//Y+ASj2DeEwvNe5OtUX0IEdRg5KYJ9S9eQAdhxZel9YgC6ll1qQigju5WE2tnQDg80QNT8S0I/Z8l67qe5a1mCFVSG0cwkL29Ek3eNa7rbYjX6pu/vFc8iQQD74g5QN/iB7FnVy5MmfCPAq9qkcP6+vBV1GPmYB4h42R9By5kgboSPXqe6TLqdHvi4BitRU9sXw6XEPe73U6ov/0chrfKdCY9NOxBa/pb/bRuIww7c6wIH/1cq7+i9rWAd4xE8sHgX7YfuUoJoAtfFFRIJbodMvPvmSyd7TYfORQNFhWlYRtK9J/BKZBaWqmtkarCKXbbYT3sOacn+cc/RAJBo8WNLttzR59KhpLTwzVyX2bxDtrcv0NFZ+cM1PpG0zDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?niRg/MkU1JZniB+xvWZpkNmGOInuaiaE0oKdIPpa1shYcZvfdGNH164Uvw6W?=
 =?us-ascii?Q?et6ZF4kDg4g7/kSIB8rBbwXU6GNLBiay1d7yfgBmXYeBwYX1196HwGbLkLzV?=
 =?us-ascii?Q?jj38+yAnrCATcTzwhGmGq01REMB6fNf4DEHs42duY3crmwHacTuRmYXFSKYz?=
 =?us-ascii?Q?Nv5e8dsTyIJvOwKonv2tM5MDxMDJh8pjz0WeqC5nVkZAv9IPbMMRmJUDR3jq?=
 =?us-ascii?Q?q5FBy/MxJAZteIl+Z3iCo1OQZUm0yXy2y1LbditM+kuA6fXKFtyatVmNqOm4?=
 =?us-ascii?Q?+tkzL3UpfC2dJWf5wRRgf5yseGNpNp3cpalhM/lJiMDgp7hJYx+EIFZgigtl?=
 =?us-ascii?Q?3qSG4ak/BMHyNpM5hPNw2gkNP5EefqGndZLhGZw1/w2w88MNKvM5tWGw0x70?=
 =?us-ascii?Q?4xUQqbScJdpVF8MtTab89Ci+zzHoHfDjcj4cqgSzvDoship2+Ds3+qhZYRHb?=
 =?us-ascii?Q?evMxeE2WJMJ0rs9dXaxMkHPue1nQpHZJz5a7Cu9lJVdJ03mV148nbkPUKyFk?=
 =?us-ascii?Q?/Yv8pz62NFovb+MkP4q5iqY4aRZbVGXxpx9ulDgh2LkXUg8pleTqtFiJ+cJT?=
 =?us-ascii?Q?26j6130OzgO9Gp5p4ns1jd8dyfUmkx/wvC+OMLISyHFiUlu1t0RxcTLbuOny?=
 =?us-ascii?Q?pQJ7aoVpq7k2pRThJYvCD90a8N0/atXviMWmwp6+MvppS2m8tPY1UAL65wNN?=
 =?us-ascii?Q?1UPMuFAl50v8UnnvwPrE5rzSKp+/V3Wu5QOy1Utcp5oBEFclGjpY/AWyvuxI?=
 =?us-ascii?Q?Sz93DgXOXFTjuVFztxLeYt+3fghz6Y2vrBY5VIy932bVT8DaL23bhbNlVCGQ?=
 =?us-ascii?Q?GxYh8PAFOorpEScYd76IYksTnK8I1zVZU7Oca8ph5IzU2Dw9FGnUS9GSbVng?=
 =?us-ascii?Q?ERjngdSivV5e9FHq7+j18b5cdzvrX1NfB0KEGN8bC2TNIEYewlsLB00NoGxp?=
 =?us-ascii?Q?+LqpE1KgsCi7w33KoVyZ4/ZY+Mz/x6wg23wJyV6oVGz7rAhiTyuiINg9rWu6?=
 =?us-ascii?Q?Zq7rjt/KspAmqEtzkYkfk7m4sjhHJdoCsu2//8Fv04uWFISayNqOCECqM99p?=
 =?us-ascii?Q?OyHsAPn0bA6g5mw3njDFOLEc5+zZUy7GuKQ0fW/7y3QcLpeN2R6p5J9xYPv2?=
 =?us-ascii?Q?ONq7ZlzQ33KYR/oSAKUP3HWVRX8KMkrkVVFmKxWN7Uq/wEkE05HO6fR9Z8X/?=
 =?us-ascii?Q?CduDFrS37Mk1w38LocFehikZXf0gDQFEFIxxpd0Ogq8OL8WCBBTPmIJgHSXU?=
 =?us-ascii?Q?MhQPRKKdvLCm99OvhIfywLZKpMY2kBLkCX3WoHAvyq8q7Dd7TYqFWU6dygxQ?=
 =?us-ascii?Q?juChQCuYf2jNHGN1NfofMDwzcZdZTzLn0PKSrnGIef8KVRCMiGVApHW+DiXR?=
 =?us-ascii?Q?WVGZD5LO0fBxp3pO6PUQTOmXGahIRvUJ0eFWIYm0z6ev//ARgoRSKXEBBC4Y?=
 =?us-ascii?Q?oW0s33cr9Hom+YuAfRrb3dq6YvH9MPxBORrQyr4wNufbUBYW2m+fkY0tNjbY?=
 =?us-ascii?Q?XD+lCnvlMSoaz7RA8YZhOxHiZAi3ri2fIN4szjRjF0S62M2IUFhaLAhFxpvu?=
 =?us-ascii?Q?5yBbNJvane+r+tAmTeRBGiDAcxKG/6G+DHMd9mk3D3xVfpsmMqumD07ePqqC?=
 =?us-ascii?Q?urCuWEHDsg4BYlJJ3uvcSqRjFIzOe9WSGiSU95FvhftJIWk7/IWfv2Ytnwl7?=
 =?us-ascii?Q?/Z/ZDrl62/ALFBnA+lSRqpQvQXczehNGot0sIQngvXOIv0hJTgkzwxlkA9il?=
 =?us-ascii?Q?SfAMmO5b4GdCc5gHRnLMkK9+CalCABM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b79b9925-f239-4742-8ed5-08decb5e8b7f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:20:06.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/lYJC52rRkC+mVOo2W8iQcFv77wtwvLerEljD0U0R4U+7QiOozxbAg+jeCCG1n5gSMxQf3tCM30iE/h4E0lE+/vklYSvT/MBrkXogNUwIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38538-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF94868BDEA

add support for pon pin function for pon_alt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 959eed06fead..6e1746ac0ce5 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -479,6 +481,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -562,7 +565,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -629,10 +632,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


