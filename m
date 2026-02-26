Return-Path: <linux-gpio+bounces-32228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE+iIGspoGlIfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:07:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A71A4D30
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98067302C17E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677573358D1;
	Thu, 26 Feb 2026 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fphy8PUm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fphy8PUm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221731AAA2;
	Thu, 26 Feb 2026 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103949; cv=fail; b=in5TG5KIL0x655NvYiaGwCVmLfNH2gN8/xdZsqBZ6192XXWeGztNOyGyIyGJGY7+KDW4rF+ikdavX8loFJd9LZ9CPQHjAcR0f3tHVRRrdpQO6MwObdTe+XQBxgTu8XwdbLENzvr3NsADJ0OjHCjnH/GtTRjILYRW3TZMXoGYuLs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103949; c=relaxed/simple;
	bh=Z6AMSm521oHBNxpok6cPYTkzTrAMTojeHbgzQ/pAQzQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BX3BM8Sk3gI8bEQe6/h+9+N7o5aN4wxhQ7zReDe3f4X3DPsQTFceNZ+rM8+S0y/Ts/+vOD3uRR+4q1TWiZ88sgujZcKwpaLINKXR7xb8gSKwCdM447IL64P/HaSZiidyJNRPS8tvTp7K0tFZDofgsp+RDYYhKnsJnBrcDcaDv0k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fphy8PUm; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fphy8PUm; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O6O3xP6TRi1H47nHVxBGe7qU98ZH85/dR0sBfPQrncRndLaTTgbQnQPNwjE5ZTEO2Qs5+VRynzxQ3+v2RnryE65BaKKEpcOfjfyhl23n4kxlHfYX3iAUz6ACBC5JP//zjsCUPDX+r7y1vSuy0G1YXWUL2FkYzpna7Uc9y/WR4XL/hzd/Cs9dSlsRMiL2VFlkpAnxffOLo+wxbaiim3TS0MI2xODQZATCcT4ePPPozccppFF8n+pWXtbbey6eWB00Jn4UhCaCmd0X+V8JQOx3Z72kePeakGUZTOZ+PBit1n/3/ClH+vCTQ9mswNmLyNiKIuoliGfrUkIHS8dEDiN/aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=ZLOo3soJCSehE7WzFiL4c8CS1uGhFlwKvFOgyG+7UxiozrzmcsudCEoQAjK5/3hIJo8KP/xV08o0uw6nR0HxqKV4kHlNH2MIGcDya0jzTkrZbEwAYih2SW1xvE3Tw3EcyYk1nJsORkKFVUfTaFZzjA355H8zl1bai+h/EUnEoebKH37j2LxG9YtaPdw6HWRQ/MzT+N6oGtpy28FuIw5q+NX9AC+ZnvYXslAZXF/N0EcCZg0PlGLTy1yZdfOtFda1TtxvazwU6s0Pbppdy25xyo+5CMkYlCXJgsS5ORzcBglcO+PLOkQ68itiWvn+/LynC9dTeApcGum5Qeowy1MBUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=foss.st.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=fphy8PUmoOnzcD8PCiY3MZJlmn/4tJZXL9d7mZoQk10IrH2OHNpoql/Ss9ltHoXRtWxQDbGtSt37Aufu3o2fGn8PVFyv4/MaYs9ZLj7e3YBjwHuN+XH+CRyEYaohVurXPzUWNLtVqbPYOq2eR1rtS6bj4xN/hQzu/x4bLdG21Js=
