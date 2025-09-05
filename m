Return-Path: <linux-gpio+bounces-25682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D1B459DB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62AA5A65865
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 13:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF5D35E4CA;
	Fri,  5 Sep 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="abH2KqmK";
	dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="E7FkjRZu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86A36206D;
	Fri,  5 Sep 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080591; cv=fail; b=QGEYgWXN69u9Fb8AGvTWBbq/YOD4XIau/6Ou033p/arJg9UmfHSNWkil1+44CvttNtzpWQOENjyyAlrkQMTdtsJWslwOSJ/at7jQGo0I214DTO4Y6mUeb8npVX8YNpwsKQEngrYuzYrpZmYSTiYwnla1ApqM2/WAPsKYc8h/A8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080591; c=relaxed/simple;
	bh=aXBpeYHVAV0cZ4CATij+EoBscxdFedgWVLQ16GGdFho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwCNuk84GduuvZstAsv1e5L7MuEygz1jPmSwvIje99FRI4nurc0+6ucRkQT3KbESDKeWjQa+BBRcO/zmYPHhjar+n2X52iiDdNz4Md+3pdhCLV36trhLDUyemVjK36VAbghNMWbizXUPSTa0gq2ZPwiW6d/T+RY8UoQC6uFo3mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=abH2KqmK; dkim=pass (1024-bit key) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b=E7FkjRZu; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5859ZBDB019948;
	Fri, 5 Sep 2025 15:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Kk/LGtgOaBqao96sEkwFuyHrPf3oeDoQ2pKj2WdVumQ=; b=abH2KqmK0HR0TOfk
	8xoh1CTBgjonEM+ePwa6ZSwKq1waEjmaEzNw0HlYz/8sGNo/VAw7tYQcPl04ojYQ
	J5HVh8D2hO4QGqHbasel15A3Nb7toHvms6K9bs28VkCJf1PaJDTOwn6KefWs4QoG
	edp/ENbS2S58bqzI9unG6/nqkc/EDGz/0OJ1Ho2HEf4uSjVkb//dOwLYCCleSn0q
	kXmYqSsI3V/KwJIpTTrlPW39x4dljkSDPB0d2GZX9UUsLWkshJFIXy5s7jrDPjNs
	Ng9KDq40vEmvpkYFE2a/mnA/GZ/Akzf+mVlY3kg3RhNbUd3WNa+mMyxFPUt1Ayn/
	DlTRGg==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8mg98w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhS0C3ahMZShbqq3UjiBGM3vw3VVJBQjlQCw5Eh/wpB7siseMpmgRazfhFf/DWY6fCr6IYU2ISdn23fGz/9geMBca66VfBXzwEdurCc90yjwCQ7TPbDWjEwFEUT3xrFQeBlFPoeTkLLzPZlGZ/copg6M2o04fjjV58BbkSXhpFeQv9KSLfXReasziRzvRN4fDGL7Ms69ig6gVjV4Tj101fZrcIw4ia+Km2qYAJJ62IvtrVFIzAbjrsCEuwvvlW3GwHGhRzkIKpQvioIZw5VlM5EbvQ57XfdLJ2BmazNeF4XSy5iDJaOzrhkv6jYTJWJdfLZ1jBOzlbWjIT96M9E8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk/LGtgOaBqao96sEkwFuyHrPf3oeDoQ2pKj2WdVumQ=;
 b=MYQtnaR5EJ95Pwi1IMwtpcVTohKi6JOoD/5Rq3A8pYw7Lwq2fC2qZ2wnIAn25GRQr2tEuRPZMLOD70E/VWQslxS66rZXKMR+9n2jFmY1ZAJzEpC/jLi1mkEiwQRrUE82rFaxhZPL6kAtBY4EPKXjVzoCkJ+gx5h9UubRVGhViXqGaViSkZExATbO70veKaRiUzAxO4+SGLzX33SibdLMAjVX37G+k+wBvgAwpsyJtM1AOd2YT+68nVGiGGrZQoQlT2JpBeEnwOeAcHSELudAx9WfhG5z6VkgP8Ljyerzmz82W910unUmhNQsM3XA/Pjk58f7eYwBWFUAnBXrYosUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kk/LGtgOaBqao96sEkwFuyHrPf3oeDoQ2pKj2WdVumQ=;
 b=E7FkjRZukl43237FjWxqXy1G0zYjb16EcPYA9dU92WMtrvjPaZBbRu/Tw0adOdyaLjr4cOk83cI1qWl6UztPpuf2Bjd6UEJb0y+Xeh28jiFKllwf03/fKajsHn77nFx7PVhmz0ooPAZhJklopOiM67Y2iDJ03Ogocw5WwnNTgjg=
