Return-Path: <linux-gpio+bounces-18737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0C4A86CCB
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 13:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A3E178DB4
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 11:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0351E04AC;
	Sat, 12 Apr 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZfniJ1Rp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YecTKbj0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CBE155382;
	Sat, 12 Apr 2025 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744457523; cv=fail; b=c5o76jN8V3Iu1eSsd0weQcYzKuDvUKXVeYFJjpI4Rz0tpc60oUKtA+n62QZYFO3EtEihBbEIYrQHEJUpDMzf9xifczrPeGTnaTZHJCPAsREWPwvLOS51iKkJXXn6TK5qevElYageI3ukfajNatGulsH2vk8ecGrHGyq1nJQt20Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744457523; c=relaxed/simple;
	bh=rd/8znU0RaU2DxGCuKzfy+RuAqWSDXzySbfan8NN5jA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DRuCyY3Ru018wacQVzEhEbxw+voFbUFWgWbMHm9A1T9JnEAgYVcs258SeeYyR8HgqTyk1cnnVedclImyN/dPQGka9NDHyJ0ePdBl8ppR9tI8A6LiCS+YSJdlvARHYDh5vGfJSW45S6im5PaReYk2xP+UlK9Ey2r5UDBn/ODQswE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZfniJ1Rp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YecTKbj0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53CBM9oe001475;
	Sat, 12 Apr 2025 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=8fqP1EjPbzZM/WuH3P6nH3zHC5jbQmRyVy75cdY49mA=; b=
	ZfniJ1Rp4VGoE5hw7iWQXliX5fFLStXw8t0q058485xGk+MfNyVOR+v5MMiWhrrY
	ThNgH9nR6yMHyhso0hZJDSoqddPaSMJD8qiwPcfVq4ggMaSU+3kubRhfXAPKPzDL
	yKjxFjgriq1Kok1Kdv4//QZB+cFKwVQtxw4ehPbGec6PwrUStGscoul7/eorP0TA
	G0cJUl662t1vkutXxkcpf8Ge2y9U5NfwVI6h1/F5lWO0kJHUlzR4zMPJ/TkMfJ1h
	QK9n9aKp+fWIjfm0H3hjKUx0xjUsFhJZJM5a2z/S+CcZUQojxANH+hxMW0ukd4kk
	NpFe87uc1lySfkPRzGgdtQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45yq80804n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 11:31:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53C72MHp020134;
	Sat, 12 Apr 2025 11:31:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45yem6agr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 11:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbR/kg2b7efMWcci3bFab8lCQkPv08e8jgdlllk4eFIyT/CHkawT76HIZ9wkY4A+AJua7NpT804oFfF+MJH6Aj6f46PEXs04MJ/0DM6HppcQYUCEwLZij/By40IYJUcz7+aF0vrZOC7y4cnqtO7w75w4RaGlvwdoCBNo6gbLNpWMPoO05C75wh4KdP9mtXvLuqAARwGBdNAs9Sz53eXOiPNcR1dZykGoTqXPHAX4XHEWn/BPOQ0O+d0aj7/g44Ahe7SZDgkF2KyIkz0QmrUoa7mwfWMUPVnmKXFtV6ALTDYDaQ6Lr72ew+ZZBKj+zKD9EP2AdWWaCk98OY+vHaQKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fqP1EjPbzZM/WuH3P6nH3zHC5jbQmRyVy75cdY49mA=;
 b=FnxCFSmqZfI2n/+2NNpqb49kZ/nSZbo/2P6PIFOZAUc6PryYUyqR3ok5M5e/pBSZxgYdALoaC+n/V4H8i4GQG7QrG3KwDcb7m2xatxKI6UT9ygzasYEAdEIR80BvlIui7EdWX1j/A8rmx7hoNHhOIW0l1i6BobqvEqo/X1ydQiYF2K5t0ytUMMpQ00nlQ192rPvdNi9YUIFvuj12k2pr9ax/w4KcRAURtjpZ9ByOiHkBY0GglQlyEmEKMmhVfzkqsJ9jKMqPFLpjWCLBunt18Xa622x1Hwy/VSvT4gOoCn7fM6nOfOEqTljg+Rm1X7EHl+ycFBGUXAShFP5BycZ0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fqP1EjPbzZM/WuH3P6nH3zHC5jbQmRyVy75cdY49mA=;
 b=YecTKbj0blg6MjCJ5TQP3PXu2w3UHxr13Fhuk64yQwQPhHBPODzSb0eVa9BIs11cL9aFnhclS6IjqWia/jBV8r1eIEew4cJ3AuiZYbflGWalO83sLOzA4cWHxPKyz5HxWHAUkhUxSx+L6RoLPBz2a8bIzv9G/Zxc/qcjprXQXRo=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CO1PR10MB4580.namprd10.prod.outlook.com (2603:10b6:303:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Sat, 12 Apr
 2025 11:31:40 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.030; Sat, 12 Apr 2025
 11:31:39 +0000
Message-ID: <194dfb6c-d290-49f7-b060-3654307c4887@oracle.com>
Date: Sat, 12 Apr 2025 17:01:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-1-e39734419a2d@gentoo.org>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250412-02-k1-pinctrl-clk-v1-1-e39734419a2d@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::19) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CO1PR10MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a20305-8d5a-430d-ef1e-08dd79b59774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnhNb05sWFFGRWVQY1NDb0trT2hlbVkycFBJVmtzS1kwTlM2eCtsYS84Y2lo?=
 =?utf-8?B?b0tTZ1ZZZU5ldWxzY0YrVTZ0ZzVJU2JxSml6aUpnVmZ1dzk4WDBmYjF2M3Yy?=
 =?utf-8?B?T0FmekxSU0lOdDVVMW1lKzFydXBsOStEVWdJcmdFZkdTa05vbmxnUjQ1dlN3?=
 =?utf-8?B?Wit0VDIwL1h0ZTFhMk4yUnhKSG4vWVBUMnArd1NnczFuc2YvQnFsc1FMRlRK?=
 =?utf-8?B?eC9NN0J0eGdCSjBaSEpMMXl0elN1WGJrU0d4Zk5va2ltd2ZtZGZyVmdJQmxQ?=
 =?utf-8?B?QUtTRUtqdi8wQ0tHTEpqb2xram1mYkkvT3VrcnZ6amZXVGJNRmtDVHRVUDAr?=
 =?utf-8?B?STJiODZWaDErVi9kdEUzdURSSXNVazBOUnBicms4eE5YQmZRSmJZOXB6SGhl?=
 =?utf-8?B?dmd5NnVQcDNkZTliWi9La2pCZjlJOVFFc1QraFpILytNK2Jmc21sdGl5QWJh?=
 =?utf-8?B?dzQweUJNaDFTMXpSVnlvYzc4K1BoYk5DT3hJd3B4cDZxZ2k1Mys0eWtFY0Nq?=
 =?utf-8?B?NUNsaFJsS2xSbUZ2RWFsMHMrQ1JEcVFNcUN1YWFuL3pESkRPVHEzM09kYVZL?=
 =?utf-8?B?SWtaTTVoTXh6azZTYnlLcEMvclkwRTJ1RmZrb2VxMjNEYmpCcHR2R0NXbzgw?=
 =?utf-8?B?a2Nnd0N4eUJqOTBST3Q3aXNVdGp4VUdqUlJJd2dNWTdvMHBSSnVVdHFZdEFI?=
 =?utf-8?B?bTNpSWhaa1F2aUM3RngwQ0Jnc2RJUUFySG1uajBsQXFjZ3NFVm83WVV2YVMz?=
 =?utf-8?B?Ky8wU3o3N1ZDVU42WXF4L1FteEpWSllZcW9KdzNRb2pqNjY3OTdJaGpLeEpk?=
 =?utf-8?B?ckJzcnlTZmI5aWpwZWJsT0NyMVRlN0REUzFKU0x5cTd4eUNQeFRUUnQyT00v?=
 =?utf-8?B?dno1L3RvMCt2bnBWQmlaazU5eW1sSmZqV0pZOGRYQWM3SmdteFQ4RGVPVHFi?=
 =?utf-8?B?MUlLUnRlcE1xZzhFT21wUk9jWDRqeEhrenMxU1JPanhTbWtIWkFreHVQWGtN?=
 =?utf-8?B?UUdNcThpYlIzOXQvdW9TSUpZdmJGWjVEYUtBNHkvSVhtSnFLQjllbHprd1J5?=
 =?utf-8?B?SXR3OEl2R01BMGE5Zm5ZYXpMVXgxSHdXUkJmMDlzTFU1UjRGK2NFODJibmZE?=
 =?utf-8?B?eWw3MHN1dU5UNDZjZGpkOU81aVZ2b3JxS3Z1S1dQcG8wY1poeVRzY2d6TWdK?=
 =?utf-8?B?NTM3NFVEUE1aTmxDK1FaaFZmWk5XUldVdVJEMGZBOWFZSjNNTVI1UjVYU0tn?=
 =?utf-8?B?UG5MZkVtVWxhNlRGZythRmNNcG9XbHpHZk0rRzUwQVFkYWZJUU8zWnRVUzI3?=
 =?utf-8?B?c09jUTlwQnVGTnI4VTRvNy9YTmc4N2hXTllhRkpDa0YyM1djWC96OHNISis5?=
 =?utf-8?B?Sk1VeW1RRmdWamkrbWtSQjBWdDhLYjNNdjJYcmY5bHBqVVVnSkdEUllzeXlo?=
 =?utf-8?B?cGc2cU1UOFRsTDhLcjkxVTN3SldjMUxjeE91cUhVSnltWndhcVRVNVU0QVFE?=
 =?utf-8?B?YndBSXo3OTkyN1p2OEx6OEZGSGUvd0ZkSTM3NGtkUVNIS2txcWVuWlV4OENj?=
 =?utf-8?B?eVg1VmpVeGVERXpxaW9RYytkTlN6ejF1bEZOQ2p5dWhsakFzTC9TMXJLK3V2?=
 =?utf-8?B?S3JxWm5TY29udTNMRTduL2U5ZHZGSldQWjVvSUpzdXphU1RZMy9vMTN1M2sy?=
 =?utf-8?B?d1V1MGdVMi84V0k4L010TFhscGhkY0xpSEltb0NCejhlL1RZVTdUdVQyTDdM?=
 =?utf-8?B?S0NyVmdwczl1ZlhrWUhoS2piWUxxUGVYbmdxOFM0TG03dnFHbHN1R1R0T2s0?=
 =?utf-8?B?emdXaUtVYmdsZFJ2Z1YyODdTTTJhQStzRzgwSE1Ub2hsR2VOYUJ3dkpKWjdQ?=
 =?utf-8?B?bGtDTU41aXRFQWx0MThHejlCSlpicGhqSjFUZzRGSktrQjhRKzc2TE1RMlA1?=
 =?utf-8?Q?3QsQfeJXi3M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWgwdzF3d1MvTFYvS3RnSzFzRklvSFRERklhQ204R2JiUERuMUNwVGRRcUpP?=
 =?utf-8?B?TVlFb2lLSUhVK0dzNlNkaTIydm5zNXB1ZVQyWHFiRnlEL2t2bjUwRnhWUjNB?=
 =?utf-8?B?TjNINkNSR2Vvck9xRGZUS3VNL1pvdHI4MEg3L2w2dWtQaStUN1RCazlZSito?=
 =?utf-8?B?WjVOSHFreDYrUnB4cGNDaWZjam82NFdwR0dXQ1V2YzRsbVRMOG5BbzFjczhs?=
 =?utf-8?B?MWVtaWFncTkvdGh1WjBKdzZ4K2o4NlNuRkNVSFBQRmtIbU1XaE5ENktwd21t?=
 =?utf-8?B?dlB0WmhVcXRCZHVMSDFJL0Iwcm9xZE41cThxMVVaU0c3bHFpbndaTzNHeStH?=
 =?utf-8?B?eWt4c3NRSVdnTmxmMWp2ckdiTUhnMndmU0JERHRMTDBEcll1Y1YyR2o0dGNt?=
 =?utf-8?B?d3lybnZ6ck9PRmZRcUY1OXlsMEt4WU1PT005aDl2enRZRFoyUUVtTFVybjhV?=
 =?utf-8?B?UWppNWx6RTdTRE5GMHFaaS9MWFVZUGYwVW92eFYvTXU1TEF2MHY4Z2JDelFh?=
 =?utf-8?B?Y1Y3SThjWEV5Tzl2WG9ZUFV5R1RnRXZWU21EOGdHdXdFYkZEblJWLytiTExT?=
 =?utf-8?B?dURWY3Z1S0lOWU50NjRvb3pxd3MyN2FaTzRCaE5ZMVFJNGNOaTM5bktrVGFW?=
 =?utf-8?B?OFlmL3VHZjBXbXdlWVUwTVlHSnlkMEdFL081bnp0c3ZmRG8xWHY0WkN0b1RB?=
 =?utf-8?B?VUR6SVFJZlYvVzkxV2Y1VXZjVmhBdUVMSSsvMVFKTGloOVJvV3ZqZ1VJRHBR?=
 =?utf-8?B?dVljOVFnb1RpRlFzNnFiaEw2VlZ3aXVJNndqcWRIL2RSZGI3ZmNFaUlBNit1?=
 =?utf-8?B?U2t0Z3VjaFNXQk43alJ5cVVYRm53dDk3VWcyb0xadTA2YVZHQUlhVEdRRDZy?=
 =?utf-8?B?dmNMT216QXAxZlZoalFTYzk1aGpZbmE2RGxoOGE0WE1wWHI0TUNoSm9UekxL?=
 =?utf-8?B?TVUzZTE1dGlDdGQ4UkViVFVDdXNsMkRlQisxQ1Uyak9KRy9IeWpQbUZCTjhV?=
 =?utf-8?B?QUYzSWgwK1hXTU5peWNVQi82UG9ucTFTa1JGUGVhb3NjNUg3K1hlRktTeDVI?=
 =?utf-8?B?NFdTVEFFYXJmeGg5bGpFUVg4KzdiRFVEVFpUSG1aY1pYWndPTCtWdGFDZU5y?=
 =?utf-8?B?SElpemhqU0RLRW90L1E2bStOUmlUVFJHalF1U1dOcUhjdkh1ZE1FbFdOUVN5?=
 =?utf-8?B?eTNCWHFDdjhXeS9NUUlCZzRYSkptOEk1eUJab0FtaW9KWldhbDhxcXVmemtP?=
 =?utf-8?B?LzJiTDU4Mkt3R0xMY3pRYVBlc3RJSGNJVEU1aTFJQmdJTkc0Mk9HSFhGb2sw?=
 =?utf-8?B?eTY1bzc5ODZWbVlUQ3Bpbmt4T3g1QlRiOGdoNVZtcUNUUDFObXM4aGtOcjdj?=
 =?utf-8?B?S0lFTUhQbTN5Z1F4cjVPL1ZhcTlDVWtub2hFb2pudS9DandvemU4VEtOV2Jt?=
 =?utf-8?B?UzZvZGw1aG1qK1JGbXpkWkhRSE9TY2NpbjZ4QjJGMldYbDd2ckxURGlaTEVh?=
 =?utf-8?B?N2huRmJsSGRiQW1zcVc5Skgzd1lYbVVZUGorZ09CTDdnUW0zVUQ4UmR1N2o5?=
 =?utf-8?B?bGlsSXN3eDRRcHRuVysxemJyYU1FWlNTV09HRXZMTElmeHNGNllYb01KVllI?=
 =?utf-8?B?eHhMWnFaQW9VanZDTEQzcFJhOGpMZGJ4dDVOUWxLUnBGSDZ1TE9iY1dyMXlo?=
 =?utf-8?B?ZmxVQXNlWDFWL1RiL0kxdFFLQzNkaElPMVgwNkFBeWxteUhwUjlxbjQxcE9K?=
 =?utf-8?B?QWZiMmpaUjhjK05Rb0MvYjA1WGkzRHpMc1FiNkpUSzR4VE10UGZPQVpJalg0?=
 =?utf-8?B?ejJmMDZTOU9DdktkN0dZWkh5SWRGM3JFVXQxYXVSRmNQQlRKTGFWU0RnWVBI?=
 =?utf-8?B?am1XRW5Kc2UzSU5EL1NPSWdUeldFdmswYUlSWnRuR3c1Nm85eTJvZGMvWnRQ?=
 =?utf-8?B?QjFVL2xrdHVaUHl5d2diTjRxQVcrWHpWK3lyYzFYQm81NmhraU5ZYnNjT2Va?=
 =?utf-8?B?bjNqanhvc2w0K0tJejRhYnN4dWtxN05ObXNQVEVkakdmT1RlS1RDWVh4L1dY?=
 =?utf-8?B?UzBQZE9aU0p2a2lmS2hwWkF1RTZVZnVZbytEa1dMSjNkd0ZialF5MUNsSjl3?=
 =?utf-8?B?Yk50RlRabUtyd2lCMkxnZXQwUU1OcnFETFUwMjdVZEk3WkF1enBRbTBpNHRa?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VYq5x7TgjBK06phQ9Irs2aHFObVEH+EZg61GKPi04PpWfziUo0aaaf9Z7xnEqZxFZNN2YZVB/olC83biU7LONFW01e5ro38Eotk4wQgRRhGyICK1NFrvEsZTd5rR3/s2U00tCR9SGmMLy9K30PuL7kP7AqSWzsBUW+BzdHkTtWfi1tuUzMNTDVepm+zFV9Q/K+MoBtHlbcM5YsUSRtQHhhiDfkW1Fw02eT0rvCysVl3N3wh/FegSwLOjHEcCWmifAK7zT8ygFFYa7wLqa3hBNYnNs/xZS5JM9OoX4AA0OM6cwp3puJjLn0rzupRgHOXPq6n2xeV7bFKdYRC/f8aPQz4N+6fBJEWcdHT5/d0cdDLZKUuI3N9/9VuFq1jxuphbv5MpPUeruVPvkAuaIOf4EIAkHizKrnVpML2qcwrjzpgE62YxgMDPBLPI1YPdsGHua1r1VhwsAwV609+Vp2dHohalvw28qHsRLCEKODDAvjDFcHQKu7Y9UwhihJ5iTAwWxXw/vWecCyomToS8Ury7FsvPwnkbbhm8ViBRJyQJBh8vr9rVDBZxWhadF2b+DHQhhlYgTKnzBlFEpbYr/Uk0kBNnF+uNASCCKMeViCoir2M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a20305-8d5a-430d-ef1e-08dd79b59774
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 11:31:39.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CUbc4Oe6LJrs2jSVCmjrCg5GQd9O8mrJiHE7x1oldMiZPRavirHvpzBlMcS+iNje1+j9h1yxdwtJK6cqL0OudB7305UUtQKuZedbo02vdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4580
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504120085
X-Proofpoint-GUID: quEg9KkogVJWkbhcJE3guiOl9a3Gftjt
X-Proofpoint-ORIG-GUID: quEg9KkogVJWkbhcJE3guiOl9a3Gftjt



On 12-04-2025 12:28, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work propertly, also has one reset line from hardware persepective.

typo in commit message
propertly -> properly
persepective -> perspective

> 
> Signed-off-by: Yixun Lan<dlan@gentoo.org>
> ---
>   .../bindings/pinctrl/spacemit,k1-pinctrl.yaml


Thanks,
Alok

