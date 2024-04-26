Return-Path: <linux-gpio+bounces-5897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37C8B3C98
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 18:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EA541C20EBC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 16:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC1214EC4C;
	Fri, 26 Apr 2024 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="mxIVxVqT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2097.outbound.protection.outlook.com [40.107.20.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA094152511
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714148201; cv=fail; b=Az+M5TwHzNwX0GaUO97VqAbEtui++9lA/Vbm/dEm7ez8A5iXZa2k9gkDzlwPtu43wVdwu/ENeGbtZl1HMtO8WptS1H5A4j6GZ10R6qLnXMQwu+LecdA+/iaSQxljn2kd7BoQ5h2siIjQ6z/2oxI7Ps05Cr6WE5qcak0cpheRoRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714148201; c=relaxed/simple;
	bh=dDDzyHje7MQHF8tZ6cPDKWiC95FymmvBZ1xtkObb+Jk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To:
	 Content-Type:MIME-Version; b=dUEBaD9gP+w/VvZ3n6uOK65jY/i3Bg3D/ymsWGmbDH8AGqz2jCyTgkwCAweuRaXWuLsw7qAuIxHVIh68hhgFxfDsXDwiaN+kPBDZoX8cIbTcqDOTMJf5y8LnrnHg5boSizINTFJTyOUHalDDWlWljzomLc+eK3QcDMfxcKgL9FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=mxIVxVqT; arc=fail smtp.client-ip=40.107.20.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqEMjGdyFNe8GFi4bpt4Yb/zydMnmet4lLT8WhW7vlCGetMIRis0D+2PKUisTQq9wXBrmO6jtOE+1/vvQgXtobgwbiLVa2G6m94MqycFNbAHkzGZWK/XiiXHL0W5NBmD+5azVUkIe54UFt9hjkFiq1gF7PmhNfHxLa1GStvlCE3Er/4OyaMLxp3QQbb70sKjDEjW5fug5Dep8esUwh8sreBeqHU27VTQtH9y03vvbqnhqbRUvqPlM9YkKeJ1v5kNVg2NgFwC5UR1Sni9IDnwi8zVrSMUEgEgtIzm+2TELm5ms+NUintb8Zi7so5kxI04jABInK1pq8Ht5MM2rPPLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZHbfl5H6qXK2uoOisP71uQZGseaao4bKsMKPppGrL0=;
 b=W0ybzOoYMGWuVMtDiVh2vElRv7x6GBOWtfUHjp6nfg9Fc38w+lER3DOVkpLtdiirUAhEFzJex3/Y1vKutDcpYu5lnz5NMS9OFvOmnu1FoeXpNfi23crToMRiUN9yoHphI0B+FVKYbxgariZdrsPuikEwOadb8E3EVzpxlu97sCBYTrc0GXAaCwfX0Ok6A1mdEAd0KwcVxhgBOKdqCBMUUzEKY+FlImP+PijsLwcbEZLhv3AuUL+CDOoO2314hUPGjtOJiiHAyNszqehGJuSDbTGGX8iiQrkHRvVJ3i+O8OOkq0NPwq9CzqtbJBrOzuBVpXcLbzh4UvsjIMmAIs96Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZHbfl5H6qXK2uoOisP71uQZGseaao4bKsMKPppGrL0=;
 b=mxIVxVqTHXZWAR26vgjfF2Vo7GmxdDHxzm/pwBYV/WV7XNqHzyBSJptV3NskejFrmjcq+2ar1Ya8XOP+Rcv61y+iq1De9CAEqlpqAAAtJDMM489n7BIetu8g8zQkNOg6It/W7B+CLsvuJw5M5shy/zT5R2iSIOcefZTL1BSXw78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by VI1PR10MB3341.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 16:16:30 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::142d:c1aa:6bc9:ca4%6]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:16:29 +0000
Subject: Re: [questions] : gpiolib and gpioset behaviour
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
 <20240426020720.GA9777@rigel>
 <76794fbe-db97-a00b-c16c-b3e4296c3b9d@kontron.com>
 <20240426133751.GA380503@rigel>
