Return-Path: <linux-gpio+bounces-36358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGewOEda/GndOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:24:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8A4E5CD1
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6B4730836AE
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 09:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098903BADA0;
	Thu,  7 May 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbONzyc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ujf/UYrf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82039182D
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144512; cv=none; b=eXAED5bqbcwZZk4aLFYWX8+rrEbW3wAhxjItk3sPLS4vGeBZYpwSFcinGnnBG6++Gp0kxTIDEtmUAREvjU0IC1qfRs0JGaq+JpM/LOBawQu9NKoqCYR0TBBCS+bFzOuDSmg0zF+ipe2reWt5wjKVT/7aCrWz6Ns7iU2R7FzXrmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144512; c=relaxed/simple;
	bh=w48Zy9gh5QY1c+XBDez5fRMIM+TtMcaQ5hJ5uAZ3v3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acrcpX/h9gvLNx/D2jV96r4RqRXPF+qoZXucDzQxQZ0hjqV/MBJAOh8Z1o/zmYcUNEV/U1iOw9/BnsV+l1cpncS9bJ6yvkFrSZ3aggzO6u5kp+hc/Gp6V9nRUD+0oDW2UqX33lJxY9M9u12zQpuppKQaGI6dpCM5L65SisgUKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbONzyc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ujf/UYrf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475VAqK3925548
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRa6k2yGNWTv2u39mO+7rvnN9ZODp7GRurjicrpgf9w=; b=nbONzyc7Dl1xsX65
	raPyO7Bz2IFfjkNwR28WjPYmvQgkmo+qIxOfg/K8NEIr7YYkc6vD3Sc45qpVo9Qs
	hUylzDXmpM7Wyn7964ddUzOzQNpd2Cx+DnJkL/Udxda0rDEZBqmSpd7Ar8SeY5sa
	uvIdtiOC5y3aGkQj4WodVIVdGzvOGNxKIfGLrregX0nnmnaaGEQKlYxTOtqCg4DW
	dO2SseyCfJ+rMgyDvhON/iFeQB9WvS8oLBcg2ezuAO+rGIdsOgqN7VV82D84sPrV
	5iBeaXUSRFE1qOeHpe/mwSX7eomkP93YZqZaYTVNuihchgRQEr6jv+uSX3QMOWYl
	TErgiw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88abqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 09:01:45 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69996a2944dso1208902eaf.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144505; x=1778749305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRa6k2yGNWTv2u39mO+7rvnN9ZODp7GRurjicrpgf9w=;
        b=Ujf/UYrfnsVE6jKzdS/lNeRsgqiWv+uwmUXHdvkuDocCSWpQT+ug3v584UARqi7CUl
         kockesTxUBc93IOn3M7VOpOhjY+nQKzTfHWiHO15Ied30SoaQwCvUH7XVIfH4itQFPr1
         DXukEWomlwHIafIK3KSU0NwSF7uLbs003ZxjUgymZ6G2gFVoHpvM3y7BDmwdc1fJeTmC
         mJ/rvFKQiJlgCVPmy9UB0b7Qo/mkOb4HrRsPhCuCZVvL3V9SmEF6oc3V3/PlcKqEYjsS
         2Um+PDM1MaCcsjxekvf+jwQbWNHrj2Ans4cMbaSWl02fXebRiPTJ9bC3nPNoICB02RIV
         MU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144505; x=1778749305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRa6k2yGNWTv2u39mO+7rvnN9ZODp7GRurjicrpgf9w=;
        b=iAevUlrderrw3q531TXG4KHUuApdKcqfeUkg1zKaaCu4urQV6JRdYezUploA7fStKr
         Mkp0P+kl+WB4l60Lfp+OdKUDMmhUnvR/JCxkbqGk7y4xOpuGcVo29g82uIkRyDj3EAWv
         j+woq3V1johV5PZuO7Jh/MGZJ66UyLnSmzvQtBFBDY74HdhEIdb33Uuk73V0z4wP6bE1
         ERZz/wRPrpVchpTUjOaqZWGuQJ25ouoY4MuGfdP6k94mU1/WEFjeYZN2N9fD4sBOP+NW
         FH5RVG6czLWQKqaFTrVFByT9SE5aPIEVAxsZfsdVIig4DZ7r+cv5Qz0kC8u3pQ9aykwG
         stEw==
X-Forwarded-Encrypted: i=1; AFNElJ/4ZOPkHbEUS1vCGOJM1KfL5mr2B6yN/c0H0Osp4kFqg/jbbYHKsV+SrXpNZHwMDWlGiPB9ij9Nyy6L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4U7lg9JTN2GF6kNKYFYVnBePVwRgC1Bt7NVrAjtJLi23WTHTD
	/N0zqBB9q/QhVeAYVuMXKBLvlSTn1h1eVJSBko4EhNmZ5aT475wCXcvtAjKFV8OsDioQ8zsUECQ
	53++m3jzr8rKYpcjUdOzXWWLuZ5bUdvs50arz8LNKVLCrzvDJbhpGpf9YKWkkC5GN
