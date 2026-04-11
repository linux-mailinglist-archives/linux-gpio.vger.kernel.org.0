Return-Path: <linux-gpio+bounces-35039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNFGF9M72mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:17:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9D3DFD2E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F8130A8169
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A05352F86;
	Sat, 11 Apr 2026 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9lYC/yk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUTqfxiD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148233537DB
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909470; cv=none; b=uhkIi4HQa+EBTFsHITpzJ0qm+C2jcW5dhHrWNCBc5nyYeJ5JNIzvwLOy/L4KyEAjFUZ+qnNqFDcaCg0W41MnqM8630czIqi7HQ0npgBQTydrJZCUpjtP8ux12Imf1e/WA8nJ1pnYDtKzTfGCjgSA+w7AhM5q96aDUOVTtfSfDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909470; c=relaxed/simple;
	bh=sQ69JX4wAjTsBAqHELNV+ZWRZ1CzDcUvy3hc2w/OnYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kqnmm1oE6L19ExZNj+HO7fxa9Czq5yb849A2qNiDyCDO7vacbAjqJGEUpg0oI3yM83TByX5SyKayNBgduc0D2wO4k4gdTK24eQY7yLN17vddpvvCHAtYGuAPY1hSJxIUlT+iWgPA4dBbihgwM6ib85Z3WAkVlYKKCE+HQ6VgWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9lYC/yk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUTqfxiD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B434cG2736607
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=; b=f9lYC/ykfMzgHbKz
	u+1tOL6uWiVUlewo1bQRGIoLNx+l2h2R9yliutJKVLK+Lk05HEmwKUVpqkQEkBHm
	5UjsxsCM2V+VilxyzuobfM43sp+K2PJn9E5aJYvTzFchrX51ND2OXhsj0a6Q8X6k
	5HS/K91DxTiqDT9KaWxzB0RAOw1lZNlZ1o7nXhkWeioLc4x6OV5VrIi7OEh0nRer
	lBKNv2EVAzMhKYTBkzYstgXCPUe5z5AteC7GGBY93mZBLb6KeAzlaC3hmfKJlluU
	L2BULYv5KJzOCGreJsiFvsw7pk8CJaSpoMJX/9LXF9rt7m1rW+Uw6lf+nWDJVGER
	yKuKsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcrn1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so75316761cf.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909467; x=1776514267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=;
        b=BUTqfxiDiy7npTaxKgUJ3x1ni/Rwt2umjJ/SXDL/qAHnVsMrZQswPCXd+ehcF9tovg
         altLOZw36s6A/Clq1GOjNoInpm6c1HMKjhU7eGHXu+rBTUtYWCtjGs3VhWrT4ubusHpz
         Tpp+A+P8hL9g/+NxkKkXcJ3t3+ecEXpf1Qw0ITelx5CO4L4Qt8ZJcHX+IxcT+Innuh/B
         EO39E8OiGo4eFxfrSRbgka0CuxUjq1LbFfseAiYSGvHkIboDhsdoPrhPj1dIbP1fg1x7
         kBg0YQM31Jm/fIqzAP0cdATZ4ok8wMnHuz22KhzKXvWJsj5fxrtsaTLVC2OBd9sY7Obz
         VgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909467; x=1776514267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=;
        b=GgPQgsrD8JB9yNsj+aH743CyU5Hkr2XReRb9yEiEER0kNthZpaU7X8wWWC0CuJzveZ
         CA5bfPP/Bd+0Xcah4SIhBLgL4BOKy4U2OdVloSRuboJiIdO3SIIN51kKiSW+s4TRWPwr
         yXIqT8RqCrMD7SusAeva6qMVmhWXZdUVpYtNTwgRi7/+j+vRdYUiphxTdLsbCYcnfU6z
         zyj+j1EbGqXbQXC4o+zjNA9XIFQTDCoa5BCzlJsBWXX4FfNBbixYpMb1Pfd7IocIp/CJ
         wpUZvtkBegqcZk17V53fkKste0f5V72zBeVxTAVUL0kigHQBOoxDWBdntzYBULvvwrc8
         eCCg==
X-Forwarded-Encrypted: i=1; AJvYcCVAvekcY7bz4bEKjlsMZWg7nGXUqcxQqr9zGCmBzTb28f73GTYFcRiF2wAfGvPFhyZUKuddWxX/yye/@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsN4VOfMG6uCyXGQBbz2yVJ3z9XWonocOgN7nkT/sTIsENdfs
	64i0tigggVm2FHtdR63kOENx2JVx7RQjeMyQG/T22ssvCPPeFwznlS8+k5Ee7LgUPr4lpvRq+uA
	PCH1Jtus6eZmqVU9TPW4ES/b5XlFpplRy7BxJvQJhZWTXqoU6kFT366dFIA4yhgAn
X-Gm-Gg: AeBDievsQil3eiH028ckHhiAd2ruBObolKkylf+fzIntascYHb53CDs5ea0lQh2y2go
	0wjE3bddFFCgUHq15t20X1nbrAeL3wU6s5sZRD0hYqoRN+IKY0Xi/2aUcnOQxoEcg33StnPtDxB
	hnd3IhRtpfUWO1qU1fE4wURefXFhb8og6iQV7tA1v5ssRrcnsEOx7UKC8pXwOebGEmzQZcUnjo8
	YUtmr4d5sFGG4hudbVsR+R0RdRLHNgda23BIv7e9ALUtWLnjj5rouW2w/bPnZBdYwsABCXfAhbb
	wJ9KxoChQv4IJ+hWKmexm0zbRohowrbd9iQ1pVwYAStl7Gpnqb+7+vgwCzYof5L6//pbwjyQ9TN
	sMC/n0SYnTdFu7Tnzk+f+I75yMyy1LktN1YsamuI9JpWZBgMoFUAcjxrxHSdH9wdz4/4jhM0ODd
	Re9gqNnN0SZAntXUMsUp7O+3Mbdnc7kXVUE20=
X-Received: by 2002:ac8:7e96:0:b0:509:18f4:6dba with SMTP id d75a77b69052e-50dd5c06e71mr102667281cf.62.1775909467442;
        Sat, 11 Apr 2026 05:11:07 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:509:18f4:6dba with SMTP id d75a77b69052e-50dd5c06e71mr102666861cf.62.1775909467010;
        Sat, 11 Apr 2026 05:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:29 +0300
Subject: [PATCH v2 09/21] drm/panel: himax-hx8394: simplify hx8394_enable()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-9-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2523;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sQ69JX4wAjTsBAqHELNV+ZWRZ1CzDcUvy3hc2w/OnYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGx5D7SfiEpFn9bSt6u0trVc0NpzEB0RrJT
 OoQBzvFJPeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1RmHB/9JWCf8L9NIXCDO3qTECUMOtyzDdZesJ/yUw7Y4S4JTmwel0/+y0gWsS24gXFUBxJ1eq67
 d1bs+I6WfvYcOC5PfV0Mvl27DEIGf7RPfzpfUP4nbsXSPQLXTUr/B5WXgCmqDVEHYGgZ0r0qtBU
 jYdnAGyw+parb8dlbrYd7/eN7pZLijj+GKsOnAuyP0VdQDG4MZ83y/GTr0NidCEaYHSRaPL+P51
 Jm9TjZbTonJvXXziFuhhE4xm8IPQ08vyPK93IpR7k/jVNXR4wGZLjnPrXOEhb0AMsveota8uObC
 7AHuQYCutHkzCEqNPzFwHCoRcE/TAx7URRRgHTBYBGJouNll
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX+SVjFYnY3ZjU
 UsfhGH01XwGN8OSmwpW40ZR4XtYQ7eIvwTF3QKoQ223oMiyAUcGrnKV1uxVXCbdDWjTd8/6AhAW
 mSw4mn1NKTHC3zN34zihsYXuPA2/R/ZvkQRdqJYegG/RVMohNoaxoxAxAX7YJN8R9mKxs6087ia
 5UEMMYZzI/vXiNakArgFzANQGjJLlz8NWEPOXSyVIqDUi2ftKHXKw7FCpY/bIuuoO8LeFXhuSsc
 3i5cSYLIQ5ZqQKlmahfUosTMI6BQSpe/WvvcVfsJDikKpdzyGZI/dt/a1u+kiGV1+oePjerinJa
 aXz3LZj75JzicS/VfzXmf1KhzfItOVfsGvvXWCj/S+tHORUJhEQNEfu29rE8h+J1MEnpHY1ofQw
 gOqv00DoHrcZhnj7CQxWV+Smu8JS3zo0nfd/PkyzwtqbB7FOy09J2jnz3b4CbyUeIRYyKdrY0xw
 3J65pOSecH9FKpZEI/A==
X-Proofpoint-GUID: GV0unP3XPonGUfoTBsZrgWvqwrK0J_hg
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da3a5c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=jj6w_h7ptVUN3La3dRgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: GV0unP3XPonGUfoTBsZrgWvqwrK0J_hg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35039-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C2F9D3DFD2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify hx8394_enable() function by using hx8394_disable() instead of
open-coding it and mipi_dsi_msleep() instead of manual checks.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 41 ++++++++++--------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d64f3521eb15..1f23c50b6661 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -618,47 +618,34 @@ static const struct hx8394_panel_desc hl055fhav028c_desc = {
 	.init_sequence = hl055fhav028c_init_sequence,
 };
 
-static int hx8394_enable(struct drm_panel *panel)
+static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
-	int ret;
-
-	ctx->desc->init_sequence(&dsi_ctx);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	if (dsi_ctx.accum_err)
-		return dsi_ctx.accum_err;
-	/* Panel is operational 120 msec after reset */
-	msleep(120);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-	if (dsi_ctx.accum_err)
-		goto sleep_in;
-
-	return 0;
-
-sleep_in:
-	ret = dsi_ctx.accum_err;
-	dsi_ctx.accum_err = 0;
 
-	/* This will probably fail, but let's try orderly power off anyway. */
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
-static int hx8394_disable(struct drm_panel *panel)
+static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
+	ctx->desc->init_sequence(&dsi_ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	/* Panel is operational 120 msec after reset */
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		hx8394_disable(panel);
 
 	return dsi_ctx.accum_err;
 }

-- 
2.47.3


