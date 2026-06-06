Return-Path: <linux-gpio+bounces-38024-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1aOFMU6AI2qsugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38024-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:05:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B5164C2A5
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=hD3KLowT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38024-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38024-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9067B303F98B
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE0E2836A6;
	Sat,  6 Jun 2026 02:04:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB827E076;
	Sat,  6 Jun 2026 02:04:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711454; cv=fail; b=rxGqhbOQ/V4nj2WGfP+wxoz6d54StydrssFnx8HhBeme6PqudlC0L26KDWxw5va228BXATtARlOAHoB8gQK1B/Pg02KKqktIfHYatOx//8hROZTbastLSyUSPkwy9uL/E5OpQ3v3TBZocPR8lr8tBXPlhstyHuVvEuIZ6f6vn0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711454; c=relaxed/simple;
	bh=2ZCEFQn5vaI6e72r+w18X4kHVmEm5cr8VYVluMymmGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jt7aUiH7Mc1TUhxf5gy4px0S/lSp/YgfVlHm6ZUge38tqZWt7VLtgzxeHJW/m2lSLr62S+/iWh87UY2hifstw41KNWtBvTLrKFUw+TZ8wFGHtoOOcqe/LHBuZw4YoG1jIPd/NmYMM1oXm/zFa+E0zFy24noxYRkXniFRmESXcjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=hD3KLowT; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRPARALDkHhiDQ8RyQF7hXVQRhEmLGcLIgjq26NcO8PcnLN/VM/F74qJ/GrB5IgMT8bQx6FVoGByg9AGwGAynNBZD7EdNg/Wzh2GquuEjIJb1gN6PTzRIhyx90Uo64q1iIfBvIrhY8fG2WpE4O6h0vcIetXJMEtWjQBkjCsugYe3WlbQVykcU0ToW5GkD4N6tPMI9nGleMZV7oAuiHjpwPE5hMDuB4QaWgX3Y2+/Oc0V2CYC7rs/oPxpiouc5wnNsaaVXAwenUGwouK9YQcn52XspThgriYZ4C36bATDJKVM/digKocGWZJISdkjoi6QSpyB5K0D3zeW6ow6DEJlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=;
 b=A3A7yzKe5oKgK9EqRllpgTTKaSV6Ks8yoOWJZ65xKUgtYb2DFuHTep156ZpCn2y06AUI/+FPqJumpCw3GaP8GybdIRB0P/hujl8HjrUmUI1ZOBstO3d50blfE8WntQB4kNwFgE/zoamiHOuRDFjdp8SDEAgKOFoTng7C793mJMRIRnZV05cZtAGX6VzZB7Cpy402kcusdpIXawdN8YZH7cIMgrhoGdLwikEorb4mFbaemPvbok2oPqp0r02sIofoxdKsZUiNQ0PpCfy8XFUttvMam/Wvbte5CgTmtx3cI+pVR+I6+woTF/rx7IRDr3lq1hxeDaDK3N9rW128BX3JVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=;
 b=hD3KLowTuyN/G+AbktRk/2EoGHENeHfurG9EToyIBNncJT64KhcIsr3JK2vZRRJfPMHzAaqEHdiV7AdUYTUAYp7mSNobS9REASftFFHmIu2S3LlQ3/rGqBY1lSu8F0mvVPJwSJhpK3dkado5H5JW8DPTZASVEenaVxTKOAnLiuR+gbndZojpPkzGJ/Wz+I7gMscMj9iPQQUiePgAAIbz0EqA4zdQeWZOha8rJDAdvkTZB8hru0lGjYGyPX9Va53wgJ3pS3f4KVRS1t31Z3KAMbGP1L5Aa7L/OYuSAOFgtlWViYa4x2wlmUO63tk4XWstX6yqE0y8iVeWkGnLAIdE5Q==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:07 +0000
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
Subject: [PATCH 07/11] pinctrl: airoha: fix pwm pin function for an7581 and an7583
Date: Sat,  6 Jun 2026 05:03:38 +0300
Message-ID: <20260606020342.1256509-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 61fcf4e6-6ccf-4139-a060-08dec36fe46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Cqt8QK2/C+L9cyN++WEU730iog1qoYel1kO5B+Cnba4Hhk92VFu902wg9/6RgHYe947ptjDrwy4Zxs+7q0kxeKieRkFN78t2TanwHDpQ+tFXNLFVHAYLiFYArjPcKNchsKcF1kYl3SHKFkFMIgdQkCrvioKApmocmv5w/bLarJF6GqInT0/BPHYMHsELh49M0zQOBZlTNADi0ldUB+opqfrzgIzdYSX1SlPH7pHne3ANwa6sRqoPnU9h9A2p2VLPsIHRdXdtFPHhojvYm6k+fZjNrW3IM2MD5ZWmT+3b5OL3A9pRBwaon5O8Lz+785QCw0yuqn929+iNiQwQknsDrNrjRS0bHI95gd2IpgNvVkcuUSpTlI0mj6Tlgl9QDMMn7ABNvLw4xNjLJ6WESFX9haYL6lZFrpAfinhVylLLuI5g9rdWjKnURG4rBRHy4dMwlQTmm+T8TRGuBFxqaKrkiHd8pOTp1e1UJdLIwWsUcoXoGAvEhKaHzVAeES1MbRlimCUDYrHAIzS6Ji4SgGflf3VTRt2GhY6quSm2gXL10PfmKDMbvE1+evcq2+Cfa1JL/veN1XMDuQuKImOTRfXreK0gCIvSyVLUCk0xa8x+vPBw9ZnUzfacjssd51qGXnvLHw5DX5ShTf3GJ9sg80DEwAwARogRKADfHRMRYKjRIhdAHm5OARCU1myIiKdkaaXBzuX88i2a2Z40zTl/0TytsBGbSkNzBRmxPPGlXlV6m2uBXcra6/ekAtQuodTAOKoJNPaI/yQeOIYKON9hzt/jeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oj2SOybi7NCS9R2PvjiCau92Gq3DqPFHiaeWn0/BqNicPFybcVDuI1hSHWpJ?=
 =?us-ascii?Q?hdEAVa+efBGZvJ2JmflJpl5v3UZJPBffdgK7dr6Azvx1ZO925jecvL/G3r4a?=
 =?us-ascii?Q?+Bshcxj/psEX3bXBv7d0nMi91r/fZMQYBOB5o6LduvqYpnXrO/CeBwN4jZVJ?=
 =?us-ascii?Q?LDMxkb07e/j4rmmYAdAh2TW7mrhv8HFhQ6YiDsX8hZSmSyLmqoGgnGOSc88B?=
 =?us-ascii?Q?xozqyaqN+Zhlzw3oFGOANqfmcW9BXj2Knk1LHEKOJ0O/WXfHdzAaifeGf7l6?=
 =?us-ascii?Q?5eLG7ZdPnNLG7fhA9wPRIlMtTE+xDuT91Rt80YwhsLoM6P07kKVEeMs2Pmir?=
 =?us-ascii?Q?5/xRwU6yckvu5jNKf0Ea8sBz3Q0Us/FcGqrM+VpyCYfqWRA+QYQncuPS9nXZ?=
 =?us-ascii?Q?eInpsBXWqWIBfr8DRCoQ99DsaptPao8arO7sIbKHPdqENgzwuTWQ0eLAkWGv?=
 =?us-ascii?Q?NA1xErbg9rxRpjW/x8XoHUAF320P7kDCK2cWoKxR6e7bRJ+4FTcW/i6xmo3q?=
 =?us-ascii?Q?Gpkjye3/LqNMBqyyrFqeU8ohV9DLFccoUYATKYTO4DxufrdzQoxJ4ptzBrnc?=
 =?us-ascii?Q?1PhwnwyNTt0iC4dlJVQA4OXrHfWFBFrWlbxaM+O0+vQKHIBA3KR3uPBqKMI6?=
 =?us-ascii?Q?L6xPZgFa6gAVGgpYUxxgPoS+GSqy03aB2uGHjE1fZ5lrT7tVHeHE7hoLgYFC?=
 =?us-ascii?Q?9p6gAl5S48nqUblq8b3+fctcGuDaJTX4/ieTeLRJ16J5hlUyyjxnUPbwfy3p?=
 =?us-ascii?Q?TSx4FuwalbxJAwB7Lzhlb/Zxm+9EnzUKExUFXopft4piZkv504Iiy/+bWaJE?=
 =?us-ascii?Q?WKqLAzW6IaCqtjsH3G8Natt0uRJWIACDgJ914KLNEoQcTJvpQV+s1pHGKmIc?=
 =?us-ascii?Q?QAzIQrUaVggqvXLHK9hkeZIi3GVLizaDTqqFtUu/ZzOfRJVSkZ1PO7BBV1N5?=
 =?us-ascii?Q?DiD9PUJS1yUSCQz/ighUBdtB6Egftd/p/4LWRkvTp31sZTslxNicrYOWpsPv?=
 =?us-ascii?Q?wY9IbnAZFmllTIxe38glkVkKvDZHZZAGCHl0V+hZdHhPZwEaK3UPnNm3/FSk?=
 =?us-ascii?Q?j6v4MXUg7W4MUnvOS6T1CXzEDOu7aqCAfF+QIm+MmZdKRVr5nWb/6XLYqPM7?=
 =?us-ascii?Q?wAX39pOE5VGVWocz/4yKHJMEW0qbBaDjnbUTIXphOHg8uESMEWsV/JXqQLjg?=
 =?us-ascii?Q?PI7D+6Eo3C8U0Hf6FvgrVtMXjY6vDLlkgYLB7Y+OiWMAebMpu2luZQu0Fj9e?=
 =?us-ascii?Q?lgmgeZIiK5lkzLqyZw0XGVjCLoysMcuHCdKbVJ0ysxQNk0u3r0nhiX5OdYqx?=
 =?us-ascii?Q?iELBXTAQoE7I1qCPfFgX/GG/iA6jRi/QJyZUz5auc9LGNGU86cZcHSKdjLiM?=
 =?us-ascii?Q?itpzhz3ykEUjd0Ljwwa+rDfHgruPtQqHqE0713AltCU1LkWEv4hfnaWaFUQd?=
 =?us-ascii?Q?tsZI3UaLz6g4OA75NttwSS0moUdVdNToVXGT+sIfkklF40RDyDechrR2EfYK?=
 =?us-ascii?Q?LKgNMhtVF36vLmW0DJAPJFk/LvwVfYbnhEcVVq+OFMJ5D8NJX+aw0EFKsVrX?=
 =?us-ascii?Q?ljYBTCwwXnQVhwUzmpKMTKNI4o4S60DuMklFY+Nlbfw5m1ty3FvVPmmxMx2J?=
 =?us-ascii?Q?Y3M/xDvXkBXW4SEj8CqhwijusdnuxVgOo4EIgJ5g/0NkMdJ0ZGTTmEK9XHE3?=
 =?us-ascii?Q?U2C2ct9Uja+IsA7qV8yqStRId29Z6YBpcLCxikMm9Kv401rWkoLdFNyszYvU?=
 =?us-ascii?Q?mG9eb9gRn5bcD6AquSNe/jR1VTwn1Ok=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fcf4e6-6ccf-4139-a060-08dec36fe46c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:07.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtSJ7vA2vSlun3fgMmGbTCKhm69MSFyZRGroDhLgDOKME79OD1isf3KzKVDrZRR9UsUen4BPCtUQHIBENQ9b0Y8upIcHAX0ahSlju/5Q9gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38024-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65B5164C2A5

