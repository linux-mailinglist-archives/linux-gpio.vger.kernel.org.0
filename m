Return-Path: <linux-gpio+bounces-30090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD68CEFD6E
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 10:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE9D30262A1
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 09:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C092D4803;
	Sat,  3 Jan 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UDnVWfqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010019.outbound.protection.outlook.com [52.103.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96AA4A3E;
	Sat,  3 Jan 2026 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767432527; cv=fail; b=ITpYtWK8BKafAFf80fcwdHQ3ToiEzX+Gq6ht4aUlNc8nE6o4ggphsHtz4Lz/jwPpCydqSeqGErA9dr1o+aTpu1dG7P7UMCkWiHk2TtHThcMhPhNq+xhHjTMgsgYtPl/9jgaO9JBahxok1LWMPaUtXtkCxwOlVT0XAmazpOVeA5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767432527; c=relaxed/simple;
	bh=W6FjIBu38iIMiMyajB1/Czujfu255WuSJ8K4roXYms8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=acTg3do1cJ1pId0BP4vJisw0YcBWvD9IeVd4TUU7biZOIq98OKlo/vA5uE59KYrDmmMQJtQzzLfMTvdRqYSx3YhEGXccQMcPas05HfJzMuAbPw87IuacSQbuz8jtY5NokjRe42xzcgYfbb9CJEMfOtM93YH1gDsL4qWOxyTazBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UDnVWfqL; arc=fail smtp.client-ip=52.103.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVmT39icgkLTYGzH0ozSLi0Ksen5uYNNECKtjTuaGl+o91029Tpa+tMdw9Z3xI0wIrdIWcEikBDNl/RSf2zQC+RdyUMJCUtY1JhUEN4a6eB5jNCedodZoaJ0eZvj1CZW5tSqLmWtfcNk/JCn2UIbP75GHn5Gs6UW9LVkoMVTs0AW28+nkGNFvG9PWIE3rzc0OmcNN6oph5+C4cPzrasY6HyZ/AVJjCJyiAaypcf4XvwDV4j5YcwRHT4KGNKmHUkpkZrKGbapXI/ch5Sdo9p2wfPWc8QPb5dH0AEBHV//UZNmftBzk0gLTksIF3Qe5pOlG4bDHV/sG7Ym/VF39QF/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Joke38XwL+48ap+zDpfU6EkR5QCjIWvWYHxN+wRJJt8=;
 b=VOzCK5ffQs/R+M1dWJ8QfiyHjjjFOtxIoaXvQKV/Kb7hB20lmX4OZIUGmjZPVnBxMmpW7UBualc4pTGpwbteomQLMSfg3+WYpgFQdLeIHLfk2y6ZtnuctL5wD48eZ97lQUKjvCbhjULaVZAUFpeVzRxIdLyHnxj2go+XkdOLE2ciR8gj4+10CJWH8wSqDnrrSkY+onihcur3jZCAitZhC8tDtVQVIHuwUdxsWm5j8aOHYc6D9O+Fgt3c7pOPIAc4SVrmxaDfz4SWTVkID/0X4GrysR0qP7r9DHRbgdpWMvT5xrXbkxj75nCxiNp/JfuscEhUUGd6Ab73l3C4JlQZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Joke38XwL+48ap+zDpfU6EkR5QCjIWvWYHxN+wRJJt8=;
 b=UDnVWfqLi8od8Gv6uXZTAqkHcoou+r6pFx/NHfSrIzUS5gBYvNsOwXlWiBZOwY5nLwAQ0Mb9u6uaIHkVzDKoojWWFQPtKYBNbsH5CZIoPj80noWp2Vp3M7LphQL+fpCl30jM/Ym476fxe6kffMXCkqgBPRaqAp0TbfCNHd0R0mD7jywiZqSxGH+HOxXk+jDv3YgDtNW54c9MW2zzg4ksnsUCmSeFXqsH09RGQMm6Ro7psKiSOgrZVuU63JHM5pjtg7xfeg7Tn7GxH9T80b2DquFl6bizKzzRGFqjvYUkinKa++VO9cLdWLxDW+1JWCMO29MnUekrQj7IiUdwKAcAWQ==
Received: from OS7PR01MB13834.jpnprd01.prod.outlook.com
 (2603:1096:604:36a::14) by OSRPR01MB11645.jpnprd01.prod.outlook.com
 (2603:1096:604:232::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Sat, 3 Jan
 2026 09:28:40 +0000
Received: from OS7PR01MB13834.jpnprd01.prod.outlook.com
 ([fe80::6e58:e4b5:3405:28d6]) by OS7PR01MB13834.jpnprd01.prod.outlook.com
 ([fe80::6e58:e4b5:3405:28d6%4]) with mapi id 15.20.9499.001; Sat, 3 Jan 2026
 09:28:40 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Weijie Gao <weijie.gao@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [BUG] pinctrl: mt7981: some obviously incorrect register maps
Date: Sat,  3 Jan 2026 17:28:16 +0800
Message-ID:
 <OS7PR01MB13834E7D3E265DAFD58CEFF92BCB8A@OS7PR01MB13834.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To OS7PR01MB13834.jpnprd01.prod.outlook.com (2603:1096:604:36a::14)
X-Microsoft-Original-Message-ID:
 <20260103092817.3164866-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13834:EE_|OSRPR01MB11645:EE_
X-MS-Office365-Filtering-Correlation-Id: 00803475-d05f-4797-5b26-08de4aaa7a54
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|23021999003|15080799012|5072599009|8060799015|19110799012|12121999013|3412199025|440099028|53005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zSj0mM2BOrVF5nu4HwbmIXJWw9RrBiRuezrjWy9AFf8cu8kHqXqpm8/BKl8H?=
 =?us-ascii?Q?u1vpapIzR0Wx742GshWzJwHliNk8mghKB9uiE3Bq7NKBn1BJZN1TFYalq9gY?=
 =?us-ascii?Q?xJ8B53eP/uNlwalCkg799sqT4eT5FF6TwE5xV8tKq1qsnO2Tgjtx+hpoMVUk?=
 =?us-ascii?Q?HmflOdVtEqxIWbaz8Oo95S+NG2WCHsSGbeFevF7mEC92R5sGDxYI8XbNhfyE?=
 =?us-ascii?Q?KpQsF1UA04XMNAlogl+u/M4YHxxeUjXG5W+SO0W6pINTUPg8nrpgE7oNJhv2?=
 =?us-ascii?Q?niMuiwfPM2jr/zedpqFl68RNn9Ureawthid+dNB/AweFh3YRfJMZLIbc5eYy?=
 =?us-ascii?Q?phIF4MPqGzQwFI4nkN8ioG6bYSr9npkZ/up9xzxKZT85daJ5SPjeZ34LKTcQ?=
 =?us-ascii?Q?2TbA2pjBnTsU7CuFXZAOnaoiup43w7dOGg5TL8Io04WG9m17IkghoYi5Lwbc?=
 =?us-ascii?Q?GpsdRdr0TFcQarxDbIQmms+XRH7W1Va8Hdq1K0zz6zjyqYE+v0ysB5rIgMU3?=
 =?us-ascii?Q?g4kaQXGuK0wiqHBNr+stitW6WKGNar7Bq0eVNyVQbMudDZr5ArPssJXea7h9?=
 =?us-ascii?Q?vTTVWK0PvTgQ4tifuONILktoiSQaejfCmQzD9u3sxB+jz7IdxvaFK6NXPdp4?=
 =?us-ascii?Q?UcAKXXy3QxYOt9/rM5v7f105s6MNZl4jDwJPAkNOslXRMvN5PchHbL5yOi2A?=
 =?us-ascii?Q?b5b9n0ic7+SA85qpHpkaIhePJSHhGXWsRda2uVyDxfcBwOFlhtJT3KK/MOjp?=
 =?us-ascii?Q?KSAzkmsq3oR1jMZvmsk0IRY0Vjws1vW1ehFzJY59cijfwWwAV1XVvVe9XCVJ?=
 =?us-ascii?Q?fBjDQ+1MT0xPXncDHQZyvBGHqDom53ZR02lN/HgTT9/Bo6IXNGeiRyL1VR3U?=
 =?us-ascii?Q?o4zf30rIkoAd2HxwU/rJ6H7Q7Erq2HP4tzQPi29YKBqBFF6PDIkPgoYgyHZC?=
 =?us-ascii?Q?sZ34NfX5kQ2GrJl3oWTOwCVkKrrIPw4K2MvP7nRZmx9ubphga4TyNUERpKsC?=
 =?us-ascii?Q?sZ/AIY+zElCbYI1AI2OOs6GoqWeEB9V3lXMHKFzMCJ9iG+x/Pdab/g3WAdjP?=
 =?us-ascii?Q?USyl8zZ8bb5uXbv1XRXNvtHRr+nrTVRLmp0ShTqvXPJH8W16yxnbZV4ZA8cP?=
 =?us-ascii?Q?5YTrqLO2GDwL8soTKDKY0IhdT+aKR0ZO6yzO3LP7b7sArOkBVvQcCrA9cDxT?=
 =?us-ascii?Q?w+6yWwwweSdxLByyo92L9S1AAD7Q39h/O5le35hYj/QDE+PA9BdVpFJotmk?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SIKSCb5kCBNCXU0FpyZ+TtEhHBQPqVl8ykBdcH7b78/63AK4TO8R/cH5OaJi?=
 =?us-ascii?Q?mXzQJJg2otVcrscHe0lcPnl2zm+Zt2caOB/IW1qnDn9xPekNti2r5ZcWLTYV?=
 =?us-ascii?Q?7iABXb6lSdRexhiY+YCZx1LDCaNwgQxctrVcunZgX9rzFp31pidfrGIbUW/C?=
 =?us-ascii?Q?BCn42+PXb1TmWTjewZp2lgr3ZKuc4E7qzlNdf4q4eRVncJpRwgKchowcc6sB?=
 =?us-ascii?Q?JsUZJi2BOxCdbciGASk4D3XSmMhmuWBJoDRIdXb90leil2A2pTcBGLgbRrrZ?=
 =?us-ascii?Q?v4DJrOUj16XmK7hFy8N6JX8oaeCrDUQDWNx0uJlKimxApTtiTocXexI4MXMg?=
 =?us-ascii?Q?aGKwAr3dI3ew3aVVGLKy2AcbFHfOl9aqqQcD0puuGITSBq5U06GP0XOrYZ/6?=
 =?us-ascii?Q?MzH09tEeVenIPQ/Jsk3DnRKACCqnT+1DpP7zOxG7xCXmPsAXyLKkorJdXTi2?=
 =?us-ascii?Q?0LXN+6gM6iCzTbgNN9a+ZS/z4n/QbG8tlX6JU9sh2+WuBw18MuxwGCcXeAHc?=
 =?us-ascii?Q?v+GNjxA6jVkqv1k1D22zhagq4/YTcmUqBQabPCIcj8qHnc0besBEcXM7pc3J?=
 =?us-ascii?Q?nrENpih1+9DWGOzlH/oLSc4z/Lp02nzges5oKSUvnJMz0nZbXpD1R/1VxXEh?=
 =?us-ascii?Q?6nr2ELQcn4eK9XYqLYZVzfUAxyPOwt83nA6AD1MPtSbOojAwGWbQFkNo7Wir?=
 =?us-ascii?Q?aEtbxtMUVVgi6Yv7+IlqlMsFwWVApVY5FKUieAWP/N1ncfGjb38JoV4Fbs4S?=
 =?us-ascii?Q?TWXhbN433ukx5uShaXZaMgUXuTRmJEaqXHASTfsITA4ldgABbvAyfkDDtj4I?=
 =?us-ascii?Q?LJylSY7w8tMZstH6CYPWliiLrzkOSmj1wRIH7GoQuTYQN1+Vurrv2jso0lN/?=
 =?us-ascii?Q?bDkpJIbRxZ0UrGOpfgClkANgssUVpXv0d0iuqQQB5YoGc2flOS7O2N8tYUDA?=
 =?us-ascii?Q?GV3Wq/m6XX/WdsbQdEpxkpGuQ5xOw0twOE9w2BI3jswDeyy7ifs6w5pzrG/9?=
 =?us-ascii?Q?OYpTm0m7QyyQdUsYiS8jFYW0gKtrOTdAWvxUDnvDRak0ijeQoO1X905nLLvl?=
 =?us-ascii?Q?g+TNEy6oljOecYMWqpHAb+9imwPP/72NSqbd6uJ7nhJPMx34T+RfjWSrsZnz?=
 =?us-ascii?Q?K7tYgPxPbSUmJUQHyQSJ017MvhyorDxyJicfGy3O92uaKmkQH6sBXoj0SpDI?=
 =?us-ascii?Q?WQJPptEG3eunHv2urAhgIu1o8vXKBZK6w+ZUtNCFgqXbY1P4pSIFSYm1FpH6?=
 =?us-ascii?Q?4HIU+5wCLd+e0DvjPySvqElOtu7Srl8IWoBMxjTncnnoZ8pnetaHA1pkNqxB?=
 =?us-ascii?Q?1qIn4LJXwaQxSwgeN9IoplM+J66MzeMtxoKNNiKP4uKiAMhq99yBS5MSmAp3?=
 =?us-ascii?Q?9NmYSpeNCjWkYS+0slQGkch1jk3Wj3E+NBEXHZ/hrumyYUc+kA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00803475-d05f-4797-5b26-08de4aaa7a54
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13834.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 09:28:39.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11645

Hi,
In 'drivers/pinctrl/mediatek/pinctrl-mt7981.c', I noticed that some
register map definitions are clearly incorrect because the same bits
are used to control different pin functions. I think these are obvious
copy && paste issues. Perhaps there are more wrong PIN_FIELD_BASE
definitions than what I've found here. If you have relevant programming
guide documents, please help check and fix them.

```
static const struct mtk_pin_field_calc mt7981_pin_ies_range[] = {
	PIN_FIELD_BASE(11, 11, 5, 0x40, 0x10, 10, 1), // regmap overlap
};

static const struct mtk_pin_field_calc mt7981_pin_smt_range[] = {
	PIN_FIELD_BASE(44, 44, 7, 0x30, 0x10, 8, 1), // regmap overlap
};

static const struct mtk_pin_field_calc mt7981_pin_drv_range[] = {
	PIN_FIELD_BASE(3, 3, 4, 0x00, 0x10, 18, 1), // ? need check
	PIN_FIELD_BASE(11, 11, 5, 0x00, 0x10, 0, 3), // regmap overlap
	PIN_FIELD_BASE(13, 13, 5, 0x00, 0x10, 3, 3), // regmap overlap
	PIN_FIELD_BASE(15, 15, 2, 0x00, 0x10, 0, 3), // regmap overlap
	PIN_FIELD_BASE(34, 34, 4, 0x00, 0x10, 15, 3), // ? need check
};

static const struct mtk_pin_field_calc mt7981_pin_pupd_range[] = {
	PIN_FIELD_BASE(20, 20, 2, 0x90, 0x10, 3, 1), // regmap overlap
};
```

Regards,
Shiji Yang

