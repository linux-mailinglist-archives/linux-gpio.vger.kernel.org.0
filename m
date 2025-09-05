Return-Path: <linux-gpio+bounces-25677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E00B459C8
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 190DD56498D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C7A35E4E2;
	Fri,  5 Sep 2025 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="I2ptMAHG";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="EQLvMqQU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F52035CEDB;
	Fri,  5 Sep 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080585; cv=fail; b=ROSCC2ClJDpSlwy013iirPrqD8vXobKo03NpQlQMiYFwXd0BHazADSJjZA7V0mGKrJueDMyYiaiyQuWdXxBljJ13N2XtAG/pjmm/6wYlEnNVKmJEM8BaAoAXOuvXkxF3U/M7Gss/HWgk4+8bEAff1YAR3MwH1R4HkOFO3H1CDRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080585; c=relaxed/simple;
	bh=0XOaRgydgqQILV1N6GqGC8pPHNV9dgoU06WOoIwvfDM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNssmObznBA9XLuH995JZkbV3BLLTWfyh4Zy65xsmxay/OflmnOOGA+4yKyxyXILFay4qKT5nhmyAbnM46vI9h7NG+MjJFjRRa5pPiky9GWZZWSBXGR1sQ7H24TVuj1yFX20iVxIxKZaTeJY2fXcw0WBMngGpPjctAxYoIbQZ2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=I2ptMAHG; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=EQLvMqQU; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DhSda032117;
	Fri, 5 Sep 2025 15:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RuDXT8Mots1vHLy4qkyrK+aDTrcQdQkh+xZx5j4utDA=; b=I2ptMAHG5mO7P1fz
	/IyvHEgsIycYHhGhguE++l63s6QgVCJ1NlnSMZGVgydukvtwdoILcLIRyMehI7G4
	lPJ4rHR4x2ETucdbscD1ld5Z8l7SrEdbGihTlnmx5vrADKh5ZbR3xF4yjPJCKB1r
	is1/w7y1r9+507XHNX+zenJMTYn/YbYc70w/tmuNe4wMAQes46IMdyVtU8LKkaKm
	S8I45HkYTsscQHXH/onc10laKgNd/s0GFNXoPw5b3LtlJWbGF27IX8at7qVy+Hlj
	vqpjfQwd3yspIPIVM/zp7PrwHc5U2o7HEyY/JTLTAEsTCIxuaVYISlfkS2437j4Z
	kf3emg==
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxubtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trdt775JeSJw/s1Wu6hlOg2Td2zWOWxbAHJ68ks5Vd3mVJoBx4zZRbg2e5XLGSYb/DfMDoEKJjQZoieEPuBuAD7jgYw1+ZjBvsmvpa0hXn/K6zl1uqtfNiRBtycBCz04P5+SlHPORA/s4dVRpyPwvcU0MX05gj4v6HsJmVDqTqmNKlTK1ziEgws+I/b1DkikSrusHB9ojfAqA7q1L/eOw1rC4lIopgh0j9g7UzNqdSlHC6bAcMELxNCDU/hdBG8IBpCRnNx1uATDGANvdJLHm11dATFnPHl/g9FVBy6RsQGIEkQLiaT+XsC5rkrP6XrBaqwOjnrJXo0X8LxbFWQM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuDXT8Mots1vHLy4qkyrK+aDTrcQdQkh+xZx5j4utDA=;
 b=lMRrDyKneRjpnqTWqYh1nGsUm3ofrE5A3jpGpLaESGULgxqjTPO31ftiXxrQ6yniD3RAfw7xryzJLgBBGJJTfreMp1e2DLulxvpHKVtCy+051Bs6MVdrWRE7/Z5hC6qO57mRqg8gGlg/rfkkngh0diOk5vGsGNvfuc1Xzl8nMe71tqPAgkdzzlUbtQ4DJELNjhRbWEtwV2iyeswypisyVIslBvULaenw8bul4qT+8jBjscdngmIPEs3yVvtUNzg0+Nr7h38ZCB7oB6whgwSlV3fhUAm1HyYtYlS49NrQhQCXiEq9+16GFaL67FpTCGg2BaPcqVIJSC5NmbY5PKuwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuDXT8Mots1vHLy4qkyrK+aDTrcQdQkh+xZx5j4utDA=;
 b=EQLvMqQUPWqldMZLa4d9qNmuiukNYF1rUhWur5o6E3uco032BPX3jkBqnGA6bCyijvPopjnVWvYYPVSwgWsERLeyp2o6oh/FTLqwVFfPpp6UqK6LNLoONP4ZPd3CJF2SwSKYAUN2gS0SHogP37ywrDnJn3rmvRAYJ11TnGVrZfQ=
