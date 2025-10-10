Return-Path: <linux-gpio+bounces-26968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C69BCC75F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60B6A1A6569E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13EC277037;
	Fri, 10 Oct 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qWrg/i2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165D323B607;
	Fri, 10 Oct 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090694; cv=fail; b=PDetUBNSiZL/hT8X07SmnOOwbHYdw+m6SzTgq0RPkIMXrJya89WTcuEDixCiS4Na2BtDjiCqRhNO3HUygCtTgoFoII80T/KN6z+lg5q0Gf/M54RYsxhsSpv9pkD07tQUH/czv4lGWh3UGugsWZaLod6b6pF2fX5NdLK6A8DltOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090694; c=relaxed/simple;
	bh=3DwiMcOcgI7TeK3kZ0BK576M9dKsfNPXvnPC5SF+dzs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CxKY/a1akD+NSpP/dKH+5i+N6uJ069WeUzBUynYr/OPmC11pLY5bEi0BrwOVsIk3QHzmNNJ5l/QG5+Om9YbnsaTmTtMuzAGFvURXBWXnMUb2YX4BQCLFkwp8SWPmZQZH7SOWqGtlhpE62lW/m8Cn2cgAqDmqPxcCCUi4H35gkyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qWrg/i2x; arc=fail smtp.client-ip=52.101.85.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLXAv3hmki1CxN50geBg+1OFmYPSHSnB2ik30o3bMwx+XzM1hjTc/aYSdPAoZ/g23xENewjMz4J9it2kfp4j3c5BUjSgjyjIRv2JLqr/BWp82qydcIF2/clA0kMtIFqyWLEtUTc9PE7s+nerPhOQ7Hc+bpKdC6sb/xLu2akukQvn0U2V+BRayCtYHfnV5SaIqla2HFmP5Bp900FYdsS/qnQC7XOpihd2TX1IySKoWD+DojXyJRwuF85hZ8jmraiD9DLo5BUamGT8nKZ0neL7UMDVyk5tQJAc1i+18XcKIUMeBucFaOh/qx+tfX/8kWte9uonIP88kWYK6WxcH0+69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgF79GzYheeZTbNHSwNjtkRQ54IZTAx/L0+9VkhxXz8=;
 b=heA8PTF6DdvRmczqPF6++P7cCGQl+HJSmwJSIFd7DVtoP4txQQwSwi/k0d2a/Z6EaTUf2Vx4c8fVL8vBM9jhEXPU1bJx6e7BGPbFC1JkqiSDUf5udCn6mZtrW4sgbamZ4pf+5HKQ559Cycg+QM/ocFwq+EL00O2j+KgVqb6TvDLq8/eiO6QtdIiYeC9vSWwFXvpyUQ8bYqgR3Nqs3GoOfBMhnJMCiQ/3mAVPZSKtVXSgJzMkUJMELMVpD1uWDksHNKeu9HDwmDTht2MpQTdKD49aRircV5RgG2WVVTOdroPFh5B6m+n8z1XKnDF9l9kQBe7oZoG6kgM32/2IhDuZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgF79GzYheeZTbNHSwNjtkRQ54IZTAx/L0+9VkhxXz8=;
 b=qWrg/i2xETiFHd3GuUUt1Jaz7dKKKlBaAj/5Tz4R8rv141Zn6AiiDBno9+0HFbIExNcy5lXJrLZIgQ7AvLYiVPZtXe7olzGc9XLwwNre2y2MfNbWgjmYyeBJwhyS0m9Jk3lkoAyxsgMKmig76ksR7vziVZa6Ujx8PRdhvW9jpRy1lwJY8EILEp8Zx2KQZJCRlqfIyoxeXQ049uhDmFFzo8F4TNjRyQQvHieNxXHYdqMuxSoMyIAe47YVEaoPD9H7WGfDPt3GWmWU7R1QKZjdly744j52lVO5mrTRPdw3S/VUpzZDvuGgKT6gtkJjKWudipFjXZ1Ag0hbJaNkv/OCFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 10:04:49 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 10:04:49 +0000
