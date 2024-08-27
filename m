Return-Path: <linux-gpio+bounces-9215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD29609FA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 14:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B30501C21D59
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 12:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F5C17279C;
	Tue, 27 Aug 2024 12:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=digi.com header.i=@digi.com header.b="jk2kpFuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip8a.ess.barracuda.com (outbound-ip8a.ess.barracuda.com [209.222.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1A19D08C;
	Tue, 27 Aug 2024 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761424; cv=fail; b=gBvcwiDHszLuxsYzzRMcN8LdfamCx3uvbRK4hIjGjZ03G6DDOGFs1uvpqmpz+d7nhCejtPNZPEfPJ0uH1bP6Er3ara7J3trNjm3PHLjsGvR9e1nyHqz7euj3xqpdr7z0C4aHSMZaR8ue1Vd3L2Zko9kEps7oj71Jyc8N7yZGfoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761424; c=relaxed/simple;
	bh=qit22IIjR5/4zXd+IUmSD2sbPfONpJebZ3v/Igw0/Xc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=euPUegxd7bFA+HDCJDVaxZ87x1d1xbOMcDK5N8hWcXWPW7e+Los2SIckKP1/QSqn/Sx/mjAV1ut+qDb6mup3067wAbkxpahwVWnizpUki4Nu7HB91+gxUqyyr41ULHmen4dKiaqCKQu2tO11VcjXQO68GjwGTDFiIuBKFQVZfE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=fail (2048-bit key) header.d=digi.com header.i=@digi.com header.b=jk2kpFuZ reason="signature verification failed"; arc=fail smtp.client-ip=209.222.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101]) by mx-outbound40-68.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 27 Aug 2024 12:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu7eWXCJazWEIzZPENPO4PwXMkBhwlVF4NbY0+KMc42RoqHf1c69AUszec1x8Blv8ZVt4eJWsoG4DNt6+JX0c6TYLHdk+YL9xXrTor2fzyiChzgiFOVlWGpr8/8fgSfpj6472LjkidqomrUjpel+ulEmo+KDLw6zteqXofrlnAlYa11+0n6cYkHGIG2gju42UB5mttQ2Uh/F1wdL2dq639LZ1Y2rZdqLNB/YsO8RJQjtfN8Hbg0IKobSa12iFuizNktvwOi2qsdtUZZCUUon1xz6rYwXC+Mqm/KrBBjV6bw3C58gOvK7PQJ+xixrooV/bGHKLEjv71WuFGWp+9refQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itww0CwEAyyUVekuEyLDlioNKTuDMQ0CilKqFIJ+CDA=;
 b=BtUJ/3LMI1rP+Q747qkhUFnzAAN1jbxv5jhKAe5l6hOPw31WizXo5tIM33w0PZeLpJLWYEg8+8Ya3/ScLggscSqPz+UInib5MVTYjzVIiRgmMhh4AZ0Yqm59o558MEAfUwRYgeeIo5B2M/LRvBVD0+hq+R/Vxqo7uAnzQuwvk4quTWhHpEFMZikaKKh6Ip3GukoDLqtDoouS7lImvl5biioij8B+jJnQVDsvlX1xhxvSCS8v2dpiP1hzCuSrF4OadHL19d2+3EY2rcT9Y7/rbsUguR5JY0BVRR/TV1iPf6GDVZ8B4W3ntzQKlu2ttLA3z/1X91ECiBXViBDjmGW7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itww0CwEAyyUVekuEyLDlioNKTuDMQ0CilKqFIJ+CDA=;
 b=jk2kpFuZySUKhRogCOpAR9R2cJb1Umo5HQJbk23yRZ/mZs7ApQAAUS4T3Y1Ok2j/uuJxn3xgiRB627DCBr0xubZmZdvETob3nMFC1A530W53TcahcssSCTzi1IxOque5Z4oV8HGsdR2ViHXuw68XyJLaZNx5zAi08RFTVFDLfxtGk1uHSQswHcjcskaJK23vBgBaR5ZowRW1cd/xLDVUjtddsPqgQeglAueb6ya/4kH2ERxkc0z3eJBUOuiYEzBzQ34toPXSQk9EAKs2Feb4CVX7TdhlJwJ9DziBUtKh73kPoylvbWNEj93svqvP4GmLW3mguOuf1coMgGziOhpWKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 SJ0PR10MB5583.namprd10.prod.outlook.com (2603:10b6:a03:3df::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.14; Tue, 27 Aug 2024 12:23:12 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.017; Tue, 27 Aug 2024
 12:23:12 +0000
Date: Tue, 27 Aug 2024 22:23:01 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, 
    Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
    Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: ls1012a: Add pinctrl driver support
In-Reply-To: <12507116.O9o76ZdvQC@steina-w>
Message-ID: <3eb7bd2e-bb25-57b8-2ad3-f1fdfa25136f@digi.com>
References: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com> <12507116.O9o76ZdvQC@steina-w>
Organization: Opengear Digi
Content-Type: multipart/mixed; boundary="8323329-1884540092-1724761391=:3268661"
X-ClientProxiedBy: SY5P282CA0054.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20a::13) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|SJ0PR10MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: b532cb02-94f6-423f-39e7-08dcc69304b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?IfIP6jgQDB6PY5p1g3OESzSFzJNzY3/8xBsm5t5PJoHycVpNDsS4B/ylES?=
 =?iso-8859-1?Q?c0Ga+YNayhQjMT1ImJmkNHtU83AMe6sVNQ8AWuNjaZHmyL6Gq+F4UYH6vM?=
 =?iso-8859-1?Q?gBiei1XmrOPQg6T8sYK3BlpgjntqgECYgXjIgtVfTUc4T+X1riCX94rcJp?=
 =?iso-8859-1?Q?evkWc1ZMfH8NOc2HsK8Bc5vNLdZGnkYhAD0fYHO3JYx/InFB9HDo8/awmk?=
 =?iso-8859-1?Q?299i4XxnHA3gaxb+6jcgorKsjfxUWTwa+tjdKadvKLF74N7wnkozqdhwCc?=
 =?iso-8859-1?Q?eQKgC4NNI8uXlos0YGZSN395B5cirbF/S0CPxjKel19vNx39Jpbv5goS/i?=
 =?iso-8859-1?Q?6hva2emaz+zTeg+l+VB/ZbuQrI9Z/Yc4GQ6mBfVoBL3RGIkyoB2Qe/GXzY?=
 =?iso-8859-1?Q?g6OOIRBKNv890bxGQwt4K+9aMZ9WHQquSxwLJnN3K3bXljSwPwMUsEPs6I?=
 =?iso-8859-1?Q?lY6eTdNN8w8s89q2HHduL4EbxsNevjv6xQJBN4TQqdP5K17hqV1OrGOZVy?=
 =?iso-8859-1?Q?0CcYwzZs7AJlIqEi9ps/w7yaUFQPkP6WLkLkTKYfsYipqDaENrtu8Z+dAo?=
 =?iso-8859-1?Q?Dq6+bDGr2boHKiTbNwj6VR0CIj/wJpdigOnzeRTWEMu6FFqJCpCiz3GaCI?=
 =?iso-8859-1?Q?78HHMSUb1jr0vklRhPLZlWfm4rxq8Xu/Jqf6KgjgijgFoLTsqmqQmrLNmL?=
 =?iso-8859-1?Q?BxAxvwVZvXehMvPOowiAMXXtKXpS++e8orxEMoaIfSxdW5j5CGyervNw/n?=
 =?iso-8859-1?Q?ULlL0+f7JHD4QO0iP/BHeMJFwBI8q0J9YhGSmEi0FUYRLUPLIs86ie/dNJ?=
 =?iso-8859-1?Q?k/zviw4R102FlFzGXaaEO6kuk9siSuWv/qzhoTnjJu+fPZmZ6GFVDOJebC?=
 =?iso-8859-1?Q?V8CYuZ9W0eaxXwnYeF3/tyiqr9jdny/mwL6eP5NGrq3Bj8xsZNYkqLRL1E?=
 =?iso-8859-1?Q?AZVcSiTwzxClzJA4OJ8PNogUrJk8+lWeJxjzMegxBAqVpOkRU6qMnIT1jw?=
 =?iso-8859-1?Q?SD+mzwNE+kjGc1PleINH4vZspf00af0iiMuldQuKQ+ZGXTyCJQaLWjoE52?=
 =?iso-8859-1?Q?u37A1o17bL+Z1r/Z8dcf8arOUamDkwBRdnq5jlzz5cYWOm9BbEAXnblCZu?=
 =?iso-8859-1?Q?WVdpCO7I63L20UzDgr0tv69gmz/3qZ8MghKHlaEiUyot+bCF0jXCSRx87H?=
 =?iso-8859-1?Q?CDAoNNOryGoiHe73ou2s1ZQcunHSk15p9a+TA4afdv5GCG0cUGDb7CZIdn?=
 =?iso-8859-1?Q?QKnIouaQd7InhMFMwpTRuN8OrjiKiJYACXU8DaHIeso8Q96QsvvaaPXbFt?=
 =?iso-8859-1?Q?vF+64WKswcvITDY4ndDBOBkJnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pnn4QW0Tb23v1R5A/+EPA0GShpBh8QZrQ+Af8E7sw2/gjfA2HqNeZEYiUg?=
 =?iso-8859-1?Q?E/7ZXPzeHU+olFa0Uzsrc9L8o4SYRp3OsPyzi9tB23znSXH/z736VGTeZH?=
 =?iso-8859-1?Q?ai9MI1aARoxksrjSDad0aPuA4Q0G6rDR3n9jvrCKVUL1BNLGKg9MIF2EdZ?=
 =?iso-8859-1?Q?5ft5e963lr012vJwsuviKDgCANdahS5d5ZSY6TxXq3vu2qXjnJ8B1iaDuy?=
 =?iso-8859-1?Q?/Qo96T6Hk5y/c2Op7F7JjUVfOhvxakjkgdZL4KmFk/s8691LLVv/iaWeyI?=
 =?iso-8859-1?Q?DDjb/OtNK3IGwsf0KZePffo/LUx0O4Olo1qvdCeKgGv87nB6ZB+wgDlQk3?=
 =?iso-8859-1?Q?DhY32OPcRjngy8GroQRgsBLgE9vb91A80vKMdIYD/n+0G0pd7/v3iCqcgT?=
 =?iso-8859-1?Q?Om9YUJbJTXggH1e5ZjvId7xDpYAsS5FaMQT18Pj0GmI1P/hzxtqWifjVFj?=
 =?iso-8859-1?Q?PFkUwO+bd5WBWjz5NFFZKt4RsWAUsnCBaEPt60hA/S2tTX1Xig22cTLUkh?=
 =?iso-8859-1?Q?JPl5JPkboFdJHnS/+yU1HxFQyqU3cGNbjexh5Iqg7yCgo6iN6dLmEacIhy?=
 =?iso-8859-1?Q?4v57G972Nfu4p/SKWlDim9SugdHeW+Fn+VS8LxZOEq2Z0tTADQ42Xe1mF+?=
 =?iso-8859-1?Q?A+GqP6CIWpFOkDtrfsMoqvoJjutPzHeFX7qm1aVQHj0c/3baueU+pwIpH0?=
 =?iso-8859-1?Q?MZGZ+4jkR1L61r3Gx0PoPdLQZjig3mSN3uhDZ8fh2jWtqLHxVsEccYKwwe?=
 =?iso-8859-1?Q?dVuCyIoDkapioAuUlqEAPlxNMgGF+8M9mlA32IQ+lkMARlUzhmJ/lhhx43?=
 =?iso-8859-1?Q?dB99jWL8rAnnAbf51Hg2sllZ/l9gU4kvPhSNiHzlkBOUhUrVkeHbuApnIo?=
 =?iso-8859-1?Q?aa6bfxPlO1zNXnQtRXfIRNMx7jrNSMwapYuHKMYyMI6SDzP673+ySvsL+z?=
 =?iso-8859-1?Q?blGrKdvU34lF9DPGQRSHD3t/YdDlRCeaJouEzdqrzDn9IXgtU6iu5Paxak?=
 =?iso-8859-1?Q?UKkgT34PypXftdNLTi3m5ws1MSjyoCvTirC5aAqyqBIRyFpQpBfYuTbth7?=
 =?iso-8859-1?Q?3PttkYCLMpNWwS2MjKN0W7iBDVumE9G62EXOOGFZmP1VwcrNS04kFAQPih?=
 =?iso-8859-1?Q?9ak32UswnLtEn5VAFsrcpgXX0qx5DGsbK6Z6f9HQ2UtP9jyb07yNrCmgtg?=
 =?iso-8859-1?Q?8MEZLoIN9SSNDyy+Isaa1OZ9QFerlTplIvtmWet2OO9/MJLodonL8F08rJ?=
 =?iso-8859-1?Q?wZrK4nxowYIzFS1J/Vb0+6r0NNYtly4KI+A1TgjFbB3+KmoD6Q/Wk2gyGT?=
 =?iso-8859-1?Q?0B2nSVTZ1Mb1BEpoc1uXVBOZWChCpo008LMEfSKg9DuhvNmvt86AKodMso?=
 =?iso-8859-1?Q?yuqUZCXKXyHk32Wah9d1YBeIPIDn8aDAoelxUREcm6DIwlBfXhMKkkHIZC?=
 =?iso-8859-1?Q?AWiKsfwJnk7OwdoVHrzAau7eQGb8V+2oqiCPZO44PZY+ZrLzulNDl2SRHe?=
 =?iso-8859-1?Q?QUnA2xvoKZeMc3C892EhfRKtCcWFUOImY4ZWXqN1Myh/aR0ymXHauQNG6/?=
 =?iso-8859-1?Q?WD1XlSv20vW4z1L3RAyXP4cKcR36pAUcqNtKrnZ/3VJANsP0lxiAveRx15?=
 =?iso-8859-1?Q?RU8RRjQetBygTXCPQE4LaakMyCYvTgFfZstGPBDA/pJrrC8CuJSZhGvV9P?=
 =?iso-8859-1?Q?O2bKfVbGK1G9Znilm3jE+VSLKMvEu5u1ZVNCgwGp?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b532cb02-94f6-423f-39e7-08dcc69304b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 12:23:12.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbUnOJMO3pYpSfSx2VyN/KxY1w2zUwFB2Nww/dlncaUEBf/K49Tq+McwSiBWr5VmFlxJvA1Nq7UUDiTVIGFa9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5583
