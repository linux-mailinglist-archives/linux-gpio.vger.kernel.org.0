Return-Path: <linux-gpio+bounces-35836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO6AHfoG82lHwwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:38:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FAA49EBA1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0E223038296
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD3C3E3DB8;
	Thu, 30 Apr 2026 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lQebp3x3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA93DD507;
	Thu, 30 Apr 2026 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534540; cv=fail; b=O/3hjuit2RAwFDeKAhW8uMZSMsrOlzk49lKMFbi4XRJiIMWwA4RYLvywmgLVQJiuGV1azrDuwgXtSBIPxlWMaJsjFqBWtKi5p8VtHTHALkYEOvnhcKcKDOdL105++u5yUl8CRxWKP/p0TZt3YuTz1I7f15mnZhtj+E2wxcB3T/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534540; c=relaxed/simple;
	bh=Jo2/iJegAKPaA2pwbEv/roz6BB+otnzGZ7vzd7y+C3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jCpEIEiycPpaJ01rCzLmCPEKEujhw3IzOFDpZSRLXbAp/nDnnr7k0wTO6iec6w6wbivYUfh3kwQDjI6v0FDG4tuIM3Vj8upLKkmsX9hosfnsG5rMsDWEcTesA0r7XtJrWikKQKC48pYZy7e6skJiXwu61KKSZmYIRo8S3GXWfbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lQebp3x3; arc=fail smtp.client-ip=52.101.69.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDnH56gd9Elaol8WWbELb2LeLH35e7wmNt8Iw0us/3dDH/1xrEJVFFH+8gDJnyI3T5Z8SvoLYLk+omNk4qv8wVu27Ad/oL/bsJjTJIkGyUCkRBnMwV8VGAFlXUUcv9He9mKT/vwljqWQiL28fvRXvDQ2EW+0mMlSyLu6WECQkHqXWBualk2TR0c5VdApyl2UL5dfzJI9sNfLNWHFAjqifhlC4OQBMN/pqYeFkdh4c6zEcYhmn1SmIrtm2XPu4ig/LO/GM/v6xLpyXz42XBHVpjjkJy1of7kUoOaUH/djKGb6mu5uUcXOe0IYdT3+j1gwmTDAJ/CNrQerEZQtjh/YaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pneKoFPOr3lEk0e2d5i8cR1OG/fa9eh5Fto45YScXI=;
 b=yjc1pBc3wgHgEK3pGicbfG+bHL9drVvk+YgsSsyhmJA8sIvzOyeApyDT8llWMPWN/sGdykBSRZrCbmy7Tojv734vZigSMVTzOUN1s+YXGhcbHF1swNbciIVxlbAHl32oaCfTFVAJfwny/T62XSWciJtuClY/ARYQujU1IR7BrNpgcCvGs42aGsL6y1K1oqUZic0FFRPNx9Nr3H6kMjj3/Tlg2uVAspqH2sRmuCwElSuz//+iHlxBWg0yqWhX2AB8kkbYy2K7RquosrQMfOjnEwGyB14UvVXuqLtAtBbB14NZTCaOLNbONOpxuLOaTFrrS6QqSBzVucqaARS42C+O0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pneKoFPOr3lEk0e2d5i8cR1OG/fa9eh5Fto45YScXI=;
 b=lQebp3x3RseJNufjUygVFGATwMy+ZBf/ACskpgmWFoHqtD5RmzZp3TIm2MXLNlnr6JP/uKfHuiSN7y40dFgfjpS4KazNeXu/W9XsvdG1+N9BTa0t+9+KOFw/90zw8b32tVMafZDFzip+wrtfS0G9oc7Yk9LffNc+N9jl+0lKiQgj98DEGtWJm2BOCcRqMkbVq0zHasWR1V5f1m+Tl43YAo9fU9Z7tSNnZclYSOCMYKkFXUgXZ4f2VNhxYD/bNUwLETT+bI29VgWFMDCmgfMhCwhrm7E9cJx1YfGwNAHFEwGDufMrkmH9xJat5F9WzwlG0AUIuAQrWsXdvi/WuX5GLw==
