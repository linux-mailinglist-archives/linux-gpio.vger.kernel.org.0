Return-Path: <linux-gpio+bounces-35257-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GQKDaYd5mkMsAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35257-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:35:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740F42ACE1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F6C13031F30
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F9539B979;
	Mon, 20 Apr 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkjI+iv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2Hhaufj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46239FCAB
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688315; cv=none; b=lDz1EugXurEl6i3O+HRc3dDplkLoH+kn/bSKEHBk9jIC1R1773miGZqzDUTwiWXuqZJshP8vTK9atZERHxHUrb7OkO6VlW+N9JwgpSGFXfVpt9fIbWkbErmohzNh1PzgmIb0QE9rpcUBcEiYf1PCIwLZ5bX1gj9T2bsWxLQI8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688315; c=relaxed/simple;
	bh=fijNuC9FR1cZ4vpqQWPAtPUr+djgOpl0AYC6SN2xKEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fCTvjNidRugKIFYWSJHHF/rjeNVbZ5aK2fQzZKinM1zjWq26ZF8Gm8QhVsprxCMPmn9gf19uQ4PHwuVmE+4iHY3q7WZ1oShQYLq3+a8KcGM54ToItcYVUq99P3DyTVxkFcXfXaQy8c4KZncBXdY1P1j3wrSbkhC8k263OHAaECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkjI+iv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2Hhaufj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91RVA2281691
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eyXSzsk8PjP1o8Rxe3vocqKQDzDOHBKK7Gp
	9Aex3a2M=; b=OkjI+iv0RLHLiEVzjOLDxXLTbWrRCgGymwE+1ny4FecooC2QwpL
	yccBYzY7LFrldqHdK6V8382iaUdwUj+y9P9XNn72fKAJbvCctRZVFE9F6sHq5XRo
	FsJmAieRqF0IX+H6hV/nGwrwm5qRec2dlq4Da7ldISkzZ7oqvMgU2VxM1MXo9Lhe
	X+oZ1bsIaipF5Wfj4jTvx52Oiva+6l7samDDOy/qDOznGc9huu6e5U4Jq0GkN45/
	/pF9QxJXbWpdzlomaaZ7Htkz3sGes0bP3c4lHZdDs+t6WJdC4yToYvbJwczlThX1
	DmQnNXhvQvTz115JZz2uHQkNMSaQoHnCExQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598psw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:51 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7900fc7033bso67406837b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688310; x=1777293110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyXSzsk8PjP1o8Rxe3vocqKQDzDOHBKK7Gp9Aex3a2M=;
        b=S2HhaufjPavg/7Z8jri0K4A89e7oKHCRQ/hf7IyHW9bD4FVcn3rMlLsccuV/7Ak3jK
         XDqbtXRFMzktx7Vl+nLivCy1FlcHN6HRnnqLq6vANVrfVHVxFLupRI8V4htGdQ0F7b3o
         sb1vc25MpAJ3/HVFE3zcC5xC7vvfhjDaaaqHq4AWD26RCgjZQCJQEpTyOtEJuDcRT3mO
         NRow+5CkcvwlP33kyv5SQfUy9+xKeeA0XFLSfZWJ8iOKjzIbGI3lSlPfHjLyUOScuSxy
         HkifPNkGpECVnLAyGu97yjvQY9i+0+2t9MxZ5pc8NGXC5oVZ2DoskRvcpRgWZNbpr2RJ
         sEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688310; x=1777293110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyXSzsk8PjP1o8Rxe3vocqKQDzDOHBKK7Gp9Aex3a2M=;
        b=SZT3HzizzDLN51sMAN9PAIOiF5O3OrgxHSv6BVutIlsLBBY8tjNLUH+g/pK9Q+ShtQ
         pxLesC/yBCdI3Sbs+yCdHXvOJssmpiJOVw4qxuqdo3BLYxetdgIff+gVUp5ngekjg0sV
         dZgbZkE4ohUFuRkuPgXZlh15n6iuxZtYGEYIVtDDd3lr1uy4arrySfYSR+4YZdpk7O7r
         DVlibaLC2uBW2a7+5osV5oT/xarelKVt4BYUAiEjX5j6Jg5lMst9yUPKsqDBlJDrbv9e
         nh3TuuP7HTaJQB6y6LrAlS/CPl5tQ3ipwXg4vPTe5xJ3unni3xKA3L9nQ6YXdoTl/EFV
         dkNw==