X-BESS-ID: 1724761395-110308-12744-1231-1
X-BESS-VER: 2019.1_20240823.2008
X-BESS-Apparent-Source-IP: 104.47.58.101
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoaWBmaWQGYGUDTNwNjY1CAxxd
	AwzdDYNNE4zTI5MSXNzDTVwijJ0iDJSKk2FgCvfj39QgAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258629 [from 
	cloudscan13-237.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

--8323329-1884540092-1724761391=:3268661
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 27 Aug 2024, Alexander Stein wrote:
> Am Dienstag, 27. August 2024, 04:05:24 CEST schrieb David Leonard:
>> Add QorIQ LS1012A pinctrl driver, allowing i2c-core to exert
>> GPIO control over the second I2C bus.
>
> Can you please elaborate? AFAIK the pinmuxing is set by the RCW on layerscape.
> How can you change the pinmuxing at runtime. How is this related to i2c
> controlling GPIO?

Sure. Two of the Layerscape SoCs have pinmux control registers that
override/extend the RCW configuration string.

These pinmux registers are not consistent across the family, only a
very few pins are muxable, and they're all related to I2C.

i2c-core has a bus recovery feature that relies on pinctrl to switch
the I2C pins into GPIO mode.

Our motivating case is efficient use of the Atmel ATECCx08 crypto
processor. It has a peculiar requirement that SDA be held low for a
certain amount of time. That kind of control also needs the pins in
GPIO mode.

>> Signed-off-by: David Leonard <David.Leonard@digi.com>
>> ---
>>   drivers/pinctrl/freescale/Kconfig           |   8 +
>>   drivers/pinctrl/freescale/Makefile          |   1 +
>>   drivers/pinctrl/freescale/pinctrl-ls1012a.c | 381 ++++++++++++++++++++
>>   3 files changed, 390 insertions(+)
>>   create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1012a.c
>>
>> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
>> index 3b59d7189004..a2038042eeae 100644
>> --- a/drivers/pinctrl/freescale/Kconfig
>> +++ b/drivers/pinctrl/freescale/Kconfig
>> @@ -209,6 +209,14 @@ config PINCTRL_IMX93
>>       help
>>         Say Y here to enable the imx93 pinctrl driver
>>
>> +config PINCTRL_LS1012A
>> +     tristate "LS1012A pinctrl driver"
>> +     depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
>> +     select PINMUX
>> +     select GENERIC_PINCONF
>> +     help
>> +       Say Y here to enable the ls1012a pinctrl driver
>> +
>>   config PINCTRL_VF610
>>       bool "Freescale Vybrid VF610 pinctrl driver"
>>       depends on SOC_VF610
>> diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
>> index d27085c2b4c4..6926529d8635 100644
>> --- a/drivers/pinctrl/freescale/Makefile
>> +++ b/drivers/pinctrl/freescale/Makefile
>> @@ -35,3 +35,4 @@ obj-$(CONFIG_PINCTRL_IMX25) += pinctrl-imx25.o
>>   obj-$(CONFIG_PINCTRL_IMX28) += pinctrl-imx28.o
>>   obj-$(CONFIG_PINCTRL_IMXRT1050)     += pinctrl-imxrt1050.o
>>   obj-$(CONFIG_PINCTRL_IMXRT1170)     += pinctrl-imxrt1170.o
>> +obj-$(CONFIG_PINCTRL_LS1012A)        += pinctrl-ls1012a.o
>> diff --git a/drivers/pinctrl/freescale/pinctrl-ls1012a.c b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
>> new file mode 100644
>> index 000000000000..d4c535ed6c07
>> --- /dev/null
>> +++ b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
>> @@ -0,0 +1,381 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Pin controller for NXP QorIQ LS1012A.
>> + *
>> + * Copyright (c) 2024 Digi International, Inc.
>> + * Author: David Leonard <David.Leonard@digi.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/of.h>
>> +#include <linux/io.h>
>> +#include <linux/regmap.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/sys_soc.h>
>> +
>> +struct ls1012a_pinctrl_pdata {
>> +     struct pinctrl_dev *pctl_dev;
>> +     void __iomem *cr0mem;
>> +     bool big_endian;
>> +     u32 ssc;
>> +};
>> +
>> +/* Bitfield macros for masks and values that follow the datasheet's
>> + * bit numbering schemes for registers of different bit-endianess. */
>> +#define BITV_BE(hi, v)       ((v) << (31 - (hi) % 32))
>> +#define BITM_BE(hi, lo)      (((1 << ((hi) - (lo) + 1)) - 1) << (31 - (hi) % 32))
>> +#define BITV_LE(lo, v)       ((v) << ((lo) % 32))
>> +#define BITM_LE(lo, hi)      (((1 << ((hi) - (lo) + 1)) - 1) << ((lo) % 32))
>> +
>> +/* SCFG PMUXCR0 pinmux control register */
>> +#define SCFG_PMUXCR0                 0x430
>> +#define QSPI_MUX_OVRD_MASK           BITM_BE(0, 0)   /* [0] */
>> +#define QSPI_MUX_DISABLE             BITV_BE(0, 0)   /*  use RCW */
>> +#define QSPI_MUX_ENABLE                      BITV_BE(0, 1)   /*  use PMUXCR0 */
>> +#define QSPI_DATA0_GPIO_OVR_MASK     BITM_BE(1, 1)   /* [1] */
>> +#define QSPI_DATA0_GPIO_SEL_SPI              BITV_BE(1, 0)   /*  DATA0,SCK,CS0 */
>> +#define QSPI_DATA0_GPIO_SEL_GPIO     BITV_BE(1, 1)   /*  GPIO1[4,11,5] */
>> +#define QSPI_DATA1_GPIO_OVR_MASK     BITM_BE(3, 2)   /* [3:2] */
>> +#define QSPI_DATA1_GPIO_SEL_SPI              BITV_BE(3, 0)   /*  DATA1 */
>> +#define QSPI_DATA1_GPIO_SEL_GPIO     BITV_BE(3, 1)   /*  GPIO1[12] */
>> +#define QSPI_IIC2_OVR_MASK           BITM_BE(5, 4)   /* [5:4] */
>> +#define QSPI_IIC2_SEL_GPIO           BITV_BE(5, 0)   /*  GPIO1[13,14] */
>> +#define QSPI_IIC2_SEL_I2C            BITV_BE(5, 1)   /*  SCL,SDA (rev0) */
>> +#define QSPI_IIC2_SEL_SPI            BITV_BE(5, 2)   /*  DATA2,DATA3 */
>> +
>> +/* RCW SoC-specific configuration (read-only) */
>> +#define DCFG_RCWSR                   0x100
>> +#define SOC_SPEC_CONFIG                      416             /* word 13 */
>> +#define DCFG_SSC_REG                 (DCFG_RCWSR + SOC_SPEC_CONFIG / 8)
>> +#define SSC_DATA0_GPIO_MASK          BITM_LE(421, 421)
>> +#define SSC_DATA0_GPIO_SEL_SPI               BITV_LE(421, 0) /*  DATA0,SCK,CS0 */
>> +#define SSC_DATA0_GPIO_SEL_GPIO              BITV_LE(421, 1) /*  GPIO1[11,4,5] */
>> +#define SSC_DATA1_GPIO_MASK          BITM_LE(422, 423)
>> +#define SSC_DATA1_GPIO_SEL_SPI               BITV_LE(422, 0) /*  DATA1 */
>> +#define SSC_DATA1_GPIO_SEL_GPIO              BITV_LE(422, 2) /*  GPIO1[12] */
>> +#define SSC_IIC2_MASK                        BITM_LE(424, 425)
>> +#define SSC_IIC2_SEL_GPIO            BITV_LE(424, 0) /*  GPIO1[13,14] */
>> +#define SSC_IIC2_SEL_I2C             BITV_LE(424, 2) /*  SCL,SDA */
>> +#define SSC_IIC2_SEL_SPI             BITV_LE(424, 1) /*  DATA2,DATA3 */
>> +#define SSC_IIC2_SEL_GPIO_RESET              BITV_LE(424, 3) /*  GPIO1[13],RESET_REQ_B*/
>> +
>> +const struct pinctrl_pin_desc ls1012a_pins[] = {
>> +     PINCTRL_PIN(60, "QSPI_A_DATA3/GPIO1_14/IIC2_SDA/RESET_REQ_B"),
>> +     PINCTRL_PIN(61, "QSPI_A_DATA1/GPIO1_12"),
>> +     PINCTRL_PIN(62, "QSPI_A_SCK/GPIO1_04"),
>> +     PINCTRL_PIN(122, "QSPI_A_DATA2/GPIO1_13/IIC2_SCL"),
>> +     PINCTRL_PIN(123, "QSPI_A_DATA0/GPIO1_11"),
>> +     PINCTRL_PIN(124, "QSPI_A_CS0/GPIO1_05"),
>> +};
>> +
>> +static const unsigned int qspi_1_grp[] = { 62, 123, 124 };
>> +static const unsigned int qspi_2_grp[] = { 61 };
>> +static const unsigned int qspi_3_grp[] = { 122, 60 };
>> +
>> +#define GRP_qspi_1   0       /* SCK,CS0,DATA0 */
>> +#define GRP_qspi_2   1       /* DATA1 */
>> +#define GRP_qspi_3   2       /* DATA2,DATA3 */
>> +#define _GRP_max     3
>> +
>> +#define _PINGROUP(name) \
>> +     [GRP_##name] = PINCTRL_PINGROUP(#name "_grp", name##_grp, ARRAY_SIZE(name##_grp))
>> +static const struct pingroup ls1012a_groups[] = {
>> +     _PINGROUP(qspi_1),
>> +     _PINGROUP(qspi_2),
>> +     _PINGROUP(qspi_3),
>> +};
>> +
>> +
>> +static void ls1012a_write_cr0(struct ls1012a_pinctrl_pdata *pd, u32 val)
>> +{
>> +     if (pd->big_endian)
>> +             iowrite32be(val, pd->cr0mem);
>> +     else
>> +             iowrite32(val, pd->cr0mem);
>> +}
>> +
>> +static u32 ls1012a_read_cr0(struct ls1012a_pinctrl_pdata *pd)
>> +{
>> +     return pd->big_endian ? ioread32be(pd->cr0mem) : ioread32(pd->cr0mem);
>> +}
>> +
>> +static int ls1012a_get_groups_count(struct pinctrl_dev *pcdev)
>> +{
>> +     return ARRAY_SIZE(ls1012a_groups);
>> +}
>> +
>> +static const char *ls1012a_get_group_name(struct pinctrl_dev *pcdev,
>> +     unsigned int selector)
>> +{
>> +     return ls1012a_groups[selector].name;
>> +}
>> +
>> +static int ls1012a_get_group_pins(struct pinctrl_dev *pcdev,
>> +     unsigned int selector, const unsigned int **pins, unsigned int *npins)
>> +{
>> +     *pins = ls1012a_groups[selector].pins;
>> +     *npins = ls1012a_groups[selector].npins;
>> +     return 0;
>> +}
>> +
>> +static const struct pinctrl_ops ls1012a_pinctrl_ops = {
>> +     .get_groups_count = ls1012a_get_groups_count,
>> +     .get_group_name = ls1012a_get_group_name,
>> +     .get_group_pins = ls1012a_get_group_pins,
>> +     .dt_node_to_map = pinconf_generic_dt_node_to_map_group,
>> +     .dt_free_map = pinconf_generic_dt_free_map,
>> +};
>> +
>> +static const char * const i2c_groups[] = { "qspi_3_grp" };
>> +static const char * const spi_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
>> +static const char * const gpio_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
>> +static const char * const gpio_reset_groups[] = { "qspi_3_grp" };
>> +
>> +#define FUNC_i2c     0
>> +#define FUNC_spi     1
>> +#define FUNC_gpio    2
>> +#define FUNC_gpio_reset 3
>> +#define _FUNC_max    4
>> +
>> +#define _PINFUNC(name) \
>> +     [FUNC_##name] = PINCTRL_PINFUNCTION(#name, name##_groups, ARRAY_SIZE(name##_groups))
>> +static const struct pinfunction ls1012a_functions[] = {
>> +     _PINFUNC(i2c),
>> +     _PINFUNC(spi),
>> +     _PINFUNC(gpio),
>> +     _PINFUNC(gpio_reset),
>> +};
>> +
>> +static int ls1012a_get_functions_count(struct pinctrl_dev *pctldev)
>> +{
>> +     return ARRAY_SIZE(ls1012a_functions);
>> +}
>> +
>> +static const char *ls1012a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
>> +{
>> +     return ls1012a_functions[func].name;
>> +}
>> +
>> +static int ls1012a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
>> +     const char * const **groups,
>> +     unsigned int * const ngroups)
>> +{
>> +     *groups = ls1012a_functions[func].groups;
>> +     *ngroups = ls1012a_functions[func].ngroups;
>> +     return 0;
>> +}
>> +
>> +/*
>> + * LS1012A
>> + *    Group: qspi_1             qspi_2      qspi_3
>> + *           ================== =========== =============
>> + *    Pin:   62    123    124   61          122    60
>> + *           ----- ------ ----- ----------- ------ ------
>> + * i2c                                      SCL    SDA    (RCW only)
>> + * spi       SCK   DATA0
>> + * spi       SCK   DATA0        DATA1
>> + * spi       SCK   DATA0        DATA1       DATA2  DATA3
>> + * gpio      GPIO4 GPIO11 GPIO5
>> + * gpio                         GPIO12
>> + * gpio                                     GPIO13 GPIO14
>> + * gpio_reset                               GPIO13 REQ_B  (RCW only)
>> + */
>> +
>> +static const struct ls1012a_func_mux {
>> +     u32 cr0mask, cr0; /* mux control */
>> +     u32 sscmask, ssc; /* equivalent in RCW */
>> +} ls1012a_func_mux[_FUNC_max][_GRP_max] = {
>> +     [FUNC_i2c] = {
>> +             [GRP_qspi_3] = {
>> +                     .sscmask = SSC_IIC2_MASK,
>> +                     .ssc =     SSC_IIC2_SEL_I2C,
>> +             },
>> +     },
>> +     [FUNC_spi] = {
>> +             [GRP_qspi_1] = {
>> +                     .cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
>> +                     .cr0 =     QSPI_DATA0_GPIO_SEL_SPI,
>> +                     .sscmask = SSC_DATA0_GPIO_MASK,
>> +                     .ssc =     SSC_DATA0_GPIO_SEL_SPI
>> +             },
>> +             [GRP_qspi_2] = {
>> +                     .cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
>> +                     .cr0 =     QSPI_DATA1_GPIO_SEL_SPI,
>> +                     .sscmask = SSC_DATA1_GPIO_MASK,
>> +                     .ssc =     SSC_DATA1_GPIO_SEL_SPI,
>> +             },
>> +             [GRP_qspi_3] = {
>> +                     .cr0mask = QSPI_IIC2_OVR_MASK,
>> +                     .cr0 =     QSPI_IIC2_SEL_SPI,
>> +                     .sscmask = SSC_IIC2_MASK,
>> +                     .ssc =     SSC_IIC2_SEL_SPI,
>> +             },
>> +     },
>> +     [FUNC_gpio] = {
>> +             [GRP_qspi_1] = {
>> +                     .cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
>> +                     .cr0 =     QSPI_DATA0_GPIO_SEL_GPIO,
>> +                     .sscmask = SSC_DATA0_GPIO_MASK,
>> +                     .ssc =     SSC_DATA0_GPIO_SEL_GPIO,
>> +             },
>> +             [GRP_qspi_2] = {
>> +                     .cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
>> +                     .cr0 =     QSPI_DATA1_GPIO_SEL_GPIO,
>> +                     .sscmask = SSC_DATA1_GPIO_MASK,
>> +                     .ssc =     SSC_DATA1_GPIO_SEL_GPIO,
>> +             },
>> +             [GRP_qspi_3] = {
>> +                     .cr0mask = QSPI_IIC2_OVR_MASK,
>> +                     .cr0 =     QSPI_IIC2_SEL_GPIO,
>> +                     .sscmask = SSC_IIC2_MASK,
>> +                     .ssc =     SSC_IIC2_SEL_GPIO,
>> +             },
>> +     },
>> +     [FUNC_gpio_reset] = {
>> +             [GRP_qspi_3] = {
>> +                     .sscmask = SSC_IIC2_MASK,
>> +                     .ssc =     SSC_IIC2_SEL_GPIO_RESET,
>> +             },
>> +     },
>> +};
>> +
>> +static int ls1012a_set_mux(struct pinctrl_dev *pcdev,
>> +     unsigned int func, unsigned int group)
>> +{
>> +     struct ls1012a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
>> +     const struct ls1012a_func_mux *fm = &ls1012a_func_mux[func][group];
>> +     u32 cr0 = ls1012a_read_cr0(pd);
>> +
>> +     if (!fm->cr0mask) {
>> +             if ((pd->ssc & fm->sscmask) != fm->ssc)
>> +                     return -EOPNOTSUPP;
>> +             cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_DISABLE;
>> +     } else {
>> +             cr0 = (cr0 & ~fm->cr0mask) | fm->cr0;
>> +             if ((pd->ssc & fm->sscmask) != fm->ssc)
>> +                     cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_ENABLE;
>> +     }
>> +     ls1012a_write_cr0(pd, cr0);
>> +     return 0;
>> +}
>> +
>> +static void ls1012a_init_mux(struct ls1012a_pinctrl_pdata *pd)
>> +{
>> +     unsigned int func, group;
>> +     const struct ls1012a_func_mux *fm;
>> +     u32 cr0;
>> +
>> +     cr0 = ls1012a_read_cr0(pd);
>> +     if ((cr0 & QSPI_MUX_OVRD_MASK) == QSPI_MUX_DISABLE) {
>> +             /*
>> +              * Prepare a disabled MUXCR0 to have a same/similar
>> +              * configuration as RCW SSC, and leave it disabled.
>> +              */
>> +             for (func = 0; func < _FUNC_max; func++) {
>> +                     for (group = 0; group < _GRP_max; group++) {
>> +                             fm = &ls1012a_func_mux[func][group];
>> +                             if (fm->sscmask &&
>> +                                 fm->ssc == (pd->ssc & fm->sscmask)) {
>> +                                     cr0 &= ~fm->cr0mask;
>> +                                     cr0 |= fm->cr0;
>> +                             }
>> +                     }
>> +             }
>> +             ls1012a_write_cr0(pd, cr0);
>> +     }
>> +}
>> +
>> +static const struct pinmux_ops ls1012a_pinmux_ops = {
>> +     .get_functions_count = ls1012a_get_functions_count,
>> +     .get_function_name = ls1012a_get_function_name,
>> +     .get_function_groups = ls1012a_get_function_groups,
>> +     .set_mux = ls1012a_set_mux,
>> +};
>> +
>> +static struct pinctrl_desc ls1012a_pinctrl_desc = {
>> +     .name = "ls1012a",
>> +     .pins = ls1012a_pins,
>> +     .npins = ARRAY_SIZE(ls1012a_pins),
>> +     .pctlops = &ls1012a_pinctrl_ops,
>> +     .pmxops = &ls1012a_pinmux_ops,
>> +     .owner = THIS_MODULE,
>> +};
>> +
>> +static int ls1012a_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +     struct ls1012a_pinctrl_pdata *pd;
>> +     int ret;
>> +     u32 dcfg_ssc;
>> +     struct regmap *dcfg_regmap;
>> +
>> +     pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
>> +     if (!pd)
>> +             return -ENOMEM;
>> +     platform_set_drvdata(pdev, pd);
>> +
>> +     pd->big_endian = device_is_big_endian(&pdev->dev);
>> +
>> +     /* SCFG PMUX0 */
>> +     pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(pd->cr0mem))
>> +             return PTR_ERR(pd->cr0mem);
>> +     dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
>> +             pd->big_endian ? "be" : "le");
>> +
>> +     /* DCFG RCW SSC */
>> +     dcfg_regmap = syscon_regmap_lookup_by_phandle(
>> +             dev_of_node(&pdev->dev), "dcfg-regmap");
>> +     if (IS_ERR(dcfg_regmap)) {
>> +             dev_err(&pdev->dev, "dcfg regmap: %pe\n", dcfg_regmap);
>> +             return -EINVAL;
>> +     }
>> +     ret = regmap_read(dcfg_regmap, DCFG_SSC_REG, &dcfg_ssc);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "dcfg-regmap read: %d\n", ret);
>> +             return ret;
>> +     }
>> +     pd->ssc = swab32(dcfg_ssc); /* untwist RCW fields */
>> +
>> +     dev_dbg(&pdev->dev, "dcfg ssc = %08x (grp1=%s grp2=%s grp3=%s)\n",
>> +             pd->ssc,
>> +             (pd->ssc & SSC_DATA0_GPIO_MASK) == SSC_DATA0_GPIO_SEL_SPI ? "spi" : "gpio",
>> +             (pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_SPI ? "spi"
>> +             : (pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_GPIO ? "gpio"
>> +             : (pd->ssc & SSC_DATA1_GPIO_MASK) == 0x80 ? "10" : "11",
>> +             (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_GPIO ? "gpio"
>> +             : (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_I2C ? "i2c"
>> +             : (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_SPI ? "spi"
>> +             : "gpio+reset");
>> +
>> +     ls1012a_init_mux(pd);
>> +
>> +     ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1012a_pinctrl_desc,
>> +             pd, &pd->pctl_dev);
>> +     if (ret)
>> +             return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
>> +
>> +     pinctrl_enable(pd->pctl_dev);
>> +     return ret;
>> +}
>> +
>> +static const struct of_device_id ls1012a_pinctrl_match_table[] = {
>> +     { .compatible = "fsl,ls1012a-pinctrl" },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct platform_driver ls1012a_pinctrl_driver = {
>> +     .driver = {
>> +             .name = "ls1012a_pinctrl",
>> +             .of_match_table = ls1012a_pinctrl_match_table,
>> +     },
>> +     .probe = ls1012a_pinctrl_probe,
>> +};
>> +
>> +builtin_platform_driver(ls1012a_pinctrl_driver)
>> +
>> +MODULE_DESCRIPTION("LS1012A pinctrl driver");
>> +MODULE_LICENSE("GPL");
>>
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://linkprotect.cudasvc.com/url?a=http%3a%2f%2fwww.tq-group.com%2f&c=E,1,cVMx__vg5fEF9T8hc39kPIKQSP2rTuv_7tLSPVEOmXyD87IrvYM0OP8NYwIfDnnSUGCAVzkTBOPCUCOCeZryyztWlYAicjWaEwH2S14xgFbq58j7P7TreOLl&typo=1
>
>
>
--8323329-1884540092-1724761391=:3268661--

