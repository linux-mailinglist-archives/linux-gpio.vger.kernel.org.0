Return-Path: <linux-gpio+bounces-27546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F9C01740
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C76C3A3381
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC38344054;
	Thu, 23 Oct 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RyIPE5pZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100B328B45;
	Thu, 23 Oct 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226074; cv=fail; b=NZ4u0A1WalzsWeirV+koMOV+BmadkTZLfleufbVw+uJ7sKA5Bsl4XLVhcnBMbSsZ7ZjgBaDrfHCAueYCNY616qo6/knq76wWOxb6Cuxgxet57vpYdGFEV7lmao9iIKOAgUrHNf9SHTXfGcw++kIa7naY5gDq7qGYa8sAC87xrcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226074; c=relaxed/simple;
	bh=91fXfx6lCbGJH0N3iAq7y/Y/0D8pzbbE2wFaeaWLjwA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hseKTla84YKhq3SRRcEqrxgTOYtgsri+fdWGgnFzlWRSHg7B/m6av77JKBfhG/O66EGTr8XQUmr24DHJBCwa0xBRx6wQc8hGhyq87Tc1CEZu+wtWOSbPRuLsGi5i1gWOCVlmvhCP02JvsJ1fNT452d1sPR5N8FXyFDaJ8dZRzTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RyIPE5pZ; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCnw1b007459;
	Thu, 23 Oct 2025 15:27:07 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49xvcxp5vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:27:06 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxJKVAoMn0s/YlSndAQ5pMGdpILR60qkVOzFSqps2Pz03UaJiDN14SaoS9OG6THbIdBFamik+enagCM6Co+89H+HOdTvGu3zJC/r8daMY4lNOOIu/kkQxBT2YoXzbwvPOEE3guFmi4wzK41gmz2HZFWTvOhzemHM2OcxghYKPoNlFTYzMT9jUTR5eSJdJzJOWNCwf7pv7EvRBVvuxPYCzRqb2N5+qZaFqoc7yyxHs3BNQ3TSkqi7hhFnLiePnRFkb+YO9169hkQiFf9tl+CBEfx8lQ5uz8Nsqq9//gPJpG8vAZmoDaQFe8zxGVrBHfyvrtp/ZLxaWYZeamxPNbeQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3E3T0iyX7BS1TFuh6xdue0sBvK3CGNm5DKG/VuekdE=;
 b=WqGQ4Z0UQPiOce7g9Ytmiov5hzJIRpWOXwTyyz20kGi4O0goQ6QvHhJ/kEsQIE16O83KYNO9VLhYcgZX+uZbcXsG0JdO8YM/wYlAn1l37ABDdEEwDsfOAWdbUL5Z4zKUFYoz125oAlaqhChZLczyHwjNh+2kLTXpQn3u1qFIKnRnm8LWUv7moyYFYaktU81pCzsu+Ox3I7cDgjJY56BHuqwDS/FamL2dZvyWF5JsIl4nURNA1BbE17sl9Y8wWbri61OWfWN+U6N7pZicvZciIMqzZ8GkOG9155EE68HPNWop/9RibbyBjeJeJmDeCTdqXRWpVNP5BoQcBCMQRfMgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3E3T0iyX7BS1TFuh6xdue0sBvK3CGNm5DKG/VuekdE=;
 b=RyIPE5pZtAhYzKq0VUhjDWpHxzkQ7/xN1NUhDX9K56dzVDKmAC4xMf2r/obHGl7bM+SFNUdM8iJMSEs+wEL1u0aHMpbwCbpp/dxrFwNHXLEGmxQjmBDc96XcHy5ZlLVp8Jn9YtNVpfRxcx6ckdd4XS8MfcObpwecv6SlHJr8StCQimg6fx8WLsy/mjA1xp8B0sBYQmEh3kV3phqrwM2IIcip6h7ik+g+dfK1rRan84+i6nO/vMSIxo5ois3hEKIF0/uLx1jWIZZDLAaRdEA+6jpWuK4b1UxqJumcHjGip6zqCdOnnuhhiydDU/NYsjjdCdzybBIUHVMgcqJ+p3pw5A==
