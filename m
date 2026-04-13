Return-Path: <linux-gpio+bounces-35089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMJnKi7g3GnrXgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:23:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDC3EBDE5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DA5B30089B8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236573C5528;
	Mon, 13 Apr 2026 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMoH/WRt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQasXWZK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74333C456A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082979; cv=none; b=rruf/VzJv+bePvTkibzihg7WeAkj5FTL9A25A5EGWmybAcy/8mZUVTbERrkMPpYTBNYbGOa5I5D/I1vra9QL+hvsPlPi2DqyZj/mRqIfS+V6EgwjiC64+NZu7uRcG9b5seU0dVxQmXhYBPpCAAOreKk3qeuep3nXOCm4KWrKB1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082979; c=relaxed/simple;
	bh=Q3U9cR71Ou1c/o6O1vQUwLt7SPIPHBKKzdH+VYokhRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=saWrV9cAbfMsHOXOp9THXS83ziXvPR1jSuISRM2Wrpcqg9+J43mmz9T8lwnpS+hVV8BdVALwgaHwCnqbgWLjvpsZZZnOi76B8DaGWgMpPt6L3mrtT4wH/mAKk+rtvZa8lJFISYU3nVSKXxRqhFncNNHCCaIOHdQP3GYMRGZHBk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMoH/WRt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQasXWZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC7Z1s2186168
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aR0wfxNzBVS
	ofwPdxGhUSe58+s1gtFmmIRWzztRcMV0=; b=dMoH/WRt73np3wkJeNeCFojWaq6
	VlbKSYxBeWmdVZ+IJyfd0PFUXoFdmZ8/t20GaMAMv0YGZs+ObZ21xk0o/dZG4YNv
	yM3lkJwP+lSUrlRqz0ndqgggcO4eZX/6ct6fkOsN8ndqt0HqnJ6EbtIUKkXOw7Jv
	5sqLBXHsUAPlBUumSaaveF32ijjHb0HGLvBvxjHObSSmqNFwGNPNbBWYl4qvikoD
	czNTxDrULKFhQpuPbn9rWjOpBIgprBiYxwqPD/Z5qzH4+MX+PouzSIy4GY5p25NT
	oQmifzYp1Uw1+cke+HK14eRxQlBeLlOZwbmtU0R88uwBaigigJ5TLdj1oGg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hg1d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:58 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7af89eabe49so60443027b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082977; x=1776687777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aR0wfxNzBVSofwPdxGhUSe58+s1gtFmmIRWzztRcMV0=;
        b=iQasXWZK4VFqdGWH3aHE8KvAk04NTf3NLB7hlHxnN56d73+78em/vtgSO1ynrS0Vt9
         yUPWnnA6dNGkLHKyx9fX6zdlRnTJCEW3FpQfN8rMlFINR/6LL3i3bcruEOiqRTFh5ecL
         Zy5m7TMcmGMpN7tuA7d0QqoDsssOzVdSFxM93jIcuCUuqMFSjBar9Hqh9faVfm8fMhFf
         Daxq/l3Lt1AlXTPNSbzo32E1slq/AYY0X96iLSTL80XPvF1KB3BSSUc9fDrlOA8Qb80h
         mO4g5Wgjo3TDfNJDPntm4u3cCgCfz6z8kUe3ebv+MVRnXxq/10P9N2WK/beV/mpUqRtE
         yFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082977; x=1776687777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aR0wfxNzBVSofwPdxGhUSe58+s1gtFmmIRWzztRcMV0=;
        b=a+eAwwQUrK0IeGW5fZZNKSAgyG+U980JYSTomFQ7VTHgNoNGiZY1/kWsLvmGQR8gMb
         plo8vXTl4ghw+JzccM9IvYqgv4vdNo7A1Y3Q7tbDqtdFu+oEavAljWdvB9NAdFY197Gj
         Ib6KgaF5t5XjYcRnWpKquiTmfiBrji/0XGJn2GZZ79tq+NAq64r1jnWL1kuEmxr78r2B
         8UHRvRr/iDOfhDeg4nF0ip8vNyt9FEAk5ONifRysS6V9xU20/SBOmN9Pz9UtwS3Enka3
         bQDLIpLMSUx/735B7U6Zsfd8j3bLKMJG+0Jfrjv7JM+kAV+yBGzwxAEbqY5SsxkwuCYz
         bM1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8osdbyH86xWHm+ctZVff8UjDVK7hwNErdAHgjY0UaJUbqglOrilaRjl91fH2WVYLZOKQbURCKeIGO0@vger.kernel.org
