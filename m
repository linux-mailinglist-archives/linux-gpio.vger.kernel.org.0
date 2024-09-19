Return-Path: <linux-gpio+bounces-10270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773D97CA6E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC6F72841AA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4545519EEC6;
	Thu, 19 Sep 2024 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sj39Hxk3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88719CD17;
	Thu, 19 Sep 2024 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753733; cv=fail; b=sdcVSDqP20NnLIFQ6SuYAZmr/VhK30CfFKDB1p+jDeSlu8I68SeUhx2LemU3bHgl3U4WYhbTt9Oc02nyqUJEIaEimqr6lxGsiE+fuZETbUZC8xbgU0FNUiSEpzB5WT0/IvM/SYAkGRLfhzMweg3ad4/LOk5mVx8usFJb+3H+US8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753733; c=relaxed/simple;
	bh=MheB6xk7tkSiRs+taarcUKpPBZRcTKPqawqCW24MjZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bl44rb2KbfiHr0gQxKvKCpRMJh3K2vZX66Wuij1yAqbjCQhEgmoktFZCOZptkwNO3AryX3H0E3XPdYtGYCunMvgcFOEuPxmQnsVMuhJPuGv4kTHHCWnQQwKAXgPNJEozsMLi/QOM+gAGj7Fe0dYLfovBbZGAeq9x6mV3d6mFygg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sj39Hxk3; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcdJ4wEim0GYs+HNs4hcxxJRpPN01X1QM2C/Wqpr8+qPvTpnN+PkqZg7BUeryIvpCAlwFG4CQUmY6ouVEE+xtZM9HKpgJw16RmORkHfvl0L+AuaZaGGyu851ARC/yoVvo/Uoi5qF9M0iYz609ow54VChEZ+uT6qebKxt4QBT5vjw+99QWU2aXMaRXNY3mWtRjWSFxXcm3dxZcG4KyQCCrgTbfudYNyiBDolBSY4zvaFc+v/WGnaXQu6eMQTAqX7FWkBArezJytlMgMSarTWYdnvE9yKElSRisux/lYGdujAQspxgb2xRqOgFqMeeLX9t3KkHMiu4DXoz/lngWIQnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBH0/Gmz65koXol9twNplDFQDt8S21OC2GAAd/tQ6Bo=;
 b=wJLlyn5yCAoF5LUS7T0/C9ennBxF4hc3mJM9iTeYbr7uZADg4s0Azk1S3nxdzPO1/tTp7HAosDXaUCbKch8HUse5Y/2OtGOAiD6JE4W1c36NBSYxQRG5lx89PEOYkYue9hiP9MeV/k0XIhOz6R4pMukcvpJDzC3FHXAIPwww0gT/iUvDyzyn2jzPeMrSuWCUvBUXWcnVJPy3HPZGbEv5NC10tugYLAO6bLbsjBX61IVsuB2RamoWV1nGA3tvAH5CMY0zWo8c6ozIswddxuUYID17Hsf4blAlwjy4MGneJLL7i/JSCmPgjljakycorar/sDetRTIs2n+XofAIpE0S2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBH0/Gmz65koXol9twNplDFQDt8S21OC2GAAd/tQ6Bo=;
 b=sj39Hxk3wqUUcVhJDEzOKS+eLoQWBYvtdQcac36/Bg4brXiaQO6++XFxBWzS85qh5ceiJZ8VlttK0r/n22aNOJ9uWPqMTOO1aQbfA47tQnMyBkTMWUoRKtg7GYHt0y6KWeLsIFYz+MpuWtb28hOZhEyO1olXFgQ1bK+yXUjhwL9fbKO3iCgstaMAuERW+3BRIj9pTf3zZ8168v89YO0kj1z3HcYCsTzXvj96CSm2kXjCFIprJ9JPbZC/dXo/ONZiEgcaiRffu2tkKmZEnT4bFc8e5m1/XzOAkrXiLcsuQGg6Mf9G+L+2SBh5cb3dWsIt59o7wcezxO/opaUzFCg6ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GVXPR04MB10828.eurprd04.prod.outlook.com (2603:10a6:150:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Thu, 19 Sep
 2024 13:48:46 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:48:46 +0000
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
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v3 0/4] gpio: siul2-s32g2: add initial GPIO driver
Date: Thu, 19 Sep 2024 16:47:20 +0300
Message-ID: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GVXPR04MB10828:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a107bdd-7547-475b-3de3-08dcd8b1c83f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWxLUWIxQjMyTG1Dc3gxTGNIMFFoSzhnNVNLZGJoam1NZ1o2WmljRFltUmUr?=
 =?utf-8?B?MC9NbDF1MDMxeDU5c2R6dHBkSUhVcVBOSW1WdG1VU1NFOUtpeGhKdXFSd1J0?=
 =?utf-8?B?QWVuYWVYb3piWkNVTTNBUUh4T0pNVDZaaVV1d2hlM0d4UVBBbmJaVnNHbUtV?=
 =?utf-8?B?dGRiVmtFZVIxcUpRK050V1UxMXpOeGZvK3dkYkFNWEZCdDBzYzc3RVZoNFlH?=
 =?utf-8?B?NUNEN2lOQVpMMUpIRy9FaU9HSk9Rb2pwVWlQVnV1S1dtaW83V0plY09wTElP?=
 =?utf-8?B?QUhEMnNxQWhya0lIdWRsalJQZm1BdXJOWGxaZlYwZjk3Sk9JRm9KVHZxc0lz?=
 =?utf-8?B?RkRXRVZaOGZaR2RNZno3alo4VDVOZTB0VS9YTkJrSm5FSFFFdEhMbG41NDI4?=
 =?utf-8?B?dk9mamFoRVo4NjQ3RVFWaWpHTVl3QVBhUEJQQ1pJcFA4N2YzaFJiczRuZjRC?=
 =?utf-8?B?MXd1OHVXWkVBV2IvT0ZJYzZSV0FLUC85VGk2ZUxKZGlPRlFUZi81K2hidm82?=
 =?utf-8?B?N2ViTDV5TEJGbXJkSXMzZXNGaG1sbnpmT1RvVEdVa0RJdSs1SDc2NFIyS01l?=
 =?utf-8?B?N1hka0lqRFhuaGtwcG5wTmxSV2VhdDR4WEU5V0syRDBQVENLcmw4Rlo3M3Nl?=
 =?utf-8?B?V3YvNm1OQmVWS0JBdW9RTVpLdFlZTDBPTmlFeHVjb3J4L1VCRjBOaFZ2Z00r?=
 =?utf-8?B?YnBuZmZCeHJlck12RUlaK0QyZkZURXpWMkY0SlVqSHV5WVdwcWlVL3ZDV1B4?=
 =?utf-8?B?cVdJNmlvV1VsN0htWkFtT0lNa1UrQ0h2NUpKdTlucVRzbmprY244N043b0Z1?=
 =?utf-8?B?WGlmQWZmNGNZUVMxRzJ0enBkV3E4a2lNMng0WlBlSHVEdUdDc0NNUHJlVVA0?=
 =?utf-8?B?STdnT3FkcVNNRXNSMWVpZUpMU0Q2YUt3aXh0RTJ1bzlCdGJWMk1HUmdFTFl6?=
 =?utf-8?B?TXdPT3BoQklDaS9hVDhIY0tscy9IVTZ6UE5xVkNDSUx0dG1QOGlQZFZFYzlW?=
 =?utf-8?B?UVE5bCthSjJJTjZOamhoOW42U2tKb1gzWTNISjFUc251UFh4Q0RkbXRlUi9U?=
 =?utf-8?B?SjN1ZTFwUEJiZmNlcWsxRHBQZ0Z3NUx4OVJGWElLdWsrT2hPRFNVeXBtQm16?=
 =?utf-8?B?bkpSNDNGaTRiSHdub01HSUlwRlVnaVhIL0Zkb2h5dlRCc0tIdlpJTnFxQWda?=
 =?utf-8?B?b29KUGRKcWFwWGNoMSs2SHo3UkxwZGp3MXh0T3FXZWF4NE0wQXhmcVVySzl0?=
 =?utf-8?B?YVlBNDBURVpDVGFKaHAxa1phbzlNVS8rQ2cwVWN1V2tMSW80OExVNWpseVdP?=
 =?utf-8?B?Zk1hemJNbGFraHlQblhJQ3QrKzVnTzRZK1F1M2VrVW9ZYi85ZUhrMEpLSXND?=
 =?utf-8?B?c2k2S0RiellSeHZjcExDMHdlVDFyNVdxQ3E5Mk5wWXBtZlNmcnQyVkVpZWpk?=
 =?utf-8?B?eTE0bDloNHA4Smo2aGtwRlRkc0huc1JCclZQZHUrMk0wQ1g0dmRNZVUvMEVm?=
 =?utf-8?B?MVIzM2t2MDJQMGhTTjhUQnhVZmtUbFdyRHRaQ1owTUpISkh5T2I1Q3lPenlF?=
 =?utf-8?B?dUlhUnUyeERMOUpuQkJ3NmFjN0liNlhJZUg2ckpUSUhsbnZMOXBFTHRubUx0?=
 =?utf-8?B?MlByZ0c5TldzMzQvVXNGNms2RzNCODVjc1ZiOUk4a2R0Q280emJrRmdJV3N2?=
 =?utf-8?B?TTVQQWdadlViTWYrcUJhZnZkemdoVVNkbk4vVVNZUmpvcmdJWkFhcDlOTFQv?=
 =?utf-8?B?TnQ1RWlNMGpHRWRFdjhDWVljbTRibHNTbWE0YlEyV1JrNmxMSDMrWnc4U1dZ?=
 =?utf-8?B?d1lBeWxuYmxoSHBVemNqMVB3RFFycTVHOTNVeDFra3FiQTlJMWxyWVFmV0hU?=
 =?utf-8?B?Z3oyZUs0a3VIUVNtcDhiTmhVdHlCQUxWc2t3WEVqNjVqY0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0FqYVpHOUJEeHE1Z0ErWS9ObUtIMjVPb1ZTd3VaYnNORDNFVkh3d05QeHBE?=
 =?utf-8?B?RGVyTkZ0Z01hd3dPcXdtbUZVMU1yUzhHd0hjV3J2bG1SeTFxM0trdFRsb1gr?=
 =?utf-8?B?YmdJYk05TlZwRW5rV09Vem9XcStqeGRHOUp4d0poZGJKZEFSaGxzNGJJVnRn?=
 =?utf-8?B?ZFEvOXQyZHd1SHBNbFpUdU8wY3oxM21SL2lrTkxtajFPZ2tMMWtGMWlyYmlk?=
 =?utf-8?B?NGhvQXUwWkVuUkpKSjIzQWtSTERYTEdwcDVoL1pBbVIrRmk3NmZBYnB1OVd6?=
 =?utf-8?B?SXF1NkFkd3BwWmlXS1JsajQzdUZRcjdhc2lSVTRhdk1vNklqOTVMUVlIY3gr?=
 =?utf-8?B?UnR4cE9SZ1AybjZGazVaT2UxdDNHZnJBdHRyNkpzbjRzdTVHQmdEZ2hiTHNH?=
 =?utf-8?B?Z2VxZzcrUDJib0VuUEZqOFVpbGxFWTltZTZWVEREaHF5amNSVGQwL2hpdDJZ?=
 =?utf-8?B?KzFvOUQ4S0Y0ejZ5SVdHTzNzTTU1MXV2NDQ0OXZyZDVtY2ZPMWY1WkZFaUo2?=
 =?utf-8?B?M2hnUG1EMGhyempsTHdHNWl6UllSS3hQOGVPSG5BbWEydGdjUC9pNlBmaDZa?=
 =?utf-8?B?dFZZeXY5MitwSnhhS1RlMFI1amQxUCs5YktQM3krK0Y3SFVKUWpxMko3MU8w?=
 =?utf-8?B?M3d5UkhHQzRCOXl6cmlrc2h1Mld5Y3hLdCtNKzdLTjdQOGhkY2NGdXlFZldw?=
 =?utf-8?B?M2t5RzRqQlhGakdzMUJzNVh3N3ZIalJ5WFEwOXVFaFNvb3VDUlhCUFNoUDZi?=
 =?utf-8?B?UFJFRytRZmEyTEVNUVVudkxQdEozZGhtNmtOVGhzU1dDZy9FWVhyZlFSMFNG?=
 =?utf-8?B?QWFMUk9uYmo3YUI1RTMvNFM5Q1U4cDJkVFdsYy9VODZ3Y3FPeVJLKzIrZHJF?=
 =?utf-8?B?VS9IcGR0MXR2NndLSEw3MkFld1JGeDY1eWU1UUFIWjdQMkVlem1oKzA4UHcw?=
 =?utf-8?B?Vk5BYUhucEpDcWRUNGlKbllBSG1NMGtFNkVGeHl1eG5BSnFadHhCN1AwWC9O?=
 =?utf-8?B?NExrNytQNWU2SThIVmhEV3pYcCtuU1g3S1kzYjVJTldMNjBOU3Jod0pGSFUr?=
 =?utf-8?B?RktYYUpodHNoNlI1V1A1NUFINkNwaVhaalRXZnEvR0dBbnVOczVkdVhUNTZo?=
 =?utf-8?B?YS9sYXJrS1JUSjhoT1Vua2l5QS9EZnpDUm54N2h1dFpyTkNmdDFDcEdycUJN?=
 =?utf-8?B?Uno4dVpIWlQyWHVtQk1mam5rNEJlcDlXd1JodUtGRkZqcEthaXFtdjhGRnlW?=
 =?utf-8?B?bG9BaDZON1VEYnRva3ZXTGQ5emRKbmRLSVdtQzNLWkMybnNranRPSk1jejcx?=
 =?utf-8?B?M2h1UythNGFVbnBkWWdyY0lQN2hUdmV1alNuTVQ5ejlZTHdseWRLdHp3Rzhw?=
 =?utf-8?B?eHJzaVlyaUpOR2xKT0lPUUYyanVHQzFRSlQ2OXF5VTk1eGZkN2xtYjBuaGtI?=
 =?utf-8?B?S1g2SS9rSFE5RXhtVGphTi9Nb2czemx6ekV3Rk5SK05tMFd5YnV4S3dkZklj?=
 =?utf-8?B?YUs4R2FEMm9BV0orV1FVd2xyKy92ZGJQYlNnbkNtVzlUK0gvanBUS2JxV2Nw?=
 =?utf-8?B?a3NWUFlMNHQrQ2N2UDcwM2t4RjBoY2gwQU5pczB0NHo2NmNjNExiUlVaemlQ?=
 =?utf-8?B?K1VId20xcSsva0JzaDdoa1VzT29NYTI3SGxzUzBVVUc1U1pCbENHa085K05N?=
 =?utf-8?B?YXNJSHpHcVZSMW9Yc1FJOFF1VGZIeUJzYlhLV044OWR5dlA4ekRGN2dBYW4y?=
 =?utf-8?B?QjRhUk9JVW9iM1NoY3l6ODNFdTN3Q3JTMENkWW1PN2pNTy9ZWUIydWFpNFdM?=
 =?utf-8?B?SmhJU2l1L2xWbmJhd3RuYXNXT2pCSWw2WU1jdEcvVGNyUnpNYTdEZkl3L21M?=
 =?utf-8?B?b0VJUDBsWFNuNzN0ekptUUdQcjdqUlhYT2FMWHVNNldVVGFXRHE0Z1FUMG9u?=
 =?utf-8?B?dkJyQ25VanNzbmlZR096NXgzYllON3BqdzJZUzlUckRBT29VdEF0ZHltOE9w?=
 =?utf-8?B?aFJuZlZyQ0Jrb3QrV3VlM3NRTTFYTWhiZTZKanlOcUtYY1F2M2dhLzNtemQv?=
 =?utf-8?B?MjF5Znd0TlZEQjYvWEdVWFNMNVMvUUdHTktNREZJT2tHS21NTzJIMktYazNh?=
 =?utf-8?B?RzN1aTJEV29aMjlVekdUbXI2Tm5mWW1oMVpPZGMrdDAzRzZla2xrcUhjbmNB?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a107bdd-7547-475b-3de3-08dcd8b1c83f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:48:46.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8Z7GzOQCKQgkzCX6FUxSEQ+bOvX9wc7erXK/MZGRHQyflFWfcWpeycQtzvgWQVl8552siv2tDaXHdAbnoCgH99hR+YU7UvFn+Hh9L7BtCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10828

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

 .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++
 MAINTAINERS                                   |   7 +
 drivers/base/platform.c                       |  27 +
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-siul2-s32g2.c               | 576 ++++++++++++++++++
 include/linux/platform_device.h               |  13 +
 7 files changed, 741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

-- 
2.45.2


