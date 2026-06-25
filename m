Return-Path: <linux-gpio+bounces-38910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jkQbIoiQPWqA4AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 22:33:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B96C884D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 22:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=N2+0HCXk;
	dkim=pass header.d=ti.com header.s=selector1 header.b=ljrXdn4P;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38910-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38910-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F3E13027689
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 20:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB5C34C155;
	Thu, 25 Jun 2026 20:33:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020781DD9AC;
	Thu, 25 Jun 2026 20:33:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419587; cv=fail; b=MfgLX62zMG00xhm3XvNJYAvS1wps4b8tLn1cX2rCK7m/1Ol0KfuPhDX/vcSjt22r5cehMajVZ8VtRW9UtqtrFZzlo0f05DXGW7CtIFmHrKnXwPUHyAm7+1OeA627QzyYHlZ6VF4deqR8LbwNngDnMq1cCvyVWoFjHUfc+wxcgZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419587; c=relaxed/simple;
	bh=J1qtmUbH8aEBZLmmiIZPsp9+imgXrrX24w3S7vmdSoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hi1tUWLpT4sIWRd7hSbLh+jokVWNzWIDPBu2IqlDPL96ZsTToKlaTm+7a10F+meuB5hT5wuxgDroJWQNdz8DP9GcucEKrbuuvLc3xwMzNy7rCcKotyhbrtZuykzvmvJjnheveEIwzl2Fg/GkBHiV0TF35Ygq/Wu1DoliGBzk3Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=N2+0HCXk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ljrXdn4P; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PHiXMA3870085;
	Thu, 25 Jun 2026 15:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dpUahz8clwgLbTAco/dgry4K0qUIvHzOh+ZKYL/OC
	Yg=; b=N2+0HCXkt9mMOBG/NJ6RhrgpObGT/U1yDPnE60ZX4oG8ndWhVEojIDszT
	MrStAE2x6GOpywAyGndotTrrp20B5aZxRViedL8wWWCuCFIBep+Ks/uH8buUiGBB
	zNmH9G06H5O/nwFpd+wnLQmq06bk4rOFJ3DYJ0NHQM6lXsofdjuD5Eh1Ud5g2oCH
	lji6zAyhLFDNPMOWdXqxQfJSYd9JryxDUiYA2GFdQQt5qMuuJCCdNaqGKivhuh8a
	Wsms8I6wgZSqssBFrNyKcmKDj5W90IQCNomsfTt0gdECaGP8Ao/Inl0JcYI3/kfQ
	b6FMoNgg6tNg1d+D1kgLGdubPXrBQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jckp98-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 15:32:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8YA0LQMkI30JC9H1jNjfnSqdvlRJaQGpFHY78VX6qihzujcmu9kPDnhjXCZAH0UgEgW0fYdtjCu2RSENGotuvKf/1Ld6O4CQNU+WPsFyRxP25ekxHaafNOwcJGu7zkKWbcRjSc9c4p/lbu8uWts1G1NmxyPL3RhGusz7HAnPSeza2igWJFJCxQdIpKsL2/2XXFKpQXVbHtLxd3BONKsOeh8ZirFKKhKQteHc6yB3ybvW7nO1Kp5WJd57h0eNKza1S6kp7vpryqvFIzFc+AAAh4GnrFMSTU1Z80xr+jh0tdrgX597hQpetn5zC2ng9OuzOkmF9ZtgQcYn02eTBblKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpUahz8clwgLbTAco/dgry4K0qUIvHzOh+ZKYL/OCYg=;
 b=jbe2vR4MJdIqKXBGLSXzCYJ/NNgMaUK0iNOrm1X0yggDFPQfJZXthHa1Iu6WDYZB0J4DvmwACHEY31NjRzRBO1rbNcRok37x8hLmW5Eq8loe/CyOdn2tXyb//Uhxx9ORWwKfksq+Dxx5gUywfpdA+/Nef2mnsd99ODRvTscxVdDw+7BkqqBuVsYwD7uqTs0E+xaJz6aWfWDUl7UfJSyvldYICBhVSBAoQ7C3VItkq17vyN73hYxX8A/ahWhTM62b5OGmH3/KMqjDnrWrz6sjC6dGN75GfvZq3Bh64KdWChD6gfoR7QEfw1fakev9IEQouyw/t8VY2i5hO7nMm+15Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpUahz8clwgLbTAco/dgry4K0qUIvHzOh+ZKYL/OCYg=;
 b=ljrXdn4Pt0J48jsutnkpvIv1mOBH7bbjvUXQXHAssbpSAkSjihgJHB1lGnT1ptTkcYS1NAzw/z080GqwprRCcV5XYw7+pZkIdnI3J+qVe3qsfjH5FVgfyNFn/tjRkTdrE+i4CsmELXvZ9f270TYAeCrwb5YKk1tWiwN/YGB3SyA=
