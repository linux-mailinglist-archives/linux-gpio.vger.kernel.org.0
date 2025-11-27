Return-Path: <linux-gpio+bounces-29155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56684C8E529
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 13:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 828A6352B7D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7EC332EB7;
	Thu, 27 Nov 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA52DHpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1K0Mu2w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025F1E5B64
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247613; cv=none; b=Z9gJ1k7GEfTQSchWARtJHM8C2tqkbv7pyHpy5WXN3ssOYtZN7cq0ULjmWJCgKTUtUlZfAkAS3Y/NYs/c4WQGw+zg8lvKbto3Ld5UaQK5uHcX8KYj+XX15onm/q3FTibRYQNgYAee2gKZsFXi2UlH3O9NIJY6KZL3d5xzzyPSHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247613; c=relaxed/simple;
	bh=QTar8G3HPjr2G/dTy3IURU1yuHkDZrUw3M3E2StJypg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVOxxzHmSz3SpoH8CX5c3DCgkHRJeOcNkb8vSUVZpVx4otFr0ZAFtXtDsW3LsBfxLrqE0OrA/ry0xvJmRj9PKWykZ2MgA/oUCOXAwL3BT7e2FYpS/J/U6KcyyxOGMrUFRWslRmDJbTR3+5VZHsMmAojF3IysTVxvZQr+O2K1vtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA52DHpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1K0Mu2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR94MxK1668535
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 12:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwQfg0u/Zb1rZTRNN59FLrJZY791yGuBi1A4dc+9XkU=; b=PA52DHpTq6Swn/bW
	ZxZAquFVg1xxkLm4WrT8Yi7PKurQDBTCh71n/D9euShNGaWtFWD9K0FE7Gf9+yj/
	f55RpgkWkwcYmQgLXi/AST3xAdqivQZn2TNFje1UDdgYMEj6Vq9ybmtCFzIUuHKF
	DxAN42/7bwUh8FS7DXdwH7CmzieNWMWL4Y8/1sL3UM+t/6m0y+gI/zsP1JFOAOnv
	jTp2Im7XSvzX4JFvL9x2vCIhnwWL4jV5WuBq/ZRkTiqRZ5EEilQEFdbZdz3Uyc01
	PxYiNKcXGTRTQ19+81/SxVza3O1CXwgqji5ymrYBLYJ9Dl0+Eklp7qFJn/FJ0Rzv
	l6tCww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmutkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 12:46:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9d73d57328so986632a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764247610; x=1764852410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwQfg0u/Zb1rZTRNN59FLrJZY791yGuBi1A4dc+9XkU=;
        b=Z1K0Mu2wzLxtiA+mC6juE3ZTDRSjimMwZeUa7sKK8ustNTUg6+lmVkKjXaiav1tlZq
         pIOdM/UivJ4FE9uLIO0kWnZSCapz+W1v1cdg+SS9dnGtMmGH1WqpcfonP/sphq4Ee84q
         yybhHCZQnjft3grrYpw42bb3kzIEycgPtVg9SXx5kD1I/FyYWfN5CUNrhbaqvkySdq98
         0xclgqKbhfNM0Ip2OdB2V7wFdUHBznVpY+tSZbQkxNWhJLbHXHSgPi74XDcBiqDyzLAo
         275aTtDIfm1SXIRS+73SUS43Mjj1DoE6UivqhpsqMxNU4gNxDinB2q2s2eLmrk3WsWkp
         1Qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247610; x=1764852410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwQfg0u/Zb1rZTRNN59FLrJZY791yGuBi1A4dc+9XkU=;
        b=X+jw+teflAQQFi+F6CzAH8b8FrVCxEEbY/zXv6L6j0YsWTxIREths6d1a7m/FN7sZG
         jG+YdLoXTZSZJbuAMlzR6Ef2yGWdhhYWCiNk/G76iT9/mkzXla85LROZjM1aKpTVchYj
         ZLREItJPW/eufnM3r/YZvuLMrBlkMxz6/LdzNRipJxJrGcYxzVyWKg5RJ7AKRQEy2rWd
         xGUj8k4Jjtn+yWxV3so3UsfTjo+cRJg992DyZJCes8mIAw3zCKZqOQuJDRluhEd4+wdJ
         03GQlN3KzyuAPXg0efXfYrRU0O2dCIQOF/4S9gnL69unkjnxbhkeDsBQnoaDgbkcnzx+
         kTMw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+wAboYsP6sOTFMjUyChd6cOh2HIar22m8exgryRozOIJ+VRXsn9s/Bhh+7feXNJYayah0G9lzWXB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzh0ch4HKIxr3tLlADCqy/71iP8PgRujXOCnNMSyARJimluBDw
	YzOJrLij0jFSFBzEVvdL6g6SHhUt9UCuuCS3wSkJU54v1Qk7cAF1kG6iSbMXdceRSWZeKTZcawr
	bCbCYMIym1bqDBXmjcZH81F19YAz6Rgg0FRv/wow7tM+MXWpIHpmFj09Zu+IQ1/uN