X-Gm-Message-State: AOJu0YyEDSqyafn9h+txIhk7FQb5zl8CVUbL6w/FDBVDchk6Gx1eST7l
	G85sRTLPRDjw5JaLWdCxQAKNmwlNY4se1cB7n5+Y7Ey9Vuh6IWBReVAeBGpOZz7xGuh0vvFKp2h
	c83YFYxly1nZRAaYhYu3y1mR2kkWWzqnGI1z9WnTg3l58d53p6YDyC3zMKCzR8jUw
X-Gm-Gg: AeBDievWqXuveGYEdLFx7ncJ52vKZgbZf/BX5n92rcpEvOdToqG8Eo8xwqHE854EQwc
	gzS6aS/0BTWNEEvlWlOP0pC77cMCrGFbu2IU4LBph0qoRzlqhZInONfulOMZXfeS1HHq9TtEyy2
	nbQ+wqUhm8VHSncbuAM2It1xNJ6rLaw9sAuqwPAOSGJR/yfxjdlsD0DibpXnfLKdlFL7Su1mJtX
	EfG3oZG/OzdUY5b7rq4wHWDNcpAoIKJEKUQYA7GHJBpxtqo9hyckJrmUP/3N+BZdJMFJQ2XWXoN
	JeuJ91KMyyRAgXirgIRhvV/mVb78Cn3Qgw8kwLlMSe0wtic+VcLKzvsjyVhVIYLf1WLALo96Fyc
	AuGkR/yBlEOMXM3IJ5RHOdqvyYF8k2QPI4DsfJEGjFiyBGThxTQ==
X-Received: by 2002:a05:690c:3482:b0:7b3:ca3b:84a4 with SMTP id 00721157ae682-7b3ca3b8fa5mr19090297b3.18.1776082977277;
        Mon, 13 Apr 2026 05:22:57 -0700 (PDT)
X-Received: by 2002:a05:690c:3482:b0:7b3:ca3b:84a4 with SMTP id 00721157ae682-7b3ca3b8fa5mr19090057b3.18.1776082976678;
        Mon, 13 Apr 2026 05:22:56 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:56 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access
Date: Mon, 13 Apr 2026 17:52:33 +0530
Message-Id: <20260413122233.375945-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WSahv8w5r4AO1IZv2CPT2r86BCsxllNc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfX9HzQbX0DHZMn
 lBUMGmvrjBWn+1tV5FY5jsvOoG4ehgfg9rafq5fdziMTllpDVTuoAZte1ouE6DYgeOyZwdOBhDj
 fNp2xEMqt1/bz6bxyVEamoR/K9/SZEOynzf/czge2v/sQriXlLXM4KZ1Ob/cRvQnXTxX3xZTGQZ
 U5pu3FzavVbGyOPSxkSR6kptxrZn5bSF/XiAG30ppOEN6ThZ6ak2O/EBPdceWeVguDXIcyoMI/q
 p0v36rWF+1FeXhNPJ5T4V/VG/t2sNKzobjD3OL6saz5u7s0X8BDnHm8AsBO/xivs45jl0vfgTPE
 gziLpB06+vvkc9uY0iyHfb56+Hr8B0+7y/bGpgsrRJmJzj1DHcyq9vqSIvqdTpHcb3yVByGS+99
 PW2/M9EL17pn9H1hETWXKBNNlEFFpJ7SIJyiHWhwFOFNVxdW9vGVtT7JPOvwvIGwoMFLg14ExIN
 +a9zEY5yJ9/8mtSVLOA==
X-Proofpoint-GUID: WSahv8w5r4AO1IZv2CPT2r86BCsxllNc
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dce022 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=f7xhw97bOydz6QRQpsAA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35089-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83FDC3EBDE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure the LPI pinctrl device clocks are runtime resumed
before accessing GPIO registers and autosuspended after
the access completes.

Guard GPIO register read and write helpers with synchronous
runtime PM calls so the device is active during MMIO
operations.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index d108e7321..4275f2734 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -49,8 +49,17 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_get_sync(state->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(state->dev);
+		return ret;
+	}
+
 	*val = ioread32(state->tlmm_base + pin_offset + addr);
 
+	pm_runtime_mark_last_busy(state->dev);
+	pm_runtime_put_autosuspend(state->dev);
+
 	return 0;
 }
 
@@ -65,8 +74,17 @@ static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_get_sync(state->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(state->dev);
+		return ret;
+	}
+
 	iowrite32(val, state->tlmm_base + pin_offset + addr);
 
+	pm_runtime_mark_last_busy(state->dev);
+	pm_runtime_put_autosuspend(state->dev);
+
 	return 0;
 }
 
-- 
2.34.1


