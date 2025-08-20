Return-Path: <linux-gpio+bounces-24605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884EB2D58D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 10:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3853BAC6B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 08:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3BA25DB1C;
	Wed, 20 Aug 2025 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lEhA6NH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B2E1F3BB5;
	Wed, 20 Aug 2025 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755676963; cv=fail; b=ErxbCH9TagFMvLA7Ar3hE6ze9DMaA9iWanBQBlcInY/K/y3N/8UvnPdy/zsH/dSMuqxEMy8krf5twPDQjpE1xkBU2PXpSEBC44hXoDF6aCKsMdfVMkxCFz0lLCA2oAeFgSBi7lo+qwIWSPoxaC7mCD2a9AgMQTg+0Ww4u4L1Biw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755676963; c=relaxed/simple;
	bh=e14cd/kisI1sAfVXcQOf1EhDVcaB4KJGTDOrpk+7NEY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f1usKB+1aD6yAaEOR8u3kWuIS3f02Hw3V1X9hc65Yrp5y6aEd92j84QUPRUtTza0+KOxR9hTYJV+UuDbXLQL0N4wWnqMDH3V5RtxzBPU8OYkitBm+5KzVGTk0oZ6tsg3oIkcXPJqQKA/xMPXTZC6hwmfNkimsAqs+ilo84cQsoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lEhA6NH0; arc=fail smtp.client-ip=40.107.237.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnja3ktqYBSgxmW64l6H/yRsclDhfPCforsmjAn0BXJyeK6vs4eHZQudBeJ+ggGFQHjEDvF4TlRaH/7/NS3xvDaVXtaHVc8wpSd5OXADSBR3YaadwtWO/5iUhxLuyJKlQC6EzHFtK5n4uUo5qc36Whnqt8tJj2lkWm0hD37RHNqguPx55Wx0+arQdEltVEtqeS+y776PyeJMR8acy0fG8TPaFenFl9t1eG32wrAXvWGbnR2JGYETKhA9zwkWYIeZcqlfcVaPJIaFTxwWaVgDBDD+qYNd90IIFKAw5i2WQPZX7Dq66lH7+jETHuog1OUr0nShj2TL3PddYizRdxMJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SrQWprL6HtwpC8+kWCz07kzgemiKsQP/wQRrHBReyc=;
 b=l/oXio4dyxu+HxkSGY2jdjheBFaVako+KW0Um029377SjEY66raJYZhjZu0/8zyT6mKoxKMkSmaW3ikj0wY4YthkIfGuXjo3Cz2uKm7crXhl3/SUfoW5hCqKz8jmkciCM0iYVV6xNa/5/PKhJ0Kz+k1PfrCpK0HQnzo/SSxdL7MZ3vxMvQsK71TkSgOVhnPzl66gmqzJ6i+hWEkp23zQ2B/3juqGXcMIHdDu2jpDzHICjvR3c0Ip3aN9EyDMJxcRkTzg30ZWxgO4Ooz/E1dFVP3sRzAzSQJiVVWtMSEBbatGoMhGEBN2QCe6ILfx5VbPCYy2z+Z5cS0esLuHkFUtlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SrQWprL6HtwpC8+kWCz07kzgemiKsQP/wQRrHBReyc=;
 b=lEhA6NH09J7LybTc4Y9e8+CTVI79jFrcsR/iSt/woY4MY1BohZ9wgh7q2hrEpH7sVBUGGYRIIixn73uGgfu7xDs1ed7ZJYcYtRTe1o7pS4Cx/gTr+Psnrae9e0FvrOtj59KQZs8YqilAg/NMp2t10tRhEj5aofc3ugHl5V3sXIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DS0PR12MB8200.namprd12.prod.outlook.com (2603:10b6:8:f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 08:02:38 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 08:02:38 +0000
Message-ID: <12eecfdd-5ce0-4893-ac1e-5d0ce53e4f98@amd.com>
Date: Wed, 20 Aug 2025 10:02:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: pinctrl-zynqmp: use kcalloc() instead of
 kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
 <20250819143935.372084-3-rongqianfeng@vivo.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250819143935.372084-3-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::22) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DS0PR12MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b2e878-e30e-40a6-a535-08dddfbfee43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFlDUlA3c3kwR3prb3dTUkFIVU5vK1JzMXNQaFZRYnVFR1VSaTBUdEljcmRQ?=
 =?utf-8?B?WjliV0QvWWE0WDB6eVk0cjdRWHlWeEdzNE9veWV1dUU4UG5pRUVrZnFXZHdV?=
 =?utf-8?B?V0ljdGc3cVFzeVpaZDE5SW5kTEdWd0pQOWMySkRTcmg1cE50YkUzcnpSbE9n?=
 =?utf-8?B?UElqV3ZsNUV1YVVYUlVYR3MwMWs5YmJORlE1OGpSQWgzb0FDMXBBV2hrVE11?=
 =?utf-8?B?TlBaNEFyeUJmL1RTMzVxYkJDSmFHaDI1VzI5bjJXSHNseGdYaWYwcUsyblBp?=
 =?utf-8?B?UGFoNGl6RmZFOTJBYlBmb2Z3WURoa2c0dWtLZVV3cE5ycHhlUjNSZ2Y0bmFp?=
 =?utf-8?B?L0x2MHA4N2lsSzFUWXdQRUduK0FPYVZMdUdhZ1Y4SlIydlRsSmlQL1hXUjFH?=
 =?utf-8?B?M1Y4RUgrZC9HNDlJNXNZVlZ6eEIzSmdYVS9FYmJBdHdxUlBjQ3ZNNlVDNFl3?=
 =?utf-8?B?ZmdNZ2dxR0NabklndGVJb2tTUzZ5alZJUnIvMTBnSWZXeWNjRG1EbmxLRUpK?=
 =?utf-8?B?ZUhJeTduSTgyM1BVejdjMkxvaVJnb2RwNHA4K2x6VVFDbExxd21qMk85dUxv?=
 =?utf-8?B?L2hsRFR2TDU1YytXeXVURTB4RHZIWCtVRGdqd08wY01CNldjYzBxRnRRV1FH?=
 =?utf-8?B?eWU5bXVrRlVoTWhTWWlIK0tUaE1HNzZrN1lXRTZXejFwdnMwRkxKZ2dVOW1B?=
 =?utf-8?B?S3hEajNHbGtDcFdXZUNIZGh2bUkvQWhnSFM0RXk3eUlONFM0MEd4UzErQTNx?=
 =?utf-8?B?SkFtZnFpMFRHdzV4ams5WUNSVTV6YjhYMEtOL25iRk9lWEFJNDNhQlV0U1ha?=
 =?utf-8?B?YXQ4bFVnMzZEY1c1bWFta282M0diN2ZlMFpoRXhnbmJmODU5YmM3MjNsK0RD?=
 =?utf-8?B?SFY3YXVLYVdBZVZKQXBHWFEyUzU2Q2c0c3MxaVg1UnFjRFJSa25uVSt2UWo3?=
 =?utf-8?B?R3VBbGVDeS8xNDhYMUxhWUlBSFNrZ0JFOWFZcTJiWEpYWlNpL3pTb29iS3RC?=
 =?utf-8?B?QTRianVLdUFUSkNlYzBDK1ZqMndlMU96N1ZHK3hPeUQrdkx2dHM3R2dsVDdX?=
 =?utf-8?B?Vk1icmhQclVLWjl5UjNpTUJ0MWVHVmVyU1RWbUluVURRdERiR1Zld3RjTXBv?=
 =?utf-8?B?UU1sa0VtMXNBZzR6TnlPS3hMOVFPdytvc0hxOWd5RjB3Z0xOU0RncDg1bG00?=
 =?utf-8?B?Skl5TFNZYzNqcW5JaDJ5M2RUNzFKdTVSRXdJQWFlbVRjRzgzcktCMmdxUCsx?=
 =?utf-8?B?S1V4YVFFdmdibW50QThFV2FQdDNaVTk1WFVRNzk3WGNraERneTNHOHp3T09q?=
 =?utf-8?B?TlJOa2JVZFo3UzF2OHgyY1hoQXppcU5DMzQrYjBXekplWFo0ZUJKbDAwSG9p?=
 =?utf-8?B?V1YrUG53UTZYbmdtL1pLbWZQRjI2RjgwSjExcHdaeXVZcG5zYjdJdkFsRE44?=
 =?utf-8?B?RmJrRW5JOVdmcm50bGI5MEdocXF1RGJKeGhmVGZ3QU1UR3dWb2dnSWlYMS9v?=
 =?utf-8?B?eVhMbnBackF5d3RzMUNFdmk5KzJlUGFmTWI5SkZYRnpya1RQSFIzNmJLc3h0?=
 =?utf-8?B?Zm5qN0h3T2g0SkF5WTJSTTJnekt4L24wRWY4Yjd1bS9HaUxheEpOUmJaVmdo?=
 =?utf-8?B?NW9CeHAyN2I3bzRBVVkvSGxTNUtJKytGOVYzc3NmUy9vVkJyK3VmVXgvK3lt?=
 =?utf-8?B?L3hoRCtSd1IvbFU1UFdWUXFWNVlYVlhCMEM1UHJFZG4zYkNuSmJua2E0UHhk?=
 =?utf-8?B?dzRUN211ejBIcFBpRThyMXBMdkJjSzY1N2xudGhsSFlNQVQrMEUraXhmN0JD?=
 =?utf-8?B?YTJjQk95UnFFZXRyUFNhd29rTlN0d2ZzSGRvZ1F1ejVGaW44MG5vUlhzcmVr?=
 =?utf-8?B?QlN3aUk0aTllZUMvQnR2TmNlaUh0WmhydEZ5ZTZWbkdlSzZZM0JadXZlSnpO?=
 =?utf-8?Q?ajtjPo4K5PM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEVSSy93NTlDZExrdHprTnZCZXlyclpGOG5JMDZxenB0dzNicmtGTVIyUHdq?=
 =?utf-8?B?WnpHbWtBWkdGb2crSzV1MENHbExRZm0yTWw0QVJRc2RZOExHYSsydVpBZmFr?=
 =?utf-8?B?TGdvR2NrTVZlaTlnVzJPZHZUbWxyQVFvQzk2dkxSeVByMnNoNGkvT1pESWd5?=
 =?utf-8?B?S1FoUjFWYmhTR2Nic09zVzR6K3c5RzJHRW5TdlAvNkgxQzVHN1l6YjhhRkVt?=
 =?utf-8?B?cWU1VzdTK1R5eWFwUWlyMnJJR0xNK04vVkJLQUxUVHhEMlo2TFJNRjhuYlBM?=
 =?utf-8?B?d3cxUFljUjN2dEcyV2VqcXE3dkpFTVRDSGdEbGYrWGl4Z0hOTEh2T3A5bDUw?=
 =?utf-8?B?cndybVhPTmM4RURkZmlIWXJGeHEzOWFjTm04WjF5eG5iaVRpRjAyaktuYWtU?=
 =?utf-8?B?ZTh5d1JHVEdXTGJ6Q0d4SnhXdkRGV0JUVGpNejU2RkkraUJPUkRVSmsybmdv?=
 =?utf-8?B?aERBWWZ2NVBDYTNUdENnVjVhSzlzdHhUUHFlQStkNHhTOXhSVWxQanNxaUpB?=
 =?utf-8?B?bTE0QUNuZ2F6MDAxeW1uVi9NRG83Zy9qREprcENkN1E0Qy9idUkzOTJxRGRi?=
 =?utf-8?B?Z0ttd0FkQ3JxcmgzUXhhNDY5TkdWN25BbWxuY1V2b2o0ZGR3cGhOWVRpNkdk?=
 =?utf-8?B?NndBNDRRQlAvZlJjajRrY0dFa2ZhT1k5Tm5TSTVmQzBHNWQrWktWYlErcGlt?=
 =?utf-8?B?aGFuMGlmSTliQWR4dlNTRUdTSUNENGV0eUF2M2I3MzZnL2JYQVc5US9veWFN?=
 =?utf-8?B?ZWxiay9OOFJWVFRvamQ2WjNaQzdEeklCVHFDT1hyU2xNL2o3dHZrclNSblJD?=
 =?utf-8?B?S0tKb05ybjZxYWFCOXBWbnFYVlI0VE11RTdmeFhWOEozYXJmUXU1a1FHTVRq?=
 =?utf-8?B?OTFMV28zM0pMMGVnWHpaalAwMXJMMjZvbHFURUFHZVFidzBxYTNzWTdxZnZu?=
 =?utf-8?B?SEN4L2MvdWVvTFM5YzRzdFdpUXIxcEtMaUc0R3RUaVdkRTVyOXRoVzZ0Q2Fm?=
 =?utf-8?B?NUk1T0xwcG82UU1yeE9DQUZ2VTlYVkNzRGFSbmZTaVJxc3ZsblhYN3dSRXFz?=
 =?utf-8?B?OFgwMWtENXJsVjV3VDBrcnMrT0dFSGVqK3NkRWVrOFc2UnlXV2pKbldndDBt?=
 =?utf-8?B?QVdQZWZhRGdHQTZNSG1FZ09EMHNYU0swbFd1bmZsRHdkV0RhOVhTY25lemVL?=
 =?utf-8?B?NXpNOXViSWZTR2dSWnBMSUJJZ1dWbWsvaWdkQ0xhcThnMWNGeXJ5Ung3Q0pn?=
 =?utf-8?B?RFo5Skd4ZHFjTk4ydkxmczFJalFsV0J6ZEo4SGdzamNTRm10V0JnVjRLTUdh?=
 =?utf-8?B?bDVjbWEreklDN2l3SklsZjNmQ1FKNG42SnhqL2N4a2tVNzFqdUkxb1NqVjdL?=
 =?utf-8?B?NWJDTnNUdHhRYmZhYXpLNlFiMldYTGVVM21sV1Q2ZXJRTjVjdjlJZ3hxOGRM?=
 =?utf-8?B?WUIrS0VZSFM0RFZVdnh2dEgvSFBrSXBHVU5VSlRNZTRRMUZmMnJSTDFrWlFC?=
 =?utf-8?B?cnRGZmNXcGN3cE9uYXFlZCs0c1RkVDZtc1RiS0RIWEtSY3I2QmtOOHVIK0t5?=
 =?utf-8?B?V1Y5MkFmblpabjJjQ2NZdzQxc2hhK2lQb2Y1U00zMmdsZFJmancyMU1YSmh0?=
 =?utf-8?B?d1BUNzRpaUxPeUcxTGljYzI5TzN0TU5IdU5USEpTTkREeU0zOW5hYlZORVd2?=
 =?utf-8?B?SHVvbFZaVUo3a2lMRGY0NGFWZzBuUUg4dUpDOE9mLy9hLytSYlA2QWlJVWpw?=
 =?utf-8?B?eEE4ZExtWWsyak4rdGFYS1lMN2UwdzNjSkNFYkVwWmlXYmV3bTZzL1ZRYStQ?=
 =?utf-8?B?U1JEZ1JlRkdyb2dXNDVjYy9sNFJBY3RodXZabkpDeXEyaXp3T210a0hSUzcx?=
 =?utf-8?B?bUd6cmprQURpa0Nkc0hNbEVReTNiMXdpRFpJQlNVZUhXeVNmS1QxYVg2UHBB?=
 =?utf-8?B?OVZBTFRMalBqSWR3UXpPVWFpcCtWYktJSmNrQ0ttamVlNTJNU281cVljMEtk?=
 =?utf-8?B?aG5zM05CcjM1aGJORWJ0WGdLTENNRC8zUnpXcGp2dS9WWldheFhLMFVQYWNB?=
 =?utf-8?B?cXRpenVYMDBTYys0ZFQyNCtBS0lzbSttd3kxckVZSlNCeERPeVJIWUZCMVY3?=
 =?utf-8?Q?VVzffu45UJ935Kw2QPI32Xjxe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b2e878-e30e-40a6-a535-08dddfbfee43
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 08:02:38.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxxaTKEMnQ0waftBLgPKG5m5aiygUPCsnwPUABIfaKIeqjQfcadTnrG0nazkGF5F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8200



On 8/19/25 16:39, Qianfeng Rong wrote:
> Use devm_kcalloc() in versal_pinctrl_prepare_pin_desc() to gain built-in
> overflow protection, making memory allocation safer when calculating
> allocation size compared to explicit multiplication.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>   drivers/pinctrl/pinctrl-zynqmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index 71eaac81deb1..aba129ead04c 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -918,7 +918,7 @@ static int versal_pinctrl_prepare_pin_desc(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	pins = devm_kzalloc(dev, sizeof(*pins) * *npins, GFP_KERNEL);
> +	pins = devm_kcalloc(dev, *npins, sizeof(*pins), GFP_KERNEL);
>   	if (!pins)
>   		return -ENOMEM;
>   

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