Message-ID: <a82f9e2d-0e12-45ed-ae6c-af781df05b5a@nvidia.com>
Date: Fri, 10 Oct 2025 11:04:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpio: tegra186: Add support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman <nhartman@nvidia.com>
References: <20251010092913.711906-1-kkartik@nvidia.com>
 <20251010092913.711906-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251010092913.711906-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4827c3-d483-434b-b86d-08de07e4727a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXgyckZDUjRlbEhFemJpL1lhQ2pad2laOFZLVFVydElwRU93N2dFODdYTzQv?=
 =?utf-8?B?VG1GUTdQcUVXeDVSZ3NiM3Y1TGJYK3BqbzhOQnU3T2Q5TUtXYndrT3Bndisr?=
 =?utf-8?B?bXdpZC9kQk02ZERzMU1rRjNMKzg5U0MzMk9Pa3d2YVZJMm5TVW0xWU5xb3E3?=
 =?utf-8?B?R1RIb2R2NUcwYm95UTNJYU9kdlN3NGJDS1JzS1ZHUU1leFp5M3ZGejJIZEd4?=
 =?utf-8?B?ajIyZU9QMzFPak1NcFRTc21hTEZtY1c5SEhkOE05Mlo3Z2dWKzBUbzRxSXZr?=
 =?utf-8?B?aUJWNzRMOU1CUkZrbmhKdUNJdzhnZmhoSk5VcndCYnZPVG9kdGJsOTRQUHkw?=
 =?utf-8?B?UEk5UlNuNFhUQS9jYlVZN3RNR0ZLRE44QVU5cGd4a29aL01MQVU1M2pIWGg1?=
 =?utf-8?B?eDcyTFA4T292WUxvdDJVQVIwRmNiS2VjSWxpQnl1QUdJb1JPbVBONXhBSXNN?=
 =?utf-8?B?eFNrM3p2TStGY2U1YU1CaWF3OW5VdGtZdGtsU1Ric3BCNnVqZEZRUTRBd01D?=
 =?utf-8?B?THZtWk8vbVFvOWJWZjdyMFBXcjM0c1dGbXM3V2IwVC95QWJYRkxlTUxaNzMx?=
 =?utf-8?B?bURvMVIzK083cm1rdk1OQTkrY0xjbU9abG9OVytQbTJwc0E3QTFJZUJGcE9E?=
 =?utf-8?B?OTBOWklTN0NvTytHN1dXS0NiNS84aTlkUCtyeG95VmFQaEhzellVNy9sbUFm?=
 =?utf-8?B?Mno0WlJwSG9NcWF4dHBCWmlGRTYxeXNxNEZMZHBWajJNbWc4N082N2lPeXJn?=
 =?utf-8?B?OGIwL0ZxaTdReW5iOGVGRFRJTzRtZENvUzBqNG0wU3hYdlF1V1hwQTlWSFB1?=
 =?utf-8?B?amY5eWZOVmJVVG1rQ1VmQ2lwMGg5NzkyMWlpU1FaL0hSNG91Q3NubGZBN2xV?=
 =?utf-8?B?MVV4Wk50LytOa0Z3NGZndE5MUUV1NkE3TkFzbE9NVGJDNXJJbElkOTZRRHdv?=
 =?utf-8?B?eGhmZi9ORHhEd2p1cWQ1dmwrTDhOS0o0VndVMzlKUW9tdkpwWXlIMHhYTldj?=
 =?utf-8?B?M0xJVmF0blhiSjNIMGdaYlNNN1FFZ3BDbmtKdmVxRlpPYjRNZXE3STh5dFA3?=
 =?utf-8?B?bzJKWDcyU0M4K3ZtNDIxT2tUNk9RQkV6eEhmNWtSWGwvM1B0clZrRzZjL2t1?=
 =?utf-8?B?OVJoNjh4Nys2d3VmeDlEaFdSb1JFNk14bUNjNEttZzB1b2NGeXU4L3lERDdP?=
 =?utf-8?B?VDJMRy8zRFYxWitOdUZycGROZjFJR25BNHo2djRMRUxNRm13NXBKdmFzYnp6?=
 =?utf-8?B?blEzdGhWVUQvUVlncTVNSmxNcEF2bUh5YVZwS3lnbTFXY3hnd2lNRDlqYjNX?=
 =?utf-8?B?aWtyc2pxSTJzdlYyUmRqRDlGWDliYTFmN0FGR2JtYzBaQi80OHlXNHFLbnJW?=
 =?utf-8?B?SE1iZk52YmF5U2NOVkRwKzhTOWRobThpSmw2ZHpxUkxVZXRsWlRsMHJPM1ZX?=
 =?utf-8?B?bnhKRFM3dkdPUWxjcm1BMmlnc1hGcWovb1dkT29EcWtLN2xzb1h0QXVZbUZR?=
 =?utf-8?B?dWQyUk5HYjZPWG1NODBOYWdBTFZMUmhOL2VGU1NCTUs5VGZ4VHdJRHpSVmNj?=
 =?utf-8?B?dmF3MHltTDR6aDRjVmZpQlRIZjVCTXo0eFUwaFp4dWlJU3N5RE9uOW8xZVFi?=
 =?utf-8?B?RzBPUEROY3Y2ZktBbFhDdy9TVkx3SmFUK2pnb0diVjBHcjhrUUlYdERzVmV6?=
 =?utf-8?B?YjVoRG5FWUJuZ1VzRjFNZSt4cVVGeUhVeWJkcFNoYVpUTDJmRUhzeDRHamdU?=
 =?utf-8?B?WFFGNlBsZG5zM3hlVEhtRnZCUmRNTHNpMVpPMkpyYkZQVXZabDdhelJMa3py?=
 =?utf-8?B?K2RGcmpiTUVOS252ZEs2MmwxTWttUnB0M2dhODFOL01VV05ndTlQbHZhcVgr?=
 =?utf-8?B?VmlMSTdka3NKMGF2QVpIUFhnT3NaZmpaNW1XN0VzQzREWXNNVnVuRVNZZUs1?=
 =?utf-8?Q?1IKqSzRHQaNKe2QW66R3ZMQ9Wc/R6oR0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxxQWZCUlpuc3gzQnEzV2RGZTV2eTQ2S0xiUnVReXpxMTZjN29mMXl2Y3l0?=
 =?utf-8?B?TzFzQzdONk9QUlUwTjl5ZFNzQkh6NmV3MjhacVZMTmpKQU1LRHRmZXczbW02?=
 =?utf-8?B?VTJSd2NtTmRWYVBWUExjcEZIdkVUNS9rRFM0OFIrVDlYTmI3V0dzUVE5ZzZR?=
 =?utf-8?B?TnQ3ajF0djNoeXRsZDVjOHcrdFBJZW9yWEo3OWtlSGp2WXhncWRMcVltcmVF?=
 =?utf-8?B?WDRka2ZkQ1YwSW95TTQ1S3VYcit3ODZUTzhqa3lqVG8wNmpweVNleXdBK0Nz?=
 =?utf-8?B?cW1xem01TXdEM0hnTzIwWWEyZGdVNlozSE5rNUk4dmNUOXQ2VzdlT28yVGpk?=
 =?utf-8?B?Mkc2c0NKQ29vNkFESTM5ckR0RlNzZnc5Nld1L0NUTDBLSnRUQTJLOWFBSXNi?=
 =?utf-8?B?K0tobTQ1RHYwSTMycVVJTm1YTmpnVGZkdlllMk1xM1lkRGlBSnkyMHduOFRy?=
 =?utf-8?B?Q2RXeXd2cE00Y2g1Y0EwSkw5UmF1VThrbTZ2R0JpbENCS3pnTDgwVS94bUc0?=
 =?utf-8?B?ajFQdkZwZFoxMldFaHdXRFlWallqUzFRRHpNMnhldzhVY2h6MVAzNFdHd2xi?=
 =?utf-8?B?YTZwNXA3VjAwazA3ZXBkVDNSMVllek02RDMxcmVaRU9CeGRXeGVMcHBsQkRv?=
 =?utf-8?B?eWV4cWxvcFg1VzlkcnJtczlJSFl5d29OekNTVk1tZDZ1cGNUTGFoSk1zdk9P?=
 =?utf-8?B?NytUV1B1TlVGUFkrOElaVzJmakRrbWdWRlh0d2lSV0Jwb2djcGw3UTF6NFFt?=
 =?utf-8?B?RW9YTE1wVWZjUjYyTHVwWDYwVUg0eW4vbktMWU1xSkdqVTRqc3lrSHM0MzNF?=
 =?utf-8?B?azIrZVJmUno2NUFNVmxsclU5QTZqRURnVTVReWlUK01nSmlCNHB5WVhJTHl2?=
 =?utf-8?B?SlNrNUF3VFBMSjJEb0c5TFdnUm4raW1YV3p6T29rQ3Ntd0tJQU5ZWFA1Ty81?=
 =?utf-8?B?MGFtVjZkWWNLN1NVaHZ4MGkzblcrYTUxNlBJb0UwcXE1cDl3SUZZWTBKWXNq?=
 =?utf-8?B?Sk5hZ1VjTE1icHFaL3p0R1IwM0pucjh5aTZ0TGNwNVFERVhZeXdjQjRuY2JZ?=
 =?utf-8?B?Q2N2amp0UTVZTklwYXp2Ull0SitEOTlmSE5tdUY3N3JHVjRYbDhlTk9aYjZv?=
 =?utf-8?B?RlJ4cjBaMGlSMXdHejM5cmtUSzlLQys4aGhRL2U5ZXZkam0yajl4Y1ZaNDVw?=
 =?utf-8?B?QURSUzZ0VzBuZ2RlRm5XRFFUakF2Zys3TEwzVHhwb3lGWGJCeTZsLy9ibU9w?=
 =?utf-8?B?UElNeUNkVGh0dDg2MHFwR0dmRmg4MVYyaWFBeHZxOG5UU2NlNnF3QVhZK2Fv?=
 =?utf-8?B?R3lzNlF0Z1ZHTk9kQk9meHNLM0FTTm5vZXJlMjVLcGhzdDZJS2c4RmZFUGp2?=
 =?utf-8?B?WUlpNTdUUXk3NE9tMktzNkhyY0hhWnFrUzlRaHhWQ0tyYzNrQ05CazBvZmsv?=
 =?utf-8?B?YS9YSitTRDFHVG9vSCtIa3ZHRlpQUTZwaTl6K29VbXhUNHBEZWlmL2wzT0JQ?=
 =?utf-8?B?ZGVJU3o1QjFmeHdTaG96WThVYXZvcEM1UmJ1Q3dHSVY1dHJiRHFxMVdtL0pT?=
 =?utf-8?B?eVdGNCtuRUlxS283SWFXL1lMc2MxVTZjdVBvcThtaEl0YnEwNE9wRCtTVnpC?=
 =?utf-8?B?WFNlTVJsS1MzQ0E5Vyt3U1htYzQvMGNDN2dFOWcyaCt5dHhCbE5nWDRhVEI0?=
 =?utf-8?B?eFdWMTVBS2ZuRm9DUXRhWktHU0tvTE5POTNXYk1yVldJdndBMWZLRE5yUUpz?=
 =?utf-8?B?VWxYOTlGQXJtM1BXVHNmNVpKRm9WdHQ5Z2JOcjRwN3U2d3JNckJOSE9iMjk3?=
 =?utf-8?B?TVhIRzRmVFFrRzY0RU94RURDWTlOQ0U4NnI2UEN5Nm52MzVlVGRORzI5S3I1?=
 =?utf-8?B?dGsrajQ0Yi9mUEMyYTVSS0FPSXhEQXAweFdBWjhYOEYxVWtQZmhMNTBOS0N3?=
 =?utf-8?B?SUQydmswM2xEbVZvL01tOXc4RXFqaTFaTFIyR0s4ZXUwUk5tbWEybExDZWJ2?=
 =?utf-8?B?bnFKVllFS1R5b2tlRUFOQlRFNUFqSG5BK3VienR4WW9PbGxMNzgwSDF6RkRN?=
 =?utf-8?B?R0ZKeWhveVRnUytFZW1QWHYrUko2MUcrZ1dmRzZ2bkJ2elVXSzI5bzhJYWlJ?=
 =?utf-8?Q?U2uRcHItGnp1OChMDhy3L1dm5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4827c3-d483-434b-b86d-08de07e4727a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:04:49.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMcMHA9bjQNdCMnK1PIJsnh1gg+pekFmZxd23Z7As6N37nYkYWlWHy4++iWF33ZWfI5O4wltmcopra1ZMn1mLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891


