Return-Path: <linux-gpio+bounces-2232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915482D9E0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 14:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C271F2121C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 13:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5BA168BD;
	Mon, 15 Jan 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="fJmevtSA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566D915AF6;
	Mon, 15 Jan 2024 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169]) by mx-outbound45-239.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 15 Jan 2024 13:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUiG2Cx78Gtx4ekq07dSbh69sPXotVx/sd6RwvMEITzl5INQHYKTXGBOFs4GUEwrQLz2ep0KaWCHX8bAgSqSWS1tiHCVaTLCXI4KG8KpdBPxb/NJs0rqtNHeksQ8M+13fCTJSDXdVrhB6dR5hv0T3yVIAg5lXbvct3Yem1NSQHo+8aMBAYI60BCC+g6jv0vUXvdyXqlZPWkqsHJjA7mSBXWCv1lk0BMREorEFVxmmi96iQKAWYqDqnP81HTiMqP6ylEgG/OBQXIZi6KjwPYSckuEN3wOZwBKD4M/1XjP1O533yH1ziCOI/o+LkTMzPnRi6waLiG5oB2Z49Q5kk6A3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U66kNV+nxEwPq6JzmRc7XVuiSHyrKSzuiysTkD3mYJ4=;
 b=KiO3iIySwhWNm/W7c8s/xNOW8l9SfOXVLRnhSQOpdQORTS/X8q8wkPJo9qsweunBSNCaUjrI6CjYlsoBp0dkv2nVGuydjUGXjLZk1JCs046thl82ePQ5f/D5ua26rvE+gZDueHDOZc5wv1CoH0HTS1rYoXwopv6IGCVKOGn6hD203POZlB62TrLxMCiFSHYtH0N6PET5uOnvOptu+xhjPytyHgcXhE4H4iCJ6T4hMGGJJBh9zMedLqYRQ0ycECPUk3v289TdzRDGiV8136AFBxa4Iqa3eSJ91AHnyWeOSPq557LiMT7RcDB6zmrJI/QU34havZI0a0fkLNtY5H5qZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U66kNV+nxEwPq6JzmRc7XVuiSHyrKSzuiysTkD3mYJ4=;
 b=fJmevtSAkMrhFgC9HyjH1M9sU4LKAwg6LPyMbXTaz6GoP112o6rXaR78OwcfiG1Lro0bqkx3QA0Uam89/FcR4Ay8BRrbk5Qg2wquhYdTPcBKDzVk8RmfI/vljE0fJesmKdB2ch6iqGF1pJO037Xvuw7VjzKXlx/YpiX6tfkVxwWcCx7/fDKrUnPF0Tplg5q5VnDqTdNaExjSmfWcRFvFjSSEVsbSTTyRIiOPFbPPuJNSk8N4mNUgZbLVFXoJcEW+mGnurDj/PaXFY1IXvX3Ktt3min/OVG1SyS/tnU2vZfE00YughsaaE/GqBVdAnR1ggk18HEgFq1TucbLyr0H6sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by PH7PR10MB5724.namprd10.prod.outlook.com (2603:10b6:510:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 13:16:56 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7%7]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 13:16:56 +0000
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
Subject: [PATCH v2 2/2] arm64: dts: imx93: specify available 'ngpios' per GPIO port
Date: Mon, 15 Jan 2024 14:16:05 +0100
Message-Id: <20240115131605.395691-3-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115131605.395691-1-hector.palacios@digi.com>
References: <20240115131605.395691-1-hector.palacios@digi.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1dcc4f86-06e0-482c-2017-08dc15cc3f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wfU7k0IrFPJeYMF9M3V1DhuAPPs3/GvAIJtjD3bHxtNsRPuSmx71IN1mJDY5LP/fc2o0YYyEuEBfBcgO0lv67jfEs+VxZ5tavjF0ExZgICYF5C5XSFGKpXGnn/R9iN7F12ZaRWM9CvMhSKg3Noou4M6OqRUjxCc2JYLC6IpiNngTPJLUavXwdv2ZjvNq9RLkCGF8ccLVsp0ZJ1bgZarNpKSYWk/R8n4qkefa9RcTZ+JmQ1JOiTH7Xh4tEErHUDzNafY3oNJv/Nt7G2Wd/Pu4SFt4nfkftVRfxrPsngklqURDV98mAVc86lniFd46r3LoNZ5iq4Zv7kwubrKdF/aGWA68cX9zBZWT6r9XoQwUEmereMPwDb7sul2X3KEMFLpv5M2kniGYl55tnwQCwr+q7s1ufRL2eDMNxa+BSHhBMlJB1pRQU3IFGxux/WOBNRxCkMYg6Zy9xSguCpiQ5Tahqg4Go8GY6Xj+UrrdqQApb860+28FfhtCC6hJHr+989MBja/EhRHKICniizeRYIhdSIk97SkteXw9w0JfFZX+emFoGlFqKEC9zI4imEl60LnY7uhikSGNgnig61g6Hq26Gc4Ni5HSOLFthKfO6aytu+67eMN3iF2L4DnpT66lFs5f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(38350700005)(2906002)(5660300002)(36756003)(83380400001)(86362001)(316002)(6506007)(52116002)(6512007)(478600001)(6486002)(6666004)(66556008)(66476007)(66946007)(2616005)(26005)(107886003)(1076003)(38100700002)(44832011)(8676002)(4326008)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?REpUNxTWxuvHrkx6jHVp+FzvwhU0UMQG8X9dwlFWewqtYbb5qmziThe7e88u?=
 =?us-ascii?Q?GFV+5q+WwdCaN7gPdCtqum9Zc9K03xizaxrkT7kCzUG7s290HL5NcjIRpV28?=
 =?us-ascii?Q?f5FCDD44IMdDaHEcU8Kx0TomW+qdVNC2qegITTk10FeCeQxHjmkQqBRcwZPX?=
 =?us-ascii?Q?xKhU5eAMAxwuUES7JsUXRe2F2KWhSLP2q9O6VpcLGtK+2Jby2faYE0v+OP9K?=
 =?us-ascii?Q?qZXdGXREW+zFNfWh24om++MvFWKdqHvoeCwQWXbnjt8pcj4irDKhZvZ9yPdJ?=
 =?us-ascii?Q?YZ8A1laQhz4Y6hWKXFwNcRBjwtjYTYMtMa4QIjBrvyrO7lSDQVR9+R5u64Dx?=
 =?us-ascii?Q?rziXBgOkJ9FJIvi/e4MhCHK1IwMh+PDmNAabD32Jurv7mKotyysstVrs1H1H?=
 =?us-ascii?Q?4hZ7LCSTLXdkEg+8BfML9Xvy8ATjjJc96XIB3qDfvoBskvSTF/cP0Xi5HDXA?=
 =?us-ascii?Q?7V+dTtsN6mdKzdHaehb00UkZ2YFoJ5k/4W/7j5O7DZ4XzsRXhbyjL0hJ9xhm?=
 =?us-ascii?Q?Eh1dgnoNs6YcfxPpCLeGrBJVy+QQXGWazMykSzD/GxhrfDoI8TxO8NuJDVPN?=
 =?us-ascii?Q?aXb+6RLsH+ktubmNkDGdFYFF3vPyLDWxTSX/L0JmrJjyWHRS9CewUSZAyzuv?=
 =?us-ascii?Q?3nwq/5LyK2sGDAXya9vQE5gNiM3QDaMhxv54e3ZzMKCjEy5vXvzfcma/k2I8?=
 =?us-ascii?Q?gasg5BHgFzcW8QS2ClAhjewFn5GI066Io0kKuDPCmF07Kpk/zqTa2vBadBO2?=
 =?us-ascii?Q?Gq6qMOkWWQTTBt2Cawc5+s/hZpWLUSTAC6Gq1SjjLhyBcRZFAiNWouaYiB8q?=
 =?us-ascii?Q?wXbFfB3GN4be4EIOnBQfuTIeLLABX7aXLEOa6HYJjjmVpv7evrlxk+AlS5jQ?=
 =?us-ascii?Q?fzWx43jFfmw4NuXsyYbSFvaNz2Ak9sdrIJUbA3BDvkboWqjjK9oALfpBQ7aa?=
 =?us-ascii?Q?a8n922Tr6iIxagP96VWzONwTrroA7TX8ZmFIin+PA28o9BKDsbw4hJwS5YQ9?=
 =?us-ascii?Q?Tj4Yh0vdLb1T/GwQfA56jbtkKWkioOdF7ZHe1Co7rMMHRdnHaE5k8kdszJ9b?=
 =?us-ascii?Q?no1RHaIFpB1UU1aarILU8TLVSX/Cs+EzYOAgC/VUe1RMCddHq7m7NMK+qblm?=
 =?us-ascii?Q?G+29l6lSiCVqJ2k37SEwDKMStj3dgSVdyOewG2wWPUyExvEL298Csm9avM+9?=
 =?us-ascii?Q?/D+gu176ISyi8xN3eTtv9/Zq+gtI2DD9jM0ZqG8lhgd2iXBIXw0C8XIXeRVj?=
 =?us-ascii?Q?ZlWKwA+rPxMhv+aeF+GD4BhxaCIjkDb26Y0gbNO1DMRvIl3m7MaBzEL+jPSz?=
 =?us-ascii?Q?gOqMCC6DkUFX5NKKDnHrhcON8S++mBTZVJB0sd/quKLo3fzNZ6mV6bYCaEK5?=
 =?us-ascii?Q?scbSOJ9tpkISnq7Ye2bJ7WI2NMynRUE7ftKh4/pN8uYRznrCTXumEoa3PAZf?=
 =?us-ascii?Q?RAria9agmhjJtuct3DZn+l6zRng8mIgFm9CnuDmna95EbZ0inBUtQvdIYV20?=
 =?us-ascii?Q?1RVOpx0HCFlnGZxR3hSdx1wGThGqe/rC6c8HI3K5AESehY0/XSGWPNESuzeE?=
 =?us-ascii?Q?iUyvLOEiTqczrQEmiTbvFSYT6RJZBeXDuNpwuoEO?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcc4f86-06e0-482c-2017-08dc15cc3f94
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 13:16:56.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfiUftyOfbyXbmLCwjHpA+bkqi+p+pi7v9nMVcdv5jAszw8vgcn4RSGLX9fzXK936VSOJWhRv4/n7+brEjz3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5724
X-BESS-ID: 1705324639-111759-12520-348-1
X-BESS-VER: 2019.1_20240103.1634
X-BESS-Apparent-Source-IP: 104.47.56.169
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoYmhsZAVgZQ0NQixdLI1DDR0M
	DS3NTQ0tQkNdk0EQQNE1MNTZItlGpjAVpic8VBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253535 [from 
	cloudscan11-158.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

According to NXP HRM for i.MX93, the following GPIO pins are available:
- GPIO1: 16 pins (0..15)
- GPIO2: 30 pins (0..29)
- GPIO3: 32 pins (0..31)
- GPIO4: 30 pins (0..29)

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 34c0540276d1..7eb2cab7c749 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -970,6 +970,7 @@ gpio2: gpio@43810000 {
 				 <&clk IMX93_CLK_GPIO2_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 4 30>;
+			ngpios = <30>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -986,6 +987,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43830000 {
@@ -1001,6 +1003,7 @@ gpio4: gpio@43830000 {
 				 <&clk IMX93_CLK_GPIO4_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
+			ngpios = <30>;
 		};
 
 		gpio1: gpio@47400000 {
@@ -1016,6 +1019,7 @@ gpio1: gpio@47400000 {
 				 <&clk IMX93_CLK_GPIO1_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 92 16>;
+			ngpios = <16>;
 		};
 
 		ocotp: efuse@47510000 {

