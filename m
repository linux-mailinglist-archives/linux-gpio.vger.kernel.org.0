Return-Path: <linux-gpio+bounces-36641-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB8JGIjEAmp7wQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36641-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B871351ABBE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EB20302A7E4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 06:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21804450918;
	Tue, 12 May 2026 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QClDzNv8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986543D4F5;
	Tue, 12 May 2026 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566188; cv=fail; b=P7i+kPxAjoD+HUmvRUPkoF8sVJ+63LVTaz2djCy7x3l9BBHZjvL6KCsNTxwtV5jTjvVEEXc5ne04QU2sF6UoaD9eKD4FdIWLD9Gcb+ZNdSHam7iuG8fcg9PM6Y2XcmYE+lPENVo0wwwM/VluWuVXIPWr0lbIPIL/u3xIJH4xYHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566188; c=relaxed/simple;
	bh=6kglonxAeB0RmLAN8k+CvrUqHAYKqdIC5k5CuC/A8w8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+I5Vt0Jeebak4Ruzu/q/e26RCXTwFkMyDwOaBRKpQA7zlDyedz2gCvZbNWtfkNjauXvqCinG7rbl4hCxS8YtM3Qms76pezADteFpiFmjgjwI54qZ5zDvVVN1pO/PFx+HRo8UEaLjDqCxdaHR8RL1YikvlipiKEPEoA4eY00Kiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QClDzNv8; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqvMOCDDYk5EsoPtJsfwYbqvqr+2BIhJB0ai6yovpigM9ftZBHm5leo3Vjx7ilqrrVH5ZhzRG5WtI5x68g8z73bM7BGRBNtWIHgakvLHVg52AHw8cHKxHF4RZaQYLBHZZeiGrTPWF4SWjb8c+He741efWRS5CM4giEqvBZL724twMzLqeSOc+xStecIClKPdg9Uo6jH222FCnUnmdobPhUo0SmvjhHuEw4m0iRuuBkSyMAXfCZ0Joc5O5utBsRKU9J1yv2NbJFU27dgZXMwnnDqhpELqm5LQtz1ypGE8HsXk397C328lSqOxzZM5R1qp4K47L0SIcGL0bSGlTCM66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR7wM94W4WPEH6a2yD5h6iLUv0ceeieWcpfrJRMkgIk=;
 b=qFkvdEZlqongBWIrUQkaQtjSUKJ/IAd+cXhapgwfc4eUDw459O9TCpTaiuFOxN1X20kjmvzEHLxKvPeV1hm0zoxHI1GMhpHvRsQlOeyk7qDDhIl71EvO6SWV2lGdASNhtK2oavBBIkPBM0HapSOT97aG0J5TVmYqe4VPds0hXxJK6wt22RtzaQctxnU6PODfAjGpSR5xOj+QwrbineYsGicyq6yP08RmeOQap+ByU93j4t2J8OlHtTatIvd3qrpYtrudnxnqtjkaKjXSO+G1eY5IZ2SSdXGgSun6wW23ul/la6cKgGNs3BVSEQ5dew/oAPJEkkp7/2kPMxYKJaqdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR7wM94W4WPEH6a2yD5h6iLUv0ceeieWcpfrJRMkgIk=;
 b=QClDzNv8u9ZkGViyCIvquNB+LYTykE2D0wYkRZrNLBHUEABuvBtNzJujsEFi7YTHzy47Gb9lRI+fUzOMrlqz94/WoWkc3V16ABGasmDEjlRO9iwScyxRyOv+V+8XbXy80KDzCHeoFm9u3ECMP9AFlvsbEcAxrmVnIDcrG7T+Ju0=
Received: from BL1PR13CA0343.namprd13.prod.outlook.com (2603:10b6:208:2c6::18)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 06:09:27 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::83) by BL1PR13CA0343.outlook.office365.com
 (2603:10b6:208:2c6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 06:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 06:09:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 01:09:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 01:09:25 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 01:09:22 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
Date: Tue, 12 May 2026 11:38:47 +0530
Message-ID: <20260512060917.2096456-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: d98529ae-a4f7-4236-575c-08deafed057a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R4j6vCK8Dqv4VyscQAiZKjJcH3cO1VwsgynvgQ/l0WGWio9cM5Y5wrAtjaBZtV1mozAsejVZveM+J/28oTgC55lL28AmtQzxdth3RO34xylKaPKholBqk1L+z6UcL03Jte+ePXj7lYcom1+FPFcasTbr3q3ozzVsLg7WtR140R/8bDk2BWgwRWT/3TS1kTJt9fuezEpwmJ2iaGQx757DFsDHL1tg80hw88HKonX0WWDi5t+fyoQ35X/i+cShKu/ERD9lKpcVeYXRqV1a8Uc5GUvHPnBmE3Nn/DyokhoF3VQ9sN0HSD6oFCPU+7ERHpDATCATzE9UC3boSVWnQhBXtPw5pCH93GFZjJijgAXDyeCQh/qrgb9/FLXlnkTchdLNYvfqJBLgHxun8plk2DgaZetKV0iNow/x4NUAjF/4KiH60E+DeIpw57qS3YVnDHot5jClG9yr5HdL+o50bNRCY0z4F/WSaxk+dVnMAZo8lDs9fZ7Kbh4pylesdY+LlHzXlXrViI3r9Q3yCjEGCknwvderhYtCzPF9R8O9F0TwF1qqvt1aVGIOpdgDXgyw9pxS9ezuiUDYSJDEraK/XS+cLBR+MR4x1sS1wtEPi+u5l4nI7/SrMTJB4PoTcoYULxc8h/a+HMEjyvKWCEIVWdvf/WfWiF2wiAbBm2CnimddoCjAaXefjJxQxlNhnkBScCUsBs/AusHHr32X8ITJV2fVgZo6ZFMz/AQywUsqe2zENB8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sqb7sK7Cpeb0EKoWE6RpKvpNnRtm7RBEW5EW7NGqKbaQTVq15pBkVNUcZZCf37zpCSZzwpuzEtXF00kChZPfRk6BwnnzqSNfDhEb1hIQ69eqqz7WX4X4T7sZtLa3aNTy5p2dRs2plDz+qkrZBGaFCN13noSiK8ljYdy0mnd+vPqCXxI5Ct4n9DQmCwE1Nchxp17F9Ljj5SC4EtxCGnB7qEGn2vzOZG6x+X5hnT6s+8OxhGYvxTonMUBsflwpLV2uo84xUBEINgT3ZryZKPtqC7oiTNilhBO+TD+n5fyxAlvESmBJwAu7p7e3tfiIYqiU9pDIXddGp4/PRtBg7iYCQJwdprY7Ee5lhk/ZbsVSidqlIveXbkoh5l1Cg2Gz8rmz/HPklbCXif1CUcljOKogggXDRDItAXpRka0tIKqmajarWdrMzJTU1fVwPK24uxWA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:09:26.6759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98529ae-a4f7-4236-575c-08deafed057a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947
X-Rspamd-Queue-Id: B871351ABBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36641-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Sort the compatible string alphabetically.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v4:
- Add Conor ack

Changes in v2:
- Add new patch to sort the compatible strings alphabetically

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 5e2496379a3c..30a7f836c341 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,10 +12,10 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,pmc-gpio-1.0
+      - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
       - xlnx,zynqmp-gpio-1.0
-      - xlnx,versal-gpio-1.0
-      - xlnx,pmc-gpio-1.0
 
   reg:
     maxItems: 1
-- 
2.34.1


