Return-Path: <linux-gpio+bounces-36746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM2CLc1tBGprIQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:25:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153D53301B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5748300F944
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89EC40758F;
	Wed, 13 May 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FRRLk1E6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Het0Y9o3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156C3655DD
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675146; cv=none; b=pia3W2l5sgJz6AtFtmK4GyVj+Zk5iNlTX8g7rSchJQgIg31+ymU+OIACcE266wNdGVVUusMIiqSCyAVL9UPp4cz7Xvo6z/DKKmQz1eyi/bkoI2jZ/lDWaXoFr5Ddc2tccAXhPn1w9RRT38T4b4xchS1uHVTOrNHsz2bW7Z81WrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675146; c=relaxed/simple;
	bh=hgUS6WhYq/FeM9zVlSayQlXMovcd08cs49sDDGdfKEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CNSUqfvOxMgTyidQMI9UQeCScugzXwnpt8uVqW22rjiUV0ePrR70/vvPyWdCNnuyEDDpdY8jlkeFYHGQMbdv3onvTCraXvcWHM2+c77fUkikQAIl1LanEu5Sbu/GCV3G+j1wkdvsAty5Kkmpkj/DvX7hyyOD7QKlxmV9iWnq9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FRRLk1E6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Het0Y9o3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBt9IG3324713
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kz06LLvxrz87pZcw3mCLup
	iiX+M3Wbybhy62VcpJhXE=; b=FRRLk1E6Yxhzr+jCPzevx5PWdaz5iSivM8KPkJ
	R9zeGCVNyV1kvlpKm4C/mzVIDvAtirXbSXEEDosKcNN8rlt/kXQ1RzBzWpyK5ZPn
	sQKkR11VxHoWcqrhP7L5i2vAUbsm6k9y1sMbEtCEtOZxfdGgl/2jDW/Oenv2G/DL
	ZM95yz8OWbDnddp2t6wjh6z5Sl39Wl0MxoaY6vwsLzQ4pdNn/3w3fjMF9S8NnBNv
	Y2IuCMaimxuy8dY/5TR3vBcW7GST3MVHjWCbkVhmYW1UgNgvfzvKHGT5YITpybJS
	4zKQbDkvSc1rt/cmSsEVMZ4JEYDkFu7jheY3rBK0TuRFUIdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9cw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:25:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso7913116a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675143; x=1779279943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kz06LLvxrz87pZcw3mCLupiiX+M3Wbybhy62VcpJhXE=;
        b=Het0Y9o3k7loDuI8uFxExt+S+H63RIVvRpG0wH2EMNCnYRD1gfxZA+aoNxx23pMiVH
         aig3lskzRfvZ/6ymbKgXeJxx1aj7AGp5BZI3TtTYOMAp78fhedT7wacS6rZ81/n44W4O
         zvIrTaf+cKBxOcmHvksCkY9MYHKbKKjl4lE6GbhJo94qXMaFumBfUhOcbVtGf10GaQ4Z
         BUugE9oaSqdsDBWEVQScC43Adf2LTIls1nmg9TF5xt6lyB0UQ/AMBSjunKbgEmHQX1Kf
         7y9aiPXKcs9yB0YfMCtPRAdZGOIkslDcvSss9ElipRnr715GG9fSrMxIf8nZq9W8Mf+6
         hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675143; x=1779279943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz06LLvxrz87pZcw3mCLupiiX+M3Wbybhy62VcpJhXE=;
        b=hX00xWPkK1qbOxltf2Q9aRqvWOo+/yaJqM+cZTIxq0FjYXi+Egf5KQ4YdmRHQj3lFL
         wO1PUlZv+9/tekXVlmziGG2UGvnu7ViYuGP5+BeNQWE6pV+9Z0mgd1f+5TcoiPHljvxr
         NU8yeJMXhEVmmKKPd6DXe2jjg6OGIKhHz8a461bPd/86lO/N4SCh52I4WyV8G0IajHFZ
         4tUr0+l4VeGobBsAVG1WEOD27I8mJpACgVag3GYu9QZ1Nkz3otEF6eh1LLdTsVbmgM2v
         V/181arKQKktfmz8xwBgJRDNDsSJoGMrN1w+WsGUt3svI5/HsDqzmOO6zgpO4TJPdYXC
         BEDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UzVIQsD8ChI23SWh3poWCFCUqCgRPf8fY/BR7PktMfiaIjwgLl0e6BXo1r1YS9esXOW2ysj8YlGDs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84H3nGk3aYQEAgqnAW720oRu+8OjkLUcf9Kz7BJEZP2J5BoT7
	qiTrhi1TXr/smLb8gHjuBOQEklW6JRqXjxnQ1Gy4GRSBBuGWcJ+w6xjo5rE6URyfWuQllTandXB
	jFH2rc95w6o6bXJv29w2f6QuPUSc5x/9PdZiOnBhFUDIu9ff93OeywNwrbT4lieBZ
