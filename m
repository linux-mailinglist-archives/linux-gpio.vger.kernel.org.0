Return-Path: <linux-gpio+bounces-27128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 04623BDA863
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D14F355DE5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FE1306B33;
	Tue, 14 Oct 2025 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FU2thGbz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B6304BC8;
	Tue, 14 Oct 2025 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457288; cv=fail; b=fd29JoTrbOR+NQjPxxFnbd9e1XpvpdnCq0XsOPiiS5P7Pzq8s4Bn3M1Cb6+gQ/PJbpNH/uf1lKRf/NcEhU9z/YTxwVQx3V48BkV/8yQksF5DW93H+USYkPYuzoz61e4ESHr1y8u9S6GatGfUDQ19LRs1n7tJvQ2C6ToqvzYwHBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457288; c=relaxed/simple;
	bh=D11oNblAcVCUDi4p/aJ1hNvfpmqMBezjX3xYKiPJd74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lQebBwAeTelmhkhzmXUiyPa13+oacsJpxTIYpkPNntYriUSuvIBwpqifyp28HtltCoYl/HuqXHA+u0w+AnIbkd+iQcpH+l4P4v2oyeWo4LqEmzoIY/XP7QrKpbxbtEpGpWbVeoDt0Fz0N0YBTakAZ/eFp6C2KPzlgEbwa7bs5bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FU2thGbz; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adOaE4Sx909uVMg0phixLYCCfz17MCxRacVEflki0Njj5fP3+FHPkPSQ3qtm040OfMDrcVX/0Bg0MB97jnrqncYPm0uHHTcnObTmpHG/dXgfAHjJqxm3xc8OTc+NfB0YyKr/7kDS3xKvuH6UkWW13wW5IKoYG/Dcs0rXhcQDPu10ymWKRc65dMrE640fNtqW7lgmaUMAjy/p0WgK/N0j3GZhWy2cF4lEF8djEgZ6xuKIM/va8+Y4U7Qbvccg7BiV9TwnU5vePwEuT4koe/YfigE4kq+miywAu0i9TtqkTVgWqr9rbmyPHiHecia5/WIr6CJZHNjWPiEn/t+tCjAxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHBLQCykv9W0YOipbKSW5uLOLdvf2bvnakc6AMX/jHk=;
 b=dU1UwxeQavW7MEfDgPsvHYgd/ft2FGWUFh5RpgDWl/WNA+Rkt9Q60TlYW7myXxyLgpJ+x30bP1SvCOBv3xa/nhGEDw6uPF9utArjHnMY5e8iLSEFZcb8eLU5WtHNpfeHNFe+hwtXSDprI27CUt5EkukoQ5cFAJ/MUpb5UmAVYqE+HVAhLohbrstguxlXC4N5AzreAU5foWMNWKxeCIGTgw8aYtBG6VaTcaqUWlKBeY8g6d2MpYdBngMZmeNfKaDyveDr60jUk7aqeJRCO31V+MkpTK95/oZMS9AIZvNv14Jh5R/RSDO/LRtvshyhO+JQ3gAJsOmWxF9h96WK4m5xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHBLQCykv9W0YOipbKSW5uLOLdvf2bvnakc6AMX/jHk=;
 b=FU2thGbzOxZSbL0BNXm5g0CeP8XnsNmQIiab620omLBGydgN3sccsr9ggqWBi82JCt8r7BhWJAdTvIE5hf9W1fvHZUiZ1OXNnsF+wVqr0Oxi8cKb5ToaC4W5U1M2Le/+mugrux7zmpjQYi5s5q8hALLA2U57iq+WlsCuQ9FJHV6UTE+KjuRGzSyMBGTJH1v6oo2cjMLVk+dF8TxE46sKhjk4Y2vWrv11stAG5YtxDcPpiOJ8/Qze/fzVh7dXWCaxfcju1MeXMZVOv0GB2HoOelRyaf1XD95+PvVEK61HkktVTf7GJF6aW9BxKk8Cxyt8JAvbDDm5mgFC4M0i6cJmgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:18 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:18 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 6/9] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
