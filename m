Return-Path: <linux-gpio+bounces-19365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9FA9E611
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD76189A824
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A5415747D;
	Mon, 28 Apr 2025 02:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NXdb0qLs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4F2BD04;
	Mon, 28 Apr 2025 02:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806231; cv=fail; b=YdOdh+oMXcFvXR6sErDF0SK7TW2qaserDGClQLFOlwP+c9Kq7uVVpFrpYXlsUIBSuMhSPnOOSAWBsnkhrRnch5uKwgWmP8r4dwPtmPj5G14gXVplNuPCw/MusZyQJB05dTqM5o6oPmLppCMSjiUAq8L2vvqwT6Flnmp8gSYonSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806231; c=relaxed/simple;
	bh=xzp+YkAHlr97RfY9HErnQCmf4zde+nKRXLd4z+cN7KU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=cbi0MgpaUE+VzlVMieMZEDyo4t3l/WUqEi6743wpwFs2Ph/aTUk5+y+y/rkce5sM1Q+EyJlx5fb9sHRbMlCW2ZOXxaIGyQbfgHle/BeX1BMPKici/w5iWWezzbK08tiYxEkURzfW5X9/tCyczXeDG7gX9V6SQ08ZkL83mW5J37A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NXdb0qLs; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Geg9RsPMtEdfgGBp9dvwXzVb+aB6umvrdg8AYfmeUC6ygtpb9zp2IFgTSpEN7EBvHZHHBgX2WdgCrLPciimwI9apmY+/hD4FASI9ydIIOWx9Fk/kbU0ti4Hmmn7Q8rAFcr9jyIqrXRF+WArx9yrz/RVmQKi+Nul5gk1fVARXLq0I7CRqd5c8n2GLOmB2fD2Z2Fik6ZV+GtkVI2eSc0kB8mpIchxml70cTE98/HZVzNnAgW4yzwL1AJop+16+6Z5HDSR0q9pGG/QlarrBlKUyluwJ/iNYIx6dQInr9J2q7c0FkVhg5HUHj51dpq2fOUPsV6JaqJRwsRybXNueClNb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viKpMBS2i+rv4PVXokWkoREdTpAS4EikdG28vmOfLd8=;
 b=STFVRaK/dtrt4jdVS6Ji2E0NA0Q5l7Rlvl6vgxcXIoEZU+XT40DiIpvaMVKWg1oUP+zGdA13Mtbe9fLIlk9oil5NzFv2ePQdD2jY39JvaSuEQAPXc66F9R0bifDE6ECOC33eIr//5jQk5QhzOWsaVXpvu79nxNne84nRwumcPysXhCscdz7/hLRR/ctztNy3k+BDHT5Ij5wTrrgeB10wAsOSrqoLT9oXSrgldbbqJ+zP50g72ULxLQph1EOYQdNs9T2IhySO+HfsflviCWbckLOASWzUSfyLYSjHTOortgDDvv+4HyJgCX028hWVsDWDFkHm7gmnqwL9ZJUNNkk5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viKpMBS2i+rv4PVXokWkoREdTpAS4EikdG28vmOfLd8=;
 b=NXdb0qLsWjDEmbvhMdwiGr3XSNoIAimUPB2YUtP6fl7nbcCgKOQ1a9eDutAZ3DLcxqBjq3Z7qZQhJIz3XSe2Mc+TANDe6Brl7NKFtlaGh4FW1YBozLwOTsIS9pvjeexRKsqFnNsaGpJR6qhS4izsaZ4pg0a4qEFcBJ0d2eKNX1fs7UArdJxC1mrl53LgJITctT/4gojy2fGWKnduoAd46vjn7euRMY3Cs5wFR5jSsroR4+c93W/2EdRgTQqDFnKm+XnJG1jW6Sjt9b3V8Zl3V7e5pDleE88pz+dAMG2AVnBG13tILZuyuTnjLz5PnM+17sK1XCJtLaSyUZqRyELKEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/9] ASoC: codec: cs42l[56,73,52]: Convert to GPIO
 descriptors
Date: Mon, 28 Apr 2025 10:09:01 +0800
Message-Id: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3jDmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNz3eTiHBOjCl0DQ1NDcwuTREMjYwMloOKCotS0zAqwQdGxtbUAMky
 L9FgAAAA=
