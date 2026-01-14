Return-Path: <linux-gpio+bounces-30532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13BD1E0FF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EB7430210F2
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3230138A9CE;
	Wed, 14 Jan 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UkuFOCkN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD83570D6;
	Wed, 14 Jan 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386663; cv=fail; b=WtoJSnI2pkXrR2jqJdSKeUEKAsWe6jeBIqhndlVW2yZu8OL4XdhKzNL6t6QjqXSaaq1jq68pNnxaG8gvOp866JJHE/hSvDCbnbU3ebUuS0eMHl71IOmvb0GS1CXOoBD/pEW1ghXvl1NhIm0KnMqFuhUSM7FXbckdWJnEi50t7AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386663; c=relaxed/simple;
	bh=QqrMX0tU9Yq+AgB2si0zEDTOBzjdKZFT7Fl5WX0A7TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VpvJinfDGLryh6t6I7VK9etnvjW1tHt2O8GSFlqYncrfvKxNIbxvRuxlYCbnTTC6f8+57/RxyrDGdvlGYjJ7a3L/J4tKmsQRH2QV1xr3Y6+Ux5zJJY4vMpbJnPjrhSMyhLQZqo38AM1NSLN1PGSOfdrwD85qu/bpfstn0C/x6aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UkuFOCkN; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EARVps142008;
	Wed, 14 Jan 2026 11:30:34 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bp7bjrns8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:30:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl5S94qV4VzlSSVO+cARGJdS4W23MMFeWp//1686WtdTxtPwgbeyIACL7cJvS0bQpmahMix+lqtDKDtyvgDKXwrF0hRW+mI2aVmFXcdQ/pu4T8+r6xCrwsTSTFPQrRIG7N9oh+TMxa4KN+9bR3oN8nyhZmU+n21HFsP7tttYSl45J8uNWMC1J2e4I0Mz44Z+9fU+oPDYho65nQ/ibTE1wB9nosTu6SH7j71B/VSlz00gedcLzoD/YwVyWXiHtIZrUz/rJeZD3PUqJrCOybNhqOeOH/MZMUPC2wk5Fy7PxY9je+cYnhkVDPKEOted5OpZF5DuoCBWbV6xGM64p/9uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=dJxTvsI4nURnzcKSVJOFnvcs9lUs3S2hIWAyHK+ObEejDqajkunY4hnHi0urvgqmJd6I+1EtHxLuQG3VAAbMG7pdnmOmL/lSoBchnlcmxNM6iH5ZY3sDdH4jNvKDKmk86r8qV88nfOSYuMoGwAKmlv0QPELVyybEgq6x836Bulc0yMvxO5kfBP4wuW2G5LrKLFmrPkWJu+ING9csZ1Lt2Bh2IC0g7ZzGWkpJLUmxrdRzWYi1a69Xbitv2LWIpDQwYSP+BwozxX2qRZpLdQVshZU57i46yUus4YMqfZrzwxUi4WpyHhrPTYvddORFKJQqvmuQ+AEPMkAmsTLprWcDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=UkuFOCkNlyB9AtI01aXVpxpb7SGZLZscwxZ/5V4RpaItPdOhntjSuEOk8MR/EXPFq6Vi5OUPC/WzWgxL/WeobWuhV9DhYgh/FZLe6o0+k2d+K1cy6HHbTZOvtkSIoLF+IVfEEUPzipjDnUwBo9NHhu8cdxfw+2G88OZj/ukM6RmaYQdEjcIffqTtxEfV0TsqUxysoV3soSDC9AlK7YlOFjU6GVc3HSx5pqtpnbDt9Ph8K6WiKpZaXMlpYeavCEz+25g8nq6uZTq0jsLzKNsXpvTFHCRRVz23r9Olhu8+fWov5yecjTD2xV8yx1gKExvKNEzuH2N+VZxvVYy9U7StTA==