From: Gilles BULOZ <gilles.buloz@kontron.com>
Organization: Kontron Modular Computers SA
Message-ID: <7a0b23d9-1a4c-337c-dda4-b6935e563ff0@kontron.com>
Date: Fri, 26 Apr 2024 18:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20240426133751.GA380503@rigel>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::23) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|VI1PR10MB3341:EE_
X-MS-Office365-Filtering-Correlation-Id: a00b0bac-eb24-4d7f-e700-08dc660c3af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGVqb3JSZUQ4dFl0UnJ4M09OTHNNMWZkVEdIVjJCYUh1Q0ZjL1AvOWNHZ2E4?=
 =?utf-8?B?ZTNEUkpqVmMxL0RQcWxhZUVrdml2d3E3aGdTcy84bjFwRWtLNkRINTQ3R3Fp?=
 =?utf-8?B?d0gyZnkrNkYvQlpFTHJ0d3dMaHpmam9BcnlyQjEyOE5SRlRxbStqb2N2ZW8v?=
 =?utf-8?B?a2p3bFUyQnhEbU15VjIycFdDc2FnSVVXK0xURzdQeFJGZjM1WVEyMUJPak9Q?=
 =?utf-8?B?bHNVYjR5ZTAzdkJMMHJmK1VPYkVTVHNUWEdESUtKL1RMdDNiSFNJOEJMYkF4?=
 =?utf-8?B?TnNNaVdrS3gwU09XRDdVUXlFQnVscVZnbWhpNmhhYnhtVkZVV3lYV2hkRTZY?=
 =?utf-8?B?OGVtdWo3QzdtNlptNk5xZUxXclBjYXVlTGl2Y0VEcm54RjlzUFlhZzNiZUhP?=
 =?utf-8?B?V1BNcU91NGU0OGttR0swOGNOZWtMUERYZ2p2Zi9rLzY3bkNkdW1ZMVk3MDdj?=
 =?utf-8?B?ekVqeGtwbmo2SGFXSlVScHhaWWc5ejJVdWN3T2wwcUdIVmZKQTc3Q3J2bUR2?=
 =?utf-8?B?QWxURGNLc1VxamFuUU9ZeDUwTUtyOUVVV2NuU3N4Uy9xSjN3c2p2cW1TK3FF?=
 =?utf-8?B?NjZpY3g4d1lkaHR3Z001RmVTT2lpSUczOEhKVC96TmNIZ2tIYkpCTUpaR2lK?=
 =?utf-8?B?cWptZVBPdlBGZVdmODlocHI3TjUvaGU4dlEvcDUwd0pzZXFobDlHK1VWQWdC?=
 =?utf-8?B?UHlzb0tPUGJiUWxDVXdNVTF1eW5aNDNZN2xGMVZvQ1d2Wm51cVBGSW5vWnpn?=
 =?utf-8?B?YWFuTzRqbi9LT0NiZ29jc1hxVUtpbEFJckc0WG1LdloyMG1tZSt6RzlkWHZ5?=
 =?utf-8?B?WHNNYy9ER0I4ZE1qNHNmNXphUFRkTDY2SjJLdlRzMGtNNncrL21Oc0lQQ3ZM?=
 =?utf-8?B?VmR2eVI2aGNkcktLYXVDcG1wTHlyclpZS0JmKytlK3A5NTJhelNZbHRnRFlm?=
 =?utf-8?B?bkhNYVVaUzJ0ZnFxYnFIRXZHYjB0THJueS8vTXhDc0luYjltcW9MbCs2b3JL?=
 =?utf-8?B?RUdJTDQrZEFkZWxPWWczbkgxNlBGT2k2VHBnSmc4WmpCVmQrbGFYZHFZdzAz?=
 =?utf-8?B?dzNqZzFYT29kb0F5cHBERklkVElhVWtWVkc4UStwY1hTU3JCa1ZKcU9GS0g2?=
 =?utf-8?B?WjdMdS9rN29lYi9vbE5Jb09VUWx0UVppS1lYbGdZM0wvNzhEY1BkTm5mWXE0?=
 =?utf-8?B?bkJUUHFqcjRFTU1xU2dFWEJWenlDK0U0Mk5FMVNBT21abm9yK1kzNWNKMzFZ?=
 =?utf-8?B?TDczQU02aU1kYUtlWTRwa0Z4NUJnOVMvN3hTQXRZN0VNbEd2VzBRRFFFOG5B?=
 =?utf-8?B?UHhJTVc5dTFNNFN4L3ErVk01RjNPMHFpaE1tdit1YlpoUmxESVlDOFZ2TTVH?=
 =?utf-8?B?Mlk5N05uNDVqejFBTFIvMWxEd29wd1pFelpETHNaczIwVFVtT1RaUmMzcUdH?=
 =?utf-8?B?S1pRd1VRanRtdUpucmM2S251UkM2UFVHaG4zUTZIeHdTQ2lTSXVCMmtka1pJ?=
 =?utf-8?B?RDdkeGEwV3IrRmhEZTROajJGdHhmaUpxOVRoY212a0JwVkl3MzRjc3hEZFpj?=
 =?utf-8?B?Q3F6MjUvWE9TRlFJYUpTYkpXR211MHRaOGdwWmhlMnFoZmtCQjBIMTVrY0l6?=
 =?utf-8?B?K0QzVEV5LzVWR1EyQTZOOVg4Y21ucXlhTFhrd01qZlpSUnRBaUxxdnA2ZmRZ?=
 =?utf-8?B?b3RYZEJ4SUh5d2JKdkNsYXZaMUozam43aXh4a0ljbmxqcnhRLzhjV29BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3Q0WnVQYXN4cjZoNmsxdGxaRzlKUlF3YzgwdEZoNTJhazROSWI1aVlYM201?=
 =?utf-8?B?WEdsRWFHdnpzZExQek1aOW1wbjgxQ1h4a3BsS25OSWFVcE9wZURhVTZwTmFo?=
 =?utf-8?B?RDV6Q3d3OGpFcm93NnZ0aHBHeHNNZ2s3NHVBSVpYUnJ1ZFlQajVLa01YNlhF?=
 =?utf-8?B?Z0hsR1NtWDUxNUlMbUlqREFtV0xRRFdibUp6RXpaT29YWWpqanorTXRwZDI2?=
 =?utf-8?B?RXJBSlBFMlNyNncwVjBtenRTWVNHV0pIY280bHRISHowR0wyUjJzcjZ3U1J0?=
 =?utf-8?B?L0VKbS9wVnM4SmRZc2pEUXFacGIwUkNIR0htTDJaNU4zYXBIZGQwOU5hNlMr?=
 =?utf-8?B?M3RsK0dUQXhsRVgzUStWZzlJRWtZT3BYcUlsb3FBYURmZXVGNml5V05RbFB6?=
 =?utf-8?B?UUhNcGMzU1NQZlk5YkxLVEJiLzJzVyt0S2ZYam0yK1RwbmUvb3FxSjRuUEp6?=
 =?utf-8?B?VDJlSis1Tkg0NW5RenRtNGxYMHR5S0hRUVJmZ2pXRVM4ck1CYU9uRlpMUmVO?=
 =?utf-8?B?OWxxZmpLTm9KSXZFcFdJNUF5ZVVWYXgwNk43TGs5Q1UxbCtxWHhhTGdBSnJS?=
 =?utf-8?B?OTFOTDBoNGc5SzZNZUplVTI0VUhZNkFqb0JFdzZNUitmcmxrY1REbVhHd1Rp?=
 =?utf-8?B?bldRdmJrNnlxb05VazVVUndsK3BiWkVsV2tZd2Nad05TTmpqanVFODZKUnBr?=
 =?utf-8?B?QmMyeWJSZmxHZFVXT1ZPZFdPdGpIUDFLRGtVQ0dmY3dLWTlNV3dtZzZqTElO?=
 =?utf-8?B?clpwWjZXdWd2YjMxaEhxemVCeDIySXpDNE8zYTh1NlZhWk9wTkZ3SHhJTWNt?=
 =?utf-8?B?SlAvTTgvb2lZc2lWN0ZFeUhQZHBnZXBETWhGZ25sZlVjY1hGSlZOT0lmYTlm?=
 =?utf-8?B?cUtSelRmQkw1SDU4TGlNR2g3UHljMzB4YjVEVy9xRnhDcWlZYXJUWFdTRWo1?=
 =?utf-8?B?SzlUWjdWZjZCSnF3WlVvWDdtR1Fta3FGZlZReWJwY3ZVMCtRSmZhTHI2OUMx?=
 =?utf-8?B?d05YMnVXQURWZFBoY014cnBsQXlVY2FSM0hwdGFGRWFqUEhXNjJMdzF3SHVZ?=
 =?utf-8?B?SDZQa3h6OXQxVlA2UlNWNVRQZSt4aVdUS1RXVEMyeFkzS09QOWVKUDBqNmxZ?=
 =?utf-8?B?aVJpT0ZCaWVPeWdkYnVjOVl4SDI5OFdJZUJpMXFhRUM2aTdMc1h0ellxRGpt?=
 =?utf-8?B?MkJzYkd3alhTVTR1am56Qis1RjFJTFE5b0o4WE9DV0Y2ejRUS3F2TUkyRzJl?=
 =?utf-8?B?R1pmTEJsb21SQVUreDd5cGFmOWIrcUkrWmg0bkRRVms5TUdXTnAwV09tY1hH?=
 =?utf-8?B?bWR0aVF1UERPUWJzOXNnc1BSVFpjMTh4RElFV2ZyR2xOSThvQXVoQ0k3R3k2?=
 =?utf-8?B?QkJTR2FKQWJMTXpYbUtxZytEckRwRXlzU0FkdXM0NkJFRjQ2WG9iOHdZcjY1?=
 =?utf-8?B?UjROTjZBRzBnQUdBcVZ4Q0VGMlZUb0dvMGZaSTE4dExKWVpsMkhiZjBabWV6?=
 =?utf-8?B?UDJWTTFJbXAwQnNIZDZqK1lMNDYvK1c4N21ldkdsYmlMeW5zNGlyTE40N0Ft?=
 =?utf-8?B?b0hYbWlPYTBoZ2N1VDVWZllJUjZYZTYxZW05YWlUKzFYdVVIYzErb3NTNjBX?=
 =?utf-8?B?YndINVFjMm9pSjc2a2hRb090ck13K0E4b0J3MGFVaUcxaFBCU25ieVFZNmJT?=
 =?utf-8?B?TkMrckt3MC96dlpGQnNnU0NSL2QrM09ESWpLUnIwYzZFdzB3SUZzWTBGdmRl?=
 =?utf-8?B?TnUwTkJRNzhVN0djMzNUY2d6UmxxaW11U2pDZTlTeWdzZjJQdTQyK3hLbDJI?=
 =?utf-8?B?ZWloZFRjY0RteUxSd2sreDJsZFR5bzJZOUFSNUorajA5VGJDZTQyaGZVQkZm?=
 =?utf-8?B?bkhudTZKOW5Id1A0WG5naVhUYkFqTVk0dVlKSVZWbUtoK2xTZGFpVHI4cUNN?=
 =?utf-8?B?ak43MmgwR3RWZkNwNzFDV1VaVS92aEd6YlNqS3AzWW1Zb1NFNE1OWTYrOXFv?=
 =?utf-8?B?SXZhNmdIOEg2YXBUU1M3Y2p4b0p2cUdvSkN2T2E4Y0FPcy9oemtvM0pXbjho?=
 =?utf-8?B?bzJTVGJDZzFGd2wyMnQ1QWk5aUFVU09XSDgyak9uNWhFZk1mMHFGL1E5MkRk?=
 =?utf-8?B?bjI0V1UxSDIvLzBFcFlZRlVMcUorYlVEVEkwdmVGdEd6QVFBOUdnZkVrUWRV?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00b0bac-eb24-4d7f-e700-08dc660c3af1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:16:29.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dar7nBOdWaAjOjeJakszDHN/grh/RAzuk3t71dx1a8XdNfaxsSHBYWrkLvpfa3F8CVVscBLr9NHVlvJNVJcDYcsqfGKNDMi5HgIuMUiloIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3341