AN7581 have 47 valid GPIOs only (gpio0-gpio46), so gpio47 is a fiction.
AN7583 have 49 valid GPIOs (gpio0-gpio48), so gpio48 is missed

To fix an issue
 * create AN7583 specific pwm pin function,
 * remove gpio47 from AN7581 pwm pin function.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 74 ++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9be759f08b18..15a541724349 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -906,7 +906,30 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46", "gpio47" };
+					  "gpio46" };
+static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
+						 "gpio2", "gpio3",
+						 "gpio4", "gpio5",
+						 "gpio6", "gpio7",
+						 "gpio8", "gpio9",
+						 "gpio10", "gpio11",
+						 "gpio12", "gpio13",
+						 "gpio14", "gpio15",
+						 "gpio16", "gpio17",
+						 "gpio18", "gpio19",
+						 "gpio20", "gpio21",
+						 "gpio22", "gpio23",
+						 "gpio24", "gpio25",
+						 "gpio26", "gpio27",
+						 "gpio28", "gpio29",
+						 "gpio30", "gpio31",
+						 "gpio36", "gpio37",
+						 "gpio38", "gpio39",
+						 "gpio40", "gpio41",
+						 "gpio42", "gpio43",
+						 "gpio44", "gpio45",
+						 "gpio46", "gpio47",
+						 "gpio48" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1504,7 +1527,54 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+};
+
+static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1759,7 +1829,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
 	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
 	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
-- 
2.53.0


