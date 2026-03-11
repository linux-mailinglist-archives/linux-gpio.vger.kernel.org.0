Return-Path: <linux-gpio+bounces-33107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIRvFdE6sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:50:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1AD26135E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C95C7301A140
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793E36C9C1;
	Wed, 11 Mar 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZqfmXmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIxA8rH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC48832BF41
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222357; cv=none; b=eh9SQIouuJSR1jZLfdsroxZw0vnKu6hEEjO9HaEK3OxKaHqvYNqNF7+IVm+E3k7PIkj0cARLlRyj2B5MIxLP1dhI+jTSNNqvAtgnqPB2mfJ2beDJBFSqcF91vgUNr7R5WGdkqgr2gQPCV0jojsRfjVspTuDItnRahGAmIQjlyss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222357; c=relaxed/simple;
	bh=eviXIYp4+eDp8HGG0HEzP5fhxPOfHlKuW+1tv7onERg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OTWSmtmrLo7Tit8wfkKeigYpb7mLDCXLOUUzFwuTyuSqUix4kxqqTCox9Hfr6KnANIO7uGFC+/rtPLUw/uU6ybbK7+IHlh4MXm/+h8yyUBd/Hr2arEWgZzMAAGaczuIdI6uNRmHAdLeIORHJkaydf5d66aqqXvsOQB+JkMsvVdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZqfmXmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIxA8rH4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6h49b2676227
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2tXyMSW1oEmLQusxgSGNZX
	zPqI8wrzYcRuxPzyxCXjI=; b=iZqfmXmWFV14MX6cr8QujjBQrCTNQy8NP+KawW
	myNRn8Wsd34MB+mujsBIwpy+N3Yw3hjRX+bXlPo5QdQtNB1aSXgumGg9bIqLIZf8
	o1hb5XtrSxWjuD2w+VhPp1XZFB1e022vSxIfVnOERVF58Ya7hyuzk3zDqz0TwqMs
	RbRlhmrRbOhkvy24w3ZacOXtT4xSS5YmiILzTYTzx02uoSsGUKmGoghLjCaminLj
	BKo57SiNYPD+NcqsBbJlMiFBoFh3lKQytyO+B1lUfJ7jeTfvfhGSEOoLDy/nwtLp
	vw7Hv5bMLnZHCJwh5KuPtW56sVYsT3bav/fGeWo2beulkleg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd0p07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:45:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b20cc6faso735409b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222354; x=1773827154; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tXyMSW1oEmLQusxgSGNZXzPqI8wrzYcRuxPzyxCXjI=;
        b=LIxA8rH4rj348AiU9r11yfpx4m5jmNKMHW8Lhdv25SabLin37vpurTxUoI+gkCvM/T
         AlmTYREQn+z2/VJxUMlE9xSuXkNwK28ZKMWG5mcf1UZsG3pZrgO3dW0x/sf/vdRx92gf
         c5/+/A1NicZ/hWipBJiQeVggmUMB01Sv6UAL6dLn/jk7RejaE65L/CNEU2wTbzj9UpP+
         DQB3f1/4utSkOs2HIB/vQuiWETuUtlG9lCW4U5a1iiPg0eWIRQaNyHKPYEISgIRf4eAl
         ZK5dAtkZpvraESguIsykQoa/tTteKDHPl5L7OtOySVzhgUTF4S+IS5Zal1/Q2ke1uXUu
         PHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222354; x=1773827154;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tXyMSW1oEmLQusxgSGNZXzPqI8wrzYcRuxPzyxCXjI=;
        b=b5HR3kVg7bxObZ3+rx0jdT8pPgHHAHl5sOu2Rz7+qseBE73+N0Poac3XzmZZuOHb9R
         EYgtUR790YDvv/HlHFA8zo19AZk3TlRqhNlYSteKcHfdaqmHCMocgOFEqjwc3R+G1z1N
         WjcklocCjHF3e1LI33efoY/3dqKAV6YAH9rdt6y+y8A2f7BrJL0jj4c1kqSDN83iwujk
         3+XrVvSDmsfTholS+zB4GajQkT/4BSlnyaeLY2CNXXDYtRt4JG+tfLvMZY6iPE8GTVBP
         3+9UFE8VMnS0AxizvvED3sgXahXFl/xUb2NIrQ5tKKUoU7D7yOEqrsvjMYZOqx7m8A4I
         vvdA==
X-Forwarded-Encrypted: i=1; AJvYcCUvvYp9GEKuGFy2wiK8evIm4XK5fX9jtDK4QiY3X1z3lDu6tjpfxjJQ8o1oLWtd2eHhQp1NC6Gq5CHl@vger.kernel.org
X-Gm-Message-State: AOJu0YyoSMxjarCRw8K1y6WFlrF76mN5bWdJvHeKh6XXMCUUw79YtYPr
	C6gT5sTLLtSJWWl/c31czVdi3dK+tmaPRpmZtG3S/y7qYqbAf8VlHgf+9WXJdaYYgZzpa3Fy6dH
	x5W199PjyaU1w1UDFg8hHYxlxBL0tysLueXj+uwlZC8dnZ/bZ/6TpL6AlE1N8auYK
X-Gm-Gg: ATEYQzxBh632jgtAZM8Ea1eEypPPk0WsGBozUi/MQNvRW9a4HhTtN44Wo9/NWgndxrz
	jn4TcY7Bo8ygRoIkonq3fzXnTbDrzNStzZB5TH2k+dZ4PE8rX7LSlJ+40iOlz4sWMopUOPfP3mv
	ezLX1xA5TcgO4aA+bQPWQQv67K04J7cJ2O/50w2BoQ+9PLCvekHyVBjgCp4XjOPqY7FoBNfxVKR
	dGyg1XwY9w+AsBiqjWygtLaqUwIK8gX8GJm+z91em/TnCtnGfU4K0iYAYt0UElMZPZp3btjQFkz
	SvIy2SiHgsZPJjGAnj+GWfyOgw29naoKypxDOCiHyuQ1rtsRzpcfAul9qRhe6t5JVWEet2HJi2h
	M71aK3o4u9IybOPdQ6TnHAbgUBqHC5L7fDVTpPAGmc3E8XyDOq0q4PiUY4MSu3YrVyMj/lsBPVz
	3838Qsdyt6p8RRNxFwdGaFQAIx0bd7l9QBXAxspd18B2fzlEOxjf+jJSW5
X-Received: by 2002:a05:6a00:2e21:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-829f7aec3b9mr1907957b3a.25.1773222353523;
        Wed, 11 Mar 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e21:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-829f7aec3b9mr1907936b3a.25.1773222353019;
        Wed, 11 Mar 2026 02:45:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:45:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 11 Mar 2026 15:15:42 +0530
Message-Id: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMY5sWkC/x3MTQqAIBBA4avIrBMmS6OuEiH9TDUQWSoRRHdPW
 n6L9x4I5JkCNOIBTxcHdntCngkY135fSPKUDAqVwQJrycepVY52cC7a6GxYadtkWUyD0UZX9Yy
 Q2sPTzPf/bbv3/QD9J+vpZwAAAA==
X-Change-ID: 20260309-ipq5210_boot_to_shell-43db656579f0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=2640;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=eviXIYp4+eDp8HGG0HEzP5fhxPOfHlKuW+1tv7onERg=;
 b=kJs9VJObKPcudpWltfXd1Qb50PPNBfrTcgJEEIC/F6WdErLIWUhwc7572vvZfrOYf/oGpK0TP
 y6Eg+2e0UH3Cgz9cp5pAmGiT8REVvYfBr5Lb3xFC/Nija245CtfnUOA
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfXwzgN1TI8IGQR
 s13OU7MqFBGFASddyFOGpt0u5H6bAUV20RPODfsZfpZ5XcEEWLF8nVY8IaMWrSuigYEszr8Pgh0
 hn4KPOS3gPGDZYSiVg2icDBHpbNYPSUqwo7lZ47TT4Miz1xzjiS0F5lqWRDSTTpFF3320JNSfNj
 rNBnJoZ1b8w/XIXMd8+F2rgwL2baT8cp6+08FUUaNFlO9zXlTa8dM9dRUEyAdOa/g0fVI1V3qxN
 3WaWC2GxOIrFyPqoe5YVzvUB2xz/Uiade24B88BzcFWAzFyIrNotK09J7elg6izR08QsdjKwbse
 G+CQ1o15S1OKkhi09CGcYfwf/bi42Xe1bGq6GcD+ZLIP4FCDJYMNP4BWe3rdLcj/KkbQIpqo1zc
 6b6quZnF5dQIF6Ceo1T0hLH/WSk1mjpuBdV+0Ui8hWauvnika+0SOma+QSVQW2m/5NpK+TejATL
 cChW7FiWTYwiiKLKjuw==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b139d2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iO1PHWQBdAPoGl4AmagA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: XVEFOdjaTq91XW0Tfdldnvg-tvFeekde
X-Proofpoint-ORIG-GUID: XVEFOdjaTq91XW0Tfdldnvg-tvFeekde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110081
X-Rspamd-Queue-Id: 0B1AD26135E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33107-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
series adds minimal board boot support for ipq5210-rdp504 board.

SoCs based on IPQ5210 is shipped under 2 different marketing names such as
Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
F8 parts has the Passive Optical Network(PON) interface which acts as the
backhaul where as in N8 parts it is ethernet backhaul.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (9):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver
      dt-bindings: qcom: add ipq5210 boards
      dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
      dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
      arm64: defconfig: enable IPQ5210 RDP504 base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |    1 +
 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        |  141 ++
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   93 +
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  304 +++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq5210.c                     | 2641 ++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 1156 +++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 17 files changed, 4678 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260309-ipq5210_boot_to_shell-43db656579f0

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


