Return-Path: <linux-gpio+bounces-10241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46597B9C1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 11:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77E4B1C21008
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 09:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230BC157488;
	Wed, 18 Sep 2024 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="digG2KqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2065.outbound.protection.outlook.com [40.107.103.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79628EEBA;
	Wed, 18 Sep 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650089; cv=fail; b=MDpgDmf0Nb+SxZuQlgMy1NrGA2hO+rJHJAojgmx+qb7qPQkVAPXeswvIjmUvhJUruQ4j+mV1kVAQNZcJazoi3tmPN2ZICV+IvlMKo2bD3bmApZOHk7mcq/D6g4z1yvg5Q8eG5umk/diYQFOiWpoMGOOee589y2DoEc7SnwGDL20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650089; c=relaxed/simple;
	bh=WEp0VNzpIVirGn61S2PZAu4gFMvwDpVSxu3aexyM5EM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kVNU4HgegSOEWLBQhAoAaTHnpX23XQmkqsMQkcMzvx/pMni65b+CVkkHxwvHrPUEdYY0i8nDUXvakQMM29Wrm3mLRlwUK97f6+uVajRt4IYdSmLZb7PTDa4lIuP/4TkwfbxLyS8WePNmRrX7XaVZCDfOxZn4C44M84EwH3V0wKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=digG2KqL; arc=fail smtp.client-ip=40.107.103.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwAppePH5GWBmW7S3OvR7nNBd+Xg9QZChwozaYuiaZ2GKWvnuSD6uUaQgYF5CdYVqIcVdzIzpszFdBtlfWSfqFolVpMD6yEICqGeT0wq4z/zqpqkvBgqV4QjC07UNx2rp1F/nJe3ytwDooxQqXgbViySj/BTcAyzHLynah1CW/ugE345C5+LxfKeqHKIZeH0bMvw1/JLbybKAO0slbagla8KvR0S82wHIPz1k8OV5r5n+TT64XM0EDzSaWb7skjHpzTcyX1SKxdgr9jfnMFgAVJgAVTbivyeHpVwZhBj6cFCK/k2wHtG9xbWrakc1pMbFjPKOrnH/3fCEIxnhDXtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6BBkpwDVFPdV1dDCfQk9ZknMaluMdyq5tH88/72BsQ=;
 b=Zr2Pnky2Zb9quq/IIsXeiMFq4zSRxRfxVVP9ZHX7CpIMKKOOpk3F8Ki4GK12FoGERVH9bHBVVpp64HbstYAS7Z/N/Rp4v4yX6FnJZHezzzfpXn93OLz0W0I4KnzUpJj3ftaAIz2YOmRZUo0Exkfclfrs/G0FussX0xmGQj/fAAVpN8//5zYP/3i/wQ8gFF61NPyh7tPu9K0fZJoQ/PfSpH8CQwKA6MI8xfzwWN9341PmQuTog9i8s/OR5/qT5K26/GKhEytrPhj2pCqtzpGe28h2Z0g1i3r/Szr0GLpoWjaDTuElS0sQnO25H2F0FEW+Bt+m5jBKiQ0lCcg35233/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6BBkpwDVFPdV1dDCfQk9ZknMaluMdyq5tH88/72BsQ=;
 b=digG2KqLLiSrKCkzFsfyFfrUEhoxCBmFIl2ujhgH4gXi/8EZhgod/v6IITgcFwhQEY4rtJqGbvz6oDfC9/CBrCRskeZEeZ9tvR0fg4wdlXsm5UmqsioyzT0TJW0ktk6HiwQxNyOICbatbD6BdsmeZgv8kTr1XBJPN3nJwfaeiWDNOhxG++Ep9IqeO96ah4VjHEjXWfNW5m2Gct76zuEYWj9vVG5UunO0IPfQjS1c4FdTlxZefLnLxRbjCG0lqdR4ZK0kiCwX3sWheVURnhSdn6SsarrKwWBs6sxR5d8LqnrvlZWV5GCZkmhCboyPM81XQDVHENbhRLTpZdC7hcbDiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GVXPR04MB10658.eurprd04.prod.outlook.com (2603:10a6:150:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 09:01:20 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 09:01:20 +0000
Message-ID: <e47c0fda-6c6e-4d25-b935-97b03225b9f4@oss.nxp.com>
Date: Wed, 18 Sep 2024 12:01:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-5-andrei.stefanescu@oss.nxp.com>
 <bd886183-273d-472b-a96f-3fed1dd493c1@kernel.org>
 <53bae020-3d82-4966-8a51-2b3853d07eb8@oss.nxp.com>
 <e9449091-bd99-46ea-9f76-bbe0ce646c5d@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <e9449091-bd99-46ea-9f76-bbe0ce646c5d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::12) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GVXPR04MB10658:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1b90e7-0e6c-4b4c-98ff-08dcd7c07658
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWp5Um9RSGhpdTZES3AvdTZ4bEpmSVB2b3dtWFFNR1c4QjBJL1NmQlZKNkp5?=
 =?utf-8?B?MUNiVHBKcWlHaVc5RXhQUlRuUUtFZGFaS2dqOHpwcEpIZnREc2lPTE8wRGp0?=
 =?utf-8?B?TFNsRVR0dE9DekhxUGRtQm11TDRHZ0JFS1lOMUpmdTZsOUVwWjZHb3laNXJE?=
 =?utf-8?B?ajVWWkxYYy9UQ1lmd2VlRWZZV2Z5RmIzQytmNW9mbFcxZERwUit5TGpTMm9Y?=
 =?utf-8?B?L05JRU8wSWV5bytacUxBQW5yZ1RJSjZ0UnhRYlFqNjAzYmJYTzc5VDF3ZERW?=
 =?utf-8?B?TzdGRE5Tc0p4dFZ5ZVBXcHljNFBpWHZwcEs5SXRZUVhuQ2QxTkdoVWptQ3hP?=
 =?utf-8?B?S0pyQlRaTkorUEpydWlpSnMydDNEdEdHYktzZyt3b0xxK3BlSnhtTVo0RHR3?=
 =?utf-8?B?UmkydnNVaC9jTHBHdWRBZ1JocFliSUEwNWxncU5SRFlFbVhHZkI5VkE1aDlH?=
 =?utf-8?B?dCtiWGQ0V3RtUi82ak9TSWNXNEpsTEYzVGIrQzdPeHBjSkJQVWphQml6dTU0?=
 =?utf-8?B?dk1JWlNDRUZ5dUZ5bGhyeVM5YXJjYStXcHB5YXAxOS9LM2d2bG56SDBJUGVm?=
 =?utf-8?B?dkI5YVpwU2h1SC85SHQ5ZmlHNGVldDhqZ1Y1M296YVoxemFsUVhacDQ2MjFM?=
 =?utf-8?B?NHd2YWNuaTVFYTdUMStQbHFMRWJPdWN4dVJONXVhVHZMMG0vM1ZhUGFMRlFG?=
 =?utf-8?B?MjNhdTJ0TS9WSlpZR2JFZnhKWURmV1dXYWhKNmJtcjBKRmlkT3BDUHhTb244?=
 =?utf-8?B?R0pBR3EwbFhwNER5Q3RDZXFXSkh5blFwb3pzRWtRODRyTXhHOWl2VDJsUWw5?=
 =?utf-8?B?R0IzYlN3RjNHS3FEQzJXOTRWa3pkSWE1R25sdklCNzROdlVrdFNuVm9ORFln?=
 =?utf-8?B?eEZzVU1ua29DZVMyQmJYaVRyblVGN3pCLys2QzNJYjVjQWFrUTVxRFBHbkxz?=
 =?utf-8?B?ai8xbU9EUW9ENVVUUjVRYUVrZHJRZlBwb1MxQXRZNTdqYUZXZDA3RFI4U2pZ?=
 =?utf-8?B?UUZOU29PL2JkeXdudXIxWHBkQ2ZHb1NYOFA0WjJCTHVPNVNJYXp3S1gwS1do?=
 =?utf-8?B?NGQzNE5vNkludEowZnFjdE4zdXdOZzkrK2Qrc1g3c1FqbDI5OUhWeGw5OGJS?=
 =?utf-8?B?dy9RMW52a2ErQnVkVVBTQ3Fkcm1kTitqdjBXSGNXZDViNjRwUzVqUFNiRkg5?=
 =?utf-8?B?Z0RyaTBSemtzc2FpL3pQdlNYYXVKZTQvWElvWUxGOVphNWpXY1hpcG1kYXc5?=
 =?utf-8?B?ejJHUTh5ZlJEOTdFNFl6S1lYOHdZeERCZytxTHNnd3dFdnl0cVJWQXVqWlFu?=
 =?utf-8?B?d2lBRzByeUlzMWQwRkdVL2xCRnRYSWlzdFBzNWNSOTZFZStvMkdLN3hKc1Ir?=
 =?utf-8?B?R21uZVZPMFBZUGlBVjRPcmtrcVdqUGhsenpNUy9hOGFlOUVBZEpFUnBOelgx?=
 =?utf-8?B?UzZqWUU4WkhIcWVjckh3SkRaYkdxenY0SG9mTjJrNk5IUHNLbzlHZTJCcWNO?=
 =?utf-8?B?YWlLa0V6dmo5a1ZaUFZCVi9VZGdpUkU4V0dLY3NCTDd0VytxQkpzenZkOFVH?=
 =?utf-8?B?eUVDSlF1K2hjcTgxaENSZVpuOXNBdUkveGF6OWRFaUE5MkdRMkxyaWxQRDJZ?=
 =?utf-8?B?RmxEOC9BL3Eyd1hCUytLS1lvbXlxVHp0LzdoRW1nTHp5WGRnU2Q0VEltOUdQ?=
 =?utf-8?B?REFkelcxUzV5WnVIVkpwU3ZQUGkwSkFLbGFEcXUwVmlwQmE1Q3ZyeldOajJN?=
 =?utf-8?B?RC9ibHFJMkpCNjNJKzFBSENlWjJvNUJoLzJKdmZqSThFajUyaUVNNTNFS2Nj?=
 =?utf-8?B?TVlUaGlYbE1PSVBjWGxmdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkJaeVJIUU04N3k5aDR4bysxRWJYK0paQ0h4NmpRcVpWQ1BlcGVVVkVuc2hE?=
 =?utf-8?B?b0pKNlg3UHpHN2t2enY5VisyZGtWWWdlbjF1ZllXTEVWOE9tamJZRkNhZ3Q4?=
 =?utf-8?B?b1M2Z2w0aGhENTRBcytrMmVIUW43aWRRMHdCUTRLVkFaT1k2U1dsNXI2UGMw?=
 =?utf-8?B?cWhlcVdGR2NIdXRYOS9jbDlDTkNBYkJXbzE1UHpZcXJzdmpORHlDaE13VjQ3?=
 =?utf-8?B?Rk5lM21IRzVISUc0RnZ6UVVkYTIwcGpSWWxOOEFIUmpUMWFkTitySlBMbDlm?=
 =?utf-8?B?QzVKQnpGaFRaWjFxcklJQlhodDYzWWYyc3ZvR0hTc01UajloOGJ1eVkrNDhO?=
 =?utf-8?B?OG1Ib0tORWFTZDFxbVQrK3F3dHoyUmNMMjRjd1B1NmhCY0JMd2FQY2k2TW1u?=
 =?utf-8?B?TXA0TFpZV1VrSDYzMUQySURQOHl1TWtzN0EzU1RWOHUrdmlxVTdaMktlbUtU?=
 =?utf-8?B?eFZMVFdmQ210RTY1YjBaZ0wyd3N2MzZxaUtOVnptNzlQVmZ4ZC9NcDJIbWJQ?=
 =?utf-8?B?TnBtV25Ha1kyRG5lYVdBZWtLSHdMV2lGclNuQ3pFOUpWa3NKUlVnNWVBbzA0?=
 =?utf-8?B?cms0Vkp2MkgwT25HQ1JGb1VxN09hTUFGeXpnQmFCRHNoc2h6ejFNZVVUTG1C?=
 =?utf-8?B?UHk2aTQ0bE5vTkxJRHIxTXJ1dERlRWRvcG5tM2gycmZwQ2J2N3N4aHBHazV5?=
 =?utf-8?B?aTZmMERqdDVCQ3dpQm8yVjB4UDNPYWxnS0FWOXlEc3h4M0w1bEc5Z040cW43?=
 =?utf-8?B?enVwR3JTOHJVaWdTTjJHMjczWTREMnEwdnFkYnRIU0hFc3MzMUFvaVo3bHg3?=
 =?utf-8?B?SzRYbDhaSmhtZ2N1cHRkTTMzSnBXOURVNnBKcnR1aDhHSzdUdTFMSmN6OVRs?=
 =?utf-8?B?SXJSSVZqeERRTE9iQWZ1eUk2ejZvMllKRDg2NmJBbUlqZ1JqbVhHOVFLSTkr?=
 =?utf-8?B?dk1mOTFBekVkRTVzbUw2cmEzcTNrMzV2TExkRDM0NWRhN0I0YW1lNU9zRDU1?=
 =?utf-8?B?NW5BVWtpWlVTV1FoY1dGY3FobDlTK01IK2VsdTlzVHljdUhMVVI3R3JYZG5K?=
 =?utf-8?B?UlNrVmw2TFoxSXgxcXR4Ly80aDVPMXBoRS90Q2xhT1F0enJHb3ZVNEtZZkRP?=
 =?utf-8?B?TUl2YVVRbTlFQ3RJdUNzclZyVDlpOTEvdWRlajdvd1pKOGFJWmtSMm1Rcndt?=
 =?utf-8?B?cFFhSHdRN3ByNEpuRjlNeU9IcWZNTzJKeit2Z0FibEFzanNzN09Ec1dhcWJV?=
 =?utf-8?B?WHByUWlZUVlDMDFHNTJ3UTZWU2lzN3hQVjZlRnZjN1FuTWprWHNrck52NXR6?=
 =?utf-8?B?TkZwTDRqYVFoM3ZQaElwVm1mL0FKL0F2S3l1SjNjTXhaRG5WbUhXalVYRWVy?=
 =?utf-8?B?RkpGYWNvV2E5V2d0bmhONjZrc1kwREQ2YUlkSlJmYmZKNFNiSk9kUWd6TXpZ?=
 =?utf-8?B?WHVaKzd2ZFBudlFyOTYxMnZYWURsT1lSUGN1eTgvUk9VTTdKOWFyc09yOVZN?=
 =?utf-8?B?RUdFNndidDMvYkE1MFBBWWEzNFErSWhNMDIvcTljRGUxZ1FWLzA1UXRBcE5J?=
 =?utf-8?B?YnRLVHo5bjdaNWtFTjVEN3BXNTFGam5jNitmenRDeDdXTllCaDhTeGgzY2Ev?=
 =?utf-8?B?R3VWUTRrM0FtMXpRd0FOOGt4STY0UVpUNWJqb1FuODF4aHFuQUJRSDhMTTJt?=
 =?utf-8?B?cE9lZGVJcjFSVjlyVTdUNFhXOWlCd04rNktObVJsa2JQZ2M3TXB1d28weEdD?=
 =?utf-8?B?SnR5Y3lDTEhOMHJnb3BWSHhZbDJLZ2MrZTV4dng1RG0rTmRQKzZlTmJvZVdC?=
 =?utf-8?B?c25kUnhZQWFGdWhNenhMQmdNeEc0RlVoRDQrTHJVU3YrdW5TWHBVMFlPcTBC?=
 =?utf-8?B?VDJIZTIycXRWVXlUS1pRZGJybi85N2src0h0U3c1ZnBwbDNwQUM1OE9pUVdB?=
 =?utf-8?B?K1M0T2JhWGF3QTNZcW5POGR2RkFYTHU0OWZab1h6R3NFS09Ud2JBUmtadG1r?=
 =?utf-8?B?aDExY3ZKYjhMVDUydmVFWFlBUUtPUjUxM3JyUjZzT1BoQXBGNW1LNWNLU2Zx?=
 =?utf-8?B?Uk9kczFKL0h1c3dRUDYwd1ladVVUaDB0aklTTTgrbmwxejAwdXNxaCtQN0cy?=
 =?utf-8?B?VXZyUEd5djhVZUhZdUgvMGlMVTNEZUtMUHlTYmExQ0cxbUZVclNGQ0wvMUti?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1b90e7-0e6c-4b4c-98ff-08dcd7c07658
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:01:20.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phmhW95XYPAiDtLakQJNBW3wMjQuNcHE5s7catanTi7fJ+hgA8hHRKf5VGp4Gnp2cLY67vm4Bk/EBydvBnb91dc6VKbvd4n65HpWKt7MUYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10658

