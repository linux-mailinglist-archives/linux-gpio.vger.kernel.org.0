Return-Path: <linux-gpio+bounces-8888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC5958F68
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 23:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88618B22A90
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 21:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3821C4621;
	Tue, 20 Aug 2024 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gVrlAFx8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A349626
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187881; cv=fail; b=aoFwYltcj5N60n5TNrm0bhEjAsCkvzVd5F1GrFKWecZmi08dkFg291tK+HITHYwSSLo3u/5dEb12azYhRZ/rFYy+SSqtSwvZjSoliWI1w4wkd23JrEPBeaXY1KO1QnCt3UK+z/9/3IIY5C0L7TXWkTQIESCEm6AS1V72VGdEp6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187881; c=relaxed/simple;
	bh=LNekNXTEgg8lY1Ev8994WE2AC/qQIWlGdpuE6/U2SUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YzDnbHxlAmlXJn5z0zMLWt7nxarAmkXJrF8/3jcLGaiwNnSpA3KFKI3leZQu2jjufTYsUK47OEENba5Hv8stK4MX4nVsVPMOANYasZnMalb/kb4Qy7x6DqbgHv1XMnD+gfcPFqhs9cH94nk7lGUeO/zaOx+9oVav1nvlT3hbEC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gVrlAFx8; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9wuKvj/B8mUMkwoDZI3t6h9Yze80oy0SUCyds0l4I9KPJWKSsVFPmCMB6vJFf4KPAdBMyotTclmWZcyW/Cyify/mW4YZImlhgOnTeMXubdQ4apgi5ELJkdCnLphorpMqyfNL4zh8p1am37B/gqun95Nf3zMXyYKslMA5jPndrXKxNfn831LcEfIEtiSG20s+BrAVTDrnfWyvs9ZO5wPSQ17htKDuu9cKoKFbSPMyqPdbV8lEQdccYzaO7SHrlkDhV1k6X6s+EDjRkE9DeD2zPg261CcWdbTg2Key31ipCEFA0hcLkTCHFm1TMV7dcN0R3gqrS1HBGh4rIvL07TQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmquVPYksJ5Wuix+af85174R+RF1I0hWZGO8Gt+Vsgs=;
 b=HU1F5TG0GHge88qsdST4ZuvwTJbAhSH2CwEPG+0oHxwidwWFZTrPr+jcpcBJAoV+QAApRY7G/QddyHrJ+zwKFLfcP5cLrXtIcDMh1ZxN05zgBHaGsXk6vDxKRt0h/y0n6nIYUt5ZSGWAEySE06nLy86N6JDTycZG7+aEyqkhLjd7q94ydayHAvCzZZt3Ox60D1Y271gZ5nlKJeKmaGLzlF+nUaGtXTcb7hQ94QeTuZlvOk8GcHyr1NqAp7JRkom51s59arxLhHuadptnUhiaVz+hPEvV7YdeYbmmRlGFWEAGd7ZEJzVcojyPMx162fSdy5IkixMLj9yayk3GLTMqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmquVPYksJ5Wuix+af85174R+RF1I0hWZGO8Gt+Vsgs=;
 b=gVrlAFx88UgT/zQeXxVREm4+9YYr4QODUIs979SmzGrT8HsayxZTVpXI2O2shZ1eapU9AsxD0yRXQeNo+NuqGgwQeJFFBrXtKQincgurWggAcBkXiKvwXsF3rQGvG6g2DW0mtc8X+aZO+nLU4PHUfJ2hBtnGjTWsyQ2cej0/N5in+7zdrtOhsBYkrNJNFHtaG5/f/UkGxqmosGMcAZlQHoc8zFTTsIZMi7duNtjcsOD4hAbvWXhK5VSBUiY8OpSKTtb7UDG/LN6ekX1zhGJ5wBM7c6evMY9zcWG3UvrxC21DqjcoTNk6E4dd2QpquqpHYtWr/9Xyg3et3Q8h87ZQQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9021.eurprd04.prod.outlook.com (2603:10a6:102:217::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 21:04:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 21:04:35 +0000
Date: Tue, 20 Aug 2024 17:04:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Subject: Re: pca953x: Probing too early
Message-ID: <ZsUE3DXG9Ryo0ylT@lizhi-Precision-Tower-5810>
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810>
 <CAOMZO5DLBUwbXukzVJBZx4iOTAR3seX8m6Wdj+a8u_ixvBwkDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DLBUwbXukzVJBZx4iOTAR3seX8m6Wdj+a8u_ixvBwkDA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 913b9648-32c6-4f6a-bb34-08dcc15bb247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHRKSk1KOUZJTU8yUjJMUG1NWE9BbHdFS2dwQ2R0S0xvRnJkSkE3cnVyQjFR?=
 =?utf-8?B?SzlMSTFtZ1pQbHFRVmx0clZJYTFWVlpKVGdrdVpsVXRoQUpLK1NaUC9pWVZB?=
 =?utf-8?B?dkdYS2RqZ2Y4dTAwYkh0N1JxU3FJdFYwZGJXcUFZZWdEWm1aT1VXbmw2bTFY?=
 =?utf-8?B?dTFTQ3ZpaUpQN256WDQ5dU5NNlZKemlCeWtsWjl2akxZSWdpMWI4YTNVV0x4?=
 =?utf-8?B?N2w5bEt2amVDRmtzS0RzZSs4aG84SStHNXJadlRySjhobWw0UU9NelJaL3pV?=
 =?utf-8?B?Mk0wZ01yUnBVNzA5aWRGcHJySFNueHhFY2lNT3YzYnBYand6R29zT3BnQXJE?=
 =?utf-8?B?SklSak8wODkrNkRZQ2RMRUJSYk10MXA2UnI2N2pQUjhoNHA5YUlaOEhiTk8y?=
 =?utf-8?B?U0RFVlNUeCtERG1BdFpCZGN2WmNXaVdtZExDVm9QRXJteDVleFRoSXdIZUgz?=
 =?utf-8?B?V2dSeEFndWIwV294UndTY1ZDeHV1QlRwS05wNmpvWHhPaWNTSVFhaHJnSERt?=
 =?utf-8?B?K25iK0wrR0tISS9BckgzcHNDcjNPSnBlSzEyU0EzVWNycVo4bTFwbHNBSUFK?=
 =?utf-8?B?V3RCczhuVkZDNlc5azF1aTVEM0R6OWEvYmVUdy9rbk1tcCs2V2lPVDR0WWIw?=
 =?utf-8?B?K1kxa1RRTUhTY3RyY1o0MU1saDFQM25vakVac203RVFzUHNoWEpBY1hHTFdj?=
 =?utf-8?B?eHlyWUZkK29VZjZNNCttcFo3QUhMcE9RS2N6bk1PbE1rOGNCOC9laVdqdWxo?=
 =?utf-8?B?WDhqRVFlM3c5dU8zTDJjdWI2YzNkaUxFbWtCdjhBZEJqdHp6K0RTRXJpTW1K?=
 =?utf-8?B?SnhOa2R5NHNzZmtxZ2laR01NK3VQeFJzMSt6L0lGSzFQcUlBWVF6ZGFPcURn?=
 =?utf-8?B?citDWmNuUHE4UFJvN1hCM2F4YkJEM2VoRzBYemRUejdlUG5DYXRCNmZIRUhx?=
 =?utf-8?B?MGQrTDViQ29HbmdUTDFpNHh0NHAvTE5wK1MxMVY2eVZ3WlZzbUtDRkxLbUpT?=
 =?utf-8?B?eWZTQUQzc1hqKzkrTUhCK1BSZmVVUWtTQkU1YlYxVEI1Zk5LNFBzOWFlamVH?=
 =?utf-8?B?UGExNE1uQUZNY3lzUG10eWcya0dTcmtsd0t4cHJaa3AzeTlyTFBzVkpiYWNR?=
 =?utf-8?B?d1lzOCsrakRtUWMxN0NpVldQd29WMnRIUWJHMXZsY09jeTBSUVRoZFNYVHQ5?=
 =?utf-8?B?MXJjVWlObGswVFJmWXc5eTFRZ3VNL20zbU8xNGtkZlIzVlYrYXFQSFo3VTl4?=
 =?utf-8?B?bG9OYXhJZmJHTVNyYlBqbHhIZk5RdDYxYUE4VTBlSU5ReXBCbUpTelNCV1pW?=
 =?utf-8?B?dUlTazNLUGd4UFdFaVR5T2F5VE8wbm5tNUpQZ0NCQjh1MkdaYnYva1FLdTRa?=
 =?utf-8?B?TUtZVE8rSGdkRDdSS2lZZDFwQXRiNTdhc2xhS2cyYmJPWDloZkViL29MOFhT?=
 =?utf-8?B?OXdoN0hGeWxwUmpIN3dUc2xic21vTEFLeWVoaFRjOTlLanVXZnFORis0U2p3?=
 =?utf-8?B?V2Z6bkNIOTY5YXZ0RlFvU0JxTWpRb0ZtNUMvb1RHeDNaYitoMnpLRnVRd3Vh?=
 =?utf-8?B?Y3NzeUZVT3Y2cXZKSi9jcDI4SnNCTm94ZmQ1dnBKeUt5Ukd3MTZVMVBDOWh5?=
 =?utf-8?B?MGMzSkwwYWdFdW1scVZlQ3U4MGVMcTNENkNhaFBjSW12akZiWVVtQTZBcGla?=
 =?utf-8?B?bDgrUWt3OG53dC82TjhESTQxdmpxYUZMYXNWemdtZWFvY1U1OUc0VUl3Rmsr?=
 =?utf-8?B?OTlvQ2wzMndJdFBkYnkrSGJpNnhFMW5sdnRWV3VHMDBOU3hONzl3RHZYc2w3?=
 =?utf-8?B?WWdob2l5UHErRE5FcjBvb1hYQ0tzVTlMR25ROFRId2d3elJRM1VoUDJjRGR1?=
 =?utf-8?B?NnhiZkVyNGQrRlkvbVViazhlWGp6MHNHY01KOC9qL2lpc0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXo1dUpydG5oTERUYXdkeVlWZnVWR1BkN3orUGF3OTFsdUpDSzV1YW5YaTVD?=
 =?utf-8?B?SE1CU212SHJYVEg0bzducEZ1dkgyR1pCckhBNWo5cy9aZHNweU9DMXE2K3pK?=
 =?utf-8?B?NGpFc3BqNTRQZW9uWko0MVFBY1ppVXRhcXc0RmZKWjVmaDkrcnpEeDRpQnZN?=
 =?utf-8?B?cS95MGlDN3RSR2RTNHYxVTNwZFFza0R5dzRTNHlCMUxYdll5MDEvbHVRY25B?=
 =?utf-8?B?bVdlenI0TTROTGwzaVQxdnRrZ1g3UXJ5VGwzZVVOaVFJMzUvRFZVVnpIckph?=
 =?utf-8?B?N3NYbXVrTFF5Rnp3cUE5SWR6RlpnY2hZYWtrNmY3SWJNczRrVnIrYUttQ2pm?=
 =?utf-8?B?VjZRTVhUWmlBUVRDYUVUN3Jadk9xRVJpcHBYRmdJSTJ0VGt2cUsrTGdxMi9Z?=
 =?utf-8?B?MXk5bnNuUG94eC9hUVJreHBQY3hmR1pscmkrU0V5Y2lmRnN1cmMveVl4WU5Q?=
 =?utf-8?B?WGVaZHd1QjVaQ0NTT0tDd3l3R2VVWWtPSkphNEZBSTh0cVU1NmwvS0h0eUJW?=
 =?utf-8?B?VFlnZ1pQU3hZRHZCZzQ4SEc0TGQ4aWtEMTJkU05NZE5jYzRycUZUN0xDbmxH?=
 =?utf-8?B?TEROaHd3VnpUaTZXdDJpUVZJUjJ4VkkvOFdrQ0s3VVA1YWhmM1huN3h1SVBP?=
 =?utf-8?B?Z2d6VTZJUWNkejRHZWFISUUrcUF2eFB5d0ZJNWNjdnRmaFlFSXdVUG9FdURJ?=
 =?utf-8?B?M0hNb0ViUnMvaExjZ2h3L0FnZEx5QUowaG4zQkl3aFpUUzVLQTljRWMzamZs?=
 =?utf-8?B?bUNHUzJBN0ZGbC9vTU5KZ01aWkNQK3haa1o5alk5YnNrallRdnRJWnpBdG5k?=
 =?utf-8?B?TmVhSktueGx5Rk9Rd2Fna1FEMmR1anJYOTNZOFZTZXFkQWhsUVdrWU5HVzJs?=
 =?utf-8?B?VVpveDNGLy9LYmVsa0d2bVNGcVlORGxqTzNZR3FIRGJOQkNsYlBIRGZIQ29F?=
 =?utf-8?B?Tm9jeEpwalZWRUxDVGdma2Z6SDQvdTMwQWVGZVM3eFErVXowVGhVbUlpc205?=
 =?utf-8?B?ZGxRQ3FCUUZsYlRNOXkrZERuNlR6RE5uZGZrdlhQeDZXdmcya3Y1SmdwRUgx?=
 =?utf-8?B?eTd6QjdncERXU3phS25veEllRXVnY1JKRnlRKzNGbzY0eG94bjJhNFlkWFNP?=
 =?utf-8?B?ekFTTFF1ekJibmJCd09jNXNVV2VUTit1aVV5VUNsQnE5eDhXMW5xUkhXdUgz?=
 =?utf-8?B?SVAxR3hpMHc5VmdMNFQ0ZG9VUW9OYU5MMEhNRnlWNmRwc09XMEM5SXdxMlVy?=
 =?utf-8?B?SE5BL0xxUGg5WHhYTDBCQW51K1RkYkg2S3lxeCsxNW8wUFgxRzBZWUdBaks4?=
 =?utf-8?B?NWdDRTI3TkhiYXNHMDlZc2FLMHQ5bXp5azBseUwzQzVkZFEwNHJtVytEa01v?=
 =?utf-8?B?QlArNnZYRS9vaFRON0dGalU1UmlzU0xWNGdLb01pZVQ1ZFN0Y1g4RXNWR0N6?=
 =?utf-8?B?aVhqMUxmQ203Ni9wbTBoNUJFSHB2SU03Y0FONEhKenZXQnd2SW4vSUZXS2RX?=
 =?utf-8?B?MVExdktJd3poaDVTampsZXZGejI5SUc5SzZqZW9sbklQWG1pZzZWUmNsK2Er?=
 =?utf-8?B?SEV1YjZnVkc2QlVCbGdsdjc1NGlMd24wUDAwcDlDcWlTZVlpdHFpNjhnbE1N?=
 =?utf-8?B?ZFd5NHJPMEV5YWNKb29XeTVndjU0c3lwV3NkMC9qSzJnUjg4cSs3TGlKKzJC?=
 =?utf-8?B?YzI0OGRNYUpSaE1mME5aQi9VSm9UQ21wOVZqRDQyRmFQclRFb2hQU01haVB4?=
 =?utf-8?B?azFsYTVLazJDSE02c2dFWDdSQWZocjd1Um55VUk2TkpFWnEveTlvOVhsclNB?=
 =?utf-8?B?blhxWUJ6bmZzOWhvcHNVcDUxemFyMnhtV2Nwb2NwMUJoUCtZVnpTaTZKTnR4?=
 =?utf-8?B?ZDFKa28wYm1WMWNrYjhqUkFLcDdQdGFiUkFiT2VGbE1leFRNSkxTMmNXNmI0?=
 =?utf-8?B?NFVLeW9GKzdUSUx4c1VEL1Rva2h2WXRZVmhzQUlYQUxTYlRyTWZqb3dZT0k0?=
 =?utf-8?B?blZGR00vbnJiazIxQmlNR3d4dDM3VkI5ak9MMmV2ZDZscThyRGVUQlhkdzB0?=
 =?utf-8?B?aG5QR1ZEQWhYNllyTUMvZHBHQVFUamxRcENtUWFKblFielFRQUI1NVRQS1Yz?=
 =?utf-8?Q?Dtq+QuzflZ4FSuoM/vjsUCYTK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913b9648-32c6-4f6a-bb34-08dcc15bb247
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:04:35.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uAJxB32YPHUwuBtULgqHn3+J6D17xlksayi1JgCm3jV7JZz2OlNKmsRXh9Ts9BTwe/0bWKBnMlu/Z7/fvcUnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9021

On Tue, Aug 20, 2024 at 05:50:38PM -0300, Fabio Estevam wrote:
> On Tue, Aug 20, 2024 at 5:45 PM Frank Li <Frank.li@nxp.com> wrote:
>
> > what cause probe failure? I think it should be defer probe if some resource
> > are not ready yet.
>
> The failure happens because i2c-2 is probed after the pca953x driver:
>
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
> [    1.905575] i2c i2c-2: IMX I2C adapter registered
>
> PCA953x tries to write to a register, but the I2C bus is not ready yet.

I am not sure how this happen. i2c device should be probed by i2c bus
driver. Only after i2c bus probe, which scan i2c device, then i2c device
driver probe can be called.

Frank

>
> At which point in the driver I should check for the I2C controller
> presence and return -EPROBE_DEFER if it is not ready?
>
> Thanks

