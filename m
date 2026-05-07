Return-Path: <linux-gpio+bounces-36357-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCImDQ1V/GlOOAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36357-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:02:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DDA4E56D8
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 874013014106
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 09:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E421F3AEF35;
	Thu,  7 May 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBHwSjxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Brj7PLn0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F035F19A
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144511; cv=none; b=O6AGT2tvwjOfnJwNCiwNZxQ68EoK4D+mljsIYuYtfKQCmDNXjpTgG82M3xzt9b+eSydJOsFgfnS7L7hzwJx7Wrg+KUjnUILsNVisRVnXs0if9UBS6fwOudIP45XCHnqrCZYpxF1szoUOHtYSIXc/zM4Guvr0Gdwzten+NH6WYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144511; c=relaxed/simple;
	bh=hC8gKxPAIzgcAiCj4HFnCCX8CcpOJ7V8eE3rHascLoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etVM5gh5Csg+22eMv62uo/KNiy0tFSDfrBjfh98lNFMG5tpaQmRW1VRTUXDKnR32P1542KRq4ENlQUAm0/sQq8WKggKutelz5rM5i75HuYhXQ0Sx2klSjXs5r78IKcWZPgaqH6Dz6i8UhBPV6k0dfhLPN6VYuliq7VMgw/L/qQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBHwSjxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Brj7PLn0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LMJP1067977
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 09:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QvsauNTq3rUboIdRUovFsE
	quKr6TllKsvzUgfaR9kbo=; b=aBHwSjxS6EJ2z88l7pE4wXiR0iON5CG+5SY7ze
	rOc6ER0R4wQLE/c08P7ZPW5zibUnSxtoriKanBGCmUg6qBR7erkNQM0AyCJ3AF8i
	O+XZJTtbK1UsaCQH5OCiawc4WDX46+vz8VtZGHDL54FEFCFOHbOVkYJT90wVnWbH
	r7lOf3vz6EPsxq5QgPj7M8kzSW4AatiJRyFU2OuZsU5f2AL6RZtH7nqvXGtox//w
	lZRrHRlw+h8fK9XgjYt9hW40xmyvSXp6Di34uS7WDgIOJ58wXrAOVVFoyNU/4Xlm
	GOMh8xyVO540xPNtANvqXTx/8HspWBAIH8/vVFBDONAquP5g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh18tca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 09:01:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62f2f65217aso338442137.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144502; x=1778749302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QvsauNTq3rUboIdRUovFsEquKr6TllKsvzUgfaR9kbo=;
        b=Brj7PLn0ITlc6USAEdRcwZ93OXZJ0Cr5aKv5CI9uPrZOEctNJfqolY+yD2McM6h1qp
         0375RSJDy/IcTEsSPW+FiB+HXtlf2kOR2bsDFri9fxyrsr8OqAdt1Lj2JLL7jop/dm+l
         vIsyoMVgnuMT1DOIwDYW3dUUAq8DVNF387C41TPHdPTGFzO6rX9GiS9uCIEl5Di3AUdH
         KG+9EGMPBs4kdFboGSzj1wta+GjaA3X6M4HCPoB2nnmOB/FsMMvNKIGjmXU9rx5VQd7C
         3WbOsD4C7qLf6cMkJ76pmUgl50wcMKpi8l1RSJI3utbPKmOnC+yIUU6Ft/7QWPiPq5P5
         /tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144502; x=1778749302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvsauNTq3rUboIdRUovFsEquKr6TllKsvzUgfaR9kbo=;
        b=Dx6sK0yLK0A+/Fq9jXciwvMIbzQHz4L9hSHzcW6Z6DuezG9PNlGefV2pCpZRZbiOY/
         Bk0grvGK8dZLB9rnvUUFnAcNWdEAfFy3BeqGW9XRrhmZ1W+RhzPSbhenWoT0WjD3CQVj
         ZbuBYZOBVRQAtrP/NuMHXWZ/+QepB1CSVFn3uPdOu8sA6riS/UlRc0e6yOo+85O/hSrT
         G6qeVxJ7mdWaN/0zMmVnz2Zopf2kjp7Q+FXPDf97gNnUySFE5DYiWoM5DjAgDffkwBu4
         xtVfxCIwlH5G8uvfI5LoPl36makrLInJ+fV4FD2DZ22oo3LeG4mcVHh5V404I1cCzZz7
         6uRw==
X-Forwarded-Encrypted: i=1; AFNElJ/nf5kZCAJCPAU1qILTdeu3cAeiPjQyF7I/Xzb6R8SEfqZsQVRujSL801rh7JuM391G2BfLVyrvubU3@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMBG+SvoScXugTfzpoVkscqNchqTNY8SOH2JBEsMq8E5DPJuA
	n7xgbBOF9SbMIO5qJy8gYR0KRtSA50Ho2WUpeGS2dkfQmid1KorCw/vLxGjvHQ1PiMLzOYMjKVT
	0xq6QezY0RiJi4Ra4vlmlIAQBK9WneYtQGo5xBhQSC2NVuBT9IFasR8eSC1D4cK9b
X-Gm-Gg: AeBDieuJ+VCcdQ8VnvzLjWDHzNEZH4SuGi6YoatmqI9Es8FZI17+66RE4KTTx/iTy7b
	OMrank9QXxTUJ7ILpSgHVE+J+Rb8UoYEv2/G5LgOWBHcKVk2/zSoriC6rF8WWJfrc8t8KOBtXZ6
	+gE+XBLS+cTCtdle6SYzer3ksYC852vkQtoG9FJxSdtuL6Kf9KZPZOfgC8liQYNG4cx/Xo5hRyo
	9ihCDGwx7Lv1dmFB/ScP12O6PUu2VDLDRrVuPBBuwY+hGV82WoIAO7so1c+bCHVAz7skfKiryfk
	l/AufYAeL63K944g6Ox3VZzWGOCsxHxqWmhk9AZuzDueN1PfprfYpIwXESYehepSxUtcWetutE5
	YSvwek4c9RTYO5JAnrfEHo/wM5vzaVDO/n2i/YmYnP6X7EazO/uaqnMliyv76ZREW9uAyTqoaF8
	i6yfa4/6GhGycnJbtNjm1ORXzs5DoI0/+x98Vj2zxvXIwELQ==
