Return-Path: <linux-gpio+bounces-39060-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lf5dNSMyQWq7mAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39060-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:39:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95E6D41C2
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:39:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=mklVOvy5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39060-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39060-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6342F302BEAD
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA813AB28C;
	Sun, 28 Jun 2026 14:38:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967234041C;
	Sun, 28 Jun 2026 14:37:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657480; cv=fail; b=BvRIQv8zOBq+K/przRLwHfZwUAfjKiwatjsBaOQ1ybenG7mbxYgRUXV3yI2eA5nni6TKmBWeNC/daCqzR34Ys4Li0Rmn7cCRjgm4TMjkN/YiXlgzsle/iaVxrsqW4HpvSpQFibjAwHvR9mZr5ddlOLW7gfZwjw2xTuVcZNWsc+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657480; c=relaxed/simple;
	bh=mAIP5BqTJ2JDkwUmQs0fKrZUm/08FhenkZDJXtPzGfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JSOqIldpc6iMtentUJXbwcDt3o+FpkzlGFH3YV5GjzLyslIQMG06Nh21bmHYLZLzNaQn+mWZsyUfHa9sqJoDnJ7va3oZ+bXFNgpWU7KFCMCjCFc701h02Zsigo+a/PtuhIndRTxpEzD7eL84q3fsrQlZLDb8L4LtAWa4JNWmO/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=mklVOvy5; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOid1VorXLZYt9tvsYG1w0YriZd0KY2GIvC0szcjqbAjT9rXXpXSPdr6WSyZZIFbRn3ltSmqvPlIOGtqeuPbSCP8iz+0+AF5K/6zbf3FgUu0ERZoIWsCqWzMCysI8vLgDAIYPXiy9RaigeBiz6/XAW+iUj9bJyUd5IQIu7LNL4XuNr1uZHyrb2WdCLRL8ataP6Z2fmV8idj+kw66vdf7lZDhjxJk8V7HormjAs8pQzuzWQX5+c91O5aYZqMi9o/oyKBohV5oYxocHaXGytffDdTKF+hNdfLalrPJ5f9CaMuajfVPMB3F6jSx/eFc5qnleE458UVoC06zYNPTFduFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FL+zTnEb7GXNY1s6VPCEF9S804NAtspeBUZTuTcSdk=;
 b=BCBmoC35cWkV6OoI7pV5Y7zxXud0rVpONEhWM+4v1CX/9KSya/vF6qrSWOh36ET5GoVSwPKit6QNFejRMqYDu+MaCd+JpmhLwBP1b1Gr7qss05P46bHqk9avxIoaqApA9H52EAe0k2yn5Zil4oV5Ncm0MjD6tVmcSVS9TgA8THtKKo9VDRrr9g7ZvUfhZlGBRjCOzLrGrXkKDPetP7fx0O9bTVQf6OevVsi72p2SXmGNjZkidy2TEJtb8mJMps5x8Mo+XttFpdSvJe+hnvcdk7dU7CqWaN941EkhjJ5PMujlNBRzkKJd9JEJYLjI5x5s5/wQM+0hb9BdZbriz3qLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FL+zTnEb7GXNY1s6VPCEF9S804NAtspeBUZTuTcSdk=;
 b=mklVOvy58r4ATy2rFOGSxBCilz2iRjcwt0ShQk1uKOv9V9xc2JU/eh4+x4pVA3N1Q9IT7HbVJq9yyNOgUSP7mWZobKv1GZweHtPKtw880N0CFPMNJOmuJB8MmBsKZqpHFkSpW22HWw/B2VEf18sMFNdHSBuRv+bYct9OgKePY+jQzSRFpdNoafzWQcHwSmSsLUzByqWgYNDxyqxstnYEDF4oSASMVMsQgePInN6eUL2zbFehNvaLcGhg0ObS7rCfMpdKKB2d/2ovAYw57k/JAon57mDkb8b22dNQewys2l1PJhL8Tu+/kkVwCwZVcD94+m/jz7NjLGl8svwOcziVTg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:48 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:48 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 01/17] dt-bindings: pinctrl: airoha: update/fix device tree binding schemas
