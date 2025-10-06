Return-Path: <linux-gpio+bounces-26806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAFFBBD5D5
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 10:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57E9418944CF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 08:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748DD25A35D;
	Mon,  6 Oct 2025 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="SKViHWz6";
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="R2xSKqX8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com [148.163.155.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538E50276;
	Mon,  6 Oct 2025 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.155.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739865; cv=fail; b=nOOueyefJl0KfOA+pmthrte57VP+DvUxOkGilDJ0vAR+t9t6xDBip86gwEa8XJbpCDpj5+O+af8FlVLDLcK0V56whaRcMOSpKZs0RalNbVtl3+MY5hf5Jcs6azGjDfGzoDhCt3mge7z2qQ1arGr8krgV2/TmVfhKsnKGQpcRriI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739865; c=relaxed/simple;
	bh=QjejZceUKWervrXGkI/GZxUjbpNGhQVYmV5h4Gf0DYU=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=TZ5V5ziNDsyQtC1+ZWTnUaa2ZdKKgKXR2T2oIk23DpKUmawSznHxBq/2pzAgrx+5R8htOXU5pUWlDfoK1I4z9jN7AmYQMz9LWkZLZJYVI5tjkEfraIZU4YIx7Zcu8Wf2o6Nnw8XDSZlf6UJjU9m/rJ9BEKc9Em0RD+Zb680ClMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com; spf=pass smtp.mailfrom=nutanix.com; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=SKViHWz6; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=R2xSKqX8; arc=fail smtp.client-ip=148.163.155.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nutanix.com
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
	by mx0b-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 595FsQIV2692596;
	Mon, 6 Oct 2025 01:37:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint20171006; bh=pdoKQLjU9TzHf
	0O3ysbasMAyO2ZX6BpGyRJBsYzDvTQ=; b=SKViHWz6p/t1wArAEVHFCqfWMv3pE
	zLtOId4w7x1SlmPBfK25DWdHGNqe6USrfAR77Ug4LM4sF3YGmN1XYZ8zi0xg2gc1
	SxkmOiw6/qjRf9HvUvAx7Shoseqv/UWATeM2f1hokzk4IU1eIUGYgYzT9/qEfEEC
	V7wVe8KRwYM73zltJI2rESW3s4nBxgtnGGJY/9aQUavy7CalfCwG6hk8uW+lm6Oa
	PD9/uyIcQmYY67JK5GgMTxdvIYTpFGTQSjqE84vgjwhVLOiOQfnvz+pzlvL9KFkR
	ZD3c6orTmUtjLjQOVw8Gc5AOvtzvyXbmchWQdPFSpMx8D6SNXHyFVr1eQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020114.outbound.protection.outlook.com [52.101.56.114])
	by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 49k144anbc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbVmlmYR22sKfyeykP3OlhwakXxGJR1SYRT+SKc8WovH6b0au2tp3elEKSd8q3DBPL6DyDJEeaW6kElpu2DPHv6g4YllyEXdfExZDIfESDGlEiMKLrPSRRM8cyaqwJj0UkoUDkDXT9uiWWgGW8CAZGBWCblIs3OOUcBs+jDv4eoSie00g4/Tm1P+6IcOdFHzO0WL8Sg32H29ke+RzyN40HCOzp3KKbgmdSTC1fMHW2ezE8yw9HYulrOSp28X4dwsTANZVI8vLo2l4jOsZL4UoWFOZiz1n7LTe43jAQzzIdQkjrSV/rYnKf/LIYfM02HGgAxGXf0LvRW9c/62/9zjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdoKQLjU9TzHf0O3ysbasMAyO2ZX6BpGyRJBsYzDvTQ=;
 b=Jl1/3BkHJ4wDCqWfBPN2pkD3S6NW7knv1vPMGArdY32PLOEuwkcaxN+dFWxBxVTxxCNPfWaqKo/bA5wKCmw879AGijYzf9GSLLqqW/wUW17Parmlrv0EXEKLr5UfGIlG4b4F4PvjY71kTdGWWMQ0D7bpuhfLI0+9erSoFoACkaQX9/PgH1FqkH0g1TPS8GOTgDfgS7lntVSYLGkp7BYJinUkZTLirfSm8fZ6QlE1nvIfMZLMXXWpTANPAla67BLfINGq6gzkLu2UIdMNp+3FSRzuSugO1xghZ7DWK92C0Jgg7tpuABmHGEwU09OH/2f1JiTzo5A12fo0CXQFWANRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdoKQLjU9TzHf0O3ysbasMAyO2ZX6BpGyRJBsYzDvTQ=;
 b=R2xSKqX8iOis9q2I+QidNMICu9spsA+byRH2EZDD3O9rHmh4mC0YDESuvY78r2iFfFb1otmANzwtSFuEPqox24USopz2ZncuEsKj70guZ+adRUhjg/+67sbIQtedJBdK/BeUnSyW/8o6Pk4Xyr5hqHn41LnlhXkZnHNsSj9+IdHdS0Hxy+3OtyD1OX/NKUoNCZTx/Vp7jUFxFptBx7bF+vv/bjooLFu0a/nNB6HVLnr1hxWaiWTmVat30tCSOCY/cuVwSYBSEhxEerinYNvGEE/NZefZAwYXiqFtqlEwqWIvs97vvZ30JxoOUbSt2cogrl+cy1mkVLdcDCKQPHKt8Q==
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by CH2PR02MB7048.namprd02.prod.outlook.com (2603:10b6:610:5d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 08:37:19 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::6cf9:b35c:b143:bb88%3]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 08:37:19 +0000
Message-ID: <9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com>
Date: Mon, 6 Oct 2025 09:37:14 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: wbg@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
        andriy.shevchenko@linux.intel.com, mwalle@kernel.org,
        broonie@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: gpio: gpio-pci-idio-16 regression after LTS upgrade
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:208:fc::35) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|CH2PR02MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3ad0a4-6cda-4dfb-478e-08de04b38f46
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXVGdGhxQlhkRWZROVhoTFBLTk5BV3gzbUp6Zm1DN0cvemUwM09uMnF4SjBw?=
 =?utf-8?B?eWlBQkxmQ2tFUUlTbXozY1ZYMXUvYVNabGhjb3hBUkZPSjFleFpIU2I0TEZq?=
 =?utf-8?B?bERwQVRIeEgxM2gwZGh3a3pjR2ZsTElhV05FNG50cHFnSjFxMDJlTEFVL2pJ?=
 =?utf-8?B?QnNiQmo4RFNZOHRzM1lnOG85bWd3V1AxbmxPbUpKRERURk9jVlVPTDE1alZr?=
 =?utf-8?B?WWlJWEFxRFQ5aHJ3MHNQeFNDTE1aVWpvMkRVZzVFNTFjcUpDSGZBTGY5Nkwy?=
 =?utf-8?B?NjVaL2lmSktzaGxaVjliTWhnYk1HMTk1SSs5T1E0dUEvSDNVS0VYbHhhTjlH?=
 =?utf-8?B?ekJlRUR3WVpxQTZsRFR6bC8wdlNSa05wb1JVK05YMFE0VHRTdjNCbkV1WHQv?=
 =?utf-8?B?eGpTQUYyb25EVUszUlZFNmJkSlRsbFl2RnVxSHFnNFRWSkNZcVloYUkzZFdP?=
 =?utf-8?B?bEtISlB6MHJWQUR2WkxkWmlQY3l4UG9vUS8zTFJYZjI3VEdRKzVuOCtmeUg2?=
 =?utf-8?B?MEpjQTRsSy9TNndUN3pxYnZtZVBucVRnMm5oS2pWTWZqejdUUmpNclEwUnNw?=
 =?utf-8?B?djA1V0RhZXBPYnVCTTdQUHpVMkpFZ1N0c3duZVFsRGkwVUxCb0drQ2QvZ25Q?=
 =?utf-8?B?ZUthQWlUVEhxL3VxamViU09vbUxKdldkS3B5TldNaXZRZlNDVDZBbHdnUktX?=
 =?utf-8?B?S1EyUm9tVzlMdEtnUFo1RmQvS0oxaG0rcG9COTZlY3VEMit3eWY0SkZuaFMy?=
 =?utf-8?B?alBWemVNaUIvcCtZMERueXRnNkVlc1p4c2tSS2l3K2NYV3ZGRzlXclFzZ2lK?=
 =?utf-8?B?NkcyY29QdTVuMFRVN0k3SllqQzhLTnZYbzNYQlNSdk1Hc3Y3ckxCV1o3NlEv?=
 =?utf-8?B?dVZieXFZRVoraHhtWFpBZXFDRmlyQjFJelF3WTY5Szc0SENqcUFZSWhuVDBV?=
 =?utf-8?B?QWg3bUtEYm5xZFg5MzRoVFhja0VJakkybE5IRTdmVFV5ekVLZlpvS3VnNkxv?=
 =?utf-8?B?WUlEKzhFM0xYRFBUZFFIa01qMndWSnQ1NjlEcXNBaDF1NXNua0FyTzBITFA1?=
 =?utf-8?B?OGF6cnI4WW55a1JpMjVrdUJYa1QvKzBnN24vNzRvZDBEUVVTZ1VOdmpJRlU0?=
 =?utf-8?B?a1h0WWVRdzh3eWNUNzNlVk92MmtwcmNMRzM4akgwSHhsZG1TUU51dGRvMmtW?=
 =?utf-8?B?bzVCUXNZV1llUHRUZEhHdjBEVmlhVGNNVzNYSm5BRWdQYTlFcnI5UHhDTUpi?=
 =?utf-8?B?N3pxL1BVZHd3czJSZUhpM3RWblNyNS8yNlkzTmw5d0tUOEhwa3JFOTNwakhG?=
 =?utf-8?B?OGNxMG54OFRRVmdmZGZrZlFpaENpZ3RXekVJMFoxOUxsWE1vaHlSY2ZIeE1r?=
 =?utf-8?B?UzdBRG4wRnF1QnNSQUVnNENtOU45NXdqZGp1K1BVNVNMMzJNK1NZSkVVdTlo?=
 =?utf-8?B?UjdvZy8yWlpqMFdoVllFeU1hcEFZQXV4L3ZTTXpPRndiOU9OejVodUJkZmk0?=
 =?utf-8?B?L2U2QTY4bnJ5Y1BOdk9xbnc4YnZsTml2bDZPUmpyNXZaSnlLVUVuakQ3UTBr?=
 =?utf-8?B?aGppOFlsZHB0U3RHS3kxRUs2NEd1dFFKdGw3SnAySDdtMm9vRmxXK01tblU3?=
 =?utf-8?B?cldreHVvbTBWbGV5c1huNlpvZExTdy91SVdacHJ6OUUwQnFzbUk0dFl6U0wy?=
 =?utf-8?B?RkppYnE3UUo1a29wVHl2S2lndS9zb1djUEFtTGtNZVdIZUdpaEFMeGpQZXlo?=
 =?utf-8?B?cFQvNlBINUdBQUFTUkZJSmlwek9QR0JNN0tzNnRYeDh4aDE1QWhtdnR4QXVU?=
 =?utf-8?B?MUhicTBxUHdJRTIyU0dKbFJqRXFMRy84VlBTSFBkNjEzMGdISTg5cEFTOHY2?=
 =?utf-8?B?d09GbzhVUkhjRWZybzIwMFJrOTh6ZXlCMlhHUWhldlNuZ1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWk2VzEraGE0NkxlbkJ6WStWOWY0VkNlaUNhZWIrVmE4MFNSRVdHb2JldzdZ?=
 =?utf-8?B?ZlR4MERYb2pHWVZkcU9IV1ZvRm56d3doNzhUaGVMam5yNnhWSGp0aHorQkVs?=
 =?utf-8?B?R3lMemFxcGdWbmVaSW1EM1NGUUJHZ29ZNU5MYWlwWW9xd2tKbTFGRUw5R0Y0?=
 =?utf-8?B?eFBGZzEwNmtNMVRRQ0xlcmtlTGNzSmZnQytyM2FjMmxndDF0bFdLLy9DL0RH?=
 =?utf-8?B?bTk2MU1QM2N2OE80OE5Xb1V4SHlyT1hqVko0eElUZmtjcmd6cWhLUDRXdkh1?=
 =?utf-8?B?dS9ab3VMVmx0d1M3eVJnbllPbHNZdEc0LytYWndJUm5UU0JBQXlBM0V2cS9I?=
 =?utf-8?B?NzFLWEZ1UmE3VndEekFMTUlQSGh3OEl5TnlxR0w1RHh5NmR3Z2dFVTZkYkhu?=
 =?utf-8?B?ejg4Rkw5UkpKWW5oWDBUd2d6MlE5dElPczNBU281K05GNXk4VnpVSkJ6MkRM?=
 =?utf-8?B?LzZUbVZFcE5HZWkxQUVjVmJ2ZFNwYVZ4S0N2cUNvU1hQQjcwT01hbEpyVWhZ?=
 =?utf-8?B?Ykx0RWMyazc0c0pIRW9oSTM4dzNKdGJhbmlWOGtjakhXM2JXRnVKZnNOT0FG?=
 =?utf-8?B?UFRhTUs4Zld5djc4OVhOZk9Gc3k2WENWZGRkYVRmOUpjdkJ1emcwWlhZZFB3?=
 =?utf-8?B?MC93VldvTG1pK0FLSXpXODl5TjhFUHlBblowaG8wS0VRU1FSRXNPSmVOOXJQ?=
 =?utf-8?B?eFBXeGp3Yjc2L01JWWRCT2Q5N0pmOXJUTVErWjc0TzJ6VzhtaU5sMXU1Q1hy?=
 =?utf-8?B?azJMOGJWVFB2S0dMT1l1SUZuWktWeXVrZ2ZCelcvRlJSZTdxRE1PSm4rK2pN?=
 =?utf-8?B?YnlRZUxJUHZ1ZEtzVnJ4cERBV1Q3ZVp2V2Y1c09mSnNNTHRsWWdaMTNvMkFo?=
 =?utf-8?B?L3ZWV1JxY0JPZUpVWFpUbElmKzR2ZkF3Ulo0NFNQdDg0Yk9oZ3ZKL3RoMFlr?=
 =?utf-8?B?eWlTa3laQm84Ri8vOGxWUHZOOHhKM2xwNW1jZmxaVFUzYlg5T0NQY2xWcWpq?=
 =?utf-8?B?SEtHR2ZVVUQ3Y3gzdytaTjgzN1NpYmpuWUZZWlhlRUQxL0FhWGpnNFMxbk1B?=
 =?utf-8?B?SEF2K09aeXNlYnBra3lIWFVqVEptdjhMUU5UV3gzZis5NVdNZ3RnMEhMaDQ1?=
 =?utf-8?B?c05vRldLdXkvS29LRmNPNDExZHlXQkRCc2FTazZjZ1VpL2VzaUlsTzEwQkpP?=
 =?utf-8?B?eTRpNFZxWFVEQjN4L0JteEJIUXVFZW91NjIvRFVrSm90dlhMSHh3WktkUDdX?=
 =?utf-8?B?K0pnclJsbVBneGJzYVJNZmhxdmRxbUUzd2ZXQkx6ME95Y1Yva3BIVmk2a2Y3?=
 =?utf-8?B?OUpsbFVUV0R2Rkw1S3BVYnFvNWE4U01udC9RZGdFYituZDIwQXl3UWdOcjNX?=
 =?utf-8?B?Y05ERmxtM3ZUVG1VbjBVU3NSVWoxQ2hOV0dpbUR6bXdBVFdTdERiYTIyMUg0?=
 =?utf-8?B?OGlDSEZWa0xkRTJ6dHRSb05hZ1JBTjM5MzdlLzBpMGFvbUJEc2Z4VW5CbjJK?=
 =?utf-8?B?WHAvWFJMQjBFaFhIYndKdThFUUlYSzNoSnVTVWVldEg1UGxiUS9Ld1JFemlp?=
 =?utf-8?B?RkF6eHkrNjZ2SVVGa2NWZTc4azNkS2tqdk9EZUw4SXU0MVcxcFg2WE1ldGo3?=
 =?utf-8?B?elJFWHNzY0syT0NzZENkNmI1dGhpaEhTNFlCVVRXRmFWajNnclZ6NThQUk53?=
 =?utf-8?B?aWdNZkhFZHZHd2lFYm1GTzNkZmF2eGJGMTlFMTl1Qkc0OFJZZVBDM0ZKbVNz?=
 =?utf-8?B?ZmQxN0NibTR1L2QyUWpQOGhqcmdIOG85MURYMDhPWW5WZWdLcEFvTktTTkJm?=
 =?utf-8?B?akxTQ0lhZjBKQlh3QVJ3ZEZ2TEI0bnd5WmVmUnpJSk02Z0JuSUw0cFMxQUFu?=
 =?utf-8?B?NEhVS2I0NDRWMFQ0bkdsQ0tyQmpLUDZ4OXdmaTZjU1VPUHdraXBUTnhSemQy?=
 =?utf-8?B?U1JTNGQyNm1vRkRKRXppai9PbGJsUlJtK2s3K1JiTnY2cDQ4ZkpXRVk3NW4v?=
 =?utf-8?B?RWl4YWQ1enFRTDh2eW00b1pvM2ZsOEllOVpkUmZpbC9jVThJVE9SN1dyTFdw?=
 =?utf-8?B?QW40ZUljdWQrc1BpVW50eFBtY2I3a29qZjF6RnphQ21QeTZuSlJIN3NUdXNM?=
 =?utf-8?B?cWowc0pIQjJoOGU0UnpTMEdVN3drWC9jKzZQZ0VHdlRKejR6ZXlCNytEeERj?=
 =?utf-8?B?WGh2SUphU2lYWFVzK3hCTExJd2VRNDZaNzM5eXIydnJRVlhYMEs5TDB3anhH?=
 =?utf-8?B?bmN1Ym00K0VzMElCMnJ5RXFxM3R3PT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3ad0a4-6cda-4dfb-478e-08de04b38f46
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 08:37:18.9506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/caZ/uB1vB+GzPgFDM/qBXjl4/TmZWIpzqMD0X4U5oqO+7adt0ndFiQ6FIkAj1kJr8FFUhI+sruEXZPtJQ2RMXCjPwu7X9nH3AAP19X350=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDA2OCBTYWx0ZWRfXyNdPjJKTR2bq
 qVO1k96ljj3FCwC7G+qGb1RUze64fAIt/nKiTwzp1PYospwQvc6q9sCxiOYm+hEGq8ljeL5jnL9
 b8xQhofHKGSHTvWr/HH3ZUpvwcs1rQuOKytBCCOv9N1Grx9MZ79e0ijUzYWwADD3eR8nXePt6Fi
 mmoE+GWIz18nNcQcWPkP6oir+E+XONM6Gzz/pFgVBHRmuS0Im1TZ1nrTB7skcMflcYiOf8pHtIZ
 b2bo/hrAlnfBCM8NEEijddaPnZtB75rDtzhMK+AxQ5slyeFOxtJ3H6ZELgbrUHjHjIbwy7iUM3m
 1mo0LqNOJa++KqyWuXfq+JysBImSQqobdzFAkh3flTxBAS5t4OMQ86dAdNaoBc5QQemj9MV/Pgq
 0NgcDvQyBs1Qbo1O6OVPTA37mEgNIA==
