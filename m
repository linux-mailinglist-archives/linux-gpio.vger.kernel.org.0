Return-Path: <linux-gpio+bounces-5716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC98AD2B1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 18:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1D51C20CA2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 16:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CACB15381E;
	Mon, 22 Apr 2024 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="G9gM446b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0D15381F
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804553; cv=fail; b=tdFbOpxrXXOHmJVGiqnUpHlBT+E7L1ATzspFmeKlKvd6HzXHuLXsE3heUoQD+1QJgLyJlV1vBnX+TZpz8c8/s6Z0XMrC84h72i73s/1/Iwt6zMa7uWDS9aPIww7rQZU/ncFmof4VYthL0rH323ZeDvkszbrHLQYqyGzg36OwO8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804553; c=relaxed/simple;
	bh=9OQ2PH1spyzHmdK5E+w/3M3wBLkz9Ge1NJRMRgrONS4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To:
	 Content-Type:MIME-Version; b=Jg3oO9BgM9v7eZDuT3qzyPomHGDJ7+RdLs6AyT7Q+7VKI5WpbopRWaxUolEHwdRHUXWhYKr6Cn7jMCD7Zo1lrzRvMXSH0cICu6hwxdkDCEeP/BJmKUALHeMOix3RRDX65adpGb59iyjaB6YPiX0PjUlUXgVnejqS2U54EZhrMwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=G9gM446b; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmZIPxMSEid2FfIsJXlQZazn+5loRSqggY2poMgOZgLlpGW9Qv1vKUdlCtJDPvXVGNJEfvH+sfEXVADw7oZmjB3mQRLcfIqfDwcpothACYBRCyE2LJKeGItv+8Yee6LohwTv+GIYn9fKg9Fkj/Rypuoi3ACKTO2mmQx2KZddUz4Icqg/6AoJZ2ImJBQoeeTC6QoSm7fY+K/BWiN703PQNXr4Nzc2tx1wJOjeKiyBrWMlCrm6U7690r/6D87Rb8r30eGKjHmWMlg+TpBg9Kz39Z7mCCFX1KJa+wnBHE6DTVuvRWVse+YypEZDNqj1abelh/OzgBk15l8Y4QQv1p415A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OQ2PH1spyzHmdK5E+w/3M3wBLkz9Ge1NJRMRgrONS4=;
 b=dRE+ZOKm0fwTr6Nb7ur5QFxgaaS2ihQBOPtxL2WayXQu0Y9MGBiltyk5EYGtcUzx5clhNBkfSR7NNeWxiJhdzB5PM0+4LsPg+q9p4BykQKQgwrYO7dxPw48yg/5nJHpZ/dutP3msRg2LS8Wc2diC3oFsfqEdVtSi3Y5QDQYlxU0xk2vaoReb8M1incrziwMtAjF6Dt3EiWdXj45mFA1MUklUoy/0xGLSbAGtEqFsQszaPmrhjn4mT+VoKgdZnVs5DIFuDlqShAlt9a8TFvgxTLazIucdMH79Sl/nDDLvI/vk1PJn/sYk5zNn1ysLYKx2sxMX8p1PdsgYDIVBMhY12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OQ2PH1spyzHmdK5E+w/3M3wBLkz9Ge1NJRMRgrONS4=;
 b=G9gM446b+LX+7pPOL/I5QPoC97528F5pDCt+HCWQqEVkC7LTYldNT3a4OgnN+6BAmIiCclGfEeVb0EHz66v13S1R6OULpZfDcWsAzQpr+rSFGbttFc7BfIhkBDN3oYtjiAkelqua/8+h7wgwTkjRTwox2V19EpzzNiLzbL1zaNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by AS4PR10MB5670.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 16:49:06 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 16:49:06 +0000
Subject: Re: [questions] : gpiolib and gpioset behaviour
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
From: Gilles BULOZ <gilles.buloz@kontron.com>
Organization: Kontron Modular Computers SA
Message-ID: <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
Date: Mon, 22 Apr 2024 18:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::8) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|AS4PR10MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: dd29bc19-f9bb-483f-3c28-08dc62ec1fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWVrN2xpbTNrWll1NElLTzV3cVg4aG1LUU4xd0tBYktVVmVndXlubGlHK0xJ?=
 =?utf-8?B?ZGJGQzBPZnhJWTJSNm5PaS93bFpsazg3bUx0NVhXOG84enlleXJxa3krRjlL?=
 =?utf-8?B?NGdybjc1TzhlMDBiQVlXNUR5QmgvM2ZJSlhxbTcwMEVFdDY1b0lOWUp5VVFo?=
 =?utf-8?B?TnA3YlN3Tm45SmpYYWFpYkIyVmRhQ0Fna1hSYnc1NGNPZ1YvK3lUQUc0ZmhP?=
 =?utf-8?B?SHcwM1Z0U1Z6RWwwTlZ2eU1pM2VYbFBiOWVESWNCN092UlZLZm91dHVJNk9h?=
 =?utf-8?B?U3h5WGJhMnFuWi9TNlVReG5MeXo5dHF3b3V1K29WNmtsU1BKcmQvTXZNWFJi?=
 =?utf-8?B?QXU4MklGRTNWdTNwWXl5cWdSdDBxSTRiMHlUb1g4MnR0NGQ2WXRldWRsd2dx?=
 =?utf-8?B?YW45TjZuNkV5UzF1M2RWOFMxRENWNVIvb09IN0NjSDRWRFFlVnlxeENmY1Uv?=
 =?utf-8?B?WWYzcFJwMnlXVytyeE9WOTl1TTJTcHR1T2hPQ1lvRjhwV0RNUEVYdUlFd0dB?=
 =?utf-8?B?OU9zNzM4QUxzcm5TNmNJeW1pQXZvdEt5TERTblVmVURld0UyemhLWVJSSk84?=
 =?utf-8?B?Y2pWbTRJNjljcEY1K2VKdlQzY0laUlZ0RXRpbWM3MkNpdzRwaHJIYjJ5Mm54?=
 =?utf-8?B?N3hGZ21hSysxcGk0RVZtSlRZM00xRHFOc2Rpc1JESFlvaXExVUJ4d01zMnh0?=
 =?utf-8?B?bGZ6ZVBMbmtMQzFmTElvNUIxUmR5MnF0ZlZKSGNtUGZPVzNMd3U4b3RZNUZF?=
 =?utf-8?B?MFBFOHg2RkU5YU50WHVkbHJjdzJVODVZSDlPVE0yZFJZYll6OG5uNDJrK051?=
 =?utf-8?B?VGFzQmpHOVpDY3ZhcHlSV0pMdEp6SFh0RElyR0IwNTBUdWNzeWt0bHJXUTBl?=
 =?utf-8?B?eitPVk9qZXJpL1RUWE5KTUZzK3dodFV6SlVONDd2OFg1a0ZYZGxTNk0wd2g0?=
 =?utf-8?B?UmxTWXAwVXpydTdyZy9JQkpMUXpoY1lHTitmZ3lVTXVwTERXUnBoL1d4aVpm?=
 =?utf-8?B?WUdOOHRCVXVyOGlrN3NkeHAvWXYyQ28rYUQ4ZjBsUkhYblV0RitQczR1QzRr?=
 =?utf-8?B?Qmw5S2tYUHVOS0cwcThtb3JUWkNWUG9IU0c3V3g1YndlUTdDbVRDNHNlWHl0?=
 =?utf-8?B?eWZPeVpXTUVxTkpTbXFWZzZYUFRnU0FwY2NjKzlwQWhJRXRDQ1lzVzVUek9Z?=
 =?utf-8?B?bG9nbUVzTGNLU3VHc0xOQ3ZFN3lFWm5oSFJrVFFESTI1R1N1U1lDanV3UFZU?=
 =?utf-8?B?QmV2MWIvTVNEVExQNUZhSFpBblhqME9ERFpPbFJ4djhwd2tiampEdHNjTG1I?=
 =?utf-8?B?SDRGN3poWXBjSFRzZ1IrR1dTcSs5a2liY3NYbFZQNGJkRU4xMUM1c2wzUkE0?=
 =?utf-8?B?S0RGck1XaXE3Z3lIaXlVb0NSTTBZQ0ZzcjJIenhqOVl1VUwxZ2VYT2tXN2VD?=
 =?utf-8?B?alVsM3IybjB2VCtWbUp6NFdtQ2FmcXNQRWg2L1BmN1JIZHloUitxaDJPTFJD?=
 =?utf-8?B?MEViaVNOSSswWE56elRCMVVicmVDM0EvalNRbytnT0l2STZlQ3pYTktoTFRu?=
 =?utf-8?B?ejN2WDg3bSszaEtzc0R3Zk10NnZBU3djaWE0T3BaK1dvYUJDRHJjRXlaNzB1?=
 =?utf-8?B?RFVJT0NEcndEUzhqVnE3a0FOQmNJeTNkN2o3Vyt6cG5UODhXVVFrYnlOMUlT?=
 =?utf-8?B?UUJ2bVZvUzhsZWQ2alNiK2l4eitqMGoreEFCQkcxSmphTlJZcW1zV3NnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGhZdGErb3djQzNydHdKVDNrVWJHL2hJb0RJdkFGVzJjd1Rzc0FvalZwUGRs?=
 =?utf-8?B?N2NFZ3dpaHRUZjdMaXlkWnB6ZjVhRnlJaE5PL2EyellZaGxzN0tqaUd0WWhn?=
 =?utf-8?B?NkVOUU0xaWd3Yms3aklLWnhaWFIxanJ3cXZWYThuWGR1KzJUUko2ZGVWNFNj?=
 =?utf-8?B?c09GY1MvYS9CTlI5WEV4Zk00UGlLRFdKdEFLRXp6ems0M043UVNyd2cvWTNO?=
 =?utf-8?B?SjRjaVFOSkNYb3V4M1ZoUHdvY29JQWhsRDJvZ21LT1ZheVBxem0rU21lT2ZH?=
 =?utf-8?B?em5DM1VGQ1BtRG44VC83Q0xWZmlmTkVOL3VoYUxUdndJYUdQblhJMmhmdFBw?=
 =?utf-8?B?SlpaOFhhdXpkckhHZTNCdG1Ka2ZpcDl4WmQ2TnI2WWs2anBtWWp5eWZRY0NJ?=
 =?utf-8?B?aU84TmdUTGFsdnpnbFVNZXdBMUFyTCtXVDlxMkxjUGZwRk5Vc2syczQ2eVBp?=
 =?utf-8?B?MmZ6ZGkwdjBuZ25SZWIxVkYzLzRVWmFYWTE1clkwbnF5ZHdzWGY4MWR3czlV?=
 =?utf-8?B?dHN1bmxBZUpCQU5vMVlJTlU2NC9jeVhFKzkxTFJ6ZFdjOTg3aVU5R09mY2hu?=
 =?utf-8?B?NXV3d0hLMVFENEZ6NTFoN2FRaCtlYmcybTlBRUU3MitKNk5HL082MXNxSE9k?=
 =?utf-8?B?d1AwN011ZThvbUFLcmNtTFhvOE9KaUVPNEFyYVowNVovV3JseFl3dmg2bHdD?=
 =?utf-8?B?dnNSeGRNbEszWEFyZjBXL2k4ZTI2V2VCSEhnaFdvbTI4VlkyVFNDSFZuUDFM?=
 =?utf-8?B?WTBiZGZPSjFGeVVkc0dMUXF1eEw3R2dDU1FuNFBhN1c4Z2FxbC9YNXVwM0lZ?=
 =?utf-8?B?Y2h6ZENuS2Zac2tIbUdMaWs5L1VhZUxQSW9ybVdacXQrRzFjUWhKMEhmS2RM?=
 =?utf-8?B?OHErbElUalFETm5DNTNkRjVMM3pycmNndGZxZlZZQWczWitBbUhLVGJCOTFk?=
 =?utf-8?B?SHV5aFphRW40RXA4b1BsWlpyckVoeHZMTGdpTm1LaGZXZnZNbHRSS2J1d1ds?=
 =?utf-8?B?d0svdlAzbllVQjBRSmh3NERXdjBsVDdONmp1U01oR3J0cEY5akM4ektiVGsz?=
 =?utf-8?B?YzVmeFl3bmFlTjl4ZjdRd2Vla0NWeHQ5eHFDYXZSTTBNVXpFS2xLb2R6dGVy?=
 =?utf-8?B?NnlqNVUzTTB4NHdOb2I0T3M5RFc0MGlRcVNuR2h1U3BDR1lGQm9vODduNVpt?=
 =?utf-8?B?QzRHQnNHZlZEODBSWDRyQkFVNTdqMERneTdsNC9wc2txRXgyWjRaRi9LTlB1?=
 =?utf-8?B?WEM0UGxnbG9BcmVIeUJ6dHIwcklHbVVsZ3dJK0lCL0NvTVg2WEhYOEVQTkw1?=
 =?utf-8?B?ejNQUldqaU1WWmk0d010alUyMFJPQXlTTEdCdldWeHVFN29aVUI4T3d0ZmFi?=
 =?utf-8?B?L0RrN3lZbE5ibXhoQlB0VUhQWWxSVHh2dWJNMG5rcUJBd3R5ZzQ0ZFpCN0NG?=
 =?utf-8?B?RUtqSHhLZ2tzQitpdlZoTXdSSTZJeTVEK0lHL29BVzF4R1g2cS9aci9zSVBx?=
 =?utf-8?B?VE9PVjlsTUR2UTNmdFZKdUFBY2NyU2UyZVVUUGIrNlREZHdlWVI2NlZWVlE2?=
 =?utf-8?B?ZGxjdjNDN01FL0RFZ0RTTkt1cWIrZG1tZTUzSFVlSWxCRWNTQlVObnQrZ3Rq?=
 =?utf-8?B?SGJ0L2xzYjc2QWtpd0JKV0taSVZtcmI1aDBOQWNzL0Q0aWp6L1luNjRWd3NW?=
 =?utf-8?B?elVReUp5ME41ZG5HUEJDbEo2c0UzSkJGMzlKZDR0SWhjcXY1UE0rcGhSSGRu?=
 =?utf-8?B?aE1adXdTMFJrU0VyZkJpUXF4U0U2R3JmYU9tK0FQeUR4d3phMWFidzBjR1FT?=
 =?utf-8?B?NW8wZ2VaUFg0WTRxNGpRS1Z6THpXV3N2YUlZcHpBK1FHRVdMTGhodWZ3cU1x?=
 =?utf-8?B?Rkp1VllMTWtjWjYybXJ2R2dRQmdSZDNXWVdrRFAvRElDRUdPSzhiVXNDcGpR?=
 =?utf-8?B?MFEwSlpEZmhUNFIyTlQ3M1l1Wkl4THJGYVRXendqSjJOTi9PbWJBUXVRekwv?=
 =?utf-8?B?N3BVc0NyR2JqdGRkRlpLSXVDZGRMMzFUQzQ2U01GNk9HekxvMDFqQ3NneE56?=
 =?utf-8?B?cVVpcDgzNzVFY05TS3ZubktRYTJBUGl3Rm1HREZSUW41M0ZtdjMrUTBNVDZq?=
 =?utf-8?B?aDZqTzdib05uUmdYSTMrdzk0VDB3SXA4ZmlCcmE5OU5YR0JRSTh2N0htRzc1?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd29bc19-f9bb-483f-3c28-08dc62ec1fee
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 16:49:06.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcQtKRCOuSXTcCi1khRE0Ntmqj6X91eF7X1h+8UhmeqePhIsiGb2GWDMSV++7dyne8pzKmVY34nOly6RQf7AkcpSeWFp4FQ1rIhGScCA0XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5670