Received: from DU7P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::32)
 by AS4PR10MB5394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:56:04 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::d4) by DU7P194CA0005.outlook.office365.com
 (2603:10a6:10:553::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 13:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:04 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:48:51 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:03 +0200
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
Subject: [PATCH v2 8/9] dt-bindings: pinctrl: stm32: Support I/O synchronization parameters
Date: Fri, 5 Sep 2025 15:55:46 +0200
Message-ID: <20250905135547.934729-9-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AS4PR10MB5394:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b488c0-aebe-4e77-7599-08ddec83f496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EF3+mcA3DgCBrxkfNGe9gqiBcxj6Bg/canoM/uNzTH8Uz1gOAr8pIQhYGKQS?=
 =?us-ascii?Q?9l/eTrQvpT1mhuiFbxWDNyixI8R3EBTwOaRNVasbk2KHMmFxKQOdu2djJMjY?=
 =?us-ascii?Q?ji6FcAP9/GJzzSx1BkKOqdgsss5yPolUdoPPdZ2kUrlfkv7cq1fY3yp3YZAx?=
 =?us-ascii?Q?sJxcj5Lczb6b6kIGXUVK7U09d2A9I0WPharsadt0RHQyZGp/8j3wesK+lgWu?=
 =?us-ascii?Q?h48Ri1NrdR78cqvbI/VIJkTuXJdOWL/u/lCvdr1I8aXnbHqikRJeI7sKU2lF?=
 =?us-ascii?Q?6ELTMcULmSyw5tyeT9wiyQiZ3PsvOI+CiPGaNYaDnLHhz723tDrwS/p00G4a?=
 =?us-ascii?Q?tBk5uifmuBRs5AO95SbBqQciJoDLCdTvGMgojtGmJa4IDih3qkpHcbMRUdc3?=
 =?us-ascii?Q?dUmebOzPK/+mWfddkOBocFBNIS6/KY84clWqfXw2xKvosBd4dVtE+ETT2dqc?=
 =?us-ascii?Q?Z1lB3fzXPhHe1EeYDBMjKiLXoERad+Nt6DvthpIW1akjQFx8y5rdelGJqob/?=
 =?us-ascii?Q?9PibiDWSxeghvFXpp+NhdAY9EshXw27m1pP+1UaNRIeYaeh+KXJYqU9F+P/m?=
 =?us-ascii?Q?aqtt3QI+8GEa5vgy6X1lPPnvqZWIu/U6pqf29Z+n1YHgOlmFY4tZMzUArKPK?=
 =?us-ascii?Q?tL4yhtmOmgJ8erYwXG6I/JlSrDJ6WW2KmsxzgdN2iXvwLSmlDyUOWpYtk63T?=
 =?us-ascii?Q?gI5qv+cjs7Mx4JH5vP49+y6dfe1hYvM0Efijl1B/0EmUj3gwJheX3dIGebq1?=
 =?us-ascii?Q?0s7g5+FvDDkn4XQp0YGOOZsT+nSHAbO2k7uvVc4EBg4GtCL5fANpvtQ2ib8S?=
 =?us-ascii?Q?TB8PoTJPVllMQMP+X9goBHHxQ9HP4NEIKolQ1Xajn99sVqq3gj8/0MqBRp3Q?=
 =?us-ascii?Q?jmKhn1wiKyMV7u/Vut2cpt8fVRWg4IzDU5EbxqXzG9ixVNYBq7pFmkpHIwlx?=
 =?us-ascii?Q?nmI1BBs+EHYhZfUbdu5vMVLQDbspJ/r7Lh5IaMpRJNIhuhWXyMZu8x8IbMlh?=
 =?us-ascii?Q?mB4uZYC9pG4i7X/yx/bD6Lu7afAoCxz8r/9HbzvSS+TpcW2+muJiSQ12wBos?=
 =?us-ascii?Q?BXBkUJ6hIafPfbpQfniYuYBweSOp8HT3fxkXO+mpSvDGMcKiQlvLsohdMdt4?=
 =?us-ascii?Q?bKD5oBodRIAqjz9alaHul6hZSkdLEWGyc7XgP7QOpKGoEGoOezHn2dB7QZlb?=
 =?us-ascii?Q?FtPCvNQIhD4udGJ0TsdA6E3ODl0MY7tT96faWLAnTLGc9phSDB5d6uzwoVbD?=
 =?us-ascii?Q?PYH+cX7czq6SfGstJrrNGb8hltHIbne+1qPLOWquq85sFYN6U3YuZKWVCdcd?=
 =?us-ascii?Q?dvXkgIPA0WsUKv6Whejr87ixl+Q9orrA/TUuVMSPk4gj5Aoq/D0iEGYEtOzY?=
 =?us-ascii?Q?FIsM8lMIpmfC+phX/Ag2aWh0AKGTcE7RP9LxNEA4lJDZ578oJkVI8Yzp2Mvl?=
 =?us-ascii?Q?1stHFcVnl7HK7i7jKd5k1EiMPQcPQp+n0IBfV/H0TqfCKwncm+0zBeM5SOyA?=
 =?us-ascii?Q?Y5OwQmyJRBXrr6KsnJMsezQaD80pBhKb8VBAbeyZ0+/fxIevlM6JrrXm7w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:04.3635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b488c0-aebe-4e77-7599-08ddec83f496
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5394
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMxMDAwNyBTYWx0ZWRfX5fur8lqbyQ/t Mi0rzWBdvsbBnAwF1UTL939jhtAhiSfk+r8EgatXWvlm6cx0twrJmxD5CT0Y/GnynvYvl7CwKnU iKIpXeMn18aF3wgkN/KklVjs/vvzt5kgDfx7WJVc/yw5KBtXb2stoJkJOlmxtPlcDfZmcnUaG3u
 2KLzbWDmLn1ApQyOodUtURyrgYnYWi0dAPpb5wxiOH4WRTIwTcjViprRks5ArnTMZ1UAGjdVbRV DYY1pC9ycqbZuAdAXaMl2NrewiGquOHlR0mvh0Y0XQNwXWuV7BmNMZDe75U6IvlP//qNekqfwgi tvj21o5A8K6242O2S48FXiw6HGvBLCRFhzS3sCbSD1LFBiWL/mcNlcu46PaM73EyvUhn3Wi7cWL 7buqIH2g
X-Proofpoint-GUID: Dl7VT5rvoCoQUpu6s6IHKxl827i9q32B
X-Authority-Analysis: v=2.4 cv=ZeMdNtVA c=1 sm=1 tr=0 ts=68baebf8 cx=c_pps a=TR6k4uXGNafvMVVnxx+vUA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=Y3uBLxUxZlyhwTEa0a0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: Dl7VT5rvoCoQUpu6s6IHKxl827i9q32B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508310007

Document the support of the I/O synchronization parameters:
- skew-delay;
- skew-delay-direction;
- st,io-sync.

Require 'skew-delay-direction' when 'skew-delay' is non zero.
Allow the new properties only with compatibles that support them.
Add an example that uses all the new properties.

Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 961161c2ab62b..d20669fd5d9c9 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -225,12 +225,82 @@ patternProperties:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
 
+          skew-delay:
+            description: |
+              IO synchronization delay applied to the input or output path
+              depending on 'skew-delay-direction' property
+              0: No delay
+              1: Delay 0.30 ns
+              2: Delay 0.50 ns
+              3: Delay 0.75 ns
+              4: Delay 1.00 ns
+              5: Delay 1.25 ns
+              6: Delay 1.50 ns
+              7: Delay 1.75 ns
+              8: Delay 2.00 ns
+              9: Delay 2.25 ns
+              10: Delay 2.50 ns
+              11: Delay 2.75 ns
+              12: Delay 3.00 ns
+              13: Delay 3.25 ns
+            minimum: 0
+            maximum: 13
+            default: 0
+
+          skew-delay-direction:
+            description: |
+              IO synchronization delay path location
+              1: Delay on the output path
+              2: Delay on the input path
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [1, 2]
+
+          st,io-sync:
+            description: |
+              IO synchronization through re-sampling or inversion
+              0: data or clock GPIO pass-through
+              1: clock GPIO inverted
+              2: data GPIO re-sampled on clock rising edge
+              3: data GPIO re-sampled on clock falling edge
+              4: data GPIO re-sampled on both clock edges
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4]
+            default: 0
+
         required:
           - pinmux
 
