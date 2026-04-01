Return-Path: <linux-gpio+bounces-34531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCpIGqnKzGk9WwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:35:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1F375FD2
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44FCF311D5DE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6E37F011;
	Wed,  1 Apr 2026 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSZQPCB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxTv2MPQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973737E2E2
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028407; cv=none; b=RXAqQbDT63L6HfHfeCseYydozPSJuldIF3yILArWAAlgbeJ+LhoKe6mMek/PvQftHoyHl9UB2E/8rlb0XU63eR5ftnN6pWBPpDLgdUtBhuXMO/G8GYmUM1l6QJOGrW0vd0XpZoY2GQc8hKMRa/BkHeEa6/oW8nJ7RO4jS2Ydhtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028407; c=relaxed/simple;
	bh=cdQkofKqonQVRCR3RPQmg5mh1tVwYR3iPvbv5tdQJRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CND3eyu53piDl21BHfWIgUNLoaGJaQifLmwWYvaL/IOtXowI+8yVwoEs3z88psjGn/7eIIEjggyiAMpEluxhuftwEkdUHL3AVyL/EpMrpyCJLvvDoPrmh2s8MzEdwqXztzpsieWUmnqnCFuC+6FSleyHBSfzWhgwRHLw7YnPloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSZQPCB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxTv2MPQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316GB1W639229
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hjls8RjbbsnzsfTsTlRRKkryE1WArQ13EkY6T6bLBfg=; b=eSZQPCB+ldxbDP8o
	bon6ca95+fJaWT6S75LeONfMaUS+38/IC5ze3W3mhzJ9GDWkeLeYsBl5hD8hcq0V
	jitQPn6EBf3wpXnByrYv0eFjSh7VIHypjQ52f+0bEUIawqNd8l0ckDs1N3/+39UG
	LGXVEWEeoFhQIdK14FfEQL0eB9YuwY2txSAoDhnbrY/ibCB96nBt51w2bdqLib16
	INlAS/SqKjLLCudG9TcI/53yky3+NduDUfDWxFm3IFSFfxTqCwj9vlRy5ACHBi59
	0THuXyWYBMa1/oE9UYjYaGaHtqs+fESxtJvDMVec6KoFmCmiPB8n8Fmdb14B7kQW
	FSvKLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auxcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c40acso64090111cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028404; x=1775633204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjls8RjbbsnzsfTsTlRRKkryE1WArQ13EkY6T6bLBfg=;
        b=IxTv2MPQJXORJHDa00dIXtMTWRXvqorIgBBbhdWPF29J/MqxQn6K0Bp7QRAKavqpOc
         btz7WJcWKxc2uk7SAYb5zU1qF6CzrPNhNOiWoa3aZhYAJ6Z30pT9hSw8RktuxYdAtsU2
         BwNCa9ebJyLJTCJuUR0v7mdWgnO9rz7ZdTY7S1c/JkPLR/xtNkgzh8lCMSPvPVZkjduG
         0O9UmEQRwd88/Lbikf6Ightf4bvmAcTQU3IuuxZnLwakwkLvMusyFiPgqm8L067ZPAZG
         qbKOIMBqolpXaJIPJy5lpvlRdlFu+O6B0ewE+JQ66b7DLzzelPnsmP3xXaq3C7aWNMZ0
         9Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028404; x=1775633204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjls8RjbbsnzsfTsTlRRKkryE1WArQ13EkY6T6bLBfg=;
        b=efGgxWw4MAimnd0zViG67h9gUA0zh6mqKzPkdpnUF/q/9pMaUZNaNcXInFab+xky1N
         WBK7u+8u6pm9ycz8lgSkiZJ6UWkv5i8BQf1NeLgTvgDQ8jJ9BVHRRH1dxZL9pbAJPqgO
         +/qcVgooTkS9a0IGku8wGrAIppsPIKVGhEnS1JWR3vjWR0Ir12mHC3m3kJBtFGPlgWcR
         SOcyAeoeUnoJMrz5XLZ94ppbDhNppE5ay3p47ygYXNRafLmHcKFXUAmqdDh98GRIVAIv
         mctVxxeEcyuTF9Wqoq7vyntAtR80pR3gPzBl9ns6EDr03dGA5+a5Jis+UETTmk8dvhyU
         S3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYBbsdRSZKJ5DbhK9l3xGEUsmG+dXfM3rQcMcTuvgaIgnP9zfuYN6Tl8r4KcC3i2rdadG0H+QqY7AC@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+Zio0aEYLTsrG0s3Qh2hUNRuNzQcw4Ku610nD2q/2ehoSQx8
	2QGrHQlDRKmyVqssHgthVpVIU9Q2/yuSiBo4Ps39eGM6oGaQavV9bBG4WhpE/Qy/NAZxp60gkmS
	SPzHJUGhdeOyhvjZZJhexonNqcw+NSLer/4Jyi/E9I9DpdmwUgTNFY/kZabTRKHsm
