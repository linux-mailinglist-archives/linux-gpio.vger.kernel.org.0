Return-Path: <linux-gpio+bounces-19371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6867FA9E61B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6C4C7AB857
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1952D1B414A;
	Mon, 28 Apr 2025 02:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xkNyWM/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683E1ACED2;
	Mon, 28 Apr 2025 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806255; cv=fail; b=rry26fcP+8mTvwuhQ7L19ABqHFxx+CVmcf11x9jSQCQCM5PFGIX8Fiw8CX3HDrL/249binHXuuAeJyCnlydOFSsHUSG1tEEdvMFDLvgqPR0U4dCX9aKxuw11IB0GDhqv4NxfyWPgv/5P0VOwKjfdBEHqzn9llYB3x2iP4NV+GQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806255; c=relaxed/simple;
	bh=loGsb8BxVV8cN59KlSXd4XjQDzgQcKtScg539R8bxEM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n4D62gU4ucSrMG6aySa0+sPniKkjl0jj3LfrsK61G9oUcRBkPJUefzLlo6JljIPIPoenN8Hhq3Xw2r92aCKP0N9tH9h8KWp83PPB3XSE94Aee+RFEDeL0b+pG6ZfONGiedFx55IU94gazuI7i7d/hvwsR+8MmO+L+6PCU4hsaXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xkNyWM/x; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/vjB2Pu6RBi5DTvyymEzNYCyk+ZOFaAfIG6ZxKu6AoVbLkPignM58rC2x9vxOYHpGEPhVsW5Fc/HT6WRCEMS06osXIHyoCg7tnuQtwM6ISpckbgkdyQBcMR6USoxnVSQ93ofCvO78lk25hpSuvlEVpT9UYck537ayjzlxys8YUoas03RzH60ZeW0vw3PMSIQqUOcHeuUp/K+zWfSasJbcPDz1hs4ts5UNBQ1yhOU/o70os6MUZRl+kysbTEdspKhVDOZ4MQZ7G6KgWcaB568JHfobdmU/jVBkcXb3Nl1YH/wKS4JW9mUA39yFM8OHoFAcxaNdDNRYDuQ1PbERkmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6VsyhUjYzbIhuCFZYke3WjMogqPQM7yhWcLNVJYzbQ=;
 b=wp8sGs9WTrdu+NPfNFTQcet8DX25ZnySNSfao/9msX7lz5KS9EZc4KWwrNKe5+lcQMTIKu8YFx0bT6Edr4RsQ14GMRpHog6Zt5mtf8HbRQxrFpeOXvihOM68X9RRjKmnY3A4u9dVV6DFe4bk62HFNMVhAe3ZFC20Sx+3VXEH8H91W38+MMym0cvJJQIaFQKnhaC4QZwYz9bKq3Zg+fcYO+DujITmhySFhGhm/GUXlCzoNPOg7c3OFH4CtNPn68HvRTALX9e2LRN2eYqQbGdSXv65PiUPHYPHGjSTRlGcVkr6LNevplmecNtXdea/Y2EjfEZk95t2GHg/7B58I2RLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6VsyhUjYzbIhuCFZYke3WjMogqPQM7yhWcLNVJYzbQ=;
 b=xkNyWM/xm29F9N6EjT50uMmLU8CEfezZ/9jcjh1QkfXBqFB4YB0qQTbUXqVPdzWqOt2FgxhOy+aIm2ayN/8A2jOZSeSDMsf44IsB1UOqbmWzgUo24xa1tFP5If0y/jv4puJpYcfXAIwR9Uw3Kf8LCtsuXpCuIjlQqkPLHnZLSTGjhw1qwUmDt8KQd0FrPyCK1o/OioOjgMFh5f3YtjUMlplNQSSWs8Q5LoFytxEfcufqoWYLkhpbIe4yaAr/m0ySOZtm+5gDm00y2P8S0q1s/dKC9BqK+wMjdYMiKvlfI21VWsBxHKXDXtZdo81hIJe+fjfv+lSZ2/VBxnCnUsKnOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:07 +0800
