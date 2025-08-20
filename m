Return-Path: <linux-gpio+bounces-24654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7CCB2E2A9
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CC418830D5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6863314BA;
	Wed, 20 Aug 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hIaPCsGk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222913B58D;
	Wed, 20 Aug 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708613; cv=fail; b=TJ4lTj0w5zESdEajKQZImlxejDwUfKdSKVnRj1Ur+DbelLWDAuo0Rux8HhYhg7Vqjl0eTf1ITa7/1IoWGniw7e1SS3IlJQrNdcg/jr2tNIoV8z9bYLr7d4oHrH1J3CCdfuIAL7hsngGd2RnyyPwuGFrl/pKBQ9ngsfwiR1EMhkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708613; c=relaxed/simple;
	bh=y0WHRDRcGRa2VV+Vr6ywPsu3Swk9L/qdQm4mArkKfxc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZfQz5WlOtyzMZJsQapQZv1UXlXIANk7gRTGHpWqBrxBMlsfdj32jJaxdF95WWTv9NMHtDXAL0dMDswnDrDw5uaUJ0ilHH2+rIw9GmjTf8EP4I9iLEpuAoxSiYVY8rXpy8k5xC7EchjPWwEGHQ9Ol8DZk/xkkVm/8IMIa3SSk+Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hIaPCsGk; arc=fail smtp.client-ip=40.107.130.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeCo/PVoT5oEoxwPP6JzJUusiynkVzmD97n3oJ85OhgjugpsK4/IcLebThh/LfBGtkgAsvIgFIk/CKmv3pkOLdj+yBbb2swiT7YOiBHv3OcfN8Qs7a4Don3ZepgL0BJ5xwySavt0pGyi7xC5uvRYGux3wDHDxo1zg0OUcWqjcDtbvU4BNgm08gWOlL5DHx+AyD+RWjEsTUcB1k2f0O5lDhn0llFSWrTKFYBMSMVABI8MlsGfX3JgX8I3hS924k5sSEuwy3DpjVvZn415ZezSLJjIbBAELWkYRhe94gteKvyo1irl3ZZHF3B8+ajhUv9vRVOcVYTwYIZeZtxf8hTGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aqAiit2WG7l1+p6tYgqlCN4YXImpRtsEulIKW/NJsU=;
 b=LkillOYCMm3gs/31IiQHRKtxn/mmjtUwGb8BTCkfzlpOQHoTTL/k6APf9rFb2uFCjZQcDbA1YaFUvchm39VKDBIsjHoW0W4qahL+8sTrPd4BVxqQGTkZNXyCs3ZhCgJGOhbjZggHzUoC61Ap1pn+IpwGN2LjLOGUMchI0FTQI9fJlevpkHAC+zOE4BrdhIXq2Xq4fa8niY4/A33J7xb9MKPsBxdJh2LYBGVHsaXZPIs1DcA/G+2IGF0buqVHJ1X2ho4gV174Oike0OfyvqlhO/38eoVAojeVH+gtzXrhJHK0JwNw8UGvguX85dXi8hxbDyW2p+Nnr03sFnQN+GnlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aqAiit2WG7l1+p6tYgqlCN4YXImpRtsEulIKW/NJsU=;
 b=hIaPCsGkaFRdLugWwP+2nRWt3WZPN2QULWcnyhr96QAmYkv6/d54DPLboroqC9zr08+xnAQoS1h7FP7zevz87YLwgqNKeZ5Hwz72beeJ8UU/xhQFcNxvan1Wzm4OCr3k5MTcwlsZrkUWPwnJE7/Xfph/do4YGKGNKLBSGls9Ip3bWSdTVk+e+fGQWRAmVQqOCZ6pzxXTtAhdyXShF/e9L5SvZjpnM7r+kKyi/Pvjll4xe86xmfw2GeiILSbuVFQW1AqPa573y5e/kVd5qBGohkUKZd88FVIBeYWRh73xRFsJfrJYSrhAKxSUrf87oE8Fr1gxMWaNwsPhf/pcgMTlAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 16:50:07 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 16:50:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
