Return-Path: <linux-gpio+bounces-38528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 41dvCvPOMGo2XgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:20:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3FB68BD62
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:20:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=DdKbOEq7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38528-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38528-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38F04301D32A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC683C76A2;
	Tue, 16 Jun 2026 04:19:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB7D3C819B;
	Tue, 16 Jun 2026 04:19:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583599; cv=fail; b=q49SwdZ8swvaDQpS+UDoecUaFA5fxOu9B5+C3xwTLnP1pwoY9AmU0x1FF8uBSrTpS6EdPfFpEDaOQ5qSbon6M0X56YXy4UfwtAIWSNx8Wcm2APccbH8BRIUf4818YoNDbOwX0sTIND0RYPrjZtYHeByr7+0i2a7eSLgjPibF2HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583599; c=relaxed/simple;
	bh=qx+5IuuW+YeiR6qmr5HAuWrBsg98REy71WUc3IXsKTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MUfmotnkCD8WE9U6oEc6Upz6F44BB+nag6vXUiU3wkwD2Q+RZHLEM6GGOecXEHm3creK8iu724h9ZKwCQZHqJFGqCukemIxgjCtywN+eCLo895wd6LATe6xnj/cJJ9Tj8WXpwKbdxfIZySuk7tE1gghsjHGpYA9w3D2w6I9y854=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=DdKbOEq7; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBKl/PtPjhB2sJ9Gqzy5G+0GrH//UzASGl7xLswpihypQDIJCvW8maP3eFjSYr5VL9G282Jcqq9EoI+n5VIHR4bVSPtvbEchQxi9yqJWexD2/RjwGEeq6Dfl7IUSgECKVvHqpAdZ98P/J3hePkQApUmbKSIjwuCk6dr6/Byj17NuY16EAkMEN9X+1bl3Wx6Lg0NZpPBhbwo7QgVHfW+bHKKGnSlZhHMjngheMYin5P1FqAA1jNHDHma6SYu6wIqt2TUdk69m3eM8x4ZoKe+qlOxGk8+w8xCUCpa0Z7n71THXKQ/Rsj+bvyt08hUKmbHOwUGU7B0YYgZQS5faTi0AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=fJ2RvBl3f4KbM6sjUMhrHgk5GopntPn0H3zZkYjPDlGwFePe7xciLYL0UhLlvHlRvp9wX3257NHucsCsUwze2wn8C44RuHFSz2wU4l0wDToP4tHq941UXz/Cz/jfPQsR9Vn+VQIWEyFe7kaJqO0QnGRJzauhS/ja5GoZNQtK4erOw6hpvMkyYbRi4wXp+Bu4Mt/6BZy9owbNH1fADDV1CAigPe7yRCScyY0z80nZiHwYh7hWXsmKIKGZHZ+Dbj4mMJxRSt0YzQpVJMtsnzABpKK+miA1RHHNzve88xJ+3jUeBLJuw7wbUprj8Io5eqmOQl8Q32sze15CMGwClcwfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=DdKbOEq7yq2g4a/XdJYSzsxOpCKa70RP6wFCUS8XCfHH9Ku4vpBzsLsYhUiXklL7VgU06VxN/hNcMi27NKqy1ZAuwVVqpTN1YrMPcBDmpAg+t6rTLqYSCRXKtB3XSvNemHT2jVY0jzx30+yFXR3EEAzpfInoxLxTUbt7/3fNbdZNOXH3prP7qdVimUfExJn5iQG9mrzhL3HvXni7wbiEPMY2nd3FnJzrrBVA9dsMcOHiI+4hE40pmCULAhHEhEFvb86jS4drbh64RmGzDZmMCh6O6soIQOpWVy2nq6DejAHRNGa5tv+0aGcBFqK88ND4UCYv9cGMuvZNROhf2nqFTQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:53 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:53 +0000
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
Subject: [PATCH v2 01/12] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Tue, 16 Jun 2026 07:19:28 +0300
Message-ID: <20260616041939.2587012-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 0bad5db1-a494-4215-77bc-08decb5e8401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dZhAlK1VkBllqqmZcl3uO5D3UScxuoX2luJMSVXvfANa2G3nEe5quj1InrFJnLiXTr05JrK3zy3IteP2TQYy77cljnDE84GLQVUQvXkDKoYeGoHMms0uf/yaNRf9DucepV1CnPjHmQpl/LAFkod7yEWcd0QE/wLP1FBmkHxnAr2bzy5UImmwVNtPButXLZgbYc8/zYYLimOrkdfkZYK7gC85YUqfnP3qbrMgAE6E0IgWNPy/2rB4b5yJ98Uh0VDSe6mrrpEZh+a8KVEB3LllxmUWZaW4tWBKv5z5Z/GX4dqgFUxN5Nz34rUEsthbux/2RL6qMR66c6H8WXW+oU5GiL14qXSA9pSVUGe6qjfUvOzLWjUmtBRI2htOXgUT1wkYxf/LGxvrRLtD/MNJsZg4UycViuJU3F2YOZQ1utViu1o9XzS78ht2zQBrbfgaEV3hRas+yvbgn4ti2brkfLkcYNua2g1z7vqdAFukJRTIng8aE8UusVLhFgmQFysUiZu8z36Czngwfv1SPZNXAr0TvTID9CfocqWx9MdBxubtg0V5gqPZPhVLwqHDei42zB6gsmtq0/OKJlWyOc/8BLGUk1Iw9gl5X8qet7oRCJdXHqmuBPNmd8F40aRdWIAv9SYvs4wbBHiNbeazQLi36J7/1wY8YZUTM9mbluNtcIc69jx+lhdfmhEAdlh+WZ53BHCZcELYJWUODtrEnQJ/HlCPaoB/Af9lZ0eJXabvoEhaQDmrC8QvWWfV/ABZd6LU9Aw8zJRFXJBmwoDAiGpFrDLKrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dh/rvGKTKkQf/sGP/J5ViO5lVcnUj+wOBqSEuiu1EupDQRHr+ebnW9TvGgJt?=
 =?us-ascii?Q?TUo75T9o7D6TXUBgyBeYOFciOBfLetxPM8PTQ0V+C43l3a87ffLjdZLDY0j7?=
 =?us-ascii?Q?KseRHU1U77uLlSheallpPCbpPoKnDf0fTbhRjt7Wz3IvOOyz8D37zPO6U4xf?=
 =?us-ascii?Q?UJ5fNQNaVqYTHVsRPK+tWUCvIP5BUv0R/V8jy9HJW8pns8DU19C7YkFcZSRc?=
 =?us-ascii?Q?rSuGmG60/B6n7fuyP3Q7aNtXhNh9y1kkV/9lR7vyi24bAKEY38hQ8Q8ITSO3?=
 =?us-ascii?Q?RAfwfEVzl5p/2R6bii51jjdeywopDcFTlFgBUGcqWcBeUr0pL8Z26/k86IP7?=
 =?us-ascii?Q?v8z/6ZnWBKjNPHNdpUmDQLHExoQvOa9iM5r+cKwXkPbWacLvJYOWsPO2Vlii?=
 =?us-ascii?Q?FccTZhZyGXmXGUqxuZ9sCBCeJ7wQlaonxA6wI9sjGV5dqlP+sAazJeblqp+H?=
 =?us-ascii?Q?14+3tm3O43MLcuTvHTjjuID4qkV+zJoK/uhmTh9mfAePMmvdau1hNhT9A4XH?=
 =?us-ascii?Q?pvaV95RFgZmvBBpF1F/ZMA/EXS9uQpUejrMa+Y+J70VP9jkoEb0A859Vt/d2?=
 =?us-ascii?Q?LiGbABTiwaPTCVzDRoGE/RKSrEkp9BImkZ+Uaf+976HgQFsyKd24bGNB/l+6?=
 =?us-ascii?Q?E7b9IFle4EQZE0Hh96g9D8zgcdqmIdqbEF7Fn/UWsqRtd/es7K7pFpKovqsz?=
 =?us-ascii?Q?WRcjYhFHMcBaOCcrhUj1edDA04SWfmvAXh0/5Ph29Lh4wHjzGot0sPpfoc6i?=
 =?us-ascii?Q?eDjt8R+GNByJvAzNpdKAPNYsMoyeyQoIkXpuRfDCDRvV7OzK8I1YhVjD4w5+?=
 =?us-ascii?Q?cGmywon02YwK6Xk7bXZyN/I14mabEFC+w1fim8r7cwPOqpGokpKCIQ/GlxgN?=
 =?us-ascii?Q?vbuaWEyg63MYkviIj1yBQOn7kq9Jzi5eimCSxy0JXekFmfd/Tfd4ihSdDTnf?=
 =?us-ascii?Q?V21cjKGUuAIQgeUkqw57BR70cZ3IIt6sQcysNNBrkja1TZW+n/k+Gpwxo/hP?=
 =?us-ascii?Q?K1O6Q6G0GL0sKv+pv86dPC4NyYMaqESrnUkWCkjCXNqftT0upz+2cnMkhYgN?=
 =?us-ascii?Q?+8UM2FDNX7erg244Szi4lQuCE3IQZ5czlC01eZUytLAEPJs+dsMrrwTvT17b?=
 =?us-ascii?Q?1LelHL/dkrm+SVqnst5sn+jB0DVDzQBC/f1cmHpHACWBW6ewMuPX93LrDTif?=
 =?us-ascii?Q?k0Pes75wo/3AnuqTPuSHbs9tjCKiCtJVRxv6PwNVLOj2T0gAIyKaBzokWDCV?=
 =?us-ascii?Q?hoe2LjO26DyC88+e3oVtSr+udGVlFeqy2aDrJWtwBHYvx2/PmR1Rfrv87Son?=
 =?us-ascii?Q?PRnS2/B7db+aVY4yb68G2Msu2hnK0Efr8uUr1XPHTOGaeFvgi5tZEXxnICjZ?=
 =?us-ascii?Q?8KrDEgWD9MuMj6FHVAGDQnqc+fbFL6RfEXAcuItIYjs8De60HdRcFN2F4Ped?=
 =?us-ascii?Q?ktxuZuVFXrJM7YXN0X0sYKLwSlY2kO1g31S/ch/SJaSlPaDv4WyUhYw5wxMq?=
 =?us-ascii?Q?SigX5dYWhKQ+M70beyKCFZBIKdZZJ7diWkXiaBsrI/hEvQqF+C+vsqOjeexi?=
 =?us-ascii?Q?3OtA7Fgr+6UdUaEEDIknHElTt8cOITrBBTzPYDx4d59YSZEzyg0462emuLna?=
 =?us-ascii?Q?vX5oKLYiCbaIZD/1yATEVR/MYbl1AttDQjRLCGc7A61OGIFjgpbwG6JCqwpX?=
 =?us-ascii?Q?vu6GGweiuLKChlbr9EZzYW46KvGaiqOEa4A7Sde3a3CqZeGOBAuWXhbc/fei?=
 =?us-ascii?Q?cNTvkI7kOp+yam/pyde5VJwXSEVl46o=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bad5db1-a494-4215-77bc-08decb5e8401
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:53.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqOIF/u92KGeuzHqqKNc7Jd0vRUT8RNHY8rhI9aGYNQXQDJNNI96WkEoCWBWjrlsC1HH/fxcNK1Q5jdOcVt86oDcydTu58IepBjhTyO7UU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38528-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA3FB68BD62

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


