Return-Path: <linux-gpio+bounces-19727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B2AADA91
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 10:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A0413B432F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 08:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC90202F83;
	Wed,  7 May 2025 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XVKov9FH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XVKov9FH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A9212B3E;
	Wed,  7 May 2025 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608113; cv=fail; b=Rt47toRHoLOmXbOtfVzIWCScJwFOr75DuIOKe+yJh+B5zXKcUNZXL6w+yH4NwC5CVUiU/hbCAlPPtv51uwFCAvyDZVE3Bul8/pvlxrgCgMdDhJ5yWGFHdKBz0lyFrYNQ4BZeRqpIvuUXm3ixUktfd2QGoZQDX9HoIyrjRkvMn5g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608113; c=relaxed/simple;
	bh=sGjOc3g774OqE3xu7HGSmzFgnIeAVpvvmi3dKRjtlPo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CVOSOfjw8uGCfk9dLSUAmYExE3kCM2b3y4hg/Q98L+Rzkir3FQJpxDGafPB0S3XnCvRoXc855As2hGRDJ9UQqM20AvgXFMIdcaMe5xwvmemifn3s5CjCEZ9Q15tQPYRX6CSO15l//LdAgY5+ZzkeBLCRQfODHjmdA4UdPYhrTYQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XVKov9FH; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XVKov9FH; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zFNwTtBlE2jz2pt2Hpq9KGygPkVe21WfEzg0FaYKHZKi4WcjbLJdTObgHr/ws8WMD5IngDahnq+W8Y9K+PsFpnWuXN1TjIY2ZXY3EKvTkIbZUcUntAW3n0xv8rYgqmIaBWKeVzxA6qlHuTKSQPVhF62ON/6N9ELnZ9Mzz7u6dDHx2q5Rxgt06V6qYzeO+hkxhhw4iRolIQreR6IsGFg4tpWqL/bNYdzDT0zfechbRBxJBp2N50ebek8zFvuEM4gBLKpWR0Cn5KBTTs4zL5u5xsgs97NNTM/8/d46Glr0yIsswAomC2OtIxBCcvmY/NdFPqhBBOxoociO62GW5V0lpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGjOc3g774OqE3xu7HGSmzFgnIeAVpvvmi3dKRjtlPo=;
 b=BuC8So3HZEWJMX03KRj4BaN/SE7h7KpKvLsmfauOrhx4CrP6WTIppBFBD8U5YCXemNbTvDzpyh8z/XR5BYiczohSClk+/Uw4ipVi5wgipUoHkS/sB9DUzGmHwNbXYVN+euk2hB5TFnbJLAJfpB4aELnvFrp40nvQtNecqy+amNuwqUqKkfKVp/7kVg2QZaqWsHMtPTkmUeQd1e7j6yXJH9jA/2rgpigy67VDprdjPTIz9sCzf1cVKd2dBhKfSeo14zKwmZtObU4HCdDk/e782jLdzo+DCXkwGcf+uY2ve8q0A0+IanHybVwvhZZ8vj8kRfk+/JHzOy4E9tRsqTocHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGjOc3g774OqE3xu7HGSmzFgnIeAVpvvmi3dKRjtlPo=;
 b=XVKov9FHmr1i4Y63s/ciU6/nicpjV91kXMVHXi3qcrr7NdDORNKZ3zjGCemoovxF+kLRFyg70uF1vZotzl5PV98R1csATYGTiA5OcBzg3FbXcYOBC6o7m1P5N9BRqwBTFOcY07SH6yQ0VC7AeBSqEO04awUY/nVq2zFqHN8jJKE=