Date: Sun, 28 Jun 2026 17:37:17 +0300
Message-ID: <20260628143733.273651-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 050a8539-d82a-421f-3a2b-08ded522d2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	MjDjvR+yhMEM1Njg0YQ381eQSquHAuFM2zKP6GjKrElbzehKJAqEkqsOO0aOVa/peqnnxJ7/gvDaYreQ5ZtZs4gykgoa/L3L6FKU+sLiDaIgj1x91Yf3DrVchXLB1yq0hfPlBA0DRieFpS37bVJa/g2Ctx01E2EwjajHk7cJVX/NUk9qt+576DICbx/DzgLKpIsx7tsCCsAIVI0LLzHwmQAggIXhDhovUxVnS1axkyeIAKACKv3Jl4SpQePY1Dd88JQFm7FssYLI26xEXhI8Ge7Whi+GSv0BKHvf14/OocRkGqiM+fJ9SksvdxDszL/HW2WQbOyW6hkE4s7ohmjTO5uXLdXwfag0gfHUqk1UtB6hqqWqAIGaJ6qd5x1aP3x4eIKY7xMsQ1InuEzutt+/hAbKe/O6Ypy1laZkQcSwIy2MoNd2LUiwpZAgtzDlQKPIATCZWMuE1Aw7MBRvIwojkApYLnCyck63vvESalULSug7ajtxYFr1gKbj3rsEaN0VIY8oOJutNcWbR8Q1NcAiXEyGVbnbOWJz/gv1ohtxtLJ3tqE4a/BB3F+MbAzYWpfHlrczYmC9ls8CATk/lkh9aGyiTJo/2mw7lUnF+RkYehIihjRuDEZiBLKBpp1zkQzSgBM8OL05Exanvlpa2WlRl0cM0vIy5+O3LBXsC1PYalGUuZUYAn6DW2kfJ6vuI1GPYKpD64+HpmFgcGjncQ9wnac57qJS1GpP0aIAhekTn6/H9YD1Z/MqZ3E2Wp7koiSL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fbCss0itY8YLidqOONoSegVDMyq70+nlGtGfF/f+TDw3rb+NCxQuGan4nDsa?=
 =?us-ascii?Q?F7mQcLK+8Bt3B/TsbelaNFmZJr8ZHMLreYxaQHWtiEvaEsCeM/uFzaMVxUwn?=
 =?us-ascii?Q?77CXpIX2p3oIlQwJfvteOVe6VRfNVLMrdCXaKzhV9OvEfT2yQVl0hsrnb5lM?=
 =?us-ascii?Q?PemESkZ8q1yPt4gka63jLh/TQYIru1o5ysFHaiKh40h9YtizrXVsTl+7KYs7?=
 =?us-ascii?Q?f3hkzsOWmLhI2UBIgEw5lmMr5rURI1s2THyRGtRuTlifzVYrtT/uA9EHRtZ+?=
 =?us-ascii?Q?fkH6SbqkPPchmmanaP4VksSDBq8KueNlhdt8kU6mXvxOS1UgHuLtVEtfwq5a?=
 =?us-ascii?Q?zJoAeuSOAU4OtjEPetbVhVr8/4awmA0Y42LA572T5v1vqs5TdqnJCrPQBtlT?=
 =?us-ascii?Q?+fLVbL2iumA6yQ1Vy0HSQH23AfF100MZ8ZN16Xg8YIGS+02XVu+px2ObEysj?=
 =?us-ascii?Q?+aglMus3simHWCqhijFs9GHwtQ9A52x8FXKoBSRFMo33WjHWHVyPKakyf76z?=
 =?us-ascii?Q?BU1CNY2ZlJZwaddz9d6c59Mm5gyUMQn43Yqir1WQlqH2ECBL8AtMxOVqyMXL?=
 =?us-ascii?Q?Jgjd2lgjCBFtrZ9Yr7LSQs80MStBsE5a/279SXQWtEIkGAM7VcBidyg7s2ze?=
 =?us-ascii?Q?nXuw85tHVyn0WYc/Wr1jGRTkYblMdGLV2UI4L9KhRma7jegBkuIhm0p5qYST?=
 =?us-ascii?Q?aNN4b9St8m5wwzxSs3h6x6uaeID5yfqrpfrK3q7WtAjVvs0oYm5WUmzOSLzP?=
 =?us-ascii?Q?sXDYc3rc1UYf3X3vjBAuUJqxaD4OlvgWGnHLyoAe0wovRk0kwUjZlZ37W1gT?=
 =?us-ascii?Q?qH2yr5zQNa45Vz011+QLPJI0OWB3ksWhdFhErbTtQdiGBcHhjT4FUYlfL3LP?=
 =?us-ascii?Q?PMwyqYlCwNDxodTLZ9cImlhVkfXj39YrYlTH6731R9hj8gxjgG1P2Gn1MSnc?=
 =?us-ascii?Q?oLTNZmwQBzkGeEXnWyNOBrL5sysIWlEQ1oQO1VV2MtMzMcBRJH6N8Iw5OapL?=
 =?us-ascii?Q?eeTx2hTi2WyMQc4K/+rQg0P1fIONg+goio3WIdw6auxj/MLLe3VX4WdDd30l?=
 =?us-ascii?Q?XvwF/SJlXMd8g6tI16/gAscg/4wQDUV9MAedYD1Ilp6SqdJBqZgbV30mfWXz?=
 =?us-ascii?Q?qrJuUIAMoLlwabwvadhZHu1u5j0DBauFehz/fT9FLjwEmETo/BNjzJzxQ10Q?=
 =?us-ascii?Q?f6wXAoq10+jQ1bzx7ce4cXMo63O0UzTlqxzj4g9ruV+I1HTDww/GCb0Z99/F?=
 =?us-ascii?Q?2B8ecuX0b3yFqSm/Twj9c4v+vnb9ubc0kVaXfKK+LxGmo5f83MXVabxAsZ0a?=
 =?us-ascii?Q?the2u19y1ouUgWDoZOEiknDuVWwS9P8LlPOFPrzRy8iRu1NnsDDPLjJGCdR7?=
 =?us-ascii?Q?ZMiIQtA/pxbNeTFkBMqurhmjka7LLV1b1gfffYpSuR2ALNcH9E40c8Tzu55R?=
 =?us-ascii?Q?tIe6TtJp5mAw26qMhJ7mtipxXrMxHOvB0x8EcjnVaLk3S4wKMms1wVJyTHp5?=
 =?us-ascii?Q?Tmkrzc8Kef32Ph6fEZG3eRhywGRpsc2RuJFL+woR/j9883jfUAns6batxGsn?=
 =?us-ascii?Q?Pw7Eu9Up8RZrBTLcHZ0KYu0r/s6jq4aRa3iv2V2tQVOH7JU0BSIjn1wkfu4c?=
 =?us-ascii?Q?kJlpvaSPnDMnw7/eUli4WWvTqdju0WCTXwKRt5/gOyuO23Ovya62lSX6xyL2?=
 =?us-ascii?Q?X7157jJEn0Z7w9FLI7/fGMxEgP199IJouXQpgD07Wy8Qbios9/gyeM3HiREz?=
 =?us-ascii?Q?l5Q1l+sDi5ry0S3JrdZxancO0TPHlFw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 050a8539-d82a-421f-3a2b-08ded522d2fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:47.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHoPP9quhAajlkb3JQJj+thqFE44aXgZmgkNjMqnar09BjxLqr4iq5jmuCCVhpiTAQhuN7i6TlMpncOxweAn7wxhLlIPsRR9iUKAWqI0mvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39060-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D95E6D41C2

