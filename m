Return-Path: <linux-gpio+bounces-34539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD8WEpLMzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:43:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D773762EC
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63B8313CB92
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6211383C9F;
	Wed,  1 Apr 2026 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWSYUkAu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLLOcoex"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822C37F757
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028425; cv=none; b=oxIndofwghhg8i8eeXaVyP1b/cY549WoTxNuPEbigeZ767cSBiTKz/vimn80ARWVX6kLoDNCN65y/CwWyK+KODV6PybXi6aig6u/dTHkR/uf2QuXznqTOa2ONVTD+OXlKl2pUhooVD7W3f/A+bc1Auo8mlfntLpfdZEvG0drcXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028425; c=relaxed/simple;
	bh=lO0fno0E364AvSeT99FeqGkbVL+ztqzXRDHADiw/wdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxMyzKZu4zfhwx0NP5VYPVdrz04uC94u52/AaCh5yz+CklijTFjMpnRItqQ1c0cVG9D/nS+GaWaSyaJo0+vUoB+irw6i8Ei1Co3H2m1lBDQRDX4j/Fu/OifbJCiNjhKiMgeGXc85hiAFd6Um5xfiuBlVIMfTahDwb0j5aOcL6Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWSYUkAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLLOcoex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312DKq53081367
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPvf5EWvzzVSfIl7A8SP9LZt+9mVSFeky29ji3hSV58=; b=SWSYUkAu9iUQyFwy
	SfcEMwE2sonQQIWk1aoD2UmwOa7p8Ss4yo/Nwd8UJrmqcg4l+5AkE4n1Ki6VfWCO
	U12loDQp9YLUwrNkCLQs/HC99LBwO9bNGVladA9hhtGB9t9UpDJa8uY9Jw7BBzjO
	pYBHy/hQD4m/LivZbTSvgOL1iy/uf7/hHsmMt0OTG0zBKNZylVQbLgfoNO9joNf3
	bI8RQznsD6XdS2EYG/ENYpgULgsn9fLdtUtR5khn4CMAOWvpkWEkGkUEVha0lJ7n
	AjngFlQG2etS5AH76tkl2tQCS898fJh6FtriScpkrONTq0x9A52i2TtLTWb34zR9
	wGQ2vw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkttrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso58322641cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028422; x=1775633222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPvf5EWvzzVSfIl7A8SP9LZt+9mVSFeky29ji3hSV58=;
        b=FLLOcoex4vl1Mw0MecG7MCVK31LaXiQ4L3AGwCTfJ0Y4Jekaqq54wczjXVwzq9+HOP
         69SxXn7+aDRaZhC0o/6p//OczB4cjfwvDAFbXapVGmcnoQieb3GQtntxfkm4dx169TBo
         a5ANFiswlB5bXGKlzNIalgKqA7v8HGD7pRR+byyw/asKZFObwkqpIGtJCSf4AUwuzt82
         Q1QsqNnvb+upEfk1PSIufA9O5tDq87AZO0zlN+fDQ2miWNNJhrBhsSsCZEWHw6IZlSKn
         +WxnuPzQokf72mWoxM5dgRrwcz2XiX6Ayyf2ir0lR5yO+x8JnJuXi1hr5ITjL7/zYBin
         vCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028422; x=1775633222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPvf5EWvzzVSfIl7A8SP9LZt+9mVSFeky29ji3hSV58=;
        b=CYQx3Sui8vfLw97eZCFstlS1BfjwzrmYGYe7mALmHTvuP3Y5amp77rWZWNMm7cYv9h
         SULdljWZHDwEU9q+cHkeOeSXHMwetu2V0d5pRaQaRIbDR2Tsm85jiPM6EZoxVM9BZJjJ
         ulcXnFFx+ETu5gL0jlZonTNWeDuo7R3sJCJ6LuOgb2NAPD6uqPCErt4EF7YO/phBMoUd
         1H4J18PTt248fAhrpSGuXiRccqXZVILNbEVLyJU6yjT0JSPlTU5sP0ypCMD5asN9ClSw
         I6+MiLuuetGG/B89Gt9trR6BKk0CDWLGgDNhEbMm3NJw3wXq/h4gTuz6fjd148Y3bdD1
         CkUw==
X-Forwarded-Encrypted: i=1; AJvYcCXeK5dWbS4TnP/D9U7DM7E7uaoIULilNnqAEa7Vsm5rRAbWomkmyySVBOLyGcbGspM/cwlWI6oyQdMk@vger.kernel.org
X-Gm-Message-State: AOJu0YxMjdgfHtMSKRXIwigLmdzObDPKJ6pTXKSkW0LDuEp9MES/TtKv
	ia52Z7k4WZY9O3SyD08WLhkWeWP6aIumvufbXOaMhkoma6u7BwjEA09fNK4Udt8nO/R/uMXGhsj
	ZHvGG+zj4Trk+Wla7aIeBfUXBajZFSCed7x5EJbTmdVun9V/nIZmfk/KYBRtDewdM
