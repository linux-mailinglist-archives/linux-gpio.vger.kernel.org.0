Return-Path: <linux-gpio+bounces-38793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cu6AIJgdOWpOnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:33:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0D6AF1D1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:33:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=LMDdGOAi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38793-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38793-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7725A3037E7C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B3A285CA4;
	Mon, 22 Jun 2026 11:31:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023084.outbound.protection.outlook.com [40.107.159.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD62773F7;
	Mon, 22 Jun 2026 11:31:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127862; cv=fail; b=Xz8HQTF6cFtUBafyM5b+GAJp8JtCkUQq23JDWLP6M3m4dAQC6JlwaJT2eDa7BqM2Qqp6wvIutRSFjuWwpR2dthdz/oQ1e2ZYRSo0OXSKGiHNXEJrSYdK8X6Yn17ieX1HFgD2e7LRFIdZbXyEAks1wyVqeI150HUgVuRE5nV6118=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127862; c=relaxed/simple;
	bh=qx+5IuuW+YeiR6qmr5HAuWrBsg98REy71WUc3IXsKTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X1Ehsed2kZCQk/OTXzhnfOxvXoLhpCVExJB9zazhcwgDtZ7HWYU7mRoX4G2yyjBGx4cBfLI2UWn4moM2Kr9L2pD6z/RsladHN3wY5JlVWsMvRTYCAP59YzLarOMz0bNUp2PTxp9gCoeR07TebPDmnEUGmKInQXRE/c7V/6KZ9lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=LMDdGOAi; arc=fail smtp.client-ip=40.107.159.84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WI2ayX1yMgZIXJ9FowFUDfgTZgxGqrW468tdrCPtiDjAu/NmweY9SmcH2y26qqLix8Od29+6JOK2ZvlumS92hTjRgACOywNBUv72DRKfxM0++PiMA5KpAGNAmTRTH4uI9TXXulyDnIOxlccmp9j7vAUMYr2A4eflS3Io1KJYDSdXzq7wxAT0z3Dx2a6byXxjsZzQjPn+3Lz8x1G935ZYfsxPeaJeBZn+94i0BUOWs7BTyUtZgcMzKTzzgQ2ELL/pX3ulO2Zatqx6mOHyLHVgA+RTCRM+8hD+9MQ9sfGmFYCKi6gr+GjNRourSaKug2OYrHmDUU9XLxTC2tlROoHsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=hxrEbW5uhjH7tjCDpMfpE5hJwzptoKM+DZN6ANnMTVtq3UAfMK104BFAtX+K2mRQ2aRxoFGTSriGwsBYaRKgJoSMXTbN1F0FQakvbLbi5gIGdteCBzr8TetzILLv7qiWNHfqDFKc1MibpHSPU6KkhoTgK/nyCM6vHeM+vudHwQLVpUk87iQqLpsOusgIqoZHprfdpmfm6ajPd56Y5XLDZS/ZLrSuvnU8Uy+wznAfvrvgk1LOfMhZjZlRKpo4S3cZp6+xvwsZ3Odv3Mr8KQ8M4xVqCMXFSuVqbhCQQ5ANBnNiyppOeTiywYv3zeBy68jGU2xoaheaYzMWr7BBacPz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=LMDdGOAiRDfPtXmdCb1umNfrB5AY9fHsOW75kkD2HF0f6FkietCTxVQKLZ7CZgA3kCL7Kvp15IUf5We4Vot/xG9gQ7CtJwzH8IkUV03kh02g674e2Xt0nQCI+WrKUoYSkV4tiAsdYaU/vS8oNssTPgReLQP/XynU7X6XrjLpU3L6/Wzfot9LDoUT0y9OwvGRCCw63UFfZq+wJ5M1lf26+OEu9QSOL3wPXZWHIc2/WNAMi+l3eUb6+oJorlUFS8d2wF9mG6HMNRb3qLQlg+vYgiWEljVJEW/mDPtx/GLlIx83pVpPMXZUbJUszPXJtK+yZrIvr2SkgSk2KnwFzylYsg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6115.eurprd08.prod.outlook.com (2603:10a6:20b:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:30:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:30:56 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 01/16] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Mon, 22 Jun 2026 14:30:31 +0300
Message-ID: <20260622113046.3619139-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: b041df49-ce8d-4748-f0dd-08ded051b9c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IG2dkHfNl/g4vL0hNMRk/jc/kkOwYIM0eAq//JNIYGUb1/GCYyvbZp2nXdvV/hsgBm5nnIf65jZcxsNyEyOyBZdj9V5YLSIUQnHWySCq3apSd/ZnfIrXxusqfnIUMG06RcSVRsVcInsWj/DBnycMPwdeS0bzlZG1ZgugT1vlk/vgjGkIREWLEfECanEnbaD7x7czA+IZ8bXywAGYbfbC9TheRKO+m4SX5m2Hy2zo52M5/13ORNIeTqs7DIigPDHcc+ZUCXbXmtBwlrnYCmpi459vrrdD/K/kCRffNXZExp+JaAdJkgbCj9KlqjWL7fhz4Uud5hPxzOLebNL2k88RNm3dQKONUPRz8G7lDVLqzkpI1aQdEp1nYAsWx7k6qThoV5S3fMEWlCYxk6Ujk1oHL7yISUrrKTUsyqQJSLbVJXsxlkkrPceaTkg/kRgdDEe7+cHIRRVrDt8QxkFj0GKRu8ypopZTvZNESBHj4BbN8vBgOcSb/8HsBWDvZZzzui5XqDNW6oSeu0ksKHZ/+f/WNtldt4ld9w7//TuRoh8p5AXdXCR3f+sr4digr8lhkN5HaAuluKrasiKDaF0EhH9Xlsp0XoUBQE9XyicDYWW8Ih1Vo2FPipa2PtZ+5cBhjWOoK2RsOmY64gtvy0hYdVKRJCcz9leDEp4K0QUCGN7JRSQ2pc7zTVezyktPm3pf3LuZy8X75+7SxKBufnrnDOQzwFXoIC3tII0qDiG5vxvgleI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HjA3r6E+LbwcTJRN8o1aQ8mxB2oklV5aGA7aIM/zX081K1gEpjMvU/shx9fu?=
 =?us-ascii?Q?ShISOpqVPfjUhu0DtNO3+m+CzniocpXePN0dVMax2cbsM8XyBSoNq7h7fJ9o?=
 =?us-ascii?Q?1UHoo5DeqC4ccTYQJsHB8ZSSp3dwW18/sw5qSGjDGS05g9hgPWvg2th/kl3X?=
 =?us-ascii?Q?zG42IGVGzdZeV3RMt5WO7tFEcdrOP2e7ryk8lHMp3zX1NadKMnIeqL+WbWqX?=
 =?us-ascii?Q?Ikwhx0PT+O3qAU7n7URj7C4zsPZx9mPu2Naf6URRTVsRZipdWwWHTIOcPGm3?=
 =?us-ascii?Q?xxxeRHse83tsdw5kfzy8H7jJzDC3dhavdqq6sqf534iNBp+ssY642A9UzVJA?=
 =?us-ascii?Q?gyCHJtIeTMQtXvd/R0GvWOs6JB45zPcWBd5pbyQpWpEgrQpe3av+LfWvSZ1L?=
 =?us-ascii?Q?ku/u76KZdHAt8/0uVpHE2TBJiaXJa/eycZomUI2vCwyXXSCjCGLxvf8XAFzs?=
 =?us-ascii?Q?Jto/Jf7S3orxxtHCTmtPZbgAiPyx3fMAvbnuOMjOLwdI1TEyhN3st5AY+oWo?=
 =?us-ascii?Q?p3DvqZzcPdKPqKKgr+/ij0PqDTiTOyxcFIrqSd1qGkh1qQMGMwG48aEcDUeL?=
 =?us-ascii?Q?HVxXnDqCA1dZRTny65s1GNBMMQj/Jh57qibqu+h9yso0zYCTSwhRlQ2/C4eO?=
 =?us-ascii?Q?JRb6MthvhWDB0rtSM32qJ9Q1AP92uNR+CW3+1th4WXyU2EBBBNxN0Hy09FEj?=
 =?us-ascii?Q?pmc7vQ6iRyTlzmdn4o3vgM88P3oEJ7LinL+fMMoRfNU6O+kYjda5ejliJYOP?=
 =?us-ascii?Q?oomEQPPRXwgS/T+PcP27W8jMyleLJ92w1qlbvWUHg0nY79yW5452QEVO/WWq?=
 =?us-ascii?Q?euDmtWE3g7JqmyrZkyywIdEkPnG7bVgputT1tYqbQJP037uoJ9GkCohPdUKW?=
 =?us-ascii?Q?0TsSHvTWyaRTv0hcahYNTfBVoYj4pnx3DyIwbVp0AL5X8YdB/LxK4ERxvpmD?=
 =?us-ascii?Q?5IymC4HwInYfrK1SHuf6PTevnMdAqRyMgymT6ZW5RnLtODET8KoRb+XLZtja?=
 =?us-ascii?Q?GDd9h5CLuXa+IfqDH7tyyE+XZ4lr89RpBAtM/jKPZQoXsPa89/YffCEe8pWt?=
 =?us-ascii?Q?xOsuYZ6JMZfOb+8M9L4uwfoJuLaXvUvriHyw50lFvhxQnaXavNyLGtawmlsv?=
 =?us-ascii?Q?tf+FPC3MRysAnjqJ2CDBooTLSry8MGHmECawNa6m3nEMNcu8z0/cQSdv7+1C?=
 =?us-ascii?Q?JlCJfjkAobiLQA4MoQuWss7iPrCbLcbJWjvuN46FVSbkfJ+Q8CLbWJ/3JBc4?=
 =?us-ascii?Q?f5Hukw1SsNvOePA5VZFUptmV4RcPqEYHG8PFayx91RcxTiOnWvduEPKLfs8P?=
 =?us-ascii?Q?ACsbw3gmjZWd5nKrral4s71ylXD6+SV4V6lB67ZPSCXMWIS7wIWyrJJkMy3G?=
 =?us-ascii?Q?TQcN515xm25+/DVw4BFPs2pH1khsJKVotM3+qFjB0yiXtHt6cyKYYzRC/RQR?=
 =?us-ascii?Q?pcbdYnBdLWqWjyWc8Dlg8cvzcK6i+pyn8ww6G2THnY4Y5iJ9EeUpuOW/THYI?=
 =?us-ascii?Q?DAkiz3Bnyhc3BMiiiQrKGc7QxvdB7P0Ew7QU0vZzgmFiy2GlqPqqcTV4XSi8?=
 =?us-ascii?Q?PKqVvGIVU1Ah3aGYSgEXVs9oje2+mtbJlCH/Z9kkhPJbOa1aAT9eKhtFLv3c?=
 =?us-ascii?Q?Hmz9M+u5ogfpeiNAcJWraJYfxYzWrfqjGEctBEic1gIW2bgWSYKhM1gzyyNH?=
 =?us-ascii?Q?MoJHyd8evMXBBTCWBRyoi2ALb3X7zQk9glO+4r5wUoaCiz4NnpvnRA0sNn8L?=
 =?us-ascii?Q?toW89TdY/rBcukSEZcnvRYdflp6cKEY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b041df49-ce8d-4748-f0dd-08ded051b9c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:30:56.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILPZCWw27LTx4geqVLBjXxGIrH3JWr25y+z9F6aEcTHkGn5cUP6YEQ+JE1jBWt9j6tQcpxROVIVoN+hSV67+iIdO8lvj675ayjwCWLXq738=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38793-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D0D6AF1D1

Fix misprint in bitfield name of GPIO_2ND_I2C_MODE register

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..63c82268aa82 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -1026,8 +1026,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0


