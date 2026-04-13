Return-Path: <linux-gpio+bounces-35097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEqtD1X43GnLYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:06:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A494B3ECFC3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55ACE301858A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A243D565F;
	Mon, 13 Apr 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWFSDb+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIcSjBWE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C63D3CF5
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089142; cv=none; b=TyXosv8Frion7YPdo+5G1COsf+47dMTAfv7ioByHmTFHG9eDicQcEMNzjEZqrg8gRm9FL0GofQFh1GdgLA2v7tY2KrC/ijUUq2+PlC9yr0275beQn+8GEILT1miBABVKzmnPT8VlecKMTYDtZZTnELR9+WFn7NN/ldgzcqaYLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089142; c=relaxed/simple;
	bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nN4X73psNEEkH//3LH1OMFlHXkOswZ5Tsu0E+gh6xFvixaHk9WUU1W8fGpmHQeD6KzXwpgrcJAIGMvbfs8JkvGCv2VyBGS6KraKD3HXjkc0yUDL/TYGe01h7H1PMPzIzwHw8cr4+XBvtPZovgxTjHzjTdXoPUxuFLU+ri00JJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWFSDb+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIcSjBWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCadjY2782267
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=; b=PWFSDb+59IiXJL3Y
	Dd3+l2neFoQ+LBWhsNZ5z8zvVuvKa42FFYMzza32bbeBaVmVIrjt0hAvtOSDkzKz
	oMdSeSnvQWkLG0n0tLkPpUjvsh4+TrNBMpCm63pn22Q14U9XZGboTpexQDU+S0Gm
	BFpxERNMc0yQBvLVwcWGMvzNGBL3klGUNuZk4s7McYJODLlAzZj+A7eJotoH0k6T
	xrtF5jAiUpB0hzOmDpDODIP1SsY0ZlEyKGpL0dybA6z5B0C/UurQHgSZrKpQqsjm
	RoOhvbxSMOAou9ax3HQ0dtbf5Kdf/w16Ux1ywxWHb/j3C+QG2l4joeZ4etqGLtyT
	g1p6qQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpd9uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:37 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45a8cdc7e01so5307656b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089137; x=1776693937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=QIcSjBWE3zOq0XdC4Vh2TdAu+bSf/qGS3WsY2yV9Wp02qt16plIR0CUYHtAMnaxDNH
         ogn+kJuMtPT9ZVkRoCsuxVo9dKWcuNR6FIt3CJn4ax3NU4jlVqGUQn68hP+WCQjy4x2o
         5bx3ZsB26eypBzu3ZKirbvDIY1kp7QU56Uy1mDpr2Kdn4+8XboiAGZ7/8HaL4pPrzJ14
         GfK2fKd08sTtRrMMtaVtif7SOtKVEtJVVkZYFC0fGEi2jjZB+G0jOVITWgtQzHngcmhg
         8CvwVpBD1WicFnhbt1Dog7NmMFT3KSan+Jn8Tu0cf6aLxJ5nIBYhkwFxU6jsEUHrf9k8
         vRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089137; x=1776693937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=Gnw/nQElSImrs/QSGLcablj6zPu6Y354ckbSIb/h6ArClWkw+pFHYOjYlgQa18tx+r
         CYiK6vnLd9hlinsa4DVE8UEAE/KqFG7xF/W7Fe7vTgUFRXDMuZF1hKIXyVJ7UWAcgfrC
         m5DXWPKexrC6eELaaHo7lZ3mZOOqvqE8xte0lUd8b5wk9ykrGRk8m8Wp9fqwelsdEsM9
         QBc5Upc9rk8Ft0p8C7KHihJi1rYTCdCRQI9AkCymS/8Tpwb+q/dl7RG5H4z9KOQa8DOF
         8xo0EQygspC9upAWkkhXBl/1uXKXL7HJKFLlavZZBO+RDoSgjgZa1+eZBkq1rCc5mcGT
         wF4A==
X-Forwarded-Encrypted: i=1; AFNElJ9sEeRzexlr//qOpLefIryPxcumgD6j18drBmKt5XsS1RmmgGiWpkEe43dT8Dyf1IjO+oWTbzhU9K5/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vzfOWzlBaCJfu58W5pReK8FMkORNcb4fHGoTfZ99goS69pfK
	T6UxS5x73WKdtlX/2tsiZxvTXy6X+lJ8S2Qtue/Dhuhd2iEFJE6r4nixhRSN+QfaEIarhkv/u9Z
	4VRZdGN2nXeVqSbdUH175YqGneVdHSLgdYRd5AxZyvB0yRyQWn/7uWK5mS0Odtj/k
