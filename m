Return-Path: <linux-gpio+bounces-9500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5DE96729F
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 18:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5211C21756
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 16:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D5547F5B;
	Sat, 31 Aug 2024 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oE7U2xoL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3B71DA5F;
	Sat, 31 Aug 2024 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725120891; cv=fail; b=akmetWrs3uMla8kdiM/9I2O9D8280GFiuHmZM+sjqF4JhlO2XHILxVtZRpBxYIrj9GI5b+FQX3PefJiEjkp2QepJM/0PCTTXrs9KfUDdw1E/nvtx5B0Ix5JaN8viNgCEJ1J+RAFNwVFGk89nMaY9yv5CAXToyQiYpGMkHfvxKkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725120891; c=relaxed/simple;
	bh=VV7NWqvr8280N9oj4uGq7+9KgIhgCsUNk1duee13SOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nSbAnLcI+IpA6QffeDcK8hX/XZg57nuKRDuFmjhJFCHLhLa93msOZ3xNUokP6L59X187U3OAQPI9Be5BCtAYfBabc56MA34nHudZIUvRKDA6VN9lA1LH+pQaSJMifATw5Z5Cqy+LKUULLk7ACiv9phOC1XCIzQQlDPqEg1Zzjkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oE7U2xoL; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL397vE3PuNJ1mst81bJ0vgIC6CgDyj0IJy8jXKHjVPLZrnu+xIoYBl7x6sOX9K/VjTVsYZrqpgS0l+t9is8IB9ch8Pe+rZc96PaMHnTuapRiTeRY7aH9TlW6bWUOWPLr0aiBMVVfWvdOA5MyQR+vpaUE11pIhnhwuGE5/ilCOC+D5CMXyzwxc7cu9kltjE3JS0gobisv86qjMAq/L92jC6V4mCR2U6kQ0r7w1C7rXg4SNKHLJX/eiNm4isbDDFASRglUp8YEzi8XXntuOa87+opNwpBkaQqhSKVeWhV40kvXd3/f9LNhYS6Azyn3RGKJzLtGdeMX7aGCxolfQ8XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smy04QksbW7rBFcBAXS3AAlldsZRHUXJb9RGQKxuAeo=;
 b=JvT8deM3yHF790J/DiKsIi+d+BtKwRUcot3mHGg35dxSqVJoATCzYuXuUMWKWkVKNPnZ6RC1dvr2XUp8B6QOFqQf920+D6XpyeoliYeRYYhKfmcxMzR4E3ONJk1QExCHkcMgg3uS8Ep30eGIKfpc5MJSiBSg6wplEr5XubwT0ToobbmVZy4nFG45Dd1o2gflbIdxhMw/P0H8R1PUcj1Z9gG5Xasdg0+98n1S7ZjxLFBmR9eG9cPtK0qirb/ZCuqNgeUu/jQYjxSFgFlM2xZ0GirdOL/FKo77Tese3WDdt9U5mZEVwKqWVurW7rfegG74s0nKMf5AnrDFF7vR8/FUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smy04QksbW7rBFcBAXS3AAlldsZRHUXJb9RGQKxuAeo=;
 b=oE7U2xoL9hFHLET60a7Nds5Tl/RV0mUnnc8jSMEwTFX4MiIeX1kRJeawrqLgmaXVI5cGKddKh6hIKf7VOjFCGsYuxWxUoha+rh+9KPY+nPUArSRtTeMj75P/CG0Ld9an2O2M3Ae5SJvHzsv9P4YdVzP04d2Wivn97W+YWRC/wTk/x86fnt4lAqnqVPCWNtUF+izCQ9cMkZT0lLzeuh4Qj7mipu7MVYcd1lPPBemagZCuV5CpYa/p6kMB31XSgcDgX2AXNBxBlYWZYqA3LZR99Go6TZy5uzbTKWjUxBLjMCEd4PwMmp1PzYxlssLY1rxcj4h5XIR+K5AieLowN8hT1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10571.eurprd04.prod.outlook.com (2603:10a6:800:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.22; Sat, 31 Aug
 2024 16:14:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7918.020; Sat, 31 Aug 2024
 16:14:42 +0000
Date: Sat, 31 Aug 2024 12:14:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Leonard <David.Leonard@digi.com>,
	linux-arm-kernel@lists.infradead.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
Message-ID: <ZtNBa4OZ1QO8WPlI@lizhi-Precision-Tower-5810>
References: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>
 <Zs4m2xZ9CTgPBGX8@lizhi-Precision-Tower-5810>
 <CACRpkdaiSX6zbyqUqKPwApS-zQ8KYMCqHs0F7Sx17jGN1bpJoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaiSX6zbyqUqKPwApS-zQ8KYMCqHs0F7Sx17jGN1bpJoQ@mail.gmail.com>
X-ClientProxiedBy: SA1PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10571:EE_
X-MS-Office365-Filtering-Correlation-Id: aca734b0-6c19-45cd-7007-08dcc9d8059a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEJYVE9JaXlvZmEwajN3d0lzbHdtTlhhVUpEYkJLYlhmZ3cwVDFDZVMzRG5T?=
 =?utf-8?B?eDIxL0RzSXBJQ2pXY3M1UXQzMllYQXJSMFNGRHF1S2YwNmVhdE40djMvT3J1?=
 =?utf-8?B?U1drL0xLalFFeU9neW1aZG4wK3NITUp1UzhxSGVVc2FDZXllVW9VVFpCR3hm?=
 =?utf-8?B?dTFjbXBDSGY4SGRxQ3l5dUtEYTBPM3lRY1RlTGNmQXdhNzlkdko5cU1iSW9C?=
 =?utf-8?B?cFJzY3hXNWJVTEhacEhDcDJYeGpsUU5FYlR0c3RDUWxTQzJGdWNRSGlaQThM?=
 =?utf-8?B?a2FoVWErYnBwUzU0UDlMWDlPNm9hN1RwMHU0MDlVSVQ4aUoxM2NPMWlFTTdP?=
 =?utf-8?B?RTBmNmZ6R1Z3Ykp4Rk5ic2ZGcVJ4azlaODNSMUhpalQrZ3RVTk01YytHR041?=
 =?utf-8?B?ejYwWVFzSVBhZ1JkY2tsay9GWVQ0TW5VMHdDU3c2WS9pQXo1aFZyTm5zVUhS?=
 =?utf-8?B?TWxtZ2lLVlR1TC9TWU5EVkRDTlVDeXRCNHN1TjJoUmFnNS9mZTJjTDJJemtp?=
 =?utf-8?B?bjIyaXEzUS9TbFdpak4rTjJKUnIxMGFWVE1rYWRnRko1RVZ6M3VMOElSMURi?=
 =?utf-8?B?VUhYTVB6eldkU0RUdjdVSWJPK3dVRlJlUWQ2WHROVzRZcUo3eGtZMTQzR1ho?=
 =?utf-8?B?d1V1MjNHMUZqdE5UcWoxcWtzYWZ6d2tkaHZXRG1tWG8vT012My9oUDZyQVlO?=
 =?utf-8?B?K0FzVFN1YjlYdSs4MXNFQnQzeXJrTmRiNkNOOHZkMnN1NHBmeFg3ZVl2cmIw?=
 =?utf-8?B?c2Z2S2Fac2htMUNGMFNHU3NXN1RXM1c5eTRncTZFZS82RWhEeEtNU1AySHhW?=
 =?utf-8?B?NnU3UlZyMGlWWk9FYVhDQWRVT0p5VkJZM0lDMElUZnQ0aEJpRVYvVWRLczdi?=
 =?utf-8?B?NDFIcjg5cmo3eHJ1TExNeHpRS1BUVk5qd2NKVnArYS9JZHBDNzZ6VHBqdTl6?=
 =?utf-8?B?Z2VHQkhNbkc5N2JkbjZSZ2V4MDVNQUtzL05YT3diTWdZdzh2VmROd3JHTzMz?=
 =?utf-8?B?c004dmpENmVqRllYSG8yVk5icmpDellHaDYrcmswK3lwL0hVV3hPWlZtTXZq?=
 =?utf-8?B?eDJPQWZhMVRYNk5hdGNhK0Q4K1JTN2JWSjZOR2w4RDZTbUJsMlovRk1HRW9t?=
 =?utf-8?B?NVJyR2FOQ2szNHN3R2wwTGtRb3U5YTZuUFZXVVZ1cDBzUUduZXpsRUduc2E0?=
 =?utf-8?B?alh2VW5paUYwY2Q5NWNwdU55NDc4OWszOUdrWW5sclZIOUJtS2JzY2hzc25O?=
 =?utf-8?B?aFN1bmdQTjdGUWJRMEpaNkdRZHhTY2Q1eVdsUCt1NTIwckNVZ0p3dGlNUGpt?=
 =?utf-8?B?S3dPSVJKMXNYaUZNK0pBbjNWODJ0eWtsM2tSRmxUQW1CWVArc3FnRzRESkdX?=
 =?utf-8?B?a2h5OVJ1VkcxT1F4V0hkTE1pK0YxL2lWbVg4c2VEWkFWNzJ1TjNRZzBBb3U0?=
 =?utf-8?B?MHZvclJyZERlQkFYdkpkQ3dYTEoyemVlQjFOT1l1UmQvUWVpbjVZR0NWOW5Q?=
 =?utf-8?B?T0hxa0ZQMWQyd0VqamFlNGNjSXNTaFB3WjZuS2hBc3h1QWE3Y3FrYUY3NmN4?=
 =?utf-8?B?MFZtUTdrNlppaDRXMlpHN1ZSdEZ3TDUyOWYvSHpiaVJJRjRnRzhDWUY0YU5Y?=
 =?utf-8?B?MTgveHF6MktSbWphOUgvZitGK3F2SVNFa3pNOER3c1VOZ1JndnBHcXZXUzJ0?=
 =?utf-8?B?R0NmNUYvR21SK2paQk5jaVI0SExuQUVsaWtXeGwrU3lJNndHM0N3d0ZEci9z?=
 =?utf-8?B?NHBXQ2NOajlrOXVMNVdHdWdjK3VRTUIvYWRVekRoajhHRHNiVjY2SUZ4bHJm?=
 =?utf-8?B?cmllYzMzTXNOcHhVeXl5RTlwQlc4WVJWT24wRTMvajVISzUrbUdZeTB6SjVr?=
 =?utf-8?B?WDdhZktKakJEY0FrdnlHejBQMFhpbHhZYlpNM25kSDg0MXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2dGbUZPM1RPWlB4UzBCdVhtRjJmalFqbUdVS2pOYlJ3R2F0YkljZitXS210?=
 =?utf-8?B?UUZIVng5U2M5SjRJbFpOeGFDdmZONnpOaHpLQUQxZkRNd0o2aEoyUHRoWEVF?=
 =?utf-8?B?bUpYRWF2MFIwUHczdWxVbG03c2JzNk5FQS9yM0hoemFSZXpKanF3MkJoOUhq?=
 =?utf-8?B?aGVQd0tXTlJGdXRlSVhjVElTMW1rUzI4ODNLbFdoOTN0NVgwV1NlcFVRVEMw?=
 =?utf-8?B?UzNQN01UeUpXUklNUzJaMUdwUHpqM2RvUzZXaUtOd3l6b2tBczdCOFVRZlZw?=
 =?utf-8?B?Tm1MOU1hR08vSjRJUGM1QWxSaGVPNGJieGNqRC91RHlEbzFSTTk4cG83dldr?=
 =?utf-8?B?a3NLU09UL1NEVXcycFdjcDlQTEYramxGVVlxK3JXWkxPN0U3enJFcE1raVpY?=
 =?utf-8?B?bW5RM1JjeUk2dFJDSHJqbnlaWnNxZXFDMWM4R2xvdUpsQzR6Qy8wMzFsakpV?=
 =?utf-8?B?aHlIeXlCVVE1QVdranlOc1BkeDh4MVU0eERWVmdiSVdMOW9iengxOVZmc2Z3?=
 =?utf-8?B?bVpaVjhXVHpWam5YMGYyekNFdzI5OEJCWWdQNlBLUEtGTVd1UzU4R0pRRzhm?=
 =?utf-8?B?a2p4MUhSOWxMaVI0U2R0MU80RmZmTFBqYTZrRmNORnBCV3I1UW9wMXluQSsx?=
 =?utf-8?B?a2xMV3ZheGI1WjRjdGV4T0xXREtzTStXM1ZjN2pRRGRpdFVpWFpMZ0o0VDl5?=
 =?utf-8?B?MGVoWXEyNWlvUFJYV0NiU0o3STBEYThSYzVNMnBiSXhxSGFrc3k0WUVwQk9C?=
 =?utf-8?B?QkUvQXRMOXJIRENKaEJZTkRvdkhrbzUxRkFpT1h5eUN2c1Bwc1lxZTZ2U3lk?=
 =?utf-8?B?aFpudjFRVWtaVVBneEN0SU5pQlZueG9RSUZiT2wxaTdqMkQ1a09IdWR5WWVv?=
 =?utf-8?B?QjVNcmp4cjJXRFAveHpkVFJYUTFxdTU1ZHpaSVRjanU4U2lkUkFyNTNLNVQw?=
 =?utf-8?B?Q1hlS25NSE9WYnpDYWVaQVAzYXZySnNRNEs1anVUWkdoYlRaTEI5VzQvUzFo?=
 =?utf-8?B?T3JkcG9OQ3E0RjArNzlCWGdmMmNYamZ2TDNtall0QU9obUMwUzZtRnNtWWp4?=
 =?utf-8?B?RmJZVWtTdFRRMmFDeXByT2Z0TEpMRlFTdTl1ZFNsYkN5MzUrZ0JMWEpJc0lp?=
 =?utf-8?B?TDN1V3pSK2lEZlNRMExzaGdIa3dYSU5VSnpCKzZtUnhHbCs1Y2h2dTQ5ZDNG?=
 =?utf-8?B?RUdmVkQyaGRnaGpxSjVqU1NTVEorYWJ1a3Z5OG5PS2tKNDl2N3J4ZlUxMVM2?=
 =?utf-8?B?ejJqNlFxNE9JVTA5Y1JCYitXa2hLTWppSFFGemNoZUdlNWdjeTVma09US1ln?=
 =?utf-8?B?cW1GMmd6MEd3TThXVFBVZ3puS3paNGVSS2tZa2ZOVmlxc0lVYzljSzl4eFRF?=
 =?utf-8?B?aWw2TU1KeUUxL0lTb09CMVBFZnAzc2FBMFBpK0RqRERuRkZWOUppdW9kR2pl?=
 =?utf-8?B?THJuRzhtbWdzRVBRZEl1MDNmSzEyL1o0MGdydkg3ZmFsRG1IczNqTWtIMVdS?=
 =?utf-8?B?dHliNkxFZnA3cWJIYUNhUmNCU3FyRm51K0xWNU9yWE9OY1krSFRpd3hrYklz?=
 =?utf-8?B?U0lqZzNYMlRiS2FYclU1Z01naUM3MkZjeklXSk9EZXIvVWRhSWcvcTZpNkRY?=
 =?utf-8?B?cmRRbjY5UGtBQmN5dmQxa2tnOEdLQkU3bWo1emR1aTQrczJzOVY4YVE0QzAz?=
 =?utf-8?B?cjVTT3hZaENVVGVIYW9QOEFGWU4zZGpTV1ByM24zL2ZOSjdOSE9YYlFxMzQr?=
 =?utf-8?B?cjB5RnNmTDQ0VFVwQ2tKMzgwMEV3Q05iNGVWaTNzZTliNzJwRjh5aWhNR3pD?=
 =?utf-8?B?TUZoNW5laGVZU3NGK0xqbHNCUzJzQkdNK0h3U05ZM2pqQjVXdHlLZVdRU0tq?=
 =?utf-8?B?SFNnUGR0VDFsNzBHNURObmdwU2RCWm80WUFzOGo1YzVzUXl4NnBkR3hMWUs3?=
 =?utf-8?B?L1N0NGtPVHBYdUpjc21HTGVLUktCc1h6ZmlIT2taZVJmZzJ1MUNqTktjaTVG?=
 =?utf-8?B?a3E3WmVFK2hzd0VLZFo1RG15TVlBMGZPRVFuR0NYZzdoeHhZWVZIWnYxdWhi?=
 =?utf-8?B?dzRkNnEySjZCcVdvUmZVQkhyTmtQcGhrTlVQaU5ySThVUGFScU85STQ0NzdX?=
 =?utf-8?Q?hM5s=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca734b0-6c19-45cd-7007-08dcc9d8059a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 16:14:42.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2cWovTNitvRQA1GAre8M8bj9KyFQljlyQDpbVFU3TJQzy/ucN5Tdt2RuANGI9amMN6khLBcldw1vI3v3AqlYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10571

On Sat, Aug 31, 2024 at 12:26:47AM +0200, Linus Walleij wrote:
> On Tue, Aug 27, 2024 at 9:20 PM Frank Li <Frank.li@nxp.com> wrote:
> > On Tue, Aug 27, 2024 at 12:12:24PM +1000, David Leonard wrote:
> > >
> > > Add QorIQ LS1046A pinctrl driver allowing i2c-core to exert
> > > GPIO control over the third and fourth I2C buses.
> > >
> > > Signed-off-by: David Leonard <David.Leonard@digi.com>
> > > ---
> >
> > Why not use pinctrl-single,  please ref fsl,lx2160x.dtsi for GPIO/i2c
> > recover.
>
> I'm not so sure about that. Since the 1012 need to use a unique
> driver this will be confusing across the family: one chip has
> registers and values defined in the device tree, another has
> them in the driver, if possible I would advice to keep this
> consistent across sibling SoCs.

There are not new productions of Layerscape. IMX will take over these.
There are only few I2C pins need mux to gpio. It is not wonth to add
new driver for it if pinctrl-single can work.

And 1012 pinctrl driver was not shared with 1046.

Frank

>
> I can't stop anyone from using pinctrl-single but it's a bit
> seductive in it's simplicity, while not always so user-friendly
> with all the magic that ends up in the device trees.
>
> Yours,
> Linus Walleij

