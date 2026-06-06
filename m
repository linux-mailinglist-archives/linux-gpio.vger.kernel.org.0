Return-Path: <linux-gpio+bounces-38019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UbnxGC+AI2qmugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:04:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5364C297
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:04:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=AVABWzms;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38019-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38019-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B1A3303D575
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB1726A08F;
	Sat,  6 Jun 2026 02:04:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05E24A076;
	Sat,  6 Jun 2026 02:04:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711445; cv=fail; b=qGh4rHABswH4UHI7ATCMRQkirvKTTbacU/AFYZ29D9HB9SqK66wUsEdcl+QoISPsBJbdqRXF6UITbVY3Ko4hykFZVzjhkUw98AFruIO3luq7n1HXOuQ2nbxhOrYyk/jutFVfWrlPv2Db23xPuyMsu6leX61xYsaDepLKcq8gU+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711445; c=relaxed/simple;
	bh=15Rn9KdcIuVo6c/SIL5EdAlHNAwQoOnmvfCVZkwNnZo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LCQ1ChDBIF74tuIUFiQD18AeEw7oz3KC3tHEHsTeUoxvyD+C1cIPlAhZpU4/hH/uXpCVfuKYA6kjrLPtabNFMx0ZLp455aggmtKBq8A1UpTSx9H2hyz8yECW4+r1Issrjsm+i37SjxuKeaqRfMWgtDDF+79dqbr9eNGmf5YwKeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=AVABWzms; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmBOV8foU8+F6vykd/UUFzr8SVMT1wsJOM8HTt56es1eJoDLrnW6fNg71VDsE6OA4Pfm2AHNAHJl9twLDHdnwArI9YCZyaaAlktuo5sTlBMDoQoruAT+aQk72OwSSKQIb9ZnDhxUNW69SJy7wwUCoqjCUfzfiQEFcDOjZoWMQiWHBzEpk7Bb3VZlMcVHb67yU8ZQ4FwXeBZvBYQUSyC/5iERH9Df8V6+2Cq7cUtBHL/NuDgMDY0PKcE20NoEYqzv7E0ox0Ksih2ddduyje2o/Z02FZavvjwT2mQs4xysdZFye8mj+jZeXyWVV25JOBSjAM5HNIuK29wsQZTRUZfL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMHl4Z7qw/akNtwMt0KWmRxqh0/4x90mc1aPVUwnbGo=;
 b=qZf70YtRrXeUd1NJV5k/zVwO1aRnvD96Y7DA1rmZ8CQ5UqqdlXSlXLeAXv46Gz+NGpXmT0MB8PKtwGW4BJfM1oGAMiTJPpkgXpwkPXUwoE0SynPdD0dI+KUiACsLYo3LdRg75ajVyJft0d5UEEPvzQy0Aes8wC5jBKHAsr4zNlHbu7UFx0pA90epkT7BtfCo1rDoSEIQoZ992LTUm0rVLG2KC7YOlSZwjph+yGyuNUOHwa/v+oe+YzNXpZpawL/9c7CwEu8LGgqF78EUfrxmTDXCMzAReNM98Im4TOWD1BOnMdPWOOponJ4Gf+Q4nGpaAFo0zh8ctxu/XBeON9eZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMHl4Z7qw/akNtwMt0KWmRxqh0/4x90mc1aPVUwnbGo=;
 b=AVABWzmsyurZtYbDFU4F7iUcMqUwHId8WFIDoc40qMKWnKIOld8mnqgWQ9AhT1HVIuyn0jm88gAjKu0U15kp+nPOHhl6/lVMrHETjj6OhI5aCo0R5WpVGm5wZ6wk+NnR4UPguNQHl7S3giuPV5f0+jyi9tVZJE+xD8WuIeTvfzZ+YLpKmSd7iFN7t8gzooLLqQlRuz7YbPOMwGOcD7U1ZHLNzfJPNJ58upTg5eOyRnBR8h6Q5Fc9tCGzpSqZsw/T7XoxYb4+BtNvBZ4ESe5spjmg+gjnh15CTZBvOpPvRaOzHWCG2xU9yQ4BSOgR79kpniOmmkuz0fF5iUv2cyrDYQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:03:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:03:56 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 00/11] pinctrl: airoha: small fixes
