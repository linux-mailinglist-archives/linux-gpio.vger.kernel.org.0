Return-Path: <linux-gpio+bounces-27280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2ABEF96D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 09:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BE661894450
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 07:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B15D2DC782;
	Mon, 20 Oct 2025 07:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jI6NsWsz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9D2DC779;
	Mon, 20 Oct 2025 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944041; cv=fail; b=IFZ2QICY8VDuTXuE6Ef/x+BGSePMV52zmv8I+HY42z4eUcynGzLmfKIL3DWODCsSb3GNmegyRExKXD9mtuSJtbBtn1ka1QzEPgWYRoO98RnvHZ10HeqzWYs1ZxXVG+fqIp6WnBjSuRa6JHqZ1nmyjsu9wuoScRoFMN+JLwkrpUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944041; c=relaxed/simple;
	bh=kB5hcY1garoKSkLESAcTcjHqZPENi0yO4xaLOjBbxcA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O5YGa7mll0tWPaCpDU83OU9a2Wc8QATJ/n93yTsOlfNztXoXWSFsinmx3LP2Ul/b73Q6X7G4YBO5Oigkmh6F0BXz8R/flOjY56x57dL5CmFo+RnJvV3Tyrgw1SkE7I/adfquF7iuSgh+sBAUgrM78y3Qj6Sa+OZ2WibZGGxBNkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jI6NsWsz; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOuasi2mGxlPFLwKpyIRhNd9UU7KOhjkMmXzTCxk/MhvMVOK19oLY/kCFqtbB3pmQFijGXseTdbt/ROht66sVYunQcDNMxXuGV67twKEwgYJhXH5b6yN03YkIJyWLdf8qsjPFzJ9zfDgD9M/huqUVmNqkZeKrR776J7XjZ5XWRKPkeKQH2R1SK7nbBfoqQ3EviU/u/rC0ntkSGCfDsMXUqLc5+D4IlNNEu2kmKe2pqQBMUL81ix0kT1Q7f07ne+wrfv+O/yc8dkyTqgaEt/qFdnxs2OMqOG6DVHefbaRJdFEJvrlMTgIBnU8nHQPmADnR7sCpBOPHf9DSTjTxePFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j30Qe1J16pg6g4EyvdIQaYJSDu2powHYk+j+ZW+aLQg=;
 b=MhaL5eLUdS+vhBV3grUsGSG1FfwMJbmZ8NSJsbamVTw4Gzvo95FvWamODSxWOcID+8Sqi+S5erVaksNyEoHZ0SH+zPMPsu7B4Hg4P44+WF9mnmjBixRVFakN5LLk6odyFokwbkYfHma8hOdzS0qWK4eIWAX2Vo8voePHP1dhCYwMUDOrvNx3uAkOazJlxs/Is+O4oX5/uu8KoaUeNQq2S/gz/GdnO3vM9x42AhW1/Jnx5VxdhH5fhhhvkTz5MFG2BX7mLIxrXw0YlwXjHfjLO2KJwk+siN0icPPTCtoEpx8qsex6XDIy7KycGFeQ9i2+bB0ln9T5IhWBtukfg+1Mpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j30Qe1J16pg6g4EyvdIQaYJSDu2powHYk+j+ZW+aLQg=;
 b=jI6NsWszuEwvKTwU4he1+gqKb1lJlNWCAQZoArdOqYyv6GuW2qW5QbujCGdcPG+2qOA8zqKEaAGuI6hqrQFmG8oi5Wym2vq0m2Yh9YrJGsrZFk+qXJ++4BByhUmmuQI4OCwjs71DbhF/SHqrjaNIIvx46gTYtXDxaRDDovkxTfLA9A2zX/trWs39cEUUbEri8MCRC2paiUgr/7EVLfi0hz5UCE9emDx/UPY1fwxrHX6gwoWtkPHgctwmrzl8C8GqwOwz7rgjCFkh6IKTVfjyLmb2sUcd5Kr+SvgqMAwK3nEQoZln8D35Sqn82Awxo0yKW9QbRLxfagjoNA44gvJMEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 07:07:14 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 07:07:14 +0000
