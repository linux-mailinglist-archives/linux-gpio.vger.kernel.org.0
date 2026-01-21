Return-Path: <linux-gpio+bounces-30860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IhjN6TKcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:46:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31D57046
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A7235E6329
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BC448BD41;
	Wed, 21 Jan 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HecBS6hg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904D48B39D;
	Wed, 21 Jan 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999014; cv=fail; b=OhhR7ss3ED31mRVvHfECe5U+Uvpu2IOhmqETKY8b6iUqveBUkUHwuUOosfhOArHov63pg+Z/u6awe23GD7XXw3HF4fX3o/3c8o2fYw81KR2Xszfg6E8qKnKF6nJ4yQPFlOGXBokdDq6ZNMNx5kQIse2RZTCuDwpqmGtWd/E4Onk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999014; c=relaxed/simple;
	bh=l6ZVfoWz5u4T3ZRCM94AGwRm1ba+4HRmvB4JiLZGWDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZS0JzhJBCLWu6i60Lg7AKd7Ol8jJUWf6Fe977eLAceiqBHBDC1mg92jdEDFZGjNotxkmws11q5ogSCXqGUMr6ukJgxjJPpcCK4nb8TmmZGyCWbKDVTNF9B7z2cFafvbvR1zUGBqc4HMKftjYWnXNqg/FbqUoqXuZ8WHvC4Exa6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HecBS6hg; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCTCMg516502;
	Wed, 21 Jan 2026 13:36:31 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btkkxtfhc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:36:31 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7LoXlr95smQ8aQfbu5xD7gnU3PMON44Nyli7WoSzfVKdk5N3nDMH7Aa9t7WFZg2kSsXWJGv22j3RzZsW2Ep9zbNlNk/AqkStmlivmENaHS0hbolv20ClphhOrafoDjZwYnS8ZFOy5RfxUBfq+O+YzCz07woxUxCLc+d/yWQZn4bko6bso3mN1PFlKp06g8g8VnhbqkDzgsQKRqtpqbulGnoaWRVhU1Wv0YNJSP7iCl2tV0S82AaC5RePz/Zofbys6u+xAoNel5Zu7s1fNmFdnuV3/Qb6/HtqHnIk7dSSOUvp+aRuTymY4srG6bqJmOyiZArElp1gtbzJfzE5l75iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=tkgknKoZ7ggcUxWC6xqpvlpmYzqRds2l6B0Mvp1FKBd092n0S6sm29Bco3ommGJhK9lTtXSBSlk+dPLZ5tWuIs0BjymPB6Lf9qyanJ/tAfvp9BVkwrfA6ux+AsxPDyJBh5POcwrhHbWpIfkUUWffHTZaDla97LDMrzh1+sIuMbvMjAcZpRm3MO8JytJ5EdJD1gBPDKlsecIHPrN+03ZulESmmB8knEr+ZqA0ahfdgkeYirZmtl30U5WrFMyTt0D/wH4pShfUX13OsxF5S6bnd6OZX53ytS0HbDTQfqK6sA2oonLYcWnrDkVdnLZe86eBHvCcBdKD6OBHAH8P+2902A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=HecBS6hgRYOZA4d9G9mmnl5XmorwGgZuadBlNN7VPYPj0H/7VQVJFKqNzyfKdf/MoU3trsQb0YC24JrL93JAAoRw+JiZDfwl0ffxQXX60Y87ZiL0qx0yW/iR91SlrcPEB2+iAkhgT9PMSl1AM4xyYY8PN41xvGc/Lkuw3ObGZy+PWnnsohJObzNuNNwtwTVOYJyAYPFzn4DgRc0PaPrJvurrzUv0LHLBqri894/Ib2z15MjYi8AATW4P41Kz3YqW3KdD0Juf+ZDjnw9YrqsNzos1yvCPOLJC+LGP69vYJz6/NFezaYhZd1aI9Tk6VEcU/f0u7S7oT5J4S99/fn0Dkw==
