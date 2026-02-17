Return-Path: <linux-gpio+bounces-31765-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC58IyWUlGl3FgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31765-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:15:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB114DF5E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 509703037EE5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799B936E48F;
	Tue, 17 Feb 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K0pQGkaG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE210E3;
	Tue, 17 Feb 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344918; cv=fail; b=qy9GFAxBlCHSpD07ex1oDr7C4p9zp2Osh2hUNKWImASXMLq5VY8WN7RL/+u8zCY1rv2BKmiKbQd+frqTcdge9t0297ED77VvEXEz+6mTgW4tgkamBiux5JAiiOh20YtJIGBJQZC+rL0l7A5ugLROXThAqlixQ+XHpC5fgeifyvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344918; c=relaxed/simple;
	bh=ebqZqAh3Pwx/G9FIvvYP/XD3gPimczAES4Dfx3qyhvA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BSsFB6Ek7vV6S3cwc5Qj6T9Ft3r3tKaDY79huwxAGTuszTk7jzA0KauCF48rrIwgt6FS9DU6z4jAQyFPPDEmnc2R/vpFEqIZ8uTkj4hgXe+1Ar+uh7jCDgfRutMbZAhdo9Z4BMcW4T/UCaVXH2ymIsy7XlYmVwWYWO/DjjalRWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K0pQGkaG; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aq1XNGitXyJeSmBBOmUyZl1WGilFy8Es/1oA2sKjUlelL91gShtvLHLaHPUNH0RPMuYGqNZvFi16fqK/bpuGsbfBgJb2ztqaoH1gXYYziE0O/u1klYTY8DkoMlfveZgTilS4ykX2KkKc1fOWaFWqXp/I2fNl/COxsOdqftiE31yj87Y3hlcnzcq+3ewkeJ+SxsDuOHgEwocVCvSL1xEvk2DCWEJQI4Evi9yZ0Ehz1L9R3bjHqQcYb2u34UygkmBfFCCZzY2TbySdQq0dYDGuvX5Ute4+BqggyMLSIzVPylXZRQ1MkucUN8ORrAFVREagzLmp8bZwK0YZnclgc1bDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6FX3oUsCCWWOLPXcxfuQR6tu1NYfswpElMQSqHnbs=;
 b=R6Pksv4OW6UerWhRps2H1oECB/HLsrIAEtDaJDJG+bwAhA+6wOj+s3xwAdJlzRE7GevNzcT+H35BdOzIQnDizfSpuCOAZD6LN0diy/pOUzeljz4KvtlsfrJalTNm1UYLPwZOer6nPJQk+2Y7AthuS8OaRTYdXJxC2AJFYBOt6olCfg4vtGEMaosjqzoQK9+s2jad6phNj1JCnmWEL0v0uojJHzmkF7HAJEPJFTqyaSYlul0ZrpGVQWDMS1vf6Vk2dqeZ/MCsXOL7CKp4yh3gb6ADDMprFQx6OPSskhhNAOC3YV63h6Q9AsN9CEwDY6imX2I+dRyANU/7aNGQbNe9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6FX3oUsCCWWOLPXcxfuQR6tu1NYfswpElMQSqHnbs=;
 b=K0pQGkaGM20P+INh+AJ38a0qE92fco5mgko7L2vBjlzsYV17L8hZ4F2oxmNIB9jEJD7Co7BcfVBiU9iJPOTDToDzCpJAjM0aq02CclE6+gMHCNqH4aXuhEyglWltajuZpLGnHwQxGcwsfch9vaujQy0n/V9zAFXZGUUJylJi7snJWHPIpxN3D63sWzF0nLc2XyegQrlRtBOaxsbT7uHlaN5V7ZahoHvtyDISSVyE3Fwm6C9BQ7VrIgP2F6Op1Hex0zyv4XV9UMDfvXlZ7/GQ9EBhid+yF4swL1u5/+JacE3rKkjeMcsy+xhOVdJA1HpzXfiBCm3Za7AQxshVFlX7MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB6743.namprd12.prod.outlook.com (2603:10b6:806:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:15:13 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:15:13 +0000
Message-ID: <8907b3dd-058b-4c28-957f-9948f23b9c1e@nvidia.com>
Date: Tue, 17 Feb 2026 16:15:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
 <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <a97f726e-58f0-4cdc-8e4c-a11c1e1c76ef@nvidia.com>
 <aZSRfzXNnzzc9MiL@shell.armlinux.org.uk>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <aZSRfzXNnzzc9MiL@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bad433f-e0b8-4e05-9e7f-08de6e3fbaf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SE1XdEtRM1JKZm5CWDA1VUI5bzZpRXhHWUxLeERROXJtSk0yM0h2ZTZKRlUw?=
 =?utf-8?B?amdtdlYxZysycDdlUitGNyt6SmhtQjZ3TlFvRlhQZU1BWG5scjNJaVV4bk9D?=
 =?utf-8?B?ZFY2T25uVERkY29CTm8yOHFvenZyTnZkUk9oRmRPSnd1T094RXRHZndWVmYw?=
 =?utf-8?B?QjZWMVhZWkdEeElDeUsybzFzdURWOTFocUU5UG5vSGNyeXRZd1NrdkRTdWhu?=
 =?utf-8?B?ZTljZmNsZTE1L0NzNk02a2dCUlk3Ri9NVGx4TzV6bUtkTmRxYXE5bDZ3aEVr?=
 =?utf-8?B?RTNHUXppeEtnNTdVaW5CeDVuSTFzdm5pNnBXeDRnYVR6SzVpM0FYRlN6eXBY?=
 =?utf-8?B?Y0lKQ25NNE44OEdOWlBWVEFZdHE2YndnNlVMNmFqY1M2NkFKUldpS2lsblFY?=
 =?utf-8?B?cm9rdDlZQmJiN2xYT3hWM0RPYTVyMS9zZ2FyQWdJNnRrY1c5WUxPSU9RSXBD?=
 =?utf-8?B?Q1M2SFpxcHByc3F2V0lpWklEK0ZsNFhMWlRZSTNjcEpaUmszTWNZRWZKaG5j?=
 =?utf-8?B?cklWQ20xWGpTdlJGbXJpenRpNWV5bkwzamQ1cExkNlhNUTNTWlE4Q3VzcFRo?=
 =?utf-8?B?bGk4bUxScE5jcDIyamoxNEN0Z0ozMTNpUFNlVll4TWhtd2xXS1kvSnpncTBR?=
 =?utf-8?B?MGFaZTJOWW1pYWFIUEJUM2VvM042MC9ja094bDZldFZRam8yNkhzTzIrMTM2?=
 =?utf-8?B?NmVUdVBqK293V3lWUkg3d2wxejlwWExHQkZkUC9lTDBPZWpqSG83YTNwNWxR?=
 =?utf-8?B?U0RnaUJjMzBDTWo4MWtDbi9PUlZ1YVVONXM2eC9FaFcvTnZNa0QyYjlSYi8w?=
 =?utf-8?B?UTNJT01mTnFNSHp2SXpXemRSdmxPU2pKNU9MRm8zQUNrOVEwbFcvVFh5bUVs?=
 =?utf-8?B?UEtGN3BFNnY1TUVKakl0eTh1RnFLSGpXN3pjVnN4QTg3UHh5NDJvMFBOTU5y?=
 =?utf-8?B?R2R2QUlWQ2c0T2RUZWZWR1IzTDNoOWFsU3JmMjM4dGlReENkZGVuRlRTVkJG?=
 =?utf-8?B?Z2lsayt4SWN4YTczTDRnV3ppWDF6MW9XWnAyUWtWQThpTGJqNFQwNkg4THBl?=
 =?utf-8?B?QUhyNGhZOXplbHYzK0o1em93L2RzYURhTEVjemJXek12SjNLZTA0TEJ0NXlh?=
 =?utf-8?B?bGdLaSt4ZEZWVTQ3bUx6ZHdDK1pHS00rQ2wwaXBkYkF5ZUd0d1BjWXVVajlM?=
 =?utf-8?B?QjZJU2JSNFQyRFdjTUZYb1o4ZVVmMXYrc2ZuVEVuOFVieFROeTRiUitQVEZS?=
 =?utf-8?B?d1ZlenR4Snl4YU1aR0s4SEF4MGlPcDlLL3NZbzd6ZTZFcnJwNDNvMGhDZzN6?=
 =?utf-8?B?WmF1T3FCU2swb25sc2huckpFcFFTVEJiU250YldRTThtVThnTGZNZGdrVG5N?=
 =?utf-8?B?RXpBTDhpZU1CbzNONEVYdDRRUlprZWMrRVdvdWtkTmpvSElWQ2IrYytZWndt?=
 =?utf-8?B?ejA1VU9xUzB2UUpkUkpzMUtJZE1lN0g3czZFM0VIS3RuUFdmQ3VzditzVmlM?=
 =?utf-8?B?M3dtL2dnSno2SUw3VmlZMS8vMWExRzM1a0loM3kyWG93KzlZa255eDdZajZt?=
 =?utf-8?B?eFVSZk9nREV6eWJNSXIvZEd3YTlJUTdibThyaFdBbHdibWh0VEJPY0pPRkp0?=
 =?utf-8?B?VHRJcjhIc1RBUk5oSUN6T01aOE5oMDAvMVBpR3JBdW5yTDJaejRmNDZteUdB?=
 =?utf-8?B?Ri9wbDI4L0thSm0vSWNhQ3Q4Q2tjaTNLeHJFYWtqbStYa2t0ZStXeGYrZlZK?=
 =?utf-8?B?a251SHhIL1FxUTBqOGx2YWRlZ0ZLQnNSSER0QXk3QU1GRG1kLzJhNzc4Q3lh?=
 =?utf-8?B?aEFNYkpZL0tpSTlGTE9tODNFemIxeEZZbmFlRU8zMExEempSbERLVVhjR0tS?=
 =?utf-8?B?L25mbUJ1MXFPbFQzUDZxU3N2QlBLb2dqa3BYTjJtQmhXRzFKZ1BFQjEvNi9r?=
 =?utf-8?B?L3JxRmhwZ2g0MGc2bjM5VHZpakpzWlVnL0VGRFBDdlNINTJoc04ybmsvZ3pF?=
 =?utf-8?B?eUFUZnlEajdaaDh2K1c5TDhuNTQ1RXFPbFdPZzQrSFU1amVHUlVGL3FYVXdr?=
 =?utf-8?B?RG54MmVoOGw2blBJMlFMakdQQnZhT2VHaTV3cDBLWFptUWRxbGh3QkZkUEtP?=
 =?utf-8?Q?q2pc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnVFaHpiZmZzTmFSNGVJMTlIWVA0UkVmNjNMSnNTWld5TUd6d2RZb3JTMFF2?=
 =?utf-8?B?VzFIelpYMHpwbDhSY1ljaXFxT3NlN1BRMG1sZFdNQzdhYXZraTI1eHkvaGZN?=
 =?utf-8?B?dUtmcXJ4V1V0bG91NGVSY1dxaXI4YjZJYnBIb1Rnb2l2MHBpMWY0MnRpL0sw?=
 =?utf-8?B?RmcxWTNGVEpRMkwvYlhQa0pFV1N1SFRxQWdhL0RmUm5QS0crSUlVSDI3RVVS?=
 =?utf-8?B?VFNXMS9Md2hYcFFXakpuYUpTelMwbFl2VU1CcDNmQTJXc0tmOWR3RmxuWEkx?=
 =?utf-8?B?U3JzNkcxVW42SU1qMGlhRExGZTc0Z0RsSldRZjdmejMvQ0hnczZxblI0b3Vn?=
 =?utf-8?B?TU1oNU94azZGRm02d3lRUis2dUNxbEpkcldhZEhpYjhSQUE3WUhldmpYV0ZW?=
 =?utf-8?B?a2c3b2VhcnhLaGx2SnUxdlRqa0luN0ZsUTkrajlaWktFL1NFNkFnTGRQMDVY?=
 =?utf-8?B?cEYxYW1RQjNBSU50Z3pyMURwVW9rSG10OGFiYzcwcTZ6Rk9nWk5UY20rOXI0?=
 =?utf-8?B?YUJHUzJVN25QMytzcStIaDNicnNGcGVEMzRrdEZ4MWxWQkswVnQxbXZGMERy?=
 =?utf-8?B?aDU2NVRzbGxtMXp2N1BhYmVESTVNc3kycGkydzJXYjYwZGZwU3JSV1M5QTFV?=
 =?utf-8?B?U0VycksvZndhYnk4RkR5T2VVK2JBU2hlbnFzT3VyN28xdDZDWG4zSE4zd1lG?=
 =?utf-8?B?TkN4OGsrVld1WmpNVjFUaHAyWnFiK1p4c3VFbDRCb2NOOFd2dXplYnRWcCtL?=
 =?utf-8?B?S1dBTWxaT29KcW9TdmlyQU5XUjhVeWZFQiszOFNLcXpWM0VCelFscy9SNU9O?=
 =?utf-8?B?VGNvK3gvalU5dHdjV200NzlvYjg2Tm4zOU53WkgrYU40VmIySjNjaEJDZ0ww?=
 =?utf-8?B?SEoweUJLUXI3U1dWL1ZOQS90aFFFVXNjVnBBSEp5bkZiNWgrcjEvNStUUjZO?=
 =?utf-8?B?RlVyOTFzZTFONVBhZUIwcTdBVEtlMG1PQWFIVnIzOXNOcTZRWSswUURNMUta?=
 =?utf-8?B?Mi91a2xmWm9oU21QMFpqRVphSHFva2tvdFJrOVZ2b3NmZk1xOTBYdlhwd1g5?=
 =?utf-8?B?c3Z6ZkVSekpDekx3UWVHNG9OcmFCRzlad01xMDNVb1R3UmNSSm10d3djeW9M?=
 =?utf-8?B?cmc3SGlqcGNMSFFxdlhGU2t5ejBUWnpwcTZsbUppVkNFUzV2aTEvN29Rc0g2?=
 =?utf-8?B?T241T1RmZS9jNG80dlppRWluNjYzRGlYNjRtcE5mWTNxYjY5Z2tWSGU3NkRK?=
 =?utf-8?B?WjFYS2hQVmQ2bmQvNmxlMDBBQXYxZk0yUlg4ZDhkSDVIZzROSWdOYkFOU2Np?=
 =?utf-8?B?MERzRFl5VnV2c2lVK3I2cjBBRGNPdTFQWGQ5S1FFcjlYZFJaWHlLS3FUTjFp?=
 =?utf-8?B?RU5hU0lwdEFpMi9SRysrc012eU4zblZvL0NLTEpIdy90b0h3Y0EySlRWTGpR?=
 =?utf-8?B?Q2J0ZFhQenVNZ2t3NlZxSnR4M0xDaVVHdDlRSW55ZWIwcDh4cldNTVd5dGdJ?=
 =?utf-8?B?bHhaR2tsS25VTm9CYmtlNmRiNGtmbm5CV0kra3NsRkl6ek1BTFFmRlE3amRJ?=
 =?utf-8?B?VytSR1VVZ1NOOFUzMUJ0dXlCdDlqcHk2K3dCRXVUWmRCZzdIM0NSZUJKR0Yr?=
 =?utf-8?B?VWcvL25Qa3ViYUhxTkd4eXlJdVpPTFNxTUZxSUZXZ3dUTTE2TVU3MWJncFVy?=
 =?utf-8?B?SWhMZkRlM1NuL3JFQy9yN3QwbUxwd1ljSjlNSzhHV25BZUp3dFZCbmxNNldj?=
 =?utf-8?B?RHFBQ2NxVjFFMDYvRDFHSDIwWVFiT3pvaENFdlVld0Rtd3lDdU9Za05ab1Ry?=
 =?utf-8?B?R3BSSU5PN3Rkc3Bqb2UwUmphQSszaVpwMi93M2dGLzk2UGZvaktZczdhWmhZ?=
 =?utf-8?B?VXBKcWpnUGVicVVVb1MzSUE2VDBIT3dwRGtCMmxpRzVQSDdPa0pzS1dKR2ZF?=
 =?utf-8?B?K3JJSVFwbW40cGpOMXZGQmRVbG9acmFaRis1K2RBY2d1NWVDTU02TTgvL1kx?=
 =?utf-8?B?U0VFaTNublZpcFIzZVJha1BoNENBQnJPNGVLbmhzbnFkOUpPcDlxNzlwbnlz?=
 =?utf-8?B?YjdDSWZLZXlPdDRPbkwvd0hqcitNZjdldGNCWmpIQ1JvdThaejJCaXcvUmlq?=
 =?utf-8?B?RG9mT0VjRzNZTllaWnN4UC8va0lTTS91b0xjZVRuekJvQ0dlbGxsMzR5RkRB?=
 =?utf-8?B?MDVFVk5YSVRsNWtPMnhQeHI0WnF5bDRnLzQwQWtvZlJnb2hIZWFGdTI0ajRY?=
 =?utf-8?B?UjNTUFdOWHlFTEt4OElWL2NkQkdNNmwvM1JJbXVJay8vclBsVmlqY251WU1l?=
 =?utf-8?B?UmhQWjViRkVkQTByaDZLK1ZUTWhvZDQ5TFlZRFdIL1R6M2FjT3pMUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bad433f-e0b8-4e05-9e7f-08de6e3fbaf2
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:15:13.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5WE1bQcxxvtJsWhx480W5S9iqK4y9YXF7n186vyMEVk5cpCHjiWb3B1uqgTQYFCOVi+dtD2Gr9s0k7qUJ8WDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6743
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31765-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 30AB114DF5E
X-Rspamd-Action: no action


On 17/02/2026 16:04, Russell King (Oracle) wrote:
> On Tue, Feb 17, 2026 at 03:55:47PM +0000, Jon Hunter wrote:
>> Hi Russell,
>>
>> Mikko recently posted this fix [0]. Hopefully, this also works?
>>
>> Thanks
>> Jon
>>
>> [0] https://lore.kernel.org/linux-tegra/20260217-i2c-dpaux-irqsafe-v2-1-635a4c43b1a7@nvidia.com/T/#u
> 
> Looks like it probably would do, but I note that it fixes two problems.
> What happened to "fix one problem with one patch" ?
> 
>  From Documentation/process/submitting-patches.rst:
> 
>    Solve only one problem per patch.  If your description starts to get
>    long, that's a sign that you probably need to split up your patch.
>    See :ref:`split_changes`.

Yes we should always follow that rule. However, in this case, I believe 
that the build time dependency on the PINCTRL subsystem was only exposed 
by adding the 'i2c_dev->dev->pins'. Unless I am misunderstanding ...

Jon

-- 
nvpublic


