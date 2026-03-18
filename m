Return-Path: <linux-gpio+bounces-33769-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IZgAEj0ummVdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33769-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 19:51:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381E2C1A16
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 19:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8834D305543E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 18:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37163EDAB3;
	Wed, 18 Mar 2026 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bei4+S72"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FA3EBF15;
	Wed, 18 Mar 2026 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773859569; cv=fail; b=oPsFglpTf1K7TfmM2fBUfmkrrKYAfRi7vgF4cVEddIDXbdvZ8cfzl8yX8Sy+spi1ZbWhVUcE89znOLyVXF9z6peu0sdUpmGKAnwXqvCuwp3bOyuEZyEctG3nBzm4DpYZTr5oP851vTPpmrwodxyrm1tO/zPJeqrA2TaIkkTJyxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773859569; c=relaxed/simple;
	bh=5fUqzozwIZ6Ss0laBxCIDI8Q5VoOYFl7V2rrirsayd4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aEwvCmLcTLhR+EhkkFbmxqb5iUBdhChh9av7jw3VFaKJeUvI/6kupw9O2t5TjKug5V2dNayaIo9E9Ht6vslKl3CVO720RWk0qPy49xtBH1mYzGB8ldBCILjG5QuquPS/lyHd+xRsraEcNmUAI3lh2VRUGVyc0t/932HHnJcb/R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bei4+S72; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7K6QMWjHXnFwVs7mdOCCWA2Wvv666snebvNiPcFFYX9um4JcWks3LUCWqAgDfFxAX8dzM005rJ5bLpI6tyM+MxwlQeuc9H5wG72o4acYuUmWfasjUjal3VLFHFo0pGI4niarJA53y3C7U++j7bXK5nLEXfbzKPgmz2NeLIfU10BtLQDYyWkOkF6KenaY/WOOli4M6plHNQV3zIvZYEE1Lim1SCvwt0+w0025gjfzoF6BBsur5iPmwuRem5lhLsayC1PnHovXOV0vFlRb87QXi/lxnANvDPKu71f5d9P/Or1r0rQ5QJJwJ98O4NFRvIJva9wpk2GFvcGZmbvZVIgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fUqzozwIZ6Ss0laBxCIDI8Q5VoOYFl7V2rrirsayd4=;
 b=K2lukIeoVdVBbWYkS3mT+97YQ24JMgyTb++wFWvf54nKDwvJcx3pGjVnhnsahAb5iGBqT5m1hQ4fFQLHjBJ/BZZO+7sbIfZ2B8sLLCU5zNlzO3Cm+uJMu6whScB/C7kKgCbhkEtag6cA9yGtIn7ptHzHb+ZlsTVGHuj14+OQJi5uvd/mW3x/1DRRTZHQbuyVhw5ZXCBHa4pIxGMyen5PvDDDEA0jAvLAaKJItY1G6lT7YE1rzhyOF3Fcpd5D+zpYv+GOVg4smjljV9X07+KFjUZEluA6hDHsnSybylX1KYPndFkrL6+Rnj+x8OBgZMi8Crx+38biSGwQidA5SoKyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fUqzozwIZ6Ss0laBxCIDI8Q5VoOYFl7V2rrirsayd4=;
 b=bei4+S72Xb5QM315OOB7n7gTe3gRKIOJl+XumbHjiVPGNXI/FTAm0rD/IsamML8CmNXOGy3lEOX7/YhJXfP57XPQINCdfjBzHRmaJjKK/rpsbarQnijrmZoeTx7LLqn8RAjOj70tZt9BRaKQRIDhBq3eWbEdZa7aErgTmLN+sJ/7ca1JF/LM3thiczrIp45bMwkTOuYNYzSuStATH/mPP9ZhryB5ybVYUkgd2AUOQqWkb5FRHM1IJ3mGF/1pvBksAzLONrCF9Omo3GPd1jgbljp86dQJ1DCYzx4VKNRxDrQuSEEZNFKJmfJF4PDkkrkdUzs8GluwI96tdE8hl/Gr5Q==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 18:45:57 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 18:45:59 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHctwd2IcU/O57O3E6y/D7caWuK7w==
