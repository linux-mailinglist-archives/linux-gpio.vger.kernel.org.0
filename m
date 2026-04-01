Return-Path: <linux-gpio+bounces-34529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJe/CZzKzGk9WwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:34:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79885375FA4
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9E713117DB5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C006937AA61;
	Wed,  1 Apr 2026 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFTt2puW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7CWC6qx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655165B1EB
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028403; cv=none; b=a7bXxrXmz8kdl6TUmHzaEocg4ThLnYXgq6vPyJ7FXvObFz19gKtzWvKNfhBYTBU0Z2jWT8S2bzVKjkbN+UzbmADN9OEB6k6hKXjlBtxUdkfO0/B7Nr/VhqsN+kQmj4PUVsHcS8UFsOYY7dBwsOtPyhMikhufvEIxdZ+oDP42Bfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028403; c=relaxed/simple;
	bh=uu9o8NADvdeOLd4A6s7eBAhwO4ogsE0lTg/OwWLwDas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YuOhn3eh5gMhezXOopFe8SNLO+g0+2vwYYD72LpuUyWuA+G02HPGzW8BCJiU9EN1QJ++HWHds0827AcLa9s/CU2vofG8lDcawfi80ddmQQmzn070Y06GCO1seY0BGJRjAxQszGvzg3zwbxrQ8saoSOTrTVmmUGn0mOuhooi+6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFTt2puW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7CWC6qx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Ccb83103857
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zx/6+DXla+EZMiXJy/SeCR
	kIOHRL6ZlK26xm52LAe2Q=; b=AFTt2puWDVAQAv+JjOfPfO/T+H00SM+SofdIAm
	s+IWJTp4TNSKDdAOTYfkCYJQPhmKq4gTOxPCjieCIthdxyp4zcQ0wcT5xbCoOEC+
	zy2uRY3CeUXbc3zNc+HZafZEd/65yc0CB+ejVa+Tw3lO1zGUFxMg4xs2lmdiJk4i
	q0XU+n2dSLUKZ0YBAefHogPz/T5uql4dUKQSwn1KSu+xUVLAENAsvxKl3AjOLggh
	EQi7fztYz7MO/BTnj9/4SdKX6aB47bPoRV+c62LoUhegN/soY7gSteHAJf9eVLA2
	dYCm73da68jgoak9Pv7Dd7isFcfGMIEA5J/3k7azd8lHFRpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js233d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50937cf66b5so336838561cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028400; x=1775633200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zx/6+DXla+EZMiXJy/SeCRkIOHRL6ZlK26xm52LAe2Q=;
        b=B7CWC6qxzcGpzaIkcgdogxsjNWnq0j7EeKXMc1EeA/yl1IoXQOfRAZAS0i74JYemdm
         05Dx6ByVbl/Q4blI1qvw/FgB90uaKdsj1apJxdWZ/2g+EBYTaT08Kx9zdAYaa6LNNH5c
         KmAteIlSaitajbdglSy4RVn84aWt5y72hTRfdHuLMc40hhJVnHPjE5aAMo/kCphVS/7f
         x8iZrqTjPxPJu/XhoynmLyYLmJreHMnGoKaVN3xP35foFRqnqvmi5jv1TQ4y03qCSzIR
         Lsnhb5oElane3dOCgcQZDO1sXqEgrwx6LkH3LqmvDDVN0uUl0vAA/IUUsQXTNTsCJNvT
         ikwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028400; x=1775633200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx/6+DXla+EZMiXJy/SeCRkIOHRL6ZlK26xm52LAe2Q=;
        b=snl75jZsfOcGnllHByxTCWT4eCKe+UCoF9R6mX6grm55k+/OCYTL5wl101zXhdcO8w
         DwT9vH6GA4r+9i0SFxe4Unord5hsU3wqln8utUE5zLDTxOs93nhJ1ZQjaK/N/8C/ho50
         DyrVrOS7XdoH9GehGobOYSH9Uq6jWId0On9ZlSwF+JeJv6j3j1bJUIIrJZvFg+Kc8ypz
         SLREoloaZZ+XKzQP+XUAa+34IsMgE/obM+U71dk8R+jPnA/amsWreFTvVtqxqztd2P4L
         FeHTD8GM8SY61R2kMPrzrb845pYNNKFOOLSApm0RusP6UqXekE9/R0KpVeZK2FwG9UgT
         K2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq1LKUdbXWuitwUboHk0DlDCiSACwnytrRcwg05TZtpGUMLZFqI6ThENtXMOzvbU6geIW+DWk8XDC1@vger.kernel.org