X-Gm-Gg: Acq92OGSFRqmVpdRptBftC9amUDHBHrL1/d9Znr9KA4dE2vqG3ltE3isD0ujzcZT3ui
	b/MbGEiny4fKaEDtfhWYmsk+PacD22+nB+pmO9z5ii8+DL38dNPss6iNVX3FRcxFfYZMfwW5QwZ
	Jvkqv5sjhEWIwSD+7m220BJaEbA2wGe2FM9CaqgQUNT35DgXiaegTax3Hc00tS771VejJrOFefb
	Gxy24xgFGn2vsxeTE5AkTb63fLCRFXARXPdJByTJKunLRAqM1BHM5TqWX7WsnA/0yK4IAcxpmuH
	SHfDO2xgZsVdrhqe+7aVOGGHrlUHTy5FoBuvY3m652FGGdTNyRiTzUOkXvrDmr/isK4MFjYXSb6
	N4e0IEiu3KtgVtjm9gvxxU5Kh4A7Fx8/qaX0wLI8FjoZo0RD7+A==
X-Received: by 2002:a17:90b:3a8e:b0:366:5283:cddf with SMTP id 98e67ed59e1d1-368f3d1b489mr2754578a91.9.1778675143095;
        Wed, 13 May 2026 05:25:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8e:b0:366:5283:cddf with SMTP id 98e67ed59e1d1-368f3d1b489mr2754561a91.9.1778675142621;
        Wed, 13 May 2026 05:25:42 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf4d84sm3651894a91.3.2026.05.13.05.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:25:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Wed, 13 May 2026 17:55:24 +0530
Message-Id: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U7379z1STOOx7BeD8atzJmRP15scsYWG
X-Proofpoint-ORIG-GUID: U7379z1STOOx7BeD8atzJmRP15scsYWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMCBTYWx0ZWRfX5iPNoxJqdzhe
 iV02SMWc9mfEQ4ubbKktM08h5vk6jrF7xxsXMJcFvvxXVADikZsik9/RK5H7jhQaIS2WNPH8GeH
 sS92qCT5/qu6bm37HKJGQbpwD50mxnVrEZIbCQSjEYTLvNgwuvXI+EWR9TGOT6CD+5+tFpgONow
 pVYKJuunV7FKNcsmtC4agRYikJxHxEWHCYC79/SXR6MxmWJZXngHUSKEvFNUPQ2lS0caLYReJpZ
 2aPZl7hTS9yMdnfb8PpcsUIxJvE4kv/VtWNGTPJMRQp0dSAaih5gGeuJy2L/jkh6doWw/kBFp82
 ZIaKc6+z5KRzrUjqX+kuL+0IUM1NTAb2zfWvne7GAvP861KdP1UQCXMQ4+7d3Rvkwf20I6t/i6y
 VFt7dIwSAHZ7l7hJmvhonHX0YkKDEdGYRBbJAXUVnZ14iFAQ01MXGWXurX97B7k/MXESE8qupIL
 pXRSQ4SS9n3GtRV2P8w==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a046dc8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9T1N9ULeWXxYjPfK8U8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130130
X-Rspamd-Queue-Id: 3153D53301B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36746-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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

---
v3: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com

Changes since v3:
- Clarified patch 1 commit message scope to the LPASS LPI variants
  updated in patch 1.
- Explicitly documented patch 1 as a preparatory NOP until patch 2
  enables runtime PM in the shared core.
- Called out sc7280 PM-ops wiring in patch 2 to avoid ordering
  ambiguity in patch 1.
- Updated patch 2 to use scoped locking (`guard(mutex)`) in shared-core
  register programming paths.
- Updated patch 2 to propagate fallible runtime-PM calls
  (`pm_runtime_put_autosuspend()` / `devm_pm_runtime_enable()`).

v2: https://lore.kernel.org/all/20260420123135.350446-1-ajay.nandam@oss.qualcomm.com/
v1: https://lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Changes since v2:
- Reordered for bisect safety so per-variant PM-ops wiring lands before
  shared core conversion.
- Dropped the standalone "Resume clocks for GPIO access" patch and folded
  that behavior into the core conversion patch.
- Added preparatory PM-ops wiring in patch 1 for
  milos/sdm660/sdm670 variants.
- Updated patch 1 message to remove explicit SoC list, drop "remaining"
  wording, and state that patch 1 is a preparatory NOP by itself.
- Updated patch 2 per review to use scoped locking and to handle fallible
  devm_pm_runtime_enable().
- Rebased on latest linux-next.

Testing:
- Runtime behavior validated on Kodiak (sc7280).
- Wider runtime testing on other LPASS LPI variants is welcome.

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      |  81 ++++++++++-------
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  11 +-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  11 +-
 12 files changed, 168 insertions(+), 47 deletions(-)

-- 
2.34.1