Message-ID: <72d19770-e898-4b7f-9102-3d914806c782@oss.nxp.com>
Date: Mon, 20 Oct 2025 10:07:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl-scmi: Support for pin-only mode when groups are
 unavailable
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij
 <linus.walleij@linaro.org>, dl-S32 <S32@nxp.com>
References: <0c4bc190-7049-4753-b88e-479a3ff584fc@oss.nxp.com>
 <aPEtEnd3kG_pxWPf@pluto>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <aPEtEnd3kG_pxWPf@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d40d8c-c32c-4ae9-6caa-08de0fa74b97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elFmZTdxaWhSNVJyV1pyaHl1QncwL29OVWlJWFpGWXcxcjg3Y3RXdGlNN3NW?=
 =?utf-8?B?S2YxcjlZRHp0OUFpbzVKb1owKzJwWThrby9ybStlc29GMGswdC9qcU8yV3JP?=
 =?utf-8?B?a2NLSHVKVWh5T21kN2pJMVZEa291K0dTajk0dkEvUjdOVTV0NXMvQWVnRS8v?=
 =?utf-8?B?SWR5U2Z2elFrWFBvMWI2VDBXcnpDUEEvK0ZSaHRDcXVSbER6VHNsTHAyUHZr?=
 =?utf-8?B?STJ1S0RESVVKSDcyaW5zRXVDRkJpNFZJRGQvdzQrazlJZGxsUGhNRDJOZWx6?=
 =?utf-8?B?VGVOTkdLdXBVNUl3d3FZdFJFRXV1cTVUbVlQYng5d2c2ZG5yamljSkFQT0gw?=
 =?utf-8?B?aXczYnI0YzAwR21hRUtqaGN6bVJkZkltQ29HUmw1MGpZR3pCc0U1K3pDWjl5?=
 =?utf-8?B?WFNsNnZiZ0Y4K0x3M3Q5dzBNNUZKNkRhaVYxNmd3dmpNbnJXWWxCV2JDZzFs?=
 =?utf-8?B?R043OFBpSWRRTFVXNk5OQXdTYzErSmpKNFRBVEgvSFdQMkR3Z3hFaStPVER4?=
 =?utf-8?B?UDB0b3pFNVZpbnB5NXFpdzlXbEszbko4REptVUZ5U1UvdTM1QmVYNlQ4RmtO?=
 =?utf-8?B?SGdpcGZlMGFYSHZSZTZoUjcxZlVFeWprb1JIZDk3TUNNdG4wRFltZS9CODdK?=
 =?utf-8?B?Mm40ekNxOFBUQnJVTGFSaVYvUFF0UWM3WTcvb2RCSXpsVnRpMzRaWWt4Nlo5?=
 =?utf-8?B?dU9CZEFvNzRNMmR1ai8zRmIrenpsZ2pSYm04MDlaZGNiMDZZUW9JVENZbkVi?=
 =?utf-8?B?SkpaU2srREdSYkYydTNCVUZ2c1dvUzQ5clNsUU8yWUVYNTFzcmJGVittdDR2?=
 =?utf-8?B?NDdMZjBCVkNvMVE4QVhEbHlOUjJ4dzA5bTBvVHhOWnYwZEFUMHNmWklYVXB1?=
 =?utf-8?B?TDdTZlRleFE0OURKQTRYUThlWjFEbEhzb2ZWbE5nZXJxUENGTTZwNmRuL3FZ?=
 =?utf-8?B?emlydUVXaklKVzNsdGF4aWtZNVlzZ01jNC8wMDZBaHplMG42Qy8yNElLSnlh?=
 =?utf-8?B?Ni80L001NWloRmpVYTlGU2xDUzVRUU1CRVFlbXB5ck44aG00RDZmakNhblNw?=
 =?utf-8?B?ckVxdHI3ZU5oVGlzY04wenRYTHRMZWdnY3lXVlNMVEgvNXNGMFJRMEpESVNS?=
 =?utf-8?B?eHUwQWhXZmg3eXNRcWo0bnIzZ3dxVEdJMSs0WGN6NTJtYVJ2aGhrSnU4WE5m?=
 =?utf-8?B?YVdKY21Odmd1ZC9CQkJtWndodXZJY254N2wvMWVzZk4reWc4WXdiTUk3eXlP?=
 =?utf-8?B?N2xTU1lDUEs4cTJCTmRtaHc5dFQzTE84YUg4dlJVR25IWXY4Qzh3UWlQaXN6?=
 =?utf-8?B?R3ljN1ljeHZDTWJIRzZzNEk1TktLeHpZZ3J3VTgwbVh6R2dqTG44Vmo4MVN0?=
 =?utf-8?B?TGxqNnFDQ0xwSVNwWDVFTHRGd2RVTktqVENrSzVwK1Q1U0Q4dUpvZGc0bnRy?=
 =?utf-8?B?aUlWeFp0NHJJWXU4Q2VOdExzNHJhQ2N2ak9OMmt4ejlHS1pOUCtrMzVaWE5H?=
 =?utf-8?B?ZXo1dnhIOXFOQWZqM3czN3NubFV3Ukp0TDI3SjNlS0ZoM2QxOHIrdisvWFVK?=
 =?utf-8?B?TnVsQzlFdHFjVzBHVTZRNVovb1pWNjZiMzIvTEptUUI1RzN1S2kxS1BmaXd6?=
 =?utf-8?B?dVZSVEZLekdRRXh5K3QwZzhRbU9LRi9NSDh5SzVuaTVwNHRZMzgvRFcyRWVx?=
 =?utf-8?B?N1A2NGVrb0hQNmQrdk5mMEcrclk1ZFY4RXVqZkp4MDlwV0VqRDdFS2hHYWd2?=
 =?utf-8?B?dFkwTlZnKzFyVlBNakNMVzU0eFVvTEc0SlJ3dGtpdUpUMVhoTkJ2UnBQVVMv?=
 =?utf-8?B?bHEzTmlTY3d5VHVVWTVFUEd1ZzE4L0ZxbTlRVURLaXVlckhWZE1WTmZVQTJF?=
 =?utf-8?B?Y2h5VHUrdTdnSE50ZU9CRUNYMXp5aUs2YXNzM28xZkdpZmxYN0MvQ1ZHMS9R?=
 =?utf-8?B?bUMwbEVMYXZWOTlZdnJORFZtMnZDTkNQdWZGUjRJcVZZTkw2T0NlUWVpWUN5?=
 =?utf-8?B?L3ZaNkI2SXFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWUzSjNWNFhBcjZ3dXJlbTNJbEdJOTJ6OGNTQW9JaFZqTUcwRzlBQTlSK1Bh?=
 =?utf-8?B?azMybW1SZXRleno3VEFwbFdMVWRlYXRYclJHMmdsUHBiS1p5WjBDKzRRbVp4?=
 =?utf-8?B?L0sySXh5WU45bUxNWWYzTnk1OWJDdkFrdDByeVJpUXJ3SlAzSithbXpLMEly?=
 =?utf-8?B?OXpTSVpuUjdMTGdzeUVUeTA2L01pQXlUVG9FR0JFdDBzbEdCZGJ2aEVucWxt?=
 =?utf-8?B?K1gxQ05rNVM3SFpNNkwrOFoyWkZIeUJva2gxNzdPYVNVZGcraUZRTFVoM2Zw?=
 =?utf-8?B?OHc2N2JvTGZzV21sQ0JOc0VCZ2oxRnM3NnViM1ZGaFNueE5ITmZHWHlpTGJy?=
 =?utf-8?B?d05uaTVkOTVMRnpSMFNCTk9GV2pCTmNnOHhmMHhMdnRTbTEzZ3dYKzZWczFj?=
 =?utf-8?B?V2dmVnNmMTNtTiswdEpLZXdKL08yUDk4YTVsdnlwZ29QQXBQVlFVeXRCWU5p?=
 =?utf-8?B?R0VjMjRhSkZkb0Q2bGkvYWlDS1ZnV2s5YWdRS3FaNVlmaGdXUmdRRDkwNVVL?=
 =?utf-8?B?eUNZRHJCTUJ3QTBYc3RzNkRiNkJ4dGFDMHZncjZRNmN0Ym1UWVJwZG4wY1V5?=
 =?utf-8?B?djY4RWRvSGoxZGYyUkp5ZkNTRUR3SFFBY3VhbHk3UUhwWWNrc3ZXYmJqZXYz?=
 =?utf-8?B?L2hSbGR2dEJudkloWmg5NzU3RGh2OEpPYnUyWjY1NDVHVEZIdDA5NWI5ZlFi?=
 =?utf-8?B?QUVrV0RYbE80bWlhMzBtZDNodzFxTXBKUUNFZUtGa3A3MXZKeGFpOVFnalQx?=
 =?utf-8?B?Z0JVSFJtZnlXeWZLQS8xRUlOSXFaWmFwR3dsRjJ0TkpiSVZZUWhUb0hjd094?=
 =?utf-8?B?dGQ1QUJNcDZyd2ZHdVZlZ3kvU0NXdVBjVTZpOHRHMVpCaENNZVZFWURBQmoz?=
 =?utf-8?B?VVFRZzhWc1d1S0Vac2ZNTWlBWEZrMmRGaTlIVEt0RG5GRTVEMFhzWDIzcC9V?=
 =?utf-8?B?K3JGb3MvMjNBK3RSRWtiYVhDZlpmTVk2ekllcTlSR0F0OVlJWmRIQlgzSUpI?=
 =?utf-8?B?QXk4c2FoZUkxcFVRQXRLQ3ViR3lNRTgvNE5QdUxReThXYzRwR1FoR1RVL1Jw?=
 =?utf-8?B?enlNR0ZCNXliVVl5SjZ5WmZUQ2RWMHhRL01sVzBuZHhoVkVBZE1FQTNFZHlt?=
 =?utf-8?B?UHJTYmllOWVYSjlPR3prdS9jSEg1Vjl6YzN0cHVsZjZWNUs4dmczcEJXb1Fi?=
 =?utf-8?B?QmNSMGJRMUhOMnBIVDhWZXY2emJBVzhOZThwQTYwejFadU53SzlkRE4wbmh0?=
 =?utf-8?B?K0l3UGxyZEtQWVRYOXA1YzhIV3BtV2RIbmlLOG9ZdW5VTExUTTU4Rm5NZmdP?=
 =?utf-8?B?cFhhUTRCMkQzN1B1ZklScmhqTWhKdC8wazRwUlhYS2NUWExtZ0Y0UmZQazBr?=
 =?utf-8?B?ZW5ybHcvUlhHNVZNNThCd0RVczNBdEpScEllb01FTnczZmVjMGJmTXdSV0I3?=
 =?utf-8?B?NUVwN205dnZjenhoL09ialROcW0xamVvNTd0YjBSUEh4TXQyZEVoOWtOcjNO?=
 =?utf-8?B?Ti9OSFdUZGNFbnF1cm4xQU8rSUxUdHhsSGRweVBXVUtQRnZmUllid0FacTM1?=
 =?utf-8?B?dGY2V2xuT1FtRi92cHFuSGdoZGJ5SkpwblYweEVkWkxLR0pPdXZXNk9raWR5?=
 =?utf-8?B?ODB0YVpnYjcySHUrNWFaUG1FalRRUmY1ZlRMeE9DYklEZEtyU0ovOE9lVnYy?=
 =?utf-8?B?dWtZdFkwelBWazF5UG5jSU9IcWtFc2ZtZmpUc2lzRmZpTTBZd1pHMlNELzhl?=
 =?utf-8?B?UzJCUEpiMWpzcktVUzJQM1hCeTRUbzJ0U2Y3T1dQbnJBUmowQ3RjY05BOWFt?=
 =?utf-8?B?enNuQVJuOFFCM1RsQ2VES2hYdjhwR1dOM21ZOGVoWXF4RlJFellTTFlNaC9S?=
 =?utf-8?B?bUlMcmFqdGxVZGJBMUF2TTlJbTc3V1FGVnpZTFNkbCtRL25reXZJWkZBdHpw?=
 =?utf-8?B?eW12aEdSRFJOV05lRDJvV2NHd1dGMDBsZjBJU0xLY2I2cVBTcDNyOG5EZklq?=
 =?utf-8?B?NlduVm5wS0tWRFpsYmRoaU1xVHJsVVBHREpZTllCTytzdmVDd2x3dWdhOUZH?=
 =?utf-8?B?czNBaDZQaStIVGVPUVVSRTlVaE1wTXJXZE1NSDlpQmlNeWQySjB2RUwxOGRl?=
 =?utf-8?B?R3ljdWEzTGhvZHJqbEJMYTExSUJyakRDeER6RVpZSUliZU1yeHMrcFMxS0xn?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d40d8c-c32c-4ae9-6caa-08de0fa74b97
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 07:07:13.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09QA6+VwMb0dqprWRtno1vdUsaPIhYkrSa6c7KGfbjcmvNqpJGB3G11vP9YPn7fUDPFxqUG+38B7p8dOVkza8CAGix/xMA/H75rUM9o3AIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550