X-Proofpoint-GUID: FEXxZnpTvc07iByGtLMpOuE6W5sloYI_
X-Proofpoint-ORIG-GUID: FEXxZnpTvc07iByGtLMpOuE6W5sloYI_
X-Authority-Analysis: v=2.4 cv=ftzRpV4f c=1 sm=1 tr=0 ts=68e37fc4 cx=c_pps
 a=+29CLaFxg23VDaVrfDag4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=0kUYKlekyDsA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=hrZceBfQf7rQD2G_XrIA:9
 a=PxTCrEBW-KDDWyxm:21 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Reason: safe

Hi all,

As part of our internal vfio testing here at Nutanix we make use of an 
emulated gpio-pci-idio-16 device. Recently we've upgraded our LTS kernel 
and found that the device stops working which I've bisected down to this 
commit:

$ git bisect bad
73d8f3efc5c2b757ab06685741df01eaed8090c4 is the first bad commit
commit 73d8f3efc5c2b757ab06685741df01eaed8090c4
Author: William Breathitt Gray <william.gray@linaro.org>
Date:   Thu Aug 10 18:00:40 2023 -0400

     gpio: pci-idio-16: Migrate to the regmap API

     The regmap API supports IO port accessors so we can take advantage of
     regmap abstractions rather than handling access to the device registers
     directly in the driver. Migrate the pci-idio-16 module to the new
     idio-16 library interface leveraging the gpio-regmap API.

     Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
     Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
     Link: 