Received: from AS4P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::7)
 by AS8PR10MB5806.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:509::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:56:05 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::88) by AS4P250CA0010.outlook.office365.com
 (2603:10a6:20b:5df::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 13:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:04 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:53:43 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:02 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v2 5/9] pinctrl: stm32: Drop useless spinlock save and restore
Date: Fri, 5 Sep 2025 15:55:43 +0200
Message-ID: <20250905135547.934729-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905135547.934729-1-antonio.borneo@foss.st.com>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A794:EE_|AS8PR10MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: d04f96f8-ed15-4f5f-4f7e-08ddec83f4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MAJl5Aa3n38COHxDwLYO8oy4H3NnbZADGh8hzyAC+ebGcpAxgDfnfbUCbrYH?=
 =?us-ascii?Q?UILAyQyFjpDP/79bA74fOEGSCtTjBRxEih5rJLXiOK8F29Z1j+xxcAMHWtF3?=
 =?us-ascii?Q?tZDv0QP1FnOjqTEUq27sR0yFFWI8vhwCQW7nBTn+cbjUQoRBT/iLnOhwMzIa?=
 =?us-ascii?Q?5AdDWzux5dMdlr7vVALVevE3OJXJgehVo3645KlCox1k7fdXYHUELOZGCdac?=
 =?us-ascii?Q?1qhI5TBGnZvW+Q8zRwIr5670fLKIHcuNd1X1n6fl8dXRlOTZ/vWKYsnKmt63?=
 =?us-ascii?Q?zzt1gUMkdNsdU33gpkpzFCYlgq24keQzkKgk0OwgdQFeGwQQApZNlTLvVm7e?=
 =?us-ascii?Q?9PGbPLDuIY1Cc/b1JdDZ27rC5IZ/3hQLB107m6T7bgK0OdrwF/Os7924V9HV?=
 =?us-ascii?Q?Q0r7QL0HBo2unEtkCeecJSu1nn9eyUMleN4enYmwTaZvl6FZan+g6T89elNf?=
 =?us-ascii?Q?XBJykXcmvSemVgTfqjrq4eVcRt1gpvkD/ebgtO0K2GmdIUjrPucZUJ+fj5Ta?=
 =?us-ascii?Q?bKKsN5F5b4DMTxSvBc5LxNAOtewPHO11dU/VDiLcYx3v43pcZEhwx6IeJRse?=
 =?us-ascii?Q?qiIK8w9Iivv6hIlLCvZjz1DAN3d2U3ZpbMItq3YSe8xrbAUOSVGDk3OS2jYB?=
 =?us-ascii?Q?JMN4amiI8gagS8/mNS1yCYvIzM6ddLLHlzzUI57Z/q5h+ofjR4i092gb905g?=
 =?us-ascii?Q?9Ci6gKjKZYfijMToEmuUm4iQ4UguHkH+fisqPeiltZ0Xv2Bb53Cir3o3dXGx?=
 =?us-ascii?Q?S0cMvF4VLbigSSP83euOIUZak73HTN+CuY+zM8lE/422KD+K8duWxT4cymfw?=
 =?us-ascii?Q?n6Ja63Ls/UERWHNqXyLkKoC8yhPoHxn7VfO7EoFDzUNh0yMLpasti01iFQJk?=
 =?us-ascii?Q?QG5yi65c9lNgBIA5ZW2YJGug9jZgpeojLRVzmY5GwUJlN1AHvI9m8PUC5j6r?=
 =?us-ascii?Q?+ozfT39xcEPRchubh0z/r9pscRjobNoz9SemtU+n/wEJFBXl4i+ExyWm712r?=
 =?us-ascii?Q?6UBWq48M4pGRnKa4anbPCOCHQ2JSr0W5Rmt1k7ozCU5PxfBIBYBkVJbCPCJm?=
 =?us-ascii?Q?M0w3fGEu7TMjDHF851qUvtlCDdGIdtDQzebLurPS8cPt/3ixj+JJaVyPIkiV?=
 =?us-ascii?Q?F7fcWnd2Mqont/Q51yUcfh/E72S/rml3Vy2EmcAwuslEEBzyBWir0sTbOzQN?=
 =?us-ascii?Q?iViTH/p86GjJ8RULfo32Dge/3DJzfcLklNQfc0rt4/TJ0oju/ay0VjqzzUx4?=
 =?us-ascii?Q?uNC+yyb8HXLMdLc7aaNJKD/K8u6U/QrTvgK0neeut3fmnXb5tepcL2iadiV3?=
 =?us-ascii?Q?ME3mCuzekosgZzyOnxZZ1+TB+usblQ7/oVCqoVYq5H/+e5YdRmhJy+0lgwBa?=
 =?us-ascii?Q?NRB0zG2zz4Y2sRINWkLusp8GXS9T9admiprZdj7ZjImtr4Z0U5QTF9ADJ6YC?=
 =?us-ascii?Q?n8dliEzzZCx5ldjhyIHdw579wLh29FftdLLa8jfmJ6HVHfxu/1DDGEBJDfFH?=
 =?us-ascii?Q?8rhJkk3pUQSzqell/pUf2JzvBwdQtTYD2a8M5i8n2DBVNlDBFZelMjNSSg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:04.8715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d04f96f8-ed15-4f5f-4f7e-08ddec83f4e0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5806
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfX6ChhTx3LxKon gtv8YEvPpqvO+uG5m6c0ZReQ9JfL4r2tMUfbpCRusRbI9MixL8FEfhvdZryic83QC2gA3grcPfi y2hEGL7VwHqSn/3Ec8yV1Kgoqzm8gi5DjMEikiODpIuh67Veg7cmvFmDMLlo0G+urFYx/H+kXxq
 jPLKBGTuEIahGWsRcaQpXPIKy9Q5AEcnV1KGpb2CM5WN2DH9l+tjWlxoNvnbAMhfET82i2YbHaZ 0UrSGAdA2vXed+sF3Ue/ue0+bW5WJOMKoCnsgmGihbBG+WTEInokLU6ZlZsIOPHeWeR1uwQ+s1d Zceo3VVCpEQM6XY+a2VdxEVpMh8kiNpOUQvQd/wLCAZBsZ3AosTPAov1yuvRuCW3+zdR6NCSXdg //VDqKhG
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68baebf8 cx=c_pps a=qDHLbbvJlrr8V5LZr46qng==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=HYu-Q55BAeZO7lAW1c0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 8l-_gV8NcKUuFUXUVX4hqSrgQz1uXMcs
X-Proofpoint-GUID: 8l-_gV8NcKUuFUXUVX4hqSrgQz1uXMcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025

