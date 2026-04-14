Return-Path: <linux-gpio+bounces-35149-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC9XBuVF3mnlpwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35149-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8E3FAB56
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F0A0301ABB0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 13:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C953E63A5;
	Tue, 14 Apr 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="eOguIwwO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022121.outbound.protection.outlook.com [40.93.195.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354343E5591;
	Tue, 14 Apr 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174538; cv=fail; b=eusl7bv4yg4OS7kdFaxxGOnKf3gjSz0VMSNH8omrfn+EnvZJ3f3V8uoNw5zOePfeQVDx0oF5AiGX67ImALU6uDqszxqj0EKKyfd9W1gTuFqQOJTCjqyQGb+sVFCGw1G24l9+E9iWoMAsVSkBalPJjISPw2GxnYcFhZjHKljnL3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174538; c=relaxed/simple;
	bh=O/NQ15M3jf6zoB3avakSr+NPUQcnUOEs0mRcdd+JWkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkIVMOEDn2IEzj082XIBCGLj3/c3o1iEA7x2jCP9u7DLNeC7dhJhOEvztFayrxqWVIMqDR8GigejY676WBjRB2uk9lVdpmjLd1UDlfa8FvbHzmmjxuAKQoM2CZbzVdF7tGcjZtlBtRXR35zku7D2Ri4xPgtHmGntQmEq/tIjHMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=eOguIwwO; arc=fail smtp.client-ip=40.93.195.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Imboo+I/Ue6uIGnlCWjmhq+QQft6mzthsXqjypa6TyTUJnw+hO0KZsdeneBEy7cFYfF3zaK8NVDsqI9B4C9aGoQAwaYzYD1Zaqk5vrR1ixWlcYOZDwOxcgx/HUviZ4QeOoth2snar2pwwIKDGBIghbLMUZG65Pojyqiw1KMus+6B/2MCl0rvhNmd+w2mR2pC8CbZXEp0hy8XWGZSkbUuIl/COaRIlYncEmugStCGTQTwU2v/DwsIpEhmX9pFxQwhPrLlSwQhdNK6FbHuKCoRh+xMDr8/mZv+rrW6sman2JZn09LaaPgcvbHTxgyoWEG6mTs7HQqljBA0b6gNHELDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zId+5TVYAXJATNMn5KcJzAqrhS1LRW/2tp29vPuvmCY=;
 b=tSQo7Vtv0TSnt4HLwcZfsPnIBo6+IUc/KTuW4imcQafwcIoXjGOvQnMw5xb3x/Yr48Mo5NZ7Gv/cQzdB0rrWGzSJwL0JS9PyzMEPen43RqBLbVD9B/C64A1zbxwfLGlVVKlUt7pFBbqCW3jmmBi5oIXax6SFUCZmrrqnRqZYEAri/IPcZu3QHbsunVP1PWgrG7oDD4gGJrhU4Gbnd/93C95faysYwx5qQ3i5BFqiE2TltnBHSDLfEQvJvG7uzKwFtjkg9qBpO1bHDqMa0FEk6caEgY4y2YM5eVWgaH77Mc9M3O4C/jRKpasqay6z9S1V6H89iJdKQ3VYmF4bmtBfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zId+5TVYAXJATNMn5KcJzAqrhS1LRW/2tp29vPuvmCY=;
 b=eOguIwwOrbyw3iNJ+lardiFHhzdcXd6JrGd03B57qCpYs5Ai2OzeeLZGS0JwXzVhhoeiinXpAWmZe1oHmmqawhJaeM2+IOWFJ0aOUMYk0kS4xqeMnnj0WRz0P+VUxtJTx6aR+TfH3DI/GuArHSJq1rNVnHVkCp7eGn11YeLY/spOJHbYzFZAHiWG0CPLe6/Rbaa3AowpBZIwY9qH/w8AvOg3XnsyRKUsZuLCqeUwCjwzqXYUrntXZQWl3nhppDSdShvR+BptrHh6OquizDlbBv/oP3+mmyzCRluOOUHvPtptRFjYyumb+7dm5aqqK0rRQ1qw6s5BY+myF8j87TVpRQ==