Received: from AS8PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:20b:31e::11)
 by AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:30:27 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e:cafe::6d) by AS8PR04CA0096.outlook.office365.com
 (2603:10a6:20b:31e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:30:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:30:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:51 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:30:25 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:18 +0100
Subject: [PATCH v2 04/11] bus: stm32_firewall: allow check on different
 firewall controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-4-5475c7841569@foss.st.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|AS4PR10MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a96589-bd94-46e2-748e-08de5357eec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFVEK3NtRUthbUkvOFJCQm5lL1k3NWwydjlBeXUzUm94d2U0MytjLzJ2cG5R?=
 =?utf-8?B?c0VHeFoyNTAvMDlsL2FFQUdRZjNHMzdObEVvcmt6bDdXK3dZWTQ5cCtVbUNN?=
 =?utf-8?B?VSswN1RvVFZRdWo1QWxTMGJBcFo5eEZ4d3N6OVgyTjVCcngrSGZJY3VVZ3NK?=
 =?utf-8?B?NXZCTUY1enZUMFUxakprajRpNWx6T1ZpdzRmK3U4QkcwMGxOYnF3WkVCSUtP?=
 =?utf-8?B?NXVHWVRYRjY1SSsvZFZ4RmNONnlVVC9wbXNGN2VCNkk4QnZPdnN2b09MZjk2?=
 =?utf-8?B?UnB5QW56S2V5UVFPU3I3eVYwZ3BEemJIYk5tZDVyQUt1TnpUd2RQUjJMTjBy?=
 =?utf-8?B?TnBzcVM3N3pja20vc2RiWWcyVU12YTRveTNicEFlK2hUNUtjaVFyYjRhRW85?=
 =?utf-8?B?TW53YkFLdUkrVW1Dd3VNR2FNK3dOcE50Rk90TExDSnBvVVNqQWxLeTE4bTFp?=
 =?utf-8?B?NVRUbTFvcm1kaFFGK2NrSG9KMXZQYWNGUk14UEdyVXlDanpCeTJjaDlYeEoz?=
 =?utf-8?B?U05DUmtUUXJ2cGpiRHFKTW00KzhxSmY2Y0RnS2dTNFpjMEhiRTJNdkJLZXFV?=
 =?utf-8?B?d09OWmRsWkFGTndjTHJDSDJCck9uTmh6QlI5WjZQcEdMWkk5THZDekJYcnYx?=
 =?utf-8?B?VkdNaXo3OWRoZ0NoVTFLaFBudlE3REkvRjZPUEJPS1E3ZlNrMVR3UGwrT3Fk?=
 =?utf-8?B?NmQ4UzYxeFllNW1mTzhxSzhkTE13SW0xNGZtbU5KSGlTUnhlbURVYWlQRW9W?=
 =?utf-8?B?cVRCNkdIcGpCaHdwTTNWODExR0lnSmRVcDJMYW9oeGFQeEtWM2EvSnduRnpB?=
 =?utf-8?B?YmNNOEdxb2FiU04yYTROd1VhMnpvcEpTNzhhSUs0T3ZDczdPVTlmdEtwbnpQ?=
 =?utf-8?B?U0owcFlKelVGY1dRc0NjNnh1dFRTQlBZWExEK0pwa2dEK0lYOENsVXkvT2FU?=
 =?utf-8?B?SVIxampWZGNCRlR1ZzdsNTZkUUtDK1l6YXZWSW95RUlNWnhvUkZKWHI2M0ZZ?=
 =?utf-8?B?M3BESENPUFNIbFdxU051dXNVbFRkMjFkakliZGEzRWt5Nk8wVzl3TWlyQmpu?=
 =?utf-8?B?d1ZRS3pjb2ZveGxCd1pCZ2VQY3Bwckp1aHVIaWNWYWVsVDNsWGhFOCtUczJa?=
 =?utf-8?B?bkl5bldHQ085bkoyS2o3UEdKQnFCUkE4a1NsMnJHTkFJR05wWGs1WENtU1lT?=
 =?utf-8?B?OVJZblhKZ3BITmk5R2ZpZkNmaGVXR09zSTZZZlBkWWFCdGdWNE9OejY5dHp6?=
 =?utf-8?B?cWxzV1lyV2pEZUpvL05TMXBCK0I0akN0SXlJY1k2WlFpNHV0M0NCbWpoWHFO?=
 =?utf-8?B?NTN4ZHRsR0FEcWtiaUhTYzV4bDJ0OFZSL1BwVFoya3REeWVIcDVtOUdRZ2Ux?=
 =?utf-8?B?UHNrZ2w2cFhESDVjOHN5Qlc3QzJQUnNJd3IrNHJxL1NTR09WRXFYbEZDcEVi?=
 =?utf-8?B?QWJ0djB3SlhYaFVDSTdwVm81bzdvT3FUZmwzVTBmcE84NFRENFd3MUlLMjBH?=
 =?utf-8?B?b2ZtbC8zNEdxbjc3MzRhbWZVZWhtd3EyOUJkb2xwNDZrb2FXTlQ5NFk2QjBK?=
 =?utf-8?B?eDJyTTh5WjRpcjhkaloyRE9jdUxOTzlISHRWenZVa3RZUmlFMmplZ0U4bjVW?=
 =?utf-8?B?blEwY3JtbGYxQWk2dkxsTmNvZCswK0taRW0zWXBTNU1iU3Nnbm4wdHJQSmxX?=
 =?utf-8?B?OXRjbUtObWw0Q21ldnVnRWVGVTBCOXREcWRoSnR4MEd6Ni83UjJBWjQ5VkZv?=
 =?utf-8?B?QmVGT1ZNL2dCYXgyVGh3cTdCWi81Ny84NGVLd0daZVA5MGgwWmJHRmpTcjVR?=
 =?utf-8?B?YWhsbUFzMlhFUXlFN0ZkdzBwUEUrZG5HaDlQZjIvdWNPMVdvM29vMnNucVN3?=
 =?utf-8?B?YW5iRy96b1R6elFSN0NNVlhqWVlhWEZ2NEo1ZVZrczVMRGlCN0x1c3ZFcmNj?=
 =?utf-8?B?SVNzWXY2ekVtTkY1RitCQ2paZjJwUG56NlRHVC84Q3lNWG1TMGpuZXdyaGFI?=
 =?utf-8?B?SWV3ZXQrVjFXZ2VXUXBjNG9QSzJPRkxidHFSak00dXlIbmczRXAxOU5yajcw?=
 =?utf-8?B?MWJuRCtpSUludFVSZjdJNTVXQzM2WU9YZFRKMzBQWE9DZzV2MUJvdFNlSGNJ?=
 =?utf-8?B?Ni84UEU4MGVDeFM4aGdIcFkwVFFRQVYwaG0xVXFYZnRrYnY3ckxmWVE3dUtB?=
 =?utf-8?B?Mk91NSt3ZkFQbDlZRm94NUZqWG5pcGcyTnhvRVJDTjJZMW5pMFd4ZEFkV0lU?=
 =?utf-8?Q?WLzcpGiaYgCB46QCty7MavImh90QEzys/zLYITMWus=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:30:26.5459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a96589-bd94-46e2-748e-08de5357eec3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5150
X-Proofpoint-ORIG-GUID: y5beF9xyA87GUt-Z-U33ozY-qssMnQ5d
X-Proofpoint-GUID: y5beF9xyA87GUt-Z-U33ozY-qssMnQ5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX2dNRtAsjrOQT
 DO+a0420IACHhZsz7zbafj6Kg8jOxEi/IVArEqLcT5Ils/yHrWA4ZFSA8nEh6uI69q3LQvWJnjs
 XiFB7bcSPWJQGjytlxRzWHwVTjvvCQwBt0e+gFp0AEYKiyUk6JMTUGK/0OYH7WnozwLqiQdQvrC
 LiepRdGDsEHNt68XBhrySxDzB5JAJy456CMCJNqqgmML3D/uBkhNm57PKqQ+OS6eQI3HdDo2fFZ
 n3BzzRQZYWyBpNL5KNa5FPNswzufrq8Pb3X12+y87i+VUG8M4SIxeqz6Hxa+56IuqefQ6CItSMr
 /tSMeXsFvpXRwaex0Nspu3qvyBAV+kZ86EbtD4rP6HvpBjokR1HdAvw9mpkbAhbSiXKzmHem4ya
 xiCUUGUWP9Ds4pI0zedIW+3aK/DFaH31mQLDa5pLoUEm6hErJNCxwGJZ8N9QkTNzPNvYEIQ9T6H
 oBjI4+IU2eE9pdUFSmQ==
X-Authority-Analysis: v=2.4 cv=YvYChoYX c=1 sm=1 tr=0 ts=69677049 cx=c_pps
 a=V9pI3Kj0Tnb2UoAc2Ye+tA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=E_Tl1f5C0o25NIMeFyMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Current implementation restricts the check on the firewall controller
being the bus parent. Change this by using the controller referenced
in each firewall queries.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..2717754d811d 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -274,7 +274,7 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		}
 
 		for (i = 0; i < len; i++) {
-			if (firewall_controller->grant_access(firewall_controller,
+			if (firewall_controller->grant_access(firewalls[i].firewall_ctrl,
 							      firewalls[i].firewall_id)) {
 				/*
 				 * Peripheral access not allowed or not defined.

-- 
2.43.0


