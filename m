Return-Path: <linux-gpio+bounces-2231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E503282D9DE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 14:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F8C28169A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 13:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ED3168BC;
	Mon, 15 Jan 2024 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="At4+mGbl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432ED15AF6;
	Mon, 15 Jan 2024 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169]) by mx-outbound22-200.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 15 Jan 2024 13:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bsxv0kpEBdeCk/IHGl3s05sNF7l+eAiWQavIL9Vs6NBy7Twd3SKdXYRuaOQ0XNfy59giRAayR4ggSDawNAR+9kuhONJF5BmeCD7QfkUMpqxbJTe1bghy/UBvru2sUMUGmzvLOk8Fe1H2YcS1oKhdL6lH8bG3o8CDtay0PQfkpQvrvMtzI6jacCBskI0zTGBdPOSsVj8tCwd6PQAoIWwnz84UfBCO3BU0fK8wFddMMVUE0RDGIIJGcfVxQW+Du8UW1mAk8e8m6vP6VEBVYia14NZ42TxpeDAxkEaKTW5DfAjpUrFF+FDIiTrW2RpmA3pJh5Br72v5wB94tA8bJz9FPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MR7mGV6FE0HbDsqxiEceQFqSODkqoBb9AZlhk6bCtg=;
 b=KS7Q9qJ9/GncFm830BYQC6V0lIdptc2RP4SCGY0xFmyvsyG1khaZ/YTcDNBNc/VeaGD4sqmxl5SPg+fO9Cdr+bZN4yF9qpJMmuY1aEPsoaeMENvQTm61BL/qO312y+aWoRHHy7FKIUxl4hGe2CU2g0lScdIzRNmfMrWClXtHhtvX0XqYb/iQgLreBsW3iz1stSmGPXCZWXZ0D7Zz/VzPsWC9td0vmyt7zBTic7he2cETIDq45qMNgiosCK3EpKJCIirfgYWi94vU8Tc+7K1mfYPM2Ng7Z6lMfv0fP8S3/hf9P3NplB3B+IH3TWJsd/Dws+qQqiXWTkvvQQLXFgnQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MR7mGV6FE0HbDsqxiEceQFqSODkqoBb9AZlhk6bCtg=;
 b=At4+mGbl/V5Y6Pc7r4ld5zQyqdcILAwu3J+mQLgMtVEwQTufQuA+oiy2ndIFRTkINQeWc9+5AydTn215fXnE67TUdYWXS7P3wwrBlGsxMVH4ksmGOBPWRqdXWlZ9d9A+a6TFhwit9pgV4cDqC8xtRpxXWJdfG7ueYXK3DiImfShzIjg3iaPY1+SapkAzm7DmO3isof3+rMtROLc5aaJPHlA5U15KKVF5lwOkDwExMLn1nfDONMWhVYJ0xn4Pryh0QDGsEMtlDLjXyDTtGCzJeJ2Wjt/jx/89pXpMm82xm8CAg73u8yB6Urr2JJOhY40Km4bx03k1GBLOhR7QcszRyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by PH7PR10MB5724.namprd10.prod.outlook.com (2603:10b6:510:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 13:16:50 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7%7]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 13:16:50 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org
Cc: stefan@agner.ch,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	peng.fan@nxp.com,
	haibo.chen@nxp.com,
	alexander.stein@ew.tq-group.com,
	hector.palacios@digi.com
