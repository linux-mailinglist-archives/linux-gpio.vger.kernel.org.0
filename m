Return-Path: <linux-gpio+bounces-22315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23207AEAC06
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 02:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D4D1C21A20
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 00:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A27F18E3F;
	Fri, 27 Jun 2025 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maxlinear.com header.i=@maxlinear.com header.b="Udr/qwCs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868EE9460
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 00:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985670; cv=fail; b=eluIDXxh/7iaolcrL/1udKwug+UL8NEgjlTH52cc1Pmd1ZMAURNHhZJ8yq7RT2MX3KLgcexY0+3fg/8uT+BBMC/u9po8jq4N5P/V8K+UgOwlaFEghWFc1i1FxN18rZSE7dIxwVKI3FQ3jfYUFe9ALmgLOBQGNm0PqOefTNcZEs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985670; c=relaxed/simple;
	bh=8opweb4vMncoDJfZQEo3du87RjwcBOfFHGfjKY2oyh8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pEMl6OGLCGeE4E++O0k4eeHeg47gihnrHtnr/Vb1op8NlyzfSDnc3APhzxiBGiJ7GCJZkoov8EMFihF/y5FRzLbmXuef2/vQ//C1Zp3wVpss5mPYVJdd1AZDc8+PQAEpNN9cpguR59wQeS+j/SvI9VG2WG6+UZr93I0b1701oU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maxlinear.com; spf=pass smtp.mailfrom=maxlinear.com; dkim=pass (1024-bit key) header.d=maxlinear.com header.i=@maxlinear.com header.b=Udr/qwCs; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maxlinear.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxlinear.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2p7YiGK0nhJg80ayBmRHdKtCU7RVxR91bwLIdzKd/gGsm++jPcxzo1Gnq5sbMBWDWUpEMDjj7PHHmRVilS83SdaB1tZGzHXvynkHjs1dijd/pqg0aTvfxze8qTimqFzEBfToJdWmkPD+JJTFp9X+Fxxg6k7hTdl9uCTjmcGc+oj3vY1hLdxJLHQzjMtt2ZUDSgCgcw4aZ2V2xK7DuDw24uKGTzX16R7dWxh5lnl13RPt75FUFkEuGUe0DuFdN564/EdPncemV4ODBH+kd0FD3j9mGJZ5CnrFwG5Q0kxHk8NStw2ML+KVTIw3P71WMQkOuBA3FPboQLWhxQFE1UcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVP3Pd3mjyeUjuEyY0TKSobeZmVsi33PsXVHA5XvoSU=;
 b=ebXW4NhDJ3QuW2DyC11ZKt2Qle35/2yCxyMWOpAbXzfdLoTXtyFvYvT/GYPNZhed3hygkL0nHHMvAHjlKxVrgQHK5Ke9ejIzfXwKUQsNu9Da8Y1Zx04/DqM99OXX/AuFKts2C2WGCZ8jkCfOe4l8mtgXJ7ce+3OcPGTpRHfJE93Gi4268hP0lsHalq4cFKIodU+n9zxk5jkfJbgbv45Ph/Yezd4pj8FGp9FDg8mVhM2cYHvUwceaO7Z40wBAX3ePBHrGX4dpIhjwFM0bVLS9GwwKyKGbR2b7XHqiE0CrcOY1bIjnd/ntIcwzhismNarE+vEMlP23JqVpqh0LAyi01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 174.47.1.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=maxlinear.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=maxlinear.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVP3Pd3mjyeUjuEyY0TKSobeZmVsi33PsXVHA5XvoSU=;
 b=Udr/qwCsfx7sPdSOcfWFzeryZpkk9LW1bGQKJJz7f7Z7LiDhdV5kT4lBw9su5XnoIu6qoUOW2W6ItcA+148N3AMdMJyWeuXCL9c9C1nc6GqMBsc8lECbQ2E+fVxLj4WURQG/WsVXg98iU+FnVswvu+hgUu5+2KdpnCixyIrELmo=
Received: from MW4PR02CA0001.namprd02.prod.outlook.com (2603:10b6:303:16d::21)
 by CO6PR19MB5401.namprd19.prod.outlook.com (2603:10b6:303:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 00:54:24 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:303:16d:cafe::14) by MW4PR02CA0001.outlook.office365.com
 (2603:10b6:303:16d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Fri,
 27 Jun 2025 00:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 174.47.1.83)
 smtp.mailfrom=maxlinear.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=maxlinear.com;
