Return-Path: <linux-gpio+bounces-10776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08598EB6E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 316B61C2110A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 08:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D12112C473;
	Thu,  3 Oct 2024 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nby+bh65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD2912C549;
	Thu,  3 Oct 2024 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943508; cv=fail; b=uoXk4niqHd9B7q9n2dv4ZP9BIycEjmJkorf1HCG2hP4VzDkfth9rWtSkCG6PR8wZx+Q+nMyxCtifzWVbODlae5Zpz3vWJbn2WejBmzpE52RAdCyBpZqav4O3hItU9vMs7i7ACBp6+MVyHaBZ7HCKnD41uJb5c0rjs1YdV0OJQXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943508; c=relaxed/simple;
	bh=1evlxfToVtR6BbML4WlMeoIQGxR/Kyyxv/EgZuCB2GA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ePi0R8yU3EmB2kluws380xdkBirDACvjkTVLCgrl9pVkhHOGsu9oP+83TVa8EkQEZG2RDVK7CGlkrwwv0OXpPN7daueD/TMxo0Pa1rBDjtDEPf9q9brv5vXAULw7MjODPtVjyXeV3eFSrKjEcpzrgcojGaIlFPHAJg1wbmnv+aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nby+bh65; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfepNO3hJWpWwF+F21e/p9C1TmLb4GtxKW2UOZbA3Co6nNNgHjZS2RtavFPN6kOub92AckFKnZH1+T79d2AiouGCTt5/2nwSTw1KWXLoSR4gU1qjsqFhimuSuLmqUl1m3wWvwmi5YyLB+w3J7PHCwY/9gDiGb3gS9nPAhrc5xm4L8Ce+BAjuc5LVOKpSGxyUZ2a2VByhQlF2XrgcWKjMn9+TjZwoT8bX2624wIshtUcamUOFARVVp2jGmeZ9y7U8M1ok/Ce12QYyc5qhMEfiDYw2L+lG1yDeOtLZr8ErHtJeqRxYsjp6wEG/lRz4NXN8XuPbvVCrTHb1Wb+MjyVXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1evlxfToVtR6BbML4WlMeoIQGxR/Kyyxv/EgZuCB2GA=;
 b=yL7vyRplk4H3cKY6tHuBuVeT6gPztQDA7xKoEdrMwx5qrBsYzbZp2m3p9zdDcBK7QNG+dson28JH0rFCmS2LOVMv9TNHtHBsXbqX9iPuvbZU7ICyK1jazk9cAfpBRcv8C2ePjjSOYWKRVnO7b1u17tsrrAOyKkJWmubVJh6ObuL1oz2YB1kdfOGGbzRiu/NQzrnXqY7vAeEFKyed0lYTBpp4k/eS6U5kjuKyGSaE7NJWJAbDHVHoFU/9wS++imU95QClXgAKvHdQRzaDAcmgNxUh/9gInRMq6qHEDAtdEXRVrdM+Krow0JF7oG89RwhAxET4KkEe1dvC+onxLFr9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1evlxfToVtR6BbML4WlMeoIQGxR/Kyyxv/EgZuCB2GA=;
 b=nby+bh655CPiPpXbcX38iySsmqHs9N3OFimjvMyMLT0wmSk4w0mUY+bERpFrwdP3FBE4Epi0IsEZWvpNhjZVVUSq7x7P8ZLj+ccxoW5cQ+qpD0o+J+cIj+SYqngI69qWzuC4xkFHVd8gwbkX2Do9TYxDV7P3DBGSvKuT63+I7TI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5504.jpnprd01.prod.outlook.com (2603:1096:404:8028::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 08:18:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 08:18:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Linus Walleij
	<linus.walleij@linaro.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "nobuhiro1 . iwamatsu @ toshiba . co . jp"
	<nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: RE: [PATCH] pinctrl: renesas: rzg2l: Fix missing return statement
Thread-Topic: [PATCH] pinctrl: renesas: rzg2l: Fix missing return statement
Thread-Index: AQHbFWlofO04yxQor0iJcdd9F0viobJ0rmSAgAAAKlA=
Date: Thu, 3 Oct 2024 08:18:21 +0000
Message-ID:
 <TY3PR01MB113466C9E92215E1857DE585286712@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241003075342.17244-1-biju.das.jz@bp.renesas.com>
 <4cd2b4e0-72ee-42a8-a6d6-18412a06b7b8@omp.ru>
In-Reply-To: <4cd2b4e0-72ee-42a8-a6d6-18412a06b7b8@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5504:EE_
x-ms-office365-filtering-correlation-id: 9c43e8e7-d846-4d18-cf67-08dce383f1f4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bFpMSGw0K290N2xpV3AyM3c1QStMT2xpa0c2ejVDTWdZa1Jmbkk1cUpvb3pv?=
 =?utf-8?B?Q0t2L3B4dnd2S3ZiVEZZWFpZSDdQQldiL3RDdHdrMWZBRnAyUVRBRWFVZFZs?=
 =?utf-8?B?SXdFR2hyUE5nenREb2dZU082V251Zkg4dzd2UGtMSnJuNVRtZ3prZHljWWc2?=
 =?utf-8?B?dm5VLzh6STF0SlZqRkgyN3NIL0x4eU53dXBnMDM2aTllcXVjRmlKRURaZzEy?=
 =?utf-8?B?dEk3NFhEUlJFN2hNOXVUc3g3dUtBaXVremlLTkIxNkN2UzdIclNhbVJzVWhq?=
 =?utf-8?B?RURZTVBhcWNkU25Wd3RXWnNCVVVrdTUrUzFzWkZPckVOVzAvaGpsd0pjT2VI?=
 =?utf-8?B?T3dXYVN3N3JXNDZrWWhVNUdCOW5NRVJwQldGU1ZSbjJscnQ3Q3o1WlA5bnA3?=
 =?utf-8?B?cjJVaFF6V2ZvWnY2L0I2UG9COUxlNjV4ME5NSWFjWjhKazhKbVM0VURPemhp?=
 =?utf-8?B?MEJjbFdxYTR4SGtmUFdWWTVneUUybUtVZEpic0Q0ZytYa0pBSWVIdGZkUDIx?=
 =?utf-8?B?bFhBdVZCcmFKZnpWSTVPN2V2RlJuVHp2aGdxOFFmTFg3N1JFUXhJM3laWjA0?=
 =?utf-8?B?b1ozVlEyek85NFozZzVRZVQ0cjU3ZTUvNzN3ZzM2WHN4bjhleW14Y2tiVFcv?=
 =?utf-8?B?RmtTbUZjQmJZeUVJTzlYaXF3bGpzek5LNUpWNFVzWU9IWmxmYXFQY3RNNHNs?=
 =?utf-8?B?MS9tdHNoOTYwWlZteUUxS0JsWVo4bTQ4bDVOYnR6b0lGdW1oTGlxR3E5Q1pD?=
 =?utf-8?B?L2w1blZ2Y0Q3aldPcnNnd09Zb280WllrdVdxNWE1Y2Fsdmw4TnRpUDQ0RGht?=
 =?utf-8?B?ekYvN0tuOTh0VnUwNFE3b0ZzeUw0REdLaXhuZWdXUUtWbnJPUW9STW9jQTF5?=
 =?utf-8?B?dkZEK0ZFM2pCWUQ3NGNySy9pODhKa1ZRRlZQWS95eGxDQmMxajFONGxGNWht?=
 =?utf-8?B?dWtEWTVzdEdYZVJRUllrWlc3b0FtMzc5cUYvNUVhQ3d4cm42ZFQxMTkwU0E2?=
 =?utf-8?B?eTl0bzNGSFZIeFVGQ1A4SzVJK1BlNTYrUmlSNTFjK1NoWmtwWkhTNXp6cjJp?=
 =?utf-8?B?cmFGYzRPdkRoSmhDR0oyZG9WdUVnZ08wOFVmQkJtQlVUSHVLWEcyU3ZNRjBV?=
 =?utf-8?B?TkcxbzNsR05MMHJlU3k2WVBUVHJCN2ZFQkpwalJoajVrQndQUHF3YWd5MzNq?=
 =?utf-8?B?T1UzRzd2QXhvRVVhWkVnc1A0SlJQcVZoeklhRExoT29ZTkJPa25NNHZxSmZX?=
 =?utf-8?B?S2h3V1hPSW1uaVlKVXdqZ2o3L291S0VSTVYvQkhraXQ1RmlqSVBsUU12TmZx?=
 =?utf-8?B?T2NPYjcwYmtHblhkZksyenFxcDhhdElZdHpRQmlHQTV3V2JndVhoYW43VTJ5?=
 =?utf-8?B?WFpYNUNOcVFsdTA3RXhleGw2TmhUY0xobVMwMHJ5U0ZIU1JOUmtvekRtR29z?=
 =?utf-8?B?czRGaU9MUjJ1RjdUTGVHc21ycDhQZEtSaWZBZkNMOUZhVXhERkx5SkVWNzRk?=
 =?utf-8?B?c3llYWtWSERtNFh5RHYvbmtLZElrajBOT0xuR1NPcGU3NU8va1dhWXdpa0R0?=
 =?utf-8?B?S0NXVU14MGF6eUpra09jZDFxRjA3dEE5TDlNR3RnTGwvR0w5Z29PN3VLSUY0?=
 =?utf-8?B?RVpUME9OdXg2OUE2ZzVVeUZEbHplTytIQzAxOXdtczFjNnFEYUsvRkFmbHhK?=
 =?utf-8?B?SW9laUhGZm81c2ZrclE1YTlEa0hpaFUxUTFtakhuTFZTc1A0TEp5NHFXMy9V?=
 =?utf-8?B?c3c1T3dER011SDhZZ1krN2VGQ25JTkR4OUNiN1llZHFBek8zS212UURaaWlt?=
 =?utf-8?B?d2pDZHQzZXNMbDlPWDRHdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cThkdmZFcmYxblp6WVF5aDBiSlhuL2svaGV0TTNQenBuQ1hrbHNjS3J4UnNK?=
 =?utf-8?B?VG5CZ0dHZ0paWnpkOEg2SUZCdkd3NlQvSzZ3OU5veFRsSmRCZyt2ajNvaktm?=
 =?utf-8?B?Uys4aEkxOFMyTlZGUGhzbnhNUkNTdnh6aTY4ZU5OOVN4ZVBuRktMUFB5UjBL?=
 =?utf-8?B?WmJxeVBSUnBTenhsMVQzczRUQlE2RENRdFpjdjVpNGJiM2ZkWjhrcEVWTUdC?=
 =?utf-8?B?N0MvR0EvYWtUcU1sSzNtcjVqbDZ4UU1HVnhtMFgrem9RcVhTOTllVFJQdEh1?=
 =?utf-8?B?NU80ejcrMk9GREZBTlNWZE0vMDQyNHE3T1lwNzJPdWFkUXZhUVBUU1pIUndP?=
 =?utf-8?B?Z0NwQlYzaWRERXNZTlloWDRKZXpzUVYyaThGQmlPQU5OaTNNL1RnQXdHdjRv?=
 =?utf-8?B?MC8yUlh2STVkZTVzTU5Ic0hFVXdnbnQ5M0dqK0I3Yjk4RURUaXp2THNHVTY3?=
 =?utf-8?B?eDR0dzVrZmo5ZWZTckM2ZGg2MFJEU3NoS0VOaUN6bHNhRzF3anhucnRZd3hi?=
 =?utf-8?B?KzFBWEU2aVhpUE5XMmVuYWgvQmR1dDlRdm8vR3hKR0liK3VSWXg5YmZEUSt6?=
 =?utf-8?B?ZXdGUE04S0lzTitaMDlpRlBUZ29JOVUwSGp5cUVKVXlPZUI2UDA0L01LSC9i?=
 =?utf-8?B?ZDBNOFZTZ1hRMndBUnU2aUt1VUJ4YXVtd3lncVM3OGI5Y3lnSm1JMElaQk9h?=
 =?utf-8?B?Zk0rOWt3ZFFlRWU1ZGYvcFFsbXlMUmthZWpuSzNCZHN0TVRXcVo4YzBUS3I1?=
 =?utf-8?B?VE9acG9nRGplakE3a1VIQk53K2pMUkVGNmlNamVPY0pVdzVQUFZEaDJ0MXlB?=
 =?utf-8?B?L21BTjVqcGo5cldLUGlsSlpuc084MHhBMThBeUZ4NWo1WFI2Ky83Y0RwVU10?=
 =?utf-8?B?bHJLWmZBUXJDUERPbEJKNGRkUEdKUldad0crdWJaMElJUUh5a2RJU0dYaUdL?=
 =?utf-8?B?emJlUEJvSXNMT1JFNXJ0Ym5VZGJidGwzbU04V3h2d2N3N0dxS2ZJd3RPcDY1?=
 =?utf-8?B?bVY4NktzcTVKMHNWdnVmQkowUXZPVG1CUWNWM3pZdVFIckNKUzNJc0JOOGdP?=
 =?utf-8?B?WmlSRFZmMUxocGtIdXdLMmlzT2lMcnNxT0lZZTdkN0ZiRlQ2QkptaGpYSnhB?=
 =?utf-8?B?ZVJiVzA5enMvMFFYOWY0WTE5WmpkT3psb2F2NE9vZDd4MWJhazhyRytuWWV0?=
 =?utf-8?B?NXJFSXdwMDVVT01JSHcwMFM0dkFWbDVuOTFHcDhmZkcyUFJWS2JLTXpXV3Yy?=
 =?utf-8?B?Q2Nhck5TM0lQZTgwcGZUTkE2RU1oM3ROeTBURUJJSjAwblVZK2ZZOXBRbWUx?=
 =?utf-8?B?cjlWaGdlZ2hYZ2ZTNmhoVGpLcFVjdlFvb2R4VTZwakVtdXBvTDFrSm9DYnly?=
 =?utf-8?B?WXhNWTQrS1g5UGE2THVlbkhrUnJqSnpMYW9wdDNzaG9OZ1VTcytkMlk4SEI5?=
 =?utf-8?B?cm92Q3dFZ1Y3VXdENjQycVIzQ3cyOWdTOGtwWEpPd3gzb1pLNnhNTzNNT012?=
 =?utf-8?B?cUNzcjR0ZlYxWEVUb0NaTzlUVWt6SFExaVQ5RURoK0NKRDZpUk9TeU5OWlRm?=
 =?utf-8?B?T0lqM011ZTZDM3hSV1NLeTlQN2tBSWgyZmFReGNUbXR6cWxHeTJpWWU4N0JZ?=
 =?utf-8?B?eWFldkxVWE1TRFh0V2pydDJwaEFKRE80QlhXWW1kWDNMZnQ4L0RRNDdGdTl0?=
 =?utf-8?B?R2FVSjQ2d2t3TEk4ZWlQaEFDRDNlZFc3dWVFSU1ZdDE5Y1llQnlucXRVbVFn?=
 =?utf-8?B?WmVKUmRvcnRXMXJLS2lpTlNYcTNBaFpKYUxDTms1S1B5cytMRGNpTGNBYVBM?=
 =?utf-8?B?dWpLNVBnckFUenR4YkhJRStpakdVRkRmNkQwSjBHajU1aEM5cTVqSTI1cVlm?=
 =?utf-8?B?amhwTkl0K2VtT0k3MmV1cko1b1dRVFVhdndQaDZNVmNRTVdWaXN1NzY0ZkdP?=
 =?utf-8?B?ZW1RUWYwMnJjL3VNUmswN0xHWEFTdTVNU0lNUlMrS2ZSVG5XYzdGcnlFUDVw?=
 =?utf-8?B?Znh6ekdBbmxsSlM0Ym0rMHRGc1JScnVNcmR3UldITDhBMEZEM0ZCclpvdDhZ?=
 =?utf-8?B?U1hqR05uQk5nRGc0c3hCcDZnajRybnV5S2tTRjVQWGtlakg0QjFYc0J0UDI5?=
 =?utf-8?B?K2NtZEJZakJxdEJMd3J1dUtMMlk4UTQ4M2F3VVgzc3ZZRE1JRTRGeVlDSmJ3?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c43e8e7-d846-4d18-cf67-08dce383f1f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 08:18:21.9170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQ8KTN0fz3E1y3X0tBeXxqlCtDZSff1ads0S9gmUdjFPYH5SxiMjx7lmUd8XVIYs5YFRxYiV9Rs929gib0SEigKy62/TOGaXnREN2v6aMD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5504

SGkgU2VyZ2V5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlcmdl
eSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVy
IDMsIDIwMjQgOToxNyBBTQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBDYzogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IGxpbnV4LXJlbmVzYXMt
c29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGdwaW9Admdlci5rZXJuZWwub3JnOyBQcmFi
aGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT47IGJpanUuZGFzLmF1DQo+IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+OyBub2J1aGlybzEgLiBp
d2FtYXRzdSBAIHRvc2hpYmEgLiBjbyAuIGpwIDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5j
by5qcD4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcGluY3RybDogcmVuZXNhczogcnpnMmw6IEZp
eCBtaXNzaW5nIHJldHVybiBzdGF0ZW1lbnQNCj4gDQo+IE9uIDEwLzMvMjQgMTA6NTMsIEJpanUg
RGFzIHdyb3RlOg0KPiANCj4gPiBGaXggdGhlIG1pc3NpbmcgcmV0dXJuIHN0YXRlbWVudCBvbiB0
aGUgZXJyb3IgcGF0aCBmb3INCj4gPiByemcybF9waW5jdHJsX3JlZ2lzdGVyKCkuDQo+ID4NCj4g
PiBGaXhlczogZjczZjYzYjI0NDkxICgicGluY3RybDogcmVuZXNhczogcnpnMmw6IFVzZSBkZXZf
ZXJyX3Byb2JlKCkiKQ0KPiA+IFJlcG9ydGVkLWJ5OiBub2J1aGlybzEuaXdhbWF0c3VAdG9zaGli
YS5jby5qcA0KPiA+IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD4NCj4gDQo+ICAg
IEhtLCBzdHJhbmdlIGVtYWlsPw0KDQpPb3BzLCB3aWxsIGZpeCB0aGlzLg0KDQo+IA0KPiA+IENs
b3NlczoNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvT1MwUFIwMU1CNjM4ODM3MzI3
RTU0ODdCNzFEODhBNzAzOTI3MTJAT1MwDQo+ID4gUFIwMU1CNjM4OC5qcG5wcmQwMS5wcm9kLm91
dGxvb2suY29tLw0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3Ry
bC1yemcybC5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNh
cy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwt
cnpnMmwuYw0KPiA+IGluZGV4IDVhNDAzOTE1ZmVkMi4uZjkxM2U4Mzg1ZWFkIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+IEBAIC0yNzEwLDcg
KzI3MTAsNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX3BpbmN0cmxfcmVnaXN0ZXIoc3RydWN0DQo+ID4g
cnpnMmxfcGluY3RybCAqcGN0cmwpDQo+ID4NCj4gPiAgCXJldCA9IHBpbmN0cmxfZW5hYmxlKHBj
dHJsLT5wY3RsKTsNCj4gPiAgCWlmIChyZXQpDQo+ID4gLQkJZGV2X2Vycl9wcm9iZShwY3RybC0+
ZGV2LCByZXQsICJwaW5jdHJsIGVuYWJsZSBmYWlsZWRcbiIpOw0KPiA+ICsJCXJldHVybglkZXZf
ZXJyX3Byb2JlKHBjdHJsLT5kZXYsIHJldCwgInBpbmN0cmwgZW5hYmxlIGZhaWxlZFxuIik7DQo+
IA0KPiAgICBXaHkgdGFiIGFmdGVyICpyZXR1cm4qPw0KDQpXaWxsIGZpeCB0aGlzIGFzIHdlbGwu
DQoNCkNoZWVycywNCkJpanUNCg==

