Return-Path: <linux-gpio+bounces-13521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10519E4AD3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 01:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09AE164969
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 00:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925D01ADFE2;
	Thu,  5 Dec 2024 00:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="GgqS/n2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com [17.58.6.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0997D3CF58
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 00:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733357559; cv=none; b=gO20QcVm5SGub9Vb2it2I4ELHxhi1RCj7bS3ZOMdydZGXVvLdwzQCqudkuHoTTYWsCl20PEStL7l7EuRxxAB5Cuguz7RGhxJeA7APQt3GfMdWJoeuGpRUNhphMFRjqCkI0vq/GIQzAcL3i2pCraMQFl32Gn9blJcnSwqX78kBBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733357559; c=relaxed/simple;
	bh=lZD3958sh0kcoLNnjMWvJSETuN/5UPQGX8+v05nTpsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TV7LcjkYaUSc0I+Zs93iVvRzYQybhvribV1auClwr56wjZLs+BCl32knf19SldnvVpTr2XM2gv77IE5Vo1Vj9LRczPKpaBkODmgizNVQsUQWIutQ1mzVQXGDJCQnzRP1j4tJ2NB2h9xBp7K2+7Oz9jl9vIPnxoB4OVm79HhFnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=GgqS/n2x; arc=none smtp.client-ip=17.58.6.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733357555;
	bh=TSRMJFHyLHHgK59l1K7Yb//Q7rsxYXppsW1nGhGtOFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=GgqS/n2xIwUDuP0CAPjN1RdcgnW+b+PUmKV8yyXTOWKJXqbACe9bVR4xz/uS82ygj
	 XWFgJikjZn+LPO0En/V8PKAbrVoDg+9GQY1FVYz9lcmfVoNokEhXoLydVTCUcFIFbe
	 RFbl2PJPvQUMsbrnUia2Rljh89E2xeW9s5iIk/51rbE1RlAKOQH/HmZwv9n4AxrAkL
	 KJrmw0MZzHnt/4PTvQBK+HaBCNy5wuxYB0s195zYdjo6/Co32Ylng1VagwdNHXeGMH
	 6FXLVbroRxEelcTpn79CslSWOtmMNlrGSn6UF4FCE29MPRBgbIHXaLyUb/434sRIwU
	 deHKcibRT7ezA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 39E0C8001AC;
	Thu,  5 Dec 2024 00:12:24 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:17 +0800
Subject: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
In-Reply-To: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: fxXsejLSyTpHofVhzUzWbNH0IQ2DzZcJ
X-Proofpoint-GUID: fxXsejLSyTpHofVhzUzWbNH0IQ2DzZcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=596 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
Remvoe the unnecessary wrapper.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/gpio/gpio-sim.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 370b71513bdb529112e157fa22a5451e02502a17..b1f33cbaaaa78aca324f99c45a868e7e79a9d672 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -413,11 +413,6 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 	return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip);
 }
 
-static int gpio_sim_dev_match_fwnode(struct device *dev, const void *data)
-{
-	return device_match_fwnode(dev, data);
-}
-
 static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 {
 	struct gpio_sim_chip *chip;
@@ -503,7 +498,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (ret)
 		return ret;
 
-	chip->dev = device_find_child(dev, swnode, gpio_sim_dev_match_fwnode);
+	chip->dev = device_find_child(dev, swnode, device_match_fwnode);
 	if (!chip->dev)
 		return -ENODEV;
 

-- 
2.34.1


