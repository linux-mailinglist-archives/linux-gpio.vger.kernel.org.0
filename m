Return-Path: <linux-gpio+bounces-18865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD20A8A166
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 16:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E49A441234
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4F9296D16;
	Tue, 15 Apr 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WT0izpEL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FF3296D06;
	Tue, 15 Apr 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728102; cv=fail; b=MRjo3FODlo6JPAxNIzqgdAf1qkMsi93fJVas+2MjVC2yegH7ltHFN+z3qRUTRpUWmwWUknHMRCN9kbXL0KoOaATn+O8YrlmWhKUHxCvdRCSwnXsEfYDdBoE49Fhbjqn4qNBQQg24tmYAUM2eAK3/x5cFXS/0vU4VuPyIYfwY0eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728102; c=relaxed/simple;
	bh=ETycxx4+X7t9JhcRWjLJKOxjrylMZMb9DhlW8hW4Wl0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B0nUiapteZDLJ6tpGGBUDhYOMFWhA0SdSctWnVfBwCa1Vbpsg+girhwYAF/mrQuxisEd8UiBsfYtoxbG6nLWElxB8XzWCXJNX0Qhj6FFs6IbVAcwZbpr3jxcKO+rxqUN3ttB0ivrIXpcVy+cEccARXKi3HmcqWxNwy/JWbx/Td0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WT0izpEL; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX3CaKpU/5Slb+1JvYdmmXqlP6wqVu46APcNoUP0eWwbVnPk+3poY4xN49liqW6LZtGDIEgfn+NtljWpvQTmtgEUrUCy6MPgYfXKwWs6Bh6WME9ZDeDkdISL5xNJHtDwDT+zpMuu+lWfDp6Rm0oMhOzqxvOjpWTIkL4OaAzWijTygA24NptkGgpmVXoDubcpSNpYgCQD+IMzzhpP+sgCwcAIb+d4M33JU2JlcGgrvBa6XpuNun7sUBgWu8uLarmhqlKRIS4UDxRnGrFoMB/qiHH5Vxj2Cvbv99EMuzogsK8FXIi2+ompT7SPvHdDjrTsVt1QiRWzQmeXE1bl5CfDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETycxx4+X7t9JhcRWjLJKOxjrylMZMb9DhlW8hW4Wl0=;
 b=T4vd6Fgy1Bn3QL4IzE2gY8bHC4W4EcrxhGxr1fjRb8K4cyBsPsngy/vwZZRLQpPqlfKoQ9NBTYFpI79n7JsBsRFfBwvBXfrHxgbPh8Pnm2D8N+0C01zH/b8S1Vbs+Sbo4Vsk+1zVbI49p5RgU0prQ5GTnU7K/1vIsjSAtWSVb8+z/7PkY9xI+0Sb/71DH3XYSPTQRGfo3Iy5PsQJyZIV+GP5el2ky4noAUOtwqP0hY+I8IkYuHIufsbBQB26PMeNzs5ZhLgtD/grJTrW3CJIXVNPP4Bguxp5eW0mLzGNfsyX5ESAAzsNEzKT5jlOELyC7YKrNtMS5d+u1CH0Q0Z33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETycxx4+X7t9JhcRWjLJKOxjrylMZMb9DhlW8hW4Wl0=;
 b=WT0izpELtSXkmKIh0yiL3iEGjmXm0dw6Wf0vySwYs7LKHaaV7nUrpHwVwnov0o9sTjsD5bwv1Xg5bNUGLOaHK7lny8f7J3T+SJ57X5+SltEkqgHJZUTtz9pjwHG2mtXNsXmwwALw255qtH95739uGD/1fuxQxzbuO71Mw1Xx3cQCrmrNjkXvVyq2ZzTY3u/GuhAqdidRoocaWnFQEcyvYkjVbT2NS+HpMijOnkAHJdtIdlmrPG40VBwmnuRUdGL/72m11YcAYOlyUn9hjUGLSAze03APrNmeEB+Aj8Cvrqm450QaysNrichw8yKWb+HuD/oS7bct7fBQS1R2ODxq0A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6911.eurprd04.prod.outlook.com (2603:10a6:803:12e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 14:41:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 14:41:32 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Ujfalusi
	<peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, Tony Lindgren <tony@atomide.com>
Subject: RE: [PATCH 3/7] ASoC: codec: twl4030: Convert to GPIO descriptors
Thread-Topic: [PATCH 3/7] ASoC: codec: twl4030: Convert to GPIO descriptors
Thread-Index: AQHbqCdcetRj882wrE6Vn9LE0+XlVbOkxCwAgAATb1A=
Date: Tue, 15 Apr 2025 14:41:32 +0000
Message-ID:
 <PAXPR04MB84595DCC6615FFDAC1FD84DF88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-3-c0db9d3fd6e9@nxp.com>
 <CACRpkdaeUs3Yfa8b8=Rhy+Qw4GMcNuEWXmKsK60qOpYB4oHG6g@mail.gmail.com>
In-Reply-To:
 <CACRpkdaeUs3Yfa8b8=Rhy+Qw4GMcNuEWXmKsK60qOpYB4oHG6g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI1PR04MB6911:EE_
x-ms-office365-filtering-correlation-id: 513ee7e7-6783-454d-c9c8-08dd7c2b9d7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T0ludldLeHZlS2Fpek1RYmNBZzkyYTh1Z3pYQ3gzZmxpU1V6QmVrVGhnMFFz?=
 =?utf-8?B?b0FlMTlKdUw3WkJOakZUSXdIR2t0RUhneCtkU2NTOXdVOThwdG0vL09UWTJ1?=
 =?utf-8?B?aTNqOGQ4SzIxMFIwYlByVWs4V2RMQW5jZVg1UEM3YXRpNmUwZlk4V0NZTlU0?=
 =?utf-8?B?Vk5yUjBUcERZZ1JJWm5XY3l3bDBnaGRPNzJZTy81YW44NnpOd2kzTTJvd0ZJ?=
 =?utf-8?B?bXI3anBhcHBtMkxCMmZ3bGxWN0FMYnRKYlVVK25LSlRBVzNnYS9NeHJHMUMv?=
 =?utf-8?B?cHU0WG1RaXVKWlQ1bXZjVW03Slo2a0p0WFpjUjRkTXE3MXltYW9xQ095U2tO?=
 =?utf-8?B?cjByaDU2TVFmVWlvNDhtZ3hhdXJ3SEloZk1UT1E2Qmd1aVhCYStwNWR2dmUr?=
 =?utf-8?B?ZkdUM1RkRFV3YUM0UlNoMFpib1hUSWRhaUpuMkZVMmVpaHVuQ1AwUkRBaTZT?=
 =?utf-8?B?bTllVTVtZGJsR0hFM1dzYW9PVVFiV2Q4NFJFa0d5TzdwY3FqOWk5b2pIem1T?=
 =?utf-8?B?TnUwZU05RGo4ZFZ6QjBuZW9lckx5eUtQMWlGTnk0UmtEVTZnaTBabXNrZHBT?=
 =?utf-8?B?b3RDVVZkaXliYnAzSUg4NGpzUVgvSWtrSGd2eG1HZHR5K0ptdS9Cd2hiTUxm?=
 =?utf-8?B?K3oyUFlmanc0VFVYR0xWMWlpcFVlbUNtVnFEWHd1R1J0MDhUU1N0OGtuWXl2?=
 =?utf-8?B?eGFsSEk2YWR4Mm1QUFU5d3ZEKzVlT0N2Z3RsMk1MeGVRWXVMSGU2T3JvbVVn?=
 =?utf-8?B?WGJES1BPSlFMR2lBSzhMaUJxUSsyWCtNMzlqL0d5NXNqbmIzbWJGOEt3VTV1?=
 =?utf-8?B?YXF0Rk9sZnc3cGpSRjNOa09FUkxHUkJybTdsRU1ES0ZkcGVteml0SDMxMTd0?=
 =?utf-8?B?Nks0WFBaWFFucThhZk9hVy9XdTUrTmduMStTMlduQzExbm9YMDJtN0NRc3ZU?=
 =?utf-8?B?U3N5WDZQTlE0cktnRStsQU5EbHZhSVIybU1HMVE2TDBGK21Vc0VwUlQrb2Zv?=
 =?utf-8?B?RUQ1dVptM052d0tkNVhWdW5DWVRrM3c5SnkyaUNrNW4wTTBwcGdVMTFpNVpJ?=
 =?utf-8?B?d0x2d0FEK0g5ZWt4Y2RHcUlaSFhqdEM3TUIvMFhydzQvRStpWjZwcExTSkNW?=
 =?utf-8?B?RitFdmZoQ1k0Zy9Xc0ZUcW80RDZ6ZlpqVnZkdURwRFo4UGRKT3NheWpZT3Q3?=
 =?utf-8?B?ZjRYUjk0R1NQSW9nMmt3U2Q0amRMRlJKNS8walZUUlNjQ0FHdCtCWEg1b3BM?=
 =?utf-8?B?Q2RtUVVLRkI2WVNjMHUyWTJIYWhQRi82eE5yeHJubHhEdHg0REUxYXZjTS93?=
 =?utf-8?B?UUd0TVREbU5wZ21DTEI0QnV3VDg2ZFhzRDNEUUpCUEpYc2xoaTQvUkNNNWU1?=
 =?utf-8?B?azZWd0EyckRwd1VtakpqbzdDVnNEMUZIM3dmczNGTW1uU1kyOCtoRTU3bzhD?=
 =?utf-8?B?b3l2ZXU3ajk1aEU4N0xmMGZMc1NxQnYxS05sSGVaVlhNeVZNendzL3NBaEU1?=
 =?utf-8?B?Q3ZST1A3S2xlTjdGeVhZeFVIaDdZSktrSllZVmdNSXl6c1NjbVpRTWhQRTN1?=
 =?utf-8?B?dTlZcGlvanhJM2N0T0ZrZnVrVDFMZzBNK1duejBpNmdRODlvT1JTbTNnM0NK?=
 =?utf-8?B?UmhrdmlKbWxOeHVzQllMQWRkblhxZUJTckFtWnpsYU1yV1RudlVUc0loS2hP?=
 =?utf-8?B?UlJMeDVZWThtTUQwWWxhUkVpem1GcGxxdTB0VXJqRXNHZ1I0M2ZjVHpWUi9v?=
 =?utf-8?B?aGw1OUt6Y0hNNGFBa3ZzcGNHdWFsd0VMUlJHVlZoZHBtZnN4ZnlFQktFaGRk?=
 =?utf-8?B?ajU4aFFLNDY5QldZZG5ndmJ2eW93cGV6STcrVzRjWTlDQjJJVWs3dThvN3Vi?=
 =?utf-8?B?RUxGbmpaTExnV3pkdU95VVJWUnlHMmovSXQ1Z3p2bUhqREFmWTZ6M2p5U00x?=
 =?utf-8?B?TURNQ1F2WjhRLzVDZ3hrZk4vY3lrL3REbHU5Y0FhTHFCNDk2M3hmVHJEbnJK?=
 =?utf-8?B?S3dQbERiYnF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajhrOWx3NVFrcHh6UFVXUjBRTzZYZW4wRWVkdzNqR2h5dHlhOXkxQ1IzaWk2?=
 =?utf-8?B?UWViK3R0eXRZREdXcVh5cWRqOW4yYXR0aTgvYy9nUlZvY3RLd1YwZ1E2M1VE?=
 =?utf-8?B?L3lkZVhtMkFiRzk1UkxhSSs1ODRUQ3k1Mm1YZ2U5c00vVFhuOHg0M2g1aS9P?=
 =?utf-8?B?d3lBcEJRcWFTL2NOQmJRb3hFd1VyS0JXdFpqaWxUem9ud21iZkJBbk1qUHVQ?=
 =?utf-8?B?UjN3elhIZ0lVa2dYc0pXNnFwNG5YSFVNTGtRaWxreGcxREVHZmRDaUoyL0tW?=
 =?utf-8?B?Sy91VWZObGFZNkpOaWFhaXFoTWZuV00xRFJWUkVEYlVkUGVYZ1U4Z0F1S0tE?=
 =?utf-8?B?U0JZZVBOL2E1WStqOGc1T1pXbnI5U2RoaTVlSUJ4MmtWUlNra2I0RGNKcklN?=
 =?utf-8?B?VUpuQSttbjViTkUwWVdEK2dxK21SNWhoSVpFMEwrd3NyS2pRM09FbWpjOFFn?=
 =?utf-8?B?QzAzQnR0eEo5Y2FKd2JPOGNSNmtmdlR4UnBNYXVWMzRZMDYvK1VKNFk5UkR5?=
 =?utf-8?B?eTJ1YWpxNEJWZGRBNmc3S0pDekpOcFFUQmhKeUZPU2ltZXFCOFZ6UkZQelZv?=
 =?utf-8?B?N3NBU3BLT3BML2Z5V1c4SlFqdXl5WkFjTlRmWkppeng0UmZqZ0c4Yjl6aWhQ?=
 =?utf-8?B?K20xeGJoOWRZWGxsK3JYdnREVWJZVkxvOFY1U0IwaysyUnZiWm9pblBVZnp6?=
 =?utf-8?B?eUsxOFVsOWg1OStUZGZUZlcrSURHbU1hV0EzazhQakJJUVBVVU9pcVluUy9m?=
 =?utf-8?B?T09qM2lCeXpVcHhVWjdreWhKVUtNbVVURlpHU3YvNWZ5cWhDTXdQUFZ1UVNS?=
 =?utf-8?B?TXA2TlBiS0haUWJxNXloYUdsMHlIOTkvZ1NzQ25hcjBFWW0vb04rV216ZTNY?=
 =?utf-8?B?Q3NHT1Z6b1hqb09yOXJaTVR0THNTOFNYWFVnM2ZvdzR2d0U4cjFaajk5NGNJ?=
 =?utf-8?B?emovYlBuV1hIS0pEamV6L3dpc0I4TTdlKzdXaEtwMjRnclVyMWhCYmkxRHZ0?=
 =?utf-8?B?Z3NEQkphSGtuMStqU0x0RFFCVU9EQnZ5Q1JHdTdlYkhVaUlhOUs4alp1Sk94?=
 =?utf-8?B?RkNwdjBsZEJyVU44K1VISzhsbU1DREl0N3hwck1vU0pZOXNhWEYwNGJjaC8v?=
 =?utf-8?B?M0hpaStlODZRVzRDeVQyQU5zeS9VTS9PUklWRWVpOGpGNDRNSEtpdTUva0hW?=
 =?utf-8?B?N2RueDZDS3FORlpocTNIMEZiNSthYnlDQ3NFUGhLY0tqblVpaWFjM1JyMEV4?=
 =?utf-8?B?eUVIRDNrTVNSSUROU05NSXByQXJwQWcvU0Z1bDEvS2ZFQWtTaXJlMXVIYjI5?=
 =?utf-8?B?VEhLR2ZXT0ZTVEJWUUxaamdtVXFvQVVPZjZ0NnBwdWFMLzdFRkU4cWxFRCsz?=
 =?utf-8?B?dzlQN2UwbHVVTTZiL24zcnVka0VjWVhEL2JWeTlBb2l6UVBLUnhWcHJsUTBX?=
 =?utf-8?B?WGFMSVd4Y2NCOVFMT2l6Zy9pVSttWmdyOVhBK2FpV2RURmpVNjlHK2xQZXl6?=
 =?utf-8?B?Sk9NdCtiVGtrZGxSTzVFelQ4U2VQNWdRMG1WTktJR04yVTZTanBCdllYeUdM?=
 =?utf-8?B?dnRKQXZmM01yUitySmhkY0hRTmJocGhJMktrc0FtTUFiZWJuVkI5dHdKVUdR?=
 =?utf-8?B?WVVqdENocmpLRmQraDRvZTNOcUU4RnJ0eXlIaW1vNE1SS2N6anV6MHVjS3ph?=
 =?utf-8?B?TGVDV0pMcENTQVZtOHROTUJoMGRDZmozOHVNQ214c09RZjE0cHQ5cklVTjY4?=
 =?utf-8?B?RElVdVBqUHFPdUVlc3ViU2JwTDdvUTByM0NOK3B6QWRYRUpzY0dTeU5FSGtp?=
 =?utf-8?B?eEZQaXNZaFplQW5BS1p3V2x1RHlPTXd6YXlkSEkyUmdHUytKZGhwLy9uQnY4?=
 =?utf-8?B?S0xaMng2TEl3Q0M1dzJPMXYrV2VvWDd5cUFMQ2NoQWlHNmRuWEt2VDVCWmxG?=
 =?utf-8?B?cHdEb0cvelJhZnhneHU4cmFMOEl4U3kvbDkrSXd3Rk1WbGNaemozeXBmWHha?=
 =?utf-8?B?S2NBeFl2ZkxlRGFQeXFWTTl2QlVIbG5rak13Tk5pSUoxUFMzaVRqZFdZK3F0?=
 =?utf-8?B?S1haTk5aejRabFh5NTl5Z0F1aW5IVjV3MEVXMXk4dEpiRWhKbmJkZ3pyV2Vm?=
 =?utf-8?Q?B8Ho=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513ee7e7-6783-454d-c9c8-08dd7c2b9d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 14:41:32.4039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYv1Em52kXOdlacE5AsuXzZkN4ik/aEKC6x+tgPmQ9gEYQpxQiJ1a2JUF6o9xzDy6G8wCJ+vhpYAq8yXZF+LjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6911

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzddIEFTb0M6IGNvZGVjOiB0d2w0
MDMwOiBDb252ZXJ0IHRvIEdQSU8NCj4gZGVzY3JpcHRvcnMNCj4gDQo+IE9uIFR1ZSwgQXByIDgs
IDIwMjUgYXQgMzo0MeKAr0FNIFBlbmcgRmFuIChPU1MpDQo+IDxwZW5nLmZhbkBvc3MubnhwLmNv
bT4gd3JvdGU6DQo+IA0KPiA+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+
DQo+ID4gb2ZfZ3Bpby5oIGlzIGRlcHJlY2F0ZWQsIHVwZGF0ZSB0aGUgZHJpdmVyIHRvIHVzZSBH
UElPIGRlc2NyaXB0b3JzLg0KPiA+ICAtIFVzZSBvZl9wcm9wZXJ0eV9wcmVzZW50IHRvIGNoZWNr
ICJ0aSxoc19leHRtdXRlX2dwaW8iIHRvIHNldA0KPiA+IGhzX2V4dG11dGUNCj4gPiAgLSBpZiBy
ZXR1cm5lZCB2YWx1ZSBpcyB0cnVlLg0KPiA+ICAtIFVzZSBkZXZtX2dwaW9kX2dldF9vcHRpb25h
bCB0byBnZXQgR1BJTyBkZXNjcmlwdG9yLCBzZXQNCj4gY29uc3VtZXIgbmFtZS4NCj4gPiAgLSBV
c2UgZ3Bpb2Rfc2V0X3ZhbHVlIHRvIGNvbmZpZ3VyZSBvdXRwdXQgdmFsdWUuDQo+ID4NCj4gPiBX
aGlsZSBhdCBoZXJlDQo+ID4gIC0gcmVvcmRlciB0aGUgaW5jbHVkZWQgaGVhZGVycy4NCj4gPiAg
LSBkcm9wIHJlbW92ZSBob29rIGFmdGVyIHN3aXRjaGluZyB0byB1c2UgZGV2bV9ncGlvZF9nZXRf
b3B0aW9uYWwNCj4gPiAgLSBBZGQgcmV0dXJuIHZhbHVlIGZvciB0d2w0MDMwX2luaXRfY2hpcCB0
byBwcm9wYWdhdGUgdmFsdWUgdG8NCj4gcGFyZW50DQo+ID4gICAgaW4gY2FzZSBkZWZlciBwcm9i
ZSBoYXBwZW5zDQo+ID4NCj4gPiBDaGVja2luZyB0aGUgb25seSB1c2VyIGxvZ2ljcGQtc29tLWx2
LmR0c2kgdGhhdCB1c2VzIHBvbGFyaXR5DQo+ID4gR1BJT19BQ1RJVkVfSElHSCwgc28gYWxsIHNo
b3VsZCB3b3JrIGFzIGV4cGVjdGVkLg0KPiA+DQo+ID4gQ2M6IFRvbnkgTGluZGdyZW4gPHRvbnlA
YXRvbWlkZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5j
b20+DQo+IA0KPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPg0KDQpUaGFua3MgZm9yIHJldmlld2luZy4NCg0KTWFyayByYWlzZWQgYSBjb21tZW50
IHRoYXQgaGUgd291bGQgbGlrZSB0byBzZWUNClNlcGFyYXRlIHRoZSBjaGFuZ2VzKGUuZyBiZWxv
dykgdG8gYSBkcml2ZXIgaW50bw0Kc2VwYXJhdGUgcGF0Y2hlcy4NCi1SZW9yZGVyIGhlYWRlcnMN
Ci1DbGVhbnVwIGRyaXZlcnMNCi1Db252ZXJ0IHRvIEdQSU9EIGRlc2NyaXB0b3JzDQoNClNvIEkg
d291bGQgcmVkbyB0aGUgcGF0Y2hlcywgYW5kIHBsZWFzZSBub3QNCndhc3RlIHJldmlld2luZyBl
ZmZvcnRzIG9uIHRoaXMgdmVyc2lvbi4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gWW91cnMs
DQo+IExpbnVzIFdhbGxlaWoNCg==