X-Gm-Message-State: AOJu0YxdODlt3Fjt6rg1dV5m/MC6f7kTQPd1vKav3hRcrhZ6Dv2RVRbW
	h2pj9f5mouQvXGZJnZByWaiYYfuCyQ2MuqvN9U8WBp8NPWGjSMUWhsNzlfCjYE1hQ+HTMG/mT2o
	+qoxfa71GXv7jl08cD9QhrKXz2fF5+2FIMLSkctIpgNWC+HAD/Uo9vfp+ds39lVz7
X-Gm-Gg: ATEYQzzf0LITEvgJGD57uaZMOtlSGRjYUBl1zYKdaDJ9yG1HdAijGJYulw8TWtEqZ7U
	eNQf8ZtcSQkuROzhIp/8JOA/51Q6tutDvm89X6lpZJD6BT3x6yCaI2S4/K2dN7iodTGEPKXMmLT
	i5SifQ2BpoNtBkSqaWYobIfizR+8gLq2fjAOTuBAXI8D35zU+gShv+A2cCcMtqCFbqrgb+zmQ7C
	YvHVPyMI7l7U72uo5Ria6z5Wukz1d9VhFDcE3CXFFeRYAjx7x4W4L7AFMD+2+Aylpi0o5zoprcx
	67LpRMVTl8lbemyjuyG+6Byu+x9RLVQ/Qn887HzeaD/Owm8lzIq/tFuOcFCA0IATIwwEJsyNsLi
	l4zfAdP/b0TicU5UnqF5yv8Y76H7L83MnBI/DOe6QQ9mzK8Us1ImU5ZybRmudtfyLYZZKORmA+w
	1VlXSBZNw1iyFSa3/2M5UcDI5InBDGgs7yQFs=
X-Received: by 2002:a05:622a:18a4:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50d3bc8cd7bmr35884601cf.35.1775028400353;
        Wed, 01 Apr 2026 00:26:40 -0700 (PDT)
X-Received: by 2002:a05:622a:18a4:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50d3bc8cd7bmr35884241cf.35.1775028399937;
        Wed, 01 Apr 2026 00:26:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/19] drm/panel: support Waveshare DSI TOUCH kits
Date: Wed, 01 Apr 2026 10:26:19 +0300
Message-Id: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvIzGkC/yXMywqDMBBG4VeRWXcgI6Lgq0gXafzTTBdaMl4K4
 rs3rctvcc5Bhqww6quDMjY1nacCuVUUkp+eYB2LqXZ16xonvPsNlnwGj6a8zGtIDOmk8xJjaBy
 V8p0R9fO/DvfLtj5eCMtvRef5BaR0hFN3AAAA
