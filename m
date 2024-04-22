Return-Path: <linux-gpio+bounces-5713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B03968ACD21
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 14:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 653F9285CFB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 12:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F317150982;
	Mon, 22 Apr 2024 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="UlMs47tC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2100.outbound.protection.outlook.com [40.107.241.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A2145342
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713789868; cv=fail; b=Ckzx58k2mpwmL6Ax/72LGA/RSUPZcBGXhDAbCjdMH8rqIwYD+9/LMJjHgiRwCQqdx+XRniaxm06GO12/OTXNgnumEpAuhTfi08O9ifzvbyW8Aih9/S5fA44lxx1R/1fgdSAN1sHMSOPcEf45nZLzAp5TOM3ZnGbd/FeqC+pRfpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713789868; c=relaxed/simple;
	bh=gl0RE59+cbCk/jGQnlw+THR76b/uLCaPnhHvZgxNET8=;
	h=To:Cc:From:Subject:Message-ID:Date:Content-Type:MIME-Version; b=JfyD1shWHlu3XALnkuVXLWQexu2ic8eqvkHUGNUjk+aJMDAYsxMsDc1rHXNQb0dmhRYuLE67LbONxGKqwnbAvsrs+O+Rpgbc3EqmPgzLh+ZM2NFWn8keQY5gh8OKvIGimIXnlWgkcdar0M5L0sq0TWKhRMoia+th/ZQMXeXe6rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=UlMs47tC; arc=fail smtp.client-ip=40.107.241.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfRjauE988K91ry0O76ktov7x18ugyLh3/W2kS0k2nJZO9/de3tpjSX18SBWnxK+WLl0tpJenMdyuZzUQuypWmfL+Jig+BvPv5FothpqtqD6zsHGW0u28dEYhpRdJnFuIX2d+04Fv0tF87O9OVJQYfFuZZuauVFhBvGbq6LReNQgIPptKel5kIzhgUpODdLeWWqRm+NchFfg2CFjk5qYZuiOAzambiUGvwR6/91I3hH1/r/Qz3C4tPxlpXiTSrcZii7MxxyRcQE9F+CJWgp+xtZjU7lSro75IkurhXw+NtXV/8waajmcx/4XhKf7vRx5Ej6wz06d17u1j+Vq5nQ4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl0RE59+cbCk/jGQnlw+THR76b/uLCaPnhHvZgxNET8=;
 b=k2CGwL5VF7+zEPrdcbtImN67R0o4YuN+NVcTfOcwm+0Sx5mVbtwL4BTyX2nKr9TBqzDv/Zby7Fy11c7BgMU3JczbdM5yo+Xsw4p0qV1oAhUmlvO3JDgPYRXJwI/Bi/RQWEAUDlNauivE39n9MfWc7HIU5GzJY0HojEWfx2d+7mGOKH8mmCZ/BajCK1B+89lx7gcPZ+9fCOM6vWnnoxj2TURORiew9cGJhRXDr1uyzAW6rXoilQSxTYZ3Z6ebbQ0GU/eZSD60JQn3YlIPubcx7GbP83WI1QY6WmSL3LyBwx6n3Qy/nHPlTkCUTS1w3h4MRS/OA3pZ+2YzYVRl5Rxeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl0RE59+cbCk/jGQnlw+THR76b/uLCaPnhHvZgxNET8=;
 b=UlMs47tCdihCYG+x3NPW1oY/e78Hi56tLfd2ZcQBgipUd88g9kzuZJGFXe47XKH8nga7h3R+8QvMWn/gdpR/hIO15kmscQ0qtZ81dc8ZOsA2/tkt+ZRf6L+LIz0WGJfg+A+Y0w4nMPWEViYlurKUhdp4RlapOk0+Z+SgsBRa/sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by GVXPR10MB8198.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:113::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 12:44:20 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 12:44:19 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
