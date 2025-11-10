Return-Path: <linux-gpio+bounces-28292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D45C45D67
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2C73AAF04
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50F4304BD0;
	Mon, 10 Nov 2025 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKMlWElK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2roeJr0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA6F21772A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769486; cv=none; b=lffKs8LjVYCVomnVipATlwc/hnnz9kNqSjdje4pt8BQUriQtT1f/VV2LdpuLZ0yZlOqi0To31q+15O3VcTr+Urc/dgfLN5KtBQqcoMuwKsMkxZtZMaSjTHjckZ6WUrrKbYs/Gfsg5L0do3ZehFwKZTgnFkOipaUWyITx11evM/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769486; c=relaxed/simple;
	bh=3MmH4Bjr2SUYfSC06/7l2EMAWT7nvko2RgTS275ajH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAS2nlJUk1ARrhmGMy00pxWWAr8T+noZfalTx0ZYv5oMgTwO0adnAtQ2YNj7GFdmTc2rOdhcY4cYgh9wccuE1KdGvU+qy+tjWlQQ0iK7WV+cCMAWl5H2U1P9vjj2ra45DLSqEXw5wgOwrh4J2Bkbkw5irJh5zjSy+ktpdNzS+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKMlWElK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2roeJr0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9CgBd3146225
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aIUG23oGUUb
	tp71kThpqt2rbn6aDG8VBqhkN/pZK6V8=; b=MKMlWElK22F8zXCXPC9B3xV9S+e
	IejF/OmvyY4wJeCuUCpbePvtDu9wNg62dO51g7BaHO5Tgj1KFqGDDjnL2u01d2xi
	AHx2vXoXF69wfBgXDCrdH/anSXM2WynXKsMvezcz6S7g2ZLOVOsZb0fXlfdSWcBl
	jxDr2P7z5GL0K5eORgJVSA/F22OB5KUYDU2GqY0WAT0+sziLJU0IHcTLx+9Cl7yC
	190tMDnd3eyeHV/Wz7LHS5+r9kHF1+cBExNywIJ3+B7xZErQClRCDt1D1njz8Ryu
	TZkoNjerWPHrJn+qSarpj1wko3dd4hSlg9qqv4YbLRsan1ue+H3+Ss4lxmg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7hr6tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e5a18652so20669685ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 02:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762769483; x=1763374283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIUG23oGUUbtp71kThpqt2rbn6aDG8VBqhkN/pZK6V8=;
        b=C2roeJr0Vfy4mHL17UjSBssF4VTdLZ+m9pOLv71HWfZTbviStJxvcPaw9RHNU8JvPZ
         ZshVG/Haz7dGxe6GetFMf7Ol968H/dyDyjpFj/NBhSdVg6pHCYYsEI2V8AxDQTG2tcb6
         hC+ekANwnGbftl+kPNeWZe8Ct7lULZggKXjwx1doogAyPWCwlybOfhv0D9jfHIOQepLn
         m4vuOitZ3KoyMYlfxLfkYGrhyAipb/5ZHiKA/pbn4XDZZpe0NGK/Sl7Mtg1lAzd1Mgs4
         DB2O3eIbpWWNH6G3pAwC9LAmlhDlF7/utWpb98c6ucFyTi8tvB4xtJ7ZXC1nb7kKOKK5
         2eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769483; x=1763374283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIUG23oGUUbtp71kThpqt2rbn6aDG8VBqhkN/pZK6V8=;
        b=hXv8Xfde1wowFAXPYRnUgKsFGQUwSh/yQOJdbXG0cXLVMrvWEQx8JoDfy+ZeobhmpA
         6Gw4vEIxfChY7q1W3Un5qUE7AsCjWeFQOr43dUXz8785Fht4GabHOdqSyMh4AlBd8pC4
         ov9QZjlkkagBkvafO2E8zrwfZKcy2/waVjtXvyyzZ/pPsqVwOuG8ItLYk056Bz+sLdDf
         taxEq5u0dhv2koQDJF5jADE467flWWDjAH8oz5Iqi8VVlDB9qz4HsuGMzvs+YhjJOTYn
         7iJoEqMJD3OzSMO5eLVUxuN/uSYMHNuVkKxIvsCXGRKwMHeBIKnulDiPC48G2iaNsld7
         lPNA==
X-Forwarded-Encrypted: i=1; AJvYcCUnOL6vdXepCnK4pPj2kaPCrFQ/5Pgbkneq5rcKy3maBDzTnHswO0lsmR8iB7VjAFxka0ldbTBYeg55@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLUJxmy+4WR/eD03Jg+VNgSs0S/8URLqUkCoJ8YW64WlMdC+4
	S3H1lny1GAylL2mZ7i4mAOIrUt2/iVnDCSXVUBp4gGEpOWlbtNencERhhThUlfjVp/L3NXgE9CW
	WNv034N92jz8fDi7BzawgN7NAJqySarxr02DJjukbO8GzvNwfM0OMvNGb0eNiRPy8
X-Gm-Gg: ASbGncuzeEyJXwFZ5BB4sPM4leyUw4vqShyzFKhWavfapHkb7PZ6Xbh/V5ZLc+gYDZz
	OA0fYDYSyGU7WugX4DziLfE+Gd4Xgmn9sl2p9dKVm5X58jSIzvMOJ5HlM9XfvGjZrJvcH6Ii/Ro
	NxozewnvcPH5U64jBydj0DFngeAm0eTy76k+Szj/Jp/amhQF2OC9biInCHF+/6aE4efgWMQRg4/
	Ev2r7fuqIFXsxQhkghkPPyK+C4l1x1sFIoILAzjMaKY5ApERbIKpRAY3w04CHLUxu/z8AFtCW8W
	fm8M7gI7N3wy4rGhtrwy2UYYqYcPs6x7TnLJTLNMpopM2JT561HEWIo3HAGQnl5bp7QQatBocF3
	tpd7pBakD5ClCASX3wKeveK0uasNSE8am
X-Received: by 2002:a17:902:daca:b0:295:6427:87e4 with SMTP id d9443c01a7336-297e56f6b25mr110161425ad.40.1762769482614;
        Mon, 10 Nov 2025 02:11:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvwo7tDFkckMB1RYRngONUauo8r5h6ctHx66OlgTqrthr8D3LxInO97cjEeA1eGQMxf+o6yQ==
X-Received: by 2002:a17:902:daca:b0:295:6427:87e4 with SMTP id d9443c01a7336-297e56f6b25mr110161045ad.40.1762769482041;
        Mon, 10 Nov 2025 02:11:22 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm60180395ad.55.2025.11.10.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:11:21 -0800 (PST)
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
Subject: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial driver
Date: Mon, 10 Nov 2025 15:40:42 +0530
Message-Id: <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: zokThHd1WcPBQmK_wb4fnTE8fY0Vrx8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4OCBTYWx0ZWRfX3G4CDbn27il5
 p5cRFRX+H476bgXWCmYAKla3L2KgaVZkEX8DB/DDZWuDmEJ4i2D3kKSpFe3uyNeVvkaEho9L6vd
 4C6yBaLeTjB2RZjkzQ9FCYWdGwjGNq5UF2fkgiKfKqPK+vvNZ8gExeDvbbzLhdcHwae3DCLUdvW
 GtvyeilNi91wsFa8OWeePuPi7tWCZn7w9GPE4p78CAqZ7+ssZvCJp+hO6slUJ+vZ0EUrpXLwx2a
 y7cr73HV/VktU3o+aeJxLLd5teJgS5q6Zr4hBqzsRi7Fejv23L/cgoXx4yhR42F4N3cV5J20FEP
 CcefqLVKJuZ4pGckwxF9PD9lp8H3VHFVdRnpcLfyzpZfTCvGeirD2xpRV2jHrbqQnrHeRhGAW4U
 I4cz+RoWNCZexOTC2MnMh8G41b6d0w==
X-Proofpoint-ORIG-GUID: zokThHd1WcPBQmK_wb4fnTE8fY0Vrx8C
X-Authority-Analysis: v=2.4 cv=Yt4ChoYX c=1 sm=1 tr=0 ts=6911ba4b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TBRyIjXBjLUW-Ng_AUEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100088

The GENI serial driver currently handles power resource management
through calls to the statically defined geni_serial_resources_on() and
geni_serial_resources_off() functions. This approach reduces modularity
and limits support for platforms with diverse power management
mechanisms, including resource managed by firmware.

Improve modularity and enable better integration with platform-specific
power management, introduce support for runtime PM. Use
pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
qcom_geni_serial_pm() callback to control resource power state
transitions based on UART power state changes.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 8058b839b26c..9c820302047c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1650,10 +1650,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		old_state = UART_PM_STATE_OFF;
 
 	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		geni_serial_resources_on(uport);
+		pm_runtime_resume_and_get(uport->dev);
 	else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
-		geni_serial_resources_off(uport);
+		pm_runtime_put_sync(uport->dev);
 
 }
 
@@ -1815,6 +1815,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	devm_pm_runtime_enable(port->se.dev);
+
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
 		return ret;
@@ -1846,6 +1848,22 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	uart_remove_one_port(drv, &port->uport);
 }
 
+static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_off(uport);
+}
+
+static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_on(uport);
+}
+
 static int qcom_geni_serial_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
@@ -1889,6 +1907,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
+			   qcom_geni_serial_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
-- 
2.34.1