X-Change-ID: 20250427-csl42x-0151784a1230
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=1745;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=xzp+YkAHlr97RfY9HErnQCmf4zde+nKRXLd4z+cN7KU=;
 b=LHzGEVjV4/aZLkMv643b8QcHkzJBmrKAfL5vlp+UK+ZToC0LiixzRTfPoHu0ILnVILiG2tcjm
 iU0kyft4oQlDQp7TntFwKDL+E48KVUrqQHxTx41eI0E8YzftA90ARSH
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1533c825-cca8-4b69-820e-08dd85f9d610
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnU1VnduNS95TFc5T0RscWRJcXVwdEJrSmNTZWxwMEVNMXh2cE5YZnFZOXpL?=
 =?utf-8?B?cXpnbzExNGRzbmhueXMvSFVueThPZ0I4WVRYT0RDUUsxMTVRcE55ZTFFR2pI?=
 =?utf-8?B?VjMyM0doRStIN2FBMVBhMURwTzhOczgyMGc0Q0tiejNpNVpNR1A3Zm4yUHhu?=
 =?utf-8?B?bjBQQU5mQVJPN2lESFViNElXKzQzV2F4RG1DZEpQdXdjR2lEVFViOC9FbHk3?=
 =?utf-8?B?UXJtRWxKVno2eXlTNFNsWU5hUHR6WFJCcW5MK0RUQ1lYR3JhVk8wS3Q0NXpm?=
 =?utf-8?B?RXhwWG12a0ZhRUs4TmlIUzRUY0MzUm12THFyWnd1YUo5Uk1vMjh3SGhralpF?=
 =?utf-8?B?azk3UjBwV1RqbzJpQWZVekNBUWxVQU1JR2MvSE9rVWVMb3JPL2l3cnlHVlNH?=
 =?utf-8?B?YzFXdzg1RnExVnVnM3preVVaVHRUVFdCQTJWWTkzUHFvMTE3bEdycVdnVStr?=
 =?utf-8?B?Vks1SHpVUFNxakw0ODBJMU5lQjZGamo1MlFpNnowNmg3UzhnTllXVmlPbDRB?=
 =?utf-8?B?VFJSZzV3N2N0M2lYL3FrdXFmdlVhRlEwaWxUT3g3RGNDdVZOWE5KNlA3WVZE?=
 =?utf-8?B?ak9xQ0kyVDV5WklQRFpNaDVVbmEvOFJRQWNpU1p6dUJ2akZrUnlKTnQvRHRl?=
 =?utf-8?B?SU9vY3RnWEVCMkhNODg0NkRpZnBvMHdGUVMrelN2NjBMOXVlK0hBbFFkTXlP?=
 =?utf-8?B?OWpPdUtYN2U1QXp4ajRtYkE1MTRpTFB3eDZ2NGJqd3E1N2RBUUVyWjNibDRZ?=
 =?utf-8?B?eXV4UkRRMTNtSXJnY2xONEk2MGVoL1IzVGl5YVpzNlovdUVWK0JFUDlNaG5P?=
 =?utf-8?B?SmMzV3VDaEZIQnVmTktVQnBtQ3VjdHM4L21ncUtrQVFMOVIzNWJlK2cvMnZU?=
 =?utf-8?B?ZnBPVElhbWplTjJFY1F5WGVXd2RvSWVSaUxTSVl0UG1JVHVqejJDSnNKdExD?=
 =?utf-8?B?bE51YmxIYS9UMmI0d1lwTUY4aWRZY1plVjFkMnNCZE1VT0cvM3NoNkhDOTJh?=
 =?utf-8?B?dnVuNmxWU0NjZkxBUjRhR25mekEwenM0R0lwRS9EMHZTVmhsdnlURTVEVzIv?=
 =?utf-8?B?dVdQY0Q2SzlVSm9ydzhJNkZuQ2swVG1WZXBkQzhJVTQ0eU9wZUJBdFZLNTk4?=
 =?utf-8?B?TDBWUWE3K0RpTjQxK2swMHNndVl4MXo2Z1hNVmszNlZDa2NDSjN1UEUxcXJE?=
 =?utf-8?B?RWVxQ0NsTno2QnlnRDRYc2tQSzBWY2MxTzZGTmllTklRMThrL0k5ejZ1YTEw?=
 =?utf-8?B?ZnhocXhxTmNEV3VXM2ZETlFpRjJhTnJjclhWdDErOHc5bGM0cDUyMlVZdEFP?=
 =?utf-8?B?T1NmRmlWcjY0ZEtqbTV3Vjl2RS8zL2lNeWxrSkpSSWVmUHR6N1AwdXlwQ3c1?=
 =?utf-8?B?bmpMUjRzNnY4Y0x0djJuQ3FFaXNBemtoa3cwNStLS3k1elRUNW9ITmRSRGVO?=
 =?utf-8?B?VjYxT25KT2JyUGliTUxQcTFOclR2Qk4zc0FBQVBFbm4zUW84dHVKL1J6R0Q5?=
 =?utf-8?B?MURkWHd4WXN0U3ZGZGloNTQ1SE44QkhxZlNwdHhzRllzY3FYdWJkdGlxZ3pN?=
 =?utf-8?B?K0puSXpCdmd1RElJdXBNZ0twUnNNWFBwUmhMWm9PbSt2TXZ0aUR5azhZTWdF?=
 =?utf-8?B?RCt0U05pNDNhYjdpd21ENkc1eHhkaDFYNWtvSEFtQjFrMm4yVXNHQWZKQ1BX?=
 =?utf-8?B?VVY1Y2ZlOXNRUlQvRm1LQzcyRGxYMS93MklFVU5XWkJrSFB0YWxpYzAzN0ds?=
 =?utf-8?B?Mk4zRXlIM29OMTJhZWYwQkZCZlFTZW1SOUp4QmV5TXdadFRQZUV2dGpsNE5k?=
 =?utf-8?B?Q0JBd1JkeWlLTldrL01DMW0xa2lBWTQ4dEpHMUwvR25zWUpHbmlieW5HemlS?=
 =?utf-8?B?RmluUzIyY0ViNlZWOHBHaFN4QXpsYzFuUGpaRjZaWWZNTDdTZXEwcE13WlBy?=
 =?utf-8?B?UWRUUHE4ZUlDZDViYzFuaVI5ZFhpTTJyS1d4S0Y1RDRnK1FkcWhOSHg5NWY0?=
 =?utf-8?Q?EsMewPxK6zZAwEJIeiy4PT9Rx/A6Ic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE5WeFY5akdRTEtSVnNOSmFHR3poUG1vYkpnbDZ5NXYrRWt6ODBMaDdrb2Nz?=
 =?utf-8?B?OHJjY1N5MmsvRGdwUG5abHQ3bnluUCtOVmpiQndyZGpGRTVRUUJITE5oUk1t?=
 =?utf-8?B?aFFJaHl1QWpQWnF2SXBsRmFVOTN6L2NhN1daNWFDbzQzVTgwc2dtelhleUVN?=
 =?utf-8?B?MEFSdVVseHo3WTV6Z0RLVlMxMWVLNkxQMnI3NUZTekYzQ0JlTWhvUFAxYm4y?=
 =?utf-8?B?QVNzbXQ4d3hQYzdqMGppZzBRMzlYT2hEZHJZV0habVV3ZktHcVIxR3Y3NWlQ?=
 =?utf-8?B?MTJXNEg2YmQrNklaZVpTU1JJNlpZNWJSY0hBZFIzWWdWcnNZbndBMFdNVGl6?=
 =?utf-8?B?UUdRRVl0YTlQUTJESlNmZmU3UHAxL1IzQ3g5YW0xSzhiRDNma1BocWdMbUVP?=
 =?utf-8?B?V05adDRaUitHVGQ4VlAxdURvRTAyQTh4WU1XaGdySU5Ra0pzcHJ4bTN2VDVp?=
 =?utf-8?B?UXExVWhMeHJuWGdobkczem9McVVyQWNCYmJWNWFTVVBWeDQrUVB0S3BvSk9P?=
 =?utf-8?B?OFBRVUJKbU93RlBRSkdPWnpMTzNtb3U2aDdlajcvV0kzeUZFdVk2Y2hFdjZh?=
 =?utf-8?B?Zld0YVIwc2diQlVtMGh4K3FZRENJRkx5WGtGNE1QOEVhemd0bjcrTHl4RWFQ?=
 =?utf-8?B?T3J5ZnI5K2wyNGc1YUZ4bFpWMWRYN2ZBeW8rU3RRZlZPMnlRMXBrZzRXTmpy?=
 =?utf-8?B?QTZadWMwY1FJVnJQU2dSTnhEYzFFWHE4T1h6Qzg3eGxjc0hqK0t1MzdsSTRM?=
 =?utf-8?B?NFNLQkN5VEZ2TkovZk1MYVIzRDZyeVMxVlVDa1RWdXRrUFVnZFl4ajZCTWVW?=
 =?utf-8?B?ZWsvb3JZclZZb2Fad2lWWlhuYnl1T3NJazBjUWZXYWtpU3E5cGVzTnJBbGJj?=
 =?utf-8?B?bVUxb3dVNUlnQVVVbS9FQUVRcTI3Z0RSSndEaTEzMlQ4U0tLdjJiZmJMUlBp?=
 =?utf-8?B?MWpUWDdDOU4rSDIwNUNydm0zT2I2TjZpd2Nnb0tLODJVN0lWUmRiSEpTVkFV?=
 =?utf-8?B?MXRKNmJaVmhtQ1UxUjliTlFNZmpnVjhPTDhQWmJNSjRVMTZwT2FhSHN6T2p2?=
 =?utf-8?B?S3dzNDFHa0k5ZmlucmRtQktwaEtpUlVDRU54Q3NqUFBicjR3VHJrZXNjWlNm?=
 =?utf-8?B?MG8zT1AzT1oxVXlHRDNMcitkbnBXdjdBL3U1ZlJvYjhCeXZ6Yjl6dUxaUjdX?=
 =?utf-8?B?ZWFvVGwrMVpwUUNwNW0wZVRaaytTYWNGbHM0VHRSQ0pBd1k2RXMxV2FBVFAy?=
 =?utf-8?B?dldyNDMwRGxnYitIbUtNSC9FWnZ0TGRzM2MzL1Z1U0hTankycXd3bmtnbVlM?=
 =?utf-8?B?R3YxSTJMNHkxUExZaVNnWHMyM2xrQ2V5azZLOHVqRTRWenhmd0QyZlU4akhy?=
 =?utf-8?B?UUZWWXIxSnBLaDhaSGZPd1RXK3JuY0dkdHRrMnJSSFFRMEg2R2tnMUJwYnhC?=
 =?utf-8?B?SlAxN2dka1dhM0tCRkhLaXFpUXhIMzBtN1RRajlBQ0R4bkVYMm82U1U1cktw?=
 =?utf-8?B?NDh2MzZXVi92V2c0OWpOM2huRjR6VGVMVTlJVjh4cmZZRkpGd0pSbVI3dEVZ?=
 =?utf-8?B?TGRBWFVaZ0tPY2pVWUU3N2ljaDBxa1l2RDZtV015SWRQL3N2ZEpPeHhoR0k4?=
 =?utf-8?B?ZWZaWUo1YmJEQ1ZpeTR5dTRBMVh3TktCbkhQT1B1a3RtemZjenVWclBwR3R2?=
 =?utf-8?B?ZTB2TG81dkw4TkpUL3VFdC9MNzVhS2daUXJKTXU3aWRKM2xKRmZEOEZvVER6?=
 =?utf-8?B?Q2ZQaEpDT0U4K3NjUzZiRkpiV0JkT2RqQ0JnaFJ6K2FGSndLcllSZ1RZOTF6?=
 =?utf-8?B?c3M0ekE1QXRDd3NDNElHSDR4L21FYVZQeFdFVFVrbkJheU9ObEd1aHhGY29l?=
 =?utf-8?B?S3NaazFIcDBsYU5ud2VjOVc5WGR2ekZDc1lJR0cySGF4UHRWRmZSaWc1OFZx?=
 =?utf-8?B?cVpiZCtFNC9QMlV0ZkdNejdlejN0dEFzUzllUGdTUWJVZ2NSR1ZQaGJBd3dB?=
 =?utf-8?B?OStSVXN2ZG1FVTNxZ01RT3NQbnd0cnhVTFlaN3FOTjB5b083MldWZ0FoaE9v?=
 =?utf-8?B?L3BudEhXL2VIMG84OFQ4QXd5MUl2REtmZVdQQi9wTTZIb0czbmtHcUpFSE5Q?=
 =?utf-8?Q?Brmv3DoGeUtCWLEsVGLXteoB5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1533c825-cca8-4b69-820e-08dd85f9d610
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:24.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApVXliygKtyH7j81IDsVKwQyurR9a5erdRNOIYMq00KyeCwrJCjGflorYo/HbQXQeNWh1QlYLhqY+NAARdZsqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

