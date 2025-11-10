Return-Path: <linux-gpio+bounces-28293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD7C45DD9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F6644EE8D3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D3F3054C4;
	Mon, 10 Nov 2025 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxSTfN0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKjVluCj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2B304BD7
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769495; cv=none; b=Z9pAhLitxNx0Mxz5CzDK2BbawQ7pFnbMfCkKi+8VBiG85K+E4LuiH0VGHF61/nPcGcggLiAqawVerGYePeLH350cqMA5pXM2OX8uffPhd0sBKGd5R79D2ethpWShf5sHueOGxcTdIEl1Y764ikFAmdRDiL1Ek1kVzHuRlHQhynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769495; c=relaxed/simple;
	bh=avdbOjtYjjspykRVsUUtWg6cfuZvT5U9ZXhkpqVgrZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WQxJHfEmHKBKVpwYx9AksS2+WvxbZSgC6SY0XHQl0ZSSXN2NZxuukAG903ZDfc5gNgPYMY/hpu/mvIrSNJSUk6HgJ0ZIH2kQCw3PGqrthYRD84cE4mEbVHKmnadmX39QqrS9K6KS05Ndqihp3qIOi5EBalB9dToy1QphtQPd50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxSTfN0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKjVluCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9EjOw2992484
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=umoTsayoxjI
	q9HPAHkGXJKeGVR9hgzkk10/RihXOsJg=; b=KxSTfN0fzgF8PGnoO3vr1Pc029x
	/WZo19sS582o3pG6hKQNPO2ocqdYtbJVKWn6J6XIPPboSazgYkAownOjkwbFpywE
	tZq3RZcW1/WTvbUlriAtmyx2ieRVkIhy4h29s7t/q4JXSQung7wqZoMKP8GasTEQ
	2+JeWprP7ecy0/rzni3H0YPSn8QA/LcwHLF8oP+6MArtd9fk6YWakTS5Z3eyh03E
	R4ZCoG1rhmLxp97AjQ31/HGeSpavfpe5oh+Ad1zg5ukU5Nfa8gRxVMN22TJmxP9U
	lzAZw606PUygaSWRGzPsoLB2jYp/OMyb6IxdbQYYkt7U/V3ixbqWg9dQKFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88r5vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f48e81b8so27042715ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 02:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762769492; x=1763374292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umoTsayoxjIq9HPAHkGXJKeGVR9hgzkk10/RihXOsJg=;
        b=KKjVluCjTGPRMMzZDqhS8iEc3uB7ZCYYrsosK9GrOIZ6v3EJ5GcQT/u7dstFkQtAPB
         3m9wHjr8RhD0EOeaZhViayDu0w8qKd/jY50xA/9KW9nRjr/NSIeqXcerKVoYTl9UZ2pI
         L5WOnEePLDoiiIln5wh+eTdVG3bzsy+EozxJh3nKXRQRbeOAvuGKxcUiSA5LUT1ZJTvv
         WolD+vWQ3sLGCQaw2xz1i50SJ6XlUssXJBuYy09gzgCpRyHGzFaqHPSE+250qiP0XZfK
         RX5uQRHnvxsxFDGmZn2fDWLIEZgUWRh3dsQbQpXJsC2dM2r3uyiuKKapEEPa2/M6ST1M
         c0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769492; x=1763374292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umoTsayoxjIq9HPAHkGXJKeGVR9hgzkk10/RihXOsJg=;
        b=SL+xhWJBlYp2r/ZVqK1/Gkc6L1/7lTn/KNrnqgIxeqV6lHzluHONn6yLXyYOEzQPNt
         /BBrhxuf3Avryek4Zw7lPofnAolqYK3wiUJ9E/h1yG5/hAwxU0R+THmjBISwljVxNJKu
         Jj+HqvRexoterwKIV1dc9gw6Qcq5PJgK8R+7GfpUz7KOv2NmDL3n3AINf6OSDfI41NfE
         Ray6AI5Eql465pXq6zVujWEN8rsH06BCHmCUnP3c94kBsyXuhXNu2knC6gdSnHbPa18h
         jzMME2mf8pBEmuIdxB4iKRoMNxsPJXY7xCJG6ntMlB6ESuI3aLLtcDDxC7v42c39/uH4
         YhuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9oYOgnLIYUjauFsVCwW60+H8yZf9q4mbFHl/fY4jcrHbBU7g0vJUa6cGtJ0v+7U7pAvBnvnJqCnE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi8t99ZW/U3jG6KeF/fZvCdGLGUXo9jhrbM2UY3f5VglRIgWyA
	/vU9Go5xmDSgMa/RqacFaJrJ5uowIHLLGwbfY5hxhKhJkiyqQki/lXv3wEvcD0NasD5DzMTGA8+
	a+fnNj13gbKPxuS6JlbZIvrUWn1PXR62xOGQ0nk6Ofs+22bdq4J3ZLeF4jdYBFr56