Received: from DUZPR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::10) by DB3PR08MB8940.eurprd08.prod.outlook.com
 (2603:10a6:10:431::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 11:05:43 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::47) by DUZPR01CA0179.outlook.office365.com
 (2603:10a6:10:4b3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Thu,
 26 Feb 2026 11:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 11:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG5CzKKg9a5YCzwImXluMIPGQM3yJyubeeSm7u4WL4/MrXe1St0T4jk9SrAuakhl+14gIC46f4h/MCcky9toKxrsJntlFELbNAMbNsLfvCRCMiFn8ZqKBo4J/7S/QwP9SChhszjErnxsNtV01HegD74T8mVzNYM8Q9mle+MQaurF7d01zXJdH5r/DpsKSRjayZH3FKKguz5WvmNm2HDcIBhTVNpApnBFtmwzkHvsKqyNkRcMzFkQ8Ec6Cr/eCdeInZXP++44r0JHeI7WqruQGiV1fvcZVhMnqoiYcOzDBo9/V8xUZ2RZyqp6Aq1nRtVgI6+sBdiX/ZxNq0QkETiuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=Ju772H8g0I39yTAJTRm/ZtifGkxs5IBYR1eylE9qbubGEpyYZQHazqYru1+gxnZwUbswgelQy7ZRThol8mi51Fj9C4OK8817OenUT9Y8LbIiByzZByWNkXZ2wxkNL1+iST2EG7T9QKNmByg1nMnfMZOA9apddtatC2sXuU+JJ3dFVJQlnhnuVzw2TuySuPgL3iMZkSIc70D51RsGrNvNuNILUPonxtqzSKeZehwuaWsSurAtqaj92vZ3It+BNcQLm2QHSxCok4wYVp0vlg67mmzFqNb0b2fVkV2azvLm2dLJvAgj166rXYer8vry823b3Fkz8K8eXabNfHmqxsdLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=fphy8PUmoOnzcD8PCiY3MZJlmn/4tJZXL9d7mZoQk10IrH2OHNpoql/Ss9ltHoXRtWxQDbGtSt37Aufu3o2fGn8PVFyv4/MaYs9ZLj7e3YBjwHuN+XH+CRyEYaohVurXPzUWNLtVqbPYOq2eR1rtS6bj4xN/hQzu/x4bLdG21Js=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 11:05:15 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 11:05:15 +0000
Message-ID: <b2e8dbf1-f492-4fab-ac17-8237a759a427@arm.com>
Date: Thu, 26 Feb 2026 11:05:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] dt-bindings: document access-controllers
 property for coresight peripherals
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, cristian.marussi@arm.com,
 jens.wiklander@linaro.org, etienne.carriere@foss.st.com,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
 <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
 <7c60e928-d99d-4341-966a-eed759069f5e@foss.st.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <7c60e928-d99d-4341-966a-eed759069f5e@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU4PR08MB11769:EE_|AS8PR08MB6631:EE_|DB5PEPF00014B9F:EE_|DB3PR08MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b682ac3-058b-46ef-0aad-08de7526fbd2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 Ck+xwoKXH0aOrC4IC1U5s1rX06ERh7WIeaqI46P+axK8D+JOtYJd1szaXJY6ZNb/oRC7sDkIL6EV5Ki9euvwxMHeBTClBwkV7UoPzYDvReqyT/k1q819fMgK9e3Lm3woMODfu55ISJPIrjj1LZihYbYBpDoy+Ly04xRaEsa6TRGvqnLDFUOPRNQ7dvlc1K5fmdxTh58ESmFRPF7gdttJeHJrSTPKHq70gc3Ivnc8yypgI3LIWWiJ11gGn3+Zm2fCY7WmA2MXwksg2KoLDDZVAGLqK58QYzIuvunDeJFzXeKSACrov63ppjfX4k8TQI7WShbBzpJK0A73bNkAzWdW6tz9DNqFTTekORhOgfsyzV5ZhSJm6azbpSJ/fMcW3/2uvzych0HF3j4dOTdmL3zo2n/kisTKgdFP1tDFfyU8m9j9+VOn+5KZot7BByLLVQqqj1W0pDBjBdpJ8PLmKfkXMZoJAAH969djgQu/qgpU5keoAYpOB4gae5eqcyBgG4VubDmgszUiua/Q3UHc+Fty7VxbLbPyCLSMQONAtz+MabIoblYmUyxP1icXzAo7oRIJTN4oyAtVvzfiW3Wj6a+ts9YuaZblgolHgjozRLK3CFjsg2ABFVR25ZgTL7+6BkPXCWnWZHbzOWVxjlfcaVpdnB/MYTvF0vddJz3xVZWFvDC3QrZrhoGR4LXY+gNdpbK3qiE5fwY2+RCWlBa7GCFU7zNpAAKdLlQPNRzAyVrV8pDfkIUMFGV7VEC4ncOzuEDRuCdLriQIKbHv7/bsm8yP1A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2bc16013-572a-474b-6722-08de7526eb44
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|35042699022|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	4qBxew7zSmdeizISpR43bdtwZv2Z4jb59l8YKukF0F7sn3i5Rbn1w+3qaGhh3PlslO+CE8We2xGf3GAt5dczBP76yu0o9rK3tnwQnyVvCMxN3mldir3DTu62pASwm+cYFiUd2+jbTs0R3aWt71L2njQj7AxDqRmcN2aIzRK6c8cGF67/A1E6Xk2RrQg43gcdwEkSN1pbI6+BVzP/ooANj31JGvHXJ81DORXTFacJCGTqM7Kn4Opg/YAfumT6EKYo9bA4KjA0nU+2VU16GOuxLnjNVUgPZ9K157ef7LtAbEV4qYVLRIlRYtiUvp97SoyLwbpwSBksl/I7Ps6iWw3Q0KjHWaEjSiqqwzdgcAljCvPHyAOzNbHJhG1VoeFVUwAUwBXXa7wY474e6DzJF/CXM0t5AMcPueSr5xw+hLjfH7Quypy45lkJ58ODhZcvYfjryk43QvvhsYyYPN/NUg/QxZ1sdYSKMHwESbMfp2PDIyL5rDu5Shrz70CVaeTeZ8IieQZ+aaAf30Bi29ZULcVrxFYZ05lRLwvO50i2oo47CISOsAzfbj31F/KNtEiP9WPE34XcrOaN1hDRW32y+/eNa1O4oY1Yz+aPIs2Hv2zyhyXg9udOGLBUqWdCLUwCtGCgzPKS8xiteEDDU2MY+sKve+3xPCAKXN1bBMWoYzcv+IEQMnTKuA5g/RKQM453ae6By+6fDNrWbnTACm4kZVJ20498YxZYgGmy5y48L0pLlFB9xyehF96w2PpxWc6go6msavrxCwT7zlE4X34XgsGEAg6z6FXpY6IceBa7XsvXWc3rcw9kEA32IGrzBVK9ANp29WsAQKw8GOPLhPpg39VL7Jh0f/cTmoxMmnl0Xf0pnbg=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(35042699022)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v5RIaY7bw905NERDMCgKD0tlci8vTeJZr+AZvj+UeR6a6QrrGr5PzIQsTMIoetXF2cDirJkOwioIHWmFG8NO8T9Fbeb+t4894BBCfkQJ/pen97QV9uSuL2z4CFoba+aQHQDxX/Gf8BKVmhPl3mAoeI+JH2/Ab4bMfLHwm/K+JiTy2hXdnvNinpzw6GV+5KF4hnf7YyJkhR7C7+LE6o54QfMXyWBWJYl98CkjSRNaCbc3AMP5W5ChE+z5gqEfZRl3L6ZoQktLU5kWLVQy/G+K6WgwaR/oUxHwvB2m1q81BRiPRkP71KDFZnHJEztlW/HN9ZckeqNn5SPMCTxODEVnPPO6NcbXhyhj5ST5vnNL7F6nx4JswJWibFcI+MDCf+F2REOgYlLDqqg1/Xz8a9OmxQd10lTw7qH28TQkwuAGseq1JhDKNPfmRYLrqihyels5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:05:42.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b682ac3-058b-46ef-0aad-08de7526fbd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8940
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32228-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,linaro.org,kernel.org,linux.dev,gmail.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,arm.com:mid,arm.com:dkim,arm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D2A71A4D30
X-Rspamd-Action: no action