X-Gm-Gg: ASbGncvIbExCnZKcNZqLUUHhby3dszRxHze4p8KbaRDWOPTSpUW2iRa02j4KSWkNI+t
	STPbg8EWn+YbJ95IoYP3kSM+Yt0omFPXlXr2Eqcz/JXJCWznNAzsN/Jbtap87rgbZ6uka/c4/d5
	M1yq43KeyWMx0psbKLVq4n0dtjn2dQn6MoNfHw7HF8Py/iXdyN/QJIBtGnMApMuD8URq4bYbTCa
	zBrkGW1r2RayXuLmE5vZrhA3OH70DIAUkKwm0eKZx4tpsnpwyu6KjP5fBMbSy1pucxV18zU98Qx
	ocVuQgjTk9GOCxa3drkf+qLJgBj6t+dsfQr1j0qVCLBOver1CYDUshB71FTHH1OR57R9DXtFXrW
	8g6CGqCoxr8K2rKCfLsDglgzlpFT9rQklsaW2istGml5e
X-Received: by 2002:a05:6a20:7486:b0:34f:4309:ed32 with SMTP id adf61e73a8af0-3637db477c4mr11987539637.23.1764247607679;
        Thu, 27 Nov 2025 04:46:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq23Kd5+AoAouqonlt6W/WvAXwPbVEKY4p/WcYtWpXd/vjdhtrnVvt+JBi/XDEj5pPyFShxQ==
X-Received: by 2002:a05:6a20:7486:b0:34f:4309:ed32 with SMTP id adf61e73a8af0-3637db477c4mr11987271637.23.1764247606308;
        Thu, 27 Nov 2025 04:46:46 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b66c67sm1951332b3a.13.2025.11.27.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 04:46:45 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 18:15:43 +0530
Subject: [PATCH v6 2/2] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-wakeirq_support-v6-2-60f581f94205@oss.qualcomm.com>
References: <20251127-wakeirq_support-v6-0-60f581f94205@oss.qualcomm.com>
In-Reply-To: <20251127-wakeirq_support-v6-0-60f581f94205@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764247587; l=6954;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QTar8G3HPjr2G/dTy3IURU1yuHkDZrUw3M3E2StJypg=;
 b=w5MlLSN1DG4j/i2NshPA5/Q6fEhjH2QktTkwS8fSDvBAeUV0M/i/iFtg7/ypUGeawDM9PsVub
 F544A/LclZFCYeh5P5ZdLBdVQ2DBnOyrev1SCIKa7YuxI5P11oFRPXc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=6928483a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=KKAkSRfTAAAA:8 a=MM5MBmnPbV1rJZqCYTkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA5NCBTYWx0ZWRfX6sdZ78cXuAiH
 79GUFkH4ci+Y4i6R82eAh6Tfpvcsm7Q5fvc6+1axeszmNUUH/NmBKhKSHyR/gRMWHyZXlWaAmvL
 1FnI8JHmCKKP1TeT5rJSM3BoXKIt1xE5BN2O+14P10ZgsjMTc+lQ7saEcU2cg2ceQ420Ou1vaI+
 87dXoN8RaLI+WSRvyzUuLwNCV0VCLgbILnLJSHTBT0ozxBexoLwl4trYBeWItpShAG4Jy8a4uTI
 gevZH6CEV87NF2B9ZCLTGSYaoWO6orLuwNQMMBoB0Julsjnc+Dnq453Vr48Nrcm2NWbKXEa6Xm5
 Mk88EoomL/JOcF7muFx4LhCbwWEJzO8FFJXT96IvXK6tHBt2wFl7DI3UJ7crgfBe1rme21D34Xm
 MXWN+NOZQz8+72/v74Scg1bgtOOmVA==
X-Proofpoint-GUID: 64Lah150maW3xko8Bw5LmzY0-K6LVQk1
X-Proofpoint-ORIG-GUID: 64Lah150maW3xko8Bw5LmzY0-K6LVQk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270094

According to the PCIe specification 6, sec 5.3.3.2, there are two defined
wakeup mechanisms: Beacon and WAKE# for the Link wakeup mechanisms to
provide a means of signaling the platform to re-establish power and
reference clocks to the components within its domain. Beacon is a hardware
mechanism invisible to software (PCIe r7.0, sec 4.2.7.8.1). Adding WAKE#
support in PCI framework.

