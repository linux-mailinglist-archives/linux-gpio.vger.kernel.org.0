Return-Path: <linux-gpio+bounces-34541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5LFLH7zJzGktWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:31:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B882375EC6
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1877C306A33F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9756C385505;
	Wed,  1 Apr 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ib2/N/vI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TylwJDIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A138384255
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028430; cv=none; b=Q44lNMQPyVHdte9+T4nmbQAKG4cOctf0l2UReCpo7i0RSFT31MnvdrvGDVUgemGET1vVCklCd9XZYxsSFsCAjLgtLO8ghwlRFdaXShEJawonsly0T1/DY9bP6W0716aLuF4mzQCfGWPTXDEdawWxx5ssmRK8S0gVGNoFCPUoV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028430; c=relaxed/simple;
	bh=Jb08fm0uAjy2z0dtmhiX4xlViALafz8SI/Bl5/q0t+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghtNRpjdW9u3NGdVf7KDFaK4S9e2jPuaWBDd6ofKBGxPM4v988rvVrkumCYCspQqOUOI8xe99fLw/B4Ikzs8y4dBkdwkc73PJ1xv5xreD0NT74P7HQwApdT8b9lPXCRC4C2F2uygw5kbPH2Oggme6CXKTtQOR7DHhoEhCokL0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ib2/N/vI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TylwJDIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317F1d84106992
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXKe+OsCdQHPE3k51l74ZUAGKqzcezMcZ3x+/awxYVE=; b=Ib2/N/vICySJHft6
	DPp4OLoOVWXGFAjYxdeQLs/Q1/n2rDeknq0CC8uM6e5TB0ExEPuPK6YDrg7NHO7w
	EtYPnN+Emkpw7tmSCXR2tlv1eLGYIzFYC4fXoOU5vy93A8+6TuZVAzspLyhU7P2S
	hKxevVoGyPnDI94N5y3pT+b5rSSgvhJh0AY9rdmrsru41lWZpTIIDKNwjLxNr+jD
	q+EWiRMP3XazH0zAOsIGmSn5AcnROBmTUCakdwh1q19FZjKLzjPDQI1Zj/+mvObI
	nLsff0vnNDqMRSJHcu1LmueUNyfiRCuO6Du+Petpgko1xwWLhMXP9Buqzelzd+ty
	QbM9xw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509070bda13so17505511cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028427; x=1775633227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXKe+OsCdQHPE3k51l74ZUAGKqzcezMcZ3x+/awxYVE=;
        b=TylwJDIfQw4hrNInlKUvRMrXxPhBx2YaRDl4QxdejFgmC79/RVbCRSZRJP/vPD/l4g
         Q8Wk/4wyMTebjxtWV4cGeN0mXc9pb60rnVgEzE4yx1u7PaFi8XCl7KIEHaTBtSdlQSqv
         K8J6o5xQZGrEUu0NFvKvMQJfpO9EnuWoxive185/Bwtuw3w9UTgkv8bgp5IVz291279O
         2iU7NI88a/jZA3vOLAEOhqJhzdolTiDmFzEDv9tsF3ZtbNm70zFhpAetQ+I2r0G4GhjF
         LDJA/dBa3btSoeu8bbGHicKORgZLXv55MP+xfdSfL5T5c10gf8RBTDgGMsX85WM6o3JK
         tpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028427; x=1775633227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jXKe+OsCdQHPE3k51l74ZUAGKqzcezMcZ3x+/awxYVE=;
        b=mo0hl+8v0XVZvTuqM5fSCTY4Gz2xv0QNU8BbUKD0O5rl6NQtMjEO9FyWGXTEjFVUKJ
         tt1BmqAWNvMGEPiA0q1ghweUw2hjNfqWHeYdtq0KbUrmkh8CzPiQm/v1e0NBVrd2hqYE
         H0KB8HM7Rd6l4zzlBxj/NcBuJKsRYfw1gy9+i5SBj0jE+a6QlEpD6bOSETXo+c0Ynd2h
         x5KcfCRUMGWp9tWn6FbG+8+lPAK2qgy3d20sp8yhYCnD2goKW5HoQrTs7zrgLZ0TdMaE
         2w9ClcPVevlKyVNV5oOUnSNlQ+mV+QlYpRbZxTJsEGd9DAv8AlBxHUg49LlZ7wXVSZWg
         LWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8um8ESsD+7OYtFBEfM2uIHWJQGPBh6f8S/HAGZwduvm9ZRAuREPd5m6tTz0MT6yqsn4UMhnhZ66Pp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YLj3oGtvWTjm3UX1sTACrRyDpD7EZNLq91gE3WrDvsMD2qfx
	WsmROCMVtoqCnZw67kGzQ9sfETWM6eTSTYSnaeqDVyKthrFOaySDLlmWwtdKons5zto7UAHakf0
	PNGSPlSklbauLrE92iCe1JrHCwVBPHfxLNwbCLxZO4sti3ib8vK1oADD6xKSwcH+1
