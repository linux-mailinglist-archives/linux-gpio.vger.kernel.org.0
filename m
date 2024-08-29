Return-Path: <linux-gpio+bounces-9368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C92129645E3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 15:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498CF1F28220
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759381A3BCF;
	Thu, 29 Aug 2024 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="dv/1c0y9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2056.outbound.protection.outlook.com [40.107.117.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4261A01BF;
	Thu, 29 Aug 2024 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724937071; cv=fail; b=YADtoCMbXZ2HXJi61NJbYGPOEn67kiRaoSUp42sFUQEyCD6QvS2YaTYu9maBghFGnCZ27d4csatMHREC7x2h0bJVPtoMObU8b39SoWZ6JkHPwBPxXpJtcHu41fXlgqEjUPvfST3pgTU/75D4zgybZekCOyzY9f3qapMQgoUMsEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724937071; c=relaxed/simple;
	bh=9Nt1AaUHnYgU16svE90YJ0xze/cL5v8wJQwocEIstRU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gyYm5sJxK0btGMxOdJhm4JzTCHp8Sk5LE2vadvHA87oy+KKB9ItgSarGtojsvDXfwxgldrgFYZl4nVA7iefTvB++obyAryX2lXwwFkhUwJ/hHaYXgihrUZHFs29PIvRQCrNFffdw0Dv7rqAgloOyVzi0qWRM/NARsDdFIFF7azo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=dv/1c0y9; arc=fail smtp.client-ip=40.107.117.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L98h77Rg5NcStowMRN4oMJXawZIR0NYNzJvTJNAxr2gXM/VTnHINcq82fPVqsWURg6vE2DpvLzsIhw6rGNZ5YGn6XwKmqUL1JaYKCMFRUkhFKVjhY3QwsRIMPjzPLEZ7J37dkoMWrmnGb7IWLEPUTs6aXVfjkb7lSEPRSMCLzByfUKUQc0MFFsUhqUN9gcN1VNlDecD/aX8tDjhj0gSwpEymmM/R+z/WPEEmxvyZcM6w0ltR5JoSIEVcLfIFypq6RkkYnqji7YDnnhgR8KVn6Uh2wlwKJqCi9qf32XT6XGFjXxf3Eui2xYWo57XZy2Gvgqt7H2t60E8saFOrsioSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaVZEgOOEX767hG2OX04Pn8dTI+Lz+VJ7fTKUgU+FXA=;
 b=hqcHUjZGnVy48kZfUfOSKJTxjq1tWBFYei67vhJJr+sgkPfiFjNJaA2gZQjX0I6vxnHISianjugYsUckybIj8+2o2SDwRewU30alwMtkDZIGg5O1HaRqr/elx33deKy1RRCgkDHDtssDMtKDyCV5HbY3lUpPRsMYCtnUBVP07ewkU+UZ+P7xixpRVyzvVq5NNr7X/CizN2IrW43us8NFIDFoOHoWdsZvUSvlGsCpVYLxK5JKrTAyYnv3xglPzQrxjWmvXuC513O/1PWeVJErHYokSWG4BqBQpfmrjUQRoOxsWEhSbXi+jMPRc/5kjY2c+UeU8C/wjnQb8u49nQ3J/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaVZEgOOEX767hG2OX04Pn8dTI+Lz+VJ7fTKUgU+FXA=;
 b=dv/1c0y9FQCo8i1HEZIL1zUWP5BBt01rA5bouH/nPBgbeU0hZVok7biQTdzhh9zbgXf+8FVC9n3SgJNi97c+0GuJMU44I+bg8d9xR0l/Ixvfm0UWE95Q/0SjJ30u+p8l0GoJKRaOVuh0lkQAHZUikUvBlWelHzzWR3uONFpKJF67gH/j613ybhEiCRSTN0T852Qjsm1GVXQLh6yAN6EJqGjrNjpkc0foi3YWYIjAAyeNd5ESy2sGGuryq82YhUi4SPIvcJJmcxVN9JazTMmyFdAPHw6kbiLVON6x5bLmRHbEOjL8Nrkr0ua5WvsM4CEryfqFNcCqhlj+cE89A33Edw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR06MB7317.apcprd06.prod.outlook.com (2603:1096:820:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Thu, 29 Aug
 2024 13:11:03 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 13:11:02 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] gpio: stmpe: Simplify with dev_err_probe()