Date: Sat,  6 Jun 2026 05:03:31 +0300
Message-ID: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f71fa6-2afc-45df-8823-08dec36fdd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	iL9yt/LZbF/TyUj75ThjX1/vuS/YxgseZc9bLMIl7myFSrqVuTL7DeFNzF+aC4/82br5bkr5IiOUh+yeTYMjK6F4skzAPO+xhkXdstrpNsQEP7EM7agULfC+eT6vQoMXiKrQmwiMsCY+Y8/AG5d7nv+bU5V4gijdC9iMSbsRa8j5jxdH5I7TkRGBExdnq70pjKXE3p5QE8j2zOEtYtY40ccHFUSMtcfgMm5XBL8hxG74OUkxiMHuOLi93Z0A4jvSi8Uqn5Ho0veEwcLE7z5qXSi18E4++5qqPcXC8Q+w/12XrpxarQSvcKg/RPEdljtJ2B0zFszVYXXC00ci5imJtFEdpNPJpSJqxpZhJJV4UkwkxDgkgG8ub5bFxjXG/3+H57yriw6KpGD4XEC1YaUxaDmCleYZ0krPlIhc3qWHlnL4fvNplvxzjjsSSs7FBT6el2YUV5MrZpzJVYhugeMP31+BxDJ/5S/vuMYTjFGMmlmiquent2pUzykMkZqSxYCZFdqKfPTx24bMQueJ9GqqB6Qm3K6YB7+S/xukX5Dvba/odJkaWG54Ei3JvjvouorGHiR65p6f3SIpoLjk1C2q0tOV7v6Mxnb30LVANV05G2n4+0MJ4cfk85wRCd3YRo6R5ZUh4DbNP3rdWgaCC0JAaEBYy9BnUoGpurUDu6FkzR8LfOMepzc/fMB6jty4dYp2qIT6WESD0z1KnVYFOgMAyT2NaHTzthJJYYKh0BsIv2WiDGmSx64FtpWFY5jsFJL70ILloH8N59Nzfg21ciKNSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?++nB2cIifZ9RWC/AmgQSNPk/XxX0XBdm9LW3BKhJQTB+6VsPIsXfkf8nuzY3?=
 =?us-ascii?Q?zyEeGSI0MYiLNFnffhCXlGaVLXiTLNEtOBaeGrOFwqTxSehcLn9N9U3In0cm?=
 =?us-ascii?Q?selltesvAgZEkFnFte93bOSFWriF9ix9gvmMxwJeEAUsQue2V48cd2pJHtXA?=
 =?us-ascii?Q?j1ttRQ40t0NJhpYHnkmzoKcesc3pn4Ic7cPqeSeS3D+ye84YhWS/30nsCDWd?=
 =?us-ascii?Q?mcj/2/wwrpPy7DyLEH8s6eWFufVe+9AzZz01PGncRN1JIF7dhgnEujG5+aSU?=
 =?us-ascii?Q?K5GLAfugDidfEl6NWyJCHS57FeOJuJBwVAWIPnnqeEKPIR1p1QwWbRIDestK?=
 =?us-ascii?Q?9qdyNOQ4JIVuVT/TQzRz3sWK1OYV24XMPCf7Q6pDUg+DWcHvOz7wYVulaA7W?=
 =?us-ascii?Q?xLJqsQFoH0ej0GEwVEgdCFJAmrn3pJN4pzkfNG05g1Uzn7LqmkaNeuiaMhUq?=
 =?us-ascii?Q?FUuldZtEZnPEobf+v+8gt3BbdNooK/Ug2VChWDm1mpc0xBlF7FrukJNyWFcm?=
 =?us-ascii?Q?frxifu7a1wnjjGFENLboTz135mTFNitauVVZ/wvDukjiFNrlPbOjEBkdksJ9?=
 =?us-ascii?Q?wV/Ig7wbWdEMiyk3Z9noAWh9pK+ZDqgk0RnvCwfyDovcPUOBfCd25MA6MFtX?=
 =?us-ascii?Q?f9Z0GDrfz8uKgqxeMB3oqEY14qwJkZ/T5ulSb20I6OPUdleT8rjxx1DzKsNG?=
 =?us-ascii?Q?qbFYYU3B4CfhXRzHOn06734+lETrhPHcrMSNKdqigJdZjt9VJ0vUDdsh1/DL?=
 =?us-ascii?Q?ObBcj1rNrfPdiXdIwb/HiqV/s4UqKJflehIV+bL43c1bJpTaDowP+Ue693ln?=
 =?us-ascii?Q?uukS5yQvFp1uOMwsXNihkNRvWrovcs39+Pdbr26clNv0/cyUSv+oGx+V1ipH?=
 =?us-ascii?Q?Z2lK4BGP0AmsaGvVUn53kwWKiYL2dSTVPRk/nfjaMgxYMhMJCHwrjgrT2LK+?=
 =?us-ascii?Q?Fh5aBpe9i7M4Q9f25RkiYaNhK2zCpODcg1zuzuSPzpBf86btS811slqSr1yx?=
 =?us-ascii?Q?oWPMOMCNUY8Sl2IMx9N7snWtU8ZPaYKCFbRbM3xXnoiI0V5ZrCYkkFDlzlF0?=
 =?us-ascii?Q?siqbqOLbtiPQkxfRCOHiZdg1upK1vW4/ar18sLdxFsfaP5ERBspu3PNHoSHV?=
 =?us-ascii?Q?UASisYKP+1zvOeM33/kogZLH9MQtWUpAV5I8ta41OqAV4TMH7+uEGzqYT0j5?=
 =?us-ascii?Q?Mhkx3JH7HLTIPfuTPDSCKWJKR8EZas0C/aFxjHBgYdnRZYitrCld2jW1S51M?=
 =?us-ascii?Q?SHGpSqUgK/RXHGqbFetRJdUHd74gvCiURkCq/0es+SnEvDZY7IYr3XwAYsBr?=
 =?us-ascii?Q?D4moFbBkj+4szUpUWKfjrDu4FMLZg/c+dNkbowSAK1oriPolKPrqScipbCKy?=
 =?us-ascii?Q?glDs30zWAXI4lBNzQiwSWBGpv0ZVxDMI7uzNYQJ29778vM52e+iildZPGbE5?=
 =?us-ascii?Q?KDbDVNnjdW/4b6z9TYLHfI9gy8O11vfNxTT8y4E7wOYW0D7E716MAZLRSJwe?=
 =?us-ascii?Q?5k9yofekf/jK6KDY6CmnNGtejkHfbgzTEiVpnNBcqznNGMYmVRh7K65KMQfc?=
 =?us-ascii?Q?Lg/fL9tJC3c/OEvIy/FdJ3ps1QsVPaT77psAs05koQ7Sz1vbCnEekpj/HCMd?=
 =?us-ascii?Q?s8HbIg8LuROBaguhLnqMesPXno8eZ61tYaoBF4E8cvOf3b+C6dzfl/ejjkuY?=
 =?us-ascii?Q?IARK35YOJ8KbxDYdxweHxS4A64iCq1uXNpb8BFht7AebgvTYkpgY61ki6epS?=
 =?us-ascii?Q?kmfcFAc5ICYi/cA8LVCZ77qDJKf5uoo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f71fa6-2afc-45df-8823-08dec36fdd8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:03:56.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ/e81BzFrA6o8WwXbA9pRmQcsviIoRE6t6xLUKs5StBDQuDSwDPs6wA6jys4l6DlewGOR2D1M+UicUe4EMQHvFstiTqv4hwtsIOp+rODjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
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
	TAGGED_FROM(0.00)[bounces-38019-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,iopsys.eu:mid,iopsys.eu:from_mime,iopsys.eu:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6D5364C297

This is a set of small fixes for Airoha pinctrl driver.

Mikhail Kshevetskiy (11):
  pinctrl: airoha: an7581: add missed gpio32 pin group
  pinctrl: airoha: an7583: add missed gpio32 pin group
  pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
  pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
  pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1 pin
    function
  pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin
    function
  pinctrl: airoha: fix pwm pin function for an7581 and an7583
  pinctrl: airoha: an7583: fix gpio21 pin group
  pinctrl: airoha: an7583: add missed gpio22 pin group
  pinctrl: airoha: an7583: fix phy1_led1 pin function
  pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin
    function

 drivers/pinctrl/mediatek/pinctrl-airoha.c | 122 +++++++++++++++++-----
 1 file changed, 98 insertions(+), 24 deletions(-)

-- 
2.53.0