On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
> On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
>>
>> Hi Bartosz,
>>
>> Several years after our discussions about GPIOs, some things are still unclear
>> to me.
>>
>> 1 - The gpioset command has this in its help : "Note: the state of a GPIO line
>> controlled over the character device reverts to default when the last process
>> referencing the file descriptor representing the device file exits. This means
>> that it's wrong to run gpioset, have it exit and expect the line to continue
>> being driven high or low. It may happen if given pin is floating but it must
>> be interpreted as undefined behavior." But up to now I've never seen such
>> behaviour and I'm glad to have the GPIO set by gpioset keep their state once
>> the command exits. Is reverting to default an optional behaviour in the GPIO
>> chip driver, or in the gpiolib stack ?
>>
>
> This behavior is driver-specific. Meaning: you're in-kernel GPIO
> driver may actually retain the state.
>

Which method should the driver implement to restore the state on GPIO when the
last process referencing the character device exits ?

>> 2 - I've recently wrote a GPIO driver for an I2C FPGA design having ~112 GPIOs
>> and wanted to use get_multiple() and set_multiple to have more efficent
>> accesses, but realized that the line number was limited to 63 because of the
>> unsigned long mask/bits. But I've noticed that working on a line number >= 64
>> was unexpectedly calling these methods with a mask at 0 instead of calling
>> get/set methods, and that the only way to have things working was to not
>> define get_multiple/set_multiple but only get/set. Is it the expected
>> behaviour ?
>> At the end I've split the GPIOs into two banks (first with 64 and second with
>> 48 GPIOs) to be able to use get_multiple/set_multiple.
>>
>
> Please use libgpiod v2. That won't help you with the max requested
> line limit but at least it's more modern API and actively developed.
>

OK

>> 3 - Is there some way to request a GPIO already owned by another process as
>> input or output, just to get the current level on the input or the level
>> driven on output ? This would be much more efficient for real-time
>> applications than asking the owner such information.
>>
>
> Ha! Please help me help you. Take a look at the DBus daemon I recently
> posted[1]. With the daemon running, the behavior will be exactly what
> you expect. You'll be able to get/set values and have the command-line
> tool exit while the daemon retains the state.
>

I was thinking about some specific "watcher" ioctl to do so, not a DBus
daemon because this is not welcome in the real-time and embedded world.
The only workaround I've found is to directly read the GPIO chip registers
but this is bad to do so.

> Bart
>
> [1] https://lore.kernel.org/linux-gpio/20240412122804.109323-1-brgl@bgdev.pl/
> .