On 26/02/2026 10:54, Gatien CHEVALLIER wrote:
> 
> 
> On 2/26/26 11:46, Suzuki K Poulose wrote:
>> Hi
>>
>> On 26/02/2026 10:30, Gatien Chevallier wrote:
>>> Document the access-controllers for coresight peripherals in case some
>>> access checks need to be performed to use them.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>>> cti.yaml           | 3 +++
>>>   .../devicetree/bindings/arm/arm,coresight-dynamic- 
>>> funnel.yaml          | 3 +++
>>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>>> etm.yaml           | 3 +++
>>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>>> stm.yaml           | 3 +++
>>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>>> tmc.yaml           | 3 +++
>>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>>> tpiu.yaml          | 3 +++
>>
>> Are you sure, you are not missing "replicator" in the list ?
>>
>> Otherwise, looks good to me.
>>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
> 
> The replicator is not present on the Linux side on stm32mp1x platforms
> (Only present for the Cortex M4 co-processor on stm32mp15x platforms).
> On stm32mp2x platforms, it will be necessary so it will be added in the
> related P-R because we'll need the same debug access check mechanism.

Fair enough. It looked a bit odd to me with TMC and TPIU both in the
list without a Replicator.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> 
>>
>>
>>>   6 files changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>> index 2a91670ccb8c..949444aba1f8 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>> @@ -128,6 +128,9 @@ properties:
>>>     "#address-cells":
>>>       const: 1
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>>   patternProperties:
>>>     '^trig-conns@([0-9]+)$':
>>>       type: object
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/ 
>>> arm,coresight-dynamic-funnel.yaml
>>> index b74db15e5f8a..b0693cd46d27 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic- 
>>> funnel.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic- 
>>> funnel.yaml
>>> @@ -78,6 +78,9 @@ properties:
>>>           description: Output connection to CoreSight Trace bus
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
>>> index 71f2e1ed27e5..10ebbbeadf93 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
>>> @@ -118,6 +118,9 @@ properties:
>>>           description: Output connection from the ETM to CoreSight 
>>> Trace bus.
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>>   required:
>>>     - compatible
>>>     - clocks
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
>>> index 378380c3f5aa..f243e76f597f 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
>>> @@ -73,6 +73,9 @@ properties:
>>>           description: Output connection to the CoreSight Trace bus.
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
>>> index 96dd5b5f771a..9dc096698c65 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
>>> @@ -128,6 +128,9 @@ properties:
>>>         - const: tracedata
>>>         - const: metadata
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight- 
>>> tpiu.yaml
>>> index a207f6899e67..29bbc3961fdf 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
>>> @@ -70,6 +70,9 @@ properties:
>>>           description: Input connection from the CoreSight Trace bus.
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>>
>>
> 


