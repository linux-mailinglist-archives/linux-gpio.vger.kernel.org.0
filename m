Return-Path: <linux-gpio+bounces-8337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B793875E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 03:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC5B280257
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 01:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A86E179AA;
	Mon, 22 Jul 2024 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="F1UEcg8/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2055.outbound.protection.outlook.com [40.92.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ADCDDDC;
	Mon, 22 Jul 2024 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721612431; cv=fail; b=sL01a7As/WldLGVLDY6KQiN1kIx3G534FtqOz9Gl0VKRLWPGTlViV32QgC3p57Wsia+XrbVFErBJfRqM+OwlPW2mjTnKMjDUZgTGJ6R4Rmq7yItJeSYYU7+HvMAb64UZNoJGdRpUYRkpX68rIcqOWPWWaP045+j/8BDPMpqzkrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721612431; c=relaxed/simple;
	bh=SFDYXb41hzaVr/2WoC+AvD8kqIKjfmUMZxcCzEfDYbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oUiWfOlUsy1G8bZUq1Pf8NFGEV/tN3K/spekWE0H6GkdlXZCegeXjJTeFW4E0CWglxlxEWcQ59fh2wJiMHSN5q8Jw8DMDHFcKxnYKgebntKmgDx4AOApVJgai2v+7VzMbX3caqJERuRFQJ0bRDKv7FXgt9S5fzNSUPKDIvv5s3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=F1UEcg8/; arc=fail smtp.client-ip=40.92.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTwhfqYWMGfq9PowH9Kyk97vQANlJDgxh/KIf1LEPAmUY/fxI3sfuGOPP/yEh0P628x0gT6/v32DKF7szmWmlZ2brd4UvCvIMo+GxZW+ZWPFJ89f3gydlmUj+VA9C18AYhFAeMEW5T7AT9Mvl1FZY7e+sTNCC25mWe8KhGMgFcl/HfTtA2q2iEoGScR4hWY9gXFTdnHN/nigVszjSXfYRjbdrjjahnxfE/PY41mjG98Ly4RsVnG1GeH8iA+tcoH1jxqWD5EbO9nKuK0tELn+E+CsGzevNskbykqnadwvZlOTC61RU8anB1Dj633muXUIcoAUOfPApWfz1dzy8vTB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4TbHAu4Ja1EaLRb+ZVAL1MGcs0f/SOJyTBB1iLZqZQ=;
 b=uAgu4i0PCQZLZhKBGgiFUhED4I/bclUoL/+uLyLCKIf2GSUjPixJWKuMzsuq8UuAwNzixYdeVUbz2v+fV0Gef0mCKyFSiJp9myOVnovR18nee/9mkW2oF3o+iPI5l3DyTDNmdTGlSBahE19hiFmSlJJ+u3XHet4yc4Ao0P0TUKv12gsd6vbRQaoKAlBGIaX4XBh8rHvqK9b1nkbHz+ejsElm/q6o46pZsHKFlkouaCoSunJjXDA3fhmKoUI2B6591jqApSbIsdhTEGCaKJuYNsQ6oSoJk7vQT0ik1i7o8OKcNWzzoYDkPbk5AspI4TIEgiVEi/Xpjkm6KOd30izsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4TbHAu4Ja1EaLRb+ZVAL1MGcs0f/SOJyTBB1iLZqZQ=;
 b=F1UEcg8/h5ft+SfuzPLL3agTd55GIl+sy5gBBoQIN8WqGc3oxDYX8yoCXf0/V7E/eLa7PIV5NXXpqQivkBpM6iQ8xrb3aXqVUBSInATTxnt/EplhEcIlbxiz4FO6i94JgPftitQ+nDAx780waZmlsbpJNOBU/stGXbrUCR0PF1O9heqGuGlH16c2C4zj3/LkzwoXWT1OrsoHqhl1i1Vkpeda3deGFNJm6YfSY0ne+AfjWN/0jZyxXYvDSGEcsYoG+YWVt8TKLhNfA5got0bH2ZSBSYFI6bt9OXJGuiF8RkIznSmdc+EAApeZUBh6bToZy8H789QEmH6FVB71yq+NZQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5403.namprd20.prod.outlook.com (2603:10b6:930:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 22 Jul
 2024 01:40:26 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:40:26 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
Date: Mon, 22 Jul 2024 09:39:26 +0800
Message-ID:
 <IA1PR20MB4953B8CF92B5ECFB23C66F07BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Nhe0ycnyz5riKMl8A9o9UV6jgieaFZnAgN/xoLBtPrE=]
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240722013937.623685-7-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 6793a6dd-49a5-4cb4-cd74-08dca9ef42f2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	h3EZAqKU4Y8xYLpBb0HXaNdV4uaCdGRsxrj1sQ/eapsHd0sU3MRbOeh0gskKFKqNpU2DZXE5OmX55nh9sCTgttnyR5yBBMaAZajiNjsfQ2fqF7dbzVTbSOKa8rC3XjrEPMxrMcK976I3pYTtfx+qTLCCDlPLNAHAnm/igRgjZ/18KlA+qto7hIbIDdlwd7jQOtgJf+jusqcKwN2f7U3iMS40vyOTJTGIBfqEqDoFqF/OeveJP+/5ZozvHYCis6WjiLzIn3aC3dHEfl3N8p0gzm9FFLkbaddHDIiL5+aXp3OBE/TVkNJ8NHY1yRTRoz142IkIxiL2JPECnu1yTucQFKJy/wZBuIE8hhK6jExbKe0nB4G6L4YQBnvVwT4fCs7uNqCgUnbN7HUOKk9oAOgHqcFsdHX38UITQr8kZASJm/P1HcpoNXkl4qGUiH19QLtcKpfYpPl7na032HJ5EwnQZbVNHkpLlvvwKGOvyfbR2RuILEn6DyLmfwsFlLyD1Q0kSVQjgW52YrdFu3VwEDb/vXgQB5Pwq8edeHlQXiwwcT4Ku3CmusUoDplj0aaqd7dsndPAzA4D39wJSChShooSNfKB+kWDBGE2aWfy3t7o7mTGR6enf31+eBE/YhQ1FjHiUhML4P2tRbL4dw5Nl9OnN0L57GPD/S2cH3clepVzNd8FGwvC6HStlvZ/7vKHMpz3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/2vb+bMraqZXwrcy850fCACnA3x4yC92pOvown9dvuzaI+Ho5CYF9UC1oyS9?=
 =?us-ascii?Q?Ocz4RDDt6tGKALsQmmT7+GPNkNztbUDDt1aSW01o37GTajs+ux2/dWNnwldt?=
 =?us-ascii?Q?T7Rm/aCaMMEoxKEWmJwNdmD6WeMFUMe8n63ANebyiCjMcELXSz1DVPpsTmVO?=
 =?us-ascii?Q?PlLCqFo9emYUdb87n2zDFNsoD4ffs51Xddyx12BmKQKpj2bo/RAXc0My2Hbl?=
 =?us-ascii?Q?Wnzio1CafoWGlbwZWqFUs1wzESoq6AORz24hkxdgy1ptXN0S+FeEcEy1HQkX?=
 =?us-ascii?Q?ksU6UToDGX9FSxBWenlTYc6YUK+p5N0XKULnA7COhH6szRrvBoHtxCBH90k9?=
 =?us-ascii?Q?pz7huIvnXZlP/yYyMtPg4YGtE1Oa37zJocYvSS8qh8imbN2oEpGZjaotRl4k?=
 =?us-ascii?Q?TfzhG1FB7zbGLp+BDDgsMfdLo2BZn/X/wFgvMNEZpW8EVdLr3+qdC+ufmzzF?=
 =?us-ascii?Q?KhKTpYKr++OBvHc3BFxmUbdLj28vayYuqwiMsWP2L80DLr+HgWK34f0LXqAF?=
 =?us-ascii?Q?VSAvGmdxRqy6o/OrL5igfqpuWqOr0TOj0esYgoiXR31yIhS9/Oe27T3Zi2wp?=
 =?us-ascii?Q?Iu1d+A28hK5XSkrtVL+5JCXGQYg9uL9ysvcCqYV85p3XaLWSlKaK7Y6aCS0w?=
 =?us-ascii?Q?YOGYccjTIP06QTelR8FKHsqXltx9Tp3Ks9zwOnOtudU9scPAdH29Va8tBQyP?=
 =?us-ascii?Q?HhtZNuj+6DqF3SvGx7I1m1fK19I1POHXqQIh2gBpuYVAJTH8xDEAOQ1UOZfG?=
 =?us-ascii?Q?CyXxyV80yOj1bBkMcjd3JtisK3tUqasaW5UhPvuCX2WINsT7hvh6qafSBseA?=
 =?us-ascii?Q?sLH/iHFfKvqNVFeSNGbBU9bVn/2mjg65lYk0s6dX8vC0WClDZrcCS/xFRU5b?=
 =?us-ascii?Q?IZrWIcwlGoVFF1R7kT8RSfCg19ferK+SUvn3aCCwfgUB/3aink6F8/CG5H/V?=
 =?us-ascii?Q?K9dXSkQbfD8F4I3443H/Bh57u8COtYmFgCrU7jJxxepBlVtrCWUES1pMN5m6?=
 =?us-ascii?Q?wXDfMFEr0vabkbQtHghjSEBPtTcR/8Ac/JN8BTcPvDztlceZ3mibPodL4bOL?=
 =?us-ascii?Q?K13HObZHy2mMLjKNer9sH1CMdJ4DzaIF+jXXw+f6CMN9uhUUX9PsoqCp89+R?=
 =?us-ascii?Q?kyqY+szRfOjqK5UXr+exxawb8Y8cgSmbSAxJzPnh8QtySat4m+i5LH7S8gve?=
 =?us-ascii?Q?8qkRzOMClqOZ2u1D2YtwDODcxWjmS94Ix613tNXs40UJiQK4boAIT86XrU0S?=
 =?us-ascii?Q?vZIA//q2ooglTKQnqzxQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6793a6dd-49a5-4cb4-cd74-08dca9ef42f2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:40:26.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5403

Add pinctrl node for CV1812H SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 7fa4c1e2d1da..12e44edebfc1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -4,6 +4,7 @@
  */

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"

 / {
@@ -13,6 +14,15 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;
 	};
+
+	soc {
+		pinctrl: pinctrl@3008000 {
+			compatible = "sophgo,cv1812h-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
 };

 &plic {
--
2.45.2