On Fri, Apr 26, 2024 at 03:37 PM, Kent Gibson wrote :
> On Fri, Apr 26, 2024 at 03:08:33PM +0200, Gilles BULOZ wrote:
>> On Fri, Apr 26, 2024 at 04:07 AM, Kent Gibson wrote :
>>> On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
>>>> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
>>>>> On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
>>>>>>
>
>>>>
>>>
>>> I suspect you are referring to gpiolib here - the mask in gc->get_multiple()
>>> being unsigned long*.
>>>
>>> The uAPI that libgpiod uses is limited to 64 lines per request, but that is
>>> only relevant if you want to request more than 64 lines at once from userspace
>>> (you would have to break that into two requests to access all 112 lines).
>>>
>>> Note that the mask in gc->get_multiple() is unsigned long*, so it is a
>>> pointer to an array of unsigned long.  Its width is not limited by
>>> unsigned long, but by the bits parameter.  In your case the mask you pass
>>> should contain multiple unsigned longs to achieve 112 bits.
>>> Refer to gpiod_get_array_value_complex() for an example of building bitmap
>>> masks to pass to gc->get_multiple(), in that case via
>>> gpio_chip_get_multiple().
>>>
>>
>> I was refering the get_multiple/set_multiple callbacks in struct gpio_chip
>> that are defined like this :
>>  int (*get_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
>>  void (*set_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
>> With some debug in my GPIO chip driver implementing these functions, I saw that
>> the bits set in "mask" and the ones used in "bits" are the ones whose bit
>> numbers are directly matching the GPIO offset/line numbers of the chip. But I
>> only used unsigned long, not arrays, so I thought I was limited to offset/line
>> 31 on 32bit arch, and 63 on 64bit arch.
>> As you suggested, I'm currently having a look to gpiod_get_array_value_complex()
>> but I must admit I'm currently a little bit lost. I've never thought GPIO
>> implementation could become so complex for my brain :-)
>>
>
> The bit of primary interest that I was referring to was the DECLARE_BITMAP()
> as used for the fastpath mask:
>
>                 DECLARE_BITMAP(fastpath_mask, FASTPATH_NGPIO);
>
> That does the sizing math for you.  In your case you would use 112 for
> the NGPIO.  There are also examples of using __set_bit() to set bits in
> the mask.  Take a look in linux/bitmaps.h and linux/bitops.h for the
> relevant definitions if you want to dig deeper.
>
> And, yeah, the amount of work that goes into just driving physical
> lines up and down, fundamentally just toggling bits, frequently makes my brain
> hurt too ;-).
>