There is no need to acquire a spinlock to only read a register for
debugfs reporting.
Drop such useless spinlock save and restore.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 741f503b6c44c..76555d18720f6 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -920,9 +920,6 @@ static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
 	int alt_offset = STM32_GPIO_AFRL + (pin / 8) * 4;
-	unsigned long flags;
-
-	spin_lock_irqsave(&bank->lock, flags);
 
 	val = readl_relaxed(bank->base + alt_offset);
 	val &= GENMASK(alt_shift + 3, alt_shift);
@@ -931,8 +928,6 @@ static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
 	val = readl_relaxed(bank->base + STM32_GPIO_MODER);
 	val &= GENMASK(pin * 2 + 1, pin * 2);
 	*mode = val >> (pin * 2);
-
-	spin_unlock_irqrestore(&bank->lock, flags);
 }
 
 static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
@@ -1050,16 +1045,11 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_driving(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_TYPER);
 	val &= BIT(offset);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> offset);
 }
 
@@ -1101,16 +1091,11 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_speed(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_SPEEDR);
 	val &= GENMASK(offset * 2 + 1, offset * 2);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> (offset * 2));
 }
 
@@ -1152,27 +1137,19 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 	unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	val = readl_relaxed(bank->base + STM32_GPIO_PUPDR);
 	val &= GENMASK(offset * 2 + 1, offset * 2);
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return (val >> (offset * 2));
 }
 
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&bank->lock, flags);
-
 	if (dir)
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) &
 			 BIT(offset));
@@ -1180,8 +1157,6 @@ static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_ODR) &
 			 BIT(offset));
 
-	spin_unlock_irqrestore(&bank->lock, flags);
-
 	return val;
 }
 
-- 
2.34.1


