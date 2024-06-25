Return-Path: <linux-gpio+bounces-7660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478A915B7D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 03:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 281251C216AE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 01:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3D5C152;
	Tue, 25 Jun 2024 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ND/IM6eM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2027.outbound.protection.outlook.com [40.92.98.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145512B82;
	Tue, 25 Jun 2024 01:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.98.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719277752; cv=fail; b=bfTk3TBeoihshgkjoAAIHHd0v65IZIHv+vXxnPym+XmCMy94THYHrsS4MHfU/0Tl0sWL8/TqHjvrz40ApbWA1i4oQdwFoVvt8XKr5Rahd0sehJeYlqs2YXUkEz+GLux0U61BGh8YfgRtCEjCXPkgo9R3mgJzAxcu++XHDLN8N3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719277752; c=relaxed/simple;
	bh=maLnpZE2GtKErBARnJlBdgmVCx0GsJup0LCs9ABELMI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fOjj+pMzMoAF3pi9ex+dFlFu4o02iIUdJJaLnWwhRcRpQVyhvA+J46NS83ONeiLl6J/pNIwD2jolNHBpxE8n76oD+Rk3WF8/uxFxq5qKMBmJ7rY9o39Abuk+MzTJg3xN4MSUtNuEKzzuy0vrtBouHST6AFQFJxT6Kz+XMwE3O80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ND/IM6eM; arc=fail smtp.client-ip=40.92.98.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QozOgsccpAGfdZH2hPl0l43cya9MUqC8j7vv/9apQcFSpM1AG0ntV3sd1KTnLTJbGpnJ+ioYl0d4qe+CXh3FBeZ0hLsLOUgWtxtpCvP9MUYr3YjZNVgmn9a3USb8/XvlsbszopMGFM8Z1bV7zwlTYm4HPeYTZs0O71JhfBmmtQ7dhKj+QJFLEBobEXe9ZPiHk67GepbSJp80l1loRzck9wrbjg4M9s/Fq4TsrtXcLLayZTeauyqv2rDUdQDTfb05G3C43e7Dchr2m8qGx9GB2K14NPvHvC0DE57iSjFU1oafaKMX6cli7Ou7WrDOiG9I1TL1/Qjv8jOxva9bH5sjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7IuPnaziRBB/1OOLRgPA/LA79xl6gBIVbBjExyGjTs=;
 b=VB0OeqDHzxpE7MTGytSo9bv50YOBkLAA77Oz9C6ydyU6YPKhJMwatff8v5CB61eYInbM4puQ6yc2N65/oefIRmz2LJKPk9V84B/x25kMc8X0sec7NRhYwoj1PU3uzW3K1PgiGwoeV7ePCpcQ6XM2647g9+btp2DxG/qNWtb3NGqB4tr8oA44p7dF1RkLk3jJLbLWIeQrw9UIU6uhfVAwpR1TRfi9whgVaxW8QFzD4z2NmUoDlgUzsiqhE+ki7MfKDKdNyVE32fF+4yVCir3wJUBTQEuS7PiikY4w/csX+wXeNvh7BprJDhR0zRpPYi9PC+HOErJUpAKpxK1N2MHBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7IuPnaziRBB/1OOLRgPA/LA79xl6gBIVbBjExyGjTs=;
 b=ND/IM6eM0/d76J59Gq3iR6V5iZDiIEjCC2rVMec3g3ZkOwmSTBkN7mtAcBxlrQ2BeUraR1D+2zPtCM5IUJXAq6FfUXb+T5/RDA82cRDRZKIPagXdcBhTivOPSB/PvsKdvHs7MYumkUkstl6jnrUbla/laDNuxxmcf3E1i1sNLUt7RBZCjsGHKF1b8/o3PZntSS72UBrecF56GJajOjSiqGiKX+it4ekmNwjaq2vuujJNHMfXn3KudJ1gRtqjl7nW8n2FWYYLgOOcYecHOXVAOX4N6xcsGjXegCW6nMwvNgOzcaotqBufFF2HX+epYwZEVY3A59ldHXLIcZjlpkxpSg==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 TYCP286MB3738.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:389::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Tue, 25 Jun 2024 01:09:06 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 01:09:06 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-gpio@vger.kernel.org
Cc: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] gpio: ath79: convert to dynamic GPIO base allocation
Date: Tue, 25 Jun 2024 09:06:02 +0800
Message-ID:
 <TYCP286MB08958A751BD29BB5B04485D9BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ypDRhzcxkPCNhaC94bq68337hCdOeHDk]
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240625010602.5238-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|TYCP286MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6352c335-2ee9-4d92-9be7-08dc94b367cb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199025|3412199022|440099025|1710799023;
X-Microsoft-Antispam-Message-Info:
	uhMXTCHYdzZEqhg3ta6nIBJTndiUptt2GXWblQPlWz2XJ3tm/a1ukoK3Ca1/2up3Kxk427cN1DgGd7pEmUAMmk6XO4bAaKKCezQZ0FFnRgzb77HNBFqtlD/Z6ODHBYiOB9cu6HedlCPL8ZHAEf1CFZK7d0U8C3T+HDlbHoVLP1yXSU53YaYN7DFwWfJTxZuNd6aQcpfzRfFAVY0i4erG53NGpaQC8zA9lIiPXoQ8/9KXtscu8FQOdsBZZodw8r7pRDq1H9JY+u6LBxVmyg2kNacDlRGa23983KJINrBh3n3BsphWsc0KCcKVpHmbrcVljzI8ihdesPSFndO5+U3IfkBOq1ZcfsJb0enTZrxf1rwMH5l0RATN58NcZwpN/w1zy8+e/cMAF7F3koNUpYCMgtm55ij0XeHZurtfnAX1Pe8S3iljFRDQUKFP/AkGtMUavJEZf7aalGyiU2EbeBPIE+L1KsnjJVK4dSYAL0Q3wkpSQhoaFjJ/EueWhgCd5abR4zObjJ/HAtgWiiUA6lcIbb6YDANPNdlnF3fCfeZYIBdoj0xgVuiTrWYZ98UEEQeMl1WqsChaFAjto6SBoPiBjRmblYqHH9LlbSSd12tBmmjGIg7M6mf29zvexD9m3W6/
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ixMluMpwiFIvXp40ABfASrVQBLLDYhPmbIcV1BfSFWHPsHn3WVxBLmeOE/0?=
 =?us-ascii?Q?2qx7KGgEqN5YOmXaCLPJLY7HHir93USE+xZnEo9SQJCfogj99+RBdnMM+Isx?=
 =?us-ascii?Q?AvkIHqjEoLpvmMiFI/tqmP54hxnh5eaTl5vLnc5jlYFi9YBrrMBTOFApsme1?=
 =?us-ascii?Q?xZR8ro5s85Pg0IqzU/3K9AxroKtJv+bb8Tl6D0sRbiHIwBmcLVFLh2mVNSt1?=
 =?us-ascii?Q?ciC9aoE1UsdKBNfw3TaWZPrfOkY6kJdbMEZ3fCyOTFfycVtfwRQo/CjEJ+6B?=
 =?us-ascii?Q?f/3iKZNoAY5FMYOi36fys7E4gppyWK1I20X0Wco9Hvf0EoW8+fmO4BWpAS+m?=
 =?us-ascii?Q?DMc6RNCjMI89rH528wWFVYx9HJ66i/cnZ+Za/HcFiMr6Es74BIKwviBCzmnM?=
 =?us-ascii?Q?dLVIuxkwhTN9sMMS3F3mdFypmiOUaBhCDl6fwhCOOYYc8jvO733v2bNzr61V?=
 =?us-ascii?Q?lTMnweIYjIDAY6i+HwRBn7QaFdHWJBwD9kMzYoK9oxwgPa59cq7m/aR9gBZc?=
 =?us-ascii?Q?Zj/jUUIjanCw/DkpAIMlSxJHwa5Uwk4GpA5xBA0eRLTygt6WrcgLGnmV+LN6?=
 =?us-ascii?Q?HqPcNvt5GqfwvpXL+aL0GuCnaa8V0NS/6BynRGxRpLZJbAdxlNyZ1U15y06y?=
 =?us-ascii?Q?8BtcCu/DILOZQrFjR9x1JN6d9kVtdkmLQ5NDUMglxzkz5SrUutmOExl7Xqie?=
 =?us-ascii?Q?Mr3tylOv3UA6fnkCFQJTJl72TG7QPsA92aNak7AmgA2rwqXMEwiOnrgrdyLt?=
 =?us-ascii?Q?JpvVZWVVjDfwPwoUvGDk+1ulpnxYQzvlRzYbezVQFx4xoGN/Sn5yJdmhAPMa?=
 =?us-ascii?Q?J1uWgOykKuWqWIY9xosmJknXE1nIHIsYARcHjCLk5j01NqoUcQvEGvmKgO/z?=
 =?us-ascii?Q?WjaSPZKlQG0jtmHOZDjYYdphbpzVcBBGds6YYEXxad4WfvHvuFUa69e+nq17?=
 =?us-ascii?Q?ZiKILyLrG9tW9FSMFckJcQtqllm6HREh7cYUitz6D/exij9qTJUqwYBGUap7?=
 =?us-ascii?Q?y70Dnp4wDM/iZ8sTwm4bDaLToJHHWcfab8N0FAHfgS1ukdU0nRzOMEhHwxCc?=
 =?us-ascii?Q?XQbHRtshKBeJUtXnnY6nRaPmnoQ62hoPb0Zj3U2JMknebhq/W5eNO5hw3Q24?=
 =?us-ascii?Q?9IKZch5XqV9NF/1n79+J2om+x09bYxJ5z6cP/vD1n6uALgP8Jr1SQ8IHA7Ib?=
 =?us-ascii?Q?OQW36AStSqTh1oNQ5NxMn1iZfx42OOVALLwIAjsxf/a9KdWlzHLYczyjoFBT?=
 =?us-ascii?Q?hhzAjWuULgldOU9V+M+L?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6352c335-2ee9-4d92-9be7-08dc94b367cb
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 01:09:06.5661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3738

ath79 target has already been converted to device tree based
platform. Using dynamic GPIO numberspace base to suppress the
warning:

gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.

Tested on Atheros AR7241 and AR9344.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/gpio/gpio-ath79.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index f0c0c0f77eb0..d986424a661e 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -273,8 +273,8 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		dev_err(dev, "bgpio_init failed\n");
 		return err;
 	}
-	/* Use base 0 to stay compatible with legacy platforms */
-	ctrl->gc.base = 0;
+	/* Dynamic allocation */
+	ctrl->gc.base = -1;
 
 	/* Optional interrupt setup */
 	if (!np || of_property_read_bool(np, "interrupt-controller")) {
-- 
2.45.1