From: Gilles BULOZ <gilles.buloz@kontron.com>
Subject: [questions] : gpiolib and gpioset behaviour
Organization: Kontron Modular Computers SA
Message-ID: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
Date: Mon, 22 Apr 2024 14:44:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PA7P264CA0529.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::22) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|GVXPR10MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b7c4d5-6fbd-4858-654a-08dc62c9eda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTdBdFNRSkZvblRGRW0rNWN4Z0JWYVBtOGtGQnZyT2R6cnViSGpHcHZGSWZX?=
 =?utf-8?B?NEo5NXpZWkp3TDY1d0RvaGovM0MrTjFSSzlacWQ0SXM3d3JBMVdXSTZoemdC?=
 =?utf-8?B?T1RnYzdqdG1oS3g4ZjdvWm1oVkxGd3ZSa2txaTl6d1g2OENFOSs0YmZ5NC9B?=
 =?utf-8?B?UnFFOVVDYTVxanl0b29RVXZ2eWpzQWwvNDBWeVhEbFVrOU1tY0kyaGFFRnRT?=
 =?utf-8?B?eVZFUEZDMDFSVUVQK3VZOVR5cHdjR3dpRVc1U2JPVGxpTE1hVHFFMm1Yam1I?=
 =?utf-8?B?a1N1NEF6bkZtQm9IWkFmbFhzUTNsTzJQVEsvRVB2K2Uvc0ZnNTNaazY0aEhD?=
 =?utf-8?B?VmFNZXRIa1pHOCtvdlduUkp3aVZrNVM0Q1NXNTBMYWNzczBuSGwyQ3RUaEgr?=
 =?utf-8?B?N1hEQjRvak0xL0tIdUg1WEVKekxKQ0sxMVoxUWZKSWRKWm9JSytlWXVqMmYr?=
 =?utf-8?B?SUVBTmszVi9GRVdESUZ2RGpTQzJ6WkZGV05FeDMrQ0cyUEhkMkh2dlBScjUz?=
 =?utf-8?B?clkxWTl6ck03M21NZjFVbmh6ejg3Q3lDeENvY2k4WXlyclVJTjRJRTNtb0oz?=
 =?utf-8?B?NCtkRHJOUnBLSm1kaTBXd2luY240SHdmSFk0cDVSTWJicnU3WS94SW9XYjF1?=
 =?utf-8?B?NXdPR3VYZVZmM1FBT3paNURGVUZyYWg1eWhhWHJPZ0g0K3Y1NktBaXQwZWZD?=
 =?utf-8?B?YjdjZWNISWgzOG91dWdFRnRCaWJ6bm82UG9pMjNrUExkeHJnWjJRSEU0YnJj?=
 =?utf-8?B?dkJtK0tab0JrRkVLNlpGcUlmKzBVckRxL0FPWTZWWURSRmYrYzFla2RoeGZs?=
 =?utf-8?B?ZWRxVGNFS2dnN1Awb2lFd0NSVGJFbkFGTDh0d0M4MU1MenhLcjlGU2xIVmtY?=
 =?utf-8?B?RHNFVG1LQzR2TG9nWE5neXJDRUtDcEZ0bm02SlNYWGthTmQyclpDR1RjbFJo?=
 =?utf-8?B?eGh1SDZxVnVHTFQzUFRzNit6aEkvWnUvR0JjdnkxZE1PcGRERWJjZzBEY2t4?=
 =?utf-8?B?dzNhdEZFY01oZTFDQUFsZEZRV0xvTmlZZUlxL1YrTHVnSVNPWFhjb2VMVlAz?=
 =?utf-8?B?dzRLS2pEK2o3aWhBb1owRVVkT2dySzBwNUhvdzJQZ3JpRys0ZGpZdytqUURj?=
 =?utf-8?B?bGk3TTNnVCtqdEFIZ0hGcnRseWd5NGprbEU5eWtQZ08za09MTEFFdVRKaG9y?=
 =?utf-8?B?bUI3aEk0RVRpaHpVcnoyMlhyU2RQS2dYUmNHNC9KNEtrTk1Ea2x2TnJsS2NW?=
 =?utf-8?B?czhhYS8zeFJGZkJ0Z2kvQ0JhamV4V1lhN1JvbEFmY2djKzM2QXp1eGNUWHYw?=
 =?utf-8?B?Zkw2dkI4azJ2SVkyTTZROE83N2FtL0o4ZmJ5ZitjU0VGZkVuM3lmdTlaRExB?=
 =?utf-8?B?R0sxUUloeWJrQUJFUDhJQUFEVmpFbytCN1p4YTdSc3p3QnJkMk0vS0F3ZmIy?=
 =?utf-8?B?ZzdiZG5DQXplaEUvaklmWHNTQ1RkNmxYR0JsU013VEhtaHRGam00MG92WW0r?=
 =?utf-8?B?Nm1sbHJxekRDVTZZcHpySHpDZmUxOUJ1SEE0QXBveVBvZ29wbmhray82S3dP?=
 =?utf-8?B?Z01tVXh6Z1N1RXFIdHNZb1FiaHR0SzdCZEFsTy85L1BiR2JoeDhOZ0ltemM4?=
 =?utf-8?B?SkdXVnNsY0twQW02UGpwSSswTzdNQmhXUnBla0RWWlNRZk9KZkJTY1hqc3hn?=
 =?utf-8?B?YkRNYmNPbWlONVJzazN6ZWN1WkJDTmhEc3MvRkZ5WEU0ekhOZERjQTh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk5zVzQwYlZVREhrNFdCM1JRNjMrc1RzZ1ZzaUwwOHZWWUtJZG5pWG4rM2lw?=
 =?utf-8?B?dG9EOE5MNk9hTTYvMmZJbFlmc0Z5UDZpWityZ3lFMXVtRFU4TTZPVUxjSk9Z?=
 =?utf-8?B?MEJuZzZJblpQeFUwdDErMEE4QVFwaFpaSCtUVHVkUHA2REtyYTRLY2JVU1c0?=
 =?utf-8?B?TlJnREMwWkcyaG1FaXRsOFE1d0MrbUxkdGFXdTQzcXFIM1JoUU1RblNzVUdo?=
 =?utf-8?B?TForOThUUFp1S0dHUzFFK0FpckhNVkgvK0tkL081SkNzYlY1cmphMU1UY096?=
 =?utf-8?B?NVNMbEprT09zd0VFODcvNHpQNW8yNzJJK01ORFd0VWwyMW5Fem12WTV4SEgv?=
 =?utf-8?B?eFMxQVZGUGlYYnFsZjNmSEkveExYWjVJaE80MTkvN0lhcndKSEcvQVhDSlhv?=
 =?utf-8?B?VkZEa1hiRnprYWkrdUlCbFVINVVqRDJ4eXZuNXpWYkpUS3pRY3o1L3Jad1li?=
 =?utf-8?B?R2toV1JwTVprbGFyb2pZQjFpYVN6MzFpMURqeDV5SFd3bGNQM0F1R3FJS3Ju?=
 =?utf-8?B?WENsck0vaUg1K3NmUGhZZkNXUHhYSFMrREgzbTA5UVRtM0pSdElrNnZQQmtt?=
 =?utf-8?B?QXVBb3BKM3kzdm1KcGR6Vld2MmRGOXYxVlZzbFZ2N3cvbzkxeC91R3U1ZXIz?=
 =?utf-8?B?V1BZNE9WNlkxaURzWEk0WUpNR3E4TG82ZXcwdmxaOGxHWkEvdHBMcDRHWC9w?=
 =?utf-8?B?a0dERlJtb2hsZ05WZmgxTy9BSjJSd01TRmYyTThvRXFqWjRTRDBxNFRDTmF0?=
 =?utf-8?B?WUd1cTNtZGo0MjNWZ2x5dzZFOXBGWC8wL1dFQVJtYlk5aUlmanpwSTAyWE10?=
 =?utf-8?B?N20rdGZHanhMd2NldjIxMkhQVjMvOVMxY3J0RTdyM2tqa01KZkVHOGVLOFNl?=
 =?utf-8?B?NFhXZ2NjSTE0L1hIVi9mRmtqYk5YOEtHYlhBQkVMTktNbG1rSHhzSU1lTjlO?=
 =?utf-8?B?M0xzeWFUdXFIUUF5RFJLaWxZelJLWExaZFVKKzBWcmdhMVNwWFdJSzBwSDkv?=
 =?utf-8?B?TjQ0YldPdjBTM05HYS8yaUdDVCt2WGpWOXd6eHR4RW9XYkJ6WENjQXZ5cHY2?=
 =?utf-8?B?MVVFUEFYSFJtaFhPR2dVKzUySUpRekdxNERGSVQrSW0zc3FGYWxRODJDZ0gr?=
 =?utf-8?B?YmFiRW9nOTM1Rm9sbklJZzkxckJGZFJmQUpoTlA3MW5DeXN1NHBTeENhejI4?=
 =?utf-8?B?bkpITXgyOHVPQVNjd0tqdkU3NHdiSkJGWjk4NTFjdDhyMHRZNmdSUTA1aW1t?=
 =?utf-8?B?N3ZwcTZpMCt5R3pnU2crL3N3eTdVS2ZwYmlqZTBZaHJpaGkyOElFL2s3dEdF?=
 =?utf-8?B?UlhxZUg1RS9YZVl3UDNWcXJCcXpvMUFobE5VanNna1NIRjFHOUVoNEN5U3RE?=
 =?utf-8?B?OTBzVGZaYXpIQkR2djl5MC9JbnVPcmZJWW1lR1BrRHVhWjdma3U2YVE3VVRN?=
 =?utf-8?B?UzRmWGI0dXo2bm9TNVliUVdYVlVVREcrVXRWR1ZOOVRvcGE3SXdXYnkzdmZH?=
 =?utf-8?B?MlFieTlrdHdjUnVRVlNORU1LYUlvSll2a1dzOXorMXNJcTVmL3c1RmQ0THNm?=
 =?utf-8?B?UG9WRkkxdlJpaTgwZ2pXNEIySEMvMVlUYjE5WFk5S3RRVWd4UWdJMFlpT0Zu?=
 =?utf-8?B?bmI4ZzBjTHBLMFFoYmJ0TDNlemJ3aXkyQm1GYnlzcUVYWnBuV0dXL1p4cUha?=
 =?utf-8?B?K1ZEbWo4NzJmT0duSjV4UXRybXhtOWUvcU1lRjdZN1g3bFpqalovZSs2Z2dy?=
 =?utf-8?B?d2NpeXZOODcrcThzenVOVzhaWGhXczZGbkNYVHlDQU9VMUZTc1BPUldaYzJ2?=
 =?utf-8?B?MVQyRHVNckNDczJmM01UVlRHNCtDUkR6VDVnS21hWG9zcE8wSG5tWkF6QkZK?=
 =?utf-8?B?b0JnZUVUYktlbDlRUXI4NVo4S2x6YW40VmpIMk5wMGZUa3RPZTgvWUUxMjR5?=
 =?utf-8?B?ZGZ3TUwxMzROT0tTeHNlajdaOWpSbUd2VWN6cllVV2RXVmx5M3dmdVM3akhQ?=
 =?utf-8?B?Y0Eycm5nRzBRRFlsbDZLWUJQMjlOZ1Z1dkt4a1huZ2c0Z0x5bU5FZDgxeGJo?=
 =?utf-8?B?ZUVLU1lVZ0Rhb2JGcU5nZldMTkx4MHd0UU9PVWErRnJxWnZiOXl6VWwwR2wy?=
 =?utf-8?B?Z0g3L0h5S1FFLzY5M3RXdEthTkRzUjNCVVpVOGF6ZExKYXFvNDNPNnFTVktO?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b7c4d5-6fbd-4858-654a-08dc62c9eda2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 12:44:19.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO7YENJj+YcL7rq9rL4PS1zrjj+f8rwlnt9QrjG2NI3HawP9Oin3nGzVmatF0hxKrXmL8eDIfLcvOHdo9nsWMR9PQ3OnWJxchpfoM+JM+Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8198