X-Forwarded-Encrypted: i=1; AFNElJ9Wejij7PyBPO9GAfK2t/EqEXZONoJIMWetGhScY1yAcjoJYgusMPU53hShzksVR7RCFyhOFd1KMJAo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hibv9MY2ofn5PNO0L0ZzRb1krmGzptDsGQ8K5GQAX55y4bBO
	/uyf2P79VQHUUFlKzwlSc4CVIUksMOHKJ5DfNDz9b748eu9YhJwyVY6pWJR6vNMwYvcsf2xhIVW
	noK17dsSt8UlTgmLTPQMupIuGeZeWao0FpOGP47HT1KZICbbWUEo9lhQDBbmEAIr6
X-Gm-Gg: AeBDies0tj01m49rCsZXoumH7NXin/m79ZeaKFdCEpxbvBcgyigoixqNaLTdAAT4W/B
	FX1+WZMpRJ9+NTLPSgINjgtOFXuJi/mNZC4tLpzHlyKJJMf7/c4rU5b+X0Nave+stMPM4PzfoId
	bhGD9bXP8VE5hbMFSpFZO36CMp9+OqnPhrrsWUA70Ofg5DoGR6aQB9Zj7YgpZifb64bg0LyrgsW
	j2jaWfahy0ePZojzn9rhM8/rUWftMtVrHUQ6/rCPoHz5Dn7lzWIBUStL1gR0DcAkU6EUELxt1OO
	ChLUFywycydTLhHUBRdlyrZtAFjfX5OBTJs1r0RYJveEGlInl8NnDZYlwg9Lk0CKfnA4XbAR3y9
	IOzKwJEDQmZWVp0vSzPeH7w/wwwUh3ZXEkzWCbdEKZ7N4KSVg5kk3QGpbWkku
X-Received: by 2002:a05:690c:14:b0:79b:e346:9813 with SMTP id 00721157ae682-7b9ed2ce09cmr110296637b3.10.1776688310664;
        Mon, 20 Apr 2026 05:31:50 -0700 (PDT)
X-Received: by 2002:a05:690c:14:b0:79b:e346:9813 with SMTP id 00721157ae682-7b9ed2ce09cmr110296307b3.10.1776688310218;
        Mon, 20 Apr 2026 05:31:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm44014267b3.14.2026.04.20.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:49 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/3] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Mon, 20 Apr 2026 18:01:32 +0530
Message-Id: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kXw23sHMJw1bl_6ZKHYpwKSK7fRc9uHi
X-Proofpoint-GUID: kXw23sHMJw1bl_6ZKHYpwKSK7fRc9uHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX9DDdOymeEWf0
 5/1wfglgDoeRJ3FZkviaScWv/tYYpJkXKXjssljFGdgOLd8OI3mAimmwZznpA9H9oK7ATiyOyRH
 oP5YEAz6wsRqa/6QO8O7rctjyhSirSJvcT9IdggjHsc73N66NcrDP5uzKjo5Ty8h5WlfoyVW/OT
 nZk+g1m5isdldmIROZHYa38iK9N5PnxECy7bxz6+ToLrmNsVkqhpgghBPVZIVpC9Yl4kujGDQuE
 2X7vJmdM40p6MfC5RsZJbxaaKAcGcn1nK1rdEXt6BZRoLlZlw+r9+l8GIINjQFmPhXmj5oJ/mh8
 SMZAWTSFecumJTWjNCRpFi0SlKwaaSA5UzRACILlq2MKYI5dzGJkerFfy9FeYke5/djZLQ00q8k
 c/pAKQX2Aqtxi9+5nGTl6JkOrtlXPmGzsbhy3Q5TqAx7ghFysw4Qy4JVIznDBUGlSA1gdT863su
 rbuzCxjhg5Ae1GDPXtg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e61cb7 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9dJ8MUsXuwlyAIs3VwEA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35257-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3740F42ACE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series moves LPASS LPI pinctrl runtime clock control to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
callbacks are wired for all LPASS LPI variant drivers sharing the common
core so behavior is consistent across SoCs using DT-provided clocks via
of_pm_clk_add_clks().

---
v1: lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Changes since v1:
- Kept GPIO helper return type adjustments in the runtime PM access
  patch and switched access paths to pm_runtime_resume_and_get()
- Added runtime PM callback wiring for remaining LPASS LPI SoC drivers
  (sc8280xp, sm4250, sm6115, sm8250, sm8450, sm8550, sm8650)
- Addressed style nits in GPIO access helper declaration formatting

Testing:
- Runtime behavior validated on Kodiak (sc7280)
- Other LPASS LPI variants compile-tested; wider runtime testing welcome

Ajay Kumar Nandam (3):
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on remaining SoCs
  pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 48 ++++++++++++-------
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  7 +++
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 ++++-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 ++++-
 9 files changed, 97 insertions(+), 27 deletions(-)

-- 
2.34.1