+        allOf:
+          - if:
+              not:
+                properties:
+                  skew-delay:
+                    const: 0
+            then:
+              required:
+                - skew-delay-direction
+
 allOf:
   - $ref: pinctrl.yaml#
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - st,stm32mp257-pinctrl
+                - st,stm32mp257-z-pinctrl
+    then:
+      patternProperties:
+        '-[0-9]*$':
+          patternProperties:
+            '^pins':
+              properties:
+                skew-delay: false
+                skew-delay-direction: false
+                st,io-sync: false
+
 required:
   - compatible
   - '#address-cells'
@@ -311,4 +381,26 @@ examples:
                 pinctrl-names = "default";
     };
 
+  - |
+    #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+    //Example 4 skew-delay and st,io-sync
+      pinctrl: pinctrl@44240000 {
+              compatible = "st,stm32mp257-pinctrl";
+              #address-cells = <1>;
+              #size-cells = <1>;
+              ranges = <0 0x44240000 0xa0400>;
+
+              eth3_rgmii_pins_a: eth3-rgmii-0 {
+                      pins1 {
+                              pinmux = <STM32_PINMUX('A', 6, AF14)>;
+                              st,io-sync = <4>;
+                      };
+                      pins2 {
+                              pinmux = <STM32_PINMUX('H', 2, AF14)>;
+                              skew-delay = <2>;
+                              skew-delay-direction = <1>;
+                      };
+              };
+      };
+
 ...
-- 
2.34.1


