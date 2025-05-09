Return-Path: <linux-gpio+bounces-19873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264DAB17F5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 17:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7ABD1685EE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA5423504C;
	Fri,  9 May 2025 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="CzhlwlrH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812920E6F3;
	Fri,  9 May 2025 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803203; cv=fail; b=nS+Mc/dqMv4GJNSdgDONtrgMNpXXnfe1Bm1NSqo1oJUE2U3rwZZc+8+hGlKe7UskiqPSav/HENP9O4yIypmVp36LUlzXMneHBP9HnD+9Hc2BQM7s/lGMCd6Ydj+ciMtvFtOgtFd0qAaH9/CiHXZXy8IWqZD3Btn4lFFI1Athiso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803203; c=relaxed/simple;
	bh=HrMhF5dYQAhI8CNbi3T5sxucsigH6bZvbJsQk5UtuNI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=A7lptG71kSMQcAA7yhuzj+QQC1hIOaA6U3UX4ll4YQxNHd+/NcblOZVLuy4uyIBbzO96FFGbmZrVApNjY5+bCyQXkSs2OK6fFnybFyD2sUsLuqQTVXahu1ZFFBScJ7hefSn/4/+/28JA2Q+HIBXXO49fKbYTumVplS3jT7hSJFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=CzhlwlrH; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJM+cBEd3aJzrWnOAVRLL3pirNPyzLUhXlK9del59nKkbgbiTUZy25SdOQEHZSYgJ31p0VfegVXbMTCNDnJ9CmYpoDYJA2aFO8VghIBWl6nBRhb2pW9OGWV2EL86Hkr3SSJvxv8hRAlAc7KqrpVL51IEH6GSqkNMv7POn4kOwcOuakXa1yvJAG5VRrEImS9HdGOnkeCIF1umhbWMNO5LSlvDGskRLS5Wia0gSpObPxMF8NR0i3rWcGPN8N5c0uKuqapZGKYzB08ZtVsS46n0PTnKfZ7FfNE5i1oHObV4MrS7/5IaCWxM91XCdaUkHFuajS1biLksTHyNMacl3yVsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zXjtIo9+CyYMi4+14QNeIkHrQ2NA/pHJAcAkpKL7ys=;
 b=S2w4TOtAhgBDbipjkZObEOXBut4vfw07ZWt+mgW7ajqtg9HqRflhgJIr+ARFa7QmmALv5qds6/5gPzRuT7/YVdZgJBVGhegx6P3yk4vGaFs3Rq1NrXeq7xNGIyUs6Y0LdiQwsTOm0HKylOwKCKvgmelGImVt0OZc8zacnUvJlX4vAdHM7Vk000qXcQglru7NQBz/YhNI72m633WcyP2lKzl9MsdettWqZteY/YnBVayqEyE4fmXcqYcPnqdQqrqpv37IqqmWEPub8Ikq+wSs/bfGz66AKGG+4sags5kQ2Wf4SF5TICaqzXXPm2qYlI7jkDgG3LGcLP1B8p+YW/J0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zXjtIo9+CyYMi4+14QNeIkHrQ2NA/pHJAcAkpKL7ys=;
 b=CzhlwlrHFV98hG8F/MbqbA10lApwx0QDSyVfOk/lnhRcKbP8kMTQ9Pu47OhIqlppNRF4BJhnmRoPzSjanOA4F57vsLwqJHsvsuLctXdgtYTBCxB4J8QTO00w8v0WPkBuM5t0JXA4xB4WOdgtpXh92P5LizL0ZkiX13M49tHIM3iRm1EuqPa+mciABillA5UV6bpFTcSu5F3hANgyqjxIs64HM9CYZv0LFQdHK4ovBhUEiE/WvSi7rQ8tT8C+Eag4zD0s3v4GE5+lo5ijuiZJpTjsXiZEObY4UD63QCeB6H3rVBGCouVJqIy2+86gd+awdeIMi0e/YzNn1vmNKZIomQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 PAWPR03MB9666.eurprd03.prod.outlook.com (2603:10a6:102:2e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.38; Fri, 9 May
 2025 15:06:35 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Fri, 9 May 2025
 15:06:35 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v1] gpio: fix potential out-of-bound write