Subject: [PATCH v2] support i.MX93 truly available GPIO pins
Date: Mon, 15 Jan 2024 14:16:03 +0100
Message-Id: <20240115131605.395691-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR08CA0042.namprd08.prod.outlook.com
 (2603:10b6:4:60::31) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|PH7PR10MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9e862e-36bb-44b7-6592-08dc15cc3bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vRJBpPJx6VUrI4O+wwQEz67aaHwHHMl9CHP4rcaEobfVmEYdKiBh5tszYk6c0wtKzZPYn/FZbXEMVCVrXHQmJCI3PgyycHMF0pMIrU/JFhLu386tQTdtsyssK9YdgBYY0hpLZwPTLL1EiOHn10J9JX2UDnd7iWEFUCoe/W/iB64ihlangYl/VFbeTt9PMPIWL21xfwzg2qHCkqG7xytw2zWBkpJzJyjD98XlBcoTu7p7aiwfHgTuYlDTJC3nmscWiEpZH/RnQ9Nw8NpFSNwUvkMKrKKBBczrOZWGimkZaVEGYIAGqY1MSd2YTPesAo3HBI2aN8fkOw+xrmGn7rA/reoLjqY5cigxoijXJ/zriAx5jTT1uORd7EW+DIgsii2Igq1EtggX3WP0/tqgkA15HzPFHRRH1wWGBpMUtGOwIETiIk6q9TG/3Kh2hkoDUtqR+Xk3xjAYqVNygteujGACk+R2UBHfUtX7mfZ+KRwwyQ2FlLINyYfd+EarXyjQaaNkRE1tve/8BEQ7CWGuA6Y1r/Mcgj7sPnPutIQ3Fy5zlpF0mc1LLwUNPyxyEf/PksEFwuH6n3VulGYW/V8h1KcFrwD8FNLuVcBm2lIfolEFGRTuRM2bWM3trT5JGTr6JhQ7IqLig4rZ1LZjg2nZgw31Ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(38350700005)(2906002)(4744005)(5660300002)(36756003)(83380400001)(86362001)(316002)(6506007)(52116002)(6512007)(478600001)(6486002)(6666004)(66556008)(66476007)(66946007)(2616005)(26005)(107886003)(1076003)(38100700002)(44832011)(8676002)(4326008)(8936002)(131093003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UDUqqXDdF2q35NqO62wllnNT8TsGCPuDa2SRcUqV1ovzFMyXmIjqR4aVz+YT?=
 =?us-ascii?Q?GIersqnGRj3Km73P8J7C1CjqlPlCWq4kFH9C30FRGvuID45i80Ffdfw//Bsq?=
 =?us-ascii?Q?mDycGcUG3na9JbGpEDE4frrTIu3poO0QM4zNvdoZjdTncxhzvBKoFWzYr+Ia?=
 =?us-ascii?Q?B0d1AEsPA5OoOSG9Th1sTX0x/W367h6EMRk+dJwzuDklmLRo3MBJNMpM3tJF?=
 =?us-ascii?Q?098jnj7iYa/JDhoFw9GFO8AFp8HEk0Ua6X73r/voD911C0UEtISpSLePEhbS?=
 =?us-ascii?Q?odl8JOsra0+smCf4bC/wj/USYB7MgfJVEdQ620OVkriTxntapx2Ax4A9b+9N?=
 =?us-ascii?Q?J+6g/IEzwXzRBEegSf14khmd/YqJLEuAamWvklG5Tdtk3OiTH55lghR1sxXR?=
 =?us-ascii?Q?y3bBGuEm2Blme+mpT7zde6ezQxC1C+XxY/UnoIb7GeEYgn+8nYvR8ozqWtWU?=
 =?us-ascii?Q?+k+NSKgL8aHF/ldKeolTRbv1ExfvH9UynIxOqm5SyP2X/QW7RjI9fizVML3Y?=
 =?us-ascii?Q?twQGK4VEcyTny8sZNBafYPvNSCODoDg5mhrcM1gCBsweBP3u9AUXts4X2gsW?=
 =?us-ascii?Q?tdkM034cfWEWKRtfrEno34LYbiyx1UXm8TQROudOo/3XDPTFDMUBOgd9ZHLe?=
 =?us-ascii?Q?tOR0yBnAU2iiVgQQxgWU1OtGVJBOAGlnrjumHjJXJm+zB5vLv4NLUtrTr/Na?=
 =?us-ascii?Q?fC+jpw18umSs2qbfjVQyL1+7Iz+wPk7rmqP/DLmnWROpSir2B3xRTJIqZDRG?=
 =?us-ascii?Q?RWvT84Qm+tQz2rfKQ1INruOD550JT1/hVa5OH6QbEMFZ73Ci18rUnrN96CuZ?=
 =?us-ascii?Q?rysxo4qa7kjXvlosl5FKkG0qtBHF6sbUEnivJhLP26xfXfFk8m7o1+h9O8fe?=
 =?us-ascii?Q?UP9RecCoW0ItHT8L3kmaCaYTXyvzxqkhXMauHDyw8gLymEQFQD5LO0H6Umzf?=
 =?us-ascii?Q?7cqhLAqK11ffwKtq7wiDWw1rHhBrMqOu2qMLZcm7nrg7wSvG/k8j4DqwSkMA?=
 =?us-ascii?Q?S6uChif/C8v1HHOnPHyyxf4FZFNNX+lNHPVvrGRtuo3qibv8LjbnahSQTmeh?=
 =?us-ascii?Q?ETTUwGq7G/i7cgMIdpY+IiO1OkTvX60WwX6DeGcbFg5hGR+Gs1gtDicbWyoQ?=
 =?us-ascii?Q?bjsw2ZmVi4CKp+6gvVGYDPt00liTNOejqi3zdwVjIlwgNup3YVfkj0ydIbIW?=
 =?us-ascii?Q?M4lu/0nN6JtaSe2JB7xWydUPzw320tgbDlyQNI02VWYb2avxQlMPc6KltnW2?=
 =?us-ascii?Q?XKPJFGpFf13wfjbPxi9rCOrHWjokBUq0lmS7QqHbbTh2fhZc0EOS7u+uGG8Z?=
 =?us-ascii?Q?uXeoV69FM6rBxc/9OGPAvAtSdw1kkWVhYHH64RuRTzilKg3RU0EupTgFHx8/?=
 =?us-ascii?Q?MK4Z0hTjPivSXUoJI4Vpgfz5K+sUKElpyjV3Ax4hKJtVpohIO+tbQCk5F7i4?=
 =?us-ascii?Q?xdbbYHvxLGdh1kWtZf7+wSTVPiCKKqY0cPSW2orU32hL58wLdWT6vBq9jvU+?=
 =?us-ascii?Q?H7Pps4yISI6LNzcLIivcuMUKjN6cvKjl5AlG3jJwhpoSvyT151JMOLyF3Wb6?=
 =?us-ascii?Q?GqUg7UZbfFWm+1zLmWYPo4aJhRHTzs9eIKKqYxad?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9e862e-36bb-44b7-6592-08dc15cc3bac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 13:16:50.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brfJGPtZCMwdkMvyCRAoEFGecFnbbZ7aEBkemg704w78XOreBG/Z9fYYEh0fV9/FF7/tsPeeasTMri5TWoP5NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5724
X-BESS-ID: 1705324614-105832-12428-1353-1
X-BESS-VER: 2019.1_20240103.1634
X-BESS-Apparent-Source-IP: 104.47.56.169
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVmZmBkBGBlDMMNnAItEwNcnc0D
	jF0jQxJTkxycLcLNE4LdEszcjAME2pNhYAj3vJsEAAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253535 [from 
	cloudscan14-64.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1


All four GPIO ports of i.MX93 SoC show 32 pins available, but
not every port has 32 pins.
Add support on the GPIO driver to 'ngpios' property and set
the truly available pins on the SoC device tree.

v2
* Add 'ngpios' property to DT binding for proper validation

Hector Palacios (2):
      gpio: vf610: add support to DT 'ngpios' property
      arm64: dts: imx93: specify available 'ngpios' per GPIO port

 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi               | 4 ++++
 drivers/gpio/gpio-vf610.c                              | 7 ++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)



