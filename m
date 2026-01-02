Return-Path: <linux-gpio+bounces-30044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93116CEE106
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 10:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0166F300441D
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 09:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBFB1E1A3D;
	Fri,  2 Jan 2026 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfXmsvVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZZnk/B0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C767155A5D
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 09:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767346437; cv=none; b=UoEGrfH7obfPMyLlga32GyOkl/dc1vAJLicI463ocOp+upRrxijaXvVsA2YOMPqZ4z9i92JsuaP6QTiNMJ2aJrF1c3qAP+wHEFFm0JQH+JZ0AA40g0Wnbnp3DzCXfxDYG2PyyXZkP62qyVEpsrfjWIOKRZ8dZA/tXqwHZrCs5BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767346437; c=relaxed/simple;
	bh=fiCK5bS+8pXcCHQslXdsDJh7jbZvO92VsO2UuYLxbE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hrHJtFA45w3cORiXbsrFcShHdfV646eBCzEhS8dTOnHxIy6Gwfb4Y1n81Z/QdlgkFc2RAtrdOnKmO+MQi0cJjYiSr8X2EzyJDY5Deen23cfUjY9AuD+j1873zOgqnuE+5dShLv9XxUSOyypprd0ve990+z9zWYTFgGK1xQSLFo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfXmsvVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZZnk/B0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Wj6J428111
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 09:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1+1ZYme88Qh5+kuWFBXMrSEbg36pAUTtGj5
	ZKRUIi1Q=; b=bfXmsvVuTBBdgOlWBFP5WRdQO+Me3RL8AzmaaJ51uzrK2VRbKE5
	C1xJekB7gFtsCgm6BZalqSwZIM/2A7mnBmxt7t/nG2dRNCOVgudVfdRf4wqUqp5A
	afqzEE+j9wMMcwcuXGdj66/kM56OZV8xpviXQqGaXIcrUMqa2cH+bU41GVcKEVHu
	HwhQZ4sm1qlzBmZrnVBbcJVoiU4quJ1WyOJPlnsM33e++8C+zGiAl8gRYArylOTM
	lhCQ1v4NHgByg0UDJ3l6Egk093CN2p9JPjgzBmQ4GFZwcqOKKNmMniUWErJSVnES
	8aP9uGh6uLXZlo0yyUcluSDP8ceyJyOO1fQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrk22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 09:33:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso369062141cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 01:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767346434; x=1767951234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+1ZYme88Qh5+kuWFBXMrSEbg36pAUTtGj5ZKRUIi1Q=;
        b=XZZnk/B00/3HkJzK8MhtcMrz+4XWDaNNLvCT9eTz7sAc+C/v+kqqb68K+XirygKidd
         C7143au5kkWdjgXg23DVjitUJPc4zO/m+fddGrHTF2eRniS46Qn7U76qTyulir/R6Wk/
         uLy3u6EiQauwlgflX/nIUFACk9SsGDJ5+9O2YEKuWyGPS6niuPw3ttqRhdCjw3Zu+vqK
         wXTJV/Hanhpc6qkEcCgPrvKiIiIZ3i2S/Qb4UbXAT462Cw0OyiY52Kl30Vx9cYXxAtY0
         het8GKnQ9MvSq3MBPHhKWjzaZXgJ7PNkxcgkVnG8LkvO2vbKHkq8PFRrFtFnDmnAQ5q0
         hiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767346434; x=1767951234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+1ZYme88Qh5+kuWFBXMrSEbg36pAUTtGj5ZKRUIi1Q=;
        b=gS5zLs7nRg0zUi5HOmKYeB1zP7RNDSMoTnzSISIz617KSqw5Xy7XpJdlF5HuKpD1Xe
         bCBBzYZeK86f5HbVqsl63j2G1JMCipsyHmtR+pgg4Qav0XeA8t5Qn6AnxEWY1JpRxuY/
         bVcDXjleknmS+Qn7g6DMr/7aDk2/JagUZBvnl4/fnhFefVWkilk+EcJwxTao9Q0myAV5
         b3pv928vFLi0v4/1aCEzRPFfTLGopU/Klp6I3S+hCSh7od6PhDcnb9LpQRq0xBJSc4Cp
         PETJySG54qJTl7oxBp0SapvVZLs4ChZOo93e91f32pJ/Eq6RBPcIpEc/VE/5iWm1Kkiv
         /pyw==
X-Gm-Message-State: AOJu0YxiDVIZEiqUtkyTKPiHXFnJR2f8VdICMUEM3S0nezIfWYMBXt68
	dbIJoP7Ljos2ZZkrVLcdtRizpp/zFIgmHZmpO8cKCqgvvIahhZP+zD2SJJjopCIE95kv1veq1dm
	9ygYC9E+m5uNApmCmhp24P8+QkwxWIKroaVDMhllzIc5deshyowWMlpB+EIk947BH