Received: from DU2P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::8) by
 DB9PR10MB8047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ce::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Wed, 21 Jan 2026 12:36:20 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::2) by DU2P250CA0003.outlook.office365.com
 (2603:10a6:10:231::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:36:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:37:35 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:15 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:43 +0100
Subject: [PATCH v3 09/12] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-9-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|DB9PR10MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8007d5-0fd6-454c-fa7a-08de58e9ab90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cllUbFk4eFprS3RONHlTMDJQYzczZ0F3S2JtSGdxYnZWUUZTeEJUUlFJd0FN?=
 =?utf-8?B?SlQ5T0RpejBDMlkyams1QnlhV1RYWUZDRmZIZGpaYjJYQ29pMStQQzVjZ3F3?=
 =?utf-8?B?QjVsSnVuRWp0K2RlRFpDN3kvVERkcVlTYUZIRmVoNDc4ekt3TkVPMWIybEFD?=
 =?utf-8?B?MVpOa1Fqd2ZqQkcyRmZlYnlNUERrRGxucHNkMWxmNzBJYVF4WnBCZzBGNk9S?=
 =?utf-8?B?Y0xnL3RjanlMZ1hFM24zM0RoYnpEdFExMUR4TnZVVFlJbitkU0k0T2RJMnRP?=
 =?utf-8?B?dnVrRjVVT2pqWlUrSkxkSHNXOVVUckZzTmk0TVduTlU0Yy96WmZ4T2g3dmxK?=
 =?utf-8?B?QVZRWXVhSmZOYW5VRExHbW9HMytydCtJV096a20yNHdSUTdkTk9zaGxJMjNJ?=
 =?utf-8?B?S3lpOGNDTk0weUd4cWs0RlNEWUFSTVk3dWQrL1Y2RXlncG0wZmhCSmRkYTNB?=
 =?utf-8?B?OGVzWWxDVVgyRjdHQjVFUWdGaDZDOGtqMGNQbHRhYm1tTDFiY3g2K1YxU0or?=
 =?utf-8?B?YjdTN1lVbW41L1ZsdlI5UEhUQTRXVXJheTVZaCswM2xoTEc2YzV4czU2SG80?=
 =?utf-8?B?ajhMcUlZY0RHS1dPeWFOTjdJTXlDUkF0YUNUckdmK3FNWFhXSVNRdEh4KzN5?=
 =?utf-8?B?SW04Z1RyZ2F2bVdKcklZcFRVcHEzeUJycnhHMFVybkRLNDEvRnZvWDhQVXhq?=
 =?utf-8?B?cEM4OFh2aCtyazlnQ2o2ajFzbHRML2djU1liSWo5NCs3UStWMHVxaFBoSDc0?=
 =?utf-8?B?MGdVQWxWOFRIdFRYcWRrck1iRUFTSlkwd0NiaUlIeGtsRXFmVXU1eFVEY2sy?=
 =?utf-8?B?TXJlTmI4OFp3ZU5CR2RNZUNJWVc0citNUFh4Qmp2Q0J5VE8waFZ6YmovOVZ3?=
 =?utf-8?B?UU1KM1pCYnJtUUlvUm81QXlOeWtXK3Q0bm9iQ3BRRmNiNU5TVXp6dk5GYXEv?=
 =?utf-8?B?T0tRaHBMTnZ4ZlRPMlNIdE54WERCK0UrN1VMQzA1dmVrVndRRFkzZ0c0dFhm?=
 =?utf-8?B?LzNUMHJ4UHNBODB4UUxxbFhIaXo3NEs3eGJ5YVNiY0paSHl2WGRhOE5qNWt4?=
 =?utf-8?B?TTEzUWU0QlZKc1NXcTZhNVVwSG9uZnZERnl3MnR5YUFETFpCRHp0VGZjVGQ3?=
 =?utf-8?B?Z1pTSWJMZDFkR3pDYjIxNWk2V0pMWThmVldJbzl3U0FmUnVQYndXL1VJelV5?=
 =?utf-8?B?andHZW4vOHlYNTMzVjdaWVk0TkNQQjltMFI3YVZSamN0N2R4d3BNaE01STZQ?=
 =?utf-8?B?czFLQXc5bTQvTG16Wkg1QmR0WFVqWUdZaHY0cW1YSFJTeGhpbCtuQU1VNElF?=
 =?utf-8?B?S0FMSGkxWGhBWUZEMlpSdWxqMWJYZ1JQNG44aXRMRmZaMmRwMjBSeFBYK2d4?=
 =?utf-8?B?c0Y4dHVocGx2bTEwcUZvajNob1J5NkhGelBiYkpLVVh4UVBUL3VHcHZGQ3lE?=
 =?utf-8?B?a0FXdi9hZzhxQktPYVFQV1M0R0tMVFBrQkNFS1lhb2VQWW5SWDRYM1d2anlz?=
 =?utf-8?B?Q05IU2ZpY2NQZndrUGpqMFk1c2luVERDVFN2SmVndi9xU3NGbklJZEF2cEsz?=
 =?utf-8?B?c2Nmd1k4eGphYnJtNTZnT2dIZHNtUytVSG54MFVHdlh2ektFSGVqM1YxUFNG?=
 =?utf-8?B?M2U0ZkdDWmV6eEJZVFBxMERoQWxZS0ZaRkxaRHRBZUpaNWFqRTZwZmhzTCto?=
 =?utf-8?B?TnkwWGZKMlJwS0Vxb2xPWFYyeks2YmpnZWREUkJLMkh6MGZTaHhFenh4d2Zh?=
 =?utf-8?B?N0NNaWNqMU9Dc2h6OVU3Y1VZMHZhL3V6YzdPbU85V29wUklsK2VuQjY3a2lI?=
 =?utf-8?B?cnJ4ZVcycGpJaDRhYUlTQ3ljdVhQZHhjdEhNNFZuY0JVV3pSSkhJMDBGSUNa?=
 =?utf-8?B?b2R2WXhERVV4ekF4bW9jR1NwV2RNaVVUbHhaNnVlTjVNaWIyeVVPczJUYTJU?=
 =?utf-8?B?QjVPM0tQdUVhOE1RZ053Z28reWQxcytsZlFSdTczU2pmZnJLSksrWFkyb1Fs?=
 =?utf-8?B?QmRXVWVuOXY1alh3T0VEM0lDTkpFRlV5T0g1aUlieldsSEJ5a3ZFaFEwQzVw?=
 =?utf-8?B?V3dIRm5BRUZ2eldqN01lWlB5eTVqMXRpdGE2YXlseGdtelJTcTVIS3Z5TG8z?=
 =?utf-8?B?QU81SGM0MXArQ2o0QmpLYU00VGpGU2NkakxZb3R0Y2lnalZscGtJWmRETExW?=
 =?utf-8?B?TU5NSlJ3QmlFRmhLN1k4YThOYlM3aEpkZ0N1SEp5Wmo4QnRkTmt5WHpCVjll?=
 =?utf-8?Q?Tydwtz3D6KY8WR4r88s7xyURpjrYJFruWI2nyfPuQg=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:36:16.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8007d5-0fd6-454c-fa7a-08de58e9ab90
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8047
X-Proofpoint-GUID: 8kGNAXjTE897OoiHAZ_zGLqcRhAey6km
X-Proofpoint-ORIG-GUID: 8kGNAXjTE897OoiHAZ_zGLqcRhAey6km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX3ldPfGh1PI1F
 AN5mVMeVtBWaVF+F0LJhWsJsYYGZ1s5GV58ksRKI7GGQvgb7JTRlIEVQYPSCTNQxTKa4UfCU4dk
 lfPjsk6EYctpaYj8QCxdKvdgsAi2a5gsCxSHYeSjPUGVsqrZkOB0/rUNLJQCKVcTtypSYjiuuV9
 1aN3XUllOGZ922S9OOcvrWeUKReTDiX1HGvYphEjq1V6M96nNvZvHdIc5Q5Byr1GbRLDAlayb+2
 96PJBuUEK5LiSebSeTw2amZ+0nuym484mAn2PgB5UIsP56U+kwnw5QyzXrtSBn/qlAsJ7D/V/os
 1w4+GgdnmRYsL2ovbS/ij2RW4wa2s8J/LOmoQr7FdvwfKbw70pmFiZnFBLg+5osEhzcM5gSPDNg
 GT+PgnfX9t8D5GwfOaZQlwKuKPnHaZOL/2XasfSw6VPCUSf1duhqPc6HLG14aiJdZKFOuRgWrqn
 6BY4jl4c6sfYHXM0brg==
X-Authority-Analysis: v=2.4 cv=F/Rat6hN c=1 sm=1 tr=0 ts=6970c84f cx=c_pps
 a=RSP5wjQe9cmB1/5ZhXI0tA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6OkPYWvNmkp-oGry5mkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30860-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CC31D57046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index fe2ab07ea4a8..c91204476161 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,42 @@ &crc1 {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


