Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C294302F5
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 16:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244354AbhJPOVY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 10:21:24 -0400
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:49982
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244371AbhJPOVR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=squFz1XWDkTP+iY4rremEow2osSDVijoktN4NfeqdShhfaE6tcFSYsX/RBn3W2nJbFAFJCx+h2IDYDPgDM4mCmsNE4x6Y7xpisMUXebKRFKpNtKEgIxp6PEQ6WDJvYTIyfTsDFXM/USPGOq5QBNiVKZhGytpGCrQXA4PnSiBqQg=
Received: from DU2PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:10:232::16)
 by VI1PR08MB4461.eurprd08.prod.outlook.com (2603:10a6:803:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 14:19:04 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::5d) by DU2PR04CA0071.outlook.office365.com
 (2603:10a6:10:232::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Sat, 16 Oct 2021 14:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:19:04 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Sat, 16 Oct 2021 14:19:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2e28edfa5b7b694
X-CR-MTA-TID: 64aa7808
Received: from e10f3695a959.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 48B3D40B-6261-4802-BE10-A4E750FFD594.1;
        Sat, 16 Oct 2021 14:18:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e10f3695a959.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 16 Oct 2021 14:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX3ZxSZiBK1EHeMtaqX38la8FqkGrYyETGt3q5bf8bEe24arBWKiPJ2mVi6HY01OLb8mnh92Yt4P+h8OktCUSB7v4JztOznyAqHpnSMn6cCfPk8zoR2LSR1BO/J/BvSHApGNrpM9T+ze/VHKvvd1jUs+3jpwWBYeMRl7PVfwfmizxyOaPYVpujtfYNnbnmscFHNSAOtBQ1/aAFVJJUUVVg3BU9IWhXqv7xHKrYpmc4O06sAYjaExOkDGCs+YBoKaauEDGV7EeHKxjUlELsJ4t27hif0P9YPzla+oaQgngluLlN/PAWOfe5eCtaRGSIdLkZkvDWbBOWjihVZY6GU1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=SFnQuaNhWH89k+iV0Z5WJNfkZuzr7pW8vuQnTNARmXPpd59qfx9uflj5wEB23MTQLGsWFTycWS0DLC2dtBjycY4OQBqJqzcicJzQ30an6o/VLes+CyOOzRHpYVPyBoJkUwSzPv9ZcKJoZEodFzE37BMR74bqCIfSZ/4+hh8BpBwPY/w9LVFZORZFhljun1MfVEr5UjYmjKUVtSQ3LOsaPbZy2hD31BJJ+Znz8AQV84w+v9fqM+TrhciW07J+21tuDCIoUc86hvNT+PiIpT1IxWA704WGiLuw+cAOFIBWMIGomzaFYmZok6+zlGcPILtwQv0yZ5zduBcRpt9PHvBHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=squFz1XWDkTP+iY4rremEow2osSDVijoktN4NfeqdShhfaE6tcFSYsX/RBn3W2nJbFAFJCx+h2IDYDPgDM4mCmsNE4x6Y7xpisMUXebKRFKpNtKEgIxp6PEQ6WDJvYTIyfTsDFXM/USPGOq5QBNiVKZhGytpGCrQXA4PnSiBqQg=
Received: from DB3PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:8:1::17) by
 VI1PR08MB4495.eurprd08.prod.outlook.com (2603:10a6:803:f3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15; Sat, 16 Oct 2021 14:18:43 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::83) by DB3PR06CA0004.outlook.office365.com
 (2603:10a6:8:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:43 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Sat, 16 Oct
 2021 14:18:42 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 16
 Oct 2021 14:18:41 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:41 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v3 1/5] gpio: Allow per-parent interrupt data
