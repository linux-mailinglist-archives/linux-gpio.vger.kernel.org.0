Return-Path: <linux-gpio+bounces-9435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAC2965C2F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFCEA1F231E4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 08:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D5F16DC2E;
	Fri, 30 Aug 2024 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Q2eJn15J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2043.outbound.protection.outlook.com [40.92.40.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A7B193;
	Fri, 30 Aug 2024 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008204; cv=fail; b=tfn5HJyAkljanbZsXj1yghArfTEwVbODBW1YXOse86JJaTIItVKr8GsK2oMUactlKdlF1h7BJralc00NKEQ0sJ99B5v/7esfogPAsp/omObMNMb/QAM4zNX4PEY7qXapRSWwlwmBnYSCnjddX69GMeZRiWxQIt3lQDgVSojgMkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008204; c=relaxed/simple;
	bh=GJq2seUqKGCQyyGHjkwaVt7/qAdzPs5T2rRQYHN63oY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y4gFEWN6ZioMrfpqqT5YX79a8pPIHinL43mf382aBVSZLn0zxuM3kVhcNY5EpQlCS/8e7lbh2pg2GdSGKrYBzDD/gqnu2sQujBPNxR2YLtxto4yCefr7zt8tNWXN8tHWSdhtH+TvfLcqgQPm+Vo27Wd8y6113XcU/utyqFwxYEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Q2eJn15J; arc=fail smtp.client-ip=40.92.40.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4jGnxcp0WImCvK2mU7w5UWEXmvt1S7Od2puVpqqGCuqzrLt9imnAf2X6XZK5oiB+GYPoYnq/WOZL2UAYXC3HHDdIBokdE0ieFPiq+iWGrqXLqDVAzuvhDAdHOHptu3JZ6Nz3H0AghVW4LA/kmf8k3mh4Qo3QsWpgGwqdw3xl0GbP1qfXXc6f6ddMBXWTU0rFQ3aFLFfAoGxo9jjE2JqWKqRPsHLQfkmlLZnN6F+30hmsHzQI1jPVDeMBDZ1GEq0epwUnlB0l/NGfyNeUUwC4y19Bj7wnOuYsiBdKwMed2cwJDFh/6S2HdyD9m0TQmj6KvX+a+vwCpn8wcnqpte49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cB9UfVaLNqSnrMP/0GMuS7Y2Ekv0COroJqqS8uxXcP8=;
 b=wZ2yFjPBq7yp6bQYO9TTw8oUdOE+Yy0igZOUg42EHPZQTko3q5tqUfQDiTeLJSQfjUXnzAWornsyshTIBCQvtriQcawWwW2p1BKqT0sb1tWtAKZ05WI9bT7DsiXzTaaalPaix33gcZyRJ/u2k+TNq+StwxchjcC0LIivfoHqqZlLm/pDtmtkD3IyQpny9MAMKS/YdVsdGy+eFa/GXg4w9PfQqhWaHSdYsM37EZMWdCxQ2C4W1vkZZRX/5SdHF6Pyf4ktLoTotWXgy5+cC1RYPQ5cgN7RvlCeSCBZ+jlUUfLDANDjrkxgjl75uHgUb3T74ME8Gn9FL0mPPJoIAubsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cB9UfVaLNqSnrMP/0GMuS7Y2Ekv0COroJqqS8uxXcP8=;
 b=Q2eJn15Jf581BAI1s3+B5D/m/afB5O2A/+iEJg4OxtHtNJ4NMO0E7ktCOG9txa9PLbC/U/8PGTRALKKjeTqygssPZgmKUETU9reXcM1qBvUXkhI4OXFgxMfaNwHSki9dbB49mfj/0cQ2US6mm8cwplR3+J1LaoFOX7mQnqiGpHqafcTLENUHYHuZChwbsr4O/fHcvt4GuJJ/Ks2eS+XewRx1EHS+21Xlwt01moWFiPS3fDIppreZ6pBizMR6729PMxjYLHelOsEEp062QlTJLcUTQJwLTxyPdKXYpBe1tQRZMOmcw7EOO5Z53UN6LDKIOvWwcl9W1hc3Z4lhfmAhgw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB7520.namprd20.prod.outlook.com (2603:10b6:610:1e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:56:40 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 08:56:40 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] pinctrl: sophgo: cv18xx: fix missed __iomem type identifier
Date: Fri, 30 Aug 2024 16:55:33 +0800
Message-ID:
 <IA1PR20MB495329EBE498DFFDAA1EC457BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [aZ6xDpCokZGJRC+FWWt8sylywJqYEJ1UJFEJi7YupRc=]
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240830085534.882046-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b0c064-fa0f-4fc5-62bb-08dcc8d1a9de
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|461199028|5072599009|15080799006|1602099012|4302099013|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	4VvA0YxO71+PPl17QKP1xUnLY8Cd7QJ3+4TDdVd46NdXrr39wqbcdgyBlDIMzVmrG2DgmaDQ78Sp0XeOBp0+b5NcdRU6BoJk3AbXs8NU9SzBdcu+JCBX2XS+N4HfeZZU1zG+CsugPy5oiGot4RBL/jjH0fAY/38/7aMojEi1/Lhu29WTi9qQHyVPSz/ElaMHB1WY9UNhHj5YPxw0LZHpEtYMU6RpvZjRv4OuwqJgrUJZlgTDMVgW6KNAaNK3zmMll4Y+0deNLmQC/K67mpwCZ8n5f1q66wDz+x5vvA575agvyuVupA4Tdz8dN/fYyL7mFVsXrhqDOL7foQxSRzYqIhCoYqYHT5ZZYysDs/+PD6ClTMrduPn/EOaNQqGb/tdc5lIMUiW1TzSZ5fxCpcESPU4qOZRkuztCcF7J+sw4r/YBmdlqtWEMaX6O1Q8YKKI38mUYu0aXBzmdb/u/eZvSL9ZIYX+BG7nW4BYCntztuwBcrxotZ8SUyHvdU+tOhk3Yth/OAqZiCVLZsoF+MR38BprjOJ3ClujXM0xuIBm9hub/kYDN5Z+eznCDvmUZKUozcgCaf3kHGgN5QzmGJxC+5m2Spr+MDMfxCJscZADHRSG/rOwBssB2T+vkOO1ClSbvg3nT2cDSbEis+Ga6pKK1XuU4j1alT8zrHJFucxrMHjXNejA055uI7SMv5NXsmhlqgzXrGqyt56KrDdlYfHPmVtBUqBzjPZ+A5NF/SiPBiDaE6Xwh7NNYCYirBU3fRXWtSx3rnLnzLNN3cvHi6XLgQq6Bog+Iv70cDn+0VevA7f7EuL7AV1ns+VF2XjuHPheYm2SDboP3D2Htn3LJ9qyNaY5fcFu6J8t8qpi8MniNR1C42w2VNLPdn7tGppe4fg9d1CUBicorHOp/+KRZkBifeQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nNHXkiN0Qc9k+a0m1GWwxFEeRGZU6XkzCg7RoFSOIs00kabBuO1wSePGU7kC?=
 =?us-ascii?Q?0Wys6ALK8p7V0cP+9TgPj2QOOXmmlIBEw/fv7RRYRBuUT1HGQvKQRpgFbyiq?=
 =?us-ascii?Q?QG7fRLTwU5X4MsBqC2Obt0+FuMhI8nA3Vujw6qN6ym+82P2h7BbgI1D6DcLI?=
 =?us-ascii?Q?3BZjjify6ipoAIghtqy8qpAs73dV0/JZYjjXRk5xXsFhLrmy2mxM4dDqekUV?=
 =?us-ascii?Q?Sn76iOr0H50fShV9zHw8r6bU/4ossmzlyZZLviNWD1JblpYac/8gBS5oww98?=
 =?us-ascii?Q?okgDL/iuTbhNeNGSJIk5xdhjcmCFqD6Wch9PcHJW9Sm+Wvk/SU1WweTfCenx?=
 =?us-ascii?Q?Uv0doikRZMAtPQB0qBlvzKChthvvvA4RR8vihxenS7zFYV807jffgaCi9uES?=
 =?us-ascii?Q?Fm2uoPOL4S9Xkl3sMBydOfJ5yW7QnHVNcPZonAgEOaXXZPmt0o62snwe/Ozi?=
 =?us-ascii?Q?XHdggR+03IL6OL6Gqoe6jGL+OYphSSQIJNBLGHn81JPUxd/hUVOT7/uZMxMu?=
 =?us-ascii?Q?zj3jzBeVtR3m5D4wdJRTWQYUhlFOO82ESZPB4Ewcpm872J2Be25kA0bjkPXq?=
 =?us-ascii?Q?CpW9LLsqe++aOTkPQPzPld4Au7cswXsnXD5UbdW0/ZvT06NeqqSUjpJlAVUc?=
 =?us-ascii?Q?uvIiZ71og3cT3ctwtytCuBiHJ3fMrL1hJ6ATFKBPR9AwONSpl32H3riqDb+Q?=
 =?us-ascii?Q?miGmHd0N8ZyjCLTBWKO/H5sDKqY/808KF0ITRDj+roxF1zKuhB9XlmgN0mRN?=
 =?us-ascii?Q?xHWOGWVj2Xip4/xA0WgduUEfu5IvEGm+2l1nxT5mbYUW4f/jlwPgb6UmkKJY?=
 =?us-ascii?Q?Yfq60UHxXL7LFvlud8TXO1BU08CFQ67brvc3ZaskY+jK6c3U1RwlI/rfWy5M?=
 =?us-ascii?Q?h3h6rqsCoWKz1H+9V78UyldkrKaPmEpxXvhR1nFNjsziLMYxxQwdzSQUn35f?=
 =?us-ascii?Q?5ot52qL/H7aifOdTjS2m2nLMPDFAADvT4DQyPTX4YiG929aWR1q81mujfNnV?=
 =?us-ascii?Q?dg7bY693BEq/Hm/PiTlPUju61sEe0MPfTzU+Vykreje4ttR8LBDk3tHt0/zz?=
 =?us-ascii?Q?akrlhGZpA1uFHhz0HelgdQkQpVl5l4tMCBuARnW/xBF9o5SVhZmi9V2xoXp+?=
 =?us-ascii?Q?3gaqSR36AO2y98aunaC0i2zYs/OUZElYFHwGsCi3W3nxUdd8DqGE1X4iRnoa?=
 =?us-ascii?Q?MVYlCej6qGQj+fT6dvQFyFJYEFUwV66otrAIvFlnaBKrpiagTrOWM21a9W1/?=
 =?us-ascii?Q?N3F6l4Ns2tIGkPHHf4B6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b0c064-fa0f-4fc5-62bb-08dcc8d1a9de
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:56:40.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB7520

As the variable reg in "cv1800_pctrl_dbg_show" misses a "__iomem"
type identifier, a warning will be issued by the compiler. Add
this identifier to avoid this warning.

Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408271555.kpOmi9I8-lkp@intel.com/
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index e63cfcc37377..d18fc5aa84f7 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -125,7 +125,7 @@ static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
 	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 value;
-	void *reg;
+	void __iomem *reg;
 
 	if (pin->pin >> PIN_BGA_ID_OFFSET)
 		seq_printf(seq, "pos: %c%u ",
-- 
2.46.0


