Return-Path: <linux-gpio+bounces-36761-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGPzIoGGBGrVKwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36761-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:11:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDB534BF6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE5493092F90
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471C22E62A4;
	Wed, 13 May 2026 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUQsVK94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdfAneVN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26C23EA94
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680832; cv=none; b=sbV9rhXLN4IrKSNHRGdpXhhLm+EWJE9FVhcVqeCCHy46bjC/BGL2mfGf/dLUuzrhdlyAK2uWaJIoyXOH024F6wNG6KIpmYS7a9imSpCKyoXpJOYPbKZezquM3zPbXlFeP6qabBd7G5NiBOIxvbYUtZ0KuyDPwkHv3FUUqsGmWig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680832; c=relaxed/simple;
	bh=aKBc3a1reObJzPxjVObMzeIy6B8figPxC3rY/NQYiOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYHvBF1pDJ16JG4Ro2TA5i4cz0bRMk+1JLhjtMkZyLMLkhCH+r/LTyu9dRHSOSN2nnfGDSsj8gaI1gS2ggcQBNNmyyo5ICxx9gOnN/9myGOOOrC9qABZDGLwC+HHHgAhfmpQ5i7HI7NSqWOLIbLXrBcO55NXzcVrVSpENtDrHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUQsVK94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdfAneVN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC9Oh13324677
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 14:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/qCpThYaxG6jHZBAd7Jq5rIBXmgO7auE8lO
	iAizRneE=; b=BUQsVK94BJZxia7E/1VGse4RaqNzYTxEQKiAqZc5b9sLqPd2Ipw
	08rbwhVNAF18K68/OlQbIMpJLS6D6fHIXuR0Q4tYt8qZ5v51PN7Jb+XDZRfIyBKd
	fToIy1EAlv8rDtxdqASMgWQrmHu3bu8XcGnqvBQKCgWATm9l32IO+SjnXhtl3Aoo
	4pP7N6+6NEiReyr9yiXZcnlkjtoGMUroZOTu4/FwqzUystR7BwpZDdxAlk1aiLz3
	T+kp+neiHbh4jlvW4gIfaO0t4WyR/LzS4Jx2sTjw5pav69bXvC41HMqUvo1u/vvv
	DkzCpXSH/hKdCUxg07ktXNIYiMJsrevSHkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9rrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 14:00:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so6006311a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680824; x=1779285624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qCpThYaxG6jHZBAd7Jq5rIBXmgO7auE8lOiAizRneE=;
        b=GdfAneVN2tCT+NBM6JRxCgxZtbl1uE8r2NEcN/53HnQ0Emn8Si4722QES5tpSCJYQV
         QUZ/zfvqF8OB10t2ZqF4SB7ILxSnxd5fhVRVz9trAf4n0luFzrNe+Hk8D6SVgR/AGphW
         vNx6r5hEjtVh0paqHlKhj9nGgvR0p52cFN+8g4y2fPSetwdENE7BHszot/btRJLzj8UD
         mwmmqpHjh358669wXZEv3kep8H+1mLog8i9RNAtKFzhsklMEoAlzohlRZJSW8EB0sCiQ
         bOZ7bO+Wi+57biwlIm7sDE6o64b7foVJR4aF50JaeQtNTUPTwXTxnpn+cC2jPSteGHCd
         UtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680824; x=1779285624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qCpThYaxG6jHZBAd7Jq5rIBXmgO7auE8lOiAizRneE=;
        b=MgLFlGPo8v+oNeFQRYgfJUDduzovdfaVl35WtlnmT+h39qpS1k4VTvwOqpb67op4e2
         2RC/3h0kU+au3jyztAHmycSWBB8ROli4MW+teiZxsZ4/vHZX4wSKiwqD8nxOceYnH8qM
         k7gDzmt/kszzDIL7eT8vhJAqlOMeC4yEr+bu2eXjfP8IlvnNgPpxrR9xGwawJuIl29d6
         /KTFV0NyMULnYfQDmP0E76AmuZqTnin/Y05vhi3tbC9z0l70kw83Ee0fQlvs8TXWPB3o
         r1g/sFhnyKLfzemrld5FBvPLMuixFg38YIv8TJ0ywDYH3tzRxLVa3g25i0CVPUzTup30
         y2cA==