This patchset is separate from [1], and not merging changes in one
patch. So separate changes into three patches for each chip.
- sort headers
- Drop legacy platform support
- Convert to GPIO descriptors

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

I not have platforms to test, just do the patches with my best efforts,
and make build pass.

[1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (9):
      ASoC: codec: cs42l56: Sort headers alphabetically
      ASoC: codec: cs42l56: Drop cs42l56.h
      ASoC: codec: cs42l56: Convert to GPIO descriptors
      ASoC: codec: cs42l73: Sort headers alphabetically
      ASoC: codec: cs42l73: Drop cs42l73.h
      ASoC: codec: cs42l73: Convert to GPIO descriptors
      ASoC: codec: cs42l52: Sort headers alphabetically
      ASoC: codec: cs42l52: Drop cs42l52.h
      ASoC: codec: cs42l52: Convert to GPIO descriptors

 include/sound/cs42l52.h    |  29 ------------
 include/sound/cs42l56.h    |  45 ------------------
 include/sound/cs42l73.h    |  19 --------
 sound/soc/codecs/cs42l52.c | 112 ++++++++++++++++++++++++---------------------
 sound/soc/codecs/cs42l56.c |  90 ++++++++++++++++++++++--------------
 sound/soc/codecs/cs42l73.c |  70 +++++++++++++---------------
 6 files changed, 150 insertions(+), 215 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250427-csl42x-0151784a1230

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


