Return-Path: <linux-gpio+bounces-29608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F09CC155B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 08:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A88EE30115C9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 07:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB4A3358C7;
	Tue, 16 Dec 2025 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="MpoLMLGo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023078.outbound.protection.outlook.com [52.101.72.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022C6325730;
	Tue, 16 Dec 2025 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870802; cv=fail; b=loJ9yLhMjb6D436jq5glWNDHGS7JVwSZ4wuUC1ADaYsUvBXxXgT9obHL/+OI1TTXtB7DjL8I3hnWW9kl0AQNW+ksZMWbRcN3YCzlfP4q2caFYf6Tzcw8nig1PFiTYZdjiZxzFFGoeK7hUExVly6m7wCtgt0krbVx+Q3kYF/qIIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870802; c=relaxed/simple;
	bh=O8W4xboar9A7qUmR1RwZdCreV1YzLlmyFdJ3bdh6nck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gzRh2rCGrjXe8TLMD9wIxZDPl4u+6VWtcpfZNXpWUQolzkt99Bd4cXrvCC4FqxUFsiId1SDRiv5mNN7k2JvChgoysRNLKtYdVN7SAf2qsDADm9ZWjy+EFj/H6m/a14i7OAxhKnLyuwUKVHG4HU5IwlN9ljIcS69J9u2Eo6/+cMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=MpoLMLGo; arc=fail smtp.client-ip=52.101.72.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkfCJJYtVYl1PoZKUzVvSsBxDsHr6TBFl9BqopRIOrpO3spRjbqGUzWNKtbbnWlkuH/NiryJPbKLWrV2FXsK9W92GR2YKTpC890yhTV5KXz/g3/jNis0gqK6oiDHjz1D+TzZQct/lo2f/3Vneslg5m1ZC4bANR2U0nmoe25eOFKsG9v0Cv4uIynUdn95GcsB0NLSTp39bt19yUUKMuA7TVeHq5MwqbOjvMTKQrjymIiLnz0kCLbGegd7fJDjEr9vRYRK6EqsOCIquaPjF2pJYsj8pl9AANIpMTsAsLWvBVcKpJdS5eIj4P81GW12AIwcw8Z0cpUz7Hx8pAjguwwOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK1tUZkr08I8s/YbsMsGbXN8VIDtR5Nk/IMTWlRlCV4=;
 b=SuaKgzWvaHjuJI58lsv+OznDoK/mERmekF1/MCqdPmcgd29BvBTWICE5TlFi58/pzD6InNeQEdpITbYYrjCGeqW3hD6a4fPa9Ove06YcZuqoYb+gwA3sgTxxLlRewH1n/3O433X3aNrwXK8LMWIWM3h01tBZJ/sKVzBq/alXw5vr3NWPLl3qEyEDDytZe9416TKjkSudb9m/ntyyIxdPpk3gmyq/ySZ5WtGQ/NBNuhgM1LwExdnpF2ujgQWCK02tACi7tkHeqF89sB84X4hOaboUTHsHscrgfTM5s9iFMaXqyi7ZXHFe2FnBJtO5NCTglFq37FxDj6mchQDgIJ9F7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=eilabs.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK1tUZkr08I8s/YbsMsGbXN8VIDtR5Nk/IMTWlRlCV4=;
 b=MpoLMLGoPOhBgLM78i25gZC76SmRhDDZSd7r9NAW04ZkXLCWtbojL3Xngz3Zh12Q53U8Yds/8wJWwJ5SJ7SsLh38Wkt+ttnYlniyc7o7O/EojgbJmNlUCvw9s+PuRDPMHYhUCi/CzwMk4YbRdQ+JyHxxE4WViVkqJD8MU+fpzsQwe+XQukfraHUN4Ju39mDiAF8fEwtJPZ/9ngTuNBNC1o+EVXjoXupYpMmYYp1pwKrgarfN1ITkX+Dv0D6S4AqXvMfD0tix5UPAXIePVBzlgGmLaZJbtteZdiY9F2FwDpaqbELYb4J0I3Emw/aK6gv9BKuSGxcq1EnztntnB3qBhw==
