Return-Path: <linux-gpio+bounces-34532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGsoFzXJzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:28:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B3375E21
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC3E43059D75
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF893803E4;
	Wed,  1 Apr 2026 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4wX3cMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Udkgn78n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E637DE8D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028412; cv=none; b=qyM8BAcIyURlSXgYl7W6FKebk0wUNDGMeZxLAGimeHFqEHwP4bFw5sZanlVqW5PQ+cMwDGFuBAtmkE6DAVwkqMDiZH3BNrKqXquVdpnSjWCMTHnbhCOdlEpUvmEeJ58KzM5K0veaQVjvp3/1e2Sep64IaxRk+nEi28DDDN9zM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028412; c=relaxed/simple;
	bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQp/mJSMpq4uilouy5N6nE+W9AWD3ygjQ9sKBOVVMHzEFc+ytJvf7LD3j5j2T07Ao57QlrYVXXlwbeCqg+qvo89RJprGmOf9J52knWTubNqc640Tm5+I5ibFEztvhPniqQ+vq+G2oPNihFI4v0hY5bwbITSMvZGEmDlgfkRmfHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4wX3cMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Udkgn78n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317IPo73103964
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=; b=Y4wX3cMywAr79oQ3
	YD1uPEYEz9L7HbIRy2n8pFCr3M4vtc82encLhHN7MlyJpZ0rCk2sQ630SlT3Mnoj
	TVZEYJeBZbs2Ek1s8uCqwzam6rpK50aacQ7Mw8dzzDq1q5uKe2VhO7nXDweeDmKh
	67OFuKqhP9meBLM4NYGLk1Y4hmKM9K8F0hm7nHTGaWH9SbZs0VM/XVroj9F1A0JH
	fyoxyHz9Bn/c86xSbk8foIWuIKvmhah3JjmN3listc5l2T2zsfcVnoa8wXXHorxR
	zt/TeEjjPu/IUG+BCfFB8jvZWvf464hIAK6RcxFdvpKvXnnYU0PGzB0mJjJqu4/k
	SfOyUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js233ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso209056211cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028408; x=1775633208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=Udkgn78nTjP5ifULDIPFLa/RX8mAzfd7hbNvKo83fSZS9JUaSYdu3CIEFyDNAiVfsJ
         uGytm9h8yJhdTTlsj3vK3OWJycXCMD058/VZiybEn+Ml73BcpA6XExEBBHdQWeJ2pSWK
         MWs0iWn6pDqaGCHVD0bOFaJUkX7zGsySWrF3bm19zcEv/u8rkqFJSeohtgsWgFC33lhK
         OgvlqKRwmQHt7ux7Z72RwmA/fWxFLw2Q3b2VYnyF1wAhNjCQYEjqwqG0LjEcIdp5z2cg
         BdVyiM946R10NOAKGLB44nY2e4zu4in2ibSK6z5Gvd5LQKsgMaC5M8vQ1IN2s6MK4l2V
         xEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028408; x=1775633208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=kZqW58TkAS2hIcWQHbo81cPejMtMivYyslHzPZMLjLyHW6zCXVB2fhMa32tH4uojFR
         xyguEQ95LqrvrmWPLMrFhQWFgostbFqwdi5lls+BHe6mXa3ZnJMbf6JUv9p+qgE0mcIP
         wjwIAlVywxc/XXbmzdZOEKQhgMwRT697FhDtTjOYwjZlvqNdi//MUqBU87vd4g83XJMe
         13TBTTU5oHnPgPv9YNZyxEJUDfplq/J7lkqxLeWifGWJrn5iQsBZfqin+SEI2VpcPcM/
         2xGHutonz+TOsimWd+eewmKxgjlBP36qrW8XTjwXDVK0o86AQjNehW+7KvkXQDVxiBLb
         Fhng==
X-Forwarded-Encrypted: i=1; AJvYcCX1bK3WRndC1pkQIsQ94W3n8Vvstws92C7WCI62msO3Dtiuybt4DwkYCT+hwpTHxfigQf9orqvVkS9F@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyNsuCxmtFCeGLkgb3fZZFUn2zN0jX+k4n75xsnX5tQ3sPRXC
	Ub9UmG/d0Zxg52c9tVs7m9pHJxlyadhouWratqnMEEs2AUHf2K/fXSPVXgDYtN1h96+Ag7cQyDN
	hj17A2YA10fXKy/P7BkPfRkMTtSK5YpI1ZRhEGFfb8YAmmkqUOKnAMHwqM606VzYEePFJdh2t
