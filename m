Return-Path: <linux-gpio+bounces-35044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N/LN3M72mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:15:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE83DFCA4
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDE9630DCD10
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71ED35F169;
	Sat, 11 Apr 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHwGzk9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+0qUv8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B178135E92B
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909482; cv=none; b=UbF8ht+t+3PO6g3LLjonkDr0SP/GNb5Aqz+0+AHrPP2D3ILMw7USdQApStMAslQ6WzYAZj/l9U88naavGzwlyEFnq4UBPIaUc1Z2bqWbwDgDhys9+AiqT/kGv/L5EXCUo3jryPEAj+10wEBJ+Up8XC6AmmVgVDAx6C74nv+j4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909482; c=relaxed/simple;
	bh=01BqkhL4ltxf9UTBykYfGYIBjM3T5bEaoi2x2lYAC68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyXxy+lJHkbsz7cr3U4JtmXlM9wMeMkHkTk56xDzdxJ4MU3XlZdiWB8y7J/32FLLzDUEVsMnzDfP32R3cL+uPSuzxSwXJ+NbqDMRptTpYdGlxLUoNIg5vgkvdwHaL3zlTVl3zPY3zbLJyuBb4ReQrABqnF9HvnHL5MPqmNAteAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHwGzk9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+0qUv8y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B402DB3909347
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tW2wH1SEkwyRGozFeJLS/gOD0zhYYxjGM1wCbKw89bo=; b=BHwGzk9bMj+s/yJM
	HRydB9q4gqrY3mbh26PNRmjG2tv4Op4h2wzsv+pVObZ/Z1dtiAi5hvZ7q+eFa2ec
	zfwmvOLpprQwyt9dggAfkH9imsHwZzmk/v8KePtbM0ncx4c2w2nHM4mSSeb1KIkb
	AyModtMr9GXLeHvoLooj9ZDoA/ExwyFGa4Rd1nIVrkJAD/DSUnVwClR7nSVodCbB
	FJhNFW9XSm2JCmjPumZWFXwIHhCM6OMQJS/plTei0FybQ9c5tjjyw1VGQpb3h/0R
	nWt6dlnqqrpjfYY+a8WhS1Ssjjzuj4AjzZybMiGcFOO8tCVVwEKxliY5xdfgw769
	YP25lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew00ncg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso36156031cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909479; x=1776514279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW2wH1SEkwyRGozFeJLS/gOD0zhYYxjGM1wCbKw89bo=;
        b=W+0qUv8y2wX7Mns/5QA+RStksgCKJHbMNIUTHJEbA4C3Xy3Jp2T/7P6iOSkt/fxU5k
         4n8EDJaYjWkGU0wipBcLoe4EI2TSGKlkcyfS3/H+rs5AkSIHAUS4LmoWbyn9fWVY9v+y
         bVfVX7MmdPZTuf0+6Jd+vpKFHaMpIU5sIfTp0VluRcgq7jJUne7NtHFpj/SsSRi7iTFU
         G6tegaJuzRVDLvUtPolIYifs42XEVbVefact5CfpvJNlkcO/JmGFvKXTIBpZWX/gKE1F
         WHgoAfFLfI/uSh88MPPhxEknw2ijnGpVA3ZRgInROvt5nJfkOHq5MwQiGQKK2eH/3i7D
         9FyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909479; x=1776514279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tW2wH1SEkwyRGozFeJLS/gOD0zhYYxjGM1wCbKw89bo=;
        b=DAuct8I21YbghI7Fpz046N2TFVsw94jtkP1YaIq3K+5Ix+ysaFCBCHcy32v1S0nSZL
         cUE9CTAU1hje0B7rmQZBxDH+rrOYMhpk/elksRseTQfroqmX3E9YE6ntEP8OQ9qaylZx
         HZllUO8vXnZCN77XYKvXgldQq4O208U63K6PqHC9adc+EpaqOtJfWSozWf/lReZLlsEp
         sMpdfqLgubDGAXEFzxRJP7FxuaBZezitPeBOJj7dbInd9PqQnM3T+uiWPVyyv+ATEAGj
         J+T1y7mLz+kYjcF1rzPtjFKTGogeWD/tidmCb6QIgA9NiVuft0bc+n1esI37cLTSlLlY
         QR3w==
X-Forwarded-Encrypted: i=1; AJvYcCWLEMEWtFbWfcFTzZ9vAih0Y5Wh4a0n2SAXSO/PE9ONW3E8TDVqtzSGpbF7PNXdHVnd7JJ7XEC5I1HM@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRFrh/yDwlplE1Z0og0hj5FhAoqWYF7vfrVPv08GY/c8eVRDA
	/UDAuHqSpHhzjVG+lTm+USVKtHntHsDO1p5cuYK+fbA2sP86oYfCJfgkDYoHDw68uSJ8qSjpFhM
	Uobl6g8RyOoLIGHJHAUP+Qu/jTdXCZV0S/j8FuRftRU0kFKAxqc/il205oHuFunvS