Received: from DU7P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::24)
 by DB9P195MB1561.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:339::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:39:52 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::8f) by DU7P251CA0022.outlook.office365.com
 (2603:10a6:10:551::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 07:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 16 Dec 2025 07:39:52 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 16 Dec
 2025 08:39:51 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 16 Dec 2025 08:39:34 +0100
Subject: [PATCH v2 2/3] dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and
 tcal6416
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-wip-jremmet-tcal6416rtw-v2-2-6516d98a9836@phytec.de>
References: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
In-Reply-To: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|DB9P195MB1561:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9e3d41-3727-4bc8-5b93-08de3c764ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zk0rUjRXTG91enBKaG9LdjZGZnZYV1UyRUlHM1cvelRYbmJHQUtrUFBiRndv?=
 =?utf-8?B?Y1dNOFlIVmVSS21jdnhjaGpnaUZGTzJSS2xNeEp4MFdZcFp5NDc1U2R5MUwr?=
 =?utf-8?B?VUZEaThnYnA0eERrTThtY0FwdERCdkk0MjZhbGhrZlYrT0NOZzVpN00vQlBr?=
 =?utf-8?B?OThIUmhCdG9CSGllWVRCSmtvZFZSVHphVDVEb2pnYjlkUFo3MTh2RjJjUnF6?=
 =?utf-8?B?TkQ0VkpUS2puNE1FL2VLalM4aFBrdGJzS2VQZGp2ZGpYUzFBR2dFNVI0RHFD?=
 =?utf-8?B?T3d2eno0YUREZGxmMk9LZmpvaU56OGJISnUxNEw4dDdMNlR4M25yOWlXeTNa?=
 =?utf-8?B?WmU0QVQ0eXpZejFiK0E4MlFQMC85dlRBWE5oQnh6WnV6K0RzTXJ6SU1zeXB0?=
 =?utf-8?B?S0V5OTkzMUpCRUVnS1lvRmpJUUVjUzBhenJVMEZJTGlOdTJzeWFIWUdUVzJM?=
 =?utf-8?B?aWw1WEIzTkw5dXJCd2JLMXV6NHI2eVhnQkNDMEk4TkhLYkRZT3c0dUpxQU4w?=
 =?utf-8?B?LzBwNkJoTW9SMEJUTmNGelpXOExWSm90SGw3RUU3ZzQ5MGdxMlFUNCtlWitL?=
 =?utf-8?B?QXBJQWRCSDNuQjZEYTBjelV4eVdNckdtUjU1UTFNSkxVSE16Z2dPb2o0c1hh?=
 =?utf-8?B?VDlNUXY1amtZcWIxSWxPM0FrODFXYXRoQWRNTE9Vay9NN0lmM1FvbEp4bXpU?=
 =?utf-8?B?ZkM5dlRJU2VwMW5ESzc2a0FZZlFTTTZPc25LYWU5bWZtQnFWQWVvQ2QyWVFl?=
 =?utf-8?B?bUpFY0RkZGxya1VrZnJNUXFyc1Q4U25ETUF3dlVuOVFaMHVGZ0U3RDlpVGI5?=
 =?utf-8?B?K2IrdWlSSU15aXJ4L3NCZWVUTTByRVRhcHR6b2F0eWZUVnRES2pkYy9OWVg3?=
 =?utf-8?B?UmFob1lWb0lZVlhqY0JicEZZVXpCdXBuY0grbGl3cjFlSWc5T0dzVmhZNDgy?=
 =?utf-8?B?N05MSDlzZm15R2d0U3BMdFo0UEhhb1VnWVAyM0JUYWtGVUVpVThneWFjRFNk?=
 =?utf-8?B?dHh4QnZrbExRNk8yZHBMWWJrVlRraUxSZEFqRVZLUE5YL2N5dTIyakFhOFA1?=
 =?utf-8?B?R3RqVEsveEhzUmFmTmpsRncvbkpZVXdtaHNlYkpRQ1dqZW5pd1doMThCWmNo?=
 =?utf-8?B?QmhPSTRaL3JCSGVhOUJRNmxUY1pCeGk5Z2dQQXk0OWlrMmNFRzBuK0ltTCt5?=
 =?utf-8?B?eWdaTEVwVldWQmV0NG9EQ1lPV1lwSFB0NGsvRlJZNGlMNEl3TWE2VFphRkNT?=
 =?utf-8?B?TlhYS1kvZ25xZUNuRHdRa2syTmpSVG8zU3V2WkkrVXZDSGtxVytxdVA3UEh0?=
 =?utf-8?B?U05nQkdCZXZKb1J1N3ZpS2FPeVhHbFlaOFFSUGZlVTdwRUtSeE00dDlyd095?=
 =?utf-8?B?U0N4anVvM1V5eFd0bi9aUm50V3hFVmErLzdhbWlzYUtLSm1VOUQ5dFVEUGxU?=
 =?utf-8?B?dXNBL2xLOWdQSWV0cUtkTENON1VrU1ZPRjcwVldkZDU5dGl4STM3V1RiOGhS?=
 =?utf-8?B?V0k1NWdMR0syNlZaL2ZDekJrV2pwbXFxeFNiZ1JtMkpVSmU1OUVYUnFCWEtE?=
 =?utf-8?B?SkZFeHc1d1c4YlZuL29kbG4wZlF2K3dGbktVWkNwOGttL3RjWW15QXJ0TXhk?=
 =?utf-8?B?T3p0NC9hSDh1ZGZyeHVIaCtHSXhYVElVRHphQnlZNGZyVzhVQ3BQcVdiWWls?=
 =?utf-8?B?cS9iNmp6SDVsMWNWMWh1RjBFSjBYVDlUZ3FiS2lERVhPOXF1OUxwQW9SOHNO?=
 =?utf-8?B?L2ttT01tWkxpSGRoTkFEMHh4anlGMnR2d0Yxa3RjK3NybWtzMFhWU0N0RlNI?=
 =?utf-8?B?M1l3WlpoblFkUWJVYTZJVE5CdUVmWU9OWWZlbmJuSVJZdmRNL0VWOGJXbC9j?=
 =?utf-8?B?bFc1Z0ViWk0za2F4WC9RZTFaU2gvOWc4MjlBejlhUSswM3B6OG1yL2VKanBv?=
 =?utf-8?B?UzVROFVwMERFRTZydzU5Tzd0T21HdlFCUDNRQ2I2d0JQa3lQR0l0SUpTWE5n?=
 =?utf-8?B?Q0JCdlRudHlXbUYzNFZBbXZWOXBzTy9DNXRrY2FxNUFuZ2ZjeHRWbEpOdXRs?=
 =?utf-8?B?VWVGcWpsTTU5Q3VDbDZITytlWC9Xa2tUZzN4SmZzVXF0REVWS1Y3a2FZMVF1?=
 =?utf-8?Q?kzu4=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:39:52.2068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9e3d41-3727-4bc8-5b93-08de3c764ca3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1561

TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
add compatibles ti,tcal6408 and ti,tcal6416

The TI variants has the same programming model as the NXP PCAL6408 and
PCAL6416, but supports other supply voltages.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 12134c737ad8fb85980ecee225b8bcf5d1bf6b41..4f955f855e1ab8ccfcce9f465727b1b095e80ec6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -74,6 +74,8 @@ properties:
               - ti,tca9538
               - ti,tca9539
               - ti,tca9554
+              - ti,tcal6408
+              - ti,tcal6416
 
   reg:
     maxItems: 1

-- 
2.43.0


