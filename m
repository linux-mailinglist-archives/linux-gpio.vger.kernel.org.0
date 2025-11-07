Return-Path: <linux-gpio+bounces-28240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E286CC3F22D
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 10:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F68188E2D9
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1367301715;
	Fri,  7 Nov 2025 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5MF65h6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjcF5crb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270730146F
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762507375; cv=none; b=FyNjqxlR7e8ezX82oOZ8d1WQ4CkvMCBb+v7BUBqPRzoCvEacTE0egG8JqY4ZiffT0KXs/Vdib22T8+yNGVSbpvQ1u2ipeW/7x5Rt5tS1GebTbFiHxbf599ELI/wio+Uyxxf5ONRiMYCnoCAip7slOHwKZfFUZQX0DiEi92JxIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762507375; c=relaxed/simple;
	bh=AfG3lJ1a5hNGKyDgIfdsIBRICXvgFKkGaJ53wdtq1hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmTcvIK/fc/r6JjZymeT6t4AT8UFizCQEXLGISt4flEo3+qP2osLiqUJAU/0FNQcxUJ+zoqBoVwbrmIOmUpCE3kFGHxtk48jKWnOoqomPAyCppurrawsuqfZXqjJHSI8ccrn37nc/rNB351Yj22NvLHwkZoRqmhUs6rPLK58aNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5MF65h6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjcF5crb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A757Y3A2273323
	for <linux-gpio@vger.kernel.org>; Fri, 7 Nov 2025 09:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLJsy3WvFZYkUBjufCXqRUzN3m5dO5ORa8NBlBGz10k=; b=I5MF65h6Hx7/6pdL
	r53c98N8tIqGb03Egt8O7cY4mMQ1GFc3rGL+xJe9u0u1KwwtgX49lt+e8v+djfzg
	HAbZt5DI8uOamvIKGTaKETJ7jRUgcJKIqGm7G0n7DOCDrgT9vQ99jIg1zQjwqY2e
	YoF8rMUaiJW3Fpoe2TfRB57REgTIp4u43BWDPy5dlXr9F9KoqGjl/j3vgjlyXeMB
	1VtNmZhxdWjkpzfTRhFnffBCNsGPKri/3CEnn9uT2nOe+1yGc0CmpO0ih5Ni+CPN
	N4u7Rw56+iO3fyisOb5v1f3+ByDWcocUxxzElQsEz/hTX2P5Hfmh/H1ukRsiNkc5
	HBzKXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9abmrpp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 09:22:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958a134514so7328015ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 01:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762507371; x=1763112171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLJsy3WvFZYkUBjufCXqRUzN3m5dO5ORa8NBlBGz10k=;
        b=UjcF5crb+mUgC4tM87oK1uIJsyjnSapbypY60Gbgs+ssRq/fukgiSN4+ZrXeiJvMdk
         1X0Oep0cK/qhZYtRnTBQXgOkqwL/8jzB7Sl7+1MOL64f7pBnI36nHDHWXDHGEhPSrZy0
         AoBVdmL8l1O7LCens+ZzoK0hn6k1DCKVUwqGndW5OClj2U8L/NZpjpcoZ8z4FyU7DEkx
         wrO4zvTz7lr3f+z0Gdz04pj33z8+4UMlPtRlySbtkUYO1y0L39UVja0dPPPHgFzueGMc
         2xTifQnDuB7bGll/axpzZE8fz5ixQkaeM4rHWwn7xiZeg3D2uXOumW0W7LGj/9BdmURI
         aQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762507371; x=1763112171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sLJsy3WvFZYkUBjufCXqRUzN3m5dO5ORa8NBlBGz10k=;
        b=Un/Ynh3QZjhNrsr4/Kj1Rk40APDq8ykn6uPwr8I4EgQhZ/ePxFHscwF3W0Q3yqZ7G/
         I5CVG+eqfF12YR7/SWWiFCp+gXWtFC51k6z3xOyS3Byrilp5P6e0ygdkR1fViN0A0DED
         eZaczTBAsFe0NbhyaGhlQauvCoMYJe29RrZjZStcCZRh5FL1CKVOhDuszJsL9faAyY87
         GorntTQYK+rCrAvJHeVrsarEThXjWM1WmPVJwrP7r8Zs4GnkiIGTB2CWi8PwsgNhU6H1
         gqNs4J9G6zJITUjSiTo7Ei8E2SOYdgxgda7Zt6I/VBdbpp+xlRYS4KckQW1dx1p89qj+
         tqbw==
X-Forwarded-Encrypted: i=1; AJvYcCVIBVBC+fMwbQ1xrrXkbBiQUB2fJUeR6vx0aGA91j/F2ylxrDM4JCfMzx6VH63N3Rsw2xXAO3wpMe2u@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKgDhbiq240YF6HbMNtvxQLeKGqiu8XyD8cC8o0qscwR6ZKg5
	G6k8QGVx42XXTg7ykx2v/Lu6QltY3N+vzWqd2TKizXdTqE/w/ULYlIDuO8FgGlUIc0AjbdS7fCc
	fV11o6FjWTI6Zpr31gZNP1Tu1L33klFx0VRcn38XWloDzoGammzxTXtupOlw6taPq
X-Gm-Gg: ASbGncs+kRcZAO6hnmGr4tyoplwkmppqNfFlO/cRAMDd/QMb+xDIZL3SNiGIMgLzr5A
	FSA2w/s0bQ3uZqktU+IsAcuazFFci9tNMYOtlb/UqByphCzZZRCQ8/K7Xr/Ec0QUjPoTgHxCiL0
	r11UbFm3djKdFgwtUkW1quZxf/2LnLVp5zm8i7i1F1XrV0FeC5kbFVvvJAxz/R1oTgVQ7ftUnPx
	wTn6HZhi/28uZYbbd8+XPA5iMp0Jm/pSxodSFXS0hivcwlyOzESMaaBjkvItFKb1YeZr5N96GvM
	C5BCkLQ6paa/+YqzyEZRB/34rnhjvFMRO1JMfJ8iF3rkxrOkP72QXlcVlbS6StKiAXKo7lDbpeI
	PIv2oqFuhOXIVswuTwmx4W+DyRrtRjNHqjQ==
X-Received: by 2002:a17:902:ef4f:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-297c04931c8mr36563395ad.51.1762507371273;
        Fri, 07 Nov 2025 01:22:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMe6AD46/Xj2263gzD2MJFwlcQyguuVhHEaHMXA50lheLfNKjfc+2oXMMZBgYpq4HksjgHCw==
X-Received: by 2002:a17:902:ef4f:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-297c04931c8mr36562995ad.51.1762507370622;
        Fri, 07 Nov 2025 01:22:50 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c747d1sm53241585ad.63.2025.11.07.01.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 01:22:50 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 14:52:25 +0530
Subject: [PATCH v5 2/2] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-wakeirq_support-v5-2-464e17f2c20c@oss.qualcomm.com>
References: <20251107-wakeirq_support-v5-0-464e17f2c20c@oss.qualcomm.com>
In-Reply-To: <20251107-wakeirq_support-v5-0-464e17f2c20c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762507357; l=6911;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=AfG3lJ1a5hNGKyDgIfdsIBRICXvgFKkGaJ53wdtq1hE=;
 b=pddwcwNnDKqApGs1ZIZVivekSW0sLGEIqffvu23gulqbmwqjyq+Q3B3yXd8RTrc4sp4rbglzY
 LYS1Yr9H0xAAbl0kxCGMbAjwYC1U1AS2S3NGpd8S8BFSoK51Yc/DJm/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: JvJFvd1B0Vqky5VXVn6YoMSBJy788yl4
X-Proofpoint-ORIG-GUID: JvJFvd1B0Vqky5VXVn6YoMSBJy788yl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3NSBTYWx0ZWRfX1asuxGQkRHa/
 jXqsxe1QEwY9rf8oL4aVgX1ZiXx+0S2h5aQDDssqKDq74YMuAsu9v7HEnk3qMteONTfbXfJ2aog
 iZ6cbdF88VgP8c1C7IrHLnHIN4GhJG3+PLG90EKKx2xOXgbwBsHAjwyUVeSSDJFjzaYxuz6HDcS
 vAEqsDEXOl9o2I+1F0ooxYvH/vSyVj8lkfh22FSBOrBEGwibhiRIag5yzURT3Ske7geUQwoAbrr
 ao13NHRgFmI/YRnEliSmCDoKf6pkrySuJCZKjE67YywjYd9Sr/lmbJva+F38BHALHr4OUb4Za0N
 7kcwwffpw4yLvbJktiVDCGa7nRKy/V9vwuTczzZ4y9j8bhBiAwsOpyeQJbxYoyMiP049WqHNvhC
 zTw8/D4D1cD8hishB9qkqks/D5bGWQ==
X-Authority-Analysis: v=2.4 cv=HPjO14tv c=1 sm=1 tr=0 ts=690dba6c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=MM5MBmnPbV1rJZqCYTkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070075

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
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c     | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h    |  6 ++++++
 drivers/pci/probe.c  |  2 ++
 drivers/pci/remove.c |  1 +
 include/linux/pci.h  |  2 ++
 5 files changed, 69 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f119845637e163d9051437c89662762f8..8cb103d18687e16d7283510544fa640abee68d29 100644
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
+	ret = dev_pm_set_dedicated_wake_irq_flags(&pdev->dev, wake_irq,
+						  IRQF_SHARED | IRQ_TYPE_EDGE_FALLING);
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


