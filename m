Return-Path: <linux-gpio+bounces-34243-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G6VFvJdxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34243-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:37:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAEF342AE3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5590530A6E51
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F7532692B;
	Fri, 27 Mar 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLtP11x3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsoRtIQm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A2265623
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607492; cv=none; b=aTf6yCZSvDCrtg2VCjf7m5/ZjrapL6LP+eJ1Z0Y2vorBLdB97gXis9jgkVCFyRaUgtouaubkgcEF81Tq//IN5bfA8aINYgtafG5jq9qRPfyBQN+KzcH+f7iG3n3dp4QGdH6H+Yt7p6MECMOEWClHfNrZoeTQexuPh4Faf8U7Hv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607492; c=relaxed/simple;
	bh=cCpbO0xpxrkamZBYNK5FGi1dHW8NWRYnOVaCqRl+4R8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZYUf5qBOVxJxkkPS2e6MeFYt9Oy/c00OZ+66KNP1tq/2kp0C7UpLbvvy1gqhfyoYHGOnQKbf668COiwqXoWefEn8E307f10hT2l0zWNxdRhyR0kxV7OuDijQPUmHrbJma4wPVII8a+RDW3gqpXQ1RyxJufrZ+YzRnQFNKZ12D+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLtP11x3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsoRtIQm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wIiU2538750
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ilMfAjXX4CaXmjRfbjW2ud
	wFpVpV8FN1246tP76Ll+4=; b=gLtP11x3r5d1+CTLHfpQoS9G2sR7nJ77mfXaJw
	Dpd5JjYbH1lbRm+rMeyNNSlt9yY10jcPRhIAJoBWWpxp2ns3rbuYpKIbeM8Ag1em
	T0E7jywrw8EDBmfpOhA8kJ6PZKKM7WaoEdyoXI0Ccbkv65OgnsR+1c6UWVEVQlVc
	BLGvphE44iAvh+G1WlIIvM3nridIgmv16WI4ea0TJfuat5UPGfbyU77of8qI3ynN
	2GGRv4Z+zdi7b155j8mYPzQR16Pr7gNHZeq4FBMiiWAc+S5T6YpHpAjhOaJK2lmP
	6TCwz95Z6zwveRR4ity8PIdZxU3I57vZPO3U9UMLcTCILdqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883kjeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so48227991cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607489; x=1775212289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilMfAjXX4CaXmjRfbjW2udwFpVpV8FN1246tP76Ll+4=;
        b=LsoRtIQmdKnZfm0F/Gg2V1c4d2uLwD2lRHbyJ2fchebAZ6IqLty04z8L8FqXZkidp0
         0vMEQPZJsU6yT57UavXWGX6EK2rlfV701wxxjaPXT+tkrFJO/j9WZp8LnnT/a1pML7/l
         S+gDJWZ8yQ7UsKAepuL3E87aURL75yC2lriEEujTj9aL1JhBbi3X+7kJJTG7VfK+0pUY
         vlUiz5bAN4w56WY8xcvZBwvqKKa6k8VyhIG7veptMZ2akdCfFdAjhJP/uE7YPxvcNn8D
         x4pdUToQTqZu25sXTjogEn7kCwkglFvXNMdrd19GmPo9jojIRtTGFXw7ubg3sf7ATFFS
         Alig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607489; x=1775212289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilMfAjXX4CaXmjRfbjW2udwFpVpV8FN1246tP76Ll+4=;
        b=AE4xTysM5MnYQ3BR3Oelt0/7osAYBxUPU8b9dMqbDW3+rGul/SVMu+NzF4EwGCKDFq
         P2P4H7UDmh/tj6RkMhVCS0ddSbSVladIuFt6VO8oE2dYF3VeLgCsW68eCSfUt00sJiqp
         fTyiEZXSPkc55cvODFouQjq6TCMIuPZffwUZHm58iYCbOyTHgE6G19OWjd6mvxzB9eXf
         JFb//HRHZp4kfRTdwAk02rPVYDgDapEbnrpWp/yhUVosXRFDIkXbsXcEskt2u4CLE02q
         pVQXXln6FRsCIVjhKDGWHlSg9Tt6nw6MLXifeVYk/+q3DQrUSO4Bbe7GuokWnmICnfqH
         6otw==