X-Forwarded-Encrypted: i=1; AFNElJ/T40Tg1XuJfEuAJecBB7P8hQIpN63Ky6Gk99fpKijSdq5AHNf2TUuVzlCa47uXHCPbJ5Y3Sr/6C5DN@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXrhFs0h1Uz3NX4LdR41CGRcv+9PVJT+AzynhCAJZy8fUTZ4S
	F02fGze1a3tKynT3Ea9dBVvznuXqp6WDfUQ9qjX7adQss5/uAJbRJtIaJktTy+o257TIlA7WT8i
	WeLW8FyQwMuMsCY4WmrjRnjO5Mvw4O2ohezFQG6WxaVZumR2CUHdAh+0hNVb9br4C
X-Gm-Gg: Acq92OFlOg7zd+ZYazC7HwDDNzEtptkuA+heNmyC/Fz6wWB66wpDN8EjMnz7yK8k8sM
	xVk7Y+ZOnP2h0gXUxphAcIkJkNyjktOqCOvzJGR/wE92cgey+OqUXIzCFPvLixs+OB6IA+iVWRo
	mHW1QXdlXL6LX4t4qP0VLnUWzCPT2xIZCnr7ofzn4oMGw/wOyjh0UR2SazzxM5DonGW9Yo35Q+W
	hdcf0JY45qXpDnQKCB0XQcm/i/JUHSyWi44rdyerjqihumdhJpchF1e27GuAv5CAzRkU1QUdROY
	0GTEPwF8VY69BrWFz5NMcKnm/PzRKzwzfOWcpGva0B98pOZoz+gIyWwwfjeVNbonSk9mS5REwf3
	vIB4WSBynlO/zqejmAtLfWlUO9iChCJVli1C1sVL96Yx0lQyKzg==
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr36540125ad.26.1778680824087;
        Wed, 13 May 2026 07:00:24 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr36538565ad.26.1778680822277;
        Wed, 13 May 2026 07:00:22 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm176189555ad.81.2026.05.13.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:00:21 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Wed, 13 May 2026 19:30:07 +0530
Message-Id: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B09WTi77fHSaFEfjREl8BThH7GQYMCdm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NCBTYWx0ZWRfXwROBagyzy1Es
 qnHRZs8rIXciES8uIeso6p2Srb6kDm54PHwn5Oqjf2YziOUuQ2xfbm8szCpQZFKPT4xZNZJuVed
 Ad+JFBDfE3BFdMhz6uw3IDtjk3ehiRBjheG0KuZuq7RAzNO44Pis+4ZxTRZY5KuJO6JUu6d009D
 Rj/k0BFqy27rQ+GrD/LaUfJSlIh8KYnyTeTVrPgTOunubgT63LC+B/1kfaTW4osn82Kck+wt2U1
 AXfn/Ld1XTKRPPGEgj111f2BwiUP+VW07efys+ytDM4H+cxquKgJu+v6/5fiBpk5UO3s+9/cfhi
 IGEbBuz+oFwWFZYSpPShRdcDvzLpSTO4F1x3p6uaunW492Qhs80gqJergqElOK1UHO+md/Vq/ar
 /lrrfNxSaqe8AGdE7oSWmtndqnf1zw==
X-Proofpoint-GUID: B09WTi77fHSaFEfjREl8BThH7GQYMCdm
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a0483f9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AVCyWFV1gjYqDRSFLWIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605130144
X-Rspamd-Queue-Id: 97DDB534BF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36761-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series converts LPASS LPI pinctrl runtime clock handling to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The series is intentionally ordered for bisect safety:
- patch 1 wires runtime PM ops in LPASS LPI variant drivers
- patch 2 updates the shared core to use pm_clk + runtime PM access
  paths and completes sc7280 wiring

After this conversion, LPASS LPI variants sharing the common core use a
consistent DT clock flow via of_pm_clk_add_clks() together with
pm_clk_suspend()/pm_clk_resume() and autosuspend.

Testing:
- Runtime behavior validated on Kodiak (sc7280).
- Wider runtime testing on other LPASS LPI variants is welcome.

---
Changes in v5:
- Send as a proper standalone v5 series with cover letter.
- Fix indentation in newly added .of_match/.pm blocks in:
  sc7280, sc8280xp, sm8250, sm8450, sm8550, sm8650 variants.
- Simplify pm_runtime_put_autosuspend() return handling in
  lpi_gpio_read(), lpi_gpio_write(), and lpi_config_set_slew_rate()
  in the shared LPASS LPI core, per review suggestion.
- No functional changes.

Links to previous revisions:
- v4: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com
- v3: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com
- v2: https://lore.kernel.org/r/20260420123135.350446-1-ajay.nandam@oss.qualcomm.com
- v1: https://lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 114 +++++++++++-------
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  19 ++-
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  15 ++-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  15 ++-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  15 ++-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  15 ++-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  15 ++-
 12 files changed, 176 insertions(+), 67 deletions(-)

-- 
2.34.1

