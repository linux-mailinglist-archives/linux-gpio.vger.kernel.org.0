Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBB13B4B24
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhFYXud (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:33 -0400
Received: from mail-dm6nam08on2061.outbound.protection.outlook.com ([40.107.102.61]:57023
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229933AbhFYXua (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTkpRQefyqx54RLS0aRMdWJZg9UvxtS7HhjDmIbF5oeXD+XcvOIkmi6W2z7786qTg+dlVLn0nSNcOcpqwCBH0Zr3Z3gXfaFOLbQoQKDY8U3e5A57ajxO5GB7+1ID3TBdBzYh5As85F3PjTlw6JoEJIDSE6+FAbywzAywN7PmtBOY0tsONpceYPNihiRxJCqdS/Ipq5NWf44a6xEDM+U1HOeST+QxOaHX5kd5EZljo35sXVw5kIP6RWX/n+pmSZZjRiTMb+E8k11EdaZQE0bVr8Zj6IKkOhayrCfPZs43REkTvm0RwDPY7FN3ZL41okIx5rG3xQZrjfxcjFNSC11PUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gknGpml5gdzaoSbl72Yt4XpgyGP8DJ28L4UrnuZpZ6I=;
 b=khehv6wKJr3mFdMiEvB0NaxVMiIeds2M1WIm8P6YOznWHp1Od9k3Z9ZsowHUGZQvfLYYiK3hRoMegoUoqX6W1UQ0NVUfTWajn0clFelpoMUBlndjkpMBaB3lN4FDVbBPNX2Ft3xXZz/f6KjF/4NnyI5ux7DHL4vxSbAuMWABH0N1N6J2unoK4qT5VLVAwnfniExJ2HKhaAT2akav4OCGpSdtGBMfnrzvBe/J1RxmY/b7PE86BSgjA7N7thuQFWpmHO/lNnOPdPO0+vijf7mVXpip/zNIKkkQnJ4jgPVMvWs4WNepX8jmuvaFKzuuVCvUBLQb2DDkUhwZb9Q+eeeyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gknGpml5gdzaoSbl72Yt4XpgyGP8DJ28L4UrnuZpZ6I=;
 b=KwXu/4RAZcdRYdahbuag36JrYVIW6of6wz8gytnMcv8cUROKj37vDERvrtsnnUMIHUYzRWI+mrjVdg/Tf06+agGeVx5ub05KTOatrLKGKm8HZE8DQ67dzp+hvoMALHwYpI6+b2HsJPpfXq+O/Zhxoj8k0SJEBrhLZoFaavRLuLehuA5qKF6uHfsAQLa4rZ9dBH2i2GYcCiLDOszuI/lU+yFc1Ux8pOKlbQmalcPMwUKnyMmtfvDOFp63MV9JOCyysMZaC/XSaIjdghly4m5qXUo/RkvJ6t9tePXF7C3FjRZAqfGz44qdL8fq40Oi0B/2vjd74Qg+ooMqOustaN4QKQ==
Received: from BN8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:ac::19)
 by BN8PR12MB3124.namprd12.prod.outlook.com (2603:10b6:408:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 23:48:07 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::9b) by BN8PR07CA0006.outlook.office365.com
 (2603:10b6:408:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:06 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:05 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:05 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 01/11] Documentation: Add HTE subsystem guide
Date:   Fri, 25 Jun 2021 16:55:22 -0700
Message-ID: <20210625235532.19575-2-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 158268eb-c5fe-46ad-cbb3-08d93833ae43
X-MS-TrafficTypeDiagnostic: BN8PR12MB3124:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3124FBB7FC7FB8654448696EAE069@BN8PR12MB3124.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Am+fZhNqkYqb1Hpdtu2YHkQ8mNLX0UG0Cf41UiSEwP9QMX2r6MqTS3tfRjTxXNk+THn4+iQZ1EAAvYRiiz7kxkFCNqPdr868VHpq0CtYlNI5OU9SELYYeNmuUbud4vEjhEo/m1MmcF6j09knYrW2II+qK2/DllJOV3Ukoab0U4/iKb3lwz7qEDUVTi6F6yGeEoujsvOJtnW0NoH2Y2zcFwaauP+u/ZbxDoyhTYeSprGsYlr9CYjdwSLz4XQ/9BwygVKtQaZ4gSaafUypIalE52wBjvjQiorjZ1St3l1LlFTURKhZanKL7AHiP8YODtOt3f1SDtlW987FjHVPZRlqcT3l+41CuUxkGULrGTsKaAF41X+oWRRMTnH6dZ9IwYWGUzq7GgmoZiyrdCeCSBDfNUz5x0VTub/NGOpcUjADoKdvOf9zJ5BRTD4sLdvkZaJmBCusvWeNd/1lMyJKhu8LXCAM1h45186b1rvKqVbGU6zvv8o0dvQZHiccYo0zRe7MtI2vpZ4fAlTR+WOxml4uNLDz2/w+4ezVWLvNC1ALM3DGcqrd1QqaBy/U173gehhEzfncHmSQS1Xqif6SeF9Bc33NgdN3CDOxxVGmk/fJcQcUe2GQhezQktqRf0XZRMPr/W6KAS9+i4Ak2FSfo468AD0/cUjt/7U8Gv+J/+SyL6qKSGSpiYUctPhDz3tu92VOltQbIXuchmHuSA6XCmsuEI8DTEHMTjXv1/OSh4aTdJg44bLiLMorEboSHqi6vjMgugSVoMCSVYYqm+WMFHRGQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(36840700001)(7416002)(2616005)(70586007)(70206006)(8676002)(86362001)(2906002)(7696005)(6666004)(8936002)(921005)(7636003)(356005)(26005)(83380400001)(336012)(478600001)(426003)(110136005)(186003)(36756003)(82310400003)(47076005)(36860700001)(1076003)(5660300002)(316002)(82740400003)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:06.6023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158268eb-c5fe-46ad-cbb3-08d93833ae43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3124
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding hte document which can help understand various APIs implemented
in HTE framework for the HTE producers and the consumers.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 Documentation/hte/hte.rst | 198 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/hte/hte.rst

diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
new file mode 100644
index 000000000000..11744dbc6d16
--- /dev/null
+++ b/Documentation/hte/hte.rst
@@ -0,0 +1,198 @@
+============================================
+The Linux Hardware Timestamping Engine (HTE)
+============================================
+
+:Author: Dipen Patel
+
+Introduction
+------------
+
+The certain devices have the built in hardware timestamping engine which can
+monitor sets of system signals, lines, buses etc... in realtime for the state
+change; upon detecting the change it can automatically store the timestamp at
+the moment of occurrence. Such functionality may help achieve better accuracy
+in obtaining timestamp than using software counterparts i.e. ktime and friends.
+
+This document describes the API that can be used by hardware timestamping
+engine provider and consumer drivers that want to use the hardware timestamping
+engine (HTE) framework.
+
+The HTE framework APIs for the providers
+----------------------------------------
+Each driver must #include <linux/hte.h>. The ``linux/hte.h`` declares the
+following functions for the provider:
+
+.. c:function:: int hte_register_chip( struct hte_chip *chip )
+		int hte_unregister_chip( struct hte_chip *chip )
+
+	The provider uses these APIs to un/register itself with HTE framework.
+
+.. c:function:: int hte_push_ts_ns_atomic( const struct hte_chip *chip, u32 xlated_id, struct hte_ts_data *data, size_t n )
+
+	The provider pushes timestamp data in nano seconds unit using this API.
+
+The detail about parameters and API usage are described in each functions
+definitions in ``drivers/hte/hte.c`` file.
+
+The HTE framework APIs for the consumers
+----------------------------------------
+The consumers use following APIs to control the line for the timestamp:
+
+.. c:function:: int hte_release_ts( struct hte_ts_desc *desc )
+		int devm_hte_release_ts( struct device *dev, struct hte_ts_desc *desc )
+
+	The consumer uses API to release specified desc from timestamping.
+	The API frees resources associated with the desc and disables the
+	timestamping on it. The later is managed version of the same API.
+
+.. c:function:: struct hte_ts_desc *of_hte_request_ts( struct device *dev, const char *label, void (*cb)(enum hte_notify n) )
+		struct hte_ts_desc *devm_of_hte_request_ts( struct device *dev, const char *label, void (*cb)(enum hte_notify n) )
+
+	The consumers can use above request APIs to request real timestamp
+	capability on specified entity. The later is resource managed version
+	of the of_hte_request_ts API. Both the APIs expect consumer to follow
+	device tree bindings for the HTE consumer. The details about binding
+	is in ``Documentation/devicetree/bindings/hte/hte-consumer.yaml``.
+
+.. c:function:: struct hte_ts_desc *hte_req_ts_by_dt_node( struct device_node *of_node, unsigned int id, void (*cb)(enum hte_notify n) )
+
+	The consumer can request timestamping directly specifying provider
+	device tree node.
+
+.. c:function:: int hte_enable_ts( struct hte_ts_desc *desc )
+.. c:function:: int hte_disable_ts( struct hte_ts_desc *desc )
+
+	The consumer can enable/disable timestamping on given desc.
+
+.. c:function:: int hte_retrieve_ts_ns( const struct hte_ts_desc *desc, struct hte_ts_data *el, size_t n )
+		int hte_retrieve_ts_ns_wait( const struct hte_ts_desc *desc, struct hte_ts_data *el, size_t n )
+
+	The consumer uses above two API versions to get/retrieve timestamp data
+	for the given desc. The later is blocking version.
+
+.. c:function:: hte_get_clk_src_info(const struct hte_line_desc *desc, struct hte_clk_info *ci)
+
+	The consumer retrieves clock source information that provider uses to
+	timestamp entity in the structure hte_clk_info. This information
+	specifies clock rate in HZ and clock.
+
+The details on struct hte_clk_info
+-----------------------------------
+This structure presents detail of the hardware clock that provider uses for
+realtime timestamping purposes. The consumer can use hte_get_clk_src_info API
+to get the information in hte_clk_info structure. It has hz and type parameters
+where hz represents clock rate in HZ and type is clock type of clockid_t and
+of CLOCK_* family (for example, CLOCK_MONOTONIC).
+
+The consumers calling of_hte_request_ts or hte_req_ts_by_dt_node APIs with
+cb parameter set, usually will call hte_retrieve_ts (non blocking
+version) after being notified by the callbacks from HTE subsystem. The
+consumers calling those requests APIs with cb parameter NULL, usually will call
+hte_retrieve_ts_wait API.
+
+The HTE subsystem provides software buffer per requested id/entity to store
+timestamp data (struct hte_ts_data type). The consumers can manage the buffer.
+It also provides buffer watermark which can notify (if cb parameter is provided
+during request API call) consumer or unblock consumers calling
+hte_retrieve_ts_wait API. The following APIs are used to manipulate the
+software buffer:
+
+.. c:function:: int hte_set_buf_len( const struct hte_ts_desc *desc,unsigned int len )
+		int hte_get_buf_len( const struct hte_ts_desc *desc )
+
+	The consumer uses above APIs to set/get software buffer depth.
+
+.. c:function:: int hte_set_buf_watermark( const struct hte_ts_desc *desc, unsigned int val )
+		int hte_get_buf_watermark( const struct hte_ts_desc *desc )
+
+	The consumer uses above APIs to set/get software threshold, threshold
+	can be used to notity or unblock waiting consumer when data becomes
+	available equal or above to threshold value.
+
+.. c:function:: size_t hte_available_ts( const struct hte_ts_desc *desc )
+
+	The consumer uses above API to get available timestamp data stored
+	in the software buffer for the desc.
+
+The detail about parameters and API usage are described in each functions
+definitions in ``drivers/hte/hte.c`` file.
+
+The HTE timestamp element detail
+--------------------------------
+The struct hte_ts_data, declared at ``include/linux/hte.h``, is used to pass
+timestamp details between the consumers and the providers. It expresses
+timestamp data in nano second in u64 data type. For now all the HTE APIs
+using struct hte_ts_data requires tsc to be in nano seconds. The timestamp
+element structure stores below information along with timestamp data::
+
+ struct hte_ts_data {
+	/*
+	 * Timestamp value
+	 */
+	u64 tsc;
+	/*
+	 * The sequence counter, keep track of the number of timestamps.
+	 * It can be used to check if data is dropped in between.
+	 */
+	u64 seq;
+	/* Direction of the event, i.e. falling or rising */
+	int dir;
+ };
+
+The typical hte_ts_data data life cycle::
+In this example the provider provides timestamp in nano seconds and for the
+GPIO line::
+
+ - Monitors GPIO line change.
+ - Detects the state change on GPIO line.
+ - Converts timestamps in nano seconds and stores it in tsc.
+ - Stores GPIO direction in dir variable if the provider has that hardware
+ capability.
+ - Pushes this hte_timestamp_el object to HTE subsystem.
+ - HTE subsystem increments seq counter and stores it in software buffer
+ dedicated to requested GPIO line.
+ - Waiting consumer gets notified.
+ - The consumer calls the retrieve timestamp API.
+
+HTE subsystem debugfs attributes
+--------------------------------
+HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
+It also creates line/signal related debugfs attributes at
+``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+`ts_requested`
+		The total number of entities requested from the given provider,
+		where entity is the provider specific and could represent
+		lines, GPIO, chip signals, buses etc...
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/``.
+
+		Read only value
+
+`total_ts`
+		The total number of entities supported by the provider.
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/``.
+
+		Read only value
+
+`ts_buffer_depth`
+		The software buffer lenth to store timestamp data.
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/<label or id>/``.
+
+		Read only value
+
+`ts_buffer_watermark`
+		The software buffer watermark or threshold.
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+		Read only value
+
+`dropped_timestamps`
+		The dropped timestamps for a given line.
+                The attribute will be availble at
+		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
+
+		Read only value
-- 
2.17.1