Date: Wed, 20 Aug 2025 12:49:45 -0400
Message-Id: <20250820164946.3782702-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e147f96-cd52-41bb-25de-08dde0099d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?waW/RWNfjuwfE4rdGjmjfKQo0JQKdyDOutqMFocY9jf7LP61z03Ts/vcJKAD?=
 =?us-ascii?Q?+loNM1+yqbgEeWsOgnbxMDe1R85JUK2AZkfGJFy4qZc8wkoYwkaQl5sgHaQo?=
 =?us-ascii?Q?/dgovu0LfQ3P2Dz1XUKh9OodFGFJ3fvFyrNb/B/06yUElJIS4HrRF+eZOsqM?=
 =?us-ascii?Q?+0D3jzrOtgcJp3EcDddgRfppuSjk3OQlCkAcexOZarY7I2enJCv0unufwGou?=
 =?us-ascii?Q?alQ4BbqFaEQMdb3xPvu+NhXUxUnF+n3jNk5bYVg4I8nmc9YX5IFUBCWJz7eL?=
 =?us-ascii?Q?CyVe9bR2i558O9c9gg1LMs1OKAOmz4Jbcak8GIczlmJjDp96J+fEhc5S16Cj?=
 =?us-ascii?Q?4mJvPKoKYUOmFTAdftMhxqceRIkTCHpsej75T9kDwZAv4yD0EtmtFity1N+C?=
 =?us-ascii?Q?w//FVGG4iWnC+4wTOYQI7boUZBiKOV18WacUQ70OEaBvQYdfA8JewIlGp44C?=
 =?us-ascii?Q?HLgMHifzDXmq07Rt8rCj7v61bMth/BP/oGwAn/f+p4NUhTS91VCR4zUqD7WY?=
 =?us-ascii?Q?JesQDRm1fk3KA7i3RKhnMaAVNZ3F8VQe22wfiTQZ7oivEtGY0uPWeWgThK7l?=
 =?us-ascii?Q?IyFY9vHJbCGQCs7SyBHXV+gPoIguxjljyejZFgalUI6JZCbXlr2AVhyib78f?=
 =?us-ascii?Q?PHOcJTTjeeZhjWLy0+vbWOzTeEGUG6/YKPODx9HrroPyrj58PXyiut+vauwG?=
 =?us-ascii?Q?yIfbnZW/2DCqzzyBSb+v81l0t+302VwzicwtVuhnW3K+9U0xg6LaBvl8DLNU?=
 =?us-ascii?Q?kztWVY+VSU8+dcpvXeBkHdztBtWxJWTqDZZNLpufr2d8fRweYie/xfgtDcun?=
 =?us-ascii?Q?SF9WG22hnY0TZpn5x/EHrYov3Nmw7tf6TItMXt1IVEcP9H9/tveT+rKtOANf?=
 =?us-ascii?Q?NSwCBP7vkmDf3Y6L+56qLGe3gW/SvccA8hknNLOTsNP3rC10cNfO3hxwqZfK?=
 =?us-ascii?Q?rnMxAZKwTod/kPX7Tb3+bK5sR0x0yahx3m7vqPgbZ7FV3zpEUhmk83U0ULDf?=
 =?us-ascii?Q?zzEULm4JJlrdeG/zomzVdi7DTn8MGA+DrR6MJG6kFoPKtNr3+jk9jY1aV+ii?=
 =?us-ascii?Q?vm+UF+syz28ETSUyZo4EsUftZuVEvn5Ug3vvHZwN93xL1XT3U+9QwrjhZMis?=
 =?us-ascii?Q?DaZm27dIgA2HVXjHiyxGN/6l+of0JGwv9C6fN4XG2gY8lmT/p2eokaEvCIoT?=
 =?us-ascii?Q?mHY0+si7fRiFLbQe9u4StlBJF1SSzMdxjR9CTtxx3yKFcoGrljk9m48QVr9b?=
 =?us-ascii?Q?/7XmhRNZc6CoBjVyehwFpnllLz5tJkYAazzHdA7krXBQccas8MjeBTnh2qEA?=
 =?us-ascii?Q?JUOLlWOhDkCe5zESUOzGfR1RtnTk+l/B3AcEQrVr23ZygckemjynVpFKwsEF?=
 =?us-ascii?Q?3soNFJ+ffVh6VaVPPjx1+dNU2PvnV4bvyXD66+WOoWCzp1QVggEe488nHssl?=
 =?us-ascii?Q?G1O4AShsM0xTzI0XtZp7rtRTvfy7OpCaYi9wKVTMrFizZUQ1Vxk3Ctwo+ilo?=
 =?us-ascii?Q?EtJbyjwpa8cqbLA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0tPHI/d8BoF0cpEesmfFmvnrclb/7GEdClg/T8fMD2Al6WimK288V/voFcyq?=
 =?us-ascii?Q?Zam/POwJiIo9OsfeOLP93lNPjwM74xN8oBnzZr0JvRDnOT5qsA+zSnhCj7KP?=
 =?us-ascii?Q?+b7+KkS4fmLcH/0P5MoxPibD8jEg1L2bzHM2NM3b91kNg4uRuFAb8vwbJP6a?=
 =?us-ascii?Q?0r4lqqTzeq2VfuivbLXNErAlVpOPXfv5jpd5OfeVn1RpLFcbH45qDMowOTm1?=
 =?us-ascii?Q?vKK6yR1HSdaHHDIbuXmYhSuLO9ZWdNs7FB2PYrVn94hJ6vTNLjKrjTO9NF69?=
 =?us-ascii?Q?E/fKeqsS705QChq4TgvELaMuNmGbonySD9UUbdcVCTg9AYys8kkpPukKnBh9?=
 =?us-ascii?Q?MiOidqBXFM4AfoMqinTfP7KAyt2yzOM3JZ/XGT7CMGeisUyGrrU3ZAI5p2xG?=
 =?us-ascii?Q?MVCYFGBjrgrxIZ13B45eQnirakK2f6ZpRGAhx9xhNgu0eNgGtFHvVWY/R04T?=
 =?us-ascii?Q?q188xFXgnee8zXmgaQ5O6rLzXHL4x07sLyRWuWeF4SAgpdt87H9nPVsWgoX1?=
 =?us-ascii?Q?b8INKyDC5hUJeedP2Te8HKx/KzdgiJir95zhqB6NOe8k/AZZd7kSylhX7YXA?=
 =?us-ascii?Q?CKFk2sGPYXsgmGocAGoxntZB3rr2oR0PZsImVGd9uber8lk+9Fw9/TmI84g5?=
 =?us-ascii?Q?K+0w38X4/TQd5SwOaylSpa2oiFK2XmSKMKupqUc07wpfyOSU+TaqG0F0+kBv?=
 =?us-ascii?Q?Y6ga/a78X8ftGk6C/7rGRhEKvqG3eKhwbI08N/PqUiawH+CJwd+Ah2DUuOPJ?=
 =?us-ascii?Q?IuWVeKz8s3YFUGiwGuCTCU1xbUFTjx5jCy1ws741jUb60CBSXGltnu/+IyTD?=
 =?us-ascii?Q?5UcPYjOR1CeqfBmCY+Wwu9Zi9iJlV6Tm07YFlpIg0GDCxcU3ats5tgAUs9eo?=
 =?us-ascii?Q?f/jNEMshib2UQPNAl0RHO4XuAtYTF9pc1Cqvvi9erTFBtH1h74nGm96VNTz8?=
 =?us-ascii?Q?y95JvJu5PytY70mZp/QiFGCWy0taR+oMvunv8tUQhVS+zCQkYMTadK9QyTu6?=
 =?us-ascii?Q?O976Uz73mBbRXGfQezubax+Zo7ZkSyVBtOUlyVxkfxCFY4GvFBbtKz0AmWYP?=
 =?us-ascii?Q?GGU9oswTfM5H5UdoQybmmvecYrSXyduHetRl7q/9nmCkf4jTLomrexYDkEfV?=
 =?us-ascii?Q?6devurMOnLX88JhhCCqchfHT9SvdIO36y9yib9AYCXNm2GOGQ4COw2htZk80?=
 =?us-ascii?Q?ShyzY88ssMf2wjyPxyiQidT0/Kq5joy9Y/dd/YAw+a+JOKUMgmi6+iyItlZm?=
 =?us-ascii?Q?Ai/AH2CBTYqREAgw6uTZbCabvFZGnAwA0QUZRAzFzG1RNcF+Feud1S+PNRZt?=
 =?us-ascii?Q?z9iLOI5cQBIgzlna3b+UaMAw4OBR13h3rZNQJZ8N5I4DifkS/SJwnjrPn4vj?=
 =?us-ascii?Q?qnk7ABbkNiJgw6pZbkoCoPWWND4FwvUbSLpvJIlDQcP93XpK/aulX+MswZNZ?=
 =?us-ascii?Q?i0joomGU4vme9j6KKOEKvYLMo/P9hGdzeJxCyge6mczzWImD8ZA6ozsaO1W5?=
 =?us-ascii?Q?n/yvIZPY5xVWmjSnKo9qK7N4fmnOhzEK2SPTXlio7CP5FsaXfvz3Ewj3NRVT?=
 =?us-ascii?Q?o/seWiRFRiSApTm3k3jcgfBIuv7kAOn9E1/wNRvU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e147f96-cd52-41bb-25de-08dde0099d71
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:50:06.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZs/dSG/NH4hOr6HhYGTLBB2Bd9Kk/SDskIUUrQxOgUY2zvMSenUwdOMlkwcf90FoQoT3n7RWlV/hEGlef8cRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913

Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
below CHECK_DTB warning:

arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
   'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2
- Add more description about over 10 years devices.
---
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |  80 ++++++++++-
 .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------
 2 files changed, 75 insertions(+), 132 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index b58e08c8ecd8a..aaf97124803f4 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -18,9 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx23-pinctrl
-      - fsl,imx28-pinctrl
+    items:
+      - enum:
+          - fsl,imx23-pinctrl
+          - fsl,imx28-pinctrl
+      # Over 10 years old devices, driver use simple-bus to probe child gpio
+      # Devices. Keep it as it to be compatible existed dts files.
+      - const: simple-bus
 
   '#address-cells':
     const: 1
@@ -31,7 +35,65 @@ properties:
     maxItems: 1
 
 patternProperties:
-  "gpio@[0-9]+$":
+  "^(?!gpio@)[^@]+@[0-9]+$":
+    type: object
+    properties:
+      fsl,pinmux-ids:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An integer array.  Each integer in the array specify a pin
+          with given mux function, with bank, pin and mux packed as below.
+
+          [15..12] : bank number
+          [11..4]  : pin number
+          [3..0]   : mux selection
+
+          This integer with mux selection packed is used as an entity by both group
+          and config nodes to identify a pin.  The mux selection in the integer takes
+          effects only on group node, and will get ignored by driver with config node,
+          since config node is only meant to set up pin configurations.
+
+          Valid values for these integers are listed below.
+
+      reg:
+        items:
+          - description: |
+              pin group index. NOTE: it is supposed wrong use reg property
+              here. But it is over 10 years devices. Just keep it as it.
+
+      fsl,drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          0: MXS_DRIVE_4mA
+          1: MXS_DRIVE_8mA
+          2: MXS_DRIVE_12mA
+          3: MXS_DRIVE_16mA
+
+      fsl,voltage:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          0: MXS_VOLTAGE_LOW  - 1.8 V
+          1: MXS_VOLTAGE_HIGH - 3.3 V
+
+      fsl,pull-up:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          0: MXS_PULL_DISABLE - Disable the internal pull-up
+          1: MXS_PULL_ENABLE  - Enable the internal pull-up
+
+          Note that when enabling the pull-up, the internal pad keeper gets disabled.
+          Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
+          will only disable the internal pad keeper.
+
+    required:
+      - fsl,pinmux-ids
+
+    additionalProperties: false
+
+  "^gpio@[0-9]+$":
     type: object
     properties:
       compatible:
@@ -80,7 +142,7 @@ examples:
     pinctrl@80018000 {
         #address-cells = <1>;
         #size-cells = <0>;
-        compatible = "fsl,imx28-pinctrl";
+        compatible = "fsl,imx28-pinctrl", "simple-bus";
         reg = <0x80018000 0x2000>;
 
         gpio@0 {
@@ -132,4 +194,12 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
         };
+
+        lcdif-apx4@5 {
+            reg = <5>;
+            fsl,pinmux-ids = <0x1181 0x1191>;
+            fsl,drive-strength = <0>;
+            fsl,voltage = <0>;
+            fsl,pull-up = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
deleted file mode 100644
index 1e70a8aff2600..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
+++ /dev/null
@@ -1,127 +0,0 @@
-* Freescale MXS Pin Controller
-
-The pins controlled by mxs pin controller are organized in banks, each bank
-has 32 pins.  Each pin has 4 multiplexing functions, and generally, the 4th
-function is GPIO.  The configuration on the pins includes drive strength,
-voltage and pull-up.
-
-Required properties:
-- compatible: "fsl,imx23-pinctrl" or "fsl,imx28-pinctrl"
-- reg: Should contain the register physical address and length for the
-  pin controller.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-
-The node of mxs pin controller acts as a container for an arbitrary number of
-subnodes.  Each of these subnodes represents some desired configuration for
-a group of pins, and only affects those parameters that are explicitly listed.
-In other words, a subnode that describes a drive strength parameter implies no
-information about pull-up. For this reason, even seemingly boolean values are
-actually tristates in this binding: unspecified, off, or on. Unspecified is
-represented as an absent property, and off/on are represented as integer
-values 0 and 1.
-
-Those subnodes under mxs pin controller node will fall into two categories.
-One is to set up a group of pins for a function, both mux selection and pin
-configurations, and it's called group node in the binding document.   The other
-one is to adjust the pin configuration for some particular pins that need a
-different configuration than what is defined in group node.  The binding
-document calls this type of node config node.
-
-On mxs, there is no hardware pin group. The pin group in this binding only
-means a group of pins put together for particular peripheral to work in
-particular function, like SSP0 functioning as mmc0-8bit.  That said, the
-group node should include all the pins needed for one function rather than
-having these pins defined in several group nodes.  It also means each of
-"pinctrl-*" phandle in client device node should only have one group node
-pointed in there, while the phandle can have multiple config node referenced
-there to adjust configurations for some pins in the group.
-
-Required subnode-properties:
-- fsl,pinmux-ids: An integer array.  Each integer in the array specify a pin
-  with given mux function, with bank, pin and mux packed as below.
-
-    [15..12] : bank number
-    [11..4]  : pin number
-    [3..0]   : mux selection
-
-  This integer with mux selection packed is used as an entity by both group
-  and config nodes to identify a pin.  The mux selection in the integer takes
-  effects only on group node, and will get ignored by driver with config node,
-  since config node is only meant to set up pin configurations.
-
-  Valid values for these integers are listed below.
-
-- reg: Should be the index of the group nodes for same function.  This property
-  is required only for group nodes, and should not be present in any config
-  nodes.
-
-Optional subnode-properties:
-- fsl,drive-strength: Integer.
-    0: MXS_DRIVE_4mA
-    1: MXS_DRIVE_8mA
-    2: MXS_DRIVE_12mA
-    3: MXS_DRIVE_16mA
-- fsl,voltage: Integer.
-    0: MXS_VOLTAGE_LOW  - 1.8 V
-    1: MXS_VOLTAGE_HIGH - 3.3 V
-- fsl,pull-up: Integer.
-    0: MXS_PULL_DISABLE - Disable the internal pull-up
-    1: MXS_PULL_ENABLE  - Enable the internal pull-up
-
-Note that when enabling the pull-up, the internal pad keeper gets disabled.
-Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
-will only disable the internal pad keeper.
-
-Examples:
-
-pinctrl@80018000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "fsl,imx28-pinctrl";
-	reg = <0x80018000 2000>;
-
-	mmc0_8bit_pins_a: mmc0-8bit@0 {
-		reg = <0>;
-		fsl,pinmux-ids = <
-			MX28_PAD_SSP0_DATA0__SSP0_D0
-			MX28_PAD_SSP0_DATA1__SSP0_D1
-			MX28_PAD_SSP0_DATA2__SSP0_D2
-			MX28_PAD_SSP0_DATA3__SSP0_D3
-			MX28_PAD_SSP0_DATA4__SSP0_D4
-			MX28_PAD_SSP0_DATA5__SSP0_D5
-			MX28_PAD_SSP0_DATA6__SSP0_D6
-			MX28_PAD_SSP0_DATA7__SSP0_D7
-			MX28_PAD_SSP0_CMD__SSP0_CMD
-			MX28_PAD_SSP0_DETECT__SSP0_CARD_DETECT
-			MX28_PAD_SSP0_SCK__SSP0_SCK
-		>;
-		fsl,drive-strength = <MXS_DRIVE_4mA>;
-		fsl,voltage = <MXS_VOLTAGE_HIGH>;
-		fsl,pull-up = <MXS_PULL_ENABLE>;
-	};
-
-	mmc_cd_cfg: mmc-cd-cfg {
-		fsl,pinmux-ids = <MX28_PAD_SSP0_DETECT__SSP0_CARD_DETECT>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-
-	mmc_sck_cfg: mmc-sck-cfg {
-		fsl,pinmux-ids = <MX28_PAD_SSP0_SCK__SSP0_SCK>;
-		fsl,drive-strength = <MXS_DRIVE_12mA>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-};
-
-In this example, group node mmc0-8bit defines a group of pins for mxs SSP0
-to function as a 8-bit mmc device, with 8mA, 3.3V and pull-up configurations
-applied on all these pins.  And config nodes mmc-cd-cfg and mmc-sck-cfg are
-adjusting the configuration for pins card-detection and clock from what group
-node mmc0-8bit defines.  Only the configuration properties to be adjusted need
-to be listed in the config nodes.
-
-Valid values for i.MX28/i.MX23 pinmux-id are defined in
-arch/arm/boot/dts/imx28-pinfunc.h and arch/arm/boot/dts/imx23-pinfunc.h.
-The definitions for the padconfig properties can be found in
-arch/arm/boot/dts/mxs-pinfunc.h.
-- 
2.34.1


