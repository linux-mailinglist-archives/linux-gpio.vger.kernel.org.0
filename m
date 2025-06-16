Return-Path: <linux-gpio+bounces-21629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1FADA91E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BD647A357F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C98E1C861D;
	Mon, 16 Jun 2025 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xNcCVW3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD83208;
	Mon, 16 Jun 2025 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058332; cv=fail; b=GJXaXBmQa5d83RGngkwrZzhtYfgi6RZm66SEEpfYZz1AWlqv8MzTFSGDamKmpkhtnZYIskjJY6/9sTcUmlHPYq7Mpa2KN9n6ffF0aQXVttoPYfZDHDD/0O4Oc9tvU+GE/MxwM6UcwCdZuxYB2JSrUFRhuzUaUIMEbeC3HTM9S5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058332; c=relaxed/simple;
	bh=n0rGRpaedVz5jBWkO6e8OFgMABHv5RJ5aJbe/Vu+K74=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ss7K9Q1Bk/mGRbdGHpgzGcTTmRIWnx9aCjOZeTliunr66jhthzWo9lHeAoHURHExl1AzcTgiPYgbWm2bDrNBgtYAC7BEXQU9btal5uo4qjqy97KoYT20X5hcpCah2i4G0STeXBGQqB+89cSqEyXn3zJTvZ7wENJEyVO19YCWnIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xNcCVW3Q; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn2MAgBg1arZLpJdOdBi0L52QISUHRw4Wd75rQ191NyL6SO2EMQBRDRN0rgyS42YGTuBMq7NeYbnguqxgARfd2VxmfBVUaZRfqCe68PAjC3toJkn3HqAcCG4K1RYBB69vaVcnRkn9e2LjmhpZqPY+Kt85MGYeABIwJS1LmT58bsP6R/jSIRcX5dIdWQqfWUoGadaGt9NrV4eLV4Xm8E6oH4ucJD3YCfPzmXwYYQP5DwUZlXmK8DzylaADub0n5osT/qdmKNh7KgFhvv+Whi8A4yyn+LTkqxU6mzK1NW0d/wnIYtB9iakdX98a/OkvdoiUhFNDkic1y9g9WByv805pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9IBv9EkHpPPgzxBpmQ3yBorMaNXV3N0Qc9oaUWd1BI=;
 b=R3fGbqiHpWF6U4laYp5Q9ruuBFN/EwK+7DmzHmyGXPaUbKsdfz9OCqoT0IrVUqM8JugqAUNHKdi3G/AdoIO5CUEpZYL7dlebuo3s8mFLkhQcEEiGVlIC33JwUT5HLYFZlR1tm3+DrvC22PPqKrS8IMIDc6KE1YOqYuIXRa00BDGoCsw9pXOWYhjOZMxrtPr0t1A6Xr+/1PG3ALV4lg/0rwZsx9cqpk2uG7gUOsOG0yaqqvs+H8dJroN7cJsAUvZIVeX609i3CAxg17VMY8tsHVc4Z7M4W9FRzXcXkE0KfZY3Miikbonr8ZnPMPyZXKMzKTbdcx5vPhdSQ0+vuMhtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9IBv9EkHpPPgzxBpmQ3yBorMaNXV3N0Qc9oaUWd1BI=;
 b=xNcCVW3Qj+WuYuYV/rLzyko68M3zYzQmzMPgkVYMt2jtGdQ2VaS3krv7g0L4nGX/Tze4aWQ89/Iznzk8PZF5jtj8B2r36UWqP71xPizgYAxUzSKs5toLBUUAeNvbkF/uPWwd1dpAZEW+fBJDVqofZmTtmfteJQEW6vIUM8jV5Uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CY8PR12MB8195.namprd12.prod.outlook.com (2603:10b6:930:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:18:47 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:18:47 +0000
Message-ID: <ccec896b-d639-40f5-8c5b-3527caf17d0c@amd.com>
Date: Mon, 16 Jun 2025 09:18:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: gpio-xilinx: Mark clocks as
 required property
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <8407ef56b11632c1a7abfce8a4534ed8a8ed56cc.1749809570.git.michal.simek@amd.com>
 <cbde9b9e2b0f9d12fdd1ba24fddb1543159357aa.1749809570.git.michal.simek@amd.com>
 <2fb10aee-6610-43f4-9d12-88a97e0f66e5@kernel.org>
 <9dc04095-e397-4a51-a75c-8a5577be197e@amd.com>
 <1fced39f-1077-4af7-9294-affb99860984@kernel.org>
 <765a606b-3b87-4a08-8630-69a3c52ed138@amd.com>
 <1dfb2bbc-4ad5-454c-b046-b721500fbb91@kernel.org>
 <8c5ac938-6e58-4ff3-bc0c-d639b0c9ac14@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <8c5ac938-6e58-4ff3-bc0c-d639b0c9ac14@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0311.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::8) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CY8PR12MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 3980f124-86ee-47a7-2418-08ddaca60930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0NPbXQvRU5MT0lOMHgyK2dOVi80VXl6enRKVm4xOGhqWVFSeXJxNy9CSFNM?=
 =?utf-8?B?YU91bFd5cG81MVFjV0FHb25rNmRSSzdjSGlQT05pWjZsNERIaXE4SXcrcDRC?=
 =?utf-8?B?Syt5Z0pqOFhwd0gzWkRoT3kxSzZxUnhDbEFzRTdtVWRnUlRuUWpzcFJoM1Vq?=
 =?utf-8?B?VmgxdzBZZVJQR1J3akdYTTFGZmtDT2o3RXcyWkx2bkpNSlFrQ1lzTGk5OC85?=
 =?utf-8?B?dnQ4WmlienhTeDNURU9pTXZyd0l5TnBjalJKUkVjNnh4b0RsaEVjRzJqMng1?=
 =?utf-8?B?a3RXNVJZTnl2bDRQekdhQVJLUnU2QmxaVXNMUUtUUUVCZytncDRFQjNlSVNB?=
 =?utf-8?B?STYxeWdTbHZkWmtuT25ERHJoVjZzbVpWNkF0Q0w3aXovUXdVZ3I3Q0FqNWV5?=
 =?utf-8?B?UW5makd2N3dqankwZE5wUlNCWXhJdERqY1MwSzdqUlVrdjBsRkN1U2ZFem5R?=
 =?utf-8?B?L0VvS3IvUTNTZGU0cnI0ZlNwLzltNGNHeXNDTGxXd1p1dm9uV29ZYzdGWnhr?=
 =?utf-8?B?RFlxMzlpS3ltVlpQYXdEZ1pXMnFSZVdTbmJmejdCVHRpM2xPMEVIaGErdm1T?=
 =?utf-8?B?UC9SdXpaSmhtZFpmTks5cVBiSDRUY1JRRDZ1eVRqR2hsUXllTk4raHhhTHJD?=
 =?utf-8?B?c2RGN2tYZ09PT1lVaUpkWTFCdHRBZ2ZxTXBIQ0pFTCtmQ1YzQ3lDKy9wcldh?=
 =?utf-8?B?ZE5qVkNaT0VnTFJmV0lGNngyTUJQV0ZVZ1k0Y3VZMFVnS3RuaC9yaEQ2MFd5?=
 =?utf-8?B?NW9RbWFwQklnUkNwengzUnJlb0E4OE5EbmlSbFhBZ0N5NWFaTHdnUFlEK2Vh?=
 =?utf-8?B?bFdxWXBod0pySlo1UklUaUpoUEFsaEhkKytlVTVBUENoek9wWDN6TmdDWi9W?=
 =?utf-8?B?amZjK0pUdGNaZUk0bDlCNFg2YkxqcFBLVjN0Y3JvcXJaTytJd3JGZG5NbGRP?=
 =?utf-8?B?WmFLVVc2MytIbTZ4eUp5Ky9abENqWWdLS1FLTkpCVTZ0enJacjZQTnp1Tk1D?=
 =?utf-8?B?TW9xMERFTDlCU2RCNVRHdGcyejBFSGVKVkltZ0RDTWEvOUVxZ2VBMWJ0YTlK?=
 =?utf-8?B?V0ViTE0yS2gwL2Fhb3dxV2VQRzlYRVdIQkw4eFRXSE5YU01BZjNwK0FySUwx?=
 =?utf-8?B?Qk5QZ1gzOVVRczd3SmYvUDFRajFjMUNoejlGejIyNmxxWHdPajYwaFdpVmRk?=
 =?utf-8?B?RUlwQUFwTkJnNVd1QXNkdWlRNlZMd2g5TFF6VzVqZi9qZWdUdXNLYTFPQmcy?=
 =?utf-8?B?YVJpWjJBdmVVZ2RBUWcrQmI5bkVudytjY0l6cHJ2Q1dGU1dFdlU2QXJKUUlo?=
 =?utf-8?B?MEpLTU40c09uNXVSSHFnWjZhenZRUjhjbkhoRDJaVXdBblo5VXhNeW5NZjNu?=
 =?utf-8?B?UHQzdjJHK0hwMFlCU2lqM0ROeTRramE5MFJHSlNyTkJRanpLSjlNZzF4Tmhl?=
 =?utf-8?B?U0M4a1AweGxuc2txdGlJNFAySVZlUDFLNjc3ajlyUVZQU3Vydkl3SXh4TTBa?=
 =?utf-8?B?QjAybVRZc1hYUm5MaHdvQWZEd3gzNzNWZ043MGYvazVDY01GY3lLUXF2cGt5?=
 =?utf-8?B?d2xMMTJickdneGFtTzM0cFJiR1RhK2NKMTZMY3Vnd2tZdk1wSzFXbEpiRm1R?=
 =?utf-8?B?UmdPcUhXMkhBcTN4aWxmV1RjbGxlWDFxT1ZyR2xaVW9qUktkNDJBOXo0ays1?=
 =?utf-8?B?YzJQV3o5eHErbVFVYlp0ZmkvM3FEMG85K3VHcUZiZFRFSFh5QnZGTDk4THYr?=
 =?utf-8?B?b3ZEM2lTcmpjS1lsY0xuOTZkUUNxbGpsRzZTcGNCM0dnSExIU05hWStFdm1m?=
 =?utf-8?B?MnlVaVp5WmcyZ0hJcGVsMGtmTGc5ZWc4STlxR2xWK0VQZmF2ZXFQS0FKem5R?=
 =?utf-8?B?WXhFK05rR29KcW8zTWQyR01OVllvQmJYaHNMRVRNazFIN0dWeFhreWlwcWh3?=
 =?utf-8?Q?IsUcuIKjGQs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzV0d1pZNUZ0d1pzUmo1ZzVDeTR3ajNMc3pMRlRPOVNiMnMzWWM0MDROTlpK?=
 =?utf-8?B?LzhmNXRnZjBjRkxlSE5NQ1ZUN0IvbW9rZlZkcW9QZzlnb3phUXl4RjQ3ZnVS?=
 =?utf-8?B?K3NMMTJzMDdzNGhSNnBQYkYwckQ3aXVpMFgxOGNobXRtdm9qcGVFNGt0RVRi?=
 =?utf-8?B?N1FVNmw1bzhyUGlLSHYrOEJOLzdVNCtKY2p1d3kzMENleGFDMVo1MVhQamhF?=
 =?utf-8?B?QnVObjQvaFJ2aEFVOXUwZldHcUdrM0VrL1ZjdXhYT1FPTldQTTJBNitZSGpz?=
 =?utf-8?B?RGdLNkdaR1UxWE01WTBhWHJmbHR3L0dzNE8zM2E3bVNBZ2RYMXoxQkNReTBG?=
 =?utf-8?B?V0tVdXAvbFAxN2prN3lpSFpLbEhBWU1admpEVjZaS2lHMzFKcURBbWVIRUJl?=
 =?utf-8?B?MjBKSmNUbUhydWUydVFscXN2WmxKOStRYlI1anBiVHdoU1lvN1d4NlE0WGR4?=
 =?utf-8?B?OVlaTlpwc0tERDNQa0hnQjdybFVIRmx0Y2ViL0R2SWdrNmtuRTcvRjR1dS95?=
 =?utf-8?B?TGdqMW9qZWdiMXZoZm1jWnhmdHdqNUlGeEJHN29Edm9FN0lDbjZMOXlLUDRU?=
 =?utf-8?B?bTNJNmYrWEVWbDhDejFKeHZEcHNrZEl0eDB1WHZ0Wmtpc3ppSkxscFI1TTZP?=
 =?utf-8?B?aS9HMWJZWHBBSENKSHYxNkh2TmpwNXBoNi91ZDU5MXBLcmlXTnJBeXhNaFZX?=
 =?utf-8?B?NWhpYWFqZ25FYkN0SUFld0VpL2NpK2t4d3NjVHlua3J5K3VZUkxlY2F2eFg0?=
 =?utf-8?B?Ni9pQWFoUCtxNGg4a2M2MkhFcHBnVDNtaGFRS1MrOGZzSmFRa25pUDEvTnk2?=
 =?utf-8?B?enFVQ2JOV2dHdnNTYXlpeUVlT2lkMnZKRk01a2xwanNQbHlWNERMZzVhRnNP?=
 =?utf-8?B?L1RjaU1HM3VUSnluZ2hveGdGdU1HZDFzajloRzQraitwWWpIRnp3S01GMS96?=
 =?utf-8?B?N243dnY3ZDMxN3IxNlVlQmUrU0kxU3B0OEJvUFh5SmEwdzBXMHVZUm9uOTlO?=
 =?utf-8?B?OEdsWll6Z2NGTm5raFBWUUJqL2ZsZkw1bU9jZ1FnbFMyeExPaG1JMVp1UDZL?=
 =?utf-8?B?QzBKbG5qa1NHTDhSSlRLS1JDdWROY3QxZ3V0MW5wbVFpb2lQQzVHSDRBUTRp?=
 =?utf-8?B?YWFzVllsQU43eFdQSHZGZU5aT0dOWFNnTFBOTzR3aFhscWdsNkc3c0ZhS2hT?=
 =?utf-8?B?M3Q1YWh3emdHMXVPdmR1VFA0TEpRditTNVBUNk00QUZCNkY0T3BtK1lVM3Zi?=
 =?utf-8?B?dDlWd2VpVlN6b1dqdklIL2JvZm1EaHFqSmtlekF0dmE1LzY5RVlCaXVxMDUx?=
 =?utf-8?B?Tk1PRi9TSi8vbGMyWnUrT21Ea1J4eHFjdDU4NWdXb3lGSHNVTHhjZlRkd3l5?=
 =?utf-8?B?MkpzOHRxQSt4WHpVSnRpalBqN0tCWEJCcTJ0TjBaWGdlVjBnM1RSMUtwb2tO?=
 =?utf-8?B?b1NtVnNPUUJ5cldROUJPYzJTTEwzcE8rSHYxYThQMWlIMGtVVjFNT29wM1k0?=
 =?utf-8?B?aTdLa053YUlmOTRzU3JEWCtOZ3RNMHdsRXIxYU02aFlZYk1wSEZocVRVV0hB?=
 =?utf-8?B?MlZmRC9XUEVhczN4MXhMbk14ZGg4R3hjSHBEb3p4Tk95S3lRK0lKMlM4NGda?=
 =?utf-8?B?dWVmWlpwWEpDY0svNk9zbElSN1lnSkhJd3d1QTNnSnc0cFhyL0Jqa0NYL2xz?=
 =?utf-8?B?YWJ6Qjd5NzZKV1lYT2wrSXRUakNrWml4ZkxTcFZJdkhKYnZBNEFxRmR3TGNM?=
 =?utf-8?B?eWhmcHRTN28rbVdBZ2dmRzhnQkxCYzdEczBMYUlPbWlQTkFibUNkQVFOWURu?=
 =?utf-8?B?dFZmLzBJenpWcWs4eUI1RS84VzkrRzlwZHVWd3YvUWxUdlJyT3hhclFWRFhT?=
 =?utf-8?B?MnN2OWY3bzMzSG02SzlTZFA0dmVVNm5Tdmc4dWNYYVp5UUZZWXlyUncvdnlU?=
 =?utf-8?B?ZFREK2JTc1k5NFYreXRhamhkb0VENHdGTUFMdjNHM0FyMzVuVWtnY1JORHJH?=
 =?utf-8?B?Umo2bFQ2b3QvWWtZWUsrK1Y5RFdTUlRIaUNNRVBwL2p4WUxMZ2IxbjFjVyts?=
 =?utf-8?B?WUlCSlRjVEswYTYrMS8xZlpuZ1BndHBsUEthRU1PeGZ5OFZsWkFKQURKcXpB?=
 =?utf-8?Q?+gSWsfAFVskUjZFv3SLvRlFt0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3980f124-86ee-47a7-2418-08ddaca60930
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:18:47.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHb5t40Pwnnk6Q73gMPUsgUB9hnELyfI4US5oH29ydXgnLD9BYX0I7W8QSKgf+tg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8195