Received: from SJ0PR13CA0119.namprd13.prod.outlook.com (2603:10b6:a03:2c5::34)
 by PH7PR10MB5832.namprd10.prod.outlook.com (2603:10b6:510:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 25 Jun
 2026 20:32:17 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::64) by SJ0PR13CA0119.outlook.office365.com
 (2603:10b6:a03:2c5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6 via Frontend Transport; Thu, 25
 Jun 2026 20:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 20:32:16 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 15:32:13 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 15:32:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 15:32:13 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PKWCxd4110281;
	Thu, 25 Jun 2026 15:32:12 -0500
Message-ID: <655ef1d6-08fd-43a9-8507-c2d478c058d8@ti.com>
Date: Thu, 25 Jun 2026 15:32:11 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@oss.nxp.com>,
        Linus Walleij
	<linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Frank
 Li" <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-imx@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|PH7PR10MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 207afc4a-73d0-4add-8bde-08ded2f8d8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|82310400026|376014|56012099006|6133799003|5023799004|22082099003|18002099003|3023799007|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	wyzapWFDZKBpb4FexDV+9x0gQOIt2oYU3RlRrN7uDF0m4cTVMbsSTZBEkovMkZU6/fyxkuwpGcVASJvuCH2TWQF1vVplJQH1AauZXbm31b49rgmMAKn7yaa0zweU2751MF1h7vH+C4XvhDV1ejniUvtvYJaY8h9+JYekeXzT4XNwL8+wl82IuHCNA2U2DxnNAzKnbX5kzCyxsBXwS/C0NNQZI5aJgFS1d1sNFhBiWeVW646ro0jZ5Cu57eeYO6dmE7YzVAhsVXcVx8JEGipFgS7esbnr68g0hvdCEHN8Jib/5O1RohcglCSLJpVL290Sx7dpKR0XJOqX4ti/h78ScKISaBc3CVWTFeXvALupmDPKeJUN454YWa4Vj7jMiwGaHJ/1KelDwxyNLH//6eiEyKd0F8YQ6QfyOB5q8kNxcNXOItAd0VmT13x5nyD+hTodwzsTlTs9nHLgum2NFBkXub0gvEGipOLFMTmuwdcK7PW+KC2otHXo7k65ajVdZ0Vp2BuaX4SUfAxLRour5H7DYCSkzo8HBqtkyoQ1FQqA4zccYdIKvvnhOav8ZBN+FNZnL27L1I7GOhKVsQzTcUFq+hccTvoIQYLQbEAinkPn5zW1dNz9ZrgK1opdhYGuXnT/l9JEU1FQHe+QpQWGyQtIsrxF4lqm8mc1rSeyyhSlxZd931N9EzQkzkLGovEYIomqfCLaZ8Hp8ekkKnX3vyA2spK8PwAcAEOQNVxjy4dYf+rd6U6tweKGb41uXYfLwSxM
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(82310400026)(376014)(56012099006)(6133799003)(5023799004)(22082099003)(18002099003)(3023799007)(4143699003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZWWr+3NRXKd0RjNEGvgrbjnccRcXtzIX/Vv8/bdIMw2RKiWcSRlj4ZugmzAR43Xl1uJfX6snN5yKRN2YA5404RbGS9JBt9XWj9+fBaeeDyRYKNw0fmKcjMo8OtxNQJYMw98Df8iOPrZscDVf3V3/pvIRJOtaB01B3++86VWX70OvArCnKbT+hs+GD+2CJDa6yYRHKskTtNbkFGaaSUcGLOJ5+LdDPjKqyhi6raP2B/jpRFqXEn2leIQxszV62Mnbhb3oXE77vmj3qUFS5WQJPOVrSi64AKLEk1XpjJ3yBCpmwK5jG3XIMHYM2hOy5hKtUZMu/WZ/7WgBc1pSsuVqivKXXAeq70J0MYymDUYx1ryodpdsUD06IYjjDifC1SURMvpiVSm2ibf4iwxVqk8RDujLoXC3dia4o7mBv+VWIPKueWPRIIolVdfTME/zGBkt
X-Exchange-RoutingPolicyChecked:
	r3+Gv1LX7AnLSK9glWlN9+QkR+XJKZdM0pTwkveBxz/3cfcZlhB6sqKo5c9rYtC+tf7uZ73F6EvfrH9N3z9ha1tKiCTcmoxDQLTf4rihH9sWQeXHUzyrYDMp34svIQCzJMXjLem/4FOoxyVRMPSidOpaTuBG6lnTuoExdcnPcHJ+eJJBIuYAr7Lx/O5SuFldjct0nbKbuX2JQn1H43ql9OdSCu/VyoOd9fSdn7vseNENux0vfJA3bp/VaC+EsWJYd6NC2/fQDRIvz2lnKSz4vwGG0j0EWH6D1j1k+4yIb0JPfYsKqxRf6D3mRcyyKyA0SkY4TUDPzK31NUSzJPUDLg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 20:32:16.0024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207afc4a-73d0-4add-8bde-08ded2f8d8a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5832
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3NyBTYWx0ZWRfX2Q5U4Av6PR0o
 FBnmSjwAvHPfpP39HMABt1oaRKHV6Nsk2R6koJaRM902wMqO+QBRTVMYUw0hRAZkpQhLm3XnLAv
 wTH3VXkPVMHV8hLWlfXzZTz22EIXTcUkqZxpJ/q2CekDNFsNKP2LxKr/m3YByOKeg63VuHdjweM
 hTMoiGaeTHiaVBiBQND6FYdqzbnR4DOv1Xa5Upw+9kA/adDv1i7S+xZO0Me2UzScS/bsJVa8VDs
 qE7RuLTEpPD9698eMoxkwf36vHHfWyRh/s0bbSZPnVoCL8ritCAlafLJLw6Lp2Wu38E7NwH2mj6
 xF558ZwGdiD2N8qtJtn79Vex/WfnhBAUbgHWxtgAgiv42B5zb+zOl9Tf0gev3P3mk8O+Kp1I0gA
 FTMT7/myXmVj/Hg+Q0V7vZbIp7xK5KCHt127BgFkLj4+69kEjkLO1dmM1oMR5UQ780l+wAmGSNv
 pp6qstpdgKNs25JtG5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3NyBTYWx0ZWRfX1+1P+BlJt2Az
 acZ8dnFWUJdnmHFkm8LqPAldeIldcUgPl+0F0H6YxMhyEHwRke64gK/DYJ617x+S260zOL+uoDb
 Mf5ud+eMD1O4rohwk2mNXilEgonu58s=
X-Proofpoint-GUID: hj31qstwwo3XGzM-MtdMuq7jyMKbAt2K
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3d905b cx=c_pps
 a=zsOV+8tnETx+K6VwtxJO8A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=8AirrxEcAAAA:8 a=tZ5X8BI4JcRt94BcUVYA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: hj31qstwwo3XGzM-MtdMuq7jyMKbAt2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[afd@ti.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38910-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:brgl@bgdev.pl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ti.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B2B96C884D

On 6/25/26 10:54 AM, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> On an AMP platform, the system may include multiple processors:
> 	- MCUs running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/gpio/Kconfig      |  17 ++
>   drivers/gpio/Makefile     |   1 +
>   drivers/gpio/gpio-rpmsg.c | 568 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 586 insertions(+)
>   create mode 100644 drivers/gpio/gpio-rpmsg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 020e51e30317..4ad299fe3c6f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1917,6 +1917,23 @@ config GPIO_SODAVILLE
>   
>   endmenu
>   
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on OF && REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
> +	  i.MX9x.

The support would depend on if the right firmware is loaded/running on the given
remote core. Also if you want to make this generic, then any vendor should be able
to make a firmware that implements this protocol and make use of this driver.
Suggest dropping this NXP specific device list.

> +
> +	  If unsure, say N.
> +
> +endmenu
> +
>   menu "SPI GPIO expanders"
>   	depends on SPI_MASTER
>   
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b267598b517d..ee75c0e65b8b 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>   obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>   obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>   obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>   obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>   obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>   obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..332e2925a830
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,568 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2026 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +#include <linux/virtio_gpio.h>
> +
> +#define GPIOS_PER_PORT_DEFAULT		32
> +#define RPMSG_TIMEOUT			1000
> +
> +/* Additional commands beyond virtio-gpio */
> +#define VIRTIO_GPIO_MSG_SET_WAKEUP	0x0010
> +
> +/* GPIO Receive MSG Type */
> +#define GPIO_RPMSG_REPLY	1
> +#define GPIO_RPMSG_NOTIFY	2
> +
> +#define CHAN_NAME_PREFIX	"rpmsg-io-"
> +#define GPIO_COMPAT_STR		"rpmsg-gpio"
> +
> +struct rpmsg_gpio_response {
> +	__u8 type;
> +	union {
> +		/* command reply */
> +		struct {
> +			__u8 status;
> +			__u8 value;
> +		};
> +
> +		/* interrupt notification */
> +		struct {
> +			__u8 line;
> +			__u8 trigger; /* rising/falling/high/low */
> +		};
> +	};
> +};
> +
> +struct rpmsg_gpio_line {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +};
> +
> +struct rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct rpmsg_device *rpdev;
> +	struct virtio_gpio_request *send_msg;
> +	struct rpmsg_gpio_response *recv_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	u32 ngpios;
> +	u32 idx;
> +	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_DEFAULT];
> +};
> +
> +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port)
> +{
> +	int ret;
> +
> +	reinit_completion(&port->cmd_complete);
> +
> +	ret = rpmsg_send(port->rpdev->ept, port->send_msg, sizeof(*port->send_msg));
> +	if (ret) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send failed: cmd=%d ret=%d\n",
> +			port->send_msg->type, ret);
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&port->cmd_complete,
> +					  msecs_to_jiffies(RPMSG_TIMEOUT));
> +	if (ret == 0) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send timeout! cmd=%d\n",
> +			port->send_msg->type);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (unlikely(port->recv_msg->status != VIRTIO_GPIO_STATUS_OK)) {
> +		dev_err(&port->rpdev->dev, "remote core replies an error: cmd=%d!\n",
> +			port->send_msg->type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct virtio_gpio_request *
> +rpmsg_gpio_msg_prepare(struct rpmsg_gpio_port *port, u16 line, u16 cmd, u32 val)
> +{
> +	struct virtio_gpio_request *msg = port->send_msg;
> +
> +	msg->type = cmd;
> +	msg->gpio = line;
> +	msg->value = val;
> +
> +	return msg;
> +}
> +
> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_VALUE, 0);
> +
> +	ret = rpmsg_gpio_send_message(port);
> +	return ret ? ret : port->recv_msg->value;
> +}
> +
> +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION, 0);
> +
> +	ret = rpmsg_gpio_send_message(port);
> +	if (ret)
> +		return ret;
> +
> +	switch (port->recv_msg->value) {
> +	case VIRTIO_GPIO_DIRECTION_IN:
> +		return GPIO_LINE_DIRECTION_IN;
> +	case VIRTIO_GPIO_DIRECTION_OUT:
> +		return GPIO_LINE_DIRECTION_OUT;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
> +			       VIRTIO_GPIO_DIRECTION_IN);
> +
> +	return rpmsg_gpio_send_message(port);
> +}
> +
> +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
> +
> +	return rpmsg_gpio_send_message(port);
> +}
> +
> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
> +			       VIRTIO_GPIO_DIRECTION_OUT);
> +
> +	ret = rpmsg_gpio_send_message(port);
> +	if (ret)
> +		return ret;
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
> +
> +	return rpmsg_gpio_send_message(port);
> +}
> +
> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	default:
> +		dev_err(&port->rpdev->dev, "unsupported irq type: %u\n", type);
> +		return -EINVAL;
> +	}
> +
> +	port->lines[line].irq_type = type;
> +
> +	return 0;
> +}
> +
> +static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_wake_enable = enable;
> +
> +	return 0;
> +}
> +
> +/*
> + * This unmask/mask function is invoked in two situations:
> + *   - when an interrupt is being set up, and
> + *   - after an interrupt has occurred.
> + *
> + * The GPIO driver does not access hardware registers directly.
> + * Instead, it caches all relevant information locally, and then sends
> + * the accumulated state to the remote system at this stage.
> + */
> +static void gpio_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_unmask = 1;
> +}
> +
> +static void gpio_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	/*
> +	 * When an interrupt occurs, the remote system masks the interrupt
> +	 * and then sends a notification to Linux. After Linux processes
> +	 * that notification, it sends an RPMsg command back to the remote
> +	 * system to unmask the interrupt again.
> +	 */
> +	port->lines[line].irq_mask = 1;
> +}
> +
> +static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_shutdown = 1;
> +}
> +
> +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->lock);
> +}
> +
> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_WAKEUP,
> +			       port->lines[line].irq_wake_enable);
> +	rpmsg_gpio_send_message(port);
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * The remote system will mask interrupt after an interrupt occurs,
> +	 * and then send a notification to Linux system. After Linux system
> +	 * handles the notification, it sends an rpmsg back to the remote
> +	 * system to unmask this interrupt again.
> +	 */
> +	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
> +		port->lines[line].irq_mask = 0;
> +		mutex_unlock(&port->lock);
> +		return;
> +	}
> +
> +	if (port->lines[line].irq_shutdown) {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       VIRTIO_GPIO_IRQ_TYPE_NONE);
> +		port->lines[line].irq_shutdown = 0;
> +	} else {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       port->lines[line].irq_type);
> +
> +		if (port->lines[line].irq_unmask)
> +			port->lines[line].irq_unmask = 0;
> +	}
> +
> +	rpmsg_gpio_send_message(port);
> +	mutex_unlock(&port->lock);
> +}
> +
> +static const struct irq_chip gpio_rpmsg_irq_chip = {
> +	.irq_mask = gpio_rpmsg_mask_irq,
> +	.irq_unmask = gpio_rpmsg_unmask_irq,
> +	.irq_set_wake = gpio_rpmsg_irq_set_wake,
> +	.irq_set_type = gpio_rpmsg_irq_set_type,
> +	.irq_shutdown = gpio_rpmsg_irq_shutdown,
> +	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev,
> +				   struct device_node *np, const char *name)
> +{
> +	struct rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(np, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(&rpdev->dev, &port->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
> +	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
> +		port->ngpios = GPIOS_PER_PORT_DEFAULT;
> +
> +	port->send_msg = devm_kzalloc(&rpdev->dev,
> +				      sizeof(*port->send_msg),
> +				      GFP_KERNEL);
> +
> +	port->recv_msg = devm_kzalloc(&rpdev->dev,
> +				      sizeof(*port->recv_msg),
> +				      GFP_KERNEL);
> +	if (!port->send_msg || !port->recv_msg)
> +		return -ENOMEM;
> +
> +	init_completion(&port->cmd_complete);
> +	port->rpdev = rpdev;
> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &rpdev->dev;
> +	gc->fwnode = of_fwnode_handle(np);
> +	gc->ngpio = port->ngpios;
> +	gc->base = -1;
> +	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   name, port->idx);
> +
> +	gc->direction_input = rpmsg_gpio_direction_input;
> +	gc->direction_output = rpmsg_gpio_direction_output;
> +	gc->get_direction = rpmsg_gpio_get_direction;
> +	gc->get = rpmsg_gpio_get;
> +	gc->set = rpmsg_gpio_set;
> +
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->chip->name = devm_kstrdup(&rpdev->dev, gc->label, GFP_KERNEL);
> +
> +	dev_set_drvdata(&rpdev->dev, port);
> +
> +	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
> +}
> +
> +static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
> +{
> +	const char *name = NULL;
> +	struct device_node *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np) {
> +		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
> +		of_node_put(np);
> +	}
> +
> +	return name;
> +}
> +
> +static struct device_node *
> +rpmsg_find_child_by_compat_reg(struct device_node *parent, const char *compat, u32 idx)
> +{
> +	struct device_node *child;
> +	u32 reg;
> +
> +	for_each_available_child_of_node(parent, child) {
> +		if (!of_device_is_compatible(child, compat))
> +			continue;
> +
> +		if (of_property_read_u32(child, "reg", &reg))
> +			continue;
> +
> +		if (reg == idx)
> +			return child;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct device_node *
> +rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, const char *compat, u32 idx)
> +{
> +	struct device_node *np_chan = NULL, *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np)
> +		np_chan = rpmsg_find_child_by_compat_reg(np, compat, idx);
> +
> +	return np_chan;
> +}
> +
> +static int rpmsg_get_gpio_index(const char *name, const char *prefix)
> +{
> +	const char *p;
> +	int base = 10;
> +	int val;
> +
> +	if (!name)
> +		return -EINVAL;
> +
> +	/* Ensure correct prefix */
> +	if (!str_has_prefix(name, prefix))
> +		return -EINVAL;
> +
> +	/* Find last '-' */
> +	p = strrchr(name, '-');
> +
> +	if (!p || *(p + 1) == '\0')
> +		return -EINVAL;
> +
> +	if (p[1] == '0' && (p[2] == 'x' || p[2] == 'X'))
> +		base = 16;
> +
> +	if (kstrtoint(p + 1, base, &val))
> +		return -EINVAL;
> +
> +	return val;
> +}
> +
> +static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
> +				       int len, void *priv, u32 src)
> +{
> +	struct rpmsg_gpio_response *msg = data;
> +	struct rpmsg_gpio_port *port = NULL;
> +
> +	port = dev_get_drvdata(&rpdev->dev);
> +
> +	if (!port) {
> +		dev_err(&rpdev->dev, "port is null\n");
> +		return -EINVAL;
> +	}
> +
> +	if (msg->type == GPIO_RPMSG_REPLY) {
> +		*port->recv_msg = *msg;
> +		complete(&port->cmd_complete);
> +	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
> +	} else {
> +		dev_err(&rpdev->dev, "wrong message type (0x%x)\n", msg->type);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
> +{
> +	struct device *dev = &rpdev->dev;
> +	struct device_node *np;
> +	const char *rproc_name;
> +	int idx;
> +
> +	idx = rpmsg_get_gpio_index(rpdev->id.name, CHAN_NAME_PREFIX);
> +	if (idx < 0)
> +		return -EINVAL;
> +
> +	if (!dev->of_node) {
> +		np = rpmsg_get_channel_ofnode(rpdev, GPIO_COMPAT_STR, idx);
> +		if (!np)
> +			return -ENODEV;

This seems to imply that DT nodes are required. RPMSG is a discoverable
bus with a nameservice that can bind/probe new devices. While then optionally
binding to a DT node when available so sub-devices can be described in DT is
fine, I don't see why it should be required.

> +
> +		dev->of_node = np;
> +		set_primary_fwnode(dev, of_fwnode_handle(np));
> +		return -EPROBE_DEFER;
> +	}
> +
> +	rproc_name = rpmsg_get_rproc_node_name(rpdev);
> +
> +	return rpmsg_gpiochip_register(rpdev, dev->of_node, rproc_name);
> +}
> +
> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = GPIO_COMPAT_STR },
> +	{ /* sentinel */ }
> +};
> +
> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = CHAN_NAME_PREFIX },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
> +
> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
> +	.callback	= rpmsg_gpio_channel_callback,
> +	.id_table	= rpmsg_gpio_channel_id_table,
> +	.probe		= rpmsg_gpio_channel_probe,
> +	.drv		= {
> +		.name	= KBUILD_MODNAME,
> +		.of_match_table = rpmsg_gpio_dt_ids,

Does this line actually do anything anymore? Maybe it did when
this was a platform_driver, but this is a rpmsg_driver and
will probe though .id_table matches.

Andrew

> +	},
> +};
> +module_rpmsg_driver(rpmsg_gpio_channel_client);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> +MODULE_LICENSE("GPL");


