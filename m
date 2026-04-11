Return-Path: <linux-gpio+bounces-35030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y+bCM1A62mn6zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:10:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C073DFAC1
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A18730162AD
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2923537E4;
	Sat, 11 Apr 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGXVTkKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1IeCJKH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18617344036
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909454; cv=none; b=ajkR8oNucc3drRnuG2Ljf2AGNwZrx4jhQynA6cL9Owk7JHZy/LOFP46Dj+K9XTTlOxzZmixN19decUqvtPX7AgUZpuHvkPcUNEkLjN6PlyhN5yjTflEMxty4KgX7UoHoCQ77U6pFWmG5WSKcTqKF5DV10WYl9N6sKF7mhqmyKpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909454; c=relaxed/simple;
	bh=CXXPzEZBwQFoyAeoLk/sqEJFPJ8wqdICzZMEUpK6xc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uKp3UoQ4cC6w2Sbn8U3u1BsJDLZAajOCxiucTr62cwvpCn1sAmYUvlqU7yI8iAHSj88Sx49r0LbcZqudTyRYBNP+39NfTR4goN5sDWTQkLb5VpXAsUxijtEP9rNEgEgcAOZbcAkH7a2e8g7C4cXNJuS47XFjrvj7aChhF6naCBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGXVTkKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1IeCJKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B485JK1201549
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5O/dxjvokdyBHMUsNmLLbX
	Mzc9mz5c+6oNW9h17WMCY=; b=iGXVTkKgXSxictZ7WEfkbaw1tn8n5e44v06nT+
	64yp/LLrdZ2Le6+DbrES0iF8QMiB2I8iNfN1Zc2Ajp3SlSqsx4raO6sO1m0zF0rd
	9BMHK8UMYpXT0XsAwayGoT7k+SlPFY2pLEIKiI9Z0e4V4WL72mizeBCgTo7UZBWd
	AjB456yobLJo9/CRhm6tr/6z+5xxHLdZBIiI7dk2LI4AraZV38Yq9HW4Hdanboso
	FLHKkzIfiDIXcrQJrx4+HVUmc933rYmcDEEx4/Q2jZFF4BN5QgW7N8RGyr6nyEHW
	KNOIwu13+xT+W2IhxNV6gkDmHZ/XyavBygBNEbAopuZIuPZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrn82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso73601501cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909450; x=1776514250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5O/dxjvokdyBHMUsNmLLbXMzc9mz5c+6oNW9h17WMCY=;
        b=b1IeCJKHYjGirK2Hhr3kmhf4kEJVEhwp1gzBNCbXSCXbRmB2FOHAQEJpAnhViFtot4
         rsKCZL09TOJOeBC+pZqveyFr6CqTYjb5HgsUuA6SydL8sh57M21j2feIe6aGA6VuBDdp
         h6H3Ic1/0fsX+g+qMMkjVpTzht970mmN3FOOWdoykx737TSDmbBpElv7704hMYAo0O0f
         VY2oOVy4YRVv/Zd4bFuXSEMegfhbtDScxrckcZEUXDSjRbMAu254An0yujSMlZ4aRXDm
         mXUcV5RgdkSrlpMcb0Kn14Jp7pNJswzQWqeEmHiLGgAYlnIgK7smm9RmfjQjyaH99pmj
         8kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909450; x=1776514250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O/dxjvokdyBHMUsNmLLbXMzc9mz5c+6oNW9h17WMCY=;
        b=YBNWrppVDWpv6ZTDYu4OCkshsOl1fM34n8SnUDMXP/dD+owEhFYL0GHTo7W8AHnA66
         TGbHf3XmbDtIe0x2JYX/aLm1JF3tf07AdL85Kc3cWa0iQ/NdPVYc09wAJ4e7BxprONSq
         ixF/bLh2jDN2Xmp0NN0L3PSIHR8139jvcxAUhpPYply85zw4kBquOhqEEv4nX5hG7Aea
         x53u5Di7ooM2dxpgijCrfoufFcBuISxGBzNEFmLaQ9nqxIbM64JO5RCIxg+qrJ2HjZJQ
         vn6y4WOErZdcmbOGGUAGmA+M8H3ETuCF9h8ymarPat6XqIweuSrTelfghqvxQKFUQoQG
         lDnw==
X-Forwarded-Encrypted: i=1; AJvYcCWTftaAVuFHyp0gJ+CvKqODCCPyeJs9DxYT8srzVo1Z9pJnKQXvLgSpo+ZzGWn+w45oRm9BwIpIUUeU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ZYpX3ZA4AlBQNp+nXPankPAHOojm7GJnJ9s46Kk37N4K3N3o
	LgtxjYC5CiygyEy2VLPt8uWSIMmKN4IBO9s1U/fl3SbYblWzGSZgnCgsgpTuxM9w2btF/z7aq2E
	JaAd7hx1QINbSY13JQpJWUdZdnMzwp+4eyP3lQ6dufbheTkbyrQDt0B2vSPmUlrvx