Received: from AM0PR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::18) by GV1PR08MB8284.eurprd08.prod.outlook.com
 (2603:10a6:150:a5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 08:55:05 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::c3) by AM0PR01CA0149.outlook.office365.com
 (2603:10a6:208:aa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 08:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 7 May 2025 08:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de7BE/x7XdEu6m0XebNtLk98F7lk/Rbufdz6a2DXVf75CU9sJteO2diS7yRcexPNINjLxXB2e/EbyAZC/tH1jozGDSP69shtKCYIZzSD3qExOT8Ozf8jjv7rs3iE7e9DpORPzXoSFuDBksy1ncgFIWl9ME6lRHEb9GTbm315p+wmTajvMwXttiRA1Po2ne1tombQ2209f0HeY2+bG6NK0++vb9RX27xEKM6U+imhj8Ky7rVmu2xWf2XugcqJlXevRP57qXKs008MWLDq+ZV/OSTt03321tA/XFDfYAl5AKlhFJLHgCexK3ZsBbvsSdTjlgSVolv+Pbrb4ZSsIHrsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGjOc3g774OqE3xu7HGSmzFgnIeAVpvvmi3dKRjtlPo=;
 b=lq227TVdm1pR7vq90DW7jrEwTQ6FpPZcSqZ88ia9hPzjo2OvHDcX5YH/8XjxS9DHu7XWoCmM70uXMJXYbk2uTF1nlf1Y6I4/U45A816van46i+N5mIw7IYBoLkhQdffqWfDcX45gamxaEPhacMSsOddWadw0LIwq+rAOjW7PxLTm4t8dexR9POaw+LW9tYZizuTvcBQqcez5E6rlE9swrEcl+VMofXU5Lm9F6UlHIqnwXqFUrz1DLcaSCKXDUEKwbADqOUR/MrncSHsM60kA9VrIjl0Ag9tSRLdmlrs0a4M2DRB3Mu8yF38yKaziDz519EC2Drwrb8rx374TKkhEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGjOc3g774OqE3xu7HGSmzFgnIeAVpvvmi3dKRjtlPo=;
 b=XVKov9FHmr1i4Y63s/ciU6/nicpjV91kXMVHXi3qcrr7NdDORNKZ3zjGCemoovxF+kLRFyg70uF1vZotzl5PV98R1csATYGTiA5OcBzg3FbXcYOBC6o7m1P5N9BRqwBTFOcY07SH6yQ0VC7AeBSqEO04awUY/nVq2zFqHN8jJKE=
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 by GV2PR08MB7929.eurprd08.prod.outlook.com (2603:10a6:150:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 08:54:28 +0000
Received: from GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33]) by GV2PR08MB7955.eurprd08.prod.outlook.com
 ([fe80::360d:c6b4:e158:bc33%7]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 08:54:28 +0000
From: Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Cristian Marussi <Cristian.Marussi@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Girish Pathak <Girish.Pathak@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: Re: [RFC 0/7] pinctrl-scmi: Add GPIO support
Thread-Topic: [RFC 0/7] pinctrl-scmi: Add GPIO support
Thread-Index: AQHbvbH1baCyRuBwfkW0hD4gPws+pLPG3c3C
Date: Wed, 7 May 2025 08:54:28 +0000
Message-ID:
 <GV2PR08MB79552803E3B3DA652899F242EB88A@GV2PR08MB7955.eurprd08.prod.outlook.com>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB7955:EE_|GV2PR08MB7929:EE_|AMS1EPF00000044:EE_|GV1PR08MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: c80e9aaf-f3a6-4740-1ff8-08dd8d44dc40
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?ZxR397VU9YYk/rv7eJsRrd5FSRdxdnDsxRCtVoqDOg+oNcOYdvyxtaDduG?=
 =?iso-8859-1?Q?eRv1o/aEBuDG1Rg0ujS4+F/9k8F5RtJJEYl24olN41YXgDcIOTWoyBL+x+?=
 =?iso-8859-1?Q?CsB3SLP2IFKjXGpmpFdfS79XSfTBAGIRnlZ4l8Kg1K1EBEutyD11zQbX3H?=
 =?iso-8859-1?Q?Jj64yiFQX5s1LHkcS2v18XqvyzduGOX4lRFnEomOXQccQHyDZawvUfQkOk?=
 =?iso-8859-1?Q?+/97+0DZM8+nKBct+JtAEDvdH4FlqLhLa1BQpF93NCKAApzJ4xBwgCjO2s?=
 =?iso-8859-1?Q?cqq3VGEvfdHnVD/BRQWbsYaW0UreLBCKsMDV78PKiUEiAG2G6H+dPjbrEj?=
 =?iso-8859-1?Q?BeW2XjR7vNOWUaG0gfT8eazBdXs5tLTQX8gPIOb5fviF0GhtaxYkXTAUKq?=
 =?iso-8859-1?Q?H/yJ8sljFbUUClNVWGH8q5phup0tOEnpdoxudgtrT9AGsBy6WGb7EBas7c?=
 =?iso-8859-1?Q?hV5Ydg0XjYha84nrLCBwVm8rkLoFLobX1GcsdaeP+LsFZm2urNzNE0gtin?=
 =?iso-8859-1?Q?hYsjAxCrklAM5lLYa01zxsFEM3+fNbDxLpig5bjwNXhy0JfHZi1RyAw6DP?=
 =?iso-8859-1?Q?BYAgcIaugbfC6hbB1xX6J1Suvd2NPgWGySkoE6ezLDWYCJJ2MktALgGKns?=
 =?iso-8859-1?Q?/91Xr/X83M2qbBddDXijzhFygaeRhh4U+4+cZJyRtNAtqe6qkSAWqyjEmo?=
 =?iso-8859-1?Q?QJXUHb5sdLP/5HvGDN0XRD/xm8cuq79IER8XJWN0CTC+MQOTBzk5ilD1ja?=
 =?iso-8859-1?Q?Yq+n8b/QGz/E7BtvsLRId4ajgwlUF0RFAtc0MY43XBGZ21aNK9d4ludB+P?=
 =?iso-8859-1?Q?nK6dSHC29AzY4FH0/UErWRjuLNBzQ4ew/338KAC7x4ZK5ZrFdV4lX+hsKY?=
 =?iso-8859-1?Q?usjAKIKNdOddz5iN8NeJ2X7+I7AsLIOYUWvUGuE0ySH2v6nvySRFkXYcP6?=
 =?iso-8859-1?Q?uwAWsaAviw2W96k2sZSR8QJjA+Hbk/jSEeaFAOFcJ5OabopLrJoLc9hAHs?=
 =?iso-8859-1?Q?HVWy/Q6SA1y/ErTCv/8wr+Baec0ECfY9sXxYIF8yViXD5TgBvbk+KapKk1?=
 =?iso-8859-1?Q?4Rhqkp0YZ9GAipy3mEuOabzuvHnnAN5SBz69mtggNQo9hac7Ttd/8aukd6?=
 =?iso-8859-1?Q?1ezSkIvtFYgMQNdrj2M7EkBgzVwLWlG/DlQDnfmOasIBW5DReAF1u1S2js?=
 =?iso-8859-1?Q?iOy4caIqAXINfjnQ7mSVyOkgoO0pOt+YMGje7lk8xIWm3Q9lJy7jMtomFl?=
 =?iso-8859-1?Q?AOvf38kmUZep+JQgnMFf5NAckgOyjOSGY6Yq3qVhOdL0wBuOF1rOQOaCdL?=
 =?iso-8859-1?Q?VeHk0zBHPXdbQ3P5GXt43B2iwJBHGPou/vM+BXl1vymsYP9iqojmZXCPX4?=
 =?iso-8859-1?Q?YxJ+O5/ozESf+smh2k9sG9mxuuykklikLoA/CF7oTOkYR4p3Wf+TfYbrIP?=
 =?iso-8859-1?Q?QQ9rX5vDHLMxGjsvjW60QUSFwP0dYkJTNnFl/sHvtidOuK0ZZPOKQlmqUR?=
 =?iso-8859-1?Q?lNv2Ic5MnPTTb33eaMdmzZpLCZ/lzCCdDl9eEm69MQv5R4qZFLwoLnErBo?=
 =?iso-8859-1?Q?tf9q3BI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB7955.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b299602-4092-4f9c-d86c-08dd8d44c68c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|7416014|14060799003|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?W64y5Zc9BQ97BhcNwQJ8owHC0I+Ssw+w/ydTWaCPA/xPccCcq15DbwV/Qv?=
 =?iso-8859-1?Q?DIvekcG9PnKqPjaSF+evUE2ygX4AOIQkP9/rblj1bcW4KBb5GJGvtxAySL?=
 =?iso-8859-1?Q?ApEDkwlTPiSSIq9/qWImQzdPlGoMeosF9qAMSxcLu8XNrmv8/HzYobwKK2?=
 =?iso-8859-1?Q?k6p29lo97lOTiEVYZulx3HWa363fn+t14pPhZzoLtL/6rTU5rh6S/9D+xP?=
 =?iso-8859-1?Q?c2iriPQpWMzhX2eXIKApVdsOQIpke1e0c06pA8e4u5kaDbEL5eEcHcHsEQ?=
 =?iso-8859-1?Q?thqMNlK+Dqe4hwY1c2YkOW7hEzQb7KC1i1iy6RiwN/yI90UT9mHtpN8rmp?=
 =?iso-8859-1?Q?Y5FnhNm4dQt6Pk/bXebFGfX06NkRxQJuv3Qcs1Mimf7Wv4LlebsFQ00BJd?=
 =?iso-8859-1?Q?meAE08wTOiacS3Zknm55pnwtRe3aLA5GwSHeyp/Pph+5KR2rWzpfKUObS3?=
 =?iso-8859-1?Q?AJ58Fi+7/ElKnWn0q9M4L1V1eEN9d/Xq+E7Z7gxQNUwElwdJeUTLwO4N7u?=
 =?iso-8859-1?Q?5oFo9Ncg/3rCD6B12MlKcNtUR8ihyGDMqxLvenwki7/px7p+wwD7jjWdm9?=
 =?iso-8859-1?Q?L5wQAm+riBfDnoSGqdAyJjsx9mPkGjJyNKgEQ9+lajvGSyYHeBxt9MPRvG?=
 =?iso-8859-1?Q?kki8g8mU2QZT4MAfBVbwcLRAvtAs+Nf2wVlcZIeBEO240yEES6XDq872ax?=
 =?iso-8859-1?Q?CqFXPTs/g5dyIaqQ5z8L7kmVk/aRn4VV2F8hQ+JFmnhmod5FYrsUhQJzy7?=
 =?iso-8859-1?Q?rD2r1rEZZBBNoD18tOCIn9sy//K76i+ardp1kQtk0Vbl35lNG38wH1b5EH?=
 =?iso-8859-1?Q?xqmByI7jKDLO8wbXtNQBmQgXwnuuO+6cd4wkQTcjbPfH/DteboStl7QgwE?=
 =?iso-8859-1?Q?/VDIvE5deNdC502oaVovDBE0nlK6O1LMvfDvoVFCc4K1bRTTiw2Mcqm8yA?=
 =?iso-8859-1?Q?m7x0K7u5X2jmvjo0o7WevDANo9iKfWLe14zFiXQsuGUkD+lYy5tZlj+P1K?=
 =?iso-8859-1?Q?JZeK6NBuzEe1PORBnNwPe2iUidypcrASOgkkk9/wGGS3PTIJDqhT5fi5GX?=
 =?iso-8859-1?Q?k4FzMhkG0Kp/rUWQjbRC5/FNu+j30JEl1m8KRlU7cicTyxxkJKKJyz36VI?=
 =?iso-8859-1?Q?4SXGbmohBS5k+++aMZpMQvXZJyO/GWXqirbd1aI/1vUjEnrUDueP1/uQQf?=
 =?iso-8859-1?Q?p+iQgjq940GzS5SSzkHEE/aDER3ANdIbnBDDz7vfyRfRMlholLlNyPsa8e?=
 =?iso-8859-1?Q?ETrBQOl8SLoB7lS7N5KILDZaTrAjVjT59tadrXKbjqJk182NYjRZ43chl8?=
 =?iso-8859-1?Q?XpNc/ZCdrmAx0JL2cgjZueV3N15kKv4km7/kSq19kYtgqUNUnw/BQz6PSt?=
 =?iso-8859-1?Q?iKebCvFoUQDqu+XT/DxgU5iZe3ufprfQeRF8Dw+5CmJLri9W84nrHnjc9Z?=
 =?iso-8859-1?Q?D1XEw+Z5extphWbKE++603rx/viR8KQvwBDOWyuJJGnV3C8DWbT8/SdIz4?=
 =?iso-8859-1?Q?GpXxLC87EkGdXYMpRFYIyEQDEY+qh4+Xb+FX57K8kGOPq4+8YdB7ZadLS+?=
 =?iso-8859-1?Q?VjKecZ1+LVC4JVtT9k9ULDsp4jyq?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(14060799003)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 08:55:04.8107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c80e9aaf-f3a6-4740-1ff8-08dd8d44dc40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8284

Good morning Dan,=0A=
Regarding the scmi_pinctrl stack design, what we have made in the SW is tha=
t the stack can communicate with multiple drivers with only two constraints=
:=0A=
1- Implement the interfacing APIs. which is declared by the object "struct =
mod_pinctrl_drv_api".=0A=
2- Integrate itself with the scmi_pinctrl HAL or backend as you prefer.=0A=
Also, we have an example I can discuss if you like.=0A=
=0A=
thanks in advance=0A=
=0A=
________________________________________=0A=
From:=A0Dan Carpenter <dan.carpenter@linaro.org>=0A=
Sent:=A0Monday, May 5, 2025 12:36 PM=0A=
To:=A0Linus Walleij <linus.walleij@linaro.org>=0A=
Cc:=A0arm-scmi@vger.kernel.org <arm-scmi@vger.kernel.org>; Bartosz Golaszew=
ski <brgl@bgdev.pl>; Cristian Marussi <Cristian.Marussi@arm.com>; linux-arm=
-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-g=
pio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-kernel@vger.kernel.=
org <linux-kernel@vger.kernel.org>; Sudeep Holla <Sudeep.Holla@arm.com>; Vi=
ncent Guittot <vincent.guittot@linaro.org>; Khaled Ali Ahmed <Khaled.AliAhm=
ed@arm.com>; Girish Pathak <Girish.Pathak@arm.com>; Peng Fan <peng.fan@nxp.=
com>; Takahiro AKASHI <akashi.tkhro@gmail.com>=0A=
Subject:=A0[RFC 0/7] pinctrl-scmi: Add GPIO support=0A=
=A0=0A=
This patchset adds GPIO support to the SCMI pin control driver.=0A=
AKASHI Takahiro did some of that work earlier, but we decided to make=0A=
this a part of the pinctrl driver instead of a separate GPIO driver.=0A=
=0A=
I'm not really sure how the device tree stuff wires it all in.=A0 I've=0A=
been using a mock driver on SCP with virtio to test it.=0A=
=0A=
Dan Carpenter (7):=0A=
=A0 firmware: arm_scmi: move boiler plate code into the get info functions=
=0A=
=A0 firmware: arm_scmi: add is_gpio() function=0A=
=A0 pinctrl: introduce pinctrl_gpio_get_config()=0A=
=A0 pinctrl-scmi: implement PIN_CONFIG_INPUT_VALUE=0A=
=A0 pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support=0A=
=A0 pinctrl-scmi: Add GPIO support=0A=
=A0 pinctrl-scmi: remove unused struct member=0A=
=0A=
=A0drivers/firmware/arm_scmi/pinctrl.c=A0=A0=A0=A0 | 146 +++++++++-------=
=0A=
=A0drivers/pinctrl/core.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 35 ++++=0A=
=A0drivers/pinctrl/pinctrl-scmi.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 213 ++++++++=
+++++++++++++++-=0A=
=A0include/linux/pinctrl/consumer.h=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 9 +=0A=
=A0include/linux/pinctrl/pinconf-generic.h |=A0=A0 3 +=0A=
=A0include/linux/scmi_protocol.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +=
=0A=
=A06 files changed, 339 insertions(+), 69 deletions(-)=0A=
=0A=
--=0A=
2.47.2=0A=