X-Gm-Message-State: AOJu0YwYOB0xLntk77D207keT6G3Y95nUIKway8vgLS053xQCLGDG62o
	bxjHNwcgzBOJJTZ7ZnLgozdaKRSmQJ3ggXFc4ApCqLd77LIpT57/TFWJiBeP7zyt89z83H9AR7F
	XFX0eH9axPzFqIlD+eqpdASi2pkMdZVCiKW6v8Uc5Ln8qk2ELzO4ZeaB6oQ7gBOwT
X-Gm-Gg: ATEYQzxG2lg5wA8mrLKAX+7iFuFY2f2grLT/kDdCQyu0BH7rPvohB60UvdaULbYoz4e
	ZpSSh/yq9i1r/cHacWMxbeuL/uEqobJhuR6M5zEXe43y3PKps6yhpVH6euwV/CYJR01m/gK7/iQ
	pdqVgzBKQ7HhIaNxsc5GCQLcmO46CpTzu+WUjmEkXX4tWuGOcxaLx27fFvU1Y+9JhezjX2n17eQ
	QtxNthJN97xVgUSUfFq8YRw4WhMREgRqWeyOb8qjvGENJblvb3DOZmvTjuecUpvILnA1ZuyOUUz
	yT1YJRnZfgAQV1UwX5ewn7UhzPYXuAkj1AicCwRvK3IryzCdsyP5xitfK2I6eV9z/vce3U/36D0
	a6IfxxlOpmPPZFbzZ65NcTsMfhlR+9kT7C+0dt1YNT6Sv2OqEd0c=
X-Received: by 2002:a05:622a:548:b0:50b:1e5d:9928 with SMTP id d75a77b69052e-50ba3951c58mr22981941cf.56.1774607489603;
        Fri, 27 Mar 2026 03:31:29 -0700 (PDT)
X-Received: by 2002:a05:622a:548:b0:50b:1e5d:9928 with SMTP id d75a77b69052e-50ba3951c58mr22981341cf.56.1774607488762;
        Fri, 27 Mar 2026 03:31:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm13382138f8f.16.2026.03.27.03.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:31:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/4] gpio: kill dev-sync-probe
Date: Fri, 27 Mar 2026 11:31:10 +0100
Message-Id: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9cxmkC/x3MQQqAIBBA0avErBuYLAy6SrQwm2woVBSiiO6et
 HyL/x/InIQzDNUDiU/JEnxBU1dgN+MdoyzFoEhpalWPLkrAXY4DFz4x395iTGFm7Ej1q5nJktF
 Q8ph4letfj9P7fifWSyZqAAAA
X-Change-ID: 20260327-gpio-kill-dev-sync-probe-4027fab0c0a6
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cCpbO0xpxrkamZBYNK5FGi1dHW8NWRYnOVaCqRl+4R8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxlx1imIrohs2txSfQ0W0/A1O9egP03XIdR9w2
 1j+xqS6cRGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZcdQAKCRAFnS7L/zaE
 w6qOEACUM9z46FKBoNpH6hehqlAvRzW7n+ix3b2CA04rT3bTncDafZ1lRDCedY8kXe1IuWxZ/qd
 lX476ShH2rkUCt70HHIHO6RmCG2QKDEmBEZdiYLm3GQo3H8UQMR8usjP1a2mngV+DjhQWjDyRmw
 ShcwYE3yhHRzD0lQ3A846zjitv0aCrHyZjqRf9ZKAzjChxGA2Xj5igvckowI5GAoxjX71vTpjy8
 +jhL5dXey3Bn94yGpOlo94eumtaE9Fr+sMckev1cFmxY81u32tGrhbNS0sNCK/A0JhyGYGb/lnK
 65He3yUILt5/zBeu9BLtejVfmwGPhs0dk9Sr1q9ppdRN/j/CNiTPtgjOExp2rkCfnk/wYk7jRNt
 JYHeVOH4/kwFuAgE1R7ILZLv7AdoR3XzfkGg73ZjR8afnWHBwa3Guur9GG9qBkMQFrOoPB81Yjd
 KtGdhu3Mf+hw6gf2fZ4RZV1xzp4VVA6gA/eNoxOR9SC/M8yFaCiI2TO+GhN+S9GNveV6Po8zOD9
 VZsViCGjujSMvGqGvTHsWFsRYQaMR7h5yhUlUVjVf2FEnoUQ+F4ku7JwCFCzE72G7ErhmojsJr0
 g4RwZ5tkPjxPwRv9ROg8wi6Nz+SVbYzck5/gpvyvh+oYqwcP+cq7E5sWA8+zrl2MxfadlcMdy8v
 f7qv2oQUjM9Hurw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: oYCymylwqTtrT7-X37POmLaqx3IklqUy
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c65c82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=G4XsEQhtMV_5Gyacy6EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: oYCymylwqTtrT7-X37POmLaqx3IklqUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX9Ea7nMSMDcK6
 rt+g6j0yZxisa3jggzZjN7zDnR/yLJfOPUSf8TST8P3Ns1U2ZwrvhAcDEKAZmF9bINb3b0TzERD
 IEISkbI+O5zMFshUoj1YlEgFDfMHeGDPMS/aPJpPGyedB+yESAG6eDvV1Xgxr89APyZsrwpWtxf
 VII2IeGrg7rkrBvOxD33Iz+gko2T7nYQ6qOG6budVnKkvquGPwJkS7WZjRJRtfrUruWhB+4Et2k
 QZMyGg2Phvo6IVmxfA0DzjzXv2CigiPfhzUSUHSCfl8LEUiWhUcO5ldfaLjZ7DRBcbNeX9Pb7Lj
 P7dS9XQ+XzZDFxyrFK7XLOTTrHGaqECL0EoySrUlb6ycl2TzH9FXp4TvrdaAd1pUssBQIR/fgQd
 tu7oNWN1aUsnzbLsJiw7SLLrGr+ZWh7tNnRriJsafewz4YODTK4gzoC0KJMcVeB8yyQtTneaNRI
 o9TVRqpOua5uOO1zogQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34243-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAAEF342AE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I came up with this elaborate mechanism to synchronously wait for the
platform devices activated over configs to probe, involving notifiers
and completions (which was later factored out into what is today the
dev-sync-probe module) because I didn't know any better. It turns out
there's an idiomatic way of achieving the same goal with much less LOC.
Port the three drivers to using a combination of wait_for_probe() and
device_is_bound() and remove the dev-sync-probe module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      gpio: sim: stop using dev-sync-probe
      gpio: aggregator: stop using dev-sync-probe
      gpio: virtuser: stop using dev-sync-probe
      gpio: remove dev-sync-probe

 drivers/gpio/Kconfig           |  6 ---
 drivers/gpio/Makefile          |  3 --
 drivers/gpio/dev-sync-probe.c  | 97 ------------------------------------------
 drivers/gpio/dev-sync-probe.h  | 25 -----------
 drivers/gpio/gpio-aggregator.c | 38 +++++++++--------
 drivers/gpio/gpio-sim.c        | 49 ++++++++++++---------
 drivers/gpio/gpio-virtuser.c   | 30 ++++++++-----
 7 files changed, 70 insertions(+), 178 deletions(-)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-gpio-kill-dev-sync-probe-4027fab0c0a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