Date: Fri,  9 May 2025 17:04:59 +0200
Message-Id: <20250509150459.115489-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|PAWPR03MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 399f3bd8-1c4a-42ab-613d-08dd8f0b1756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aNNm1HkcmVz++/+tS9fITcwRKPKuvCyAd1QAtFhAPpHenDOiRiwc/3UeJSl/?=
 =?us-ascii?Q?7B5MhqXHWmJBYwmPa+cu+gaash/M/ozHGVMqnU4z73ov7qzVfG9lRbaIK0+H?=
 =?us-ascii?Q?c/vBuT31uq28LFqtx7sDddpsv5+g+9vsi8tfOhEWFkhCcur2ANNJpmUl+/N2?=
 =?us-ascii?Q?t080Ortgt1fUfyVpRURuFfaSTm/CA6XccsWRpRcVgl2CCiQJkAuSkCSIKsP+?=
 =?us-ascii?Q?GKm4i2oOelWAymajz6mQIjZ+yEP99kXwYumABbb/Y221a5z1QIt8nmlaXOpx?=
 =?us-ascii?Q?c3wkIgYNt4M7d9oAABJHQ1fDWWNsH2mUypI4fjp/uXQ+2YCu3mLz2ThbbIsg?=
 =?us-ascii?Q?iqEypfqZw/0iQt+ZgkxHIB/rQGzZdBfscbLDqO03PZJ3YGYRg+K/YbA18bNX?=
 =?us-ascii?Q?oqBRMECDv6UQjJqcMHMro/tAUmpB5L5IBfm8h8lEtTcIMa7L0PTnsQXrSpFA?=
 =?us-ascii?Q?TpnELeiDFayNcqurPpm9NrBHMt45trAtv2P+INd6Q7VPqYwAcDjiquC6hUqt?=
 =?us-ascii?Q?tjYx8RMmvZaJvPZhnMh32oWGSrtFw5aDfLdzUHEQJjeSlu333tppyvGs4ag2?=
 =?us-ascii?Q?5F1tUiIWcgY9CX0pEWFRaYCaWjt/FkAoXOiWOkXqbSDPXbLPJQaY9KuNy/0C?=
 =?us-ascii?Q?qkDAVuJt7N+HFtgj8QhFIQ5sfYt5Gq+RFdfP1kC2cXax82/hTfZ8znHXTutE?=
 =?us-ascii?Q?cKrfQ+ROsSLxuc+N22uTshusM1x7eoPx7ClxvRtBF7i9E6ZY5WHsNfMiLC8m?=
 =?us-ascii?Q?nqNkxcirBpuGiNwO1H3Kar0dDuzKBzFz1y1PO9ddWuwDaIodqNDGqfiOvkfi?=
 =?us-ascii?Q?g8ElDGyjxUSJt/tZhHeQoz7we4BwsluZszJKVhegQNHGRHV/FbUacU/oXN1o?=
 =?us-ascii?Q?nTINr5FxJa/u1o+1ZnmxXGFCyqnRhZNOQ9sEspyLlIrYeGwH1YXpGo+0etNU?=
 =?us-ascii?Q?202OC2F8ZmKp2ZHLq23a0IwJVb64JXu7aGT9HRS2/OawqnGANfGWbNZpkqKR?=
 =?us-ascii?Q?xjvV0jYwk4yHAT3CK4DtnZaFiATnVa9GN1THxvAQ8uudYsYKeSHS64KbQ/O6?=
 =?us-ascii?Q?7CFqT9WCIYps3LbNGvxKiCnl4dLCRbLWUzVHnPa9MmKI6BFESUxM5URHPaxB?=
 =?us-ascii?Q?eX0D4KrYpPpWvli3VOoBn263jSUoZCrELyrEz83pMB60YOU8XKVyHrwRnPTn?=
 =?us-ascii?Q?6V5TfgbDTfgYv5dkkf04pA8FL9Szt7oTFs1L7T4/fg6JNfu1DtoZenJekL2Q?=
 =?us-ascii?Q?bZWP1CZUHVPxMDrPCgYYcGvxE/F2WFKcDFM2hFnqjCtiBh7LkvooHCSddOjZ?=
 =?us-ascii?Q?lGuiOLnnE7x10oY9Ybw99z1XRX+KaxgotgcD/BfQ7H9nj4jNSDyN8ve8k8kN?=
 =?us-ascii?Q?YdLV/d8ISPeGq3ewwEQv6f6ib3pPAD2jRTuTxUXaJKD/RFUyw57u3S5WrhVF?=
 =?us-ascii?Q?oHjba0bxQk8gs2f8MFzaXssnelJOyjqqTuJgaVE0wumstj8EgEuZ5EghmrZk?=
 =?us-ascii?Q?o2jtYFkFL9cEf0A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrsaCxNIbMZEIeKKwsRGsXewzbVo4pf/AhkjxIxvX10yVwhTVse8N4Lho0+s?=
 =?us-ascii?Q?zOy2BuZMOSogK60gDaXOZ1KfOKj1qR+nNV7GiNt9/Ur6MZPTkJKMug4DKktp?=
 =?us-ascii?Q?wRP/vbgVn8YGkksWxw4ECDh8e8BegsM0Lu6AABPcQqHfmZSx0OWK4aqnr1Lt?=
 =?us-ascii?Q?b17nwlU1evdxz2IGBiy2VgcbBCdNzWoGyy+0jIQN+wYSqaLlc6yJL82qX4f2?=
 =?us-ascii?Q?Ata4KUJhcs5EAJAbUw40QGe/FhNiP0NIs1mBrAqrkico/2O+i18LWTrGy3rj?=
 =?us-ascii?Q?JiicxqVLAXr+f15tREctFjjVQoPGwkjcAbnJR2uuEwlVOKqUH8mTOiNlmXc7?=
 =?us-ascii?Q?nX4g+1FWVcqj4Dxm7ZLadpElc1eExmOUyiXYSyfz8voVcusA6vx/m1383SOT?=
 =?us-ascii?Q?BcFn28Qc9tdp9glHkwLcLrLwV9++LFCb7JmYAK3bbIlw0vZETwWfFyMbbCNj?=
 =?us-ascii?Q?M73GGnl2lYy82HC+U2AVKc6q4kmy/6bGsEwMueOhL9M8nd7qhGWDDnK0mTx4?=
 =?us-ascii?Q?TgQZobvzWMatH5g686RMHTv35jeMl2HuuSKpeaMEtkBD0s3d4T7Utr51XX7H?=
 =?us-ascii?Q?Tb6zogp6GYXd9KAiXkaTn1dZzKXQdjGRP4GV9+ce0i/Oi25rr9Lgsad9ivTO?=
 =?us-ascii?Q?QKcKKWiukM39dXxUwEqlxz6qyHikLNA9KrIsSMieLFNqCuzac0vQR1g9poMj?=
 =?us-ascii?Q?nPM7yd0Lw41B8rlpcSX1tqwUpdweU/7vEX2TnGfBGsu9bIKB08uhAL4yNbdH?=
 =?us-ascii?Q?qL28gXPm0lajy8Fz6YLuZtkOeL6U5PIx8g4P+OIIuRTeKZ9s4/QCu8TVF5jR?=
 =?us-ascii?Q?spZqM+WF4Lopn8zdyuJ2dKgemx5XKkIZxVtK4x5HCjqOkJ4dJkEQvvfbizLS?=
 =?us-ascii?Q?PoUM8OZbe38jbE0cH/IDfnSxgQ1aDgW1RC7GVtOCkNtjxD9rQG8X7pOw9205?=
 =?us-ascii?Q?403Eoy1oyprP6E2ZjKgTi81UWS+VCFyCZ/FKiF+UGffVkMJLaBompJDCQGsf?=
 =?us-ascii?Q?zEGtCiLqnv+NJEJ7fKg9Ch4daWJJf89Ccrg9j2nBSIJj7IZh5KGKxznNa8zE?=
 =?us-ascii?Q?e2DYRpfZocdYL8/yREIHSJA3hwr2JL2dpe6lX7LgRArKDrBffRKlrE0D6WPm?=
 =?us-ascii?Q?rL0jbWJzf7XMqN69Zncp4+c7Mg3LjLHORm8EPoUJ9at2m8dgT3WtunpII3wc?=
 =?us-ascii?Q?I68ONbglI30lj7Qhys2lV/HXJe31HH2W305mB8xHHpo0K97IlQisSD6CLeav?=
 =?us-ascii?Q?UdFy8cwuzSFRAU9yTV87T/ZyZsaoOSPY70xz4r26qL0Y4tmRNC4VNGE0oa4D?=
 =?us-ascii?Q?L9vJ5Q/FqhCoTmPjgQElPkzTjpMwQ27ZNYV2uePPA19AJqS+DU6b/sxV2Uy1?=
 =?us-ascii?Q?T1y+F2+wYPQYJx3/ZpTo3cFf5gmVlMmQQNIQ7V552HwnK3py/PI54zNqdfRS?=
 =?us-ascii?Q?OmnvtrHzEcZdEnHmyUIYdKIamCYLptmoMCg+ctG6oSYbKU2awZ1P6I40BBj7?=
 =?us-ascii?Q?SSGlst+OuvMV7w/wGA01k+4QvEu8/JN8qr+0Zsx7xHg863l1uoNS3Uttu1jJ?=
 =?us-ascii?Q?DRlILZ0R/mAaoRzMtJy3JT83hGUYjnNMXzC/Mvbt?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399f3bd8-1c4a-42ab-613d-08dd8f0b1756
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:06:35.7057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPfNSDLPRL0ly59Bo2SooP10ParGSwcpTCM6PBfCN70JBjujTWZVIbJBZkHt9+2BwJ0YvC0DtwOluuwRLKssSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9666

Check that the input size does not exceed the buffer size.
If a caller write more characters, count is truncated to the max available
space in "simple_write_to_buffer".
Write a zero termination afterwards.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505091754.285hHbr2-lkp@intel.com/
Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/gpio/gpio-virtuser.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 13407fd4f0eb..eab6726953b4 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -401,10 +401,15 @@ static ssize_t gpio_virtuser_direction_do_write(struct file *file,
 	char buf[32], *trimmed;
 	int ret, dir, val = 0;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
 	if (ret < 0)
 		return ret;
 
+	buf[ret] = '\0';
+
 	trimmed = strim(buf);
 
 	if (strcmp(trimmed, "input") == 0) {
@@ -623,12 +628,15 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 2];
 	int ret;
 
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, GPIO_VIRTUSER_NAME_BUF_LEN, ppos,
 				     user_buf, count);
 	if (ret < 0)
 		return ret;
 
-	buf[strlen(buf) - 1] = '\0';
+	buf[ret] = '\0';
 
 	ret = gpiod_set_consumer_name(data->ad.desc, buf);
 	if (ret)

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.39.5