X-Gm-Gg: ATEYQzxU5G8S4xqscjiYiTbEG24SU8zf79vbnUmmWqmELNIJYQRCDFZePjK7R5Gp3LG
	68wWMdmM+vi8DASehkdzvv9MyZ4FtoKxuo/skc4P7NaARZmf59t9j0Jx8uuipFnTdwRU8YhBfRZ
	KnB/8MIezm/jTNgr5P44DAgOqptIHsEfLChLYYPSAQ849aiS5d0+aApOVoLBkG0Hka7QJNAA0wE
	/N0L2mJGMfaLYw7E17FibW3Nbw+Eb4bQCPOFQi0foNVcxZq+08ogU39P2fSfbId1daDJw46b2bd
	V16Axg9wjDiR37kccqVrJUPo/Du63k0fh7v5gqcRVy0JY05hb+z7f++El3BJK/r7tmUsUcgK9s5
	oCASRZBgmpqJGm1Xh1cWaVK3HS7ohoNF579VyUJTIXrKXONVDu10xqryX1RK5QhWrWY3ZtmokOg
	is/lLOvQUM8/OWrI8pQAjSxqyBLqMr2dMKzzM=
X-Received: by 2002:ac8:7d0a:0:b0:50b:45f5:a93a with SMTP id d75a77b69052e-50d3bb62479mr33282371cf.6.1775028422167;
        Wed, 01 Apr 2026 00:27:02 -0700 (PDT)
X-Received: by 2002:ac8:7d0a:0:b0:50b:45f5:a93a with SMTP id d75a77b69052e-50d3bb62479mr33282151cf.6.1775028421579;
        Wed, 01 Apr 2026 00:27:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:29 +0300
Subject: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI
 panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11382;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lO0fno0E364AvSeT99FeqGkbVL+ztqzXRDHADiw/wdU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMisklho0D3vESkQ4fmS068Knq50uBtpiLe3I
 snn5kz2xCGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1XIqB/9zql2lMw6YAkmcCaiKJND4sAmnxVxt+fmPveVP3wLcmBeS7zO5+fD4d/H9Q3upXFx/pyl
 Uw/EKDwEg9Cesr9W61V7r1RR20T5L3Nn2PG3A7MUpUqF896kziTzlhxWCho7Jg7HZtdZC/GxEcK
 Q9X0dfppZtmzDmzCbjJfmB58Mx4O8Em5OhxGPNYoP2O/+OnKtMw6D2oMBbyDULzUiVaxCalN43a
 uWo7fBsDlwoqVAzL3vAFXkZKeLtlyHzNyfiflpzZPKWKbKFmfyPUzkzP7dI42xRcfrUdsECEiin
 o9XpVcgkwpQ+IRfFyNhVrkDNrTzno99ytBInxDGNlcAii4Fa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXxl92M8L2ThWh
 qPbVFQQgHJAe5ksrxCky2tk3TjRLw4x/b3954UVkQa6LWUkio7SENnpHzr9bOUJ+Of2tbRDPsTg
 GIN2HGMlHWacmepFiUXoGOIRsWBI62Kv7/2manqHD9l7hBACkLX8vGkxyn6V84wbKqFaEtjNSKh
 8ichxDLFbMA+ca7/hPGkdBigsT/TGbvrt/fOsYwVanfXkxFMiCymdxiPvgVL2SBa0shNbE6f5wV
 gkA03oOs9wgO9dn55A5nsaoiQgcZ/Ov7txCSYeED76/AVG8qmLEhR/x6N594W9my/wa7EZmGuey
 EagTGVA8eb10OtW72kWfYQRJsUkZB0NwbbzSoTcRYmH7+ovAxaEeN9trwMQmHYHT+1Nfizoe6I6
 nQ3mh0Gb+HfGMJEvnKDkDXSGdsy2kDpXE9I/jQ1P9fwlyWoM4WiI8td6Ukiz4yipw+MEdZORr4p
 VQgRYgZmQ2yIytFeBQw==
X-Proofpoint-GUID: 469k5zjKlYrBMq342CLhapHZqmSnbj8r
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc8c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8LC8iulc4pHAooHhkrkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 469k5zjKlYrBMq342CLhapHZqmSnbj8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34539-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94D773762EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 244 +++++++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 1f23c50b6661..bf80354567df 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -44,6 +44,7 @@
 #define HX8394_CMD_SETID	  0xc3
 #define HX8394_CMD_SETDDB	  0xc4
 #define HX8394_CMD_UNKNOWN2	  0xc6
+#define HX8394_CMD_UNKNOWN6	  0xc7
 #define HX8394_CMD_SETCABC	  0xc9
 #define HX8394_CMD_SETCABCGAIN	  0xca
 #define HX8394_CMD_SETPANEL	  0xcc
@@ -618,6 +619,247 @@ static const struct hx8394_panel_desc hl055fhav028c_desc = {
 	.init_sequence = hl055fhav028c_init_sequence,
 };
 
