Return-Path: <linux-gpio+bounces-38041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WO2bLHu5JGrp+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:21:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FF64E950
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:21:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="3/5+rL8O";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38041-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38041-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19F6B3056C02
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019E81C3BEB;
	Sun,  7 Jun 2026 00:17:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D711A6803;
	Sun,  7 Jun 2026 00:17:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791442; cv=fail; b=NKLS03flUIjvfbTNL/vgVOAfHnomUuF9ky0enBD4sn9/7YW4ELzhxXNIqPkeGpQOGsaDXaQ48rnp/QleiU96H7cTpLk9o9FUzYEX4tXygLfrI4NXoE58/m5llusLKtP9YTqYFzx+4iBvZsLTBYf7HFxiOHGYnr5a+ycq/TtIuAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791442; c=relaxed/simple;
	bh=9oOG8K7QRIPaleZL9ZtqFPUFewWNA09bbHhqigHInEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dB3vLHhwIiVaeTs7O9JJBmBmEJTKPVdImt1dirJRIy3qDuqfxREQLEJsXArrTIQ8rePtxdaZMOZrehZSej/J+vJ04Ui6iPqX+dgaBPPoO3mUleKJdtiCLVmnJszk2hqAsE0mb2NIWV/hb+0l+xRUiKj45rEeQzMO1Ifzt4sDcqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=3/5+rL8O; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuhChShcRWZqRKb0GWnvydrEc0S3RkqiWLMZmwGkSbfTU3D7fAsMhI0GLAahpGvZnpOqAtnUHNnvKeJCEKc4jGfRWeZEHqcEQ3/MXxfUBuGXtpv6I7ujP8qc5EF+A5nVsUMMuAiHFvgNQzSQdE898x8dnWP/JIZZZKxBRlXnnrH5okd8JrF3yxTuLEYOMjMOBXJ6/tRyRYcTJim/pkmtaVgUjNmiom+IZfNdOf24VV7QtNPIOppTnm8TB0n7KBXwNAy3yJ5rxV2rn3/tioA7KLpsOspJy7Er+WiIYASmCVmcJ2NEWjMuOTyCtHWg+3W2XOvd8q9Ga5RzonOFvLVP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoqzWqBgpOJboCPG/eb6fBd2AQ4JjLgDF5xasM7aoCM=;
 b=Iw/vq5MMc5lEzM6UwFjnjzAgj8I4BmWn9lYO0z+oh960N8skphQIolZ7Jprc3ynuEFhmrZOvwov4nixOfgHmxbrj6bnBBTJcEMBTCbsVAit8N6WIiTjROyzTBzNIirszI0uyhuKthhrnhpV4apysRmr07cbdqSRZrEbqBis9luGYmzJ0XQ+ZvUTaZCrQlr1DOYqNqKLjhzC/LIeYoKsBp4jYVrYhdUDFWbXNGGTOvJH5lBvUzBxp9WnlJlarWS9kxOxD9yi6DBQlQ7d8lOVEUaRy3bzunR7zqPCHBPGoRfxzDOzYonWyzAvIDZk8bK8Q3dSAJQYQ6csfdakmyDXklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoqzWqBgpOJboCPG/eb6fBd2AQ4JjLgDF5xasM7aoCM=;
 b=3/5+rL8OVK2Q2dt0+dzF5shY5oKFoTXrBt7y2+j9GdjbQ3sVSqiLN8cWrHm7HzZLJQdgd4rXU2qoos0s0l/H9D0DpziMtIMT/aqn+NikuapgnyeYmJXyC1ywi1rs9THS10eRz/Hms5gJ3uKYQp63AfNsVybecI7CZTo4oqjYZsA/81kDd2bfMl3Q2zPc53eaZWB9KHVOryHFVVoL63xuw1WXa/L7echbVdrJVHDYfrCk4hFUF3SdJJTZKPi3H5dd6u5XCQOQzPLIIEVVhpMCIAxX6Np1/aitH8CT20/GrhzVV33t63iSwsqGiD9t0PlFhyd0FT4l6NHLUsk4CR8H+w==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:14 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:14 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 08/18] pinctrl: airoha: an7583: fix gpio21 pin group