X-Gm-Gg: AY/fxX5teS19tv5rmbpKSxK/ie2CUj+qOuMxdgZp6qgPjPrp4QiK1eoWDKmAojGTjUj
	R/tjFG4bNdAGdz/h5cz9OOsti3rZZNVxKSfm9uiqsh5PLfQbLOcEHqVuIr/9LGkPlwGDJ14u3ZU
	i3iWRPj2EIpWY+qXm1dz7dZStMKZWA+AC4GYtt7ckGZvMGud/jhFp04XYE23Wt4n5yAmDC+KuqE
	aAKItH1DgGrlGKEtmQRAHWjpecy4GFTDJPBf4XwsPRft6QVjOyQ95IK9uPfTIGeiquMllI49gtf
	4KpWelcmxYkAYnv2i7nGuKe21152y01W+gXSZ7TrNEzw/EbCyXa5N2gUbBgEXaLO3R8C48OGLV2
	lUbY4BJNrp/6kCYg321Xh4se4+pI/TiOJCJxQU1Q=
X-Received: by 2002:ac8:5cd1:0:b0:4ed:dec2:301a with SMTP id d75a77b69052e-4f4abcb5a58mr594499931cf.16.1767346433709;
        Fri, 02 Jan 2026 01:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8gmpukTGFDUrZvPMu40VTw4zpnobGSL8YBtgkytPUkJsC32+cnqR2Zdidr1nMi3jrZgQ64Q==
X-Received: by 2002:ac8:5cd1:0:b0:4ed:dec2:301a with SMTP id d75a77b69052e-4f4abcb5a58mr594499731cf.16.1767346433309;
        Fri, 02 Jan 2026 01:33:53 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8630:1161:9594:98e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327778e27bsm50499501f8f.12.2026.01.02.01.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:33:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: swnode: restore the name of the undefined software node
Date: Fri,  2 Jan 2026 10:33:49 +0100
Message-ID: <20260102093349.17822-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=69579102 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=wjs9mTywCXLqsFDRuM4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: T6pvz1WY4u98raaSIX_Orj8d8w01GohH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NSBTYWx0ZWRfX2IMhm6rlsIP/
 kWs5VGAxVh/qYfHFA3untvvR8hgFaUxzP196GLl59VHcCphdrZKQjMjIesXRYPDO2kTUQTr1WIr
 BWBHrbPvAN3BrxKhVfK9LR3JKI+uZ6BYYMjr6qSYH0Eq1wKMx2mA5Fpe2Bbf1OJIZeTafwJQ8Gq
 v/kcXDljDJ/KWSzi8ycKTWPi5zrhddpH7cZv++/+hH/c8N3exTaATSk6f+SAmOG5pGmtMeVDJyq
 6NBWk+JOUiQtCaYsJv1K6wcdocr0F+Q8Qa9QUKNi36kdhKxp1IaQu+VFmE8os0iexFfdQCSFZ9m
 8Cgww4SER3d2Jdfrk0hs8w4hUlmj8sJ1HpgMb+gQKX1pzDw8DK66pqvhPcseAfFLpblHIr8mwf8
 lJwBdHWD519TfjewGEeR0oxsL7p+EOH8qExCUNunuY+6rwif8NL/5lboSR6ATwuFPCoPyRk+L+c
 zMTpxzPwu3/ooJ0R4iw==
X-Proofpoint-GUID: T6pvz1WY4u98raaSIX_Orj8d8w01GohH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020085

Commit 6774a66d0e10 ("gpio: swnode: compare the "undefined" swnode by
its address, not name") switched to comparing the software nodes by
address instead of names but it's still useful to keep the name of the
node to expose the relevant information over sysfs. Restore the
human-readable name.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/all/aVFsjSIwrBw7tFLU@smile.fi.intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 54bad9e88fe5..21478b45c127 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -138,7 +138,9 @@ int swnode_gpio_count(const struct fwnode_handle *fwnode, const char *con_id)
  * A special node that identifies undefined GPIOs, this is primarily used as
  * a key for internal chip selects in SPI bindings.
  */
-const struct software_node swnode_gpio_undefined = { };
+const struct software_node swnode_gpio_undefined = {
+	.name = "swnode-gpio-undefined",
+};
 EXPORT_SYMBOL_NS_GPL(swnode_gpio_undefined, "GPIO_SWNODE");
 
 static int __init swnode_gpio_init(void)
-- 
2.47.3