Date: Wed, 18 Mar 2026 18:45:59 +0000
Message-ID:
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
 <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
In-Reply-To:
 <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV1PR04MB10275:EE_
x-ms-office365-filtering-correlation-id: e6df3fa7-2793-475d-6e23-08de851e9908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 vjmG2bmPzmOVFOEX+R8Ome7tcJYwchEG7d76MfF2fXHKa+lNmn30odeDWLPr5pSIOsztLdhnzv4W9KIRsyCdUMV0hKsoRE1OL94HcXVxf1i88euPhO3v2rOqNkNWersvVYRJiSMy2y6wz2zCad+aDMbTAIO1vzy5f8SWoyZ8t+KtIqe49P5LitoHcq7UeiA7M5uxwtJtJqa557XDJlfiGATL8IP5rx0mIVvrB+XxOXVRP/YsTfyYfCNUI9hZ+2PuQJyLliCYG6Ceo0ed5GCs19jtma6wM/SFSaW7o+6BKDldmSQj+YQbIpbZ2vEaXYLiLze7QCBBxaJACGY7ntzIrRObgimUy9P5GtKYOp0xToIQuyAwcvsqXM/X9lQsRxasbv7UjFJEogcYULO9Eq5FRGBooIwcLbGBBBXKmPNccbjd8hPq17qzf+uUSFAN2YfeckKcjjQp8xh2b4a/qan1p7SDGG0kLSKIBEHSYN92zLfUmPZZgtE54Gro0iZubl8GKJHq+bWW+troyxL12+ft9dMeOWJT0PL3KaAClAzlMxc2/+2ZKzYAAROHuOX6tBle6Q31u0a/0lvXJQMEISffjuFy4zxPyw88S8LfNJEPlGqWXZEP6tjFXThjWaBxPJWGSUYhykEpJQNLQfCaSoicllSJlK3rgFxJosE33+tnLOR4mCAWfdfRetU4Z2cwJCh9s9sla9U0/VSxcTJHvkAwdTs1dgwCk/6KTiMJF15IdmBdABFVuOnam1peLfPJ1JQXTnpneAWfC5uH+C6SYAutZu8hupAqHbymfNFu8jSC+9U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlhyL0JpVG94ZDZPdnluV2MyUFk5eTgxV2FmeHNYd3J4WDhnZ2plWVgwd2xm?=
 =?utf-8?B?ek9zcVE5VHIwZHhkSzZsYXdrUGNGQ05taWY5bnpXc1ZwNDBCM3UxVFlTYUVs?=
 =?utf-8?B?Z3hoekVNTHoxbWpqQ0xra3NvNzZRM2gyQ3h4S2o4c0pqdjVQcUtGV0NSaDJx?=
 =?utf-8?B?bi83YklES3dGVnAyanJ2U0pSWkkwQlJ2eWh0Z3kzMDJJTmd1Wk1VTTJPVkVL?=
 =?utf-8?B?SUhTeVVYc1pRcGo2OEZFYmt2S0I0dHR0c2xFM0ZMNWx0VWZxMWVaUGNJMzcw?=
 =?utf-8?B?ZWE0TE9ZL0VKSzRBeThLREdGL3llMXpuT0psdHVwalZhNCt4UXJVTytTazVS?=
 =?utf-8?B?SVlPZnpGSkFha3ZhbmRJU29pdnlJREpzaEpIa3NoQmdjS0FQTElxaXBaTGlx?=
 =?utf-8?B?UFJWY3VwNThTaE44VVAvQjlqZUJLKzltYkY3WC9tdldiSHJkVXFQWW1sQUhv?=
 =?utf-8?B?eVhKZDZJSkVYbXRnVXlxYUpHMzZ3Wlo0V2VUVDNXUDhHVzB0empHYTVFdldk?=
 =?utf-8?B?U3plR1FVeFhrdVNvUlg5N1ZUcnJDREY3dGl1K0F1TGVhOWRDRjYrcE4xSGhl?=
 =?utf-8?B?aHozbjl5enVrd1pKcm5qMndHRUtEVitWaHUrb3NOL3p2N0o0bW1udWZZdXJF?=
 =?utf-8?B?UGZsOGY4dVBRMXpWY3pyY0JyYUZobWxiUE5HNTIzL0RtR0RHV1QzTzlVT2pv?=
 =?utf-8?B?cVpqa0ZXS2lPR0FEeVNhaEY0ZEVYanR1Rkt4TCtVRVZRZE5Hb29uTkhEREEx?=
 =?utf-8?B?OVVldmtRNWcybkQ3ZkdFa0hLblFvQk1JSG9rYkhYTVNqL3ozaWFCeFE4OVFx?=
 =?utf-8?B?MXloV0E5ekRJNm5lV3pzK3gzKzd5cHExZkM1RWpFeCsxYXNFMzg1THhRem14?=
 =?utf-8?B?dXcwa1FDb21HRHR3SEMvMDd5NytXNFdCOW5DbE1NZTFSdTJWZ0lXR29EbXpG?=
 =?utf-8?B?OUYrc29rclJaeVJPYWhtblNVQjJad2hYWTROeldmclpWcEhUb3pwNWlIbUVv?=
 =?utf-8?B?elA4WE1XcHhHVnJsK2p3MUp1RzI3cmhiWUhhbmFZMThUalk0UGc3ZWpOemJT?=
 =?utf-8?B?YiswZit1VElSZHMxb1FacFc4L3Z3d2RNdjRxRVdmK1dXV0E5TmY2WkFldzNo?=
 =?utf-8?B?V2FndzVYY3IxTlhLdmcybWl0MmxFVDExV1BseEpaOU9GUG5GNHl6c0JYUWZR?=
 =?utf-8?B?NlNJNmw2b0lmK2UvSk5aNlBjQ0ZNTEtuR2ltd1JLbktLaW92M2k0R0FtQlVr?=
 =?utf-8?B?bkVBenBneitScW1GcW9UUHNWOGhReENtQWNhZzhvQSsvSnpEWVRLVUQ5ejVx?=
 =?utf-8?B?dEtLdWZBb0hYcVJ5U1lvWlFXQWFwYjBBazZNNkRkK2hINDhScDY0d1JBL0h0?=
 =?utf-8?B?UllQTi9pMFp6K3FvZ2dVOVJZemFnQ1E4NjhCQitSQnJNcXAvQ3ZHc2lVNWFw?=
 =?utf-8?B?Qks2VG9USUIrNzNYYmZmUlNpZGEzV2JiNEJrdElIU0o2NzRUSWZXRDVaRnpP?=
 =?utf-8?B?VjNyc0NZM05CcGY4WDF0QnI4OHpkVzJWNGVHOHp5eUNvVDdEVWtwTkpiV2Zw?=
 =?utf-8?B?TlJibTRBUG1wSVhQZEF6WXQyNmRwMURYaW5YQlkrb0dGR29mMURhSHh3d0t5?=
 =?utf-8?B?T3poU2NsL0JoUjE4Q3RPYlRuMW5VNjFZaEdPVFg1OXFVYk14eVNCT3RjZEZi?=
 =?utf-8?B?b3dnTzFxUllKc2Y0MVhqY0ZiVUhYd0hMWGRsa3A2QTVLdnlxeEVaUEpYLzV0?=
 =?utf-8?B?Mk5hZS9BOEFIcXNyZStUbU03eTdXVm1MbDMzRWZBR1I3d3YvSzk2RnM5cUhI?=
 =?utf-8?B?djM1RUJoSzBZa0lzLzR1cUpmSEpiTXhxQS81M3hpalUxdE5LaTE2Z2wrSDBR?=
 =?utf-8?B?VWVhdWdNVmg2eTRWYW0rZ3dMMU95UFllcDczeWc2bFh6c2Y5bVZXMkJzSkNq?=
 =?utf-8?B?R3VYM3QwNjBTZis4ekozR2M4RGo1Q0ZzUllhQ3pUWDVSZFcxUDl4MzJXUUtj?=
 =?utf-8?B?N0Z2dzlVU1paMkRtbHJ6ckIyc0U2QW9xZlNoeWtaYk1NSTBqUGUrQzA2bEpi?=
 =?utf-8?B?WGk4OWRiVG9VUzNiMkpZaE1KNnAvYkFia3QwbWt0OW9RVjNibUkzUE1qSzE3?=
 =?utf-8?B?QThzNlZTRStyMVA1aVhKMHR6dmhXU1l2Z1RmUUYrU2U0WVJvZ25vdmgrdGNr?=
 =?utf-8?B?WjArdit6VlFrOGFXbnIyakM5ZnVsUEUvem1FUGUwNk5aeFVzKzVRYndXTVJZ?=
 =?utf-8?B?cnA3NUpSZ055b2s5dEdad3lvdlMwQ0MyaHRURG1wMWV0TTVrbXRYeUw4RUx6?=
 =?utf-8?Q?6oPX/lt/u02OaqZRKw?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6df3fa7-2793-475d-6e23-08de851e9908
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 18:45:59.5696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3R6V8xlSoc01RCfVYoQGfE3MZFzEhme6VIU/ljp57z70Z8pwGqyLpW7UwaPV9cLzJO32NrLai6NMEcMdMxT/jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33769-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.807];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5381E2C1A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAx
OCwgMjAyNiAxMTowMyBBTQ0KPiBUbzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0KPiBD
YzogQXJuYXVkIFBPVUxJUVVFTiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT47IFNoZW53
ZWkgV2FuZw0KPiA8c2hlbndlaS53YW5nQG54cC5jb20+OyBMaW51cyBXYWxsZWlqIDxsaW51c3dA
a2VybmVsLm9yZz47IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47IEpv
bmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3Ig
RG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNz
b25Aa2VybmVsLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4g
R29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djEyIDMvNV0gZ3BpbzogcnBtc2c6IGFkZCBnZW5lcmljIHJwbXNnIEdQSU8gZHJpdmVyDQo+IE9u
IFR1ZSwgMTcgTWFyIDIwMjYgYXQgMDg6MTEsIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4g
d3JvdGU6DQo+ID4NCj4gPiA+ID4gK3N0cnVjdCBycG1zZ19ncGlvX2luZm8gew0KPiA+ID4gPiAr
ICAgc3RydWN0IHJwbXNnX2RldmljZSAqcnBkZXY7DQo+ID4gPiA+ICsgICBzdHJ1Y3QgcnBtc2df
Z3Bpb19wYWNrZXQgKnJlcGx5X21zZzsNCj4gPiA+ID4gKyAgIHN0cnVjdCBjb21wbGV0aW9uIGNt
ZF9jb21wbGV0ZTsNCj4gPiA+ID4gKyAgIHN0cnVjdCBtdXRleCBsb2NrOw0KPiA+ID4gPiArICAg
dm9pZCAqKnBvcnRfc3RvcmU7DQo+ID4gPiA+ICt9Ow0KPiA+ID4NCj4gPiA+IEV4Y2VwdCBpZiBJ
IG1pc3N1bmRlcnN0b29kIE1hdGhpZXUgYW5kIEJqb3JuJ3MgcmVxdWVzdDoNCj4gPiA+ICJyZXVz
ZSBhbGwgdGhlIGRlc2lnbi13b3JrIGRvbmUgaW4gdGhlIGdwaW8tdmlydGlvIg0KPiA+ID4gV2Ug
c2hvdWxkIGZpbmQgc2ltaWxhciBzdHJ1Y3R1cmVzIGhlcmUgdG8gdGhvc2UgZGVmaW5lZCBpbg0K
PiA+ID4gdmlydGlvX2dwaW8uaC4NCj4gPiA+IHN0cnVjdCBycG1zZ19ncGlvX2NvbmZpZyB7DQo+
ID4gPiAgICAgICBfX2xlMTYgbmdwaW87DQo+ID4gPiAgICAgICBfX3U4IHBhZGRpbmdbMl07DQo+
ID4gPiAgICAgICBfX2xlMzIgZ3Bpb19uYW1lc19zaXplOw0KPiA+ID4gfTsNCj4gPiA+DQo+ID4g
PiAvKiBWaXJ0aW8gR1BJTyBSZXF1ZXN0IC8gUmVzcG9uc2UgKi8gc3RydWN0IHZpcnRpb19ncGlv
X3JlcXVlc3Qgew0KPiA+ID4gICAgICAgX19sZTE2IHR5cGU7DQo+ID4gPiAgICAgICBfX2xlMTYg
Z3BpbzsNCj4gPiA+ICAgICAgIF9fbGUzMiB2YWx1ZTsNCj4gPiA+IH07DQo+ID4NCj4gPiBUaGUg
Y29yZSBvZiB0aGUgaXNzdWUgaXMgdGhhdCBTaGVud2VpIGlzIHN0b25lIHdhbGxpbmcgYW55IGNo
YW5nZQ0KPiA+IHdoaWNoIG1ha2VzIGl0IGhhcmQgdG8ga2VlcCB0aGUgbGVnYWN5IGZpcm13YXJl
LiBJdCBpcyBwb3NzaWJsZSB0byB1c2UNCj4gPiB0aGVzZSBzdHJ1Y3R1cmVzLCBidXQgaXQgbWFr
ZXMgdGhlIGV4dHJhIGNvZGUgU2hlbndlaSBuZWVkcyB0bw0KPiA+IHRyYW5zbGF0ZSB0aGlzIHBy
b3RvY29sIHRvIHRoZSBsZWdhY3kgcHJvdG9jb2wgbW9yZSBkaWZmaWN1bHQuIEl0DQo+ID4gbWln
aHQgbmVlZCB0byBrZWVwIHN0YXRlLCBldGMuDQo+ID4NCj4gDQo+IEkgYWdyZWUgd2l0aCBldmVy
eXRoaW5nIEFuZHJldyBwb2ludHMgb3V0IGFib3ZlLg0KPiANCj4gPiBUd28gcG9pbnRzLi4uDQo+
ID4NCj4gPiBUaGUgZmlybXdhcmUgaW1wbGVtZW50cyBtb3JlIHRoYW4gR1BJTy4gVGhlcmUgaXMg
ZGVmaW5pdGVseSBJMkMgYXMNCj4gPiB3ZWxsLCB0aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGUgcGF0
Y2ggaGFzIGJpdHMgb2YgSTJDIGNvZGUuIExvb2tpbmcgYXQ6DQo+ID4NCj4gPiBodHRwczovL2V1
cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZs
d24uDQo+ID4gbmV0JTJGbWwlMkZhbGwlMkYyMDI1MDkyMjIwMDQxMy4zMDk3MDctMy0NCj4gc2hl
bndlaS53YW5nJTQwbnhwLmNvbSUyRiZkYXQNCj4gPg0KPiBhPTA1JTdDMDIlN0NzaGVud2VpLndh
bmclNDBueHAuY29tJTdDNGI4ODc5YTljODlhNGE4MzFjZjUwOGRlODUwDQo+IDdkZTE4JQ0KPiA+
DQo+IDdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzOTA5NDQ2
NTk5MjM3MTM2NyUNCj4gN0NVbmtuDQo+ID4NCj4gb3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBl
VTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbA0KPiBBaU9pSlgNCj4gPg0KPiBh
VzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0
YT1zOHRsOG4NCj4gbTNlRA0KPiA+IDlsJTJGZXR5eUUlMkZQV3dKaDR3UWFsYWFIcjRPRXd6cFE3
TlklM0QmcmVzZXJ2ZWQ9MA0KPiA+DQo+ID4gVGhlcmUgaXMgYWxzbyBSVEMsIGFuZCBhIGZldyBv
dGhlciB0aGluZ3Mgd2hpY2ggZG9uJ3QgZGlyZWN0bHkgbWFwIHRvDQo+ID4gTGludXggc3Vic3lz
dGVtcywgYnV0IG1heWJlIGRvIGhhdmUgTGludXggZHJpdmVycz8NCj4gPg0KPiA+IEdpdmUgaG93
IG11Y2ggcHVzaGJhY2sgdGhlcmUgaGFzIGJlZW4gb24gdGhlIGV4aXN0aW5nIHByb3RvY29sIGZv
cg0KPiA+IEdQSU8sIGl0IHdvdWxkIGJlIHdpc2UgdG8gYXNzdW1lIHRoYXQgSTJDLCBhbmQgUlRD
IGlzIGdvaW5nIHRvIGdldCB0aGUNCj4gPiBzYW1lIGFtb3VudCBvZiBwdXNoYmFjay4gSWYgYW55
IG9mIHRoZXNlIHRocmVlLCBHUElPLCBJMkMsIG9yIFJUQw0KPiA+IGRlY2lkZSB0aGF0IG9ubHkg
YSBuZXcsIGNsZWFuIHByb3RvY29sIHdpbGwgYmUgYWNjZXB0ZWQsIG5vIGxlZ2FjeQ0KPiA+IHNo
aW1zLCB0aGUgZmlybXdhcmUgaGFzIHRvIGNoYW5nZSwgYnJlYWtpbmcgY29tcGF0aWJpbGl0eSB0
byBsZWdhY3kNCj4gPiBwcm90b2NvbHMsIGFuZCB0aGUgYWNjZXB0ZWQgc2hpbXMgYmVjb21lIHBv
aW50bGVzcyBNYWludGVuYW5jZSBidXJkZW4uDQo+ID4NCj4gDQo+IEkgaGF2ZSBtYWRlIHRoaXMg
cG9pbnQgY2xlYXIgYmVmb3JlOiBtb2RlbGluZyBsZWdhY3kgcHJvdG9jb2xzIGluIG1haW5saW5l
IGRvZXNuJ3QNCj4gc2NhbGUuICBNYWlubGluZSB1c2VzIGEgc2luZ2xlIGdlbmVyaWMgcHJvdG9j
b2wsIGFuZCB5ZXMsIGl0IG1lYW5zIGJyZWFraW5nIGxlZ2FjeQ0KPiBwcm90b2NvbHMuICBUaGlz
IGlzIHRoZSBjb3N0IG9mIG1vdmluZyB0byBhIG1haW5saW5lIGtlcm5lbC4gIElmIHBlb3BsZSB3
YW50IHRvIHVzZQ0KPiB0aGUgbGVnYWN5IGZpcm13YXJlLCB0aGV5IG11c3Qgc3RpY2sgd2l0aCBh
IGxlZ2FjeSBrZXJuZWwuDQo+IA0KPiA+IFBvaW50IHR3byBpcyB0aGF0IHRoZSBjdXN0b21lcnMg
d2hvIGFyZSBwdXNoaW5nIGZvciB0aGVzZSBkcml2ZXJzIHRvDQo+ID4gYmUgYWRkZWQgdG8gTWFp
bmxpbmUgcHJvYmFibHkga25vdyB0aGF0IG5lYXJseSBub3RoaW5nIGdldHMgaW50bw0KPiA+IE1h
aW5saW5lIHdpdGhvdXQgc29tZSBjaGFuZ2VzLiBUaGVyZSBpcyBzb21lIHNob3J0IHRlcm0gcGFp
biB0bw0KPiA+IHN3YXBwaW5nIHRvIE1haW5saW5lIGJlY2F1c2Ugb2YgdGhlc2UgY2hhbmdlcywg
aW4gdGhpcyBjYXNlLCBmaXJtd2FyZQ0KPiA+IHVwZ3JhZGVzLiBCdXQgaW4gdGhlIGxvbmcgcnVu
LCBpdCBpcyB3b3J0aCB0aGUgcGFpbiB0byBiZSBhYmxlIHRvIHVzZQ0KPiA+IE1haW5saW5lLiBB
bmQgdGhvc2UgY3VzdG9tZXJzIHdobyBkb24ndCB3YW50IHRvIHVwZ3JhZGUgdGhlIGZpcm13YXJl
DQo+ID4gY2FuIGtlZXAgd2l0aCB0aGUgb3V0IG9mIHRyZWUgZHJpdmVzLg0KPiA+DQo+ID4gU28s
IHdoYXQgYXJlIG91ciBjaG9pY2VzPw0KPiA+DQo+ID4gMSkgV2UgYWNjZXB0IHRoZSBjb2RlIGFz
IGl0IGlzIG5vdywgd2l0aCB0aGUgc2hpbT8NCj4gPg0KPiANCj4gTkFLDQo+IA0KPiA+IDIpIFdl
IGtlZXAgcHVzaGluZyBmb3IgdGhlIHZpcnRpbyBwcm90b2NvbCwgd2l0aCB0aGUgc2hpbT8NCj4g
Pg0KPiANCj4gTkFLDQo+IA0KPiA+IDMpIFdlIGtlZXAgcHVzaGluZyBmb3IgdGhlIHZpcnRpbyBw
cm90b2NvbCwgbm8gc2hpbSwgZmlybXdhcmUgY2hhbmdlcw0KPiA+DQo+IA0KPiBOb3RoaW5nIHdp
bGwgZ2V0IG1lcmdlZCBpbiB0aGUgUlBNU0cgc3Vic3lzdGVtIHRoYXQgaW5jbHVkZXMgc3VwcG9y
dCBmb3IgdGhlDQo+IGxlZ2FjeSBwcm90b2NvbC4gIE5vdCB0b2RheSwgbm90IGluIGEgbW9udGgs
IG5vdCBpbiA1IHllYXJzLg0KPiANCg0KQE1hdGhpZXUsIA0KWW91ciB0b25lIGlzIHVubmVjZXNz
YXJ5LiBJZiB5b3UgYmVsaWV2ZSB0aGlzIGRyaXZlciBtdXN0DQpjb21wbHkgd2l0aCBhIHNwZWNp
ZmljIHZpcnRpbyBwcm90b2NvbCwgdGhlbiBwbGVhc2UgcG9pbnQgdG8gdGhlIGV4YWN0DQpzcGVj
aWZpY2F0aW9uIGluc3RlYWQgb2YgbWFraW5nIGJsYW5rZXQgc3RhdGVtZW50cy4NCg0KSWYgdmly
dGlvIGlzIHRoZSBkaXJlY3Rpb24geW91IHByZWZlciwgeW91IGFyZSBvZiBjb3Vyc2UgZnJlZSB0
byBwcm9wb3NlDQphbmQgaW1wbGVtZW50IHN1Y2ggc3VwcG9ydCB5b3Vyc2VsZi4NCg0KTXkgcGF0
Y2hlcyBhcmUgY29udHJpYnV0ZWQgaW4gZ29vZCBmYWl0aCB0byBpbXByb3ZlIHRoZSBlY29zeXN0
ZW0sIGFuZA0KdGhpcyB3b3JrIGNsZWFybHkgYmVsb25ncyB0byB0aGUgR1BJTyBzdWJzeXN0ZW0u
IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkNCnlvdSBhcmUgYXNzZXJ0aW5nIGF1dGhvcml0eSBoZXJl
IHdpdGhvdXQgcHJvdmlkaW5nIGFueSB0ZWNobmljYWwNCmp1c3RpZmljYXRpb24uDQoNCkBMaW51
cyBXYWxsZWlqLA0KRnJvbSBhIHRlY2huaWNhbCBzdGFuZHBvaW50LCB0aGlzIEdQSU8gZHJpdmVy
IGlzIG5vIGRpZmZlcmVudCBmcm9tDQpncGlvLW14YywgZ3Bpby1vbWFwLCBvciBncGlvLXJkYS4g
SWYgdGhlIGNvbmNlcm4gaXMgc2ltcGx5IHRoZSB1c2Ugb2YNCnRoZSB3b3JkIOKAnGdlbmVyaWPi
gJ0gaW4gdGhlIG5hbWUsIEnigJltIHBlcmZlY3RseSBmaW5lIHJldmVydGluZyBpdCB0byBhbg0K
TlhQ4oCRc3BlY2lmaWMgZHJpdmVyLg0KDQpJZiBtYWludGFpbmluZyBhIHByaXZhdGUgR1BJTyBk
cml2ZXIgaXMgbm8gbG9uZ2VyIGFjY2VwdGFibGUgZ29pbmcNCmZvcndhcmQsIHRoYXTigJlzIGFs
c28gZmluZSDigJQgd2UgY2FuIHN0b3AgdGhlIGRpc2N1c3Npb24gaGVyZS4gSWYgeW91IHRoaW5r
DQp0aGVyZSBhcmUgc3RpbGwgdGVjaG5pY2FsIGxpbWl0YXRpb25zIGluIHRoZSBkcml2ZXIgaXRz
ZWxmLCBJ4oCZbSBtb3JlIHRoYW4NCndpbGxpbmcgdG8gY29udGludWUgaW1wcm92aW5nIGl0Lg0K
DQpCdXQgdGhlIGdvYWwgaXMgbm90IHRvIGNyZWF0ZSBhIGRyaXZlciBmb3IgYW5vdGhlciBwcm90
b2NvbCB0aGF0IHNvbWVvbmUgDQpjbGFpbXMgcGVyZmVjdC4gDQoNClRoYW5rcywNClNoZW53ZWkN
Cg0KPiA+IDQpIFdlIHBhdXNlIEdQSU8gd2hlcmUgaXQgaXMgdG9kYXksIGFuZCByZXN0YXJ0IGFs
bCB0aGUgYXJndW1lbnRzIHdpdGgNCj4gPiAgICB0aGUgSTJDIGRyaXZlci4gV2UgY2FuIGNvbWUg
YmFjayB0byB0aGUgR1BJTyBkcml2ZXIgaW4gYSBmZXcgbW9udGhzDQo+ID4gICAgdGltZSBvbmNl
IHdlIGhhdmUgYSBiZXR0ZXIgaWRlYSBob3cgSTJDIGlzIGdvaW5nLiBBbmQgbWF5YmUgd2UgYWxz
bw0KPiA+ICAgIG5lZWQgdG8gc2VlIHRoZSB3YXRjaGRvZyBkcml2ZXIsIGFuZCBhcmd1ZSBhYm91
dCBpdHMgcHJvdG9jb2wuDQo+ID4NCj4gPiBJIGFsc28gdW5kZXJzdGFuZCBTVCBoYXMgYSBnZW5l
cmljIEkyQyBkcml2ZXIgbmVhcmx5IHJlYWR5LCBpZiB0aGF0DQo+ID4gZ2V0cyBtZXJnZWQgZmly
c3QsIHRoYXQgcHJvYmFibHkga2lsbHMgdGhlIE5YUCBJMkMgcHJvdG9jb2wsIGFuZCBtYXliZQ0K
PiA+IHRoZSBOWFAgR1BJTyBhbmQgUlRDIHByb3RvY29scy4NCj4gPg0KPiA+IE15IHZvdGUgaXMg
Zm9yIDMuIElmIG5vdCAzLCB0aGVuIDQuDQo+ID4NCj4gDQo+IFN0cm9uZyB2b3RlIGZvciAzLg0K
PiANCj4gPiAgICAgIEFuZHJldw0KPiA+DQo=