Date: Sun,  7 Jun 2026 03:16:44 +0300
Message-ID: <20260607001654.1439480-9-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: 8675ff1f-4ca4-4561-93d5-08dec42a2017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vpEMC8/iEz4qKfgQQXphUYWzLTQlypWcXbmD+RRSjecNsn66D9nm8s8BvGrKJ4UZzFAu30Ityafsa5Qqr+qqnxsVxBtGIlmzIImX2v3gf0wBqPjq+Xupj1iJL5ZlqGnT5mGqqr7NEsmjAvekGWPPXGcSceZep+ye4eDYDR9f9e+MiQrLoprA351EARnq+2zSGDCZ9w0b0SuC6jBXCCLCGksVP9xXj3hmehYIHBUNhOqdbp+673sCJyflUv+9VgfH0SatF6tNL2VKD55mDX+f4dE3laD9AdhQf7Td0SscH+wekUUuMJm4Y6wjN0SkTH/ERat3mBHYx+LPhW7+efDKfbxUBkp/d08Kilstk4yBIPGCTprXmFtMbYtw9TEiLspTpY4XVej05bdMYsuq7mNVgrA4+wVzbxrifQJ1gFx8o8e52Z7IYr4Lk9UZs2jnz7xanhbn22R0Jml6cFdEJz2RGwPWMyFxxvHiNTkUFNkngPt0RnT4x5EFTrgc4JMRHkjOW41OjnfU85Nnwb937JynHE5fi6itv0K5d6ZwhJL7K4dQKfRxNy8BJlugUdYzdaix6zQ6hMfkfNDchsMauUmj1jbDbCordv9kVrXD3DhUzREadCfXNzXn76Im/ZF2awG7FGCI8yMFrcdXXZFbSM6YxMf7WE+L27oD0VMf8CsFsBQAe3lXwak8MYRoAY+gACQJjIMP9k0b6Td/ZhzB1kJBhZBbAlYtjGrY9bXk+aC/99mAXkKgTf4COh4RKyQdesy+bjDo79EBzJ/mrzAupEJXsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WzTsoMIbEpMCZyxQ+Qte30jKRiv2uAVHiZ38LCTXXrt3Bk/ECgohdpnAG4Ej?=
 =?us-ascii?Q?rz4I3IhEpYwMs9d+Zi1O61F3ouGNyhROA2cuhj9PKOjIhuU4wiipFkqShguI?=
 =?us-ascii?Q?6LjhOpIyKrpZt1ZwAHCk7DqejWTjRg1mJBOWg0uyIoJWwctIzofgL3L9MRxi?=
 =?us-ascii?Q?GPAkVp8zgtoEtl0OeVQeh8Y+9ijydmeTDT7DHarunRHU3mF/SgWw9wAlnocj?=
 =?us-ascii?Q?BjXt1Nl9axSYHi23x3sW0gYvFTHe1SRlI61r9uD9GCTQYxfHHs9kvJhI6y4r?=
 =?us-ascii?Q?eot6m8s96qLbvoah/nnqqtlIFPsUOxe2sFVS1C+/m3yxbGz6/E1Lh8JcH6B0?=
 =?us-ascii?Q?GRA3bOp7Bs0YKDGDv04xmoPjUDAjYxJmzqBfHmvydKzTBqpTW0hjWpw4AqSr?=
 =?us-ascii?Q?Od7Z86f/7uesY1qbu7y8tOfE+G9JAhfcmCeaR7YxTVUc5ny/up54lsA7NUsM?=
 =?us-ascii?Q?uosnECimhUvJcOs3Pl/c1YRlm9nExblDuM/KAwfUc1nna7p89yOdgmSCkry9?=
 =?us-ascii?Q?Yr8b5onGmXmixHJ3BpP/z9dQU1UfHN4aCpwpfaezSN1s//1jhOhxdBz10aw7?=
 =?us-ascii?Q?4QHW2jvHaHXHH8F13Orlc8jQGJ/OsPkea9vY0OgwcNs6+MEp0AeUcI0S1k8z?=
 =?us-ascii?Q?1jZHFDJVG1UcEaRRcPZ4XmAfs1CG6iSnjGwrT4smkLvoxXBz+ImK+xZpU6Fx?=
 =?us-ascii?Q?9v9SHIZpPgF7Moi+D1br++jbhnREjSHjbPGKF8s1pw8kOvuug2ug38R2pQF2?=
 =?us-ascii?Q?sbywXXMSxhzsrUIqOztpW0g5+PsfHzcJV6/n+LipDO0aCNqvVKKJNd1bg/qt?=
 =?us-ascii?Q?2NXN3gE745W4xwW3p2Thn8oqumZbBxkaMs2JzmbrZOeMxMdlFazNJOA3tDAB?=
 =?us-ascii?Q?6vdSMslco0SLVX1OgrF3yIjObo+344OE9R0pWPOrSGVFgMcVESWiNMBKIytL?=
 =?us-ascii?Q?ZtwHkZxPNozIQl+t36eceoHd6wdofRMfiS7RmDKdV50rAdYuR2dk/tKb6GQl?=
 =?us-ascii?Q?K7WxL/p1R/qrKMTQBOhGKT7XfZNmdH4n83wJ4Faj8FwGf6sk9eL2rJIyGXvn?=
 =?us-ascii?Q?FY8DLDi53fpks08sOsK39bfJ5jI2Y7FKUifs7KS7GFYR4nYMcY/kFwflAeL/?=
 =?us-ascii?Q?o/QYXqYzGGgfaNKnHOt7Xapz8Sqj48qLSQut7L9XyyOKvh59cnejo0i7VE9B?=
 =?us-ascii?Q?LSItX0A9vvftVaMV58+3ltjz3O/17N4jYU4npgIdud8UuzlUttaqe5X/QoLg?=
 =?us-ascii?Q?mfDu5nk5TootbKgrfMHlxcLS8XrtQXUD4CXQpujI65YvHWEyRg+sdKhvshT+?=
 =?us-ascii?Q?1FNbmDpgP+Rp0m+MBkyc7HMypcUCrMD4Zn9m8SmY5UeFCKn136k6u7n/K8yT?=
 =?us-ascii?Q?ngGZwZpJJgMQrC8NOc2h2x38S4kehR456DmFwTLtNNTIWp1lp4/ModrJaImT?=
 =?us-ascii?Q?cB2QuwEa4+R5EpG3g3F0YOyaN4myfgZ3XOv4PD/H9pC5H1yvypT8vVwKOjD6?=
 =?us-ascii?Q?grHs73yZqZ/2smJAtDIgEs/T0ySyNghXWGuA8cAOR1NMwycA2q1nR0/hWvqB?=
 =?us-ascii?Q?WbP/mSYHvOB9oSs6VZbS2A4nwn/DERKS1nYoYsUNWWfqFBhunxykXX3j8UtT?=
 =?us-ascii?Q?RT9hNhqAybb4mXmjKcWDAI7V3kXDQL6spPXyPVx3pCTruaIIrO8S48ShJmFO?=
 =?us-ascii?Q?7Y5QiqnwTFlNhZs45gCKXR7v2b0BfwG6Yb5P62d6XcuwV2za3TQSXywKI4fV?=
 =?us-ascii?Q?1Z0s1GtSuRb5t83jqM5iuMdPaQ/Qcus=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8675ff1f-4ca4-4561-93d5-08dec42a2017
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:14.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGz6HpwqFXO3uxsmWaD437rhvYtbWXqk83rqOxllfwwM9F5wG4aRSWxjFgVtab58uiKOJw4t9/LRZTwD5bAYjbtgk+griMp6zDPFZeDlIaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38041-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 430FF64E950

gpio21 pin group refers to gpio22 pin, this is wrong.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 15a541724349..9dce3ed6de17 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -748,7 +748,7 @@ static const int an7583_gpio17_pins[] = { 19 };
 static const int an7583_gpio18_pins[] = { 20 };
 static const int an7583_gpio19_pins[] = { 21 };
 static const int an7583_gpio20_pins[] = { 22 };
-static const int an7583_gpio21_pins[] = { 24 };
+static const int an7583_gpio21_pins[] = { 23 };
 static const int an7583_gpio23_pins[] = { 25 };
 static const int an7583_gpio24_pins[] = { 26 };
 static const int an7583_gpio25_pins[] = { 27 };
-- 
2.53.0