Hi Bartosz,

Several years after our discussions about GPIOs, some things are still unclear
to me.

1 - The gpioset command has this in its help : "Note: the state of a GPIO line
controlled over the character device reverts to default when the last process
referencing the file descriptor representing the device file exits. This means
that it's wrong to run gpioset, have it exit and expect the line to continue
being driven high or low. It may happen if given pin is floating but it must
be interpreted as undefined behavior." But up to now I've never seen such
behaviour and I'm glad to have the GPIO set by gpioset keep their state once
the command exits. Is reverting to default an optional behaviour in the GPIO
chip driver, or in the gpiolib stack ?

2 - I've recently wrote a GPIO driver for an I2C FPGA design having ~112 GPIOs
and wanted to use get_multiple() and set_multiple to have more efficent
accesses, but realized that the line number was limited to 63 because of the
unsigned long mask/bits. But I've noticed that working on a line number >= 64
was unexpectedly calling these methods with a mask at 0 instead of calling
get/set methods, and that the only way to have things working was to not
define get_multiple/set_multiple but only get/set. Is it the expected
behaviour ?
At the end I've split the GPIOs into two banks (first with 64 and second with
48 GPIOs) to be able to use get_multiple/set_multiple.

3 - Is there some way to request a GPIO already owned by another process as
input or output, just to get the current level on the input or the level
driven on output ? This would be much more efficient for real-time
applications than asking the owner such information.

Thanks very much for your help.

Gilles Buloz
Kontron Modular Computers