X-Change-ID: 20260401-waveshare-dsi-touch-e1717a1ffc40
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uu9o8NADvdeOLd4A6s7eBAhwO4ogsE0lTg/OwWLwDas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMiq4WFJ8Dxjp+4X36YIJ0NK5WmevadjdTtez
 mPpKMNySpmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqgAKCRCLPIo+Aiko
 1XN9B/sFhT31k096LM2EitmHCAK6iB+rQZ9+q+KIbQlE7eMcVgUawYSfZXcEWHZat9vqjZXG85X
 Im1vKtAv/D+u8I/Piox9p1Y1hpQj17t9E9vxt2DA+EsaFEu0/vgO5iZTAP3PT8GvULu49//KhtN
 U6ygVHhWqZ0jEqQl35w6xelxdiVVpFWrfqCUN7SpLCf4vLQe5tEV9aQccPjBAeiUEwhnx3MUlv6
 lMY70G2cq0BqoNwlO2ZDr1Bt29wqCYXy7V4stL+X6k7F2ha5WdLvVa+Hc7yKD4kd75fTr0UPVLg
 0R0feqyLQypesJK0gdmRUym9YzNhFopyPvP5oY7tJvOTj/G+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: YbbjXjWOgaGcHVnO218G4kRwE3EFv3cL
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccc8b1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oOvrkLZsNLQ3oAnAngEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX0xW1Aro0OUdj
 hkLFHMdfBPA6AVRtLbRBktAu1uqoeAJIrWKC51Gk+xPEOCf8n0nRkI8p+POfoj7k48PM/3itpf6
 KqEPdN5V/E/2J/4cDiXbTS8Z3/tMx/372Ax5IVLGfbnDG6HULeakHdoeI9yZC4yVihv7jCG5Nga
 Pto1B5xlmydtCdVVBQ2wze/xwOd7YxC2yMehgC973bSMI1naHVNElMvNiQl3jcgOnN2XsOEcpZM
 uUSocqJ6+Q9p7pGxwgA+/RJSCRpMNM3DfMz8SCyNDOP8WA34V3q7ELoPr0PQDRpHLayDWFmGEYS
 3lf2MmsIuYfUDE2FXkf3igBNhvb/m34LU/DBwFF6QVFENGs0IlAIYIZFMvpRstBSD5x3audydEc
 8N8yzqu2C37xNmb5zKHH/8ug/7J7KVj01bqyOBMP3gA63B3pChp3/DVQbGjZ3+KQODYYrz0oDvK
 FcyI4sV3ekiRgEiA8MQ==
X-Proofpoint-GUID: YbbjXjWOgaGcHVnO218G4kRwE3EFv3cL
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34529-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 79885375FA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (19):
      dt-bindings: display/panel: himax,hx83102: describe Waveshare panel
      dt-bindings: display/panel: himax,hx8394: describe Waveshare panel
      dt-bindings: display/panel: jadard,jd9365da-h3: describe Waveshare panel
      dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
      dt-bindings: dipslay/panel: describe panels using Focaltech OTA7290B
      drm/of: add helper to count data-lanes on a remote endpoint
      drm/panel: himax-hx83102: support Waveshare 12.3" DSI panel
      drm/panel: himax-hx8394: set prepare_prev_first
      drm/panel: himax-hx8394: simplify hx8394_enable()
      drm/panel: himax-hx8394: support Waveshare DSI panels
      drm/panel: jadard-jd9365da-h3: use drm_connector_helper_get_modes_fixed
      drm/panel: jadard-jd9365da-h3: support variable DSI configuration
      drm/panel: jadard-jd9365da-h3: set prepare_prev_first
      drm/panel: jadard-jd9365da-h3: support Waveshare DSI panels
      drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
      drm/panel: add devm_drm_panel_add() helper
      drm/panel: add driver for Waveshare 8.8" DSI TOUCH-A panel
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

 .../bindings/display/panel/focaltech,ota7290b.yaml |   70 +
 .../bindings/display/panel/himax,hx83102.yaml      |    2 +
 .../bindings/display/panel/himax,hx8394.yaml       |    2 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    2 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |    6 +
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    |  100 ++
 drivers/gpio/Kconfig                               |   10 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-waveshare-dsi.c                  |  220 +++
 drivers/gpu/drm/drm_of.c                           |   34 +
 drivers/gpu/drm/drm_panel.c                        |   23 +
 drivers/gpu/drm/panel/Kconfig                      |   13 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-focaltech-ota7290b.c   |  208 +++
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  144 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  279 +++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  251 +++-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 1563 ++++++++++++++++++--
 include/drm/drm_of.h                               |   13 +
 include/drm/drm_panel.h                            |    1 +
 20 files changed, 2813 insertions(+), 130 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry


