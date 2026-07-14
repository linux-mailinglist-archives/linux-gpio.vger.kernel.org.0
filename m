Return-Path: <linux-gpio+bounces-40066-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nwyeLZdcVmop4AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40066-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:58:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D96756B82
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:58:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=KRyVV90T;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40066-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40066-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B30F43163DEC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99014963B4;
	Tue, 14 Jul 2026 15:55:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023109.outbound.protection.outlook.com [52.101.127.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5F477E58;
	Tue, 14 Jul 2026 15:55:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044507; cv=fail; b=E3L4lwUanlwZOkmicokf5kjBG88a4Eh2ZykbDbumcy/VF/Cb0bHBkmDpCZM0fhtBhLcnSA+ipvmxjpvKArjagRFkx70z/j07nWswj5E7izsEAEJu2aBhGfUwwZVEQlJYpGWfTexNZbynYq6/GHc8bfno5ZlQznND/WZKqRs0Nek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044507; c=relaxed/simple;
	bh=nNBPffxiF/04OjX0aLmub0AG7jhrP3SnCqB26NFnzxE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GEgMC13k/Pv/j5lTme6wHk54jPtRC+V0YGWZ6V1DEzTwffzRAz0ltsQsCzHMq8NTbCPD/7KNMBkZbQkDX4E09POLIbim/MihAqpqBJ0t3Op73D2rnxs3T30ooQDNUu3qMWeUMTO8MpAGf47TLR19eU3zm6sltfbCb3Z32TRB9C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=KRyVV90T; arc=fail smtp.client-ip=52.101.127.109
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSU/LSs1o/HyPt1kWoZZm2q5I2g076R81Fo3g52NaXWEDHria0f8kEzkTMSLLJaXYW/4LO7wPf6bcNAJmvTph+ZZpUR9r50ygwidRdSU8sSZ9zSAnnjh054VxdLbKqoJZPJTfoM9mXWHvVPCQzTtYHcqLYKesSN4gR+GjXTdqwQRUFwnxnBGhrYGvHGMBOBM2lyK/zb9uZH8LhJKvCkM2Dzn791mz1FLZr/bNGw61Br7f1OvopTVHwi9q65nop1CrcL2Nr4sO6C3N3raRn92RVG81mokpqf3jLz3ZEh2asxo0gtiPfHdYX/QeNSNpke4ptHI3SNlgB5Rv/40Z7T5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8KsiC1kd/QSpMxonxA6splEFFmcnXoGFq8xsgLEcz8=;
 b=U4T7Rky1plkYI5cpjkMWBLU9QzOcWpzM+VR12TC08dxplJzmmWmbOOijEXJEYyKqpj05IhEVMEcEgEOgv9lyqi6xxabkwz9D26p+kdoNrevA7HDug1KZy653SeFtT/i9iNITs5mJdsLBpeVTjrt5dkNJgzMaBWHCGvU5l6kxnw5QoeaJkoGbijwXxTL0sJxFjJvV9dT37PyUu9LxktABj8Hei3xa/ozAdPh6ItGiDa7r8BCBhp8itSxXoRpP5z2xHEy1b1nYiSQ0go6afiheayE5bv8LjFQIDCvUqdUz+FE7LSSyDmQrBbNLPvk28I7upaik1dgmZ3NTh9d9RG11BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8KsiC1kd/QSpMxonxA6splEFFmcnXoGFq8xsgLEcz8=;
 b=KRyVV90TLrQVBHWPKKUVZHpzHMI0UV5oWPu6MGy3nWv4VTtJeO/WvG0ub4W1DQYWk/Eac8CotXlv4XrVAShfY+vOEbcKUXptzqtbqHSuudweBqiyM3JR34cbT99VrBzSytdFKXt3L+cK2jwvcT297QgCRsjLo8cvu0XKx8mwT64VliCuVMfL79N84nhjA9+XhQlwhpVRLoKsYC2STSeGUlKztLRa7d1BD49BjVCKuI3XbZ32F4krYJEmBfHGEIScdp3pKc4G9EOI0JsQUo7uZ/voQ2zEcBNNU/q9qJjL+F0WhqlxrtwAt8p22yJvWG+fL2BNl7Ek8/e3mxYMrg+VMg==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by KL1PR02MB6189.apcprd02.prod.outlook.com (2603:1096:820:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 15:55:02 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:55:02 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:17 +0200
Subject: [PATCH v2 3/8] Add Advantech EIO Hardware Monitor driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-3-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
In-Reply-To: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14601;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=nNBPffxiF/04OjX0aLmub0AG7jhrP3SnCqB26NFnzxE=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu4+dWrAFRJKMOxOn4jXkBAuWeWD2wxVAYuI
 AtGuAXp3yiJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuAAKCRDO7dCnvL2w
 CRDPC/45CcstWceskOH6zNjDBmwV/rDoaD5xxd7K7EEjnKqZSrKQqzL7suizn70T4+EfaYBzVPc
 p5huNtD6PIc1M9N894ei4uod/3zq5rJS7obKOVz7+g03/HZmy20Ih+CGlTtRyQ1UXmuNiHC+oDT
 OBCJVCFsm0ddoBWcthXn947mrVcpKZrgHynHOwFG8e8qsLKOnFhTcBT90XkKBzAjuGOR8DK4cCu
 ohaICtBzsjyTP/wF+usmFhlFHNjftXAENDEGQbs7cDkEPv9WtUXZMJY2fbHnJwF6nkJJg+E/EUE
 SMGo7SguTAOE6avcuPW2yPgkpfTcJyvS6l6699KpP7TzLNqX6sevMnH7Gxg+5wk0F7T09SmVYQ0
 zkUNTxcLOPEz/gwWPHwobhmaiQpsPuY4WN8XTKxEGttAb2oMj+xVhBwFlMQzhOjpKwSy4ugd1jP
 362bBhyLtmiXjI3PvXMiMWnn/ZFMU86ucRKwPucTZwq1rDNJ1xG/4gtQ/x2olqZ/TUSy8=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|KL1PR02MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdaa625-b835-41db-9977-08dee1c04396
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|921020|38350700014|56012099006|11063799006|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kF9kVJjls3DAXDcSibYtjhWelj/gzJzKfvgQqwTAYVauTurscg+hglxhCCKPzyXQIl/2l3EY3nglyC0VbqpnY0uToQ/R9MzV9sEzzktKkCq7qQ+2uA2RhYPzxkVbF36TD8ny2b9F+zDGfFQ3I3qj8ymKaDqA/3T6exhvX2crZec3F0VAyDInqN1dYDpgMw2WMTgnaSFBekC/U4xa8VDLlUNtUONYS9u5kague5PwGxOS/5zBO5ZpPdnLPIay4KQMFUFjqskgih7mJso54L0VbLYzSLONMjsHXSc5xEGqODt+ENwkIR2x4NO6/dXfIWYebp211Zw+i9hVg1XBjML0sXRRzi6mBPhCvhVoTL9lKrxiy+XoEWoFMAmEqovodpXsWUyJa95sg8Nsq6U0MpQTfqWmKI5B4G0b/4OEAZX5w+iNiSW0AUdUOUlP+kVEDY1aWQ21pUbIpamPTEnIqvarH6ctLzNY4xrLezr54zj7HHzjyBnON0Zlh5UevQWrr8BDtBrWzkIAlOzEw6JBoEZFh2aAzMwsF8+8xSHF04aNBt5+V7e9gZZIcya9znG+ZFxDEM0ig/4YGCWpyvobJN9gPAObrBtsiL3h4388jiXnH8i9+Uqk1GGswNYLmPWe/w9P2bcOIp6Hkc0AGJWbqEoZLiBl3e5bZG/y4hmupnXup2QTGfGQB73gNa0KFZ7Xi6QoHst4x50+PxgWyIUS7lbRzUKvvyl6FzDbgAnCeBT+604=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(921020)(38350700014)(56012099006)(11063799006)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjZ2UUhMc0xGUFFiam5WMDI4d3BxdWczZHliRk1jT0xOWWViMmZ4NzY3VVFp?=
 =?utf-8?B?QllkMmt6VFBMb3pxbjBTR1Z5T1RzQ3NVWkl0c3p2ajYyMk5XcEZMdkRPQTJP?=
 =?utf-8?B?QUcwUGZma25SR3h3TFU1bUtJSTFadGNDa01CUlRjcDlkbG4xbFpLdzJDZjJZ?=
 =?utf-8?B?T05Bbm8wVkVPejhvVE96THVNaGlHNGNYaC82Y1NGV2JXUjB2bFNEQW5Odlls?=
 =?utf-8?B?TVoxNUpFNDBpVXUvSGhBT2RvSkV5dTcyVEdtdWxxRDVQd0daT09hWlV4elFR?=
 =?utf-8?B?M2Q3TldXR3lxSUlBeUJvUURweE1VRUFVWVd5SnluZVpSSS8yYXlaSHl6Z2xv?=
 =?utf-8?B?WTZHOEpsRUZDZ215T2c5c2o0MTZFL2hwUTlzVU9OWG5ZTzh1dDJmbGxhTGUx?=
 =?utf-8?B?Wm1aSkc2WHN3UVM2VGk3bjV1dEVjN1ExT1hRNWthRnNpRUJEc1NwYVBUOU5j?=
 =?utf-8?B?c29Td3REV0lIelZLbzdzUmxxakFmdXhmY09Ycmc3bWpLOU9GejRJemNWc1l4?=
 =?utf-8?B?TENVamZFanBmcys2Y0RRMnp4OCs1ei8vcEdIcjJMMS8rYmlTVExmVEpEeEdr?=
 =?utf-8?B?VzF2NTluY2p2VW1RbEh6RXlBK0ZidHAwZ1J2ZnVwNmp5NHRnZHhhSTlLTTRu?=
 =?utf-8?B?aVU3SGFxV0htQWZvTXhWZUJXUDJTbjBkaWhMYWJiNEE3Lys0MEZEODlEa0ZX?=
 =?utf-8?B?VTJ5d0ZXM1dsUHhZbFRrQS9vdmRrMlZXclJLc1Y2ckZ6THlXNEowdHpnYmJG?=
 =?utf-8?B?VnYzVWhUaHVOTDlGQW1DSFZFalh1RkVqWndzRlVUNnEwejVZNDNUWWhTMm9y?=
 =?utf-8?B?SkNpWStoc0pxbzgyb09QemNsemhxc1ZadTRocDVrczN0ZzlRMXJKZm9UL2RU?=
 =?utf-8?B?REF2V1pHSG1PMGpFNkdnbTVJVUZtbC9DWlpYQm95QWZ6SjZubDNVUGc3Mkg0?=
 =?utf-8?B?S3V2alpseXg4YVhFa1JpZmQ2UUJCSlZMNkk3OFROSXRKdUVzQkExZWVpZnJ6?=
 =?utf-8?B?ckV3ZXhmMXpFSzliSWdmOGh2S2phZ1lHYjg1OVI3TFhodm1PdlN5QzYxOHlu?=
 =?utf-8?B?dU1NMytxWGZjSEFuQThpaElTVVB3blR5RHlqT2RiOC9NRUx4VXA3cWJwUmhv?=
 =?utf-8?B?MDU3WUdSVTZSNnhjNDNGRVM1NGdxaDVYVEp6TTBvOG1HME1HQnBNczFjV29w?=
 =?utf-8?B?VzczeWJXNnFrVm1kSWJ6RWlaL2NwSnBWa3Z6ZFE5cjdweERGQWFVb1ZvS1JJ?=
 =?utf-8?B?RE9oOHowMCtVTlExZ0dJNmgvM0lCdVBUU2h3VmE5dE5vMkdnaG55c3pQcFEr?=
 =?utf-8?B?WFJBNDdGck9JSFhtTjRCZlFMUGdQRDVSMWFYZWxIVHNJaS84N0c2dCtCKzU5?=
 =?utf-8?B?eTUxL2dPUXpxTTdvdEwzWTNTRWUrdHd0YjlHZllrVy9mTnFlM1dBR1JJQlBt?=
 =?utf-8?B?U2N1S2tQdk13WE0xUE9sZmZ0ZythRWpncFNrZGtMVXpWdkhoUlpvR0cybjdw?=
 =?utf-8?B?amordmd1czlpSzlXWjJIZUF2UjRTcUlGQXVGQ0lNNTZrM3gzdzRkVVhtcTlG?=
 =?utf-8?B?ZTlVY3NBNmVyT24xOXdmbkNRampPTVRENjRPZTBYcUh6RXV5enpiMGpZRWp5?=
 =?utf-8?B?ekhORnFIT0dFMy90LzlodUI5MllhUmI1V0tKMEwxNUpFSzY4WVhOTG5lWDhJ?=
 =?utf-8?B?dmZ4MGQ4QU1lYUVJY0Fmck13R1VpdjdxSkpNeFpsSnJTSlViM2pUZ0lJcmJz?=
 =?utf-8?B?MWhrNWhGbnY3YWJSbE9BNzUxVVdWbFJKdG1TblNoUzRHbGhCVmVzaG5WZWhS?=
 =?utf-8?B?ajVWOXpvUnZFMDZRY3J6Q1ZhcHVtSmc4NmJnWnNZRkJDTVdFM0pHWVpiUUVj?=
 =?utf-8?B?ZEFIdnZ4djgxMGpUMmxybytLQ3ZyMWV3Z09xNmVyTE9odThIZVhEY1lhamtR?=
 =?utf-8?B?Q01vMG9UY0VHZWx1UTZoWlpHeEpaVHJ3ZWRwa1E0bFNvRnBDN1M4Q0N3ZWZS?=
 =?utf-8?B?bVJzT1RvRGw0eHkrdjZCQTBJQ3ZwUktkdFNYYzZ6clkzekhUbTNZRTZIRE9P?=
 =?utf-8?B?YW9SZ2YwdlNrcVc0WSszb29ZVFFjOWdFSXMydlNOdFJpelg2dzVtY04xM3Ja?=
 =?utf-8?B?ejR0SFBVaVJEcWgyaHlBaDhuMUdGRWNtdUhKZjM3SmVmN1p2YncxU2lLRGly?=
 =?utf-8?B?YzhsQW1vQ0dDdk15akVGTjYxMmIydDU2Q0wyUzVEaDhhWHE3bmJYSitWSTZW?=
 =?utf-8?B?enlYd2dBV0FZK2YvMmFqNTJkUUQwTkpyWUVpbVcwYVhHa29HRVVTZVYwdVd5?=
 =?utf-8?B?eUdDc1FrVm0wRThIRnV5enVPQmhFV1EzaFVYZCtUUVRmMy96dSt4M2ZYc2lk?=
 =?utf-8?Q?iTZHR6kXqnpnJe0o=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdaa625-b835-41db-9977-08dee1c04396
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:55:02.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgEpztV1YGqLwoTh5tBa2sJYrsdi2CrK7+hkCCG8KQKDwluVXtReUfftK0dGGN19S9DyhQ7tcgrA9WhcpaOKIHE+85tCdgzZOwTbDWpM1ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40066-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[advantech.com.tw:email,vger.kernel.org:from_smtp,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07D96756B82

This driver controls the Hardware Monitor block of the Advantech EIO chip.

There is a separate driver for the thermal device driver
since it's a use case we support currently, but if it's
really necessary we can move it to the same driver.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS               |   1 +
 drivers/hwmon/Kconfig     |  10 +
 drivers/hwmon/Makefile    |   1 +
 drivers/hwmon/eio-hwmon.c | 461 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 473 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7da47393815..6d727d5182e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -613,6 +613,7 @@ ADVANTECH EIO DRIVER
 M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
 S:	Maintained
 F:	drivers/gpio/gpio-eio.c
+F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/mfd/eio_core.c
 F:	include/linux/mfd/eio.h
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 08c29685126a..b8fd8ded846a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2094,6 +2094,16 @@ config SENSORS_EIC7700_PVT
 	  This driver can also be built as a module. If so, the module will be
 	  called eic7700-pvt.
 
+config SENSORS_EIO
+	tristate "Advantech EIO HWMON"
+	depends on MFD_EIO
+	help
+	  If you say yes here you get support for the Advantech EIO
+	  temperature, voltage and fan speed monitoring block.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called eio-hwmon
+
 config SENSORS_EMC1403
 	tristate "SMSC EMC1403/23 thermal sensor"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63809eeec2f4..8e81a2bdc99b 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
 obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
 obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
 obj-$(CONFIG_SENSORS_EIC7700_PVT) += eic7700-pvt.o
+obj-$(CONFIG_SENSORS_EIO)	+= eio-hwmon.o
 obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
 obj-$(CONFIG_SENSORS_EMC1812)	+= emc1812.o
 obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
diff --git a/drivers/hwmon/eio-hwmon.c b/drivers/hwmon/eio-hwmon.c
new file mode 100644
index 000000000000..dd877664e9e8
--- /dev/null
+++ b/drivers/hwmon/eio-hwmon.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Hardware Monitoring driver for Advantech EIO embedded controller.
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+
+#define MAX_CMD_SIZE 4
+#define MAX_NAME 32
+
+#define EIO_ITEM_INPUT		1
+#define EIO_ITEM_MAX		2
+#define EIO_ITEM_MIN		3
+#define EIO_ITEM_CRIT		4
+#define EIO_ITEM_EMERGENCY	5
+
+#define EIO_MAX_IN   8
+#define EIO_MAX_CURR 2
+#define EIO_MAX_TEMP 4
+#define EIO_MAX_FAN  4
+#define EIO_MAX_INTRUSION  1
+
+enum _sen_type {
+	NONE,
+	VOLTAGE,
+	CURRENT,
+	TEMP,
+	FAN,
+	CASEOPEN,
+};
+
+struct eio_chan {
+	bool available;
+	u8   label_idx;
+};
+
+struct eio_hwmon_dev {
+	struct device *mfd;
+	struct eio_chan in[EIO_MAX_IN];
+	struct eio_chan curr[EIO_MAX_CURR];
+	struct eio_chan temp[EIO_MAX_TEMP];
+	struct eio_chan fan[EIO_MAX_FAN];
+	struct eio_chan intrusion;
+};
+
+static struct {
+	u8 cmd;
+	u8 max;
+	signed int shift;
+	char name[MAX_NAME];
+	u8 ctrl[16];
+	u16 multi[16];
+	char item[16][MAX_NAME];
+	char labels[32][MAX_NAME];
+} sen_info[] = {
+	{ 0x00, 0, 0, "none" },
+	{ 0x12, 8, 0, "in",
+		{ 0xFF, 0x10, 0x11, 0x12 },
+		{ 1,    10,   10,   10 },
+		{ "label", "input", "max", "min" },
+		{ "5V", "5Vs5", "12V", "12Vs5",
+		  "3V3", "3V3", "5Vsb", "3Vsb",
+		  "Vcmos", "Vbat", "Vdc", "Vstb",
+		  "Vcore_a", "Vcore_b", "", "",
+		  "Voem0", "Voem1", "Voem2", "Voem3"
+		},
+	},
+	{ 0x1a, 2, 0, "curr",
+		{ 0xFF, 0x10, 0x11, 0x12 },
+		{ 1,    10,   10,   10 },
+		{ "label", "input", "max", "min" },
+		{ "dc", "oem0" },
+	},
+	{ 0x10, 4, -2731, "temp",
+		{ 0xFF, 0x10, 0x11, 0x12, 0x21, 0x41 },
+		{ 1,    100,  100,  100,  100,  100 },
+		{ "label", "input", "max", "min", "crit", "emergency" },
+		{ "cpu0", "cpu1", "cpu2", "cpu3",
+		  "sys0", "sys1", "sys2", "sys3",
+		  "aux0", "aux1", "aux2", "aux3",
+		  "dimm0", "dimm1", "dimm2", "dimm3",
+		  "pch", "gpu", "", "",
+		  "", "", "", "",
+		  "", "", "", "",
+		  "oem0", "oem1", "oem", "oem3" },
+	},
+	{ 0x24, 4, 0, "fan",
+		{ 0xFF, 0x1A },
+		{ 1, 1 },
+		{ "label", "input"},
+		{ "cpu0", "cpu1", "cpu2", "cpu3",
+		  "sys0", "sys1", "sys2", "sys3",
+		  "", "", "", "", "", "", "", "",
+		  "", "", "", "", "", "", "", "",
+		  "", "", "", "",
+		  "oem0", "oem1", "oem2", "oem3",
+		},
+	},
+	{ 0x28, 1, 0, "intrusion",
+		{ 0xFF, 0x02 },
+		{ 1, 1 },
+		{ "label", "input" },
+		{ "case_open" }
+	}
+};
+
+static struct {
+	enum _sen_type type;
+	u8   ctrl;
+	int  size;
+	bool write;
+} ctrl_para[] = {
+	{ NONE,     0x00, 0, false },
+
+	{ VOLTAGE,  0x00, 1, false }, { VOLTAGE,  0x01, 1, false },
+	{ VOLTAGE,  0x10, 2, false }, { VOLTAGE,  0x11, 2, false },
+	{ VOLTAGE,  0x12, 2, false },
+
+	{ CURRENT,  0x00, 1, false }, { CURRENT,  0x01, 1, false },
+	{ CURRENT,  0x10, 2, false }, { CURRENT,  0x11, 2, false },
+	{ CURRENT,  0x12, 2, false },
+
+	{ TEMP,	    0x00, 2, false }, { TEMP,	  0x01, 1, false },
+	{ TEMP,     0x04, 1, false }, { TEMP,	  0x10, 2, false },
+	{ TEMP,     0x11, 2, false }, { TEMP,	  0x12, 2, false },
+	{ TEMP,     0x21, 2, false }, { TEMP,	  0x41, 2, false },
+
+	{ FAN,      0x00, 1, false }, { FAN,	  0x01, 1, false },
+	{ FAN,      0x03, 1, true  }, { FAN,	  0x1A, 2, false },
+
+	{ CASEOPEN, 0x00, 1, false }, { CASEOPEN, 0x02, 1, true  },
+};
+
+static int para_idx(enum _sen_type type, u8 ctrl)
+{
+	int i;
+
+	for (i = 1 ; i < ARRAY_SIZE(ctrl_para) ; i++)
+		if (type == ctrl_para[i].type &&
+		    ctrl == ctrl_para[i].ctrl)
+			return i;
+
+	return 0;
+}
+
+static int pmc_read(struct device *mfd, enum _sen_type type, u8 dev_id, u8 ctrl, void *data)
+{
+	int idx = para_idx(type, ctrl);
+	int ret = 0;
+
+	if (idx == 0)
+		return -EINVAL;
+
+	if (WARN_ON(!data))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		 .cmd       = sen_info[type].cmd | EIO_FLAG_PMC_READ,
+		 .control   = ctrl,
+		 .device_id = dev_id,
+		 .size	    = ctrl_para[idx].size,
+		 .payload   = (u8 *)data,
+	};
+
+	ret = eio_core_pmc_operation(mfd, &op);
+	return ret;
+}
+
+
+static umode_t eio_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	const struct eio_hwmon_dev *eio = drvdata;
+
+	switch (type) {
+	case hwmon_in:
+		return (channel < EIO_MAX_IN && eio->in[channel].available) ? 0444 : 0;
+	case hwmon_curr:
+		return (channel < EIO_MAX_CURR && eio->curr[channel].available) ? 0444 : 0;
+	case hwmon_temp:
+		return (channel < EIO_MAX_TEMP && eio->temp[channel].available) ? 0444 : 0;
+	case hwmon_fan:
+		return (channel < EIO_MAX_FAN && eio->fan[channel].available) ? 0444 : 0;
+	case hwmon_intrusion:
+		return (channel < EIO_MAX_INTRUSION && eio->intrusion.available) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int eio_read(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long *val)
+{
+	struct eio_hwmon_dev *eio = dev_get_drvdata(dev);
+	u8 data[MAX_CMD_SIZE] = {};
+	enum _sen_type ec_type;
+	u8 item;
+	u32 raw;
+	int ret;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			item = EIO_ITEM_INPUT;
+			break;
+		case hwmon_in_max:
+			item = EIO_ITEM_MAX;
+			break;
+		case hwmon_in_min:
+			item = EIO_ITEM_MIN;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		ec_type = VOLTAGE;
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			item = EIO_ITEM_INPUT;
+			break;
+		case hwmon_curr_max:
+			item = EIO_ITEM_MAX;
+			break;
+		case hwmon_curr_min:
+			item = EIO_ITEM_MIN;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		ec_type = CURRENT;
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			item = EIO_ITEM_INPUT;
+			break;
+		case hwmon_temp_max:
+			item = EIO_ITEM_MAX;
+			break;
+		case hwmon_temp_min:
+			item = EIO_ITEM_MIN;
+			break;
+		case hwmon_temp_crit:
+			item = EIO_ITEM_CRIT;
+			break;
+		case hwmon_temp_emergency:
+			item = EIO_ITEM_EMERGENCY;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		ec_type = TEMP;
+		break;
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			return -EOPNOTSUPP;
+		item = EIO_ITEM_INPUT;
+		ec_type = FAN;
+		break;
+	case hwmon_intrusion:
+		if (attr != hwmon_intrusion_alarm)
+			return -EOPNOTSUPP;
+		item = EIO_ITEM_INPUT;
+		ec_type = CASEOPEN;
+		channel = 0;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = pmc_read(eio->mfd, ec_type, channel, sen_info[ec_type].ctrl[item], data);
+	if (ret)
+		return ret;
+
+	raw = (u32)data[0] | (u32)data[1] << 8 | (u32)data[2] << 16 | (u32)data[3] << 24;
+	*val = ((long)(signed int)raw + sen_info[ec_type].shift) *
+	       (long)sen_info[ec_type].multi[item];
+	return 0;
+}
+
+static int eio_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	struct eio_hwmon_dev *eio = dev_get_drvdata(dev);
+	enum _sen_type ec_type;
+	u8 label_idx;
+
+	switch (type) {
+	case hwmon_in:
+		if (attr != hwmon_in_label)
+			return -EOPNOTSUPP;
+		ec_type = VOLTAGE;
+		label_idx = eio->in[channel].label_idx;
+		break;
+	case hwmon_curr:
+		if (attr != hwmon_curr_label)
+			return -EOPNOTSUPP;
+		ec_type = CURRENT;
+		label_idx = eio->curr[channel].label_idx;
+		break;
+	case hwmon_temp:
+		if (attr != hwmon_temp_label)
+			return -EOPNOTSUPP;
+		ec_type = TEMP;
+		label_idx = eio->temp[channel].label_idx;
+		break;
+	case hwmon_fan:
+		if (attr != hwmon_fan_label)
+			return -EOPNOTSUPP;
+		ec_type = FAN;
+		label_idx = eio->fan[channel].label_idx;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (label_idx >= ARRAY_SIZE(sen_info[ec_type].labels))
+		return -EOPNOTSUPP;
+
+	*str = sen_info[ec_type].labels[label_idx];
+	return 0;
+}
+
+static const struct hwmon_ops eio_hwmon_ops = {
+	.is_visible  = eio_is_visible,
+	.read        = eio_read,
+	.read_string = eio_read_string,
+};
+
+static const struct hwmon_channel_info * const eio_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+			   HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_LABEL | HWMON_C_INPUT | HWMON_C_MAX | HWMON_C_MIN,
+			   HWMON_C_LABEL | HWMON_C_INPUT | HWMON_C_MAX | HWMON_C_MIN),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_CRIT | HWMON_T_EMERGENCY,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_CRIT | HWMON_T_EMERGENCY,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_CRIT | HWMON_T_EMERGENCY,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_CRIT | HWMON_T_EMERGENCY),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_LABEL | HWMON_F_INPUT,
+			   HWMON_F_LABEL | HWMON_F_INPUT,
+			   HWMON_F_LABEL | HWMON_F_INPUT,
+			   HWMON_F_LABEL | HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(intrusion, HWMON_INTRUSION_ALARM),
+	NULL,
+};
+
+static const struct hwmon_chip_info eio_chip_info = {
+	.ops  = &eio_hwmon_ops,
+	.info = eio_hwmon_info,
+};
+
+static int hwmon_init(struct device *mfd, struct eio_hwmon_dev *eio)
+{
+	enum _sen_type type;
+	u8 i, data[MAX_CMD_SIZE];
+	int n = 0;
+	int ret;
+
+	for (type = VOLTAGE ; type <= TEMP ; type++) {
+		struct eio_chan *chans = (type == VOLTAGE) ? eio->in :
+					(type == CURRENT) ? eio->curr : eio->temp;
+
+		for (i = 0 ; i < sen_info[type].max ; i++) {
+			memset(data, 0, sizeof(data));
+			if (pmc_read(mfd, type, i, 0x00, data) ||
+			    (data[0] & 0x01) == 0)
+				continue;
+
+			memset(data, 0, sizeof(data));
+			ret = pmc_read(mfd, type, i, 0x01, data);
+			if (ret != 0 && ret != -EINVAL)
+				continue;
+
+			chans[i].available = true;
+			chans[i].label_idx = data[0];
+			n++;
+		}
+	}
+
+	for (i = 0 ; i < sen_info[FAN].max ; i++) {
+		memset(data, 0, sizeof(data));
+		if (pmc_read(mfd, FAN, i, 0x00, data) ||
+		    (data[0] & 0x01) == 0)
+			continue;
+
+		memset(data, 0, sizeof(data));
+		ret = pmc_read(mfd, FAN, i, 0x01, data);
+		if (ret != 0 && ret != -EINVAL)
+			continue;
+
+		eio->fan[i].available = true;
+		eio->fan[i].label_idx = data[0];
+		n++;
+	}
+
+	memset(data, 0, sizeof(data));
+	if (!pmc_read(mfd, CASEOPEN, 0, 0x00, data) && (data[0] & 0x01)) {
+		eio->intrusion.available = true;
+		n++;
+	}
+
+	return n;
+}
+
+static int hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct eio_hwmon_dev *eio;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+	struct device *hwmon;
+
+	if (!eio_dev) {
+		dev_err(dev, "Error contact eio_core\n");
+		return -ENODEV;
+	}
+
+	eio = devm_kzalloc(dev, sizeof(*eio), GFP_KERNEL);
+	if (!eio)
+		return -ENOMEM;
+
+	eio->mfd = dev->parent;
+
+	if (hwmon_init(dev->parent, eio) <= 0)
+		return -ENODEV;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, KBUILD_MODNAME,
+						     eio, &eio_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static struct platform_driver eio_hwmon_driver = {
+	.probe  = hwmon_probe,
+	.driver = {
+		.name = "eio_hwmon",
+	},
+};
+
+module_platform_driver(eio_hwmon_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Hardware monitor driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