X-Gm-Gg: AeBDiet41VC7Bdtm5pnxOXWuHRp0ff+hFB8NBHFaHrZXyZVm6TpljI3X+UMxWUKHUoF
	IBbn2XlfOO/j5BBxd4/mso+x9BKloe9JPBd5PG3Wv8AZMvTJTnHJsE2vSASOOiv1Ak9W8yOi/uU
	7Xy8XuVR3a3hqRmfMYnQ0VWwZ0sKMGCNoHjPtFVhvC5Mpb2z/6cuFH7/7kXFp4xO3vt8JwG5Q/g
	WpQuoriB8hqKRFcNtMbMh0MW8BQmuVS96DYYJubLr+zVpx2EwBKyxiuxHRbc1f9UuwUknYEnYlc
	IVV0HEKIkUROtfgdfdL1gQQdG0MJDy/RLKpwGUDmD7aalrbPuLOcAcaZE5VfmkDSJUfypqnwPnK
	0HMqwfUrmogFdB3DIZjdVcdo2zB6QC5XW7u3lvEn1NDAOygrytHS/Hbu6qMG/4lpyGwdC+nMI5/
	EPmb2Khc6bNFq8klJKQmxbxdBP5nTq+zv3hYw=
X-Received: by 2002:ac8:7e96:0:b0:50b:3e4d:7ffa with SMTP id d75a77b69052e-50dd5bdab51mr98801691cf.45.1775909478919;
        Sat, 11 Apr 2026 05:11:18 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:50b:3e4d:7ffa with SMTP id d75a77b69052e-50dd5bdab51mr98800971cf.45.1775909478293;
        Sat, 11 Apr 2026 05:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:34 +0300
Subject: [PATCH v2 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=24423;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=01BqkhL4ltxf9UTBykYfGYIBjM3T5bEaoi2x2lYAC68=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGRIi+aezur/PHYEf6WugXPNVuTy2fwMpct
 4T3einfuy6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1R5eB/wO0Q+ty+VaHHvXr/ZZIt2PS3F/0sGb2601A5c1fanbOvvOQIeOGu225gYLvdcfhBQAJP2
 oewie34HtRuG9Z6EmPj0eRKiH1vLxgrJXi3vu8vUnPWhI7yKXzaSW194qetqzq5YI9NXqD/97Ps
 XMiJ4FpP+WBLeTmuu8erVx4Dt4Hg2cPjScVJY5n4PetpYFfWzyVKmwlFeCIKg6q4sDBgT5hX4aF
 vaPLCu40teld3gYiwTIJ/g0lzWrjjkP9U3yPJRmpaOGkXBh1eZc82dqvKeVaI1U06G9YnXHJsFl
 UyDuspeZHe7VML9z91MbcegXkrOxAj2FKJVAfGyCVGWNCaOa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX2hwGSk4KUsBn
 Xx+FQ21GdbJlNMbnwhLNOZvitU3RsFaqbA3KUrfjneBFtZO0cwJEZWP9fZnBHJQKtAQDbFDZUhs
 buXI6I7Zehn63B/RYaYOmvXjhf/D1wXqGAa61oI/GHXsVTHeWqdk254tdH/eJxfXvvwMir67/eb
 ++04RinC66t/ELrGNdToEo0cchBpgRstpyDmNKd2VFJCUmPKouGZep2y4CzzA8LGXUl+K1/1lxq
 POqLBSv13c8VW66qI1sSeC54Rv1t3me3cTAgzPTy0PQefPrWz2kzN3CJ1Q8Keu7NpgksOw62nzU
 nj2vuRV2K6Vi8Jq/ZpYuSWvaaFvMCjiG0ABwv2whn0ojYCqUCAKG9BhUL35o+SEtfA2etfcM7mT
 kDmHuEfUbv+s3SYThC7E5HySQj9SJ8R6ZV4SpQdmoazrPM3pJlTK2T4PPECx7rZQLwBoi3K6smI
 v47jW6s1KJEZiL0i9jA==
X-Proofpoint-GUID: cAvGw6jDhfvynXKkldzXEMWVjldpCOyr
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da3a67 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=sK-RQuhdBYdXSAti0wYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: cAvGw6jDhfvynXKkldzXEMWVjldpCOyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35044-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CAE83DFCA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
JD9365 controller.

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 476 +++++++++++++++++++++++
 1 file changed, 476 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 11b7e07c1af8..aacb8968cd01 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1599,6 +1599,474 @@ static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
 
+static int waveshare_3_4_c_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct jadard_panel_desc waveshare_3_4_inch_c_desc = {
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (800 + 40 + 20 + 20) * (800 + 24 + 4 + 12) * 60 / 1000,
+
+		.hdisplay	= 800,
+		.hsync_start	= 800 + 40,
+		.hsync_end	= 800 + 40 + 20,
+		.htotal		= 800 + 40 + 20 + 20,
+
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 24,
+		.vsync_end	= 800 + 24 + 4,
+		.vtotal		= 800 + 24 + 4 + 12,
+
+		.width_mm	= 88,
+		.height_mm	= 88,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_3_4_c_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static int waveshare_4_0_c_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 40 + 20 + 20) * (720 + 24 + 4 + 12) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 40,
+		.hsync_end	= 720 + 40 + 20,
+		.htotal		= 720 + 40 + 20 + 20,
+
+		.vdisplay	= 720,
+		.vsync_start	= 720 + 24,
+		.vsync_end	= 720 + 24 + 4,
+		.vtotal		= 720 + 24 + 4 + 12,
+
+		.width_mm	= 88,
+		.height_mm	= 88,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_4_0_c_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -1708,6 +2176,14 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "taiguanck,xti05101-01a",
 		.data = &taiguan_xti05101_01a_desc
 	},
+	{
+		.compatible = "waveshare,3.4-dsi-touch-c",
+		.data = &waveshare_3_4_inch_c_desc
+	},
+	{
+		.compatible = "waveshare,4.0-dsi-touch-c",
+		.data = &waveshare_4_0_inch_c_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);

-- 
2.47.3