Date: Thu, 29 Aug 2024 21:10:51 +0800
Message-Id: <20240829131051.43200-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR06MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d61ec2-979e-427d-1db2-08dcc82c082e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CzIim0fxkHxVELeX4b8yv8AJ8SHWwCBwH3VkQ2Qm962bIXxRs4ZlEUrOWFjb?=
 =?us-ascii?Q?29yBv35W0jzxbv1KzlMMqwvqNEMdLCync1WdSEKj8sjk0VJQq4aCzG5sd9wd?=
 =?us-ascii?Q?qgs6PxL++Pi/Rnk7lmgLawpoqPPDV9cm2MST46N/W9Ejo4oPqjXj2nsaB7kF?=
 =?us-ascii?Q?ak3yffPP4NBFh+v1fa/cRkW368m83ih9QutQxJVSylniAZlnjgpfbLUWNjkN?=
 =?us-ascii?Q?u078nJc1CPh6QXLCX11s98wmHu9UvepsDrVl31C8di/aVFiimg7qzwoubC8i?=
 =?us-ascii?Q?hWLN2PRbJ/ytSo9F7y3grJQsnbE++JyMxAlB/DdHJBOmGPp/5b8ChzY4bEfa?=
 =?us-ascii?Q?7SwxB5IjYLHyUyptsykArGrTBDF3ZSwF/MFUBLeAkKhJPchFPGkRHmb86jGg?=
 =?us-ascii?Q?1BYdMOqEfoMyiRILL4aS5vqrw1EL+geOw89WDv7EIt+bKw67VThBv5QHFkMm?=
 =?us-ascii?Q?7qmafyjjRFb657obboz0Bg3vyB0z3OUFik8yS3/DT+5KWNrFM3gAVtXFP+Gi?=
 =?us-ascii?Q?qmngzruyEzoze0hZRD2lwre3zg5k9B5m3LqIbBqCbNEfDobNspsZQoFakWuP?=
 =?us-ascii?Q?jWcdn76hjrmefIMihUp/WHxwNuzyB09bGAwkLun7dheJ6xGZI5NiUc46i+IB?=
 =?us-ascii?Q?4kFTcNMk+YTy6/46JS1Abgo6TaA/mHA7GjKSPL9/bpEbycHKVacnHd9L6ujQ?=
 =?us-ascii?Q?dgiHKS8PT1FEYgo49AVhj2zOS8XxvhpGzx1wDlZfdXTEMLHuaAAjSGM1pUxG?=
 =?us-ascii?Q?ZD50NWSi+0ACCDcnCZiFQpbqm7+dJXLaOBKsWZcQG6vT0BM8axI6mye/Zvd1?=
 =?us-ascii?Q?HGVohjT6IPpsSpbTwK9PLuGpfaZp5RgB+6M49G0qjAyKxmQ5sNBDyH4gPxpA?=
 =?us-ascii?Q?iVg4ihJ9GGixCjuOnG48YsFi5huvXMudQb4NpmOzfTjrITnRQm4OjUPkJaNs?=
 =?us-ascii?Q?QiBE9kfE8qLv7nxUU7hv7ge6PzdRisIP1uJ1pOGQGsCXyadrr6NOskEXx2Yh?=
 =?us-ascii?Q?ZwSGJA1/IFd3SZ1QVlMf7H9FkdtuQ/v8kMVIqZWi9oM/YaR4b7iVBrW0cjt9?=
 =?us-ascii?Q?/w0JHddDV8gnJCIRF8L3pI98xhF98Dm8M6qVz4/NCofgEni1V/bxx7ZqUJdK?=
 =?us-ascii?Q?oVZx3Y6jExI8xjooqVuSQ3UeAtFc9M//8D1KdXhpHZlh4g2X3xsIYFKRgc0U?=
 =?us-ascii?Q?YL93R3/ty3hDbQBnrBP6PflRFnlMUMYQ50DwNHqfZwkhgQt5kFaYzzCJrmx7?=
 =?us-ascii?Q?3jXQRaHtrPJlU0Mab0Q2C0ptxq+YFGDx/M4bzWPs9/19KSG41QUyoOje/Ho7?=
 =?us-ascii?Q?RzJIoRzFiUKZxq2RVJT4o2PEpAMcgOnif/5dbgGmjRajYdF1zRA28h+54+Cx?=
 =?us-ascii?Q?qEQwOvYKuBFqn7nmtAktcswVqihAuRki2iVcQ9SQtQOmK3adug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jbxUN+nLzYg8sclwNcwsxEghsbDo5H/NpBweTZ4zTYNwfvI034KarVFrZxp6?=
 =?us-ascii?Q?F8e1ZVPZ7zU+4WSJz7nEGmQ1qH+Y8rPbuY8pWJ3FqfV08V4wjwIz871Jx7o+?=
 =?us-ascii?Q?1uQcXzTEhACKCBI1ynGBhedvrjvPY9VFtw56Fl6XO9ANFljFdbrW9foQeuo+?=
 =?us-ascii?Q?+0xLmnc0vWx5q90regFeuSXnOgpOd3kEn42ahRpiJF1cdXFZhP29ig+OJdgK?=
 =?us-ascii?Q?fJeokoP1r7nZqDlK+yJWNF+3Ez4XlJciwZMcaSR3kYEwNxJ+cQ7rF+hL9PbN?=
 =?us-ascii?Q?KjUMeP0UatZS+Lavd5F1yvEfAmCYrGdWYa6I+UVvvPoPzZH8Gi9a5oHqCNF9?=
 =?us-ascii?Q?miBf4AS7eo8ED0Y8LbtDzRjPI6ahlK1deYmfws7dXEyN78CNQI7M1s02scdr?=
 =?us-ascii?Q?hLwqlohGn2zEAnEukjRXRaWoms56T7PCvGDQwKdFwNotJCWuHn+pv7tsRUm/?=
 =?us-ascii?Q?aX+S4+xIYLozguibIokna4ksgsctRIGBfmkmWcA9U42l4P3IpiwFDUPp+SzG?=
 =?us-ascii?Q?4FC5l0oHp+KQXjSdtsGyigOBjw5FS3FWqz4mheIs/ZLE66iaGgKBGE/hEKWL?=
 =?us-ascii?Q?atkjaI1v0DxBx7La4koE7pg7wnPi5aTwUMB30qggmyftBKkH2SE/ply48Hai?=
 =?us-ascii?Q?Q9hxlfMLH5gr5O9HxneVEOn5eI48xQ2m+Eok+fuDNmx5OExsx458/K/u46Y3?=
 =?us-ascii?Q?KVL4efmC2592Vkfjq+w5WAiz6osyP9Y/U660hlIWNRVAJIGQmodStB7tfHmB?=
 =?us-ascii?Q?OEiSi9n0FPwsa8YmbkyFMOI/bAhU5MNw15Ra1MLAej+g18i1FQ0NrP4UYuwY?=
 =?us-ascii?Q?9QPkmHZ1RsfrorLKU5ir1ErEMoDc8w5a+8AipiQFefdP4uSETZgw4hBlgq+a?=
 =?us-ascii?Q?7YOf/o6rjZQZ0ADg3XFoMueEmrgkpaJKkL31hwF52WVXTbFxfsPor9khgb9J?=
 =?us-ascii?Q?nnXJZB/8ugjcTAVj27KDqpvUwycJXSeETv95v3GZTcOk4FjGQ8yLeqf8IRZa?=
 =?us-ascii?Q?6N+FxRbqBYTVLhtvyQHQC6Q29+BSCw58bfx29RYNl06/GcCRME7LGzOtftmM?=
 =?us-ascii?Q?Sm4t3UAX2lolSVTJdPTuBc/k4oFRbI4mfl9GtsgvOnYtxJaicuTbAoNrQdXi?=
 =?us-ascii?Q?ju4Zf6WlOGO/tAn0nOsBa5wf4XlTk05KbuFqMGpz6D4hFMtkkoPFwBGYRqJa?=
 =?us-ascii?Q?y8QYBeFXSRFnIGeCCKFeSTx+3eYz3CFVfDOzLn8nsNbDKYVXT8KWwgwIzA5R?=
 =?us-ascii?Q?VVC8HVjRyRQhS4cUmonlmaXO1aYwuTjHvK9VzqkLn2DWuIq9s8+hPnSYZkEt?=
 =?us-ascii?Q?N2yqW/eTlVQTuQpqFxHpcqFsO0NNqvSk5vVRKDbLgWhUh/6J4qNV+3ioWuNP?=
 =?us-ascii?Q?Az4qQapfR8g/AeKpGqZ4oEg+jjVAALYxli82z5OzGxDeS8f2olWOS4uuEKcR?=
 =?us-ascii?Q?XBt5nq3fqTMd0pRwWkkaFX9uMchxUZ7dnMQaQhnXky4B9b5jy8mMEkO9Ij6x?=
 =?us-ascii?Q?+KSaerv/J5b4+doAGpeMV9aO4CwscJoIQEY4BR4Ix+4fvUa7S8UcLhrkUI6j?=
 =?us-ascii?Q?q/KzRh1IzHtrhAIRQMHa+wwchUTqkgzFvwJvSWT3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d61ec2-979e-427d-1db2-08dcc82c082e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 13:11:02.3191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUwcKKo+yuFiQ9Pobq4llcXSePi8YzNGVIQuJLsrxAnh7IGD8QoocUUF+BP4qGuKiutZeLxzZU6Q0aXitlQHMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7317

Use dev_err_probe() to simplify the error path and unify a message 
template.

Using this helper is totally fine even if err is known to never 
be -EPROBE_DEFER.

The benefit compared to a normal dev_err() is the standardized format
of the error code, it being emitted symbolically and the fact that
the error code is returned which allows more compact error paths.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/gpio/gpio-stmpe.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6c5ee81d71b3..6cf545f5fc9d 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -513,10 +513,9 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 				stmpe_gpio_irq, IRQF_ONESHOT,
 				"stmpe-gpio", stmpe_gpio);
-		if (ret) {
-			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "unable to get irq");
 
 		girq = &stmpe_gpio->chip.irq;
 		gpio_irq_chip_set_chip(girq, &stmpe_gpio_irq_chip);
-- 
2.17.1


