Return-Path: <linux-gpio+bounces-10461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591FF9875AD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7EB41F22BA0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5C3152165;
	Thu, 26 Sep 2024 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zp4HPmk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCFE14D70F;
	Thu, 26 Sep 2024 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361126; cv=fail; b=bgab+w8uvgNZD0YFThgBcEgedNB3oo2aUX4BH9b+bw0wt4VFuMG7SneXVUs7daIyvlFWvAKuVbQqz5YS8CrPnT7zHe1HOPKm3a4O0YdNe3Jg2VwarheSDyCu1VNwqgm7gzbWJ+mqdV8Zg1pHIAfArsGrmJxnQ2MImhbrrm5Rk5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361126; c=relaxed/simple;
	bh=zn7wsbnj3RxoIkyUt7ybOEJXz+bBO8kc8eGuCAJ2Hjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GbcJwN4X0CRESrVqdvcQhba0hrRYpjwnAFbki2aEVdoCSYT6sdwinzLkj5jMfm4DCK1lJrE05vkCxAbzKq3yJmaQ06FVr2UoSv2CC8BKf0/LtEEvpn0UR/pYbam5n+9NwZbaA9qk+WuS8MDwMDY3Vo9IfDZ3A9JyCupsWr198oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zp4HPmk4; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES9AOA+FIi4v4QUFVfvrH9Eq0aeAe20G+6LazsyjBWhp51PcrOrct4lmoWhqaAxibkJpFlLn2Agrfni0wPJHn4UT+ZEp0/SmIDIvUkX1RdeBx439msZUNzsHqIdF7dgPaxbQYsu4B1fzvosGpXi7CyRA5Q4qMTMUGTUZmMiK5NtZd/mhmPtyxC1XCc+4okUR4+HP9o+LxcuOdj7x4NcY9NjmS946K9nTAUjTGnzq5eCXsEvs+PgmeJexYXKLU+NMKF37Q4IO4vBbKWh/7w18Q2OKnifru95letQRpgXFs0Z74WAh8icrcd1SlRiXvJlwj9Vv4ATfuupufS0s+RgmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yhl0SuY9l/7AQdpfne3J5b4/aU7cNlKV/TWXWcyG85U=;
 b=Z0OYgCBxCwEjRbvuCeXHeFBfI1THzLYlClEbzy1YLx8l7B45pxa/IWcmS0jzZrLts8zQ/Pm4YciGp29rqzK+DLl5j+qvWZoDyKnJx1GapIKNOgs+AN2OJPscYhJpDcbWs9avZs8e+J/GcDZ4DWR3o+0Na0cHMft004lKBX1x7xtj3t0j07Lv9bzIN6EC/bj9OKwmq/YIb96grQurGuZt1PzIDCTcNRwpE8Qg8Az/U98lC7ulbcIxUy82/f/usNKEL93Oz23plcaSv0Idjt49bqkg2QYxvStEXubn/DVY5MvrBnpOewsLsOQ73Scv+FzvUOV3OL2Yoe9x7UbvHqwuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yhl0SuY9l/7AQdpfne3J5b4/aU7cNlKV/TWXWcyG85U=;
 b=Zp4HPmk4qznIfCLL5FUoRyoZdsQ03KHLUZhVn0EGKQkiqfD++Wesd1yP8WnqyF4cAr7ffPZUCPV7mYfybb8WoWv6Ex6Vn2HXIKlvPILDl9wJ3LcMRq48ae4UbPaHy9cevGTbGDIB86luhgG8XtAp6nlzTUd6oZeswEFF+ptbxc7H6ulQS3hEoZGm+kjjgNWavW0sYSIgbQFkU8RyMuZq4e2ZSQ1CiqgRFH3/4idx3y2KzaraC5ipB0jWKI8eL1nU65CRgeIzTlUULm5pI213qAl2UHnCJYojlICkXGyLXlN4bPyt0d84it27HYXdD8N6YpQv7J66yI5p3faxm1Wpvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10485.eurprd04.prod.outlook.com (2603:10a6:150:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 14:31:54 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 14:31:54 +0000
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
Subject: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
Date: Thu, 26 Sep 2024 17:31:20 +0300
Message-ID: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b0e7123e-929a-4f40-5a4f-08dcde37f79d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak1YM1BCQkVCTlNnWWlHaElKcjdXN2JhUGFrM0pvTmpIOU5nWktPMnc0WHcx?=
 =?utf-8?B?MFYzQlprb0RCQjVCVzE3cmlJODB0UTB6VUlvbDA5Z1F0cVBsL24xeW9zdkFP?=
 =?utf-8?B?SHpRbWJKSmpYOUUvNXVKNDhhRFVwaE1kZTRNYVpGUS8yM3BSMUdac0ZaMktj?=
 =?utf-8?B?REQ3Y1c0YXhBUGhGeDh4dk9Zb0ZSMlZmY3JOL0JuU3hXRTBxZlBxTTdSd0Nj?=
 =?utf-8?B?bitkU0tOVCtwTnAxcy9CK3NncUxYZks1c3VEQWFOdjdDeVBsN3ZzSFVxaXFy?=
 =?utf-8?B?bTdhWXc3ZUFCbGthU3dEaFphSCtRUzBZSERPVEJlOS95K0R1NDg0RStDRGJI?=
 =?utf-8?B?d05aY0hyV1pyUGRTcng5aWNmdGYxN0NyNnRneENrTjZUMXdxTFFsMTZQQXNv?=
 =?utf-8?B?UkQxQjdvSERhT1JtQVlZMElkRnNwN0NDa3dvNlFrZ0t2K2hjL24wV3cxd1R1?=
 =?utf-8?B?RzBTNzhiamZDMnlFN3NLaTRzTGtseG10MHZZQWVQd1UyRmEvNmN5Zy9iSUs3?=
 =?utf-8?B?SmJ1Qm5wZUE5VlZvaWFOVnhRY1dQYWtOVmNKZ2FKZFpKbWtEZ21DQnpkQURN?=
 =?utf-8?B?RjNTVUFtOHdZVWNGVWM0aS8xc1hwUHhUNjRTZzNUakdzOWU0Z2RFb3lyd2pB?=
 =?utf-8?B?SDNTL1RyWlZZZzFTZ00ydjZrWklWc3VJT2VuVkx5NGcrUGZpak4xMzkwR3Vj?=
 =?utf-8?B?MWs0cTMxQ3luZ3BkOTZXcFRvbU1NcWFteDRoMHRJaDgyejNBUTFZcGpwUU9X?=
 =?utf-8?B?WmRCSHVBZnErZnR0VG4xK1hKL1p2V1IzRVRJak5Vc29iVWFLOStGUElzOXYx?=
 =?utf-8?B?ZTJ6dEp5cW44eWo4dHR2MThNNnA4TllRL09IWTNEVlFhdUc5UlM2b1U2emRF?=
 =?utf-8?B?TUFZTGZRWENVOHllK3MyaDBNa2dIZnpCRGRvajQxRmtlanBFUHFHTmZ1RW1K?=
 =?utf-8?B?S2tUaHd5TmNVV25lWTVoc1E5SmlmWXlSNVo1emVrYUFNMkgvUXAxNFFmT1pU?=
 =?utf-8?B?UzN6L2UvTWE4djNoZ0UxRkNDVFduUkN6Sk9OejVIK1gvWHBhcE5jSVVnMkxE?=
 =?utf-8?B?SnlKbENGRXFHbGREZWdaRlF6cmc4VDlCbm5uc0NETy9sUTZReVh5QnQvSk5u?=
 =?utf-8?B?TnpXVzliUit1eHNxcXlDeDhRQ1ZqYVB1Q2hWZlUvUHJrM003OU9mTTkwVTZS?=
 =?utf-8?B?VW1PMEg5UmRYUU8wdm5NMnpqK0FvaEQ5V1ZaVHdtbXluTEJrMlBZYlpIcFdo?=
 =?utf-8?B?cWJqUWNKbVBkZkRrN1BobmoyVjdWeFN6Yno3NEtNUklMQ2Uvc1AyRDlLbEwr?=
 =?utf-8?B?bXY2V3FYRkJIc3M5VjhTSENLazVjU1N1T2QweGpOUHhqTjZNTXpIMUVaT1Ns?=
 =?utf-8?B?MDhySEJGcFIvSnJDc1c0V2E0TGt2VWdZSDM0b3gyMkpUdWRqODdYZ0JKVTVX?=
 =?utf-8?B?OUFFWTlJa1J0bGowRUZoUTBpWnhRd0IvMThTY3RRTVBPdXJSak1EdWEzK1hN?=
 =?utf-8?B?Wno0TXppNTVZMDZia1AwQi9nenloRnVVOER2V1JpbktOdUpZU1BvUWM3WWJB?=
 =?utf-8?B?SWwxNGhBaDhqQkJBUkJiOXVsaVFaeTdZN25mSG9YWFJ5bG5ZSTF0U0UxbUh2?=
 =?utf-8?B?Z2Z5bHpPK1ZEWnRvUE91R0tyOWtmL2drcUQ1T3ZZSnVBV2piSi9qaDFXQkhL?=
 =?utf-8?B?ZEFzeDh2NDdjc04rbVA2dlNBck1CdTFxUk5JVjdoaVNESUZ3dGNDWllMRkk5?=
 =?utf-8?B?QlZnS0JoUyt0U09leTFtbXVTUndQejN3VUhPekRGMUN0c1g3MVoxR21aRS81?=
 =?utf-8?B?T2VCT1BpczhoZ0c1YXp1K3ZRNHk4U2h5d3lSUWZwZVUxeFhVRS9zV0pUeVBL?=
 =?utf-8?B?bXkrenQ0MlYyUE5LRFhGdVF1ZGMvVkdEUUZIdUk2aWxBdWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0JLbzlsOVd6VnJ1czZHc05IOUtQREJZRjN5ZjRCZ2NaaStvcjdpR2RodTVD?=
 =?utf-8?B?ZzZObnN1QzVzcmN4Wld1K3dDTjFmVGNiSlBGMVpVY2Z5Nk8xWjltYm1UaVlM?=
 =?utf-8?B?MGNRQUNuUnZrQ1k0YVRYdnltSnRLUGpsckdCcFlYckJLZWplMERQOVhpUUtn?=
 =?utf-8?B?OGNBYUZDQjNSZm44R29FT0creHhRMjRnbDI0dnlOcWgrc0pjUGJSNXkrQ3Zr?=
 =?utf-8?B?NEJWYkFxQjd5TkV2dWM5TEp3dXBra2lyY0o5VStETUtiZVNRVlZWc0FRNk5S?=
 =?utf-8?B?cCtPVUtiblY1T3RVdXB2MzJjY2k5bDJsenVZc0dBTnFtcWhWS0JXMTlOc1Rm?=
 =?utf-8?B?TmFGb1lGVGpHRnRFN3NrSkJlc2h4NHhSc3ZTaVdGaHpON0w5TDJMbEg1c2NM?=
 =?utf-8?B?OGdabytBTlhVVnhnTkk2dG1OZWpkR2dVZ1FJV0xtdWlINU9adE4rUEZwbi9l?=
 =?utf-8?B?WkhOa1JVaWxBU1krc1F6WDFzQ3J6ZkZKOTJRWEt2djlwcVBuQ1crd2h0bG44?=
 =?utf-8?B?d2N0eUhweWRHaGMyRkRCbU91eEVWa3VZVGk1QlA3Rk84T2Y5a0VmNnRNY3Ru?=
 =?utf-8?B?YlpBRFJKOTNkM01mWWFQUG5CdVgvRWZiVEQ3UjVZSG96V0dCRzkzd1pNd1VF?=
 =?utf-8?B?bmRCbG9VRUFRVkVjUTdQaHpJNGFEUVlITWRMSERTNmlnbjNFcmhDblk0UXJN?=
 =?utf-8?B?dmxGRFBwZ0tXLzFWV1JpeE5sSjQ3TTJXbXFVYmloY09yT0Zab09RM1FyWVJq?=
 =?utf-8?B?dWh1eGJjSFRRRVJhZDZmKzFSbjRiQzV5M2trdEE2akU0SlUyVlFIS3VQbTN2?=
 =?utf-8?B?dnNHRzc4T1FIQkkvV01xN0w2czFKdmtZVnJseUVEYk1uc052OWJGcTBwOWMw?=
 =?utf-8?B?anNGbU9rU2pGQU1TYkdIekhVWGQ3QjN1Zk5sbGd4UWFPeXRXVDBPV2h4M3NU?=
 =?utf-8?B?UWJ2d2pJcTRVQVJydEZXMVJKdUQ0Q2lTUGwvZ2FEVm9DVVdjU1Iyb3NsbnZS?=
 =?utf-8?B?R2ZiTlVHdDFvWXRsUVpBVVE4TXg5YTNESVNCNHhnWmxtbWNRQzg2L09Ic0JT?=
 =?utf-8?B?SXI0MThUMGlPMW9nR3dQaXFQMkFiM04rMFNDbi9LY25wWDlpbmFXM1daS1Zw?=
 =?utf-8?B?ZC9ocjdYdmc0RFVndlhTWjlhOFgwd2EvQVcvNDJBRzBuOUREOFRTaTRIZ3Jz?=
 =?utf-8?B?cU1iaHB1dHI5T0ZUbENtK21JRENPakUrdDRHcFhXOUNVQ29sRGZoWnBOTjFu?=
 =?utf-8?B?bi9keG1TUER4NEhWQlJPYmJDSXV0RkFrSGdHM1htNTN6MXphMmVza2x4UDhS?=
 =?utf-8?B?RDBSK1VnUVkvOXI3NVlQNGljdzV4bUFxT3gvTDVJalFRWGtWTEQ0aVg0TnVv?=
 =?utf-8?B?Z1dkVEdVc3lpMHZBR3dNOXV4MCtLTCtwL3d6eVdzUm8yN3VmRTlxK2luSDZ4?=
 =?utf-8?B?MGJTS1daSndPaVNXbmZXenBxaDdrRXNDUzRIM0k2cGMxaEZoUmtVRG12R2tv?=
 =?utf-8?B?bktQNnROaWRqbkJqWUNLZGVUUW5VRjhzakZ0NDZwb1oxMUpORExTL0wyVzlQ?=
 =?utf-8?B?NFdMRFpCa1pNVkFJbmJXNzB5Z1Bhd3FieHpJeUh2K2ZwVnlSTHB6T2RMZDRB?=
 =?utf-8?B?SWhrMzA1bEd3WXh4YW5sUEpKK2ZPQzJSaFFDU2pBTkRvK2M2NTV3d3F5U1pN?=
 =?utf-8?B?TEttanVKVVVxTmIrbDlBRjRzb3M2VE8rajVGV0tTVXhxenZRSFZ2WHJOQ2Nj?=
 =?utf-8?B?Zm83b1pabFJMaHBEb0tQbktUdkFoRWNVbGg2YWpBUjBQZ3Z0NG1LKys4dVlI?=
 =?utf-8?B?T1ZDNDByVTdtTk1QM3ZaMDJXVVJLYkNVaTZmS09qRUhlMFRzcVkraWtTUmNK?=
 =?utf-8?B?Z3FxTW8xdVV3ZU9ud2ZEb2F5b0V2Y05FaElyQkdWZUpKS0lieS9kMExCWklt?=
 =?utf-8?B?QU5xY0JQWjM3bmNqVjlZZ1N0eGZ5aTRFdFB0ZVExcVJtaXJDTVNyVGhsTllL?=
 =?utf-8?B?TFhoYmM5VHdxRytsd2xvOXNlenBJamVqaHNCYlN4NFVvZnNiak03VFVnUFpw?=
 =?utf-8?B?LzdSTEtrS1BtZzB6ZmFnRG8yS2s2bFZ5dElQQXdRZXBGRVFsOTBCRHVDdzdW?=
 =?utf-8?B?L3VINjNTUjUwVUoyZlkxcDRNdERZTVQrcVVVU2tnRnd3eDQ1VjFNSmsyY2tL?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e7123e-929a-4f40-5a4f-08dcde37f79d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:31:54.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA65Rw8T30HIj0wx8Ob4xjuM+HBinyFg6qzO/T5pVBVMJw9ajRsbQMVd7aT5LOBuFeBf5zA00QrS/TpR2H0e0JK+uhdDdd1K91pVtDEWIMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10485

Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
(System Integration Unit Lite2) hardware module. There are two
SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
SIUL2_1 for the rest.

The GPIOs are not fully contiguous, there are some gaps:
- GPIO102 up to GPIO111(inclusive) are invalid
- GPIO123 up to GPIO143(inclusive) are invalid

Some GPIOs are input only(i.e. GPI182) though this restriction
is not yet enforced in code.

This patch adds basic GPIO functionality(no interrupts, no
suspend/resume functions).

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/gpio/Kconfig            |  10 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-siul2-s32g2.c | 576 ++++++++++++++++++++++++++++++++
 3 files changed, 587 insertions(+)
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..ae6aa6f64db3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -643,6 +643,16 @@ config GPIO_SIOX
 	  Say yes here to support SIOX I/O devices. These are units connected
 	  via a SIOX bus and have a number of fixed-direction I/O lines.
 
+config GPIO_SIUL2_S32G2
+        tristate "GPIO driver for S32G2/S32G3"
+        depends on ARCH_S32 || COMPILE_TEST
+        depends on OF_GPIO
+        select REGMAP_MMIO
+        help
+          This enables support for the SIUL2 GPIOs found on the S32G2/S32G3
+          chips. Say yes here to enable the SIUL2 to be used as an GPIO
+          controller for S32G2/S32G3 platforms.
+
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1429e8c0229b..8d5f35689fed 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
+obj-$(CONFIG_GPIO_SIUL2_S32G2)		+= gpio-siul2-s32g2.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-siul2-s32g2.c b/drivers/gpio/gpio-siul2-s32g2.c
new file mode 100644
index 000000000000..d9c04aacb3cc
--- /dev/null
+++ b/drivers/gpio/gpio-siul2-s32g2.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2 GPIO support.
+ *
+ * Copyright (c) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018-2024 NXP
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define SIUL2_PGPDO(N)		(((N) ^ 1) * 2)
+#define S32G2_SIUL2_NUM		2
+#define S32G2_PADS_DTS_TAG_LEN	7
+
+#define SIUL2_GPIO_16_PAD_SIZE	16
+
+/**
+ * struct siul2_device_data  - platform data attached to the compatible.
+ * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
+ * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
+ */
+struct siul2_device_data {
+	const struct regmap_access_table **pad_access;
+	const bool reset_cnt;
+};
+
+/**
+ * struct siul2_desc - describes a SIUL2 hw module.
+ * @pad_access: array of valid I/O pads.
+ * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
+ * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
+ * @gpio_base: the first GPIO pin.
+ * @gpio_num: the number of GPIO pins.
+ */
+struct siul2_desc {
+	const struct regmap_access_table *pad_access;
+	struct regmap *opadmap;
+	struct regmap *ipadmap;
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct siul2_gpio_dev - describes a group of GPIO pins.
+ * @platdata: the platform data.
+ * @siul2: SIUL2_0 and SIUL2_1 modules information.
+ * @pin_dir_bitmap: the bitmap with pin directions.
+ * @gc: the GPIO chip.
+ * @lock: mutual access to bitmaps.
+ */
+struct siul2_gpio_dev {
+	const struct siul2_device_data *platdata;
+	struct siul2_desc siul2[S32G2_SIUL2_NUM];
+	unsigned long *pin_dir_bitmap;
+	struct gpio_chip gc;
+	raw_spinlock_t lock;
+};
+
+static const struct regmap_range s32g2_siul20_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(0), SIUL2_PGPDO(0)),
+	regmap_reg_range(SIUL2_PGPDO(1), SIUL2_PGPDO(1)),
+	regmap_reg_range(SIUL2_PGPDO(2), SIUL2_PGPDO(2)),
+	regmap_reg_range(SIUL2_PGPDO(3), SIUL2_PGPDO(3)),
+	regmap_reg_range(SIUL2_PGPDO(4), SIUL2_PGPDO(4)),
+	regmap_reg_range(SIUL2_PGPDO(5), SIUL2_PGPDO(5)),
+	regmap_reg_range(SIUL2_PGPDO(6), SIUL2_PGPDO(6)),
+};
+
+static const struct regmap_access_table s32g2_siul20_pad_access_table = {
+	.yes_ranges	= s32g2_siul20_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul20_pad_yes_ranges),
+};
+
+static const struct regmap_range s32g2_siul21_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(7), SIUL2_PGPDO(7)),
+	regmap_reg_range(SIUL2_PGPDO(9), SIUL2_PGPDO(9)),
+	regmap_reg_range(SIUL2_PGPDO(10), SIUL2_PGPDO(10)),
+	regmap_reg_range(SIUL2_PGPDO(11), SIUL2_PGPDO(11)),
+};
+
+static const struct regmap_access_table s32g2_siul21_pad_access_table = {
+	.yes_ranges	= s32g2_siul21_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul21_pad_yes_ranges),
+};
+
+static const struct regmap_access_table *s32g2_pad_access_table[] = {
+	&s32g2_siul20_pad_access_table,
+	&s32g2_siul21_pad_access_table
+};
+
+static_assert(ARRAY_SIZE(s32g2_pad_access_table) == S32G2_SIUL2_NUM);
+
+static const struct siul2_device_data s32g2_device_data = {
+	.pad_access	= s32g2_pad_access_table,
+	.reset_cnt	= true,
+};
+
+static int siul2_get_gpio_pinspec(struct platform_device *pdev,
+				  struct of_phandle_args *pinspec,
+				  unsigned int range_index)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						range_index, pinspec);
+}
+
+static struct regmap *siul2_offset_to_regmap(struct siul2_gpio_dev *dev,
+					     unsigned int offset,
+					     bool input)
+{
+	struct siul2_desc *siul2;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->siul2); i++) {
+		siul2 = &dev->siul2[i];
+		if (offset >= siul2->gpio_base &&
+		    offset - siul2->gpio_base < siul2->gpio_num)
+			return input ? siul2->ipadmap : siul2->opadmap;
+	}
+
+	return NULL;
+}
+
+static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
+				     unsigned int gpio, int dir)
+{
+	guard(raw_spinlock_irqsave)(&dev->lock);
+
+	if (dir == GPIO_LINE_DIRECTION_IN)
+		__clear_bit(gpio, dev->pin_dir_bitmap);
+	else
+		__set_bit(gpio, dev->pin_dir_bitmap);
+}
+
+static int siul2_get_direction(struct siul2_gpio_dev *dev,
+			       unsigned int gpio)
+{
+	return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
+						     GPIO_LINE_DIRECTION_IN;
+}
+
+static struct siul2_gpio_dev *to_siul2_gpio_dev(struct gpio_chip *chip)
+{
+	return container_of(chip, struct siul2_gpio_dev, gc);
+}
+
+static int siul2_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	ret = pinctrl_gpio_direction_input(chip, gpio);
+	if (ret)
+		return ret;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_IN);
+
+	return 0;
+}
+
+static int siul2_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	return siul2_get_direction(to_siul2_gpio_dev(chip), gpio);
+}
+
+static unsigned int siul2_pin2pad(unsigned int pin)
+{
+	return pin / SIUL2_GPIO_16_PAD_SIZE;
+}
+
+static u16 siul2_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(SIUL2_GPIO_16_PAD_SIZE - 1 - pin % SIUL2_GPIO_16_PAD_SIZE);
+}
+
+static void siul2_gpio_set_val(struct gpio_chip *chip, unsigned int offset,
+			       int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int pad, reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = SIUL2_PGPDO(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, false);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			      int val)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_val(chip, gpio, val);
+
+	ret = pinctrl_gpio_direction_output(chip, gpio);
+	if (ret)
+		return ret;
+
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_OUT);
+
+	return 0;
+}
+
+static void siul2_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+
+	if (!gpio_dev)
+		return;
+
+	if (siul2_get_direction(gpio_dev, offset) == GPIO_LINE_DIRECTION_IN)
+		return;
+
+	siul2_gpio_set_val(chip, offset, value);
+}
+
+static int siul2_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int mask, pad, reg_offset, data = 0;
+	struct regmap *regmap;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = SIUL2_PGPDO(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, true);
+	if (!regmap)
+		return -EINVAL;
+
+	regmap_read(regmap, reg_offset, &data);
+
+	return !!(data & mask);
+}
+
+static const struct regmap_config siul2_regmap_conf = {
+	.val_bits = 32,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static struct regmap *common_regmap_init(struct platform_device *pdev,
+					 struct regmap_config *conf,
+					 const char *name)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	resource_size_t size;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	size = resource_size(res);
+	conf->val_bits = conf->reg_stride * 8;
+	conf->max_register = size - conf->reg_stride;
+	conf->name = name;
+	conf->use_raw_spinlock = true;
+
+	if (conf->cache_type != REGCACHE_NONE)
+		conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
+
+	return devm_regmap_init_mmio(dev, base, conf);
+}
+
+static bool not_writable(__always_unused struct device *dev,
+			 __always_unused unsigned int reg)
+{
+	return false;
+}
+
+static struct regmap *init_padregmap(struct platform_device *pdev,
+				     struct siul2_gpio_dev *gpio_dev,
+				     int selector, bool input)
+{
+	const struct siul2_device_data *platdata = gpio_dev->platdata;
+	struct regmap_config regmap_conf = siul2_regmap_conf;
+	char dts_tag[S32G2_PADS_DTS_TAG_LEN];
+	int err;
+
+	regmap_conf.reg_stride = 2;
+
+	if (selector != 0 && selector != 1)
+		return ERR_PTR(-EINVAL);
+
+	regmap_conf.rd_table = platdata->pad_access[selector];
+
+	err = snprintf(dts_tag, ARRAY_SIZE(dts_tag),  "%cpads%d",
+		       input ? 'i' : 'o', selector);
+	if (err < 0)
+		return ERR_PTR(-EINVAL);
+
+	if (input) {
+		regmap_conf.writeable_reg = not_writable;
+		regmap_conf.cache_type = REGCACHE_NONE;
+	} else {
+		regmap_conf.wr_table = platdata->pad_access[selector];
+	}
+
+	return common_regmap_init(pdev, &regmap_conf, dts_tag);
+}
+
+static int siul2_gpio_pads_init(struct platform_device *pdev,
+				struct siul2_gpio_dev *gpio_dev)
+{
+	struct device *dev = &pdev->dev;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
+							    false);
+		if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
+			dev_err(dev,
+				"Failed to initialize opad2%zu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].opadmap);
+		}
+
+		gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
+							    true);
+		if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
+			dev_err(dev,
+				"Failed to initialize ipad2%zu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].ipadmap);
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gen_names(struct device *dev, unsigned int cnt, char **names,
+			   char *ch_index, unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_remove_reserved_names(struct device *dev,
+					    struct siul2_gpio_dev *gpio_dev,
+					    char **names)
+{
+	struct device_node *np = dev->of_node;
+	int num_ranges, i, j, ret;
+	u32 base_gpio, num_gpio;
+
+	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
+
+	num_ranges = of_property_count_u32_elems(dev->of_node,
+						 "gpio-reserved-ranges");
+
+	/* The "gpio-reserved-ranges" is optional. */
+	if (num_ranges < 0)
+		return 0;
+	num_ranges /= 2;
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2, &base_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse the start GPIO: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2 + 1, &num_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
+			return ret;
+		}
+
+		if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
+			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
+			return -EINVAL;
+		}
+
+		/* Remove names set for reserved GPIOs. */
+		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
+			devm_kfree(dev, names[j]);
+			names[j] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_populate_names(struct device *dev,
+				     struct siul2_gpio_dev *gpio_dev)
+{
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++) {
+		ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
+				      names + gpio_dev->siul2[i].gpio_base,
+				      &ch_index, &num_index);
+		if (ret) {
+			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
+				i);
+			return ret;
+		}
+
+		if (gpio_dev->platdata->reset_cnt)
+			num_index = 0;
+
+		ch_index++;
+	}
+
+	ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
+	if (ret)
+		return ret;
+
+	gpio_dev->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
+static int siul2_gpio_probe(struct platform_device *pdev)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args pinspec;
+	size_t i, bitmap_size;
+	struct gpio_chip *gc;
+	int ret = 0;
+
+	gpio_dev = devm_kzalloc(dev, sizeof(*gpio_dev), GFP_KERNEL);
+	if (!gpio_dev)
+		return -ENOMEM;
+
+	gpio_dev->platdata = &s32g2_device_data;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++)
+		gpio_dev->siul2[i].pad_access =
+			gpio_dev->platdata->pad_access[i];
+
+	ret = siul2_gpio_pads_init(pdev, gpio_dev);
+	if (ret)
+		return ret;
+
+	gc = &gpio_dev->gc;
+
+	platform_set_drvdata(pdev, gpio_dev);
+
+	raw_spin_lock_init(&gpio_dev->lock);
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		ret = siul2_get_gpio_pinspec(pdev, &pinspec, i);
+		if (ret) {
+			dev_err(dev,
+				"unable to get pinspec %zu from device tree\n",
+				i);
+			return -EINVAL;
+		}
+
+		of_node_put(pinspec.np);
+
+		if (pinspec.args_count != 3) {
+			dev_err(dev, "Invalid pinspec count: %d\n",
+				pinspec.args_count);
+			return -EINVAL;
+		}
+
+		gpio_dev->siul2[i].gpio_base = pinspec.args[1];
+		gpio_dev->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	gc->base = -1;
+
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_base +
+		    gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_num;
+
+	ret = siul2_gpio_populate_names(&pdev->dev, gpio_dev);
+	if (ret)
+		return ret;
+
+	bitmap_size = BITS_TO_LONGS(gc->ngpio) *
+		      sizeof(*gpio_dev->pin_dir_bitmap);
+	gpio_dev->pin_dir_bitmap = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
+	if (!gpio_dev->pin_dir_bitmap)
+		return -ENOMEM;
+
+	gc->parent = dev;
+	gc->label = dev_name(dev);
+
+	gc->set = siul2_gpio_set;
+	gc->get = siul2_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
+	gc->direction_output = siul2_gpio_dir_out;
+	gc->direction_input = siul2_gpio_dir_in;
+	gc->get_direction = siul2_gpio_get_dir;
+	gc->owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(dev, gc, gpio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to add gpiochip\n");
+
+	return 0;
+}
+
+static const struct of_device_id siul2_gpio_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2-gpio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, siul2_gpio_dt_ids);
+
+static struct platform_driver siul2_gpio_driver = {
+	.driver			= {
+		.name		= "s32g2-siul2-gpio",
+		.of_match_table = siul2_gpio_dt_ids,
+	},
+	.probe			= siul2_gpio_probe,
+};
+
+module_platform_driver(siul2_gpio_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP SIUL2 GPIO");
+MODULE_LICENSE("GPL");
-- 
2.45.2


