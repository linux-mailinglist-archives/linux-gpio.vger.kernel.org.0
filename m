Return-Path: <linux-gpio+bounces-35103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOKqF+/43GnLYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:08:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D903ED0DE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19B6A3034A22
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F103D88E3;
	Mon, 13 Apr 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYFzsybg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6cd32L4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40743D7D71
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089156; cv=none; b=K2XXZSZ8/ms/UzxZDMAg8hTIbOfmdUXQjx1jsTHhDO5nFBvplWfmLyL2c7tuVWyD6KXknyKDrelnjfbHMy/ERgi/6mqgB+wmAfc4NJcGjXK9MLl87BCmBSz2ZVGs60V8B8fzeej6WgUQr601xU53oH6fubhdLThaZrCxI7ccKMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089156; c=relaxed/simple;
	bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTa62IQIHn+8rbQGtjej/8WfqDWoD56yJGw8hkLsAUYbDEmYb5lLqnjQQg/+S6ECec3OV45ebELNLc+jXsm+uCnG43f5TMy2OMi7O4FXg96aBohndn+K990hx5DlFuFb/8wwkpHDi5BMWXAr3vI9UKfKFKWr43cxMkauFEZgiu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYFzsybg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6cd32L4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZSB23990269
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=; b=YYFzsybgKNPrvJTp
	5QTY6XU6xJbyYcZi2la+y5A/nzC8IurfThkGTG76iSEsCD1i6ef2iVc2Thx9ZQ//
	Ab7eFPy8Io8+/Rwr+Dx3TMTjGssvVjtzok5DnbiyzzmmBX4OYrJXca6bRykELa2L
	LJaxXdJbzta0AEMMRp9fVYYMKPNNMrvl8dq1xTqfz4a7W3FEq2U0HHLs1jPnZGkl
	+rudsyXpPEGx0Q0qlYn+p7WNAlLNv8a+p11d0PaWDlezv4SqeZTnrlxTIo3pK7tg
	qEvRLAj6dXifnS9tLe5AOC9x2t2uoAFI4QGibKpxK75iV/HqdVxZAVyPLDB5TMpW
	240LEA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfrcha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:50 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-42322062cf3so5833945fac.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089150; x=1776693950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=J6cd32L484b7bLV6acc69RVkzIkVRGSnBfiNz4RHgtG92v9Z9/hRmiDIgGdmJcoQND
         CyWIfVodmpKsD9Y/ANsrT4r5O1jQgvcbeLl0XX2cMCX/tP+oDHKlOXiRdijkYUCPGMuz
         busiI32gBjluuRWLvPcDCadgUdFrUiqbsCDew2MDzc9TaefH35/qOImo8iTZ/qRti8la
         hJ7kLimXxNh/eMBuXm4+TPdiB5GEX1bmtRFD8BOUJjD1mp8aKbyhcmshRSRCgjKy9ZBU
         0ucCySWeRnGdtnoCAAX8GbWU4IOcC8keJYush3rW9Sdy/arg/Uo9np1+P6CskHFxhwxn
         +OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089150; x=1776693950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=rC+UaE2+dWVBOnY2Ol7+nkf65jw5tdsEqqhzm1/mdsgwopo2mnsrdBJ5B6t1AoKJv7
         LaA8ccxbjmc8DLyMpHLVTgy3vw34A2rqqxE1myiCbA1nv/d2Yclc6sNuMoD35GGZHk2p
         Zqokf4h44beQSsnMdDE/ztKWAxiShEeg24VNbWnWx/tecpOlEjcWoMAMfZbpmiciPFC1
         66jOxQtUhfbQcpccgDsRA2HESzpWED73x58MCYdr4/DDGfL0YCsM4ED6cLdCbQxFkqxu
         wyVVyswH5GmYWTsvqNw0KdjsSLo4dHQkRwnBU7Qe9zzv4aRTLbR8P2WkGUOk8ubDhI5i
         hzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sWLQ/tu/dvw3ZcS5V+PWuI7NLKsOvo7/YI7sPp95hI21QPq84AyPsyae2ZGfd2l6Heuz1HAHNNTqe@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbRlXTxGNTXgW6AxEyjhjiq3y2l8cnqNgoUdXFGnaBoeRVHoM
	y7V44jdKfI6serm/0qSvNRjpqvb3DIyot5v506Zb4hiBt87DAdPVrDxovdWF2RPuUDmvjjL0bp2
	nPULcd7z1aiFjGAy+EAQil5GJmb0GXW+5F13Z7k9MkHwFiR0yJBprXVrTuDT5ohpJ
X-Gm-Gg: AeBDieskX/d48xlCqzraBLgFZ7TZldnysQf5zAyTxo1peUqU2CuchoPc5SrRLMjidx9
	33Tq01IKXUaBlkvg79T9HWGEt+k0w4/rCt7Kh6X7hFMcWYsIzE26Ll2c85C55BTBONxVvKDuWY8
	Tt1eTemdUnzDkgP7eoy5qUkG0Ngq9hW/tjZxnVmc+OZ9yfUu14eSqy2/LPOGfc4WtyLjWJyMWuR
	mgYzi6UXN4JUGpeSurktREMcb0S3D1cMiyjxpa05U2Rew9F3zxLG1oftQYck1V8/AWFIewQE4n7
	X66Zx85jcEszQqfkzomY4C63LfS7jwcgX2QX21o4c/zkLCW/JiGJnCiFoNBOK6qZZH4jzMdXeEH
	BVWz7thbJuHDSW2bRmzE0VjbEQHnP9kql+SwWAKl6sQ0Kl7bYXch3xCDsjIgonwZ/5y44qjEIKk
	QaHYILBi1CnZRATDmGEZZ8KkMgB9ADyO1Ep4E=
X-Received: by 2002:a05:6808:4f29:b0:467:fb9b:9818 with SMTP id 5614622812f47-478a0f18fddmr6046754b6e.40.1776089150300;
        Mon, 13 Apr 2026 07:05:50 -0700 (PDT)
X-Received: by 2002:a05:6808:4f29:b0:467:fb9b:9818 with SMTP id 5614622812f47-478a0f18fddmr6046700b6e.40.1776089149735;
        Mon, 13 Apr 2026 07:05:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:31 +0300
Subject: [PATCH v3 08/21] drm/panel: himax-hx8394: set prepare_prev_first
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-8-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgn18hIWmMRBJH77hbN0nEy2AN7HiG9Wx+pK
 kM48SmCVmmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1d4PB/43iCoGV/XPHUY+LTdEOriQxtRXRqWo0WE7dOyI1sgHpDIIc5Xb4xOmgDn9sQaqDo7hYnM
 Mu0SIMUpakh6NGnaA+3O4SqgzeZBufPT9R30GGkHmqx2G5UBf9uxemus2YKiTbKuHfwP4KliY5I
 hutN7+y7vsN4vTfDhK5Fwq3fM3vATeevkRefyzcKASTSWuNdfme6f0obHPK4mirZVJT+vFLT03v
 aJsE14N5TLnnRuMxJTUdhsdpvlIDlrfUOB0NYk5B8zUyF8faTHrbMtEMG2rO1mBIFv+uj3frVym
 Y2IZ1jPuAJXj21WzV1dHtNWQsXiCLbHZ/q0Hsw4xsRd/YVOK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WMByFsV-4nTZ9dIhYVOInbNTkYPFJ1O2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX9Wtkq+wjpuBI
 4ZkJ+xfAXt+1jdm6qBN7mKhmRoPfO8Rr7R3S1C82skfKRZ0S64ZCrw8oVXfEEbHK82JjFK9m+cd
 Xk7XjCKLGL5SCTO1f2DHUkzysK+WOv9Zn28qgOhwbzoI/DkperYGAaxNgejv7CyxJf9UppfqTBh
 /wpddxt0UohhsiarimDJ1hQK1DgM9HJ6nid6RJFQ7k404+9+fl0WB44ftME2liZoqx80wuOa1ND
 NjL2dIQqgnQUGiDN051jrNwUSdsvKo3MPbD5Q4QGk0f+wi7xymJdPJ+vevxww2+eVwVLGC8rd6X
 NKX+sF6g4aV1WsUPZF99Wp2yr7IeF3MgZI+687fL5L3U6RiZVWVXdpKUaARak1Lq5Ei0t+vzULx
 8SLuUXvdmyulq1c7eDxDhDUQuwYkkTZzEKWl5IWpd954n8XCsRy4CfS54jpcCUJb5/YBBgpGpay
 C1CfbJooJE7fjjlnc9A==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dcf83e cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: WMByFsV-4nTZ9dIhYVOInbNTkYPFJ1O2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35103-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: C6D903ED0DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c4d3e09a228d..d64f3521eb15 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -792,6 +792,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.47.3