Subject: [PATCH v2 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-6-e8056313968f@nxp.com>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=3281;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EJwDsMlb68b2TeHr3o9byLSOgFkhPb3M5yScw8I2Ms4=;
 b=44NBwoEw3OdRZM0ZQG8eWh4/Ncm8c1OyKmYn6GsLcz1LDISbMh9gpRwuch9/fr3z0XPxG2p5+
 TuitkL1gz1vBAdO/PsUYQ4KbM61Kjc+BdEaTdktpfmxRvYimf4FppFh
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
X-MS-Office365-Filtering-Correlation-Id: 622d717f-a046-44fb-f7b7-08dd85f9e683
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UllmNUptYytKcXFxc3R6S2hNcWpxV0ZwNlRUaWdNcmxWOEg5YUVPcXNTQ2NE?=
 =?utf-8?B?dHBiV2RVcTVNeC9JV3VSQlVJY2hCWXFlaUtCU2tra0ZqbElkZWtWcE1sTVYy?=
 =?utf-8?B?UzdpWTBjTEVhMG9XYXZCcDIrazdmb2RBQWpEcEtWUHpobDZzSUJwbmQ3VUgz?=
 =?utf-8?B?UVJSWjVTTkthbTdUVXlBYXhrRlZZZVQrQ1hHOUVYR1ZlazZkQTFMaFhIUjJm?=
 =?utf-8?B?TWRDbSt0SlF0MDdlN1ZDYVM5RkhMdmI4bk1IajlkL3pUeVUxZk1Jd2QzRFpx?=
 =?utf-8?B?SHFoUG85NHdOYWN0UHRmdFFKdUdibWd1b0s2U0UvY3RyZFRHN2gwanlPMG1G?=
 =?utf-8?B?SGN3NlB3RFh2VkZvSnhRQzRFYklXVi9UTzhaTlhEc2VsYTQraFh3Zk9UN25S?=
 =?utf-8?B?a3BFcHRFZjN6MGRDbFhheTN2YTEwTjZOTUl3OHJGMEIyalhLSjdWcS9WWE15?=
 =?utf-8?B?Wm8yUHUrTmFlT0J0S0tNeWtZR0lpTmZWZnZScU95TE1md3Fwei9Bbm9sZG5n?=
 =?utf-8?B?VjhGbmp2c0h3ZWxRY2xLZnlJRitYbHFkZmFiTWNlZ0RCOCtWTmQrZ0VWSldz?=
 =?utf-8?B?Ti9UVmNTZkgzcVhOU2wrV2M0UzRRNUhnUmk2UzdqcDAvOSt3RUhuVElMZHVT?=
 =?utf-8?B?Rm1VWTJVbkZjZ3BBWE9xdDRwTldzaExncFJ2azVlZ2l0Yms5MVVwcnNaVERv?=
 =?utf-8?B?QmYyQzZ3RTl3anU3a0pSRXBrRGhSdXRpRTlVbVc0T1hGVjhwclRaZk45b1dK?=
 =?utf-8?B?UWUzY0tiS0hCdGRyQXlDUnZ2K0NzYUxYVEJmS3VBd2ZSTGczVjBnQnoyUVV0?=
 =?utf-8?B?NFR5eUt2RVYreXN0dXp4UFVwSUZZN2RWR0pVZGIrYVEzMXMwRXFvWGJlUG9o?=
 =?utf-8?B?ZExUdDdWcStLN09UV3JRTjdrMXdqQlZ5bldUaUk1cUJYQkxxR2RvNnFkMUJR?=
 =?utf-8?B?UVV0OUdObXBrUGxxV2ZUM2FoYy80Qnk2L01UdVJFcE9hTnh4QUdjL2FFV1VG?=
 =?utf-8?B?VExnRERzdjJtazVsUTVaQUV4OS9IK1ExcmFZVGZUMnBQZjRoRE1HWXk3cUpT?=
 =?utf-8?B?Y3RNaVJqczlQb0cxTEQ1SlFsSmNnZndLRUNXQ0t0R08weDNDWWN1TkRST0Jj?=
 =?utf-8?B?OWNUQUd0Qys1NXNhd0hnYnVaVUN3aTM5QUZ2S0pMRGZheGtES3ZjWTZNcWN0?=
 =?utf-8?B?b2ZhQnJDaGM3LzRUVmhxdlZ4TUViMGorZ0pXT2NUSmlvZHlyQldQMkFick4x?=
 =?utf-8?B?VWkxa2l6a1Y3UmhteEtsVDl6ZjBadzRqZkF0YXlMTzAwc1ZWbFlFTzlSSEla?=
 =?utf-8?B?blMxbi9OSnlHbnZ2R2RyVm5XTGo5dGZkMCtrNkhMVitiTS9KQjJlbytrNmxL?=
 =?utf-8?B?L2IwVFJiQzFhK2V3dld6eW1GR04yK2cxNGRrRlc5OGV5eW9nUlFzUVRpUXlU?=
 =?utf-8?B?dHdXbHUvNXJ3ZFJzL3dIclMwbjBXY0t3TlZNUTQ4Z1IvZ2JLeDhNQ1owTUhC?=
 =?utf-8?B?WUJMUVJnK0NlbmROK0duVU9iL0JFSnA3TDdXS1BPblVqTjhVSERiZW5PQlRI?=
 =?utf-8?B?UkU3ZVZkRjZFNDMrT2R5azd2ZnJRc0ZDSGJETzdIdHhYTTFhdU54Wll3VDVK?=
 =?utf-8?B?M2VGM2VTNlVOVmVjZjZKV1M4L3Y4bHJEcG5wMW16WG1nZjN0UWpsWlFqUFVR?=
 =?utf-8?B?bXcvQjNBeWNBck1GK21mdzFaTzRhWmVOV1hZZWtWSGJpQ3ZHK1IvZUJJeWZX?=
 =?utf-8?B?NlFvMG1PdXp4M2RiZHNlcG1aaDlVRkRaWkNrRnYwWFRycFJLYjY5U1FEZDBk?=
 =?utf-8?B?OWNBb3I5M0ZJb2s3VytRZlRhOXBGUHhFUHhkSUJGc1NkSk93NUpPc0x4aTRz?=
 =?utf-8?B?dHZ3QUxvNmJVckVrK2lRTTdQZXpOOWJJa09kMGRzemhCU25lZEczWW8rbjdP?=
 =?utf-8?B?OXUzM241Vlo0aTJsZmI5K1QycmdBeTBxcWthdGlLdlZteE9jYXpwZkdsVVBH?=
 =?utf-8?B?ZlY2cEtwTzlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWx3Umt0eFp1VXc1N3pPWG1zQ3pYeE8xUTlVTFFrNzNIUytpM3NMMjdGUjFD?=
 =?utf-8?B?QjB6cUIxQWZuNmRNNmxDMWJwMnFIdkpQUlM4aUZvWGJ4WmZTMkFBcGJkbE15?=
 =?utf-8?B?TitTUlBiTnEwU2NZMHkwNFljNlBoZlk5Z0NmOWRtMEliSm0rY2x5dE1panhy?=
 =?utf-8?B?elBXcFVOTDF0czFqSTZqQ0ZNc21vSzFNR29PcnlJamQ1V3lYeGo1WG52WFFy?=
 =?utf-8?B?THJkZjQzeG9aMGtkTThjQ3lNN29aSGhDVFg3UmlRcjc4NzYyRXUxQ2k2MSsv?=
 =?utf-8?B?NnljVG9hN25Ta1MvTU1QZzJreTBycUVZMnQvZWRoTGU4ZHVpRXRjSlhTRys5?=
 =?utf-8?B?L0lMdlBhN2htZkU0TXZvMnM0UUV4T09vUVRRQWJCYlRzamdKVUpOTERGcmFz?=
 =?utf-8?B?NHk2dng1ejBVNEpNSVdpNDV1YnZCdG9oWjM1WEdHa0FWQkhLdXErMzJCZk80?=
 =?utf-8?B?dzRMMlVSTlZwWkZRUHdDTWtOcy9zRHA2Tm1xaGVoWCtXTS9YclpXamc4TmNV?=
 =?utf-8?B?TUt3djl2MDE2ME5nTVp0MmwxQnNxbXA5WUpyNW05Y2E1NkZROUlPbGcrYTEz?=
 =?utf-8?B?eFVTT2dsbFpFRHZCa3VoV1g5TFBUOVFSbCt0SnFqY3lHRXB1Mll4Q25tdzhC?=
 =?utf-8?B?WGpKa1dzbEhaSjhLNjlzWVVnUWxRQlVlSGtkTDh2WEtUTmN6Mm9xdGZXM3NG?=
 =?utf-8?B?RGtqUXJjcCtxalQrcEVYRWZDS3hNY2NySUUrYWk4RFJ4U1IvLzVRRG9zSXpB?=
 =?utf-8?B?TkRZYUV0dmFqaFVLbnNlWDJ4NXVMM1l2ZkZmNDBNTGxXcy9XQUwvUGJwOUts?=
 =?utf-8?B?OHVDS1pqdWNZdExOU0QrSUV4dklnR1JzaVhsWllqZGQ1V21ibDlBdG5jekxT?=
 =?utf-8?B?U0JqMzlnMGxSQTB1aE01akVySUIzWVJBVEVTc1JxL3VGdWp6RW5HZXc3R2xm?=
 =?utf-8?B?VWx2eVErSC95NlBnQVNUUkNhenZkYkdXbm4yb2xES1JKN2VycWFZc2d1dExq?=
 =?utf-8?B?NHh4SVZsall0ZDBYbThmTitpWXlTTmRjTXRqWkNLc296SkRhUFhidDh0Q1dU?=
 =?utf-8?B?MTF5VTZVeEc0MVpNL2g0dlN5TGpseTkwVkZyWEFLTS8wZ3NKV1VKVmNpQ0VD?=
 =?utf-8?B?Mi9ocVFwRDZIU1I3WHJMK1d2Q1JUQmFNVC83VWdUTnlVN09qcS9mMnZjWDAx?=
 =?utf-8?B?bUswQUdGOFVkWllTazZSeDlxNHFHSXNMVFhxbm01WVRDTDZqY0ZzaGU1NnVY?=
 =?utf-8?B?WDJSazhiVFk1Z1Evc29KUTBBd3YyR1YrQjlVc05Cam80TFBRTi83b3B6cERa?=
 =?utf-8?B?ZkpERXJTQXEzdzFMUnFzbnZBM0VRUWNmOWljSXAwcUxBOGFTc2lQaXVwTGtR?=
 =?utf-8?B?dXcwNVQ4YXZyellpZGZCR3VYMVNkOU04NkZBUTVhYWp0UHFYeFAwQysvSGNU?=
 =?utf-8?B?NUMwUkVhYlNvTWQ1L2RZSEN5cXdlc3JUS3R4UzVjQ2xwdWFpSXI2Y0xRV3dv?=
 =?utf-8?B?RDNYRGpGcXVYSmttcU43YWVubDZXSXd5aHFKWmZSVEpJa0ROUDBFa2xRM29q?=
 =?utf-8?B?MlEvTWlJMEJ5ZHl1NFJlVVJrbE53NG8xV2xVUmM5NytOYUl1dCtObkU3VVpa?=
 =?utf-8?B?Y0VGRjVVTEEwTVZ0eGFIV1hnY202YUIvclROK1lEYmtKd0grNExsQkhqTWgr?=
 =?utf-8?B?NDJlc2JWOHFkRXpad1dLTVgrbVJseE5IKzg5a3NnWFo0RXBmazhISWlOcVhh?=
 =?utf-8?B?SW5oWmliaTk2OTFoZGlRNnEyQ0dTMDlnajcyckxFcUgrbm1jWjRZS3oxYVFo?=
 =?utf-8?B?YTJwcGJZNGd5aHRzdlBxK3J4dXZvV2NHSVNqNVBwaXNiMENRd2VBRHJFT1JI?=
 =?utf-8?B?UzlneWdocTJIM1BLcUk3bWdNYk53b3QwUGk3OStCaXB0NDdqaExSWFdWdFVO?=
 =?utf-8?B?QjZZeE92Ym1JQmpuVWI4MFNMSTlNbyt0OHdiNktHc1dnSjhNalo2emo2b1Y4?=
 =?utf-8?B?b1YxNWxPdGNHVXF4amdqeVlsU3MvYktTczVIV1FUMFNJT1BwNis3RzE1TWE4?=
 =?utf-8?B?R0hSWDlLU1RQS2VsRGRhZm5qVFhjUTY0MzErZENKL0VvckwvWnJaVlo3aVF0?=
 =?utf-8?Q?aA7HikpxKbfqyXy2hUB2jjp22?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622d717f-a046-44fb-f7b7-08dd85f9e683
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:51.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0x3JR78wYJADY8TIucCnkMKtqvfBki9AJec5+ibrMTcZ7/7C9FInD/ttnQep3RlZEhf3nKBlxsaq99zidd3cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

Checking the current driver using legacy GPIO API, the
reset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, Hold RESET LOW (active) until all the power
supply rails have risen to greater than or equal to the minimum
recommended operating voltages.

Since the driver has been here for quite long time and no complain on
the reset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
no in-tree DTS has the device, so all should be fine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l73.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index c09c23487d2e73340b8947ed0e1ffadb24414e7c..535a867f9f2a6d32986190c4302dfeb1e9f06913 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -9,12 +9,12 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -30,7 +30,7 @@
 
 struct cs42l73_platform_data {
 	/* RST GPIO */
-	unsigned int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	unsigned int chgfreq;
 	int jack_detection;
 	unsigned int mclk_freq;
@@ -1307,23 +1307,19 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 		if (of_property_read_u32(i2c_client->dev.of_node, "chgfreq", &val32) >= 0)
 			pdata->chgfreq = val32;
 	}
-	pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node, "reset-gpio", 0);
+	pdata->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev, "reset", GPIOD_OUT_LOW);
+
+	if (IS_ERR(pdata->reset_gpio))
+		return PTR_ERR(pdata->reset_gpio);
+
+	gpiod_set_consumer_name(pdata->reset_gpio, "CS42L73 /RST");
 	cs42l73->pdata = *pdata;
 
 	i2c_set_clientdata(i2c_client, cs42l73);
 
 	if (cs42l73->pdata.reset_gpio) {
-		ret = devm_gpio_request_one(&i2c_client->dev,
-					    cs42l73->pdata.reset_gpio,
-					    GPIOF_OUT_INIT_HIGH,
-					    "CS42L73 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
-				cs42l73->pdata.reset_gpio, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
-		gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
 	}
 
 	/* initialize codec */
@@ -1360,7 +1356,7 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 	return 0;
 
 err_reset:
-	gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
+	gpiod_set_value_cansleep(cs42l73->pdata.reset_gpio, 1);
 
 	return ret;
 }

-- 
2.37.1