Received: from AS4P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::6)
 by AS2PR10MB6847.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:27:05 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5de::4) by AS4P190CA0007.outlook.office365.com
 (2603:10a6:20b:5de::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Thu, 23 Oct 2025 13:27:04 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:20:07 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 15:27:04 +0200
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
Subject: [PATCH v4 00/12] pinctrl: stm32: Support I/O synchronization
Date: Thu, 23 Oct 2025 15:26:48 +0200
Message-ID: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|AS2PR10MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: fa08cf83-6f67-45a2-7566-08de1237db97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EhfArFTMbo295oU3C7TVf4A3FYz9FbnExfPkpLsXRKLyEGKagXHJ9V3l9+MA?=
 =?us-ascii?Q?pZ9JlHU56IyJ3jED13MI+iAsU4vYpyhBZKOL7DXrUUo0xI16WpFhh1awuHBF?=
 =?us-ascii?Q?afjKob/FUVz5j1Dpl30d+1RFETDYDxJqVkWsh7LPaI4vkjg6q5DVvhN4c2bx?=
 =?us-ascii?Q?3wUnfKN6VpX1w18uXceCdxlEQkISMWPJulZsSdIKa5GmPkS0pel4dGDLYuJC?=
 =?us-ascii?Q?0hP7Oofs+fMfshudkfUwIT62kv483rTYyseQxJ6Cfu/90fJ677KX8rwoPRJ8?=
 =?us-ascii?Q?I3P2uef8l8urWo5cwmrNDQhlazzT17D+u8tbGxWg5vcowg3iNr7Ff1EXsW+6?=
 =?us-ascii?Q?aC8vbxAes6mYFGcudiP01MTj11DlvKffqaexztb1OlZrToxXmMDw5Duhg/M2?=
 =?us-ascii?Q?6dGFvWE+GqE6nhpSjQyqVubQ1qKkagFMR4S/or7bONXRriHqcsouJjfS14pU?=
 =?us-ascii?Q?i9nxh49LdcTAEUi8mhZETQ8ncAyERW800NR1/+ZiVfNh8Lu3p2uuJK5/uskP?=
 =?us-ascii?Q?AaACeO4iCIdmtVGvS9HXWo9yay2xeyvRLWxqv5myqkOmBc9tddJ3xd6sgglX?=
 =?us-ascii?Q?Djx6ebxBVNZzHYT5FuCIfMklAUXx1FcsXBPBQi1wtx+EV8UtYnWuOt3jUr6Y?=
 =?us-ascii?Q?dhyU7tqBkbtpTK8jM0/a2p5GOMbUpQj38Z0o2eOMNryXj6jC6XDRUZl1lILs?=
 =?us-ascii?Q?zZeOd4/4kLqlqCLzKqf9356BP/6r2pNtG/FRaUo6yaXvPxWmi3DBKec75gIU?=
 =?us-ascii?Q?lnDBz2aHbA3UXCXN87SC8hjNS80ttqIQD/G3TT+19Ivkx+YjEobJD0zpjxR4?=
 =?us-ascii?Q?780Zh/r8Vbks2+KOK7x54cMWTWQwtu4qzSUQd8V0S/0vjAQkJ3KRMAYp5poR?=
 =?us-ascii?Q?xjR8FB+qrvqA6bCt4fZ8smb/bZzmBkR1/+wqT0cibwuip31cfp+PCsAHy+dw?=
 =?us-ascii?Q?fy5m69g0No3qqXno6i2XUKhljTzHGl38KblhtNpICBfOdfQfw895FBqSe66b?=
 =?us-ascii?Q?USzwZlK3hblqH2dJuSguI7ndhFP8s4+T/n1cJbgWdvuMIkgKB224Ju+S4jf9?=
 =?us-ascii?Q?rohKjwuZc+nTx4trY9E4qfJsPRMBS4sx/H910z/UZJZ5nVvWeka5k+I9rtGO?=
 =?us-ascii?Q?iipPvLtHbylGAYJAJeRcUN0KR7IPKBgXpqgBFRGk+uuREB+CJFuCU+OYK06n?=
 =?us-ascii?Q?YjCaanMzsDqvzwCgNeT3D6wyOcwHgWO+DRt26kIGt8lOXwh/eB8843KznC1u?=
 =?us-ascii?Q?DJxshaDeTBa5cmOGttJfaUNqWTgiW6Axo5euQqU5N3shioUacXs1/DsNEgkQ?=
 =?us-ascii?Q?hovXUWAdtX/Gl8kCQK6ewrpicIuXyL12x2syLzLS87OzvHX8+eqve1fCLnrH?=
 =?us-ascii?Q?wj+NtZfdVp5TPfx5Cm8tutYzPqoAXUCw0uNsJ9xOH+6FwdSbxMR4nKVqU0F8?=
 =?us-ascii?Q?BC0dAytezDxpbVeIOlnzsvgX9ozUeKhM0ZYSKQFxrnctZI15CiKuJcbszqZl?=
 =?us-ascii?Q?U3BVVYexrwNb/QEYia9xOjoYeOiMa66y2t5xTtKi8cz/waiNn/1TBmhgtnuG?=
 =?us-ascii?Q?g4fzdvGs3Dy2LMk6/BHVpcjS351h7v4E0gM5yfke?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:27:04.8914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa08cf83-6f67-45a2-7566-08de1237db97
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6847
X-Proofpoint-GUID: bnBtzkzjUVWlPmJiENZAjlY2YBYfDP6f
X-Proofpoint-ORIG-GUID: bnBtzkzjUVWlPmJiENZAjlY2YBYfDP6f
X-Authority-Analysis: v=2.4 cv=RoTI7SmK c=1 sm=1 tr=0 ts=68fa2d2a cx=c_pps
 a=dKXi1lyP/khMikpIJjFKZQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=XcDL_noe1LrSSS28ytcA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXwzmYWZ2QkvFp
 Nq1M7EIkR1S7mLv/lW5PJHKoWFsrMyyGnV2+WIDkUZRY3tkOeEHPqDDQrKHl746SiSR0nPQYehZ
 9jITlJbloYsqRDT4w8schcRPfidwJHiKYW9H6E1pQc7g1/8WO5zHRq7yZWXm5RagXfYAXwpAGFV
 ttCSCF8faTxeb1+k1CocNApxOULm/ymEC9NJq79us0OooGafIDJghzR7rTxla0vGt8QYWkPCkd2
 u4Tqoi4WRU8f9T5SqyR1IgO9QRI9KCMt+5t7/n/oj4ABA6OmwGxv6C/2GsstUrFYDjzg+lfeaVL
 bNzEEGMj1D6CaSd13jZF+Deivtz4mWwDMSG2mqwtTAh2q/u9Nz3IECvacnwVcWa/oWkxrEsfn8Y
 vIItsuAURucHdF0CSJZ+Cyembmn/oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220073

This v4 is a subset of the v1, split-out to simplify the review.
The old patches concerned in v1 where 05/14, 06/14 and 07/14.

This subset:
- introduces the generic pinctrl properties "skew-delay-input-ps" and
  "skew-delay-output-ps";
- introduces the support for matching strings as argument for generic
  pinctrl properties;
- applies some cleanup to STM32 pinctrl driver to simplify the following
  commits in the series;
- adds support for the I/O synchronization in STM32 pinctrl driver and
  bindings;
- updates the DT for STM32MP25 pinctrl to use the new properties.

Changes v3 -> v4:
- Add time prefix '-ps' to the new properties "skew-delay-input-ps" and
  "skew-delay-output-ps";
- Add support for matching strings as argument for generic pinctrl
  properties;
- Replace the numeric values of "st,io-sync" properties with strings;
- Fix minor typos in pinconf code;
- Link to v3: https://lore.kernel.org/lkml/20251014140451.1009969-1-antonio.borneo@foss.st.com/

Changes v2 -> v3:
- rebased on v6.18-rc1;
- replace "skew-delay-direction" with "skew-delay-input" and
  "skew-delay-output";
- use generic properties from pincfg-node.yaml in dt-bindings;
- add the new properties to the new node eth1 in DT;
- Link to v2: https://lore.kernel.org/lkml/20250905135547.934729-1-antonio.borneo@foss.st.com/

Changes v1 -> v2 subset:
- rebased on v6.17-rc1;
- replace ST property "st,io-delay" with generic "skew-delay";
- replace ST property "st,io-delay-path" with generic "skew-delay-direction";
- collapse the other ST property in a single "st,io-sync";
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/



Antonio Borneo (12):
  pinctrl: pinconf-generic: Fix minor typos in comments
  pinctrl: pinconf-generic: Handle string values for generic properties
  pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put-ps'
  dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put-ps'
  pinctrl: stm32: Rework stm32_pconf_parse_conf()
  pinctrl: stm32: Simplify handling of backup pin status
  pinctrl: stm32: Drop useless spinlock save and restore
  pinctrl: stm32: Avoid keeping a bool value in a u32 variable
  pinctrl: stm32: Support I/O synchronization parameters
  dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
  dt-bindings: pinctrl: stm32: Support I/O synchronization parameters
  arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi

 .../bindings/pinctrl/pincfg-node.yaml         |  17 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 101 ++++-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |   4 +
 drivers/pinctrl/pinconf-generic.c             |  65 +++-
 drivers/pinctrl/stm32/pinctrl-stm32.c         | 359 ++++++++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.h         |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c    |   2 +
 include/linux/pinctrl/pinconf-generic.h       |  19 +-
 8 files changed, 455 insertions(+), 113 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.34.1