X-Gm-Gg: ATEYQzxl5/mIk+5BfsrmqGgVyIWtnfzDt/MvJtxOzzw8gRgoDmgRGoAmJ8EUMzGbemZ
	rP1OQmok+DHpObCs1fRKbviaTUZ/1oBKU1oKtzRR5VRWcnRQAkaztcEpgGskjGuYzcBEHpSDjgi
	mbUYVy+JHrIjPOWd/E7auq2cSEaRlQl5IkysjhBkLDE9/3Wp0mIlxvQUSjSBs0WRGJkYdrDfR/s
	/UVQh1/Sl51q1Uylpx2mhIN2Ezk5+EkTGcVtbXGWZutitWVjPT4ghQhq/xuZStZBxT+aUnbmPzE
	Zf0Et3tC5PejtjxPTGryk/hOqrUb+xchz4EPlqm+GAgqw+Z0vRwhQsyFbJw4yHJlzoX80sOb1DN
	oXQjTdMT0WK51fkJuTTVXdB2QwVb5hXmKwvKCpYUwA0fLfvoozyaUDsek7sNQ68cwafTkkb02WF
	ze739jpWC5ziltpNahjyJJBX+vWhczttSgRaE=
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr62318821cf.3.1775028427589;
        Wed, 01 Apr 2026 00:27:07 -0700 (PDT)
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr62318551cf.3.1775028427210;
        Wed, 01 Apr 2026 00:27:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:32 +0300
Subject: [PATCH 13/19] drm/panel: jadard-jd9365da-h3: set
 prepare_prev_first
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jb08fm0uAjy2z0dtmhiX4xlViALafz8SI/Bl5/q0t+Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aZE2v3XClYbuEo9EL3Uo3ljZ9ilmsXctuum+ySvvOWt
 3t3drhAJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8oeB/Q9/5TS9k4oHQ30M
 0x9lH5nk0sioV1018Zy9Z8YaaYaHLPNcmxlW9Nmcf9TZe7MoLOWoWp6Ewp/MFQahfax/rxcJKba
 ccDNx7V7McCEtymDZ937RqJ/V0/SFP178kcrCtjjj7BQu3cZHPHlB68/9TtSXZgtYbLKgylFbrW
 rVnh3NxrV8vK77J115zL7+Y6Pep11WLkwzI4MzL0px9bekC283++tzYItDduiTPv7vu5KYzpWmv
 1pr/mzdPl99thK2lC/tuTJP7hd7PduYWuTHm8MoXFdVpbK2i9Fg3Z7wgB9KL2ROOmcFzdhfaxJ3
 Y+e6DUaWv6K9mTpF69gDY37euvzq8Z+zmfEWrVX8U8sA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gbyw2FCM-qSf_u3ppogd2WGs9EWh073j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXydpBC8rBDabV
 rO9YEV0yLF0yMLDFh/u5cjW3VMjMQelZD6HyzTS78rih4xgviYSky//GEyW+VgMRP+teJN5k03Z
 zlQIWp0rkBtXkAk2yvbdVfeu2zSVkjbjOnoR+cdo1nKicwGaAas9EdlFo61PvoolMaLcDXuuraZ
 6VhGz8sCHCt+yEgQmMW4EEyBGwhb4+rP/aZZSWvUNseae/rfu/eW2AxEqGvEE4pBY3LZ5GTmXy9
 4XwMReFVQtvKS+JKYeIVkRJSz5TKGzOzmXtpeOEWUrKlFVh/kZMCheGVa8YGla8BjfMiep5YWW0
 FI/VPbCVfTwPy75vuJV3396uatuhWGrRikZelMp/qsJxjDWUWBiFjwmqoIAptQaBnY0bldeQql8
 9QREDlRJgJwWNiOE+I9x2zkaWXyFe077sXRGa36+Q2gzZ8SD88dYc58jp6xeuEZ9zJeOLhqL7oM
 7XdKbvsQRWCGFlDGl/Q==
X-Proofpoint-ORIG-GUID: gbyw2FCM-qSf_u3ppogd2WGs9EWh073j
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8cc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cd2vOsepvhAVWqutC0UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34541-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B882375EC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5d9db2e1f28f..11b7e07c1af8 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1652,6 +1652,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	jadard->panel.prepare_prev_first = true;
+
 	drm_panel_add(&jadard->panel);
 
 	mipi_dsi_set_drvdata(dsi, jadard);

-- 
2.47.3