Date: Tue, 14 Oct 2025 18:53:55 +0300
Message-Id: <20251014155358.3885805-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0119.eurprd04.prod.outlook.com
 (2603:10a6:208:55::24) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: faae0aea-ebb0-4361-f031-08de0b39eeb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+HmzwXaHyr6J14x33m7dyKoP3uzsHsRZbVP1Dmn9s5p4pcChM6jt3odSQeMA?=
 =?us-ascii?Q?sGGeDhzhTTK2mQRrjWdqjwyR36FWW0CTqMx5wjVTChGA5pi7Ysg1FdjZaTwW?=
 =?us-ascii?Q?UNXl8CdpzvkyFXecLrEuxW2Hd1eefoCqyNtPz5K2uXHRVQ7/FbjKYIoXYNq/?=
 =?us-ascii?Q?/aIhSCwH4Vzi8mNx2Mxb62Cpy18BBOjVtY5fiY+MaBSiQZi25Yu8gc4TTvQf?=
 =?us-ascii?Q?0A8mv2Bp+8UHvrIVGTdedbRH5MWWWdOD5nbMYF9GVhAnf86s3D/97CwjkO8O?=
 =?us-ascii?Q?k0OmfM+JKUEMn6ItOQ4pjhVqNlPrLwMS5wRfjWmoOd4oowDr4EEkIeviiL+l?=
 =?us-ascii?Q?hLi0HUGJWBE6AmUl9b45VYA7qnulIFe3VXzk2iVt+XYuIqaEVRIPHicFaJH9?=
 =?us-ascii?Q?t5A8am5m5BATb+mAtE3rVOyJQCo2Ut7atvAMuqY6BQT4Fxhu6ERnoTdpzYmz?=
 =?us-ascii?Q?En1hijVJo3aujiHaWEjsgZwNlMjbjpqqZsllmKoWkc721g9Qog+Y/wNLvtaG?=
 =?us-ascii?Q?8RpN/0ykMO7ofe75epeoi905LW6+KTxmXLT1d3hbJz1ZoS28U3lL6QsXWuPL?=
 =?us-ascii?Q?g9klvgdRStaTX3LqLkQMA+WtmPFUCBN4nBNbuOUDGlBP2T7+ykjPTyjqOblq?=
 =?us-ascii?Q?+D9vH4hubHmix1qjp7TM9kLq2dBROK/LmLV7I9Sfphgt4m4uN0woaox6YFfK?=
 =?us-ascii?Q?n1JNLgbuNSAhKJZFGhqj0MfJ1IfmDy88sTihVWieZFRgOh0rGWey7HhqWRJ6?=
 =?us-ascii?Q?rTPs+ITxNtay/pHB0LVPBcpjyQWZpijPqsDZ25Ff3vzksIeQev0THcD+Ki6a?=
 =?us-ascii?Q?tvUhO0iKEncmaI3jdY65ZCQjQ+0VN7ce635NOtElI3tG8rvqEyZUOEaDXcq1?=
 =?us-ascii?Q?YiXd0oSgFtrodhAWhro5kg6D9NTw0HyojvM71qCotAFJbKJfrvTJjVhxYpTY?=
 =?us-ascii?Q?RPN4uMFYloA87Vsmqb/+DCerbMhzB1ERuy8YtxvWT8kLiUJYmvgJ6VcW2gpI?=
 =?us-ascii?Q?abJm7kqVHq43kslXz/xlF6hpqXezN1oF1KgzjZ3cPiwBwlxijqbUO+qoLg8x?=
 =?us-ascii?Q?aozabcAy4xr7X7gZbep6JFyOIz2tNtYP6hYUj4vdsVSbfiTLX/PwxcwV0Uu6?=
 =?us-ascii?Q?YDTJupC/wehgT+KDnfz2BuqK0TrlNI3Y2buQJGIIOTRXqbFyKhsRn4l5d03c?=
 =?us-ascii?Q?5+otV0+ENJJV7zYU2F8sy0/vwITWC72vMPVzuBIEZKuFt5oDwQ2e3tUHq9Bk?=
 =?us-ascii?Q?xJ1/TeZdfaqZ3HQdTzLkUFidE5VMzAaCFg+7G+ivYa7YqtCTlF6SFCEvHC++?=
 =?us-ascii?Q?si5tYOk+Sk+5OmZZ3UE0wlMaarzbWsrwc/MX5lwkPQ0Dw3ens/+bYlo5iekF?=
 =?us-ascii?Q?NPXxRaZGOqvtSP5H5pEKqJikf12QxQ2lPkc4H7ezVQLA5WffKxmSnfzcrAgh?=
 =?us-ascii?Q?9uYyHTOiCigwN4MX22xTgckBu2RXYG60/hZzvxHNd1EYY90QETuacaEduzzr?=
 =?us-ascii?Q?1aBlL10MffJojXc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?41Oe6W9VrrHxn5HsPWCPsxBYx2YO2dX0Si1cww2mm6695v0Bu6G83LrUA1VU?=
 =?us-ascii?Q?IikVbKg4taXSS4DWgbl/SVmeEq3SSCC4U8KPx6ngh41fgrJ6oDtQQlPvwFed?=
 =?us-ascii?Q?hTuD1k0xovmli79KpTQI6oMjqXrI8ZTvgVcc0iiKCeDHtQhwlyQmBlUVq/4R?=
 =?us-ascii?Q?sRzyFSULUN4rxeYNFUVlXYavHMr/xBLPpvD5GZLF9FKeq+WW8hjLak5KO2Ay?=
 =?us-ascii?Q?Z5mMBZ+IkWQA58+g1OIT45kC3P2LZGmv4NZH7xDuvVW0M3k8Yoy5VmZTajne?=
 =?us-ascii?Q?dYJw/i+mOBsYss5aqLg1VU8y9jyTZ2LAwkjNHFch9HqgQhQvHhhiwKoIrFY4?=
 =?us-ascii?Q?S9F7SkaTTL2fGaSmWL+lknIBW16YFFBAjNts4Oh1mRFZpJxfMFn0X6xxQO19?=
 =?us-ascii?Q?KXvHOj0g6dfM4KcCkBJmoYvzfUbGTb6sFwLzDnvWL5NbCttaxIx0ivUjb4FK?=
 =?us-ascii?Q?1XSXnkyCOYpuwAg3i4l5yZjgOpxpqpp6cWSrm/Th96bXIf8AeGhQWAFyd69g?=
 =?us-ascii?Q?BjYFbKYnrpdTI+LLdohRFxSskyTTlY+7XiwcI3LcRh/pgHWAxjdfiONzHThg?=
 =?us-ascii?Q?+HUuSjqJHIT8vzHHefmofM+CwazOrSGq0X0At9/0khN/FlnroMRZLwuN8xHo?=
 =?us-ascii?Q?JT2qqJ6Mdz6UfTl9hEwFaFxQy8T8F1/rLGvVGOVZbgrwzAPH6CPglx5mMSpN?=
 =?us-ascii?Q?McXP+/oxll5m8mOSKXBL2bGfp+nCNhOCJ1Mdn/Dx8ew8e8gKimSgJWo5a1if?=
 =?us-ascii?Q?IaJdBJ0kGTjyJIQNqUgT58S0UENSPWGau3sMTyBLBxaSkvTFosd3r5NPPWdL?=
 =?us-ascii?Q?oHY25sCcZf3LMTLGgP8mEfE04ydbRi1w6eJrusOXwMgCK0R26J48gKSOYgm2?=
 =?us-ascii?Q?XiOaWhdhGK/YXUVf1Ir8RoMRTosEIC8fm2BfzlknekH00V6i+s69GVLBAjam?=
 =?us-ascii?Q?/Knf++FIyxEOxkqcCvKaPGqmjKkLFJpfIsVXVa72+VHqhi0Az505uPAl+bi/?=
 =?us-ascii?Q?SdQZDUVy+Jf0oZuxFmG3dd9si40mJy/dEZyy1lFA5osCUBV8guqmB8PkHRAT?=
 =?us-ascii?Q?DGPT9l3DEI6ivWnv03XC9NtnvFqb0unsAAY8D5sAXUA4zZIL3tPTlDTrUlXh?=
 =?us-ascii?Q?9ajBaCJ9JLgwraiVyZ6kptY2ZNB2xkTTdkrMqIH1wWxNI+vtzmcEWztZR38G?=
 =?us-ascii?Q?vy6lNIyEP07tIUmcyLb2MqLsLNNntPLMJ/Js9Y002NaN8Ic2eeKJNiD5AOCg?=
 =?us-ascii?Q?5eJSgjQcjc/chf+fT8iOtv8WA13ZgxVs/QP8rsV78WQPUPIUhjD2T9ilTAAl?=
 =?us-ascii?Q?AogdBmYON9AL2VetYw0GUmy+kvTq1hNRjhBVzsQUvn+QV5stBxaxBKjipK6a?=
 =?us-ascii?Q?pCeTT5ay2obMpebLwzIHqx0ygHsoq60udj4fBtua+y+C+bqWuHahSOy1m4sE?=
 =?us-ascii?Q?Qta7wCpUamSgj/wp2mZRdgGR7BMLsbkstD+QrF/mNnE6jK3yN40x6aHSK60b?=
 =?us-ascii?Q?IhMkaH6CLSzQqzzIhrCl2irGaVBB33UaQynaCXWWLnoVpWQ5ToBwYk0Cu08W?=
 =?us-ascii?Q?SPmujCq5yrXV2+9qFJvbdYILP9kwYiocSk1hxF2b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faae0aea-ebb0-4361-f031-08de0b39eeb5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:18.0550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2qizMmKQ8CK3rLqsLYZvYZuDZzmxMV2kWVnURgGTWey5NEG2QOhnVAFSvUZcnRauirEsCxUg0md9PnJMW22Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
device. The FPGA presents registers that deal with power-on-reset
timing, muxing, SFP cage monitoring and control etc.

Also add the two GPIO controllers responsible for monitoring and
controlling the SFP+ cages used for MAC5 and MAC6.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Use the same compatible string for both GPIO controller nodes.
Changes in v3:
- none
Changes in v4:
- none
changes in v5:
- none
changes in v6:
- none

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 0c44b3cbef77..4ede1295f29d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -170,6 +170,37 @@ mt35xu512aba1: flash@1 {
 &i2c0 {
 	status = "okay";
 
+	cpld@66 {
+		compatible = "fsl,lx2160ardb-fpga";
+		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sfp2_csr: gpio@19 {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x19>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP2_TX_EN", "",
+				"", "",
+				"SFP2_RX_LOS", "SFP2_TX_FAULT",
+				"", "SFP2_MOD_ABS";
+		};
+
+		sfp3_csr: gpio@1a {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x1a>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP3_TX_EN", "",
+				"", "",
+				"SFP3_RX_LOS", "SFP3_TX_FAULT",
+				"", "SFP3_MOD_ABS";
+		};
+	};
+
 	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
-- 
2.25.1