Received: from CWLP265CA0536.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::18)
 by AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:35:22 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:400:18d:cafe::34) by CWLP265CA0536.outlook.office365.com
 (2603:10a6:400:18d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:35:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:38:54 +0200
Received: from [10.252.1.69] (10.252.1.69) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:35:19 +0200
Message-ID: <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
Date: Thu, 30 Apr 2026 09:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Padhi, Beleswar"
	<b-padhi@ti.com>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, "Linus
 Walleij" <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E1:EE_|AM0PR10MB3699:EE_
X-MS-Office365-Filtering-Correlation-Id: 90430ee5-f5e0-4dac-5cdc-08dea68b093c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	k6o8L9FWcR+koAakWZ3Km+ql5lK37LofF88gN9Mu7Rdn5XMTaduUNG1OnK6JBhxbqTp33EPkYD/Xa7QWmZ2xwtD3WUz/ntkuTgkXZNGcvNsM8I4mOagHLujUtqWwo3GxxuV8c8CKIfNYGT8lEC3HRKwBeNPCQc/gw3mH38LIeLP+BY8lK3wHbyXMu4ERKEUXBeHGXqnCl4u2gKOs7jFsjv0dapKNs2V1rVtSYIJyCEGX+S8WME0YNTyYRwsLWYt+eUqXZY3ErIxS4Tx03uSgYnBGRPlvvTzJX+jRcgv68ONK2Ti7JDoqBohkQCGNI6qkRs0asWmSoONLKSnjwd3ov4bMK4EYru8AFMXGWdARg/y4sSTW13w0RG00rMxoCWhyFv9ncce5fMkJKjg5GCqjPIEp1c+YQlqriSzk22bUmxBUrH5hAUShixV7SPT/7BHuzBeDOML2ezT4OpvFBU87kPf9gUlzLlLHQXzijLwiqgLdE7GJtxMaVnhkir28Mb4NvMtIKa1ngGoF6tktsvZRbPVF2dOCsxWb3qOvgPGMUM0RGYGHI2E/OPwITElz5pVKZd5ot/BPIgndtkcmySbf6JuZaUetu5goAdAbzPUA+zjTS25lFi+Ahg4kXaR1zRdNUM70CMbLpKeU2KIl7wu8CiMMlK3Ym/vehVF7DfQhNTsPYHZE07C8+6L0XpQWjQQo+b35rItcQu49iyW3xNFakkwZR0VkE9cW2UfyCdBzSuo=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MQ01NiTefcwNJDosQDBOxKWpqT79y+o/FklGfeDfmb7shiIS0fAB1N/1s+RjXjICotgz8RefpdTUNkDqla0RuG/M2stR+UYE8vHsWajGfyvLjtvg+RMQIkvMpSXZBys/G144qxf6qqW6GhjXETqCf2P3NC1N1CHeowQ/wVHyNFiStY8X2RfyE9hhIfXft10xDRkcDSQJjH08tu/RRjb3EG+iyE7bBviUfpj2EN89URv3XlypW26dPE3GCDGl3MZwEhFWTpMvJv3AT/euJcxDC3U6SEA5d8tbjTBcnaDmvILmVpx6p17GtmyoBdGnyrG9xgTVietX49c1LFU1TKcW/lLj8dZ+meq0TkkIelwFVDO6KxkmbtoIEvL2NWEPmCWXWb0eCxnJWa/5R2oOQCqF/FPPKaqAdEbkGJ0LLD9e/OAvhVf1MuCMaDzbY3M18J/g
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:35:21.6269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90430ee5-f5e0-4dac-5cdc-08dea68b093c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3699
X-Rspamd-Queue-Id: D2FAA49EBA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35836-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]

Hello,

On 4/29/26 21:20, Mathieu Poirier wrote:
> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>
>> Hi Mathieu,
>>
>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>> <brgl@bgdev.pl>
>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>> GPIO driver
>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>           __u8 status;
>>>>>>>>>           __u8 value;
>>>>>>>>> };
>>>>>>>> It is the same message format. Please see the message definition
>>>>>>> (GET_DIRECTION) below:
>>>>>>>
>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>>>>
>>>>>> Some changes to the message format are necessary.
>>>>>>
>>>>>> Virtio uses two communication channels (virtqueues): one for requests and
>>>>> replies, and a second one for events.
>>>>>> In contrast, rpmsg provides only a single communication channel, so a
>>>>>> type field is required to distinguish between different kinds of messages.
>>>>>>
>>>>>> Since rpmsg replies and events share the same message format, an additional
>>>>> line is introduced to handle both cases.
>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
>>>>> uniquely identify the target controller.
>>>>>
>>>>> I have commented on this before - RPMSG is already providing multiplexing
>>>>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
>>>>> one GPIO controller.
>>>>>
>>>> You still need a way to let the remote side know which port the endpoint maps to, either
>>>> by embedding the port information in the message (the current way), or by sending it
>>>> separately.
>>>>
>>> An endpoint is created with every namespace request.  There should be
>>> one namespace request for every GPIO controller, which yields a unique
>>> endpoint for each controller and eliminates the need for an extra
>>> field to identify them.
>>
>>
>> Right, but this can still be done by just having one namespace request.
>> We can create new endpoints bound to an existing namespace/channel by
>> invoking rpmsg_create_ept(). This is what I suggested here too:
>> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>>
> 
> I will look at your suggestion (i.e link above) later this week or next week.
> 
>> My mental model looks like this for the complete picture:
>>
>> 1. namespace/channel#1 = rpmsg-io
>>      a. ept1 -> gpio-controller@1
>>      b. ept2 -> gpio-controller@2
>>
> 
> I've asked for one endpoint per GPIO controller since the very
> beginning.  I don't yet have a strong opinion on whether to use one
> namespace request per GPIO controller or a single request that spins
> off multiple endpoints.  I'll have to look at your link and reflect on
> that.  Regardless of how we proceed on that front, multiplexing needs
> to happen at the endpoint level rather than the packet level.  This is
> the only way this work can move forward.
> 

I would be more in favor of Mathieu’s proposal: “An endpoint is created 
with every namespace request.”

If the endpoint is created only on the Linux side, how do we match the 
Linux endpoint address with the local port field on the remote side?

With a multi-namespace approach, the namespace could be rpmsg-io-[addr], 
where [addr] corresponds to the GPIO controller address in the DT. This 
would:

- match the RPMsg probe with the DT,
- provide a simple mapping between the port and the endpoint on both sides,
- allow multiple endpoints on the remote side,
- provide a simple discovery mechanism for remote capabilities.

Regards,
Arnaud

>> 2. namespace/channel#2 = rpmsg-i2c
>>      a. ept1 -> i2c@1
>>      b. ept2 -> i2c@2
>>      c. ept3 -> i2c@3
>>
>> etc...
>>
>> This way device groups are isolated with each channel/namespace, and
>> instances within each device groups are also respected with specific
>> endpoints.
>>
>> Thanks,
>> Beleswar
>>
> 


