Return-Path: <linux-gpio+bounces-27180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856CBDE8C2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 14:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E511926C7A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 12:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F38E1DFDB8;
	Wed, 15 Oct 2025 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Yo5tnzty"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC6199237;
	Wed, 15 Oct 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760532775; cv=fail; b=Qdd6KGSizu6ncHL8HPVmR180O7Kclqb2b1xRWJiOICLzR2rf8ihs6LEFrkujTz5Enu5y0SpPf/+JXTx0Jdn7HuXRU+Ncd6C0UVUxp/Mswq06MvfdupeFWlLT8T+Sy9ViydY/w6jlyxlOGHPp1tsG6ZEgIypZ1tyzAgmkjUCX2OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760532775; c=relaxed/simple;
	bh=Jfc0HHzrAu/WtpZEZsr0n27RDdp6ReB2X1dcNCLm03U=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tLAdNIVVfP18gMp/20RFCp5gzBqGVrsQagyyrhOdbyciZu++3Xg5WGq+Y4qyRdtfI1cNOm6l8anBh2/6m31NCoqX+L5jZS24j/tjncx+XbsrrPnj5MXcmQIpPz0gjyI57J3lLsQz1YP0ppoaZQIOLskN8yH0y1sV5K+aHhQ6gGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Yo5tnzty; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FCNEOY013380;
	Wed, 15 Oct 2025 14:52:40 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26j7n69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 14:52:40 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNAf5eOAemEAdwwh1Z9GpLWF7/AFSbAq+OsOJUTCdKeOKHi1hnXbPmnoANE2Ha+qRiZ35az/akkfgSaEYb8vxNGEywGAOJdm1cjZND10/bBozosfWqqPwXZjYj3xLc2zv5/V0uwhnNgEkOy/VQbflyGNEoH928czuByK2MfqApUCkLFfyjkkjxNMZbUOCz6o8HSOGdYt9KUGGaEtVNta4dTf6KUVMZ1GdbVckeplTqFC5JD+b0zbvoEVmMA0x3uD7QD2m+qXC4QTEhuvBf70PP0rmfrpEsc1wAUQ1+uaRSagYmT6sDETajrRkREMnCVbYtOqi7iCiCycN481HWYdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfc0HHzrAu/WtpZEZsr0n27RDdp6ReB2X1dcNCLm03U=;
 b=kM09Rchn5R3z5wQwFpj+goHGG/oBPrHboQ+9zUWd1NIrWAlEmwA8aZ7YxZiAYatjwsc6252d+V2DxyW/Q8NOqAvlHWfEka2b5Ren9IYaFjLjd0/Y1hMwxIa30Fs0MdkXm7jYbJ2ufILxZynr8G0EXQ2oxYzthPsVE3bwD6elEq6Nz/zOewisHc3KZsggaXWDt2zM0yX6icu79RT0NXDSaGRX6XK9blozY1bRVWoukeiDhtTZ/cZsju47SNHDlzb3oqtnYofTTETNis0WYio5lD01qY18ocL7WV9rma4dkhwb/tZ3i3mn8yVO0evxhHQTWvB2sv8h3SyrW7cdbGLiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfc0HHzrAu/WtpZEZsr0n27RDdp6ReB2X1dcNCLm03U=;
 b=Yo5tnztyGm/07DVM4rCfbUycE6ywWQ0rPRwkeGKpjLqy2I8bGeMkFGP44/wh4LFBtXL6IToeqbzIOa1oAcjokFbmJNVDjoxy5edJ6ydfrFh6cnmkectdiqnzm0EVgpvFL+Xtuzb1zG/u0U0hY2d94K2aRXDxKJoNay18pqawWir76vLQVqZauCd/eOOr93PYO4gY4E4B1pDn6jLoUFuKB/W9zkNHGCjgRiCYb4IpZtEYZVsq7fHflMeVfz+Vx6HvDhMJB0zK48pA8EOi0yd9NXc8+lkCCfUKxi7tKxWJxjKhrfa302nX5aGj2Z3sTuUXyvMk/QM/hJP/YjcC0rZxIQ==