Received-SPF: Pass (protection.outlook.com: domain of maxlinear.com designates
 174.47.1.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=174.47.1.83; helo=usmxlcas.maxlinear.com; pr=C
Received: from usmxlcas.maxlinear.com (174.47.1.83) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.8901.1 via Frontend Transport; Fri, 27 Jun 2025 00:54:24 +0000
Received: from sgb016.sgsw.maxlinear.com (10.23.238.16) by mail.maxlinear.com
 (10.23.38.120) with Microsoft SMTP Server id 15.1.2507.39; Thu, 26 Jun 2025
 17:54:22 -0700
From: Jack Ping CHNG <jchng@maxlinear.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <yzhu@maxlinear.com>,
	<sureshnagaraj@maxlinear.com>, Jack Ping CHNG <jchng@maxlinear.com>
Subject: [PATCH] pinctrl: equilibrium: Add request and free hooks
Date: Fri, 27 Jun 2025 08:54:19 +0800
Message-ID: <20250627005419.3124660-1-jchng@maxlinear.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|CO6PR19MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bc851e-b262-4a1f-f874-08ddb51528de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?igVeYcOgLJq0gwlRvkex8IGhOBJaHSNkQo3bThZkehWsMHJ6C5K59i62Jbn8?=
 =?us-ascii?Q?5WwW7k6OBy5Mq/ZlRU9YrJXSa/Ia/4EcIEKXM+TBfDjupOXK4Nmc7XZmUnRu?=
 =?us-ascii?Q?90PLcClXQasfAY+QXi5CjWtULsEJoppghbFeGhwZDTI2N+XXi4sJUR5qyuFw?=
 =?us-ascii?Q?GSfHsSFH2hJAizeZoxtCjsF8H7jl9wsYnhVbG1z87sRuZRQNqzAQkRJAZcL7?=
 =?us-ascii?Q?y1O+p29a8PJ9CBwLnFIqaQdfnZVHS5hm4Vps709h8PfYHhq5Ah7U1a22umc5?=
 =?us-ascii?Q?k4Q8Sdk9i0uSZc00CO8FXRds/sOGV5WOJiXosAmn46TdYV9B8w9dKZO34232?=
 =?us-ascii?Q?7cV5HjkCA7G+cUQjdnl11CJdfFNQfYRsqm/oKoT5ngUARMWHKSm9/TVhFbp6?=
 =?us-ascii?Q?gjzXtq9BDuN9i2opsk1PJHvQm4wLeYGHvJ/1onq//Pcs3/iQZ7mPErZlSGVE?=
 =?us-ascii?Q?LC6xXKPljJzRs2VSHCGDi9N/tGz1IjUiaszJBQPZyJ3rtUw9TgsaxPJJYZwE?=
 =?us-ascii?Q?y/l7C9IfQJvhknmkOqcmtoMstbGBp4tFaQY6+Q+8H6hxZi0yv9/079DOW3Cn?=
 =?us-ascii?Q?hDJolyVvCaf4OjvyjUCBF3gZLo2WcYPqNQ1G8YD9ZAFDF21JJqdMI5MqMC+s?=
 =?us-ascii?Q?CYVZeigaUhKqqf/AsFTPpxgA8b34XUxstDnvxmgUhnPc87dsyG9s+iNsJYtY?=
 =?us-ascii?Q?vHl2skI5w3MHZu3JS5koXEXxUTnTekbCHtvf0aVfglnSg5Hq14rWXrzqpHNt?=
 =?us-ascii?Q?j5aS8Ftol03HEmaLKTbpxktCOlAVv3XQxeR4dYMagzGGNJotjCXFiv8E7aFl?=
 =?us-ascii?Q?tawq3DmARo9Kh4zyDBl5zC0oyg4A+YIO8eWodXCVlAaCh30Nd7PGiTVjQIr1?=
 =?us-ascii?Q?h/bcxyQvPTYmRZuSc2LHZuKUluRcwfSG4tGQLbKUDAMluTGCrMctsepOVVjW?=
 =?us-ascii?Q?M77exDV/7VxNc1tZIlGdQH6cEc1ZIaC1InBE8/1uATCv23lZXP1xesXv+SCJ?=
 =?us-ascii?Q?uFDG0d6Zfyr/6ulxcmqUuW9aNG7pgIdGDQwXfiOi3MB1YoGvqKpB0u28BB5D?=
 =?us-ascii?Q?Cg+RiiiojXNNZGplWEKM4geu03dnFagndTSklsrzLCxxfE+HLhF3H/vHWGe5?=
 =?us-ascii?Q?OUf/87JyU9cqUCPOslPZKYtxNPTZH7GEFjBost/shnoIzPI5Sr8ZDCbeVG7Y?=
 =?us-ascii?Q?ugd+6jxqcMcsQEcJZ0MiwYcuGbYE3Xi/RMTMQeGO5klhJBVvAEnitK5Cj29D?=
 =?us-ascii?Q?3XsJaVYiml75KQKmZs762r2UoLhe13dYgNuFR/1IEqKk4X49oIMuBVhDeXls?=
 =?us-ascii?Q?ALNqzPj7DTK9Xw6/eGJVJ9AeBJJwEyUqfhkQAMwYYnvucDWR6a9ZTlM/Zb1l?=
 =?us-ascii?Q?UQ5D+8kWGtJ22D0tXj9b9bujTu8r/Jeq/QhfTq/EIGfTu/GM3nKXa0dyLY4I?=
 =?us-ascii?Q?7y67xutsWP0bkIXB5PNhloPYc6Z6X0de8pQsqg/AwfD/m305WVm+1vokaHRi?=
 =?us-ascii?Q?M0LlO+auVK782f6atOajsMvsw0G0NQ9qr5lX?=
X-Forefront-Antispam-Report:
	CIP:174.47.1.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:usmxlcas.maxlinear.com;PTR:174-47-1-83.static.ctl.one;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 00:54:24.0695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bc851e-b262-4a1f-f874-08ddb51528de
X-MS-Exchange-CrossTenant-Id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=dac28005-13e0-41b8-8280-7663835f2b1d;Ip=[174.47.1.83];Helo=[usmxlcas.maxlinear.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5401

Add request and free gpio_chip hooks to support
gpio allocation and release in the driver.

Signed-off-by: Jack Ping CHNG <jchng@maxlinear.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 3a9a0f059090..128b7efb110a 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -182,6 +182,8 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 	gc = &gctrl->chip;
 	gc->label = gctrl->name;
 	gc->fwnode = gctrl->fwnode;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
 
 	if (!fwnode_property_read_bool(gctrl->fwnode, "interrupt-controller")) {
 		dev_dbg(dev, "gc %s: doesn't act as interrupt controller!\n",
-- 
2.43.0


