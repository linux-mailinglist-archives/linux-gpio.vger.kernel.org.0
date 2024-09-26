Return-Path: <linux-gpio+bounces-10458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9A9875A3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 612551F2165D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0947F7A13A;
	Thu, 26 Sep 2024 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AMRZcwSn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2082.outbound.protection.outlook.com [40.107.249.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904E4503C;
	Thu, 26 Sep 2024 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361115; cv=fail; b=KqhReOsPLPJvZJhIqjP1qknFvQfDrrr33Id76rFBCLiuIepxEsOpDoTB2uKXvUjCasPW/t3yPCySmQ02iHNP0qb4xRz9WhHawaqGgEMY3BmFaE+Mcd6cHYdJnLlUF5k2pwu4gb7bLq17EQ/KJ+8K+MJSvwIxHwk+axCVXNncMtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361115; c=relaxed/simple;
	bh=eWtX4QPBtFuRFZWaYXXc5kIJ7eFvbES5BYYAxBKyIiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kKNQKn0J758M/+YK4Zo7S8YsOmkbwv614IoKgnKH8n7whDTOLfezme+VSTSJ4TtxT2AdGy3NPzySQqhFAImaAKvNlPz80FIM1wtKgYsr1p58y4XXH67oVhdwaUe+B6+wwXEf2zm3Xs+SVYbuAm7SZfjqPeUuLD/UTsiCnFpGTqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AMRZcwSn; arc=fail smtp.client-ip=40.107.249.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkfSUGWvsZdJoQWqwuCKRe+UtHJ3qrK1P4AnQlgx3HCznn8LLe67LXJdtvvPTC3diD453zvJb8P0dFPTdLUS78C4YenzecV96G4/Drdl7zCEa3y0UW6s/0XIQmtX8jtu66SPYvmiwNiQvUm8AwEOJ8/KXf9sbUrwWtNhOSq7lx/PPUWoqIqnYQt0JNDHPKenqieIJSKDX/amYO8hiDnHhFPe4nF//TdaY1GCzAK7jBF7Yb9sayYHUAQ3KebNRicYGut+ayvytPIHAY1mdPVN+Q94AcgRIH7xsuU11ihStFD6kiSjIsT5+BESNO4Ulp03VamgkI+7u3ZUyaH+xkGecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=robKmbbXFIvvCSCbR65jtF0JEEwOVJUYmzeRos8HxAY=;
 b=qiiMZrSiR39+7gM9o3FM2G9nLRv8ouowy21O6lsnLKyqXdK7NdbXTndSozf7tjMh5MF11Q45xFtAxrdTp70oCZ+gs3G26BEotGrFIHhrVS4G5XVG9JLivj8BF3Xy2M65j46BVJU9i3DfUf0w2cAncgvhdbXFps+C6uJUuw5WP/98aVirj2amNVbysgxe3mNbXtj02wXaEgA8+ql/QNUj4TJnWZhd3A8irSZGECNijxm7LLSQvU/MKpjJbLt1d9wIjywvBliZTfVng8oROMxePLjTtP4U6o4Bhe8PLuHgrKqnHeRQ1I7LHi4QyUvB4aQkTl6a+oNdcC+LHcZA4TL5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=robKmbbXFIvvCSCbR65jtF0JEEwOVJUYmzeRos8HxAY=;
 b=AMRZcwSnPKIuSpHRoITFKY9ZeHe01VAaHwcFO6XX9rnzDVaCeN+jBJXjvs7vZ87Mz9lKdQ3koTH7hDAwsVua5DNzewmFh/j77g3FMxs8QxIajx6i6i/l+JG9yK1gjYbLU27j3pmvEpb9OPYEiE3p8H4Q9+1wQW5yhHK/ceR1yFHmuYNhAoNWKFO3v9gzvQT+4mZKOiRFExrhGEZbtpLMjouij1ibYbyOELc5rKAphxOQsVQY1HOdzIbog89okvFkDjKe2vQV+UQiQQMgBLzAlFFLaUPUeyaKPqjmUn9G7OBtDUncnTE6GgSHbfE5r/EYYyPgyMRq6sqyELs+xmpAqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10485.eurprd04.prod.outlook.com (2603:10a6:150:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 14:31:45 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 14:31:45 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v4 0/4] gpio: siul2-s32g2: add initial GPIO driver
Date: Thu, 26 Sep 2024 17:31:17 +0300
Message-ID: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0101.eurprd02.prod.outlook.com
 (2603:10a6:208:154::42) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10485:EE_
X-MS-Office365-Filtering-Correlation-Id: d6cc7546-f322-4837-ab08-08dcde37f26c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3JjOGQxWDA4MjJTSTQvcXUxMS9KSE5xeldSb2VObFNVK1pGUmgrOTNuMTNQ?=
 =?utf-8?B?a1pUMTRkVVN5cXNTMXVoZ1I3MGluWHR6Nk5pcFBlQVlydlRFRTduR1h1ejFl?=
 =?utf-8?B?MGtwcUJOT2czNTdGR3prbG1XY1Fmak5Ud0N2M2VDSnVtVUduNFlGWVg2SjZo?=
 =?utf-8?B?YTVldTVkWFBVdmtyVXlWcGkrS3ZHdTVTY0htOFI2RVdIbXlocVF6WEVmWDlk?=
 =?utf-8?B?alRzUnU2ZDVYaVYyWEhUT1RDSHZZOUFBTGFJemFxNzVkTEwvSmtyVzVjSlFF?=
 =?utf-8?B?VWRjUGVhTnpNRjE3eXd5djNaaGlFYmIvSTlvdFZpY21yR1NzbUZOLzVOZnk4?=
 =?utf-8?B?bmM3WTdKeHROTkN6VDM3RkYrK2FOZVhJdkZCSXUzZTZ2K1Q0QlNLMzFRb2c4?=
 =?utf-8?B?YkJBKzRvNUdRM01iVG1ldU54azRrVVl0WHJwOHpieGxuNTJuVEpXcXJZSUdv?=
 =?utf-8?B?NGszOFhJcnF0LzVnZmpkRmQ0V0tGSTk2eWRLUHNkSkxvajd4cW5RMzhmSXJk?=
 =?utf-8?B?ZjJYYnR5aXJrYm1VOExiMmxiK1N3c1J6VEYzbG1BcDBzd1Y4dVBOL0p2ekVu?=
 =?utf-8?B?UitmajMzNnI2L3dnWHcra083dWo1a2dQUG5aQndlbi8yby95T2RacVozRC9k?=
 =?utf-8?B?dWJPNnZzRk9MMWNpUktWbHNTUzIxMlFpV3RxbkgxcFhXRzgzSlJQTkt5MDVK?=
 =?utf-8?B?cElKaURLdDF6cUErUWR1QU9MQmYxSmc5eGY4dlFQejBkUEVkYkxXeGR0bjFH?=
 =?utf-8?B?TUVjcE1NMUs5aGRHM0RvWS96bFVsdkl5c3cxM09GWkM4eGxialQzSlVvTzUy?=
 =?utf-8?B?WGJHeHdWMWRGVnFRcmxkTXFrMjBGV2lXM1VTMzdCWE5KVThBbjZVSmQ1T2dL?=
 =?utf-8?B?N3RsSXZ3RUlZaXJzSTRTdWkvNGtidFNpOHBDU0tvcGRUajlIWkZ0bFV5dnNi?=
 =?utf-8?B?L051eCswZHRvQ25Gek1ZS3YxVjlERm1pby9Zem5LdEwramtEb20rRVBTRmZJ?=
 =?utf-8?B?Z2pYUkc2TldwdUk1cUR1S0Zjd3Q3K09TVXpNcFArMkdQMUIyVC9jdnpiQm45?=
 =?utf-8?B?bU8vVUR2UjJRNitRa0grTHdPS21vNTYxVmdvQmZpNjZKSHp0VXhQUUY0S3o5?=
 =?utf-8?B?T2NFaTgzNWlOaXArYnZyazNKSmRKMWZlNHg0ejA3Y3FEUDlURnhYZktGSE9C?=
 =?utf-8?B?N2FDeDh1dW5RYVBkcDV1SDZDSzBpWXhmNHp0c3ZqTTQ0L1MxYy81dTlEbUlC?=
 =?utf-8?B?KzJLc3dRMUlhQWx1LzN3OUFJQ2ZuUmQ2MTcxaDQvUVljSVJBbkN3RFhOMGwr?=
 =?utf-8?B?SGQ0RFFlMytyRmtDQVdPeXJncDJlOWZGK2tRQ3FHUXQyb21mbVlIUDd5a1RT?=
 =?utf-8?B?SHdyekxwbmIzU21aY00wN29kaDlhazRxRllGL3UwZ0tMa3JmaS95ejJlbEt6?=
 =?utf-8?B?Q0FhSnBRM0p6V3BWM2ZleDBBUm55Q2VIZHAvTjU2MmxsSDRBcFZzYm4xR28r?=
 =?utf-8?B?YzU0Q01NRWc1RmpwTi9sOCtab0Vybm5LNU9aRGo1Q1F3TWRGY09PREN4U0Ra?=
 =?utf-8?B?c0dJMi9NT0lNa3BTWjdMbG5rOEc2eUZDbTNOK2lzd2F5aHZWOTNEeWNtVDFO?=
 =?utf-8?B?L2o5eWlnTDgyTC9UYmpSR215TlZjeGM0ZVRhYTRmS1NwRFJ4TENRdEJhTlN1?=
 =?utf-8?B?NENBZDcrcDdqN3praE16eTJkTlkzbXJUcGhjZEU5MFVEeXI2UDhPeGdFQ0x1?=
 =?utf-8?B?aVo3NnFhOUpwSTBQWVlEVXFEU21NajFZUHdLVVUvNm5ETDIxQm14OEdpcXpF?=
 =?utf-8?B?QlpzbUhsUUh0WE0rNnFPOXIyYkt1MDFWNElsVDFHUFNYZ2RFQXlUeWRuVFZU?=
 =?utf-8?B?ZHRJY1pIMTFOK05tN1NyZlJFbDExREdVbFl1RmdXTWNvOWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXBvUnAwSTd3YjFiRFZIcFdtek8yUFRPNXhPaXBrdjB1OVpGeFB2ZW8xZnV2?=
 =?utf-8?B?M1I5a1ZaZU1aeHhzWFAra1picnUzS3c4eU5hbG9YNURoR29SaG1wNGJCSDQw?=
 =?utf-8?B?VDVDWVBzK0tOb1kvR3lGa2lMZk5QRjVENFExSFROMElFREFyN09oRGNXRHE3?=
 =?utf-8?B?VnpHQ01YamMvdWdqaVE4OWNlcmFDZTBuWUxvM2Z3NXp6TkhuS2ZVR1Y2OUwx?=
 =?utf-8?B?UGdLVEExQ2dMWTM5blVQNHhuQWZtakh5cXFYOG1BeVZEdGg2amo4OFAvdnhJ?=
 =?utf-8?B?Z2l5b0lEWWMrTzBjdzhEZ0RMRE5FbmJhQ2hwcElCUE9GTmhlK1RJKzIvZEU0?=
 =?utf-8?B?T2VmK1FPSHhzaGNqOUp6aW1mTW43aytuZThZUDh0dTJYOTkrQkYvMmlZcjgr?=
 =?utf-8?B?SUtUbEtSREM2Ukp0WGx2QldBWVNpYVMwK3RuNUYvMmVPRnNDK0lMWFZwUzk3?=
 =?utf-8?B?RlI5blBSSUtBbmxuOU8rbzd3dzBDNDRuSDBBbUdwQUlHRDYwWUwwdUR0UEZN?=
 =?utf-8?B?TXA4ZmVNdzljVjZRZk1zWGhzTTBLcVBSVHlJbVU2amI0NG5wRCszT29GZjhj?=
 =?utf-8?B?V0NCUlNRbFFaTXB2RTZPbGdnanpxTTBMNWhud1EySFJKV1F6UDEvVm9GUmZW?=
 =?utf-8?B?OTJCd2pENit4MTZDTExWU1VCcE1NZTh3cVVMV0JuSGNNcUVoT3FGUE9lNjd4?=
 =?utf-8?B?Y0ZwRk5TQUlYbE5sUk94MlgwdUZnM09VcSt0aytVOWR3Q3ZEY2w1S0JheERH?=
 =?utf-8?B?cVZzSXZ0dW1zSERVYmEydks4ZVdFcjZXb3NqNFN2bmltWmhMZSt1NG9WQ3dV?=
 =?utf-8?B?NTRTVjg1c2FwK1p0KzhSN2I3WVAxTVFRMGFrQkFMazlhYnd5bzZ4RlQ0TU1E?=
 =?utf-8?B?UVczNHJUZDVqSHFDTnlwN1ZzdVM3dkFudVg2ODdWcWVGRjBZVjIzYjk0aXFI?=
 =?utf-8?B?dnhxL05WOC9LMWQ1dDlVU1FqaTBtSnVQRUNNVHdmcnhJS2FkMWUrK3pMS1ZP?=
 =?utf-8?B?SThkcldBcGR1K0lUUDI3cDRIVzd5TVNTc05mWTE0WklzV3ZxSThDdUxmN2ZQ?=
 =?utf-8?B?OTI3Nm4wYmV1Wlh4d3o1bWh6UGFDQ095MSsvdUlxOUs0U0ZPa1NXa1lOSzZt?=
 =?utf-8?B?K0VRNHdUWkdmbko2N2VDRHRvbFBrdm5zOGp1N3l0ckFYVUo2dysxNFFKa2d6?=
 =?utf-8?B?c3l1cGZKTnRZeDVDMUZteWFLWU54SVptVEZ1OGlGTmNHNE1RcWhvQzRuVUlC?=
 =?utf-8?B?cVhpbW1aaGFSV3lhSFk4Rk1qVTdaT3hUVjZhbW9Zanc1TmY2dmlSNmFkVmxK?=
 =?utf-8?B?bnVlMzhxcjhjTmVpL3Y1aXgxb2Y2NG5ZdjhDTnByeFZDaFhCT3ZpSFZFNDZI?=
 =?utf-8?B?WFlXVnJsVDJwcWUvY2FVRUhNTWYxYWc5R2ZSNHg3RWJoTFhMMmZYYythK1Vt?=
 =?utf-8?B?SFMvQ3RxM1BuQmZvTVhQQnhZOHVoNis1dnQ5elJ4b1BMYWkyUndVQlZBSml2?=
 =?utf-8?B?VW5wREg2MjJHL1UwbHFzUGJrMVFzdHZuWUZlRXBBQjFsVkxsUGpXcU9Eb0NQ?=
 =?utf-8?B?YzVhTzZoNGY2S3JvSTUreXBiYS9qcm1qSkhsa3gxVUZOdCtiQXArVmJpS2hQ?=
 =?utf-8?B?d0R3R1lXOW9PbVBZNUI0RGZuS1R4Nno1a2RTenJlME9hMTgrUHBzWXowRDRP?=
 =?utf-8?B?ditINEZLU1BSYy9Bc21DcFFXV1NDamNNejBvR1dSVlhwUUNqR1hEZEtNdW8w?=
 =?utf-8?B?Tzd1Tzd3VWtNM0pFeCtjaitDSllxRjNBVlVJbDBDclFEdlNlVzVQY3I4Yjlp?=
 =?utf-8?B?LzBzZWU0VXFaTHdhakplczBmYjdaZFlHNWlxNkZjZDVLUkJaT3ZYMHd6WVBY?=
 =?utf-8?B?MkF1V0hhaC84NCtuUW5UUEdFUXUyMG5tNEtSaUtyUlYyQXA0SFFTOGQwenhF?=
 =?utf-8?B?cVlKOHpxQXhWTXNtTHA0VnplalUrSCtLVXlrQzNoaU9ObHljMk1Gb1o5ZVkz?=
 =?utf-8?B?bTlZcnIvYWdhODF2L25rRWszazlZSk93S2RRVmtaa09XWVozMXAzSEtNVzdZ?=
 =?utf-8?B?ckxvMDRtSmM4V2J1bFoveXE0Q0gzUTJGdjlqcDVYdk1STlEyUWRvRFhRc3hJ?=
 =?utf-8?B?UjdPRUFnbGpvRDlLQS9zNm80ckJhVDNERWsvSHVaMW5iUS93ZUhsVHFFbi9z?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cc7546-f322-4837-ab08-08dcde37f26c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:31:45.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtuxnNCXOWjIu8BB2QOWoIO98JBOfAIl9x6AetgcuQK0PYPK35fN4Xf4iLoyLg/ynBDHqJaqn5SoS3+dJsVWO0z02xxL2XvwLyIuImklo3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10485

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

These will be excluded via the `gpio-reserved-ranges`
property.

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

I have other patches for this driver:
- interrupt support
- power management callbacks

which I plan to upstream after this series gets merged
in order to simplify the review process.

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (4):
  drivers: provide devm_platform_get_and_ioremap_resource_byname()
  dt-bindings: gpio: add support for NXP S32G2/S32G3 SoCs
  gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
  MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver

 .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 110 ++++
 MAINTAINERS                                   |   2 +
 drivers/base/platform.c                       |  27 +
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-siul2-s32g2.c               | 576 ++++++++++++++++++
 include/linux/platform_device.h               |  13 +
 7 files changed, 739 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

-- 
2.45.2


