Return-Path: <linux-gpio+bounces-17896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D45EBA6D57D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62ECA188C7C7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 07:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C652B25A2BC;
	Mon, 24 Mar 2025 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LHAZGm3w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18913B797;
	Mon, 24 Mar 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802816; cv=fail; b=Y1aRM2h7cO08PIBZVYPzH/SrO6rNyM7lSm+Eza57Xi8tbgf4hku0whyqSvqEQuYnRS9SK7coWGSldGHlLE/ByRootCzcfK+cMn6IqMpfSh2Cg2BkVWXb+uPjejwhBo4y4mr+twXA5zE+idHce4lJnQOKGIlKY5XldEHDCD4C2LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802816; c=relaxed/simple;
	bh=1zPVQbMO+vgm0/76+Th59b7IiqjHJ2sWmRGTjSI8HcE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EbpnHBrOAZiKYb3d/ujbqCBH0Y0H23QDdwSvrgKNfhV+mO0VaFrpbBDthkN1jzM02S2mpsoCBKxV1Wy1ZVD/loGdazNwMtsZhJnz3qtJ0swqOnL6kPayYjHY0RmSxhXyceRL6kdwPwerz9i8RyRrv4gNwwxMBKPz1wkVsRNC9pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LHAZGm3w; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLEJcXUCnNwPLGCTsGGk/K7YZPev4OZM39En/8qISiA0rDAPn3U7XNX8EODN966vugHBlkpIXpiGEOodhqeGpl+lEMNsRA1zfzv1qvAk9crFVH4igDFPUBvTpRjyyHagHgl3JCwyv90kBkuHWSuSZdZ1pVDDt2iy8gAUjdsr+EB4+EXckszcM17fEQMVy5Qy/3DjXrCmFjch2SeuQuS5an0/ULIDiJ+8PLyUG0WLwcCoyd8Y2DYclLvYWnbVrVx5RYJw3JOlEHZl2mUnVbP1G9rVEpwgVAIqK3HKkSAFnlooX8R5MOKFIjDaxgMCg0MBoC8LmR6dZGLIQ3C5tiCv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zPVQbMO+vgm0/76+Th59b7IiqjHJ2sWmRGTjSI8HcE=;
 b=fgNH5s2C1vIOgcpidzrr+ug0y2PXe8CVSriAIv/ZDVUhigCExagz8xhUSICbJuTTQgL9iHglVdLdLRsTT3+tM/pJm8elkG+Zmdy57KgltreQjbIKKDVfwNYlvTQZU62z0dPYt2zobQxtkgBUViOUtv3hPShUKJio8SaMcvTw7fmPaxATfToPXvjzlgr+QcIRsZgYbXi7bYCG9QRfSHucM8gSda0WElkRdxA7debLq1HiJVHyHikfY3AREhhQSxjIpAjz+7SNeY2hW+OIp4SqBkSnZz4kuiCxSki2oTmriyp0Ya037Rf3kIzBkXfjKc/rd8EEAypMRZCnBYZv2VOc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zPVQbMO+vgm0/76+Th59b7IiqjHJ2sWmRGTjSI8HcE=;
 b=LHAZGm3wZVTOsIA/zfXX46utIMpMH/S8dvKQJA9k8aXT3WCO2mubmc50tDx8hRBpt5jgeE6c7fSfNBJUL3vORgebIHD35kvRKoBBsQKV+Nbbx6dm5Krx6Zv+g3UOR8oOBpNwFyhoogZA/ws72hhCcYadATPa+yDKeZFBlg309r8eCegDCsCQGMan5XNOdH8gltUt8udOrsMn1mT1KGAe0aOX/CodSqIQ8VeP/fIAPNaywekrxRdP21pyQPkTpezE5g/7Hc8g8thHvLKC9kHFmozQKxmkj/08odOo2HvXP8E78CgqwTSLQup+3oH+hvtiVYYkOXSBqJyfqeFp/E60zw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9569.eurprd04.prod.outlook.com (2603:10a6:102:24c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 07:53:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 07:53:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Steev Klimaszewski <steev@kali.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Topic: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Thread-Index: AQHbnGRhRMwe0OLhtkis9ybXJA3l0bOBpEqAgAA//SCAAASKgIAAAJCA
Date: Mon, 24 Mar 2025 07:53:28 +0000
Message-ID:
 <PAXPR04MB845940BF9775DE957FFC6A1388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
 <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
In-Reply-To:
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB9569:EE_
x-ms-office365-filtering-correlation-id: 7b2c64d3-da7b-4acd-30e1-08dd6aa8f72b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1paN0YrUTROTWU1WlhPZkQxSkRCV1BMOUlScUJHd3JuOVo4TnhvUGRDeGhO?=
 =?utf-8?B?Q1VhZGpXeHRnQlNHM2lEZmJGbElRMkhTT2VRS3hydzlzUzJ4QlBFM204Nnk3?=
 =?utf-8?B?VlJYK3ozOWN6c1plWXpTbHZ0YStsM3p2U1k0aWw1d1V2S3V3b2dFNWZIeW1w?=
 =?utf-8?B?SFNEcEgvMytMY1FyaUdJRnIvRnRMSlBJcTJEZHhXa25VdXFiMjUyZDBPN25B?=
 =?utf-8?B?cDF6UEloRlpobDd4VndmRkI5Q1ZFSTlnSVJSVG55TVFkVVVGZU96YVpoYXZs?=
 =?utf-8?B?bFcyTmNReW1jU1hreVdSZ3hEMkhVNDVSRmxOZkNGMkVyQWN4MTJWTWJLWjk1?=
 =?utf-8?B?UjZzVTVaRWk2VkplR29jRmpiZ2NxTmRkb2NtSWRKTXZ0blhvUUVwNHlkMVdo?=
 =?utf-8?B?WjNSdDYweTlHV0l1UTg2SnU5czd1cmo4SjM5dU92RmZ4UEhTT3g0YldkRGFQ?=
 =?utf-8?B?YzdGRkgvQ0ZLTzVhbEpsakZFeVFwV2tSNUcyaFJtWElHaTZDbC9XeVRIdG45?=
 =?utf-8?B?RndFNDA3RGVDWlozNzBWWklnUUdmR2ZQL0xIY2JpZDdJcUJhdytlTmZnOGF5?=
 =?utf-8?B?SjVQL1Z0REtxaVcrUzlpRnBDVjNJTE9URnhyNG94amp2amVuVVNUN3Q5UVhH?=
 =?utf-8?B?dXVCbmlXVEMxbDVISHdzV3lkOVB3cVVwUmhQZUhxNDVaQWRxZnYrNk14Zkw5?=
 =?utf-8?B?WkQ3NmhWSmxhcGNkcnA5eXlselRRM24xeGtPRjJmZWRiZUY3eWcyYzMwTlJ4?=
 =?utf-8?B?b1NGV2ZLMkxuRVpGK1JoODcxb0xreUs3M09PVHFlVFhZSHN3VndHQ3lMQ0pV?=
 =?utf-8?B?aElDWVR4QW8yYjRXamRWUnlhN0oybUN5NWVtY2VLYVArcEVWcGZyVE5kaTlK?=
 =?utf-8?B?QXNZUEM1cUlEU0ZQOTZwOS8xYUdlbXAya0RIZ3NsWnd1S2ZYUHF3eGtRVTJI?=
 =?utf-8?B?MC9pV0hqMytiWGVIdThTTWlJNUUwUUtMK3ZCQmNHNERodllFSDJjcjBKcEtU?=
 =?utf-8?B?bG1DWFZqTFJSblR0K2MvNnhxSEZiYzV6cVBYZjRLWmM5RTVlQVZXYlA2ZDdC?=
 =?utf-8?B?ckgzZ2cyZE1BbG1iL3l4NU1jMjBZcG5NRlFRbFRFZkRiVGVMWDFVbXVSYXhR?=
 =?utf-8?B?a09oTzJSQ3VMVWlTdmZicUhWS21WditqWi9Ra3hsRmJtVDR0Z3RFcFBLaEdz?=
 =?utf-8?B?OFl2VE1xdi9HZWlpSnYxcytkUDQ1OENVRDVnaHJ1QWtlMGlkZlVuZm02cFhJ?=
 =?utf-8?B?amxlSE5OTnVvTTVoWFFqcVJmandPRzhUOUZYOGZKT3FJR1M0SXZyMVNKUzcr?=
 =?utf-8?B?bHhvTWl1RjhrbmoyZDI5dDFmSzlyWmRCY1huWk9QdTB3V1Y3NHNqb3dYWEpj?=
 =?utf-8?B?cVUrdTMxTElPTnBSYkIyWmUrcWtZVEpLbXRUZ1ZMK281TjUzMks1LzIzUjh5?=
 =?utf-8?B?MklPK2pQdlFTTWNoSEMwQlM0eGhwVVoxQ3dEeXVjK2VJZUlaSGhJS3NuS0Ja?=
 =?utf-8?B?ckxTVjVvd2JLK2Y4RFVTUjlhVFhwTXpaTGdNelZKQmY0ZVN4a2xDaVBuM0VP?=
 =?utf-8?B?U1U1eWIycUR3SHlVYmIzeFdzanIzUUhCcHVCMUovZmJlOC9OSTcyOSttU201?=
 =?utf-8?B?OGltcHg1LzJCMEdoNHVhaG5taHZPZTFEWlBnRHRlMDJMTGx3bXdmclIwL2dD?=
 =?utf-8?B?WnFXZFZzOWVLWW1qZTdZVkZlRjdIdnFRL1M1TFg0dWpFU2RDTzJWNEJzR3NE?=
 =?utf-8?B?OHdMNUdpTzFVNEhqaHIramVGbkdmQmxOTVVkelpGdVNGMGhFWG14MTNRZVdX?=
 =?utf-8?B?ZjRxWnUvRkNRMERjbWdBRnBhQVVQT1VESkViOUVTbWlnZXlBZDFnMU9tVjlx?=
 =?utf-8?B?U3l3cUcxc0c0bk9ZWW5oMkVIODVUVytiQVVqVWUwUzZOQ2dsYVZXeVg3ZVJu?=
 =?utf-8?Q?noVQwy82qA2ShPIrZ4Ru492GKaOgAIla?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTJpZlRXeFUvOEdoUUJzSGQ3UXJvWmpyQnJSMnRyRFpxTHordEh2bVlISENK?=
 =?utf-8?B?d210NmRIeEhWSllqcGRFUzNBdUNkOEFUL3NaMXUyYit5a2NvVVg1WjUzdVhE?=
 =?utf-8?B?RUVLRktuSllqR3ZlckZ1dWdEcGVmR3hrMGRIYmVFMVFIZDBmeEZlTmpsdFV3?=
 =?utf-8?B?SGNHM0RqNk56OW41OVYxWG1Sa0dIS21nQ0l4clhkQTBqaEtXQ1Vncy9GOElO?=
 =?utf-8?B?aTZUZFIrdm14elBZc2Iyc2IrVDZOWVNaOEo1T25uVFpQaU1SbE5vNnNmR1dY?=
 =?utf-8?B?bFFoR0NUTnpIYXNkMWJiOU4xT1JpTURmbEhMRVVsMkFkL1VyR0Nma0FNbW1s?=
 =?utf-8?B?aWxHNGd2U1kxeHlpejJ0emFIUmFwK1N6VVR3MFN3SmNDbmNXVFhMWVhwYjRT?=
 =?utf-8?B?UmovWnU4SVM5bGh6UERFYm5xNXR4SmJMbmlNSzZmSXV2VGx5Nno3VDFkY3hi?=
 =?utf-8?B?NGZTdUg4L0N1SUcvTlRMQW9jTUtJS3hGcHpTNmtVVGY4Z0d1bEhsZmd6d2V4?=
 =?utf-8?B?eTRZbVlMbGtlWm9vSW5PcnZISEJWRWt1dWNBejdOZHhnYXdqVlNWVjlCQXNF?=
 =?utf-8?B?ZGxFTG50dGNjWnVzZXlibnBNenFRU1BPQ3l3TEhPM3ZDZHJMZ2xZRlNBUVZj?=
 =?utf-8?B?WngyUWNrVDJlWDIyV2FaL1FoYmdBRGR0SDY4RTlUclFZclBKVGJaR29PQVlO?=
 =?utf-8?B?K2hZQWNaUEZBcnFUeWxUUlNjZkdKc1d6bWY3QVh0MitHZVo0Tkg0WG52MEJC?=
 =?utf-8?B?TzBraFdpUXNndi9oSU9iakZRcW5jUXhJdmc0YkhsZnI1SzFOVnljS3pxakVK?=
 =?utf-8?B?Z2hYWmtodjJXWmhaOVVnL1UxV213bmtKQ3JNLytHVk9wMFF6cllvMGpLWDJz?=
 =?utf-8?B?eFdiVSsyZmNNU1V2Nm9QS3BrN3hFSDl6WWdkbVRPOXJESWRMY21XYlM3dDNW?=
 =?utf-8?B?dUtTaVpMbTNMMzVoWU01UzBZRUxwSTJaZHJjYk0vd1E5bXU1YmdRdDY2cVFM?=
 =?utf-8?B?RS84MDZXaEJJdXlYZVpoVWtGUDRZV2dWMXpOSnRIR0xjM0syWlIvQit6bktz?=
 =?utf-8?B?RkpZT0RXWTExRTBnc1JUZGZFVmVTclZaMXZtTlRKcnlMQ3IyOGxyZVZFS1pw?=
 =?utf-8?B?WFkvS3BaRnlCMmZOa0toYWM1ZXIwbUR6WHB3SC9DVHpSY3JOdXZQZzErRW0w?=
 =?utf-8?B?cDZia0tBUjUyb3hzOHNZS25zN3ZHT1RtaXJ1Y283TXBnQ0p4VURyV2E0QXZG?=
 =?utf-8?B?cjQzQ0dOZm9vTXA4TENFemd3RlVyZUl4a2krbzFOdTNCbTFFRW5ZaHF0Rmpr?=
 =?utf-8?B?V1h1VWVMMjBkck9mRWNHb3IxMGR5SHl0ZXdZRXNLRjZNck55ckFQWmRmTzNT?=
 =?utf-8?B?K3pLU1pUcmlFTGVocFVFUmVjdkJxaXA0dXA5d1ZWODIyRUR4V3FQc2N5Q1dj?=
 =?utf-8?B?Z2lFb2NRWEM1eHZ4L3ZPUDFXaTRGNzVnei90RWM2Nm5HdUVXTmcybmpWTzZn?=
 =?utf-8?B?K05QTjE1NU9FVTZoN0tJMXNYalpNYXUrWG1NVnZDUUFFd0NwakI1YUcydmdZ?=
 =?utf-8?B?NUF2Z3dDQjhEaUtEYXF4MWNWUkJXUWJLM1Q0SVJEbWxoYTZyZ1dnR3dUWHZ1?=
 =?utf-8?B?UzRpK0s5ZTNXWVlJdlNSeUgyUVhqZmtaYW9iQzM4eUtnN3pxYzBsV3BnUmFt?=
 =?utf-8?B?K1NXRGZRZlRjSGFwcXdOYWx5TkswbTVnb09JSFRDNUh3dWNGM2I1bElxVlBG?=
 =?utf-8?B?eER4NklBdUNVYnBRM0pxVkJmYjRrMHRYaWFwVnMzQ2tYclRNTTF6NXJwWkhH?=
 =?utf-8?B?UHY1VDAweVhscjdiaFYyR0txZ1c0NklWRkovN1BDakdZNXcvOHBtZTRXczlK?=
 =?utf-8?B?Um0yMC9Ld0syM2xvZEhubUFxMVphaE4xbmZLWGhuaHpsbC9BWkFQb1dNS1Jn?=
 =?utf-8?B?b1hLbjVvaCtoZHFhMTR0dlRpYzVRd2FPSC9kcUdBV0p1N1NwdTZIT0tZc0ZS?=
 =?utf-8?B?Wk9DWFJRWXg1TkVicWVwcUtnajZNdGZpYW5Pa2prM0RqNlpJb2c2REN1eWxv?=
 =?utf-8?B?YXY2QVNkNWlFanJidDk2dUVDSlpvbEdwTGdvNGlWUHlJSXBwOGoyRWZYb3Jq?=
 =?utf-8?Q?GYqc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2c64d3-da7b-4acd-30e1-08dd6aa8f72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 07:53:29.0071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rC4Wz+bycX+qMWMx7V8TWuoEU1DTzNukvWeaPHvsVFku77vvB3pZAJo+orBiwIjs9or/5ofokmbtFned6xm4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9569

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIEFTb0M6IGNvZGVjOiB3Y2Q5
Mzh4OiBDb252ZXJ0IHRvIEdQSU8NCj4gZGVzY3JpcHRvcnMNCj4gDQo+IE9uIE1vbiwgTWFyIDI0
LCAyMDI1IGF0IDg6MzPigK9BTSBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gd3JvdGU6
DQo+IA0KPiA+ID4gV2l0aCB0aGlzIHBhdGNoc2V0IGFwcGxpZWQsIHRoZSB3Y2Q5Mzh4IGNvZGVj
IHVzZWQgaW4gdGhlDQo+IFRoaW5rcGFkDQo+ID4gPiBYMTNzIHN0b3BzIHdvcmtpbmc6DQo+ID4g
Pg0KPiA+ID4gd2NkOTM4eF9jb2RlYyBhdWRpby1jb2RlYzogc291bmR3aXJlIGRldmljZSBpbml0
IHRpbWVvdXQNCj4gPiA+IHdjZDkzOHhfY29kZWMgYXVkaW8tY29kZWM6IEFTb0M6IGVycm9yIGF0
DQo+IHNuZF9zb2NfY29tcG9uZW50X3Byb2JlIG9uDQo+ID4gPiBhdWRpby1jb2RlYzogLTExMA0K
PiA+ID4gc25kLXNjODI4MHhwIHNvdW5kOiBBU29DOiBmYWlsZWQgdG8gaW5zdGFudGlhdGUgY2Fy
ZCAtMTEwIHNuZC0NCj4gPiA+IHNjODI4MHhwIHNvdW5kOiBwcm9iZSB3aXRoIGRyaXZlciBzbmQt
c2M4MjgweHAgZmFpbGVkIHdpdGggZXJyb3INCj4gPiA+IC0xMTANCj4gPg0KPiA+IFRoYW5rcyBm
b3IgaGVscCB0ZXN0aW5nLiBCdXQgcGVyIGN1cnJlbnQgaW4tdHJlZSBEVFMsIHRoZSByZXNldCBp
cw0KPiA+IHVzaW5nIEdQSU9fQUNUSVZFX0xPVywgc28gaXQgc2hvdWxkIHdvcmsuDQo+ID4NCj4g
PiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgeW91IGFyZSB1c2luZyBmaXJtd2FyZSBwdWJsaXNoZWQg
RFRTLCBpZiB5ZXMsDQo+ID4gY291bGQgeW91IHBsZWFzZSBoZWxwIGNoZWNrIHRoZSBjb2RlYyBu
b2RlIHRvIGR1bXAgdGhlIHJlc2V0LWdwaW9zDQo+ID4gcHJvcGVydHkgdW5kZXIgL3N5cy9maXJt
d2FyZS9kZXZpY2V0cmVlL3h4ID8NCj4gDQo+IEknbSBhbHNvIGEgYml0IHB1enpsZWQuDQo+IA0K
PiBJIHRoaW5rIG1heWJlIHRoaXMgZGV2aWNlIGhhcyBzb21lIERUQiB0aGF0IGNvbWVzIGZyb20g
dGhlIHZlbmRvcg0KPiB3aXRoIHRoZSB3cm9uZyBwb2xhcml0eSA6Lw0KPiANCj4gSWYgdGhpcyBp
cyB0aGUgY2FzZSB3ZSBuZWVkIHRvIGFkZCBhIHF1aXJrIHRvIGdwaW9saWIgdG8gZm9yY2UgdGhp
cyBHUElPDQo+IGludG8gYWN0aXZlIGxvdywgIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+IA0KPiBG
cm9tIGRmZTNkMmExMmE2MzEzNWU5MTdhYmFjZDBkM2EyOWNlMzQ3YTZjZjkgTW9uIFNlcCAxNw0K
PiAwMDowMDowMCAyMDAxDQo+IEZyb206IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4NCj4gRGF0ZTogTW9uLCAyNCBNYXIgMjAyNSAwODo0NDo0NSArMDEwMA0KPiBTdWJq
ZWN0OiBbUEFUQ0hdIEZpeCBXQ0Q5Mzh4IHBvbGFyaXR5DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncGlvL2dwaW9saWItb2YuYyB8IDkgKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW9saWItb2Yu
YyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMgaW5kZXgNCj4gMmU1MzdlZTk3OWYzLi4zYmFh
ZGRlZGI3YjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMNCj4gKysr
IGIvZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYw0KPiBAQCAtMjIwLDYgKzIyMCwxNSBAQCBzdGF0
aWMgdm9pZCBvZl9ncGlvX3RyeV9maXh1cF9wb2xhcml0eShjb25zdA0KPiBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wLA0KPiAgICAgICAgICAgICAgICAgICogdHJlYXRzIGl0IGFzICJhY3RpdmUgbG93
Ii4NCj4gICAgICAgICAgICAgICAgICAqLw0KPiAgICAgICAgICAgICAgICAgeyAidGksdHNjMjAw
NSIsICAgICAgICAgInJlc2V0LWdwaW9zIiwgIGZhbHNlIH0sDQo+ICsjZW5kaWYNCj4gKyNpZiBJ
U19FTkFCTEVEKFNORF9TT0NfV0NEOTM4WCkNCj4gKyAgICAgICAgICAgICAgIC8qDQo+ICsgICAg
ICAgICAgICAgICAgKiBUaGlzIGNvZGVjIGlzIHVzZWQgaW4gbGFwdG9wcyB3aXRoIGRlcGxveWVk
IGRldmljZXRyZWVzDQo+ICsgICAgICAgICAgICAgICAgKiB0aGF0IGZhaWwgdG8gc3BlY2lmeSB0
aGUgY29ycmVjdCBhY3RpdmUgbG93IHByb3BlcnR5IGZvcg0KPiArICAgICAgICAgICAgICAgICog
dGhlIHJlc2V0IGxpbmUuDQo+ICsgICAgICAgICAgICAgICAgKi8NCj4gKyAgICAgICAgICAgICAg
IHsgInFjb20sd2NkOTM4MC1jb2RlYyIsICJyZXNldC1ncGlvcyIsICBmYWxzZSB9LA0KPiArICAg
ICAgICAgICAgICAgeyAicWNvbSx3Y2Q5Mzg1LWNvZGVjIiwgInJlc2V0LWdwaW9zIiwgIGZhbHNl
IH0sDQo+ICAjZW5kaWYNCj4gICAgICAgICB9Ow0KPiAgICAgICAgIHVuc2lnbmVkIGludCBpOw0K
PiAtLQ0KPiAyLjQ4LjENCj4gDQo+IE1heWJlIHlvdSBjYW4gZm9sZCB0aGlzIGludG8geW91ciBw
YXRjaCBpZiBpdCBoZWxwcy4gQW5kIGlmIHRoZXJlIGFyZQ0KPiBtb3JlIG9mIHRoZSBjb2RlY3Mg
d2l0aCB0aGlzIHByb2JsZW0sIHdlIG5lZWQgYSBzaW1pbGFyIHBhdGNoIGluIGVhY2gNCj4gb25l
IG9mIHRoZW0uDQoNClRoYW5rcyBmb3IgeW91ciBxdWljayByZXBseS4gSSBhbSB0aGlua2luZyB3
aGV0aGVyIHdlIG5lZWQNCnRvIGZvcmNlIHRoZSBwb2xhcml0eSBvZiByZW1haW5pbmcgb2ZfZ3Bp
byB1c2Vycy4gDQpTb21lIG9sZCBkZXZpY2VzIG1heSBub3QgYWJsZSB0byBnZXQgdGVzdGVkLCAg
YW5kIHNvbWUNCm1heSB1c2UgZmlybXdhcmUgdG8gcHVibGlzaCBEVFMgZHVyaW5nIHJ1bnRpbWUo
c3VjaCBhcyBGZWRvcmEsDQpvcGVuU1VTRSB1c2luZyBmaXJtd2FyZSBiYXNlZCBEVCB3aGVuIGRv
aW5nIFN5c3RlbS1SZWFkeSBJUiksDQpzbyB3ZSBhcmUgbm90IHN1cmUgd2hldGhlciB1c2luZyBn
cGlvZCBhcGkgYnJlYWsgdGhlIHBsYXRmb3Jtcw0Kb3Igbm90Lg0KDQpUaGFua3MsDQpQZW5nLg0K
DQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

