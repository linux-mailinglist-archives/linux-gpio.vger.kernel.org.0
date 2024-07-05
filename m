Return-Path: <linux-gpio+bounces-8070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4B19287D8
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 13:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA500B260AA
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 11:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C8914AD0C;
	Fri,  5 Jul 2024 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="D6kfg5cd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2075.outbound.protection.outlook.com [40.92.19.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA814AD17;
	Fri,  5 Jul 2024 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178542; cv=fail; b=j86A8O0Sc4FnTsd7WcD0LYqG9xHU3YDr+rnMq0VlPrTPlm1YreVPOHUnMx9IuDdZkIxSRv12Dastbh8gn3zWMxVnUCiCkO+VxpawB2/KpgoBRM3Bk6UhkRBIaO3s9Vw5WRsSImTNkqPwvQN/szwE+LRYBubl0Lx0LHuKbAK74cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178542; c=relaxed/simple;
	bh=5qX6V0AhzEU0wVfz+fyxJUYWIicoAwIgHTnRhrXYgzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ObzLmZfz67kfp3dxCzBxKAaUZlVtdT3+xIMwxc0kW/oluRXs37x0hscTc6fcMt2OgBZSe1wNaVz9Rkc6j0/nvh6roqFKvxbv1psFSyi/VDKRHZgyYbcDp4HkKGbZbdN0q9xWyGqic9I6aUfZ1a9fhayEBD0Rpb3SeXYuAzOMUVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=D6kfg5cd; arc=fail smtp.client-ip=40.92.19.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/2QQMrfuR92FxLuWDT2goJWqW+1qtPTFqe53q7STqeaesDMPz/O0erJ4jLUZLLJOTyWpvds7SZfhZz9WJKuPB5PIu49TKHusBzXLIcciNWkQLvpC+UJ/6suDrW6JbANniMv5LBv5jMUcydI1tPxPMMXnVKKq/7PPphVxUJgt5P+7wbE77jsjT7c3QTTs9nZC1hK02agJED+flTcYfVlMw3QnCM5rm0KfdrOoYKE2XYj4H2GRkxwHc22bNOlXIbOuKCpAGvfIYW/vWqgljA8MgDnUZNfOpFTfNF8Dq070FbUxVhRLLVp3Zrd7/FeDQG7qrxiWbmvXV8njGHmr8WBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqYVOcuTF6v7r3lIvkfqSTmPsLsBw/D0Pf4Nb4Da0XE=;
 b=UoMdaY+bSkHLosA7VH8POtVqMhbxvp6UAt6cpebEjlWKNPtvBxPSe94NoSH85sHyUxpqU+GnTyuGUbR4tDlrrXC1vcorymQpPrOygUNPTi7LHjr1l1V2JqVf6v6axCT5wDR69WhUL29I9mciyPNT6gBtaise4pirNCM3yO6x8+/9bSRZ0jQ+LXFI8ytFNFZcuAxYthyj7UnWLzhQKXAtBZDNeKr7pOYOD1h8zbcgF1tGMx3DP34i/NE7yZOw3QALxDDemwLjnH2V9iq5N6c+4U49hlbj6Jx68NfVmgN/Ac5JT0tGEtK7HUY8NJYlYSWjxVUpK0jdDYnccWh3Imcz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqYVOcuTF6v7r3lIvkfqSTmPsLsBw/D0Pf4Nb4Da0XE=;
 b=D6kfg5cdO9Ao0eOVBqbavMyZNPv9T1OHSnfxXPvtQI/uMhDDkdjlb30prdflK7D+02VxqRf/Sy44kStHIdptSOhjzGXChHX7lLDQZlw8sIK9iISzJmCl+y2ZGM+ME3KJ+3WlUhkBR/CJ4FEcR5+yTS2uZU/L0EJOBcZX6AvIf6gqqPf2JivrDJs7vg6991dNHOlrgPvoVSDR7rKlN7bzhSB1ZvkrJJsb8sru9UlCMiUt6jYmLFesQGYNIUToJ7vHxvKCKr3anTJiGaP5ULay5NLmIGo7pvzaQtMw7J/0qSqPX0XQRq5s2XYULUDapVetP2/u8GrZRuw0PFFEHedgyA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7299.namprd20.prod.outlook.com (2603:10b6:408:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Fri, 5 Jul
 2024 11:22:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 11:22:18 +0000
Date: Fri, 5 Jul 2024 19:21:43 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Drew Fustini <dfustini@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800
 series SoC.
Message-ID:
 <IA1PR20MB49538A4568AA698C41F6E734BBDF2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdajN7RjE5LOdv_SP6rR8U-vwXHXn=kZZo7thodeMem72Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdajN7RjE5LOdv_SP6rR8U-vwXHXn=kZZo7thodeMem72Q@mail.gmail.com>
X-TMN: [F1ox0bYhhLxo6kYEUJStpRaaFAlLdCrq8lukaZHwHaY=]
X-ClientProxiedBy: TYAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:404:15::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <uepk3ys6fa6zgplzv2t2qevgvgpsxeqtkry53a4ftbwktlnmp2@gunkagnts2um>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: fd325d58-821c-401a-e6d2-08dc9ce4badc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|461199028|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	os/1Qf2IqadKoQX5cXiIF5BQBg8esqPD/X1VZUAR/GpD57zicigq3/kVJa5IydbXTvcRXulk4dCrYDo2TkAN4DC6kE4CkM3JPfjj/HBeQc+FDVwR7qR1LhWBlds1qxon3eagMO8YbbzvjcGJOKh5RmaCAwLN+YVypPvMScSps0OwTGsxdzCI5YKB6SKVvRx+RpbduKJdSXXa1w5+No42DRnQSuFgH8ckLYw/9ljHae7sD7IvlSeqUlrny2Gn2N4lJj4zBXX1nz3nIg/rnQYiBTaTS9neZjVvQ/8VTwbiQ+cwcSjcumCZqDKQ/UkLNU8myu9aLmAjrtcmbNRSO0DCHFR13qAN0Sgwvig8jOsGhQgurqfykpp9OHjYkIEAljG86/96aqkljR9Y04mlUL1OPBcDfWfe8co5RH/RxNSXP3FiIrgGf2wnR0cSGAhuLU32oYoiZK/LvWc342AXsr7mztMDLzsJhR0A2SoeN8bsd9s0A1pZ2zEZm8xwmQbfAiTWI62kn46yD2wGJoew/jsNti1zCDtWkjt71WPbLjW18wFtlJT5poJaXpGOmxAFz6H9fOb4Qky/kiTPoEs1J29C5bR4ZwzQknCkeWS4wLmnV2AFBvxH0loD+FUtfEBKk4rB8KAnSrhqlRHqXMcc64CplEUaecRBwaRuSgXrGfWfh78kJAMBPppz/Q35QtxVjsXT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGExLzhiNmgyREhRUXdaT1Y1VlJLMVFXdmJCZUFSd2VuY21SaHpwMEZvVTlj?=
 =?utf-8?B?ajllL1RZSTJPVnU5ZWJ3dy9LeFMybGJidDJBWnpmT1YxdFpwOEVUWWRJS0lJ?=
 =?utf-8?B?ZHh5RVg1MTlYWGd4YVdYWUFVZEZma0lSUy83S2JjUHRFS3N2V1Y3bjlacDdU?=
 =?utf-8?B?NHJlZEsrY3hOWStQVWpoQ1BpSTIyaTJSNG5LRDJrdE55V3ZJK0tqdWRQeFhz?=
 =?utf-8?B?U0JoOVpGL2ZPUUZncWNUVkxBZE5vbjl4MUdhMTh4bUpaVEV3Y3BlczV1cFFH?=
 =?utf-8?B?TW9WMGZ6bXVYUlRzYy9lRlhiQ2VEb2lDMnV2aWxWRXdwaUhDU0MxckhwVm1l?=
 =?utf-8?B?TE9FN2dpMHNZUmFXeGxPOHl3UmNBNzdPZ1hXYU9pOUhlcWl6cDliMGVhMUhI?=
 =?utf-8?B?U1BicXBOUXR6UDdQQ2dwT1VNbExGdktnYWMyemZwSk1PbTEwakg2MWxiZys1?=
 =?utf-8?B?T1gyMXNxSDFla3ZwWHpPUVRISjVNMVRITkI4Um1LSkVwemt5UDNxWlBFREsy?=
 =?utf-8?B?L2hveEhQMVNqREl6Uk9uL0NKTDIxcStzL0taSmxXVEV0aVBNSkVrR1ByelNT?=
 =?utf-8?B?azVYcTFRNVpKZklIcENOTXJpd1hmRi9ISmhNaFUzODdkMmNEeUlVTGtFTGh5?=
 =?utf-8?B?RjVjcUtublZUQ2xWRVZNaXBoY2kzL0tOK1ZMR1VPMEptZ3N4TUV0T2JldmQ5?=
 =?utf-8?B?eUMvYnkxNTJjc0tUeGpYSkdoVWx3czVDRmZZbWJnbytjU01leXh5WFdLQVpK?=
 =?utf-8?B?TlV1VEkzRG5MWVZNcVd1Wlo2WWs5Ymh0RWF2QUxMTUl1OXFXa3puWTFvK0NC?=
 =?utf-8?B?Mld0TDQ0WmI1OW1reHQ4KzBHYmtmRWNGQktIQ1B3aGxzbnhDVUgwK1dLdUlS?=
 =?utf-8?B?TUZFbEZycklONTNlWFBydVczWGZtWDduSXNIQlNVL1huciszS1FIYUdkc3hO?=
 =?utf-8?B?VW9aRjRQOEFRMVZjY3NxV0psTWlLTUZod0VHUFQ2c2ZNQkpGRERCOThGNnFy?=
 =?utf-8?B?TFlRS05EWHVibjdCRFFSS0VmVVBtSWl4WE1jbzhwWjUxVkxQZzFDbVZjWnh6?=
 =?utf-8?B?WEJKeDYxUC8rTVhXUEhKQjVueUQrK1ZMMFljS3JCMjJneW9Ua2ZvNXBaSzQ5?=
 =?utf-8?B?VEU3VFNXNlpnT2o5S2dHMGNYZlpnNzBLZk91alllM0h4TEZGbFBFUktiaEor?=
 =?utf-8?B?SlJIZGxKcTUwVWdac3BkQ2JVaGtHSStBTDFSQWx3VmY2RU5MS0NOMVM4dzE5?=
 =?utf-8?B?YzB4ZmJmcXdOcHdyMFR3V0JLT3FOdFNYRnV3dzF6T3FrMHdYeTk3MkFVZEtI?=
 =?utf-8?B?SnZ5MTd6RENoRzhyTEVEM05oR2UzdVFsU0gxcXVLWlVKYkpBeGloWktGblNw?=
 =?utf-8?B?aFR5YkRBY2dCMHRNZ3l1NWloT0YwVlFKVmRGK0lyRFB5djhPQTZwNzNVQm5a?=
 =?utf-8?B?NE5sbHBRR2JOdkVKYTQrbFVJblMwKzBwL2l3Z2hQUGppdGthOEZEQkZ6NmlS?=
 =?utf-8?B?SlVQL1d5NFFVY0VDRkpaamdJa3ZpQWxkaW9QWEZ0ZkxOa29KOEpBQmpWTVRG?=
 =?utf-8?B?RER4YWZKbkpEU0J5VzhoMGhMOWhrLytVRXdndWFCeENYRXNOeDkvZUtTQ3Zs?=
 =?utf-8?B?NnFSUnpqTTVEUi83MWVoQ3BmSDY0OGlxL0RpcnZEM2xGczJSVlVpMG5Weito?=
 =?utf-8?Q?IDL5yLeTmzBRi06ATxVp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd325d58-821c-401a-e6d2-08dc9ce4badc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 11:22:18.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7299

On Fri, Jul 05, 2024 at 11:50:09AM GMT, Linus Walleij wrote:
> Hi Inochi,
> 
> thanks for your patch!
> 
> Some comments below:
> 
> On Thu, Jul 4, 2024 at 7:47 AM Inochi Amaoto <inochiama@outlook.com> wrote:
> 
> > Add pinctrl support for Sophgo CV1800 series SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> (...)
> > +          bias-pull-up:
> > +            type: boolean
> 
> description: Setting this true will result in how many Ohms of pull up
> and to what voltage?
> 
> > +          bias-pull-down:
> > +            type: boolean
> 
> How many Ohms by default? It's very helpful for designers writing the
> device tree to know this.
> 

Pullup in 79k and pulldown is 87k. I will add these to the description.

> > +          drive-strength:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 7
> 
> 0,1,  ... 7 ... units of what? What does the values represent?
> 7 mA? I think not. This should be in mA and parsed to any custom
> values.
> 
> If you need more resolution, consider using driver-strength-microamp and
> parse that value instead.
> 

This value depends on the type of the pin. Different pin have different
typical drive strength. I will switch to the real value and check it in
the driver.

> > +          input-schmitt:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 7
> 
> What is this custom property? We support input-schmitt-enable
> and input-schmitt-disable, if you want to add a new standard property
> input-schmitt, then send a separate patch to
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> and explain what the argument means, it should be in SI units.
> 
> For a full custom property, use sophgo, prefixes.
> 

Thanks for the reminder. I have seen `input-schmitt` in the generic 
pinconf table. I will sumbit a new patch and add this to the 
pincfg-node.

> > +          slew-rate:
> > +            enum: [ 0, 1 ]
> 
> What is slew rate 0 and 1? What does it represent?
> 
> microvolts per second how much (I don't know, just guessing)
> 

According to the document from sophgo, 0 is fast rate and 1 is slow.

> > +          sophgo,bus-holder:
> > +            description: enable bus holder
> 
> This description is a bit too little, we need to know what this thing
> is and what it is
> used for. If it is definied in some other DT binding then reference that file.
> 
> Yours,
> Linus Walleij

Thanks I will improve it.

Regards,
Inochi