Received: from PH8PR20CA0011.namprd20.prod.outlook.com (2603:10b6:510:23c::14)
 by PH3PPF6D3BD054F.namprd18.prod.outlook.com (2603:10b6:518:1::ca1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Tue, 14 Apr
 2026 13:48:53 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:23c:cafe::75) by PH8PR20CA0011.outlook.office365.com
 (2603:10b6:510:23c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.0
 via Frontend Transport; Tue, 14 Apr 2026 13:48:53 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 8CE594186B5B;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 14 Apr 2026 06:48:34 -0700
Subject: [PATCH 3/3] MAINTAINERS: add Axiado SGPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-3-b5c7e4c2e69b@axiado.com>
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=927;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=O/NQ15M3jf6zoB3avakSr+NPUQcnUOEs0mRcdd+JWkw=;
 b=uHvkvAfBgxfkT6nA/m5Aa1Z+P8HZWLqbAuvTUUSbHOgqy0Q0838lC9VTw1L+mpZDeFObztmTl
 WvbC1N/QsSNAdfQe4PqaFa05iIqI3+VC2PgsIyJmFVlMJEk7D4CM9m5
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|PH3PPF6D3BD054F:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fd6cdf-9857-4cd5-e0f4-08de9a2c90e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2mpQJPwv66mgsG5xeAZ+tKmil7uZpvf3fdeaqw+1foFrCxdhl8E2PGrr0pNgvGAY+X7rlrWCDrXDiXTpbKJK8V6zD1KjOPUSKeUPTQgIa8bE6+okck1mywgvz7qQzuhUEd2mh6tkTCGrPI6JHXWFZ6Ln+MNCsT64WjsPTq2Lfab0W1w3Hrv2DousB8I3hf2PUD/XD5ZVT0VdWik0GseX/AMmoP782ibXkWwU/X7zvZQsweQXQ6xQuKqyhoEnipMa/up1xuOql4KJtx9EfmkO8ES7mLPVYgkVZqUHYHztIhaC1B8AktHezHWbWIuU7aTC8D4AO749v7LFNq/9EvN32O0DWLG9hW89S0NpgpUo14fV5V9gu6149hVi/0puAeTQh9wZii2AjvP/o0ghIMAberES+XtfYYm+XOjYEmJP43mb2jnCySvqxamIkY2e+V6AwuMM8YbZ5/TL1UkBP69bb1t38LaYnbccC6WzbWFBToBQ6QNoTm0ZwEHtVmPmNwXO+iBNnYrJn+IJ39GxtMqEhl4sa3dARpbvuLFnlI2HbSkiZSaDjPHZ8nKvngkW7V43Qme91rxvHh6RFps5xjIad2nkDlpQQ7zk425QYHJjzKl77FgyzTfrc3SE4xXOFEVGUWhOrNWQhiUIxCFafIMNBMpLbiSY8Tag6S3vjKWXrp0U1rECHfCnldAain4wDpPQAz6rZQ+7nfmdj+Kepphwsre8MJtvlhv2sPMIrAqNf+L0HU9M3pnvjzdNh/Gy1GV2el2D7gdTgC0Xpd0XuCT0ZNaG7u7kVTUqRUPxi4imZUNUHbg5Hem+nuI+qgMAWrZ6
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GPGYhW90D+Y8ZzeccibGMbHha+t9JG/L18pXqf3q36nOwbiLhBWaAvp78ydRyLvf1SokkHQnWkyhrjp+w+dd4o/3AROaYUG7cxNJGOzyQWWt5szxqjuia4IFxEHzLcy4gCGiUUJoiS83Q4Dnz7yPzGh4Ary6SYWee7Uk8w3FkYUIGhYvqF/XhWZMOYKwcf8jHPsgSq346sfO1W25wt58ix7fEA+BL3ahxLB3FZGAQlCU3sEv8mcxg8pAQQ8RuzdH1VRsurVCMGzzKwWSwo+fzTKLkaCNSsRdXEJ+/yNed8S5urJ22VqaLuiRS4rXZsOgvTGgMMHBOjoBLTPpqQhQwLsearQ2JGPUEJZ2OS1syUaMYRrATbR9FT/VDwrG6FZ+EmOOMDSilsw+1NL/VEQVJPIJ9XUlaNKyr03CtaXgwtut6ZNb/fH+smiKDrFugCEO
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:53.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fd6cdf-9857-4cd5-e0f4-08de9a2c90e7
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6D3BD054F
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35149-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,axis.com:email,axiado.com:dkim,axiado.com:email,axiado.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axiado.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pstepanovic@axiado.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59D8E3FAB56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add MAINTAINERS entry for the Axiado SGPIO controller driver
and corresponding device tree binding.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67db88b04537..56835c0a1863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4234,6 +4234,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO SGPIO DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
+F:	drivers/gpio/gpio-axiado-sgpio.c
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1