X-Gm-Gg: ATEYQzzfz60mWkXY+vvC7Mq1jPu19nT+WHFvTEr2hsgYmPcv+BFi7Pe7rKjxDQII71a
	a75X6kFHcxXs2pSAyvZLLcjGoyNMPejQA/mYTWI5br2OLuV596RcnlILdTGGUiyppaTM5pmAn8j
	HTEPfIKNg3YqORiyaTf2ulkGW3D60vYYD8I/MeVvlISxbm47rIUOqXlEKC67iYYAUGSUOdZU9P/
	kOO0n+qUAlkCsA8AbDGBbP06CXppG4DsyKjmkjYyFiRt8qbYHYQpu62TVNcDXOYNcRaUasqo5CH
	e1KMgvvDAJ+LuhHQFHcAhA27eZHwyw+uxT760c2f6XFR8zwLNhH5nF9YA4yhr/vzxTukU4ZSkRr
	L+lQCMjJF2xGlzIUM17Dpg6CnaYH5JYhkTR76OMmCtSQOAJpQTrNgRsmRCTRoNO0Sk27wv+R0+H
	YdbYVQV4vtwC/ZwncUHG9uR+Ho0C3DfZO3HEo=
X-Received: by 2002:a05:622a:c2:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50d3bcfd9bfmr34828901cf.56.1775028404541;
        Wed, 01 Apr 2026 00:26:44 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50d3bcfd9bfmr34828571cf.56.1775028404106;
        Wed, 01 Apr 2026 00:26:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:21 +0300
Subject: [PATCH 02/19] dt-bindings: display/panel: himax,hx8394: describe
 Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-2-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cdQkofKqonQVRCR3RPQmg5mh1tVwYR3iPvbv5tdQJRo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirgQzsB0hpFKG2u7zhkET+Vy0O6KHFG8fbF
 iO7pCCEydSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1edtB/44paXo5P+bFEHj/5QakEC1uvtLwqTP0aX3ugpdP+Xf++7DfgKwkEIGDSKu2w5E/EYi4FG
 1cRLgD0IlDdRln2uLWMGTsJrsc93RvpKKs+0LCD3vbkrWzQ5LhrcRlFuOJNWqM71JtydHKZnZdq
 gUkOBUXePUi25xaSC245oM5BdW09tJnT8YU230/eDG2klTnsm0/s92Al63wQkDCeWErIC1e7+a2
 /+U40yuD08geMdp7QWR2z0vKWl1xYas17bj+RmKvmDOdlwUz6wVgpoqzOzdiU0ZR7GgyCFSX3Bv
 +AZtCruYNJFYFgX7HbvVLMSJGzadtAxfuWPOXWNjaFzbvtTt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX+q3YCVGn+hlh
 lvyKFOcB5KrnGvCqvo3pQgVh7KZnKOicrowj1eLNfiyaFyQmIpHvNv+OVMzPXwiqO7hoC4oolBh
 sImdhJZLYn8ysucua07l9kq4/uEtgmkFQz7ibYmdyjgrBfU4vIn/Iv4xC8QXQh3ew/xb6kO/37o
 xOK7hb3OObhmo8A0yOl4ESkq9TIZ0u1Xt98+8KLPvi4CfTpdl3mEdGI24naPF4YbEUkm2IVbf+g
 A4eKvdkyWnqkE0Hz0bPAi18brvdu417xWeVVOv4cb4tkiS386DZ6q0NvKYkq3SN3GDiB1lz5Ey0
 kKmVoiFO8lotnzR9tNBik56q+UfHgYeUUgWSFUpZhIQnvBLTFC2DV3Gsrg5tQUsakkewj2jBPFO
 S0BT5n5QYK6BKSEGx0PwKe+y0C26sO+O/kNrM2kNbclWamysR96eQv4M8LHKq3rUk/hkiN3av/Q
 t0/PrT8NvbnSRMbqo0w==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccc8b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0AHfZW8JlnlOAyLNbMwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: I9Mwd6qS2u_iZSQXXGJwvKXNSyNqtsuI
X-Proofpoint-ORIG-GUID: I9Mwd6qS2u_iZSQXXGJwvKXNSyNqtsuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	TAGGED_FROM(0.00)[bounces-34531-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: CDD1F375FD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
controller.

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