According to the PCIe specification, multiple WAKE# signals can exist in
a system. In configurations involving a PCIe switch, each downstream port
(DSP) of the switch may be connected to a separate WAKE# line, allowing
each endpoint to signal WAKE# independently. From figure 5.4, WAKE# can
also be terminated at the switch itself. To support this, the WAKE#
should be described in the device tree node of the endpint/bridge. If all
endpoints share a single WAKE# line, then WAKE# should be defined in the
each node.

To support legacy devicetree in direct attach case, driver will search
in root port node for WAKE# if the driver doesn't find in the endpoint
node.

In pci_device_add(), PCI framework will search for the WAKE# in its node,
If not found, it searches in its upstream port only if upstream port is
root port to support legacy bindings. Once found, register for the wake IRQ
in shared mode, as the WAKE# may be shared among multiple endpoints.

When the IRQ is asserted, the handle_threaded_wake_irq() handler triggers
a pm_runtime_resume(). The PM framework ensures that the parent device is
resumed before the child i.e controller driver which can bring back device
state to D0.

WAKE# is added in dts schema and merged based on below links.

Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
Link: https://github.com/devicetree-org/dt-schema/pull/170
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c     | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h    |  6 ++++++
 drivers/pci/probe.c  |  2 ++
 drivers/pci/remove.c |  1 +
 include/linux/pci.h  |  2 ++
 5 files changed, 69 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f119845637e163d9051437c89662762f8..fc33405a7b1f001e171277434663cc9dfe57c69b 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -15,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include "pci.h"
 
 #ifdef CONFIG_PCI
@@ -586,6 +588,62 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	return irq_create_of_mapping(&oirq);
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
+
+static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
+{
+	int ret, wake_irq;
+
+	if (!wake)
+		return;
+
+	wake_irq = gpiod_to_irq(wake);
+	if (wake_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get wake irq: %d\n", wake_irq);
+		return;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+
+	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
+						   IRQ_TYPE_EDGE_FALLING);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
+		device_init_wakeup(&pdev->dev, false);
+	}
+}
+
+void pci_configure_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+	struct gpio_desc *gpio;
+	struct pci_dev *root;
+
+	if (!dn)
+		return;
+
+	gpio = fwnode_gpiod_get_index(of_fwnode_handle(dn),
+				      "wake", 0, GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
+	if (IS_ERR(gpio)) {
+		/*
+		 * To support legacy devicetree, search in root port for WAKE#
+		 * in direct attach case.
+		 */
+		root = pci_upstream_bridge(dev);
+		if (pci_is_root_bus(root->bus))
+			pci_configure_wake_irq(dev, root->wake);
+	} else {
+		dev->wake = gpio;
+		pci_configure_wake_irq(dev, gpio);
+	}
+}
+
+void pci_remove_of_wake_gpio(struct pci_dev *dev)
+{
+	dev_pm_clear_wake_irq(&dev->dev);
+	device_init_wakeup(&dev->dev, false);
+	gpiod_put(dev->wake);
+	dev->wake = NULL;
+}
 #endif	/* CONFIG_OF_IRQ */
 
 static int pci_parse_request_of_pci_ranges(struct device *dev,
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4492b809094b5794bd94dfbc20102cb208c3fa2f..05cb240ecdb59f9833ca6dae2357fdbd012195d6 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1056,6 +1056,9 @@ void pci_release_of_node(struct pci_dev *dev);
 void pci_set_bus_of_node(struct pci_bus *bus);
 void pci_release_bus_of_node(struct pci_bus *bus);
 
+void pci_configure_of_wake_gpio(struct pci_dev *dev);
+void pci_remove_of_wake_gpio(struct pci_dev *dev);
+
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
@@ -1101,6 +1104,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
 	return 0;
 }
 
+static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
+static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
+
 static inline bool of_pci_supply_present(struct device_node *np)
 {
 	return false;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 0ce98e18b5a876afe72af35a9f4a44d598e8d500..f9b879c8e3f72a9845f60577335019aa2002dc23 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2762,6 +2762,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	ret = device_add(&dev->dev);
 	WARN_ON(ret < 0);
 
+	pci_configure_of_wake_gpio(dev);
+
 	pci_npem_create(dev);
 
 	pci_doe_sysfs_init(dev);
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index ce5c25adef5518e5aec30c41de37ea66d682f3b0..26e9c1df51c76344a1d7f5cc7edd433780e73474 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -54,6 +54,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	if (pci_dev_test_and_set_removed(dev))
 		return;
 
+	pci_remove_of_wake_gpio(dev);
 	pci_doe_sysfs_teardown(dev);
 	pci_npem_remove(dev);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1fdf81fbe1e427aecbc951fa3fdf65c20450b05..cd7b5eb82a430ead2f64d903a24a5b06a1b7b17e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -555,6 +555,8 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	struct gpio_desc *wake; /* Holds WAKE# gpio */
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */

-- 
2.34.1