https://lore.kernel.org/r/5ba5405c64aca984d5cf3bdbdffa04c325e5a147.1680618405.git.william.gray@linaro.org/
     Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
     Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
     Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

  drivers/gpio/Kconfig            |   2 +-
  drivers/gpio/gpio-pci-idio-16.c | 294 
+++++++++-------------------------------
  2 files changed, 62 insertions(+), 234 deletions(-)


With this commit when the gpio-pci-idio16 module fails upon load as below:

[    0.266606] pci-idio-16 0000:00:03.0: error -EINVAL: Unable to 
initialize register map
[    0.266867] pci-idio-16: probe of 0000:00:03.0 failed with error -22

After some more debugging I was able to determine that the failure was 
due to the regmap cache failing initialisation in 
drivers/base/regmap/regcache-flat.c::regcache_flat_init() because 
max_register wasn't set on the regmap. I was able to fix that fairly 
easily with this:


diff --git a/drivers/gpio/gpio-pci-idio-16.c 
b/drivers/gpio/gpio-pci-idio-16.c
index 44c0a21b1d1d..55be571b5cca 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -41,6 +41,7 @@ static const struct regmap_config 
idio_16_regmap_config = {
         .reg_stride = 1,
         .val_bits = 8,
         .io_port = true,
+  .max_register = 0x7,
         .wr_table = &idio_16_wr_table,
         .rd_table = &idio_16_rd_table,
         .volatile_table = &idio_16_rd_table,


Okay so the module now loads, but all of my gpios are now inputs!

root@debian12:~# gpioinfo
gpiochip0 - 32 lines:
     line   0:       "OUT0"       unused   input  active-high
     line   1:       "OUT1"       unused   input  active-high
     line   2:       "OUT2"       unused   input  active-high
     line   3:       "OUT3"       unused   input  active-high
     line   4:       "OUT4"       unused   input  active-high
     line   5:       "OUT5"       unused   input  active-high
     line   6:       "OUT6"       unused   input  active-high
     line   7:       "OUT7"       unused   input  active-high
     line   8:       "OUT8"       unused   input  active-high
     line   9:       "OUT9"       unused   input  active-high
     line  10:      "OUT10"       unused   input  active-high
     line  11:      "OUT11"       unused   input  active-high
     line  12:      "OUT12"       unused   input  active-high
     line  13:      "OUT13"       unused   input  active-high
     line  14:      "OUT14"       unused   input  active-high
     line  15:      "OUT15"       unused   input  active-high
     line  16:       "IIN0"       unused   input  active-high
     line  17:       "IIN1"       unused   input  active-high
     line  18:       "IIN2"       unused   input  active-high
     line  19:       "IIN3"       unused   input  active-high
     line  20:       "IIN4"       unused   input  active-high
     line  21:       "IIN5"       unused   input  active-high
     line  22:       "IIN6"       unused   input  active-high
     line  23:       "IIN7"       unused   input  active-high
     line  24:       "IIN8"       unused   input  active-high
     line  25:       "IIN9"       unused   input  active-high
     line  26:      "IIN10"       unused   input  active-high
     line  27:      "IIN11"       unused   input  active-high
     line  28:      "IIN12"       unused   input  active-high
     line  29:      "IIN13"       unused   input  active-high
     line  30:      "IIN14"       unused   input  active-high
     line  31:      "IIN15"       unused   input  active-high

root@debian12:~# gpioget 0 0
gpioget: error reading GPIO values: Input/output error

which also output:

[  329.529321] gpio-512 (gpioget): gpiod_direction_input: missing 
direction_input() operation and line is output

My guess is that this is because 
drivers/gpio/gpio-regmap.c::gpio_regmap_get_direction() isn't able to 
can't handle the situation where lines 0-15 are outputs and lines 16-31 
are inputs, compared with the old idio_16_gpio_get_direction() function 
it replaced.

What would be the best way forward? Possibly add the .get_direction 
callback to the gpio_regmap_config? Or is there another way to have 
mixed inputs and outputs with the gpio_regmap API?


Many thanks,

Mark.