On 18/09/2024 11:13, Krzysztof Kozlowski wrote:
> On 18/09/2024 09:57, Andrei Stefanescu wrote:
>> Hi Krzysztof,
>>
>> On 17/09/2024 20:44, Krzysztof Kozlowski wrote:
>>> On 13/09/2024 10:29, Andrei Stefanescu wrote:
>>>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>>> ---
>>>>  MAINTAINERS | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 10430778c998..e23c4369b6e1 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -2689,10 +2689,12 @@ ARM/NXP S32G ARCHITECTURE
>>>>  R:	Chester Lin <chester62515@gmail.com>
>>>>  R:	Matthias Brugger <mbrugger@suse.com>
>>>>  R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>>>> +R: 	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>>
>>> That's another patch where NXP adds silently themself as platform
>>> maintainer without explanation. Although here at least existing
>>> maintainers are Cced.
>>>
>>> This looks like some pattern, so maybe clarifications are needed.
>>>
>>> You wanted to be maintainer of this driver alone, right? So separate entry.
>>
>> I would actually want to become a maintainer for the platform. I have
>> already added changes to the pinctrl driver and the s32g2.dtsi/s32g3.dtsi files.
>> I intend to submit more patches to these files and I would like to review
>> changes to them.
> 
> That's fine, so please provide some sort of message in the commit,
> describing your intention, document the commitment.
> 
>>
>> However, if you or any of the existing maintainers consider that I should
>> only add myself as a maintainer for the SIUL2 GPIO driver, I can fix this in v3.
> 
> I assume you proposed this after consulting them? It is unusual to add
> yourself to maintainers without first talking to existing folks...

No, unfortunately I haven't consulted with them before proposing it here.
I am sorry for that! I will add myself as a reviewer only for the SIUL2 GPIO
driver in v3.

> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Andrei

