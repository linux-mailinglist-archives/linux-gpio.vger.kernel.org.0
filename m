Return-Path: <linux-gpio+bounces-10462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271B9875B0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07336286BE4
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA25153598;
	Thu, 26 Sep 2024 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EZxKl7u8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A51531C2;
	Thu, 26 Sep 2024 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361128; cv=fail; b=CqjJnSx0Yh5kI1jMb56QaaF0YgOUJYypQhCU6HLhDvVmIywBF6HyH9+hEKQDbj7VDeKRGM+8bscv4dfnCUm2e7s9k1fRxTA4Wzm574XIjySwEI43lkJu6YDn0XMMu5TzKXXMPcyjEIhdgUAII02ZGNL852hd6LzBmmbvVFUK+lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361128; c=relaxed/simple;
	bh=OmswE4UUYRkh4J1Bz9FLrgjPRIU019yweMhcEHdadv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+E9Bd0+c+OPRMjFRhnYEDFTeIAzc89s6rbCHWJclRdLHhaHH7vL51dTLFzlqj9kusPGKQhNMQ+TB377nzc/h84xRjDHaDaGEwqE15iIgkgNUVANcv1pUH1+duXqqJqaWSGP6XIRJarThOAhDGcIepKxKTXfh+F6Z/jDU1yW9mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EZxKl7u8; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVkT0kuoY0uPMF6OwW8muXm6CaUj2LYsw9ZSQBb66YdobF3yTrCbDEXytw74sk8TCcbS1iYzvSp2tlhzCFnHLK7E2crGjO5kwmZEfi3Yq5h2A3wI6KqJZboez7ht9eJNeK2Fvv3eL2gGgJG7kiDryMnyd74uc4TizzsigbPDbBBXeAZHQ1XVgT/eA3ubiQ6OGjXn2sGTrghGBLh6CUdb6NXcetnMZl61dz6TSALB+602xcksya1y8pnYIhDknFNR5tvIDT5r8vwCG2sYCfolWIgg8tOvr/HScxsSuvwDQK4iEVDPdaWHsiEAYaZdPR8VXSnOfW3AsNdXsVWBFvEs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLpP5QUy3RPA5HM3eGobmtdB4jHgEYO2Nzl73CnK638=;
 b=C4Agoet6rS0VGlzO4ACGEZWsbVydV8FlpAUyPIksssFLm32fo9wsyw1okX+Miy0Ba0K290HeK/KNSUiP7On3hI7tDcnUVIAFiCtvGxkDL76ByrC7WTFPOtiFDr1RHD6kuKemszaKlkTFHrYApv3ILE5m4Tp/yr68f3RWB4Br0rcHMiypmGQFfZw2wB6egVShPPLhZZtnz/+8DOIz+hlDTVO0gkU3JhpAQJEqvy5sycRHnzKwSri+1Pm75pjigEpE0RKLk9utgFiQwXSwK/9H/vCBGfJK0rsueY12K/md3efColuNbW9VbjWFhHgUD4oiRjOSeUNzPfWg15bQJW6Bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLpP5QUy3RPA5HM3eGobmtdB4jHgEYO2Nzl73CnK638=;
 b=EZxKl7u8rpef28o8mkTr9xxpw4emy275VGqfbRKgemU9lXJ3VdFO8oua6/4BCGEXNuO52IOS2mcZt0lqOsz88yqQNyeZIv2nYUb49R7F6q0WoeARi+3C296d3SN+nA+ZnvA37SH1f4Id51rw6ijKOVS9y+h83x+xSPYx8t4OBctyL5uIveJCmv8kJ475L5aCeSTAsaileHLSHa6zSIeLlsqsdRsFP0RHhy6l2Nm+4rHFaSSWnV3YcJHxjvvOmES2277ZT6UGZyr3FKBFU9LFaZYJK7tqMwv4OzzZ+wDMjigRWeeX1uVaCS57Roy0N4rnKo/dXW4gQOi0K3FOQYBv2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10485.eurprd04.prod.outlook.com (2603:10a6:150:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 14:31:56 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 14:31:56 +0000
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
Subject: [PATCH v4 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver
Date: Thu, 26 Sep 2024 17:31:21 +0300
Message-ID: <20240926143122.1385658-5-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 83009dc9-5420-40fd-4e79-08dcde37f8d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFdncWNGVnhnSStXNlZ6ZDVhWlFPTGc0a2ZjTDdLb1lTOXlXZnFIakNqRGVw?=
 =?utf-8?B?UFl2YUhSbDJnRjVkb0JIYmdRakdHYUJrT2d2dW5MYndkR2JSaEs0dEhOZEZX?=
 =?utf-8?B?dHIvSTFKbEdxaitUTCt4YUMyRUorY0JKOXFIYTVJanJ3WVhMZTlxNG1FNi9a?=
 =?utf-8?B?R29QcHVQVWxmUXVNVGxsWTd4bFdQWkNCaEw0MldyWVZrankrcmtEdmpFeTV3?=
 =?utf-8?B?eVpLUjhpUWpOSU5pV1pYR3NvakwyZXRXbXk2SlZLc3Jld1pkNStzVEE4MWlL?=
 =?utf-8?B?Yk5BbytVVFVqdklzR0pkN2Z4OFk3dDJMbGJHcjAwYU9oRFVzUnFrUG12UkE3?=
 =?utf-8?B?ejFLOHdpdWg3d2VsMFFkaVpybkMwQ3E2TXZNc3U3UXdjQTZ6MURLeENwTDZm?=
 =?utf-8?B?T1RSbmgzUTBtT0IwK0FSbUpxRjcxdmdVdXZ6L05LMVVSelRoTzhadnVHeEY2?=
 =?utf-8?B?VWNhZHJUUjhxUWNnb1pDbWJvM0JoOCtidG9CT0Fta2NMc3dBRzNWWmN1WWpV?=
 =?utf-8?B?N3dSSnRueFJKOUl3cUNhOWM4alVmVmIxdFVlWmdQTWlMcTkxaGpKbUNsNUVY?=
 =?utf-8?B?WlRObHFHU1ptUEFtZWFvWjZoNTFWWWZ5YkQrYUg0QUxjS2wrbHlZRXEyREYr?=
 =?utf-8?B?TEkwQmk4NXphVEtvOWY2VVRPL1dzQnlpQkM3ZFBKUTF6RHBwRkRLeHRhM3JU?=
 =?utf-8?B?WmxLUXVPM0haSUltb21Vais3SjYxYUlNSnlJVUVqNFJsNEZYczhLZXNLSkd2?=
 =?utf-8?B?Qkt1OEZ3aE5iSkRJZWFOcWkwakEwVzAwRnB4N2lta3NsUGtQQUsxS3hhYXk5?=
 =?utf-8?B?eW54c1ZBeDE1UFdvZjNCelhSQUR6cTJ1WitHY3hWNGs4N0xrZnFDUWRWYW1H?=
 =?utf-8?B?c002YStvb1NFeE1uOWQ4UWpGZEtOQ0c0bXNRQmxrVGwzc3JERmo1NExXbk9w?=
 =?utf-8?B?VEV6TkRUSWJZRWE5RVFhMHlIZFNwZERVTVFlZmlFM1RaTW02bXhPbnpiKzZ6?=
 =?utf-8?B?QlE0Mml5cnYwTDZIMUlEYWRnVS9GbnVwVVA4Z0RiSS9McHMwMHFsZ1N5L1Ji?=
 =?utf-8?B?aXBTdVh5Q3ZXWjNrSy9zUlVGL0t3NXZuQ2M0WnEvcWt4bmNRU2ZlaS9TU2No?=
 =?utf-8?B?MHBlcStDeDd2RUZTKzlDRUo2TXFyd1hFa0tNdnJqc2h0b21hWnIranFJdm91?=
 =?utf-8?B?QzNhdHlWamtZS002RC9FaHJNTEhqdXZMb0JWYlpYSTNlNG50OVBUYWkrcXIz?=
 =?utf-8?B?Nms3VW9yY2VPcGRBRWtPUTg4aWNiNm9nVlQ1WTVleDQzZnhaaktvc1FwVWsv?=
 =?utf-8?B?ME5QekpBRjhPR3RKb2k0aFpMVmxCM0dkWGxCaXRXY0hVcmlUcHBKYmxJdk54?=
 =?utf-8?B?bXVhZ1ZrcEdrbUNzbjRJbjdUaWthL3RFZzVlRFZVYmpDU0o2cDVMMnpDaktQ?=
 =?utf-8?B?RHZQRDAzQlAzZ211YkZhMDBocDJvVVBJQytFd2FsdlVwNk5tMHQxYTFDbzZq?=
 =?utf-8?B?NENXYlIyV0g4SEpFekRqbTIya3ZqSmxndFM0NkNPcG1qVHNLcnZIbnRiYzl3?=
 =?utf-8?B?ZG0yc2lWVVBOU2UzYnZsTWJDQlNtaGxGdkQ2TnAyZFpIZnIwNExXRlN2RXVx?=
 =?utf-8?B?M0lzSEZUNU1wdnJSeS9XZTZQZzVORXRUOHQrTVdhSGdVa01XM0RJaHU5YWow?=
 =?utf-8?B?VG1iUFJ4UW0vYVhZRURDbXdVbUc0OWNLQ0ZkemdJekg0RkpWY0hGNEdlRGJl?=
 =?utf-8?B?Vzh5Y1p2c3RqbUw1RkJWOHFaMWF1LytqVVZtY3hLM040cWo5Ym1aREZXSDFI?=
 =?utf-8?B?TE5EdnZaOUJ1RDdVSzdNankyamI1RGpzSlFqOUFOUEFTbHJmMms3QnUxMVNJ?=
 =?utf-8?B?TDg5NUpHMi9XUGFCTWJZcVV6S0dDYnJzMlF2UmZtZ0E0d3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3NOcmcwMm14c3RwRmgvWUVCbHdPd3VRUlRyZGxzOE5jajhLUzk0RWpFTEY3?=
 =?utf-8?B?T3d4dVcwQVhOQzIrUDVhY3hibHhoYzFoOEpzZi93b0R1MnN0ZWh3a2VYOHBC?=
 =?utf-8?B?V3JHVTB0RTZuRVhWeUcrMFh0MUNqMkIvOE81ZDc2OUpmTzFMWitUVWtsWWl2?=
 =?utf-8?B?akwwTStkSHBqaGpuS2J0ZWRyaWtuUVNucGIrblF3SHJyU3ZCbWtLbE42eGYx?=
 =?utf-8?B?WGJ6MXFOZ3BNNy8zL3dIeGUrSmJkZWhZeTN3Q0FmTDk4Mks4RUxaYXh4TGx5?=
 =?utf-8?B?V05oMFJ6TFgzVWwwdE83UDZXWG5MM2FJR2xiam5KYmhWMFU3S1dMOXB2RjF4?=
 =?utf-8?B?eWcwbVdETTFzZ0l1RWtXaCtqWWR0RzQranRVZklnWFl2Mm92RVZnZWdvbnJN?=
 =?utf-8?B?L0J0eG51b3lWem9hTEVxQWtJWS8reVJ2NlRGSE5lODJHcFNzd0lRbU1GMkVU?=
 =?utf-8?B?SUlQZkYrNWpFbEFOdDhwWUxFYkNyUllqajhOeis1cDNHUERJU05SekhsV0FX?=
 =?utf-8?B?RUlCeGZJM1QwbGFrS1l1UE5TRkRDZThSUTA4VURBc1RCM2NmWlZPakVLZkNO?=
 =?utf-8?B?WlQ0L0NaWnI1S0dpRkRaallRTjVGbWQzSlFpb2krR1gwL2h0R3hJYzEvM2dr?=
 =?utf-8?B?RkVqdzkzd3BRUFRvM2lpcHVnUTNHL0pjeU1pS2tTSmtiU3NGZ09nb2dVOGVu?=
 =?utf-8?B?ODlXSmk3MXFvWmdKbWVSaHV2c1FUUGh1U21iU3pIYlkxK1lFczZwcXRFWXVV?=
 =?utf-8?B?aXJkd09lOHlWVzRUbHRmR2xwbDdneXl3d0l1UEo5NHBaSUVrM3FJaUV6a3Bt?=
 =?utf-8?B?bDVMcm9kTllCM2hIT1IzRkJtc3hnenpzdi9wb0dyYzdwUlR4QUZsSTVVTEhh?=
 =?utf-8?B?T3ZjOENXZVVwOWJSRVVEa3h4MUNIS1BLL0cweHVhZkdyUnYzeFFObHNpdjZC?=
 =?utf-8?B?VUVrcjFqeVYxdld6MXVaNEVaU1N2OW5hcy9PZXJLTmphTGhUWEZ0Yms1RVVl?=
 =?utf-8?B?eVJSMGhIRkFPUmJObWZ4MzlGcGpMNnM0OXh0YlkvMHNlSHVjSlVZOFlnNXMw?=
 =?utf-8?B?VlVCWFlwS1RTMWljYmNrRjJQdk1UMlVLbFd1SlJCaDFpNnNCK096MWkwMVJl?=
 =?utf-8?B?QXNzQnVGazlLOWk5YmljVzhwbGo2a1RjTmxZcVlNeGJkQTZFUldqWmlNNEpx?=
 =?utf-8?B?WFNGQTRpQ1JxZ2hDU1AyMVR6MFdHRC83K0hPaEVIVktkcFNiTEl2QnRFQWNH?=
 =?utf-8?B?bUVMWWVnUythUldiakZNMXMxaU5oYVVDcCtxZUVTU3Q0dWJqV3AvVjVwazhC?=
 =?utf-8?B?K2JLVjZxeUYxRmEzVUFiNmZndFNhUHdvWXZkWThPS3dSd0NNOHJkTWJIdFVX?=
 =?utf-8?B?RkpMc3Z5a0p5OCt2K0pvRnhJTDROWitiYlN1N0ZaVVZyQkNiajlpVG9tNUtQ?=
 =?utf-8?B?bC9FU1Y0dHdrZDVvSTBSdHgrbnJHMWJZWnJ4Z2tIVHNuR0xxNEd5WUJqZUpO?=
 =?utf-8?B?R0xIS1pic2ZiL0lNaUVoUG9QUC9UZVl1V0dsZUxla0JnRWlscjhWeDg5aHRr?=
 =?utf-8?B?R1VVd2N0c0VZYTl3L1VieEtndkdnUHBSbDZHNHRFdGpTR051TjFMNzZvZEUy?=
 =?utf-8?B?U293aVZPbyt3Sy81VXFMSVpJWFE5dVA5Z2VsZXZqZUFyV3ZlUklzeDdpb1A5?=
 =?utf-8?B?Y1RNbWpYMWR1UGxvMk9RUUx2ZmdtU25aQUg2SllMVk9Dc0NleG8vUW9zM1hX?=
 =?utf-8?B?U29QSEZZbjJLYmhiWlQ3OFhEKy84dmsvZGttMTZHc1dPWHVNMDVuQW9WMnVD?=
 =?utf-8?B?cTVObkFtS3BRZTNPTzRwa1YwZkNTVTgwNnFBblZTLzVaSE9POUlGZDhVMkpt?=
 =?utf-8?B?YmZRTHdjbFBnNTViYkJFcE5xNkZVR050bytyUG9oMURsdTVQN1VUWC9nTjdu?=
 =?utf-8?B?OUlzN1VXNFMxVGs0MlBhTHRQUmJvTDBUUWFrRC9pTXM1NmtaQXhIUi9QZC9y?=
 =?utf-8?B?dExVaiszZ3RqN3dCK3NrOTdPREQvNFdONTlteDdvaUVTUjNjekJGdlJ5Qm8r?=
 =?utf-8?B?V0xtTEhGWHVVc3ZCQVRTM1FqS3hkZVFLbDlFTTg0N0VEU01QakMzbDUvVC9i?=
 =?utf-8?B?cU5CbXl4SFppSFJVTmdaZWlodFdKT0QxZGJML1lrYTI4YmF6RDBVUk1NVThL?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83009dc9-5420-40fd-4e79-08dcde37f8d9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:31:56.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYsCix92zFBf52PVSeOhVQYlv+RcfC1TB74ziktNfXutXqTWBJWlJDZZCa6+f2Pq0OYQsmuxxD3O0WFheihHKFp8CllzoYb/5EEutiKbZfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10485

Add myself as a maintainer for the S32G2 SIUL2 GPIO driver and
the NXP S32 mailing list for reviews.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfef98226d9..1201f284b0b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,7 +2763,9 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/gpio/gpio-siul2-s32g2.c
 F:	drivers/pinctrl/nxp/
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
-- 
2.45.2