On 10/10/2025 10:29, Kartik Rajput wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Extend the existing Tegra186 GPIO controller driver with support for
> the GPIO controller found on Tegra410. Tegra410 supports two GPIO
> controllers referred to as 'COMPUTE' and 'SYSTEM'.
> 
> Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v2 -> v3:
>          * Add a generic TEGRA_GPIO_PORT macro and use it to define
>            TEGRA410_COMPUTE_GPIO_PORT and TEGRA410_SYSTEM_GPIO_PORT.
> v1 -> v2:
>          * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
>          * Rename Tegra410 Main GPIO as System GPIO.
>          * Add Compute GPIOs.
>          * Update ACPI IDs.
>          * Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
>          * Added Nathan as co-author for adding compute GPIO support
>            and renaming MAIN GPIOs as SYSTEM GPIOs.
> ---
>   drivers/gpio/gpio-tegra186.c | 82 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 7ea541d6d537..c6ebe29f9cf1 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2016-2022 NVIDIA Corporation
> + * Copyright (c) 2016-2025 NVIDIA Corporation
>    *
>    * Author: Thierry Reding <treding@nvidia.com>
>    *	   Dipen Patel <dpatel@nvidia.com>
> @@ -69,6 +69,36 @@
>   
>   #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
>   
> +/* Tegra410 GPIOs implemented by the COMPUTE GPIO controller */
> +#define TEGRA410_COMPUTE_GPIO_PORT_A 0
> +#define TEGRA410_COMPUTE_GPIO_PORT_B 1
> +#define TEGRA410_COMPUTE_GPIO_PORT_C 2
> +#define TEGRA410_COMPUTE_GPIO_PORT_D 3
> +#define TEGRA410_COMPUTE_GPIO_PORT_E 4
> +
> +#define TEGRA410_COMPUTE_GPIO(port, offset) \
> +	((TEGRA410_COMPUTE_GPIO_PORT_##port * 8) + (offset))

This macro does not appear to be used anywhere.

> +/* Tegra410 GPIOs implemented by the SYSTEM GPIO controller */
> +#define TEGRA410_SYSTEM_GPIO_PORT_A 0
> +#define TEGRA410_SYSTEM_GPIO_PORT_B 1
> +#define TEGRA410_SYSTEM_GPIO_PORT_C 2
> +#define TEGRA410_SYSTEM_GPIO_PORT_D 3
> +#define TEGRA410_SYSTEM_GPIO_PORT_E 4
> +#define TEGRA410_SYSTEM_GPIO_PORT_I 5
> +#define TEGRA410_SYSTEM_GPIO_PORT_J 6
> +#define TEGRA410_SYSTEM_GPIO_PORT_K 7
> +#define TEGRA410_SYSTEM_GPIO_PORT_L 8
> +#define TEGRA410_SYSTEM_GPIO_PORT_M 9
> +#define TEGRA410_SYSTEM_GPIO_PORT_N 10
> +#define TEGRA410_SYSTEM_GPIO_PORT_P 11
> +#define TEGRA410_SYSTEM_GPIO_PORT_Q 12
> +#define TEGRA410_SYSTEM_GPIO_PORT_R 13
> +#define TEGRA410_SYSTEM_GPIO_PORT_V 14
> +
> +#define TEGRA410_SYSTEM_GPIO(port, offset) \
> +	((TEGRA410_SYSTEM_GPIO_PORT_##port * 8) + (offset))

Same here.

Jon

-- 
nvpublic