On 10/16/2025 8:36 PM, Cristian Marussi wrote:
> On Thu, Oct 16, 2025 at 07:05:21PM +0300, Ciprian Marian Costea wrote:
>> Hello,
>>

Hello Cristian,

Thank you for your valuable feedback.
I will work on and send a patchset for this proposed support.

Best Regards,
Ciprian

> 
> [CC: <linus.walleij@linaro.org>]
> 
> Hi Ciprian,
> 
> I will have a better look at this in the coming days ...
> 
> ...but I think, in the meantime, better if we CC also the PINCTRL
> Maintainer Linus Walleij that helped us reviewing also this driver from the
> PINCTRL subsystem perspective....
> 
>>
>> I’m currently exploring a solution to improve the 'pinctrl-scmi' [1] driver
>> so it can better support SCMI platforms that only provide individual pin
>> control. At the moment, the driver handles only group-based operations,
>> which means platforms without pin groups run into limitations.
> 
> ...ok
> 
>>
>> According to the SCMI v4.0 specification (section 3.11.2.8), both
>> group-based and per-pin control modes should be supported. However, on
>> pin-only platforms, the current implementation cannot enumerate groups,
>> configure pinmux, or assign functions per pin. This results in probe
>> failures and '-EINVAL' errors when trying to configure non-existent groups.
>>
> 
> ...indeed
> 
>> I haven’t seen any work in this area yet, but if nothing is in progress, I’d
>> like to propose an approach that keeps compatibility with the existing Linux
>> pinctrl framework while adding per-pin support. The idea is to detect
> 
> ...nothing planned or requested as of now that I know...so feel free to propose
> your improvements...becasue it is easier to discuss in front of a series :P
> 
> Cheers,
> Cristian
> 
>> whether the platform supports groups or pins-only during probe, and when
>> groups are missing, create virtual groups from the DT pin specifications.
>> This would allow us to reuse the existing group-based logic while enabling
>> per-pin muxing.
>>
>> For example, a DTS node could look like this:
>>
>> uart_pins: uart-pins {
>>      pins = <10 11>;      /* SCMI pin IDs */
>>      functions = <2 3>;   /* Per-pin function IDs: UART_TX, UART_RX */
>> };
>>
>> or:
>>
>> uart_pins: uart-pins {
>>      pins = <10 11>;      /* SCMI pin IDs */
>>      function = <2>;      /* Same function for all pins */
>> };
>>
>> To make this work, the driver would need to:
>>    - Detect capabilities during probe (groups vs pins-only). Can be
>> implemented via 'pinctrl_ops->count_get()'.
>>    - Create virtual groups when groups are unsupported.
>>    - Add per-pin mux/config operations by introducing a 'pin_mux_set()'
>> callback in the SCMI core, since currently only group-based 'mux_set' is
>> implemented.
>>
>> I’d really appreciate your thoughts on whether this direction makes sense
>> and if there’s anything I should consider before starting.
>> Thanks a lot for your time and guidance!
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-scmi.c
>>
>> Best Regards,
>> Ciprian Costea