On 6/16/25 09:13, Krzysztof Kozlowski wrote:
> On 16/06/2025 09:10, Krzysztof Kozlowski wrote:
>> On 16/06/2025 08:51, Michal Simek wrote:
>>> Hi,
>>>
>>> On 6/16/25 08:41, Krzysztof Kozlowski wrote:
>>>> On 13/06/2025 13:26, Michal Simek wrote:
>>>>>>> Based on discussion at
>>>>>>> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
>>>>>>>
>>>>>>> Actually this shouldn't be only targetting GPIO but also for example
>>>>>>> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
>>>>>>> before starting to check other bindings.
>>>>>>
>>>>>> IIUC, patch #1 is a prerequisite, so you need to squash them. Otherwise
>>>>>> dt_binding_check is not bisectable and we want it to be bisectable.
>>>>>
>>>>> No issue with squash if necessary. I sent it as series to be applied together
>>>>> which won't break bisectability of tree and no new error is going to be reported.
>>>>
>>>> You did not say anything about dependencies and merging strategy, to
>>>> this would go via different trees. Sending something in one patchset
>>>> does not mean that there is a dependency.
>>>
>>> No offense but I don't think I can agree with this. The main purpose of patchset
>>> is to show sequence how things should go one after each other and series should
>>> go via single tree.
>>
>> Go through all patchsets on DT list touching different subsystems. You
>> will find only 1% of patchsets having above expectation implied (when
>> not explicitly stated).
>>
>> Really. 99% of patchsets on DT list targeting different subsytems, have
>> opposite, so implied rule they go INDEPENDENTLY to separate subsystems.
>>
>> And above (so implied rule of splitting things) is even documented in DT
>> submitting patches.
>>
> One more thought: That was from submitter point of view. But from
> maintainers point of view, EVERY MONTH there is around one patchset on
> DT list which has implied merging like you described (but not explicitly
> stated) and MAINTAINERS pick them up independently causing breaks, so
> some or many MAINTAINERS also have such reasoning as I said.
> 
> They will pick up individual bits from patchset unless told otherwise.

What do you want me to do?

Thanks,
Michal