X-Gm-Gg: AeBDies2SQak0quY9AHPTpgGuq/Qmz7lD11+RHiIhh2M6tnYPgiDXEZJ3K88QPyj0xk
	pf/SO+2ZrU/HIVlTl+Z2D/ziRLTEj2/yXQ/gvYE0CnElnNsqxHtXxvs5Hu3Hqd9dLibuCZ1+gW0
	CpdW7gn88CeTUvxI9/jw6HBtklRuiYdpUhVJMTM0uzEc2hjvETPYUmSfa4zqrrwgChGpxr3OI7J
	9SYTBOeFuplhmJi1yLlLueyJR0HTX1tfaJczPbQjJLZwy/j8VnWwc/yWh1dtFOg0HD5KvAxxjYO
	/HfF5b4iSciQri/zHMSD4mcP7LAFhpLuzmVcG2r4M8maJH4oRHPyXRMRcJhZLWXY7Qr/ydNpWbp
	HbqJ/dHsNLQQumzyEc6vvmj3uc9ZCs7isT3eZ2SjUFTga/xSIevU8TC5SH1O08hbDre9mAitfeR
	ccC3T/Lz2EJwCQcwFlyqOvuFG+CSe+5scCtZE=
X-Received: by 2002:a05:622a:a18:b0:50d:6557:5caf with SMTP id d75a77b69052e-50dd5b05425mr105146621cf.28.1775909450288;
        Sat, 11 Apr 2026 05:10:50 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:50d:6557:5caf with SMTP id d75a77b69052e-50dd5b05425mr105146011cf.28.1775909449759;
        Sat, 11 Apr 2026 05:10:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/21] drm/panel: support Waveshare DSI TOUCH kits
Date: Sat, 11 Apr 2026 15:10:20 +0300
Message-Id: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACw62mkC/32NwQ6CMBBEf4Xs2ZJuAxI8+R+GQymLrRGqXagaw
 r9b8O5lkpfMzFuAKThiOGULBIqOnR8TqEMGxurxSsJ1iUFJdZSFRPHSkdjqQKJjJyY/GysIK6w
 09r0pJKTlI1Dv3vvrpfkxz+2NzLRdbQ3rePLhs2sjbr3/hohCipJqxLottcTi7Jnz56zvxg9Dn
 gKadV2/1V9Gkc8AAAA=
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3793;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CXXPzEZBwQFoyAeoLk/sqEJFPJ8wqdICzZMEUpK6xc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpE1KjblteWFTrO/ZNvpQl8RnIFiu1+M1eRo
 jMPZx/hGwiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RAAKCRCLPIo+Aiko
 1aSHB/4oAN2PUYhWkqReBpp3xtgk843VREa/honY2sAf+sOMSVdzA2C+LJlF8f3Mtu7nGuVNYbj
 M4UHxfmsGskNBhhOv+m0L5WBugfEH4Lp4H9tuXGIvJu80dKvmBLHwJdX3dX9XA9V+MCrExAIz7s
 8Dh/Htrx44bJEwDlQ+hUOAR7MLKEyFVCV8C4hLba0EnzNCLZKnmsnku/oARtjBnUu43MszIAok2
 CZfSGl/mdKmlJz8Q6BJ/9H5/+rCXo+b9gGrWZ9mAQKiWDikyu42u3cudTyJ27msY33u/cuORCuW
 WHubAuyxSD0cZbxJir63RIG0crZgtYKLHL0FStzYdap8xaS9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX9qozW/eERSSI
 sG8c5tmAKjqnfgy97RAd9ESJJLPNv/LfZN/G/qMumliIpwsAeClMDe5AHynm9yZbFj9dORRyACf
 AqGjBpO+VGASeF5coWQNrM1MhBEMWBasbWwcLepO29/WTxRbA3W9CihPxqmuBuwXJL/WXh6GRZ7
 Jb+jNQ0cZEoTMO+BYm5W0DHk9sJaLisapk7lTp/bKIEKN3LEEiqeMsjGhQvthQSmIzuq+uieVN8
 BErNhldpjonr4KunnBGuKlIDkVTGCqNwFRPiE1OwzJsNjQZ1KQ4b5fibddxMg18VM3VMJf/+WP0
 zT9mPqnZ+5fGswpNJFS2MSGGoMkzH7SlQy7Ixz6U+nrQWornQc/I0hYpLeWsmyhy5UAPYnJd0f8
 wwN/UL9kD5ySk86L69mX0+eG/xhzFLO1jEEjU2wqA4fiZvfgAhHsJF01KRQwEDDvv9yNrSVfIOQ
 +ONW3rf1fLxTWGcj4ug==
X-Proofpoint-ORIG-GUID: AVzp0cTsfOdKcSxT_-ZNLn1YQmoTv4DJ
X-Proofpoint-GUID: AVzp0cTsfOdKcSxT_-ZNLn1YQmoTv4DJ
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=WOO-qr4TJnSisU2av9sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35030-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
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
X-Rspamd-Queue-Id: 35C073DFAC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed errors in focaltech,ota7290b and waveshare,dsi-touch-gpio schemas
- Split the JD9365 patch, making the changes more obvious (and
  describing panel classes)
- Cleaned up GPIO driver: moved NUM_GPIOS from the enum, switched to
  guard(), added regmap error handling, dropped
waveshare_gpio_i2c_read() (Bartosz)
- Link to v1: https://patch.msgid.link/20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com

---
Dmitry Baryshkov (21):
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
      drm/panel: jadard-jd9365da-h3: support Waveshare round DSI panels
      drm/panel: jadard-jd9365da-h3: support Waveshare WXGA DSI panels
      drm/panel: jadard-jd9365da-h3: support Waveshare 720p DSI panels
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
 drivers/gpio/gpio-waveshare-dsi.c                  |  208 +++
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
 20 files changed, 2801 insertions(+), 130 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry


