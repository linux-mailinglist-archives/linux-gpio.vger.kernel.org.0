Return-Path: <linux-gpio+bounces-33971-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULRYETmivmmLVAMAu9opvQ
	(envelope-from <linux-gpio+bounces-33971-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:50:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B61992E59C2
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CDC830154AA
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F8838B14B;
	Sat, 21 Mar 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnhFWPjf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilL7vhbY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C4277C81
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101044; cv=none; b=NIg4+c5lMVY4SXh6pzL+BJ1n/U4U1LklRbeJwwVd5aGazjqoZGT7vGDqjK0soVqIQRR6TjVtcbaw/YeEbe3KkE0Ib/716gr4gwlJg7R82Xl0piut/Xd3STbLFOS0Gtx7fphGb0CqtMMYvM3wlUrgSVjoFObcxjKI7kw2xctqgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101044; c=relaxed/simple;
	bh=mKHx+VfRPQw/ItF5UDbBI85OytKLSDar0Sp+oJ606Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XOzO3GI+GB8OB6vheLnV0GZbVbeeiCo+fK5OmY+xW8iG5Ru0C/9GG4qUsKRN02B6+7C1lrY4CbgO9fZnI4kzuBBCrMgiZimgsMxbvAHgpqMCm+6WVlhbTumUFuXXsLH4zikKdYkGvczx9HwfJZVsMt8NW+RC5lFyHzbY0BfDdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnhFWPjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilL7vhbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LBpTDd1433154
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nXecX1NuKNC16BMQb4qBGz
	Rq5LjOcebRUD8yZZIJjtw=; b=JnhFWPjfrRRzGgmN8G1UB11yazMPXDNiLX9wYg
	/Q8ibRyHtgg+Wim71lhmhzMeP9NRlj4P8rUr+N6ats37jli4b2idNA0yrd/+Vm4Y
	3bU22VzXmLk21GwcQ9mGaP9aJbJj+j3rf9A9CYIDA5gHL/HqrP6I5m8EVZTHK9J0
	YWjxdIWd5kZJBNE3zIKPH3426f1IaM/OHXhQupNVCXSALqQVyaa7ZMxvN5xYSwaY
	zqVkNdZOlsD+S66gPW2creujUKcHZil23kxNsMmq9FsmWPLiq5mhNpNXhWH+8Pts
	ifZfK00xcrCsyRN2LzEPsny6vqAPMynObd2WqqMEDHrRY5EQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mgh8n7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aed1beaa73so30770025ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101042; x=1774705842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXecX1NuKNC16BMQb4qBGzRq5LjOcebRUD8yZZIJjtw=;
        b=ilL7vhbYBqiIpj4K1/MJbPnXdlPNTeI86uD5qjtQ8vNNluwOSYyR9+vVWUQW8+Cb0O
         u4ianka/Ny7FcoVQUcWJUdZnn9fPU8xnQDHZtqKPCDdB4VMEsBH736OExFWmgs46TZsU
         34GnBB90SJPfXnI5B9ATE2nfBiglDQVEcv5BHYviAp0SgjDPda3TU2xxUHhBi3kZy5Xy
         1WrETDbLR7og+uhySC2HdZZX/9T49ezGclnlT36ywhZItVJqbsPGQ6SkgCnR5l3IkpRD
         BC7wEXRYl0Htv1RFr29B8mRVqLjT0BK0FR8jnU6CI8A1Qsh3CvrryUhO/jSAZKF/ITOL
         uxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101042; x=1774705842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXecX1NuKNC16BMQb4qBGzRq5LjOcebRUD8yZZIJjtw=;
        b=l5wHD8vrRMrRB3rzNSmzJIcecoPyt+ETLfXJs5c6KZPgzc0qFdMbZs70pMOuzlKJYW
         6LG1AaOLJio/8Wy40ofWBOLsroje1bl5Cd9/JrG4PYygDbSswboWJuSzhBrbTW9zlzki
         YUaLoOk50VmJo6zPNWwKydFwaWrUjC7IizvrUDTSuCn0b8v5UBWRPKfhp+Lus+9Rb8bf
         yOW3HUs35Whfzoqzz7gP8S7j3Ps4A7wwoj5dThb7XVToi4wA7Tq+2w5PUzo9g20qSDk3
         nyKehRWzvmuLXoBuoKMUnJZAOFZ4Cc3wR6fQ09j5XaHHmKe8CJEVuQI6Q5iSvb6FKbj+
         hIOw==
X-Forwarded-Encrypted: i=1; AJvYcCXlqviVTUkoJe+ilxNwlPfin6t5X/d4uNiRt24iooKa6KXLI17tKPkvP01Pv3F34fjpKd8PDEMR5Rs6@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6RCx8EJ296c8fVeScY15Syw4fwkF1EYzOn5KTkbfg4dMH8i/
	LwaOLCPIJb+jiesxtpbJ7ROl4XBdIPTCJHgXHWVzwpdZ6kMlwxe3zkvOLGa/3DtfRtvu+FmQImE
	NsvIU6r9c+nvdsyO0zDA6GOahvcTLwFQvT0pECILBOMD7ydHBD5P8UDGO6aBpgWXi
X-Gm-Gg: ATEYQzx5NVG+Yt+LXzY+NfLSjmSCbnqUPif2Ye8Mag8h5JCufmjBnS/M+KdAfZCIXPq
	k4E2ucstCZKrYydwdICd0VOWxcuBN7UpbDJ1AAwLmffjgAD87f/c3Ln4pTvodBOMoJAhtbs/V6j
	ZOg2AOjuKeuSPbwTNbi5TXrAv1l1KGl9m/sB3piajpcVQyiM8JTjdp6wsX11k8i01fpbHwrDmBu
	XhCA93L3+tkKbRPGvBFBW2xP83h81uhp8kRCZSIDtDtooLS+PqUso/FlaDqS8pADL4TexTZc7MB
	7/gqkCnRysD3UQL/P1s8SrFAAfoUdebQ7wMuHw0AJXZSywicq19acrp053jB4xsB7VUVr5fh1Ys
	cV18L/mOPSF0pVksvGTEMv6bVz+bGgWPwyI0y8DJ89h88o79hpBdTGWosdQ==
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0826feed5mr59028805ad.20.1774101041714;
        Sat, 21 Mar 2026 06:50:41 -0700 (PDT)
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0826feed5mr59028695ad.20.1774101041170;
        Sat, 21 Mar 2026 06:50:41 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:40 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] can: mcp251xfd: add XSTBYEN transceiver standby control
Date: Sat, 21 Mar 2026 19:20:29 +0530
Message-Id: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69bea232 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aoVsspQhmqNhTY_ZuUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: TP2wa4IIM3ON8RNW9h6MmwcHujIsNrs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX5m72gXkcKh6b
 8fYkKTSXl9BvT1SW2ffo3sDtR1spWN4qx8+X3M5NBoxtCKdMcLUi9BeGRnIq0RFQ62L17AvNZ75
 xOO5+HvfVj2gHHo4c0bnVqqTJqp/VoNrjcXh1iOPjnY5M+CRGG6WbkMNvQQSMJP5H/y4b7R97Dk
 VvHxp9eRdx1QAlkivkTBfw5V1ZU4ZwcfjqJFX2NANWs9UKsK3k+GYIBEaJJ3KH6R5TYi60LlBn1
 mwlqf0PWItgsBTyka0i+yGJd7lBwU6Yzyq1amxgU9YuOrk+63q058+wvFeQa6jn09RWx1ZXxh96
 A22Q+g1DGNOR8FSKr8QX1w9sd3cihaQ/G55gxVUYH3qOI9uHB38WDUFfGthF7aJdcU+e03DAXrS
 V6V2WeM4zFqznsFTgCQ+Q+51N0Fz7oxgL+dF4OGa6egFb+ZNcGeQNUpCV5/VHGzcbk2CxFPfUFd
 g0MQV9ljM3IXtdxdcfA==
X-Proofpoint-GUID: TP2wa4IIM3ON8RNW9h6MmwcHujIsNrs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210115
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-33971-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B61992E59C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MCP251xFD provides a dedicated transceiver standby control function
via the INT0/GPIO0/XSTBY pin, controlled by the XSTBYEN bit in IOCON.
When enabled, the hardware automatically drives the pin low while the
controller is active and high when it enters Sleep mode, allowing
automatic standby control of an external CAN transceiver without
software intervention.

This series adds driver support for the XSTBYEN-based transceiver
standby control feature.

Tested on QCS6490 RB3 Gen2 with a PCAN-USB FD adapter: the transceiver is
active in normal mode, CAN communication works correctly, and the pin is
automatically managed across sleep and wake transitions.
---
v2 -> v3:

- Dropped device Tree change from this series.
- Configure xstbyen pin before bringing the controller into normal mode.
- Add a check in mcp251xfd_gpio_request() to ensure that GPIO0 cannot be
  used when xstbyen is enabled.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com/

v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Enable hardware‑managed transceiver standby control via the appropriate
  Device Tree property.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com/
---
Viken Dadhaniya (2):
  dt-bindings: can: mcp251xfd: add microchip,xstbyen property
  can: mcp251xfd: add support for XSTBYEN transceiver standby control

 .../bindings/net/can/microchip,mcp251xfd.yaml |  8 ++++
 .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 37 +++++++++++++++++++
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
 3 files changed, 46 insertions(+)

-- 
2.34.1