+static void waveshare_5_0_inch_a_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x0a, 0x6a, 0x09, 0x33, 0x54, 0x71, 0x71, 0x2e, 0x45);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x61, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x64, 0x0c, 0x06, 0x2f);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x1c, 0x78, 0x1c, 0x78, 0x1c, 0x78, 0x01, 0x0c, 0x86, 0x75,
+				     0x00, 0x3f, 0x1c, 0x78, 0x1c, 0x78, 0x1c, 0x78, 0x01, 0x0c,
+				     0x86);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x32, 0x10,
+				     0x05, 0x00, 0x05, 0x32, 0x13, 0xc1, 0x00, 0x01, 0x32, 0x10,
+				     0x08, 0x00, 0x00, 0x37, 0x03, 0x07, 0x07, 0x37, 0x05, 0x05,
+				     0x37, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x18, 0x18, 0x18, 0x18, 0x22, 0x23, 0x20, 0x21, 0x04, 0x05,
+				     0x06, 0x07, 0x00, 0x01, 0x02, 0x03, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x19, 0x19, 0x19, 0x19);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x18, 0x18, 0x19, 0x19, 0x21, 0x20, 0x23, 0x22, 0x03, 0x02,
+				     0x01, 0x00, 0x07, 0x06, 0x05, 0x04, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x19, 0x19, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x07, 0x08, 0x09, 0x0d, 0x10, 0x14, 0x16, 0x13, 0x24, 0x36,
+				     0x48, 0x4a, 0x58, 0x6f, 0x76, 0x80, 0x97, 0xa5, 0xa8, 0xb5,
+				     0xc6, 0x62, 0x63, 0x68, 0x6f, 0x72, 0x78, 0x7f, 0x7f, 0x00,
+				     0x02, 0x08, 0x0d, 0x0c, 0x0e, 0x0f, 0x10, 0x24, 0x36, 0x48,
+				     0x4a, 0x58, 0x6f, 0x78, 0x82, 0x99, 0xa4, 0xa0, 0xb1, 0xc0,
+				     0x5e, 0x5e, 0x64, 0x6b, 0x6c, 0x73, 0x7f, 0x7f);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x0b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x73);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x6b, 0x6b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN5,
+				     0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
+};
+
+static const struct drm_display_mode waveshare_5_0_inch_a_mode = {
+	.clock = 70000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 40,
+	.hsync_end = 720 + 40 + 20,
+	.htotal = 720 + 40 + 20 + 20,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 30,
+	.vsync_end = 1280 + 30 + 10,
+	.vtotal = 1280 + 30 + 10 + 4,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static const struct hx8394_panel_desc waveshare_5_0_inch_a_desc = {
+	.mode = &waveshare_5_0_inch_a_mode,
+	.lanes = 2,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = waveshare_5_0_inch_a_init_sequence,
+};
+
+static const struct drm_display_mode waveshare_5_5_inch_a_mode = {
+	.clock = 65000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 50,
+	.hsync_end = 720 + 50 + 50,
+	.htotal = 720 + 50 + 50 + 10,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 15,
+	.vsync_end = 1280 + 15 + 12,
+	.vtotal = 1280 + 15 + 12 + 4,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static void waveshare_5_5_inch_a_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x61, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
+				     0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
+				     0x86);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x86, 0x86);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
+				     0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
+				     0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+				     0x07, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+				     0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
+				     0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
+				     0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
+				     0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
+				     0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
+				     0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x00, 0x13, 0x21, 0x28, 0x2b, 0x2e, 0x32, 0x2f, 0x61, 0x6e,
+				     0x7e, 0x7b, 0x80, 0x8f, 0x91, 0x93, 0x9d, 0x9d, 0x97, 0xa4,
+				     0xb1, 0x57, 0x55, 0x58, 0x5d, 0x60, 0x67, 0x74, 0x7f, 0x00,
+				     0x13, 0x21, 0x28, 0x2b, 0x2e, 0x32, 0x2f, 0x61, 0x6e, 0x7d,
+				     0x7b, 0x7f, 0x8e, 0x90, 0x93, 0x9c, 0x9d, 0x98, 0xa4, 0xb1,
+				     0x58, 0x55, 0x59, 0x5e, 0x61, 0x68, 0x76, 0x7f);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x31);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x07);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x02);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN2,
+				     0xed);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN6,
+				     0x00, 0xc0);
+};
+
+static const struct hx8394_panel_desc waveshare_5_5_inch_a_desc = {
+	.mode = &waveshare_5_5_inch_a_mode,
+	.lanes = 2,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = waveshare_5_5_inch_a_init_sequence,
+};
+
 static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
@@ -815,6 +1057,8 @@ static const struct of_device_id hx8394_of_match[] = {
 	{ .compatible = "huiling,hl055fhav028c", .data = &hl055fhav028c_desc },
 	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
 	{ .compatible = "microchip,ac40t08a-mipi-panel", .data = &mchp_ac40t08a_desc },
+	{ .compatible = "waveshare,5.0-dsi-touch-a", .data = &waveshare_5_0_inch_a_desc },
+	{ .compatible = "waveshare,5.5-dsi-touch-a", .data = &waveshare_5_5_inch_a_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx8394_of_match);

-- 
2.47.3