Date:   Sat, 16 Oct 2021 15:18:35 +0100
Message-ID: <20211016141839.45460-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016141839.45460-1-joey.gouly@arm.com>
References: <20211016141839.45460-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f35d483-0a7c-4a45-ddc1-08d990afe8b0
X-MS-TrafficTypeDiagnostic: VI1PR08MB4495:|VI1PR08MB4461:
X-Microsoft-Antispam-PRVS: <VI1PR08MB446153905532003EDAB50AF594BA9@VI1PR08MB4461.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KXcEsAvhVqc3SJOsAPV5M6rb9zud5cwbYpgjuksVVQdK2fHMpd8w/lO7dvdxqlVaUT+A6YQZkz8ylkJepEBxin3eRdLVTWknTL5azdQSxQ4NhaBD0WU5vC0t2JeoKHIqruuezzJxP+0FCMFuJXCtwVxXEdi43mIN26wRi53aVrC887VPNQY7NRhASF6puHYwToNx/DH9KT29aVK3roDQM1oZUSGifnA6/sWypqfA9c3gclwcB1rVlqTqgKCsHun9quSi9C3ejSOVxgpJfgs8mAKiv9ynchAagRfBJkvueyjDo8tiAHc6KXr+ujZSLz8V6r+phcP6jukxiC0B/8pzhaAYr5ScGU/E7BkoJM3aPU5JSpMxVq+TyBDZeAWKUs9PC+vKoIPDX4k40utpZTdtDpeY4he3nbu/Oo9c/N0WxUL/SfP9b/eCUQCzocLBoqXOT1fAxOCyiQTfQBf5o3BGySJATQBOjS+wxFK24FuJcspf574mOELV4jhsWAuzDu9fs1X5gc1Y99Q4lU/gaSuu6TWsaW4hf0mTk6P1KAf1lrIDyOobwwDIxPdJoqGKas6cY5XB7Sje203Y6onkoeC+2621dVKZZJYEJFb7i13cZEA/xNXVkQZncBNDZ+T8AIaEL7aGpem8T1v9nSjZS0kqEYWjpeUqgXVVCJcWgJsG/8+N59I3B7mt84shalLWzpR6DP0lIfJJ7TCiFAh2ymaekpls3tyTzfyFWv928697fHY=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(7696005)(508600001)(36756003)(6916009)(2616005)(6666004)(86362001)(47076005)(356005)(426003)(36860700001)(2906002)(70586007)(54906003)(1076003)(5660300002)(26005)(70206006)(8676002)(4326008)(83380400001)(336012)(44832011)(8936002)(186003)(316002)(82310400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4495
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7c4ca1c0-d2d9-414b-ba55-08d990afdbe1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0liROkla2fA1NviMq3czo/i3BNSIwDJqatkTGi0CXuG3I1DvpAG16xmNtc6eJPsYcEuKi/MO7BjRu8Tb6j0+1MpWvJXJ8QKjemsNQ8NIy12rju72fB2df329VNPSL78R/BlzsGYH2YUIX+ZDIezTM/if/O+VR/yczJh8AsET7jff4I3oFwXG33amgVml1XjcoaBolBDtGZ6wGKkedylq88T4RGZ+f0lmx0WAbsIPCqUhf8z5q5TcSPZg7dM2kkghGO47eA7NgEFpJTlPjIjDNWuS0lWTLWBH2UDhH1zmXyD35geqa2kxn6y9JRH3O6++x2ViM29BwPpZ0lUOK+VwfAfxU6bm4Rg6AVMOltubXHT9M47FPo18pnUPUfRnftah69dOYPiq6RpEFQKimEXj0XqdSBxCTw2dBWneCqbKuF7+kEgtNhVopy7opHSy6MX2Kg0xCnQClZ0+ky84+w9/90jeCyS//XUs5E5YsE3xG08fk2VbKPrZLmAnFVkfhd32UQ9/ziJJ5N3eNe8YqspnPcDu5KT2U3p1XkGNQcZZB58qeMzKEMkXTWOMIqLgEfl9shyYDejfAYDEEOMjHmiFGpi74kQLbwEDdaDM5xqoOsts7O2jtxTItDD4mMk21gVsPaCtHEqbLBfbD75gXGVQ7tW8DSEyvBrQ5lzOeOaSDHhNDcaeT3eY/MxAJwvRRiPqt/DpI8MbrD0RPdouHTo2Q==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(186003)(316002)(8676002)(47076005)(86362001)(36860700001)(82310400003)(36756003)(1076003)(6666004)(44832011)(2906002)(450100002)(81166007)(508600001)(6916009)(336012)(26005)(5660300002)(83380400001)(4326008)(7696005)(70206006)(426003)(70586007)(54906003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 14:19:04.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f35d483-0a7c-4a45-ddc1-08d990afe8b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4461
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marc Zyngier <maz@kernel.org>

The core gpiolib code is able to deal with multiple interrupt parents
for a single gpio irqchip. It however only allows a single piece
of data to be conveyed to all flow handlers (either the gpio_chip
or some other, driver-specific data).

This means that drivers have to go through some interesting dance
to find the correct context, something that isn't great in interrupt
context (see aebdc8abc9db86e2bd33070fc2f961012fff74b4 for a prime
example).

Instead, offer an optional way for a pinctrl/gpio driver to provide
an array of pointers which gets used to provide the correct context
to the flow handler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      |  9 +++++++--
 include/linux/gpio/driver.h | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d1b9b721218f..abfbf546d159 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1534,9 +1534,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 	}
 
 	if (gc->irq.parent_handler) {
-		void *data = gc->irq.parent_handler_data ?: gc;
-
 		for (i = 0; i < gc->irq.num_parents; i++) {
+			void *data;
+
+			if (gc->irq.per_parent_data)
+				data = gc->irq.parent_handler_data_array[i];
+			else
+				data = gc->irq.parent_handler_data ?: gc;
+
 			/*
 			 * The parent IRQ chip is already using the chip_data
 			 * for this IRQ chip, so our callbacks simply use the
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a0f9901dcae6..a673a359e20b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -168,11 +168,18 @@ struct gpio_irq_chip {
 
 	/**
 	 * @parent_handler_data:
+	 * @parent_handler_data_array:
 	 *
 	 * Data associated, and passed to, the handler for the parent
-	 * interrupt.
+	 * interrupt. Can either be a single pointer if @per_parent_data
+	 * is false, or an array of @num_parents pointers otherwise.  If
+	 * @per_parent_data is true, @parent_handler_data_array cannot be
+	 * NULL.
 	 */
-	void *parent_handler_data;
+	union {
+		void *parent_handler_data;
+		void **parent_handler_data_array;
+	};
 
 	/**
 	 * @num_parents:
@@ -203,6 +210,14 @@ struct gpio_irq_chip {
 	 */
 	bool threaded;
 
+	/**
+	 * @per_parent_data:
+	 *
+	 * True if parent_handler_data_array describes a @num_parents
+	 * sized array to be used as parent data.
+	 */
+	bool per_parent_data;
+
 	/**
 	 * @init_hw: optional routine to initialize hardware before
 	 * an IRQ chip will be added. This is quite useful when
-- 
2.17.1

