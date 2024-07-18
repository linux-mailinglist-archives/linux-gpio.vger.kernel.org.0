Return-Path: <linux-gpio+bounces-8256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FECF934656
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 04:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FB4BB218E7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 02:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CA712E7F;
	Thu, 18 Jul 2024 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q/Soi9id"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02olkn2087.outbound.protection.outlook.com [40.92.44.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA52868D;
	Thu, 18 Jul 2024 02:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.44.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721269454; cv=fail; b=TRjThDL3ID74GxaIGq142DPme/iwoFwfvGkZ5ZfOlUWuIr5sSbdej7DKMoT6z4JXUeY5xbsWTWkGTGHN5+w5fdiSz4oZiK3bvAHLGrrhQCD5nHSen4M5KfYjOlNvunMxAZVxSHCdNvU/E87RmD1FEJzSczfhm1nMKCyw3HYrf3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721269454; c=relaxed/simple;
	bh=BxZObFUUay+5x1I5irEGhNhg0rwAds9wPjh2aHAU1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XT6wy0osCEq2e6+dxootzdge6fZulZORgoMf1cOrBRuI3VQfqbtSFs9+q5yQmRBg5TbPx1uVZYZwvLmL9hNOvdU46tET0dRYjLXMCRzQQM1g4McCup7bZk7x6u+HP+qGOJNoWb4CuAOi/1MhMcsNZ6dSN1vTYQIgRR8QPMUv6so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q/Soi9id; arc=fail smtp.client-ip=40.92.44.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w219stPTG33RQejIXP0GKp7ZqAZmhHQsKamqEWBU/J89kJIHOZJCc/qn/tGC122NJEua69/VH+RhiVy7na1SVrkmMdWm29gxVEHBVjzssYKR5Td9vOX2JN7/0fQfxMcu9RNjl1xuG44OrsPktjPXZXGsx8M3/+OSPzsGaF3fWwKhevWFCwc+xxEyZbuN3UK+qkkW98hrdGQbOA+0lYJepSAIzjh/IJFLAsOgrn7yg559KqIwSvJoNmRnYFtad1c/08fSrkVVonOwkEYsnN48KaELx8WPQ6Vp5Rogh4C/ygGNZ5GAsha1oNT+q0GHB12hukKN3FH/JyZpXpukOL9Cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XJaWcd263ELRaDcn1rrMT/4PFcbeLkap9rRNWsULnw=;
 b=XeMneuLLKN20BkVlt2SYAv80S0uqp+QxIuWN3yfN6x8Ya/wPh0EIHqwTacGQF/Ko8rhDx1lUnrYYuY9fJinbqXE8bQXpo2d6s4S4Ss0Hdlf1KdolHxiFLyErrVlmHY6e1/MpkvSATTVfbxlXLL/NjHlymCTYJVdw3AwOPnvHTXll+sN+h2OmSxy1k7CMcbe4T+Kst6bGAZptp5aRk373RCaLPLx2FXH2ewSuCT2HaseR7O7crV00f54c3IKrDEZxrCj6sNBYAcpMr9czNjgtkDazKapRe4BfLKK/NI6OwqZLrqC/QEpg03ZGZ+CaJVs2mYEikxR/q/D5nRcmU3wCpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XJaWcd263ELRaDcn1rrMT/4PFcbeLkap9rRNWsULnw=;
 b=q/Soi9idIdbqET3zw0ET71BSy+GOZdVF9Oe1UO+zXFnojyNnc9ysov7u9yvUT1CrGWJfeeq4xEyOlfQIPYrkD8ABnIKVSEiEnpk4qExX7hXs1hRtl2396KgJCVkkB66bAKkYpgHhEi+Vx7mVjqfzZ3BQEGixBtiqB8sNoPqrwbP9cEUe5tGtzk7A9dDCs35U0P/4TL3xHK1VrDIJviX9mMZaExQiWK+8SRNvnvcBs+xDSLRIwz8L5a3Ak5cFGN3uiTV0EoDOFSYZ/jlqXj/z7a122dbZUJKSDtQlWkU1Sg0XQLzwY3BiLjO3lNP+G4FJd15Ug7zFZf3bdOIfXgH57g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB6786.namprd20.prod.outlook.com (2603:10b6:8:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 02:24:10 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 02:24:10 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pincfg-node: Add "input-schmitt-microvolt" property
Date: Thu, 18 Jul 2024 10:23:53 +0800
Message-ID:
 <IA1PR20MB4953C71C87FD150D2E64FF41BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ph9q2H+Wfx1IhXCCt0ceNkLqDW4uQYRWZWpKZo/bj6M=]
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240718022355.743921-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: b357e583-8c86-4ad6-d87d-08dca6d0b4e1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	9DtQkUNiSM1txQWcFo4aiW31pjkxT4lFpWnIag+P5VwHO5RawHjjktaQihHvXWBJ6gH/KT1OXsnZm4Xbcx3KbDUb1GwrUj4AwLaO0xL9GmE32jgp5NeDpMTr/eQWRJ8xB1VILwJWYy1mqbjYyWl/9+bHHmPDfLZgtCpsJfxfA3cWq1f62k95j/cnpO5ubCGqOsK0EzRr7Wfk8plIidJBljVSs1nV5Hp0ZM2JYt+6uK54y9m+IthcmomgKRCHNud/sEF0Z0AgE+StdCrGHnD5lORpOdTy8HYzgiUDwvPwDSMIFQXm4N8lGSt6rtf5FZJIDofTu+Dz5pSOMTOainZTLbMKgjnA9GMCetGWYXhEoswQ00g+ATmG8go9Xu3ba1kfgXCUXvaN8X4UWjPfKqMjAjRqsQv7MYwhsJaHYqtZ3PBWmUsXYiVDdDadH0dLjggjGGA74kU6dWMiTVswbSDxi4+gr4c0AWUYeaiUN+aCz2xzKO+7HWUzexBxsFugMlSuLlh9q2NK1rqxRfxPLT8DKaHCZ1WeV4+vbyd/nV2bAXG+VIjXizNC7MxzjpsytaTBzgC1Cym4I1J00TG5Y3uOVR8V2HNP9Qu6dYhOblsTIcOB1r2ymVS3aX/Hrpu48UBFZYEbVN5iPodPJJGCFg1YxAiJadqQG+3MWd5YXg+IK2R809/OaT0TVnMCTROJQCmN
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EkLpIb94ZCCiej6+BVmFwTRjhOUeXPSybdsY65G40YWf/opiEnJMvS7Xxtpd?=
 =?us-ascii?Q?6QmqmdbmVfnZDmCrMObZqZw8FMmzrinh9f10KccT2xGdEINq4sLYIEJeHuyR?=
 =?us-ascii?Q?6jSL1PeHQ1MPMYbfYL3Cm8xUtHP+5Os1hf1OHW/bqeaSfPDhJ4zkx62fge1u?=
 =?us-ascii?Q?3rB9ElDKDCX59cFtk3wnT2PoLGchr/tzcmu6ncASEEqL4+XK5WToqkjY8SLw?=
 =?us-ascii?Q?8KaPewGbL6/fGlKWyyHAgitbsJUMZd/IYwdkNJWQ7g1b/xYVvVC5c/np+Mnj?=
 =?us-ascii?Q?/CmdRqKWoBwih2mZmItLRyOy441jpsBSYOlELTo3fWyyzgIZC3FfUt6TVnEs?=
 =?us-ascii?Q?/kuToaJHDH0EOaata7iRJdcFC2DJxaTLa8swAKQCCbiw2a0AGarE2212T3vR?=
 =?us-ascii?Q?9GNXSa2dpw9HhL+qamxFZSfs4FxLrp1MdFUtupYxzZaMRgUVIeCPEXTSqKW6?=
 =?us-ascii?Q?bpXInY5sv2HlU54OZWcfK/InQKkqct2ROYtn1de+QOGs7nriKjDE+99w42/N?=
 =?us-ascii?Q?Duf3w6u2EQDPTpn+Vql+2jwS/ll7JrqHKURKkb/VQj8gAMbHdM023UyoGZG7?=
 =?us-ascii?Q?yb9O+D9tzAN4rsM/PVKf9si5C5WdrmK5/LoA7AFURFlI3EJOm+BWU1aL507C?=
 =?us-ascii?Q?BEhbUtyuxHaJDuleQSqDEZWIpaSZf09bcUwUBN4+djN9OGWwZCQqLQstFWA2?=
 =?us-ascii?Q?4ZRkSdAOZE4+hRFWC73uB2lvDF4NdgT4LzU9DvM42pnvflkkbqWiyn9jhZHZ?=
 =?us-ascii?Q?sJ5nPT2Q8EGvj8giAITV+watQE80oe2aU7B5Yy+mp6lDuFOoI1CAXzJkDb8n?=
 =?us-ascii?Q?mPUOv8CB3kyiDawP1Wh5TNZFNLMd6GlIs0Br0A9AjYapqgcGTazuSpHijC/i?=
 =?us-ascii?Q?qlYbEa2GbesKNJdgZ8QDuDpZicfzMgKLpiAvzogD1kZfRsujWjxdJaFPwL+t?=
 =?us-ascii?Q?xkvr9UJ8zzSpunXPLfztasqxdJ4xMRel/LAI5fHJ7kJK0qmysy3oBISukOE9?=
 =?us-ascii?Q?khwEWC4FkUoo1KwHnxV+AELb5aOKJcPM0+BJNicf7puWM3ryABpWCic0/b5a?=
 =?us-ascii?Q?YXK2gl/Lw6ne1PGa/O1va2pRSpLuacOBvZC5Sy5LNq73xE81hgVgRglMltx5?=
 =?us-ascii?Q?Y6X5Eo72jU70QktBmdSvIplu53A9A61dluQVAnXPOsNL4FFgeQ8tjWRz9iIn?=
 =?us-ascii?Q?L81ppHztgU8YjUgYMQMPfjjVRVuT7IC0RfZbBVV5jXaftIcyEBOXh4Qvmxop?=
 =?us-ascii?Q?IFM5UGWs2KwZLVnWBdK2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b357e583-8c86-4ad6-d87d-08dca6d0b4e1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 02:24:10.1632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB6786

On Sophgo CV18XX platform, threshold strength of schmitt trigger can
be configured. As this standard property is already supported by the
common pinconf code. Add "input-schmitt-microvolt" property in
pincfg-node.yaml so that other platforms requiring such feature can
make use of this property.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index d0af21a564b4..cbfcf215e571 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -96,6 +96,9 @@ properties:
     type: boolean
     description: disable schmitt-trigger mode

+  input-schmitt-microvolt:
+    description: threshold strength for schmitt-trigger
+
   input-debounce:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Takes the debounce time in usec as argument or 0 to disable
--
2.45.2


