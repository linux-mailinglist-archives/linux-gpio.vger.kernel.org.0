Return-Path: <linux-gpio+bounces-25240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015BB3D17B
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 10:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC5AF7ADAE2
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCB0253F13;
	Sun, 31 Aug 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QFMvAkSj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012003.outbound.protection.outlook.com [40.107.75.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1B2512F5;
	Sun, 31 Aug 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756630221; cv=fail; b=D/lD3BuRazvVWtdW3zi/soF5N9Zjt3F5ikkPK9TDHaEj5QxRC87NajMsefMR4n/DATrmgRF8vzb4tvVGr/XDhNACtUQY9aPPMx4IsEdbWzlz9ERt71auvrhL96VL+RX0b81t1EPGblz/DixTgAKjASP+0lMK3Pyt7n9/ZrCrmSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756630221; c=relaxed/simple;
	bh=sUtbVoFuHFe+Xe3oYHoSX2KqupD0/bC5TpZqZVwRcv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W5Awqu9VdduHaAqUjt498Wm/ys7hr8gRe9ldnnT5/iFOJ0jfcoV5cfVZrfltvTGuBs7lRwfmldAo7p0mnjwC/mOh4CP3bjW758A7Wuy5EpZusL2liRMLxMLYjWkhR2WDSqVws2wQN+GR25FbA+KeWPxnB5fRPBb7LbSiE7Y44PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QFMvAkSj; arc=fail smtp.client-ip=40.107.75.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywqM6yJ+rCSh2oJ6pwrqGwopTZG4JunzYxS4n4NJchBvtOSLqOyIN8QlkFSqsP+JrDXoQ98agKCnR6YruQNY+eTLRugcRpgyD0Q0gz6O8KqJBEXoV9977JHV3wKvL89dfwpdPFxGraJHAElu2gQHfdmxSRXP+ieQ5iLYYYriu3ltGrqoQd3U14ICSksYBJc3+klgP1HCy2r9zPUi14NLY79DaW1XbCC4a/txlUY3F41jNHYuMtEofmbVhMMj3XgoxlSsYHQpIL2hEeEjpOe2ITiSkifdrXbEDO+Dqnw3bCKyLfhqaFDfZK0E0IiLBhJU6G5JheS1jDz0rR+bsm75fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAJqmkLc/QlDCD1cpe8sxeNttOnbJhVIAzS7lj/4uJs=;
 b=CLHAWcFcxBnRmaPAogSGLX0ERbEy6v66M2gQyZYzirY7Q/T2PCX5LhgrBnVCz0M7fhItGMqCQrQ00gh19YpPWccAlgFfy4TMc8uYrBXojenwu5HSC0T6nvn1MG2lZ+G2Q+Ks7MCQy4aRgzDmjPfCvTR/UZKvOIPOv6Z7LR3kbQ7qhlsKL4cQD3KmSlRzaVeWdWXcTpfyzMuS1+QJwR1SYKqmf+m7Lrxv2zaV9GZxfNYybS7/aVZArFjJop9/zwrfIyt5Z9hXQR131gJsp3UQ7KurvTRQlNIqczutzdCsZzA+uV2hf2hGz4uVcl7iZCrNKa8AxLeAkRRjZ/N9PQDeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAJqmkLc/QlDCD1cpe8sxeNttOnbJhVIAzS7lj/4uJs=;
 b=QFMvAkSjKm/nANNc0dIwZU9x4PxSnOFVakVgfpuO+WhK1zPEuZg8EO5yQaAzQ2BmETiu+aK/9F0WYfcFMfI4+f2mIrczE1ro0i9g7CxXRcBh+cbCn0uuKugRfRYbPgXDUmaRs9Phz9p3RpbMwTLN0xUoMUcl6i1Yr3OuUgnp6l2U9sOfVAICuLhp96QAsVtRTDGaCJS5wILgEohHU+5mjHoWfZH2XNNgmHsQ9J1fMHfwUKlMNBaGux5mM8JJqnZ6XH0Pr95CBRTYIClXmQOprYz6M65WEbzsbkatebT8yN2J1w1zxw8Jr8M8eiiVU+Gml7rr+A0uGzNMNvG+yOvrHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6372.apcprd06.prod.outlook.com (2603:1096:820:99::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.26; Sun, 31 Aug 2025 08:50:15 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sun, 31 Aug 2025
 08:50:15 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org (open list:PIN CONTROLLER - RENESAS),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 3/3] pinctrl: renesas: Use int type to store negative error codes
Date: Sun, 31 Aug 2025 16:49:58 +0800
Message-Id: <20250831084958.431913-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250831084958.431913-1-rongqianfeng@vivo.com>
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: d18e4b47-610b-410a-9d8b-08dde86b674f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8NITpUsUxhzb98x0bgMSBH3OA3dp9ENOnql1bs64RtHSUg6jc0mEszgGupGI?=
 =?us-ascii?Q?NtTYK/gzJptO39DKPHPHeVz/9usUQTGJLoxpNXfsz6cGOd8O9pXR8daOLo7L?=
 =?us-ascii?Q?jjjHD7f9m3gcAl+lD7by8ROkIqv67xF1dXd/fspBNaUmwQOlBMunkGuucv5O?=
 =?us-ascii?Q?JSnaP9fvkui9+2lOcjwWnfe70+X1CGRYmu6ZzR6OMg2j27bTYir48k9oxPrK?=
 =?us-ascii?Q?HCya4HLKO2cUXObRiMQUBJ0dv7Zm81+KEKR87mVu3EQJN4dn17DswBpxVjz2?=
 =?us-ascii?Q?7ggXa57g9qBctkafsjK7n1OfkZ8jCUyzfpGf8UAM0TWiNCXY1OIZJuPZ1kJb?=
 =?us-ascii?Q?A9f0WaeUA4NZqrNuZSKNOC/qkRy0lEVFO1lBXrI6tirLH4i+cdVJ7Fejwr/e?=
 =?us-ascii?Q?ounrNhfnT6R1BYVIbT8RMZ+l7WGnLzjhPe+XuiNm7uh6P/Ga/4mlnHm0xVLM?=
 =?us-ascii?Q?i1Gz2iy/IWYcVUKntNPMD5oq8nJYzneC/N51oCkmE/bkfv0f/o9WS9VH4W78?=
 =?us-ascii?Q?m8BD5jKfJ2Ti716sNWONg7Li0p2iJZW2aqp1rDpDecpZQv1luXtoYm3DT2V5?=
 =?us-ascii?Q?/P+nXdzGYKDlSH2l5k5I4Vhp7VUS4TuGIXZ/8ZsYnaayMQ8Zp6HlOVkmZE68?=
 =?us-ascii?Q?LnUboFldEVZ/J0EiySR+ecRtw4e/+maE2oIe7NRHbX8LVnIORHwb4bBrQWCL?=
 =?us-ascii?Q?lWDGAEH8KZbqc7t4Jmsh+CUTAtT4WNAMdLebdk7PmowsC6TBxuZLnn1ghp7m?=
 =?us-ascii?Q?Mgy0QIEBfKLvdnjcjOBThCk75s07akTqGkYEWUe2ccKLoq/V7y3flyjGwxVD?=
 =?us-ascii?Q?CPBIS/DKjYqj1/PjxahIkD0Hna9udoUBYJUqV2DN9Cb9BfiqqZ2nTEzaGcCC?=
 =?us-ascii?Q?uF31hXoANjMpZkAB6HeFOrNtuV0EX8yeI9idMonPbWXzBeh1ayIMXjhd94Sm?=
 =?us-ascii?Q?S6ZooeZ98Sj2HwKWmX0hSxqHERZ0uVu3uxSX8OeL2mu7/Nc8b0YO9vAbltPX?=
 =?us-ascii?Q?PP+/j15VeIujAxLnTE07q4iIiTWlZs0EiqCOnSP0/P0EZ2DTnypUoWNLG8Ce?=
 =?us-ascii?Q?r+xA46zOJgb4TuePhVOhM4mBc6maCes91uUkCI/skZ+I8mMQmHLMIGjh7zqv?=
 =?us-ascii?Q?NpJSiYYma1VIgIns+z3IQLCt+v54AM00EY3xgRpH/P1njOCgDjZFvO3EuNio?=
 =?us-ascii?Q?Wo1OAD5f7QP9Vv8AwCqCK4sqKpgR+RKxtfTNILRrug5Gnga0F+OlHg4SJVr/?=
 =?us-ascii?Q?k3URVtn40MChRsW7qsJ1ZnJCV+ixWdKcf1SasRAZAKqt3+eg1Mw3MqdyFNMY?=
 =?us-ascii?Q?MxfZfkfeKKClPxk2eZmZ11MjTtV+V3KT6LcJagBi+Wf614LwcFThmJ5RaZt1?=
 =?us-ascii?Q?g5psTgNho74Yu9frWA8rZSUJmf3tVpF3n9034AGu+csT89Ceref6/NPvGttW?=
 =?us-ascii?Q?y7+rFycorfASn3DUg8KjvW/0OysxPRF2e45vg+3KE4j0AhVemO9vkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eb/T2YWJ4q0AcnX73Q/fLHRViGwCMoPNWHmWTYwipS+GJSmyQZU6pNmV+LI+?=
 =?us-ascii?Q?RP1Y1qB2RD+mus4FXIhkcF0xQuwGPxe90yP/fLhdsCbxsODigCby8IbEZoH5?=
 =?us-ascii?Q?N0SD5wBOMhB+E/MqZYOfJZ3MUu1qsJtu5kdonOuSfEpw0yRVs96wslyhiPiI?=
 =?us-ascii?Q?vCw1UAWbLc4/9rIN44tR5GUrTEn6SGrcx1vswIbpPjbrcmzNnW20gws+I9Bf?=
 =?us-ascii?Q?TFCFBKHyLYuyOHAlYNK2zXmcbKrHHJjj3Gm7JlpH0yAll8g68SMzMuYqACPA?=
 =?us-ascii?Q?GWgakpBlHSymRLyd6v4SQ8ePzH2xp+ySfNFldWCZkkagGsBKymds7zDy8u+P?=
 =?us-ascii?Q?6g6A9ZXW/YY0bfjgg6eJ562GLdIqUR6hbB6NxAtcrYPSrsbtWY9+a7Ek7JPE?=
 =?us-ascii?Q?cHH5ThmMKbeR6REH08IUDU/R4/LhdxNy4rSPwbnFqd9UWiKP/MOP+mVV23Z3?=
 =?us-ascii?Q?tQCoLvRNzhYgLnEjOli6Avc3iSr7NapIMlrwZeesPVA7+/EW9Cg0vOUdoP+J?=
 =?us-ascii?Q?EQiOc4FUsTrTUtOHUWGZXxA10d3RtkOs160/G9dN6FUQzwzYYNXDQ7+ge2e/?=
 =?us-ascii?Q?8MPrbuy1Q0Gjpx/cBggJYcFPNLfqBo1SUteJaZC0+1tb3DeEiBDVAkiE3xfi?=
 =?us-ascii?Q?sxBZ4S25iMS4MdlhllA7d5HaT4rpiz0gOOhAhLRz4pinhTfHrF+WvYM1szoh?=
 =?us-ascii?Q?cLHnUrg90u7DinXE0ndQ54rwn4BMNRzV8XjEZLv1MkL8SepEtULwIqeXVoYS?=
 =?us-ascii?Q?PIcZnO9zQZgRVu3xOvKriRrFwHYKqFgXjLc/CzF83Vz+/6hyz3wMrjtRg7la?=
 =?us-ascii?Q?2XYkPxwg5Afa52AP6+kWK4IEpTJGm8svFW6zU2rhS+vxM2ClV+Pmi6kEXNIt?=
 =?us-ascii?Q?MXx7zFaC1idAladWvfpDGq65Y9IWXKG1UYkKG65Y5QZ7I0w26xQLwI4Cy22O?=
 =?us-ascii?Q?NyLLJjjrfb7tZ2ujH1gIb7aM14jhT3hTmnOQKCM35nSVBZvE2aqLQuNuiGN4?=
 =?us-ascii?Q?99YCZxku84U0gYnvh1s2RnclaPNfSgDLetkFNHa0NE/duUwfgtOcZF1DJIrT?=
 =?us-ascii?Q?WY2HeDYYCd/+G0Xjj/TH3ZfWfC6s0fIZk68dxE4SvUjD0Rxx0YyZ75NFaTBO?=
 =?us-ascii?Q?uLvd5lLtuuKs2Vedh4BbZ3KWyK8/sbb1PHRUKmoyCq/IB5GrFP8SYuFLaXVP?=
 =?us-ascii?Q?cB/s8Tx0riR9YzlX4tEgVuczn2UXZWpNOWQl2aHe5he/9ni9f1Y0uXwTp+tQ?=
 =?us-ascii?Q?/zVzGmlMxOfugIAf/6UF/edsiLJxCY8U/oFper4pVm+9j4YgTaZWOzRdd0y6?=
 =?us-ascii?Q?9TWWZL3m3d4U1OKUebx6dmUH/GiVv+26T4aLBeXaH2O72tWllPfTzrLLzF6j?=
 =?us-ascii?Q?qK06SVref28Jr/5tA+Mad/o/MwTvDGxcfOc5c2riz9KfnmyZJa+PrQojlss+?=
 =?us-ascii?Q?8hrNIRkjanMCUnCAG1LRiVBqNs7i0nAL4d4zor3Ht5uPCGoBwXWp43wT6Jji?=
 =?us-ascii?Q?1hjEXbn9kDK0O0EQp7WMzTb8yHeXE/7YVTJ52NAtx3FXQYVGaZgQee76Hvra?=
 =?us-ascii?Q?4wuXLaVQoujVvZ30g07b/Kz/I5tm+Mt2fPdRgvQO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18e4b47-610b-410a-9d8b-08dde86b674f
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 08:50:15.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeiAALPkX44a3fZqsZa+0gn7Jp3zoL018CFgnoaTpeS/+er1nzhzId6QNSKdpN6qZQaBtnDPZt8Qb7ig1U51Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6372

Change the 'ret' variable in ma35_pinctrl_parse_functions() from unsigned
int to int, as it needs to store either negative error codes or zero
returned by sh_pfc_pinconf_set().

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/renesas/pinctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 29d16c9c1bd1..3a742f74ecd1 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -726,7 +726,8 @@ static int sh_pfc_pinconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	struct sh_pfc_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	const unsigned int *pins;
 	unsigned int num_pins;
-	unsigned int i, ret;
+	unsigned int i;
+	int ret;
 
 	pins = pmx->pfc->info->groups[group].pins;
 	num_pins = pmx->pfc->info->groups[group].nr_pins;
-- 
2.34.1