Thanks very much for the tips !
I've added some debug in my GPIO chip driver in get_multiple()/set_multiple()
and clearly see that when using an unsigned long array for "mask" and "bits",
the second unsigned long in array is used starting from GPIO offset/line 64,
starting from bit 0, then 1 for offset/line 65...
For instance when I run "gpioget 0 65", get_multiple() is called with bit 1 of
mask[1] set and I return the level on bit 1 of bits[1] that is correctly
reported by gpioget.

But get_multiple is called by gpio_chip_get_multiple() than is called by
gpiod_get_array_value_complex() that is called either from 
 linehandle_ioctl() for GPIOHANDLE_GET_LINE_VALUES_IOCTL where we have DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
 linereq_get_values() for GPIO_V2_LINE_GET_VALUES_IOCTL  where we have DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
so both vals with 64bits (GPIOHANDLES_MAX=GPIO_V2_LINES_MAX=64) so only one unsigned long.
But vals is passed as last argument unsigned long *value_bitmap to
gpiod_get_array_value_complex() that is passed as last argument
unsigned long *bits to gpio_chip_get_multiple() that
is passed as last argument unsigned long *bits to get_multiple() of my driver
where I'm supposed to fill data in the second unsigned logn of array for GPIO
offset/line >= 64 where we have only allocated one.
I'm probably wrong somewhere.

> Cheers,
> Kent.
> .


