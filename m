Return-Path: <linux-gpio+bounces-35106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFuyNA773GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:17:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 315523ED364
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86ED93090861
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F102A3DA7C3;
	Mon, 13 Apr 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puUlI4+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw5B0lDS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013F3D9DA3
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089165; cv=none; b=TkewD2ZOieerHqAQp2o+rXdYnwDtbGK4vvgSx3WVWdzWuYSiE7zOZXuyrfWSeCjZJDX111Q31MQnRx5JXRSYuNHWoqFBzZryOeYSi0A84RT/+dNpkF44mf955yM+wuFPK02ZloI59oXi+/eH6CqTJ3icLGWUfzdfhfHvLtNcHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089165; c=relaxed/simple;
	bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crnFMvDFoiu6vf3j0w7QJIzlau5QdN6f9GI3MUYStwgxCW5a7T2Q+tI4p46GlXXpfLZph1Jjhjq7KNUQzqyibC213pdElASvmKQs/hD2CiFKY+B5QlLuuTooWMHGtzxLNquYsXQP/Pp2ob1wK3c7MlyYeUkp7bzluWfdq+LDeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puUlI4+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw5B0lDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDvRQ43502347
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=; b=puUlI4+DX4qwGTH5
	RHMURzdt0Lpv1Sw2CFZE3g9NmPvy5smxeDnIavis57cNzhPLcBPhCNYFBmHxSjAf
	3+YG+omEAAdN8ulT34BlMfVwjB0FEHrnKEueZhCKn9MZndzL0e3AyvPbzBzOegA3
	c2uDGPE7hQOk7zY8/6lOH/XzosEKupk+17cfwQtG2fDhQ1Ob4d+MO6WqVM6PfS6E
	uCgaxmH0F3JnuojDEe0aaIgWJ5i7a8EiYG4VDdgunsQerY2xC8HJcb1VdjD6/96U
	v8yC5zdiKTJUdfkIiDIVgnPWKXrfvud/u6ibuMpKd63nWau3Jy2fo1hiFfz+ka/B
	gwxsqw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpd9wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:59 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-47545742e67so5444938b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089159; x=1776693959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=bw5B0lDS1BXBBxwYOyuWXdEmuIw9PK+KhpmGZWO+8OiF8kyS0X2uh9ERt0DNPrHJXY
         MvxKKJ36IuziKX96KsOPJzEoDmBNK6a2Y+Ruq5uAJCvNvYf+D8UZvaoKa/YlaiI20ZWI
         DOs8b2kdfqWrLx4taK8cpOqEPkHDi6eUgBnivI93K7gVl9vYm44TlorPCyUyUFhiSuim
         a097GiwbBu2olo/YviRifgrO35aHAi//B8pqhGHQh4t9K+5hxgUAu3mk7zqq0vBVm50T
         g5WqlBTGcwFjDTmPHMGF5aoyXh/kA7LeZzYGVEraKlImbVRRGAmxZcMJnn/Zp21MNcap
         YBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089159; x=1776693959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=l25xSehLNDppdLIhdodK9V84vPBq5M0rG849N2QFb+pWgevcmkjMdJHG5tas8hLEOM
         dlYtJ7j2TT7ZukLH2u5c1g0hW9OHSaRW6jx3Y2Q92RkUp4PZEB8o0NaVGM2Dimvdjy9+
         J13SeJr4CG/Uh3/X7hr85UexHvalvlKnYfspWjNx+v71QBfhWuChuokISd6XsAz+KK8w
         2EeJXiWfOqG0FLb8Y07gqVtnTZ3uJLeETK0p55Qoe1kFHM4mo9zAluXGxePV5ieTl6d2
         vBdq+HlYhKvQpw2WU6jhRbM2H0wu8To7WPWpEVlwWPULfxXhq3lfpsIGXvrf6ungM71V
         tekg==
X-Forwarded-Encrypted: i=1; AFNElJ+IyE0ETCEkfVgiaJ8S/OqpgKODTB6GzbKofpFCpW4Csmk2yVAqhyXF7ZbIzOOi9M5AR39Ur1PMeqDE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3IMvpBH/7HuOScv5P4nsnk+3Mv5Jak6uzfc9iuYeHHzsZ0bVe
	Ne47C6g8LurpMeqAb43AsYBrST+UX9wzFe7DhpChUYJMQma3zQuYVDEfZwpg30t95mvVK0TGJGA
	Hr91H2B8mqvEUDbe1Pu51JzX+cBuapof7HE8qy4VlVvURyXy9mrXMNfpFfn32OeA8
X-Gm-Gg: AeBDieuDJa2So6KieU/1dSMVxi/iYxdEAByL8JdfyXbaL02kGdtbYcWAoYeQkUDIQot
	Boz6Lt/uuOOnyoVbotPOYoc9Q1BYlusmwaDQqP3jfq4DOEt2EMh6Fqvk/0DfslvuG8ny5y3nH11
	1LYJeAM1qA77H7DcL96dK0tDIkcUbka52sz830sSP97LkkPyn2Zjp6IHKhg46EUDSpWWZ7r0WHQ
	IJppIf4XngfZohOAxeqp3KxOywq/V66iqVm36ArJJSjN7GZRiArSynNil5PVCY3HfFsEWdNYPSA
	JYV7cT3WHgydfN+RnIkM4yBj5Lzf08G5Mb/wGV8I3kS9bBrMrxf86Y6IRHowOa7UKWU/IbLpRoC
	beIBdtvwH+UYa4kyVmxFUU4Oa3HTQc3xHieHfOyJ9NhDwfKv/uyjrNnFZETmbv1rKaM1l4O2a3E
	oyiBzQsbJSja2jBwFVSLJ+/9cmGD3IfkGNamg=
X-Received: by 2002:a05:6808:e8b:b0:467:f36d:a08a with SMTP id 5614622812f47-4789ca3af45mr6286630b6e.5.1776089158722;
        Mon, 13 Apr 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a05:6808:e8b:b0:467:f36d:a08a with SMTP id 5614622812f47-4789ca3af45mr6286600b6e.5.1776089158117;
        Mon, 13 Apr 2026 07:05:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:34 +0300
Subject: [PATCH v3 11/21] drm/panel: jadard-jd9365da-h3: use
 drm_connector_helper_get_modes_fixed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-11-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+adH+pVL1xYlbIFuwo295yVeTVtlm5Yj1+raPRrAZF1w
 gaau890MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiEw9yMMzaLRsi+61Q0PWz
 0tkp+z5L+JnyNeosVTzJNcnfU2hFQZPp5yPlR2rrjlq/uvNfNF1089kJVr0/pskLlAu+qWHY4WN
 p+VK0V+Dyq4CiVntnoU6zhOWMpq8kmF8yHEsrOnN4trSfeuUVxvUf151LYc1aLm7SpnGZRUDElO
 Nh3IRdjee3TT34ZbPU1Fsfwo/ld6ibPuZSPRi7NHBZUWbJ5+xc/firnAbNcwN+lCW6OK/dsNmBZ
 ePh9/J7D90wD4y+ZBbD+iLKJ2vHxrvzcoNbGAN6DDJWPGLWlKzdyO58RtPz/KIVD9xeyLkZ+7Cd
 5FatTbIVZWRfnGAbu1yve/las8NHPBnc1HqnrjpleOgjAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcf847 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xve7C_kOZ5OF2CZn6hQA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: qKfKYkU29rPy6A5-Vipnhad2ZkmMPpGc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX413jLC3hKaNz
 c7mt+wN8Z8qHzNuqbjM9nqRN55kWmdhxOuKGoX8kO29ybJCZAnt7oCAnD40YFK3yUIhszf/VxVO
 1GYpqrOujy9yFfgwexZHT0i1TUT80kQildl4qkN8UXhC8Q6y2DXy4wKgb4CmmTZf43aEcb2ex2Z
 V6zuGE9QKCvlN/pFFdBloPVBEZ/V/mgWK9Z11cjPsR4fJINq+fPM7IVvWOHDKXhHsaTLO/wO7vB
 FjmdRlg0UrZDcHG8zADOS/rEaJQUDmdk5N/XSlAv6jQJ/IPfjc+JtT+HQb2VMs+FvvFVt7L0mmU
 MyLqCX7agUAi/jql2R87MyRfyWiyeaNgPhaJpOKWSH87tRqfu9RR10kYJTt+72wzutFr8FEx+H7
 gutmf4PShSp5hSxKJoNpwEjAVeybE7fjEkBIJNtdC51oPc11KR8Iwyxy2jSYwe6WB0k6PTa/Xct
 PU8j6kAwaJIbMEZWQlw==
X-Proofpoint-GUID: qKfKYkU29rPy6A5-Vipnhad2ZkmMPpGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35106-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 315523ED364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use existing helper instead of manually coding it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                    |  1 +
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 19 ++-----------------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d6863b28ddc5..ba527b4d7737 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -337,6 +337,7 @@ config DRM_PANEL_JADARD_JD9365DA_H3
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
 	help
 	  Say Y here if you want to enable support for Jadard JD9365DA-H3
 	  WXGA MIPI DSI panel. The panel support TFT dot matrix LCD with
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index c33c611e03c0..1884ad2404cd 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -12,6 +12,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
@@ -149,24 +150,8 @@ static int jadard_get_modes(struct drm_panel *panel,
 			    struct drm_connector *connector)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
-	const struct drm_display_mode *desc_mode = &jadard->desc->mode;
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
-	if (!mode) {
-		DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
-			      desc_mode->hdisplay, desc_mode->vdisplay,
-			      drm_mode_vrefresh(desc_mode));
-		return -ENOMEM;
-	}
-
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
 
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
 }
 
 static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)

-- 
2.47.3