X-Gm-Gg: AeBDieu5zIZM2Bwu1uyzeXPkkt9pmj3wa04+cxgucKCGqVtcC0fbB0AHq3mbbT7lx1l
	/cPmSaZ/dgg1os4vvs9Gh9XJ8cEfwRE2PoCUOojZXgfzWtQK9fzIeiNUiS6y8ukzQOONO1bGKaA
	qlXmEgHMkikr4UV3o9OA6PIJdH93aJNhzXimIfGqCAiEAFnuuf7JwRm7D+HMxHFyhp3o2/UOqy/
	Fh0H2x5TXxcBQlFzSy3JyRBUuto5G4mrvQi8w/sM4wcewYOd1tqeLpxqhw8lPEpFTxMr9hIwXOG
	/83kOylUqcvAvK33rm1drs2NKOUVyLFqWvGkIv/EQPIoWyo+uVvfevJq4Bfx4ePcyfuSd0NSHqB
	eM8slSQH7+M44HKJ4Ccwax8etbm4MP76bJdSIhZQFluqO2GggsFm3kAbrcpqsqc7n2huEuQy23i
	/OGqiw/QmH5WdwYpSfyEXZVxGkdBrTxLPrGEp95hLV5V84toCJp6Hhe+oO
X-Received: by 2002:a05:6820:1352:b0:696:2cb1:a019 with SMTP id 006d021491bc7-69998d0fc71mr3582173eaf.28.1778144504709;
        Thu, 07 May 2026 02:01:44 -0700 (PDT)
X-Received: by 2002:a05:6820:1352:b0:696:2cb1:a019 with SMTP id 006d021491bc7-69998d0fc71mr3582151eaf.28.1778144504236;
        Thu, 07 May 2026 02:01:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a870f96cb1sm3480516e87.22.2026.05.07.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:01:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 12:01:32 +0300
Subject: [PATCH v5 1/2] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-waveshare-dsi-touch-v5-1-d2ac7ccc22d4@oss.qualcomm.com>
References: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
In-Reply-To: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=w48Zy9gh5QY1c+XBDez5fRMIM+TtMcaQ5hJ5uAZ3v3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/FTuy7mfOfX5kl07Us/qpiAyzHwTLGyx9ydu7
 NTUppEPARqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafxU7gAKCRCLPIo+Aiko
 1fdWB/wPpnOVm0D7aCjD77DcG2BIksrTgqtu9mc4m1QefgIzAtXub3PGmjaGDderabja1f83ALp
 zo8EPN+tQ0rC+z0iODQc5GXSI9+tts3VhNMtFdsA6RD+zIy8TQhbOH+UQPKrih7HfahBpuOtaJu
 QLSuBephxSEjUKCXAKnVBk+XLwW2Z3qrr2hn0OcHcSftvkMCWOaaRnMADPaO3zOK3C+4h5QZp81
 DxAPUVe2/UnLBw5mbDUVNd1tzbOqwRCv/12pRB1/CZ6/QHVEaP8JaYAgTYdGYl4t3GXiuIAf1Yv
 fVOpqEJXCR9qr1WOCaratjm5n3XioAimdHG3GVbfk2gwfd0d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WiaOCyBACFbJcIKahuIdcdHsb19Uqib5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfX6hd/hd7J2UXS
 oFurRV3dTG7NHqc1LJoTvy+NREhwHzzR7oDSV5wWb4x6RnC6AfsiBoZaGP/tJQ40dmNZ+/g6+dA
 gE5aXiclVJKNR83klN4GeO169KIY8zjMdcmdWzQ1tkJn+GhJloodoT9sNBjme9NkKz9EeBZx8gQ
 eWd6aaw4IZNkzQ5C3LaOtxOEoUew32CbFncwRYpAw+1C3AyQ4keJhtgcGggUBVn6AB5HqGogU4D
 o82dLmxa9vACHeMIXpqW3rs5Q+h9FtcwAJBUtZ8SdICkNvr4vYuBe0WlAsCvUIyaLvkbYeuA+r5
 AvqhI/vdsRGjHME72frUh/4+iIKy5caGBxQ72FHwrGLjBx9fQqSZ+uKUeqFsMIJBGCROS7BloOt
 rmOGTle4cEpI8pO9i3WJUMZggLOGcgXbIA69LLcl5K23xhuzGXjsKxMcDn1oeJtmEVZHn5p7oRJ
 x+/Oh1ZNo/AaeuFEbRQ==
X-Proofpoint-GUID: WiaOCyBACFbJcIKahuIdcdHsb19Uqib5
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc54f9 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=btNYDYKGUqI20VIe7WUA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089
X-Rspamd-Queue-Id: 57A8A4E5CD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36358-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,microchip.com:email,0.0.0.45:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight.

Add bindings for these GPIO controllers. As overall integration might be
not very obvious (and it differs significantly from the bindings used by
the original drivers), provide complete example with the on-board
regulators and the DSI panel.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..091e1fffcd47
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/waveshare,dsi-touch-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare GPIO controller on DSI TOUCH panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Waveshare DSI TOUCH panel kits contain separate GPIO controller for toggling
+  power supplies and panel / touchscreen resets.
+
+properties:
+  compatible:
+    const: waveshare,dsi-touch-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wsgpio: gpio@45 {
+            compatible = "waveshare,dsi-touch-gpio";
+            reg = <0x45>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+    panel_avdd: regulator-panel-avdd {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-avdd";
+        gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_iovcc: regulator-panel-iovcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-iovcc";
+        gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_vcc: regulator-panel-vcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-vcc";
+        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+        regulator-always-on;
+    };
+...

-- 
2.47.3