X-Gm-Gg: ATEYQzw8GyQOb5AvcR7gj9Ghb18gILcKg/k7fTeW8DFUMeLLHXUnotYPovCJoX7w6sb
	Nc+xCpjw1fro5VSgChF6/fIb29H1M++bPQmrMTO1RUalUi9PNXF40fd+OV2uEkU7M9bNBd/IXXo
	sKIsfy+hlgscnsiZlO6Q3IYwzavjN1q9FGKtV6DNdRow6KGm6heFVeU4m1O+t5LMU9nrnM323Et
	4zu/HMBSN6WfYPozrcqIey2tH1sejCfxRjCujP/qoMUXaDUgIDQdBM6Gd/Zg59vj7Zp6cDkVhbr
	GPl/D4UJxaVLceoTFjCy2Syu6YCUx3nlYuoE2HnXoykv5pBl+M16qmyLvAb7fS0mMpKkacFiLl8
	gp58IU9RUJPtkX83rTv6eg+WbdO37hCttubxNjkXGk6qoJMpvHg2UjXkcisoG7a5wbSLfkthJKZ
	xicRqWkPIMwb1cblw+Ici65/DU0Q92yfVYdu8=
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr33948921cf.17.1775028408426;
        Wed, 01 Apr 2026 00:26:48 -0700 (PDT)
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr33948751cf.17.1775028407985;
        Wed, 01 Apr 2026 00:26:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:23 +0300
Subject: [PATCH 04/19] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-4-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirrOKHHguZib7Qm6juGjzf7VRKFXqhi5BrR
 yH99FUuX+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1VJhB/9fEHyhsyKNE61PLHs/8O6b8870lRBQbab7Zn44gpywX00gsld6suPRXxIzjBh6XGUgcLH
 S9PQYyKrqzMfXQQmXjvvtAvWfj5om40XojxzHA2mcuvDWMJSmTeZ1sstCDrQiuVXsr3RlMNSW53
 3civh+M5nEGRvSqmJUhQOalaEHJ7DhqhQNZLKMIqTk0uqe55hMOOFpDu6QGBw3WuiAw6ewqroS2
 TyC9iVpjbPQZiPd4a9/uqsj/Xutp4Q1yAVxjRk9cgPqjaM9lukv2gdvqxAoA/d3cqm/O2wG+OYI
 5UX6Wn36VdacrouZsDcqRjhKllFNhsTPLu87X4MKg5BiVtax
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0BeWGgqS8AxFVbve8jxmDap1nJVLCnu8
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccc8b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXzcVfnNejzlSx
 MPGaAfdxM47KQGDbCR9/qWn0o7SuOS8w+WhzkMbtNdGuzqJcAKnRBmSCTXDCfE4G33WRhwf5UZ/
 wtW7WlZTfulp872djH5Sf8KsxPslP29Gfm7UVqlMbBiNc87X0SBfbXzFtI1AOOM4OJdIBJ8nDE8
 +zi+lumGms0BKsykiIk2lFvrFxL1gaviX+2sICf5z++IXDJLx+tenSHwK9Ut3U+xz0SdmzcRijm
 XzMh0uJhPUn907/LcgLG9aVA+XNHqE2kRCZgIJG1H5GDYX+GPsn4hUH3EoF9XSN+6KgsC6I3yP5
 bTxX+14zgQSJhwE+tEEz+eldZa7nixsZFHbXD/Vvpq8IzkjsrdUxeYm/5qIpAtm31eXwwH4F394
 3J+bXGx+MArrwjS4MzZQzaZoxCn+qjjr/gTLLqUcEzik7tpg6V0DpyvovRqMnJtxA2W8MUnUi9U
 dzNw3W0oba1+12/ZSwg==
X-Proofpoint-GUID: 0BeWGgqS8AxFVbve8jxmDap1nJVLCnu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34532-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 046B3375E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
controller. This panel requires two voltags supplies, so add separate
iovcc supply.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index d979701a00a8..42e35986fbf6 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -24,6 +24,7 @@ properties:
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - waveshare,7.0-dsi-touch-a
           - wanchanglong,w552946aaa
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
@@ -34,6 +35,7 @@ properties:
   backlight: true
   port: true
   power-supply: true
+  iovcc-supply: true
   reset-gpios: true
   rotation: true
 

-- 
2.47.3