Received: from CWLP123CA0238.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::19)
 by AS4PR10MB5200.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 12:52:38 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:19f:cafe::dd) by CWLP123CA0238.outlook.office365.com
 (2603:10a6:400:19f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Wed,
 15 Oct 2025 12:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 12:52:37 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 15 Oct
 2025 14:50:15 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 15 Oct
 2025 14:52:36 +0200
Message-ID: <7ba7c2f2a6dcfac30f05b35a4f41ef0af2dab575.camel@foss.st.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put'
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Date: Wed, 15 Oct 2025 14:52:35 +0200
In-Reply-To: <20251014-water-gown-11558c4eabe7@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
	 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
	 <20251014-barbecue-crewman-717fe614daa6@spud>
	 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
	 <20251014-water-gown-11558c4eabe7@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AS4PR10MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b89f2fb-0219-42a2-7469-08de0be9b84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGQ2WlJnVFFSV3dWOVc3dXYzZk1adEtxVHpiU3FvUjBZQjJzUjg5RHptaU0z?=
 =?utf-8?B?eHdJM1lEdzUrek9SS3NWQ1k1WENtUzJPQzRNa3NRUFNIWGU5T3djL0dhUHRT?=
 =?utf-8?B?Qmczd202b1YydFNaeVU4N1BpR2F2VEIyYytUSldSUVQ2ZG5GNDEwK3Qrcnc5?=
 =?utf-8?B?MlRlQndCV3l1eG01aG15S1NyaXN2VndBUGF3T3VTY3M1c1lMSXR0MXd2Qi91?=
 =?utf-8?B?RUhCZStrVk5BWjhQZStIRkNseTVoZUlPU3doY1hEbU4rQ29iTDhEaVRJbUFL?=
 =?utf-8?B?V2JwQmIrSlQzbVM2RTk1TVRhblk2UTN2L0c2QnByUm9mWlVzSWRyaWJYOWNh?=
 =?utf-8?B?am5rZHpmaFhqYnJkRjJjeHhCQzNZN2w2Z1BzWXUxbVl6WlYrZGowLzgxaG5F?=
 =?utf-8?B?VnZqSTl4a213bkV6b0ZxL2VOaEpoRFVHTW1kRVNobmNHTzdvdzZhcDFDM28r?=
 =?utf-8?B?VzhWQ1hQR0F4T2lMUmFTWUJ2aTdGYTMvQ1hnaVhYYkdzclpHSmhQaGZQZTQ0?=
 =?utf-8?B?anlRTnpETUh2TE85a1JXL3JSUUt2eDM3dDFMVGk2TWlsUE12Vk5jckpiUXR4?=
 =?utf-8?B?VzlEbXpUclRwVlpyRVBubFFya1VucHVNSE51NkVySDNEd3hGMDBTZTJwcFZo?=
 =?utf-8?B?bm9HeHN3MzdKZmMxOStqajNXWmNxZnByaUc5TW9yb3RHa09wQlA2eThhcWFU?=
 =?utf-8?B?TWhMRnNWK3c2SzdtYjAwZVpJTEVvU1FtSzJ5OXorWk5KcmpiMlp0NCtXR3Fx?=
 =?utf-8?B?N2RvZHVOQTY1MTNrZERvT2pyalphRVBDeUl6TFlDRnNHVXFncXg4V21MQUNw?=
 =?utf-8?B?eUV6c3BrdDZIVHk1ZFJVT05La0IxdThucldpWmtwK2FLY3p6TUp5Y1pSekgv?=
 =?utf-8?B?cllHUE56Vzc3UTA4emhjSGNwMXJ4TlkwQ2g4Z1FsNmpGTWdKSldQL2w4Vm40?=
 =?utf-8?B?d0ZXWFNQbTZGZlJGd0xVQVhHRVJEdWF0QStLOVRJV2RpdFJ4WDloSXhpYng3?=
 =?utf-8?B?N1ZlaERkSFBrYUhLbVRGL2FyT1UrUUplalZabWhsMko5N3l3VGxiUDNoZGw1?=
 =?utf-8?B?alFTbGx4NEQ1cFNTekJsUldYdk5udW42VFViM3c0Q3pXa1BGTTUvT0RLUUtk?=
 =?utf-8?B?Ly9kb2NQTHp3U2VVdFU2bXRUUitlUWZpMnJqSEgyWFhJRHpsWGJxYjVOZUNO?=
 =?utf-8?B?a2JBQmdNMkRHV0Z1bGU1THFaQStRSVgzN2xzdExaSWptejN1M0ZLN0tETEZN?=
 =?utf-8?B?R0pqZW5tTG93c2tHOXAwSXRGTEVsN1pheVRGVndGdCtKSVZyWHFBdHJZWlR2?=
 =?utf-8?B?RkpnVkVsMkE2NUg4UUkrY1JUbmg3Z0FWbzczUlIwY2pxZm9RaGRFTGMrUk9z?=
 =?utf-8?B?NUI0NURTMmhkRmdMa1BleDVTYk5yVm9mR2RnanRZQzVpQzgxRkdXaTN3WHhZ?=
 =?utf-8?B?V281b0MzVExpa1lVM1BsdEp5NWNjNTFIS0RiRWMxdGIrNldPc1FkM0E4WCtC?=
 =?utf-8?B?OTlkcEE3aFIwT0dLVnZyWjJnSDZLYVRUY0pDQk5QSndhRVFUaTYwUnBra3NN?=
 =?utf-8?B?RG8wVXdQMXVLY1YwbkZQRVd2SGtiRzZ1dkhVRG5PbUVYOE9ib0xNWGxOSFJX?=
 =?utf-8?B?M0lGaU1xQW9XbnBUY3JBZmhnSUYyRENrVFg2bEF3TVpRK3Q5SzluRFB0VHo5?=
 =?utf-8?B?TnJrSXZnN3p6blBlNGFtYXFJck9wTzM3cHRFTHNlTGc4UCtxTm5UcEg2VWww?=
 =?utf-8?B?UkVkNFdoVWZYTURGMzZiOG1IUWV1ZHV0YzA1MXZEaGJ5TFNBOEd1YUNKUGpN?=
 =?utf-8?B?Mmc4WGc2QXhLd3M3L0RPOC9kRkhWWUtuczZBTVdrK2pBeHEydFRQcU5Wb3l5?=
 =?utf-8?B?Y3FQYlhaKzNlZGFLT1piU0c2UDVHUkxMaVBPci91Y0VZdnY0TG5XWGtweUN2?=
 =?utf-8?B?bnJYMFRQK3RzeE1BWmtqU1gzZTRSK1c2NUptOEx3bTl4bmNuZlJIejc4RktK?=
 =?utf-8?B?ZVgvUTNnK05mb2VEVEROQmhvRktidFRSQXUvMTk5U3pTckJTNmZMNzFOVzVs?=
 =?utf-8?B?VEJGZDJ3ZjUrdUZmNDlrM2lNL1VJbWcrc05lQ2gvVXR1R3NyVDlsbTVrVXlB?=
 =?utf-8?Q?abDM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:52:37.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b89f2fb-0219-42a2-7469-08de0be9b84e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5200
X-Proofpoint-ORIG-GUID: DzjhjdYrFB6QAhiEj-KilIyn8FSA5oX3
X-Proofpoint-GUID: DzjhjdYrFB6QAhiEj-KilIyn8FSA5oX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfXzez08l3T10P0
 jieETZz4Yl3MmnNT4Js3YC9qDZvYg+X2vINvEYj5iaxsKwJpItyFRRuYXgYAchKOruurtBH1vVG
 U/FcGP5BFFn0Te8t/J0ggHhTfz3tupc0BinTXF32+e71teCrwqrJ//u0MKXV8K3+7va/RJMtxLp
 OsbcfHQlF7sGQTwKqnXNam9XiUSLnXHq711eTQSVJS5y3sa0lb0z/gIWBE9efifTc62jb4oZQoA
 dkcufHWN0bskp75LObG8EwobPHT3RJ5W9WOckJ+bLKU5mbgNkqJLkQW9ZUmKhKWPdB7AkcmGLri
 pGKP5w4hF/fDLIkNQaxVWe+ebCNWjtEBkI1UPm1wEdsoIu8uaK5hzCrWn++nug6SLN4hOqNlwyi
 b70JTXWgWglggFPlPvMYX6zkuDO2BQ==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68ef9918 cx=c_pps
 a=j46eMmXtwYkrOlOTjSJKlQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8
 a=a4Evs6e31utlwK-snYoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=3gWm3jAn84ENXaBijsEo:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002

On Tue, 2025-10-14 at 20:39 +0100, Conor Dooley wrote:
> On Tue, Oct 14, 2025 at 09:33:14PM +0200, Linus Walleij wrote:
> > On Tue, Oct 14, 2025 at 8:04=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > > On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:
> >=20
> > > > +=C2=A0 skew-delay-input:
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this affects the expected clock ske=
w on input pins.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Typically indicates how many double=
-inverters are used to
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delay the signal.
> > >=20
> > > This property seems to be temporal, I would expect to see a unit of t=
ime
> > > mentioned here, otherwise it'll totally inconsistent in use between
> > > devices, and also a standard unit suffix in the property name.
> > > pw-bot: changes-requested
> >=20
> > Don't blame the messenger, the existing property skew-delay
> > says:
> >=20
> > =C2=A0 skew-delay:
> > =C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > =C2=A0=C2=A0=C2=A0 description:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this affects the expected clock skew on =
input pins
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and the delay before latching a value to=
 an output
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin. Typically indicates how many double=
-inverters are
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 used to delay the signal.
> >=20
> > This in turn comes from the original
> > Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > document, which in turn comes from this commit:
> >=20
> > commit e0e1e39de490a2d9b8a173363ccf2415ddada871
> > Author: Linus Walleij <linus.walleij@linaro.org>
> > Date:=C2=A0=C2=A0 Sat Oct 28 15:37:17 2017 +0200
> >=20
> > =C2=A0=C2=A0=C2=A0 pinctrl: Add skew-delay pin config and bindings
> >=20
> > =C2=A0=C2=A0=C2=A0 Some pin controllers (such as the Gemini) can contro=
l the
> > =C2=A0=C2=A0=C2=A0 expected clock skew and output delay on certain pins=
 with a
> > =C2=A0=C2=A0=C2=A0 sub-nanosecond granularity. This is typically done b=
y shunting
> > =C2=A0=C2=A0=C2=A0 in a number of double inverters in front of or behin=
d the pin.
> > =C2=A0=C2=A0=C2=A0 Make it possible to configure this with a generic bi=
nding.
> >=20
> > =C2=A0=C2=A0=C2=A0 Cc: devicetree@vger.kernel.org
> > =C2=A0=C2=A0=C2=A0 Acked-by: Rob Herring <robh@kernel.org>
> > =C2=A0=C2=A0=C2=A0 Acked-by: Hans Ulli Kroll <ulli.kroll@googlemail.com=
>
> > =C2=A0=C2=A0=C2=A0 Signed-off-by: Linus Walleij <linus.walleij@linaro.o=
rg>
> >=20
> > So by legacy skew-delay is a custom format, usually the number of
> > (double) inverters.
>=20
> Yeah, I actually noticed this after sending the mail. But as you say
> below, the new properties can be done with a unit etc

Quite an interesting discussion, here.

This skew delay is "implemented" inside the device through a set of
unitary delay cells (double inverters), where the value of the delay
of each cell can heavily depend on silicon process, temperature,
voltage, ...

When used to compensate skew "inside" the device, we can assume that
the skew of the signal to be compensated is also affected by process,
temperature, voltage, almost as the delay of each delay cell.
In this case it could be fine reporting the skew-delay as number of
delay cells because we don't really care about the value of delay in
time units.

But when used to compensate delay on the board, the value expressed
as time units is way more appropriate because it's what we get by the
board design.
And, this is the main use case in this series.

>=20
> >=20
> > I don't recall the reason for this way of defining things, but one reas=
on
> > could be that the skew-delay incurred by two inverters is very
> > dependent on the production node of the silicon, and can be
> > nanoseconds or picoseconds, these days mostly picoseconds.
> > Example: Documentation/devicetree/bindings/net/adi,adin.yaml
> >=20
> > Antonio, what do you say? Do you have the actual skew picosecond
> > values for the different settings so we could define this as
> >=20
> > skew-delay-input-ps:
> > skew-delay-output-ps:
> >=20
> > and translate it to the right register values in the driver?
>=20
> The patch for the specific binding does have values in units of seconds
> assigned to each register value, so I think this should be doable.

While in this series I just kept the new properties uniform to
'skew-delay', I see no issue on using the '*-ps' version.
I will send a new version of the series.

What about the existing 'skew-delay'? Should it become deprecated in
favor of a new 'skew-delay-ps' ?

Thanks for the review!
Antonio

>=20
> >=20
> > If we have the proper data this could be a good time to add this
> > ISO unit to these two props.
> >=20
> > Yours,
> > Linus Walleij