X-Received: by 2002:a05:6102:84da:20b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63123fa65c9mr117609137.14.1778144502113;
        Thu, 07 May 2026 02:01:42 -0700 (PDT)
X-Received: by 2002:a05:6102:84da:20b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63123fa65c9mr117553137.14.1778144501588;
        Thu, 07 May 2026 02:01:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a870f96cb1sm3480516e87.22.2026.05.07.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:01:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/panel: support Waveshare DSI TOUCH kits
Date: Thu, 07 May 2026 12:01:31 +0300
Message-Id: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtU/GkC/33NQU7DMBAF0KtUXuPKM7Yb0hX3QCxsZ0KMaA2ex
 ICq3B2nbLJI2Iz0pT/v3wRTjsTifLiJTCVyTNca7MNBhMFdX0nGrmaBCk/KKJBfrhAPLpPsOMo
 xTWGQBA00Dvo+GCXq50emPn7f1eeXv8yTf6MwLtTSGCKPKf/cZwssvf8XCkglLbUArbdOgXlKz
 MfPyb2HdLkc6xHLUMEVBTsUVqqxofPkggV72qH0mtLblK6UduStVohB4w5l1tTjNmUq5dG0vaZ
 Goe82qHmefwH3TFB9sAEAAA==
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hC8gKxPAIzgcAiCj4HFnCCX8CcpOJ7V8eE3rHascLoE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/FTujaLZhqlfcwayX7sT39yXXp3nnbfAwrNYB
 MNe/6xhaHqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafxU7gAKCRCLPIo+Aiko
 1ThICACuFYxF7qCax7SDv5ziEm5eOGVJeGWP+9tZXlWlKK7NvYNaNHOnmCivZN+0/u/nhYJCsva
 w6G7P48wuUeeVjexqKW6DlO4nIhNh/1GKpJl657YW0DhnK5TmEUpaPuWvDDI0z+FEjHZWxk72Qh
 nEvbLK0MiFWDIOuxveejtaPqSSVmCk3tpNEYA5cM9LDMZPOEZcLaXVHdprOSp681D/jLGxjNHTx
 R5m4cpZthxG0gP0ng86u+YoT9BidjySLMVQ77cbBO3nP9wyuHxuSt/yVMS1KyhT4qaoVF4tBK/w
 nqOuoAMwn+G3R6hNsbOc+8Wjlt8byBDC/uH//rWXBWKMvb9d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UdUMmEKqqVCyCsiyufsUnHc2qx47WxK2
X-Proofpoint-ORIG-GUID: UdUMmEKqqVCyCsiyufsUnHc2qx47WxK2
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc54f7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=woyZ9DH24JpTQh7i3M0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfX9EXHoR6zS75O
 VZwlxKy6UPUqCXvHCI0MjYTA9h2zQJWljGvB08UbvjhVburInawfd5uKT++1Bzn/FW/wbR78Shl
 o9E6GyCgfN3LN2t9ygbVuzISA1n/zDmRtpa+ubFg7BGgUMxUjdiKHbTfw5AnSYPvhWtOIH6wMap
 1KyaaSSDcuXEr+tZCbkfPuTa7far7s+barh9ZpzKMjkqFB8cBbAHLWQ7QCqoafX4rjyqgAv4d0W
 F8m698ysi5wXI0sDYit0J3yKb/eODGK6PqS0rCTCbpHioP2J4GaCVzW1KDTViV37N8Dmw3Q3EvQ
 rDphW13cnnkmfC7sleS3sB1PDF0buFhnI7vzdVDpD3G3d+jxnbex0xZZ2vxC7zQw6dPk9CXGLoQ
 TA01hNVhJ/XuCh5flmQXirT0GyLzYU3HeI9r+HJH0wRF4bUeucW4TuwB9fGoaANY/89q4PG7pga
 px7Av1l20gLNWMvcAGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070089
X-Rspamd-Queue-Id: 98DDA4E56D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36357-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Dropped applied patches, leaving just GPIO part.
- Dropped panel example from the GPIO controller node, it's has no added
  value.
- Link to v4: https://patch.msgid.link/20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com

Changes in v4:
- Dropped patches applied to drm-misc-next
- Link to v3: https://patch.msgid.link/20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com

Changes in v3:
- Fix another typo in the focaltech,ota7290b schema, sorted out voltage
  supplies in the schema and in the driver
- Dropped Ricardo's T-B from bindings patch (Krzysztof)
- In the Waveshare GPIO driver bumped max register to REG_VERSION (Jie
  Gan)
- Add a lanes vs config check in the JD9365 driver (Jie Gan)
- Link to v2: https://patch.msgid.link/20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com

Changes in v2:
- Fixed errors in focaltech,ota7290b and waveshare,dsi-touch-gpio schemas
- Split the JD9365 patch, making the changes more obvious (and
  describing panel classes)
- Cleaned up GPIO driver: moved NUM_GPIOS from the enum, switched to
  guard(), added regmap error handling, dropped
waveshare_gpio_i2c_read() (Bartosz)
- Link to v1: https://patch.msgid.link/20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    |  73 ++++++++
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-waveshare-dsi.c                  | 208 +++++++++++++++++++++
 4 files changed, 292 insertions(+)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry


