Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD00645AC76
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240082AbhKWTdX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:33:23 -0500
Received: from mail-dm6nam08on2084.outbound.protection.outlook.com ([40.107.102.84]:14560
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234365AbhKWTcf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awNlrXYfU8tuk3wvv7aEkH0i56KNmc2mKuuVStymRzCR0THmouIJ5JPsfberBVTFt56Gl/iARrpPLgGaAMuQJ1cTCtwbmOaXRymHOvi6j2PtFH2QLN+BZcN1kpBB7qXmCfQZhzmMXoN9D9j+1xz5W3E2chqrb0qV13hzsdesw068PqU5brMuuBwoKQSJSFI1hEOMLKlhZjm+AmJCRC3Entm0G7YIUCHtsp1NykGr+rg2sCOCIv26FlIglR6g6omQdYOxJCg34W3dXtuhlrphrh6V7oXNk6NCKF57lHUeZiWL13qKuU4CKQJs06eno7bDkEDQzvTo+PmLWN0BaP/AWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYOsKGt49eHIzUU2h46n5rL8UqACDqyTaSYbGFOmDmE=;
 b=Q7VdF133mlvhPiUIFwiwMj/P/n0CLtFbO+Z7uhskKSOzPWyf2JZM9G2+kdLGp6U1QahHfg1PJf2ZvwDeO9BObtqrYaqrqdYjPPoeJB6IN42Vi+pzybu1KngeXR+O0HCYsCzeE1gSDm4E3zFUlT+P2O2ooXXDpRPKC6pyunt2eRo+ek7a669TcuX/u4uLDU257hww+jmbQX3+BJNkm0IoGLFT8K58qbxgSvXmDP0Lc3o4dYmsQWh76PhcFnzygGWtj/d+K4hUYXoJrN0fW/dH0HXaSJfnzikLoLaoWOhf7++JF6R7gAjTP/6ylxhRO2jY9FrOO575SS/i7+cfdcIGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYOsKGt49eHIzUU2h46n5rL8UqACDqyTaSYbGFOmDmE=;
 b=rpx9XBOds5cbC7XwAEmZS9OOY/PqzBPPL+sZ9OD8CWgrGZ9KfoAbFhkWiovsjfuu6njUntI+RpdaLyP1ltvxQREzml5mmwzQls64O0Mfn8jfPJkireFYV9c16+UMBlaQX5kiPYbJSSILQgwZ6era6eSfbtmCJiifUmj+jRtu1AFAJzDDbtGU57zryFUNxeXoZ5SB9Nij0dXbjqFmEwo68QATxA5A/XMEiC9yvaHR01CKMAtF70pBx9cOALv9cFElqj0t9Dz0jqwjhcpR9SPGSTtql74Atzden25UfrQNJs2x7nTtSClxoK/KDwMs+af2JRVCdBzBtKKuYyts/yfA9A==
Received: from BN0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:e6::27)
 by BYAPR12MB2853.namprd12.prod.outlook.com (2603:10b6:a03:13a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 19:29:25 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::85) by BN0PR03CA0022.outlook.office365.com
 (2603:10b6:408:e6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:24 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:24 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:24 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 12/12] MAINTAINERS: Added HTE Subsystem
Date:   Tue, 23 Nov 2021 11:30:39 -0800
Message-ID: <20211123193039.25154-13-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7b8bed-dcaa-49bc-855b-08d9aeb78f0f
X-MS-TrafficTypeDiagnostic: BYAPR12MB2853:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2853D940E44D69B0E471C4B8AE609@BYAPR12MB2853.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLdtvCh+myUDpnJcp4+cGypzDlod/NEl3gV695CHmvLgAX5EZ+zBo9gQPrZ5P7cik2skzkwBUnFwdbFSt7PpwLG+qhMsgjaxD82A7wEq62p3HwIAW7zRLeWxQTMrWVocZ7PiJZu1/Xqqodb5dv1vdUXFfaGZZHkT3UhEixg4Ffj/4ZcraZlg8xbeUT81wjrgkFZGriv6l1YbbeQGP3XCtGhV9lY/HvaFF3YYqd9Hd67UmqiQQjdAva+hNvg8/fjxfuv+QUzhyFK2fIKcJtnNvVBE9eAc5dXJIQMynTJXBHbSNRKVuHH9q3I4TuZrLfFjFbFZS+iAeTfh9QsAXosietegUp7hQhrkydXwatEpYyBKdOQHfoCrx5HsUIHCeMAviURsJa84BVuz/anIvajUdmTBcRhdqjGf0MQDvLCepkmNqtyQD1YIs/U+rXc8V3tVRf7SXN1mQXCCWgtfNYfM2C2R5oKlq9ROPpxZcDaRx8TxiCU+tqVrfyFJgRdyvqvjORcRJWJCZv2g4oPvaXFa85dZ0SaODavEZ3YLpRKVN+F6Et7G3k4JIDOTkopoJVRVd/mru50hjB6uSY+Lwx59wVcl7xS4B6phjrEALnhx2ZDSh3IEyqa53fJvLwvud62RHtYPt+QIyCPiEsu1cOBQptPaBkM2uMMedJ/IAwudraOrr/jLggNVZgIPsXV/MlMdylQWXN9746RH4ommpllSLJZwHR5texKVmLqDz2fXQ/vUCrvu5gXL09ppD2WOKYHAPJiCsftvEAnWU27quvnp6Q==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(82310400004)(4326008)(4744005)(70206006)(2906002)(36756003)(7696005)(2616005)(1076003)(70586007)(336012)(7416002)(186003)(426003)(107886003)(921005)(8676002)(356005)(110136005)(316002)(508600001)(7636003)(47076005)(36860700001)(8936002)(5660300002)(6666004)(86362001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:24.9904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7b8bed-dcaa-49bc-855b-08d9aeb78f0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added myself as a maintainer for this new Hardware Timestamping Engine
(HTE) subsystem.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
Changes in v3:
- Followed guidelines for the "M" field.
- Removed "*" in "F" field.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f32c7d733255..7296ae6110cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8759,6 +8759,14 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/htcpen.c
 
+HTE SUBSYSTEM
+M:	Dipen Patel <dipenp@nvidia.com>
+S:	Maintained
+F:	drivers/hte/
+F:	include/linux/hte.h
+F:	Documentation/hte/
+F:	Documentation/devicetree/bindings/hte/
+
 HTS221 TEMPERATURE-HUMIDITY IIO DRIVER
 M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.17.1