X-Gm-Gg: AeBDieu9eB58KFooRmVkwyYhb+l2Ko39Sk+lsRxttFgC2dCoJ8heW56Adfnlm3exHQW
	8AkJpTIpHgiuR7VexL52hVVpYZSPrGLXVdNsDzzOr9dZOZwfob0AaZ1nUg5FGc0+2C1JbQCcvj/
	0tyUgVosMXGNfrR5FdhGN4rEirqTDJOHhy7o/r2bvPgykak9DSHYuNV/EwY6cS9KfFdrd94L19P
	DK+aSD3yMLq+GIf9LWZN9LUec1zZmdUbikMf+C1L9QD/a1LZqI5M/bhvEerfpvomD/uTSchvAdM
	r+q23HNhZLzvk10ljt86jMc5plQCpfusMsJpojPB3vIeTZjfFOe3sjvcSW/h3vcD5DOipqjaIPs
	O6bEeQfOwzJHvQ6cFdtuAgvLd9l0SD203p8PYPygVwW6LUSaLv6Y6AVcjlGu3+aEG93btGDDGNE
	uGnJ+Gj66BK1eZYfa9x+3h26K7qg2XFL2v7fw=
X-Received: by 2002:a05:6808:518e:b0:462:aa0f:4375 with SMTP id 5614622812f47-4789f20b19fmr6692757b6e.39.1776089136953;
        Mon, 13 Apr 2026 07:05:36 -0700 (PDT)
X-Received: by 2002:a05:6808:518e:b0:462:aa0f:4375 with SMTP id 5614622812f47-4789f20b19fmr6692695b6e.39.1776089136463;
        Mon, 13 Apr 2026 07:05:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:25 +0300
Subject: [PATCH v3 02/21] dt-bindings: display/panel: himax,hx8394:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-2-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmIKJDbaJv9dSV7hV2tc76PBOML/r0GSj5F
 qL/vUHV8LeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1SbGB/4hfXLcVYqX7VE6XHazXmPGrasJ6tcL/wypAthBWUhjrNl8jBb9lv1J0jFmAEgng9lmMBd
 8KVdC8F9BGVazj8lT3khDUMphrSzH2xrUA7R0MB5isGInE2HiTfU7l0LcFKmP6Pf2mvy3mc7A4V
 cKipRgxdl/zKgz1+Be1tuUrU2H+JIhNCPqWn2CmpzgS9Sc5HcHmPqjLuzsQ+AGhSqba2hTB2Ui9
 p7vRCWHjyehi6qr5QeTcpc/7lPDPVxkOXKG3q4GSc/x0LR6jYpX+dglMPz3ZT7T2mcTR+erOfZy
 YB6TqxW0NdPMw+54/yqGruhCmcFR79yIZqnfJB6LV/DP4lVE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcf831 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0AHfZW8JlnlOAyLNbMwA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: 9CWXeK8qzU29V-HjUhMC-E6lY-3oPI_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX4OicRiSJJAJc
 pVXaEZDpzEqoXTWK2ZHdJxlcM/ja7HlM7u2r9uCHZ4CoHh6V9WnZoECtPEhGVadOUU3SNAVl///
 SFg6L7nC/6gFNesEzPFOkYTkDX4WZVQXyepzR1CNur2Ebb7yerbUcarbGFG6DHDWgazTdRx0rrl
 Mtsrt8cptCIzkwtoAixUB3+M53UXwjniOfe9+ga7JLSN8Cv/MqSU2tPskpdOsVn5ZZMUnTSz7MN
 sDydNAC6uiq4/S0HennpQkFtZ0PMk+1O9QHCFSUg73i0p2KEjRjPP7J0r0K4N6X948syzmeseRG
 MR1Xjq4N+6FuG0ml/KDDvO+iN3NCSI7ELu9LkNUK4ImHkohBxkVXoujmAlxNzO8+Tto+U6CVJ0h
 YEf5osual3XCeM8dXiBdi57Dx0JXi8ZcQllCQr0KpVXq+MvIYiMuSc8f0AEl2S60xzYGwmlJHeG
 m/DnLOLBoRQ5aX4yRcg==
X-Proofpoint-GUID: 9CWXeK8qzU29V-HjUhMC-E6lY-3oPI_i
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35097-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
X-Rspamd-Queue-Id: A494B3ECFC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 84e840e0224f..83c343b02835 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,8 @@ properties:
               - hannstar,hsd060bhw4
               - microchip,ac40t08a-mipi-panel
               - powkiddy,x55-panel
+              - waveshare,5.0-dsi-touch-a
+              - waveshare,5.5-dsi-touch-a
           - const: himax,hx8394
       - items:
           - enum:

-- 
2.47.3