X-Gm-Gg: ASbGncthuB6av7r/FgYxIWlaj+SHmwVs/XulWWUlNdrVPe/TrBjP3kAqSZmBsqgLlv+
	MVB8LUXfHz/+8HUgqYhW8AqIWbB7677dGM3c3i8cWgay/nvhKoclHysdtPSBvqFltUEBII/IRII
	SXMRpm3uNXDVCOm54tDtj9WIaABsIKl6NhaGhOyG1RLLg+9w4qU+Dj99fRfVPYikUT7jEcqUwA9
	S2O0UbV7e1glV5YrQyLZNiUUebzrOqJkDVz2CrGd7RA0FUToh0Zvgxv0WiNRxOxmt4D/+xaaSQM
	2+0PsYNT+FEcwI14pqqOnOst62lo8CyhfNtjeK4vImr1LCZUW8xRLAf1T/frpSQ2lR8fENOSRHo
	vcTWjYIZr0M4hN7YspL5y6og/GB2Cpv+s
X-Received: by 2002:a17:903:3b87:b0:269:b2e5:900d with SMTP id d9443c01a7336-297e1d76b3dmr106985945ad.5.1762769491450;
        Mon, 10 Nov 2025 02:11:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2TlZXzJFWNIFeewfecm9mawvVMBytIPCTGJJY339S/Up8oJUKFBzVY76H05fluq3Yktm82A==
X-Received: by 2002:a17:903:3b87:b0:269:b2e5:900d with SMTP id d9443c01a7336-297e1d76b3dmr106985185ad.5.1762769490714;
        Mon, 10 Nov 2025 02:11:30 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm60180395ad.55.2025.11.10.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:11:30 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 4/4] serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
Date: Mon, 10 Nov 2025 15:40:43 +0530
Message-Id: <20251110101043.2108414-5-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0hDymfmC1dC5jUL71emmdptYasb_GExe
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6911ba54 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jrFwUxAOa3TL-QiBvmcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4OSBTYWx0ZWRfX/JNTenoAXkU5
 8C18pDGPtYpT1e5x8VWDid8FYrTO8RkBetpeqb8yDjATVhlpQ3K7d8vpxJQvDqrr+ULYJXvnXFg
 Qc/NjcIqPsv8WVuXurSbK4zUTvAKrigazsX9ePk7OmaIj+nCvWZ51I0sS4AFJMZ5VQgD8SmBFcO
 xnyDKUxhnsCIT1Nz5Ss4TCzD3QKgJp1iiAlUE/qxsByTxPxOf5xkZV4qr6FTiONlDYVHv6IBZ6M
 OS1Syik9oZyKQKvaXoUDh32KIGnc6TLuOIxiwNxF+xnWGSXfVfnT99ZD0+RsN0/2n1YK9f0+UIk
 A2UR/4j6nODGo8noYmJFwnfJxmAKqFJMtc6Rha816csMcdKKQ2TXQxg4BTcmEU63y+1DZp0Kz/F
 ymDIPgJlzhZUVzLBGxBiE5k0a0g1Dg==
X-Proofpoint-ORIG-GUID: 0hDymfmC1dC5jUL71emmdptYasb_GExe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100089

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages UART baud rates, with each baud
rate represented by a performance level. The driver uses the
dev_pm_opp_set_level() API to request the desired baud rate by
specifying the performance level.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 158 +++++++++++++++++++++++---
 1 file changed, 141 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9c820302047c..6ce6528f5c10 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,6 +14,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -101,10 +102,16 @@
 #define DMA_RX_BUF_SIZE		2048
 
 static DEFINE_IDA(port_ida);
+#define DOMAIN_IDX_POWER	0
+#define DOMAIN_IDX_PERF		1
 
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
+	struct dev_pm_domain_attach_data pd_data;
+	int (*resources_init)(struct uart_port *uport);
+	int (*set_rate)(struct uart_port *uport, unsigned int baud);
+	int (*power_state)(struct uart_port *uport, bool state);
 };
 
 struct qcom_geni_private_data {
@@ -142,6 +149,7 @@ struct qcom_geni_serial_port {
 
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -1299,6 +1307,42 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 	return 0;
 }
 
+static int geni_serial_set_level(struct uart_port *uport, unsigned int baud)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	/*
+	 * The performance protocol sets UART communication
+	 * speeds by selecting different performance levels
+	 * through the OPP framework.
+	 *
+	 * Supported perf levels for baudrates in firmware are below
+	 * +---------------------+--------------------+
+	 * |  Perf level value   |  Baudrate values   |
+	 * +---------------------+--------------------+
+	 * |      300            |      300           |
+	 * |      1200           |      1200          |
+	 * |      2400           |      2400          |
+	 * |      4800           |      4800          |
+	 * |      9600           |      9600          |
+	 * |      19200          |      19200         |
+	 * |      38400          |      38400         |
+	 * |      57600          |      57600         |
+	 * |      115200         |      115200        |
+	 * |      230400         |      230400        |
+	 * |      460800         |      460800        |
+	 * |      921600         |      921600        |
+	 * |      2000000        |      2000000       |
+	 * |      3000000        |      3000000       |
+	 * |      3200000        |      3200000       |
+	 * |      4000000        |      4000000       |
+	 * +---------------------+--------------------+
+	 */
+
+	return dev_pm_opp_set_level(perf_dev, baud);
+}
+
 static void qcom_geni_serial_set_termios(struct uart_port *uport,
 					 struct ktermios *termios,
 					 const struct ktermios *old)
@@ -1317,7 +1361,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = geni_serial_set_rate(uport, baud);
+	ret = port->dev_data->set_rate(uport, baud);
 	if (ret)
 		return;
 
@@ -1604,8 +1648,27 @@ static int geni_serial_resources_off(struct uart_port *uport)
 	return 0;
 }
 
-static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
+static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
+{
+	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
+}
+
+static int geni_serial_pwr_init(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	int ret;
+
+	ret = dev_pm_domain_attach_list(port->se.dev,
+					&port->dev_data->pd_data, &port->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int geni_serial_resource_init(struct uart_port *uport)
 {
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	int ret;
 
 	port->se.clk = devm_clk_get(port->se.dev, "se");
@@ -1756,13 +1819,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->se.dev = &pdev->dev;
 	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
 
-	ret = geni_serial_resource_init(port);
+	ret = port->dev_data->resources_init(uport);
 	if (ret)
 		return ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
+	if (!res) {
+		ret = -EINVAL;
+		goto error;
+	}
+
 	uport->mapbase = res->start;
 
 	uport->rs485_config = qcom_geni_rs485_config;
@@ -1774,19 +1840,26 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (!data->console) {
 		port->rx_buf = devm_kzalloc(uport->dev,
 					    DMA_RX_BUF_SIZE, GFP_KERNEL);
-		if (!port->rx_buf)
-			return -ENOMEM;
+		if (!port->rx_buf) {
+			ret = -ENOMEM;
+			goto error;
+		}
 	}
 
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-	if (!port->name)
-		return -ENOMEM;
+	if (!port->name) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto error;
+	}
+
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
@@ -1808,18 +1881,18 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		return ret;
+		goto error;
 	}
 
 	ret = uart_get_rs485_mode(uport);
 	if (ret)
-		return ret;
+		goto error;
 
 	devm_pm_runtime_enable(port->se.dev);
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		return ret;
+		goto error;
 
 	if (port->wakeup_irq > 0) {
 		device_init_wakeup(&pdev->dev, true);
@@ -1829,11 +1902,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			device_init_wakeup(&pdev->dev, false);
 			ida_free(&port_ida, uport->line);
 			uart_remove_one_port(drv, uport);
-			return ret;
+			goto error;
 		}
 	}
 
 	return 0;
+
+error:
+	dev_pm_domain_detach_list(port->pd_list);
+	return ret;
 }
 
 static void qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1846,22 +1923,31 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
+	dev_pm_domain_detach_list(port->pd_list);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	int ret = 0;
 
-	return geni_serial_resources_off(uport);
+	if (port->dev_data->power_state)
+		ret = port->dev_data->power_state(uport, false);
+
+	return ret;
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
+	int ret = 0;
+
+	if (port->dev_data->power_state)
+		ret = port->dev_data->power_state(uport, true);
 
-	return geni_serial_resources_on(uport);
+	return ret;
 }
 
 static int qcom_geni_serial_suspend(struct device *dev)
@@ -1899,11 +1985,41 @@ static int qcom_geni_serial_resume(struct device *dev)
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
+	.resources_init = geni_serial_resource_init,
+	.set_rate = geni_serial_set_rate,
+	.power_state = geni_serial_resource_state,
 };
 
 static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
+	.resources_init = geni_serial_resource_init,
+	.set_rate = geni_serial_set_rate,
+	.power_state = geni_serial_resource_state,
+};
+
+static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
+	.console = true,
+	.mode = GENI_SE_FIFO,
+	.pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	},
+	.resources_init = geni_serial_pwr_init,
+	.set_rate = geni_serial_set_level,
+};
+
+static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
+	.console = false,
+	.mode = GENI_SE_DMA,
+	.pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	},
+	.resources_init = geni_serial_pwr_init,
+	.set_rate = geni_serial_set_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
@@ -1917,10 +2033,18 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
 		.compatible = "qcom,geni-debug-uart",
 		.data = &qcom_geni_console_data,
 	},
+	{
+		.compatible = "qcom,sa8255p-geni-debug-uart",
+		.data = &sa8255p_qcom_geni_console_data,
+	},
 	{
 		.compatible = "qcom,geni-uart",
 		.data = &qcom_geni_uart_data,
 	},
+	{
+		.compatible = "qcom,sa8255p-geni-uart",
+		.data = &sa8255p_qcom_geni_uart_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
-- 
2.34.1