This patch fix several misprints and sync device tree binding schemas
with actual driver code.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml        | 37 +++++++------------
 .../pinctrl/airoha,en7581-pinctrl.yaml        |  4 +-
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 79910214d9b5..f52802a3ad79 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -159,17 +159,8 @@ patternProperties:
               properties:
                 groups:
                   items:
-                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
-                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
-                  maxItems: 7
-          - if:
-              properties:
-                function:
-                  const: i2c
-            then:
-              properties:
-                groups:
-                  enum: [i2s]
+                    enum: [pcm_spi, pcm_spi_rst, pcm_spi_cs1]
+                  maxItems: 3
           - if:
               properties:
                 function:
@@ -207,7 +198,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48]
           - if:
               properties:
                 function:
@@ -288,17 +280,16 @@ patternProperties:
             description:
               An array of strings. Each string contains the name of a pin.
             items:
-              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
-                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
-                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
-                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
-                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
-                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
-                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
-                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
-                     pcie_reset0, pcie_reset1, pcie_reset2]
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpio28,
+                     gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
+                     gpio36, gpio37, gpio38, i2c0_scl, i2c0_sda, i2c1_scl,
+                     i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart_txd,
+                     uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
             minItems: 1
-            maxItems: 58
+            maxItems: 53
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b..12dd85b5b410 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -166,7 +166,7 @@ patternProperties:
           - if:
               properties:
                 function:
-                  const: i2c
+                  const: i2s
             then:
               properties:
                 groups:
@@ -208,7 +208,7 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
-- 
2.53.0


