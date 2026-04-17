Return-Path: <linux-gpio+bounces-35222-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICoKKaq/4mmF9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35222-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:18:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF941F1AF
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 467B93093E11
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 23:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6E037F8CA;
	Fri, 17 Apr 2026 23:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8On6Anc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdqa32KJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DEB3803C1
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467803; cv=none; b=thwrc6Hduu75tkCHDyLgiU1w3wGaH9yE22tnNR8SxiJV9mtuTuOxhV1lMqWEwXYRFRtuJXbIG8rNiOGzuw7QHwwjslRieDNLnECtguLv4R8zehZSzy/I3YPWvLjGQx6SVn0QOLevAhje7P593KPYo/tW8TmeAeanzSAwfgqzwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467803; c=relaxed/simple;
	bh=LLB5S+fq0OkGtz5fZjjGOedSRUpC3QiVTV63iuC2ud8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQoGO0Ba80r7RT52Ag91oVVr1Ryo34aVettFvkMp404WGvYfBdNgjSkKaNKPMz92M3hcAOH4Ek6VMnmK5PbE8yR+ENVqbAmWilJCkdOFQIQ3ddbvnVkM5Q4FS16CKNpnTTsZ3Q/BNFFTrzRQ0ejumwC2BiufbAC8V4RfQLSf8UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8On6Anc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdqa32KJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4YwI455000
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4NBXSH4Is2yC5xbwXreHyoFBggJh0nMi8dZy/+Iqn0=; b=J8On6AncEsQT7uOi
	nXaMI5BqK+Lf//c+rn4aagri5zbmE20z6U7jHZXYrzEVBpo7Wk3hNxhrSMNwdfUX
	pkFLevmbt5Y4xjEZLX97znFWMXJJQ7E6esIAbYP71tAaRcZYOTFDN1Nht7atqDCb
	vfDIyQRl4+B7fhHahlDuOANHnOH1th9D9xMY/xsb/yMc4sx/4COdJeu/N1nV4FUK
	LpbtfedzM80U3pWPHV1QPQHNbLjTYZnwUmcb3R7ZnVTbFGnLaw+k7joFqm0YAh+f
	GSGNod66XmXFjeC72WBMKqH4cJ+NWrfnKhkngOXntH5qaN5WQEyLhXAhUmcWSLbx
	Rta4nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88u2ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2eeebd33so29326961cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 16:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467800; x=1777072600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4NBXSH4Is2yC5xbwXreHyoFBggJh0nMi8dZy/+Iqn0=;
        b=bdqa32KJhlFPKdhdlgSYPCYc8i0Z1QLOLcGONBgAdruWjCc93SKlj7gzbz1p3u55Yk
         RUgmJ0x9mQ8prnLau94meH++sAglNsbqCbbWqA8TW+RuwAZCPNZ2AX0iIUTdPTISvdnj
         yKmqpPD0akgGBfH/O5oyKZX/gbdvptkzsw/q/3XE0LodkgT5f/pC5WvXF34SDlp1ba2U
         DMvXTOX4LVgWOSDjljqEA1PlFAmLBDSW9JvTMXvxXoZpuqDXyLwWaDgewWdoP0/NNVdU
         THOY79TJw346YXNxBJ4fShhHtxftsAOZJdOe/Y53St4h8AO3+f0tRqhaD8pCW9PTDW+E
         VPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467800; x=1777072600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4NBXSH4Is2yC5xbwXreHyoFBggJh0nMi8dZy/+Iqn0=;
        b=hdk+Hza+98y9HCrCC32+H0dZRWox1Nf3rp7sufrPx2d1S5sHhhoKsV+nPh1kVPWYsx
         HyjBmFodzQEEqvns6EhUx6YiBbthPFcpaVI7SVMXx/uS789DWAV2oUzhL8CypJsrjsOP
         +M1l2LV2SuwGMm/rqUfhlWB1VSn0AWRBKQYjH6PIc175GBZ3oKYyQdMF0BtHYng4RWjY
         YMmvoGUW3s5iN5lW8OM/KOnriVewZc4/MeIv6lRHFX8MAy7hFqvPHOB+kJJecTzh2mXD
         a8VcV6eshS1HS7BVwHUa+j0ig6w4U2n8HNUqCRPARp497ijlJ1n6CRq9SR4cDCnhq9EA
         hdQg==
X-Forwarded-Encrypted: i=1; AFNElJ9NXHMor7B1Y0eD4bEZr3QAYV2kOA5XVMZC6euLSvZ4Okb30IYbzz4R+CnREIAenhgHPTUuyu/5mmnF@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGLtrR3YYhTrrrXmXARblWdGINaZjSUcRaulp8y5IvOOJURAV
	nQrQGHnZyAZIOc66hRzX3dCWu+dADC1BdhVrXE+S7MB64Ww208C2mNdD2IHqImTbGkOQY3wmbVQ
	m3Xrp0yD4aaCS0jdlLoCOfPubypJ66q7jN2nEttKS1RPOpb62jzac+lUuVUNdkLmV
X-Gm-Gg: AeBDiesYARijISxc8O7faXXbgQEvey0OaYfdJGossRd0/AbJPDqn4Y0n2TKTbv3P0ww
	OR2KX6yYRnlht4aA3U0qsh6GmzXrpaXapk1DLOB9dQaoX7A9liiqgrv8qhrHxq6JDwHdUd0Cohp
	I9dTfdj5IHlvftkq5CdUzgNWG71+4uWgWSDC5Wz7JsKkbHoE7bRqPDAPLrIUChNgZUcrO0WXH6w
	7cXOpx4q8LuFU2yFsMLpHNsgIIFxa/P+/nrlRvobc+xdxuWt40uKhn0tZv7/sIO515TYm/HPqW9
	3X0e5ZcZknugwhNBCtyxOcRjlNfdwGlYXkACuGKz37gY9SQL9NxrHcE/Fkn+YPoPDrXKbg5j9dD
	W1HAcp1WB+9miZOihBfYzIoukem6l5DtkYbelVztXCygcKUR0Vk3sXFxuKEmYIWdIuUwwnTyXh4
	parZp/jkceWfYVtMSAL3ZkvZubbbpfRST1jcMMN/XtKn5Ubu82pxJMju/7
X-Received: by 2002:ac8:7e8b:0:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50e36b4004dmr71207341cf.18.1776467800142;
        Fri, 17 Apr 2026 16:16:40 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50e36b4004dmr71206821cf.18.1776467799621;
        Fri, 17 Apr 2026 16:16:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm815695e87.1.2026.04.17.16.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:16:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 02:16:23 +0300
Subject: [PATCH v4 4/4] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-waveshare-dsi-touch-v4-4-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
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
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7752;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LLB5S+fq0OkGtz5fZjjGOedSRUpC3QiVTV63iuC2ud8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4r9JDpfhol8AoFz4jD5vkT+meGyDTMarU9bf4
 0SrjTu9wViJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeK/SQAKCRCLPIo+Aiko
 1YToB/9g1+pGdvvJwBjuO+QerWMC6htvuKdbCWaWfW3Ub/3Gjm5uQ/aT22qdXM7+DG9dBlfXQQZ
 yOCIUPrmbFVsBZidylfPky22sBwJcciv4tY4ud3K9qruS6rVOd6Eq3TA0k0rRuloLI2v/8OPUl4
 ads9WVQ1NEKG8ttZhjMRfAAJLci5IRHYRgDvJ832t5hHxJWQ8K1zT1ftdQ1nh6EXolGf+u3r3mW
 AwxroDcnDomfHF/cTp9WCxxx65eCrMoY3urLVYtu37lK+MsLwyJ27V53reFD5mj79OiMPwewzcX
 ynlLCCXy6XKXzb5pKwXY/4ZA9Ha/tMiFmCiAcY5tjlpaQW+X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vG6Pcoj3FozCZZyAZELdmMSiLPBx7xVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfXxz/2x4b5W+yV
 FYAY19I45ebXQh9Q5nIjTdg5Bn9sHWpAfC963FTvhIAXb2L2G0n0ZQFEh1Ft7NXjaR0kdBE7gpC
 u6RQNXOJXLrFmN+ywtKgkxp0zqIPtdTNGG2GBXC3ryxWFDLxUDznJzd/nOoKheue1+B2whiDJZZ
 lnjpFhfF5S01qt6GHoIOuCMB/iRsSYlspxRwP4PBInw+1EbkWSHVzje8VKhBQ+tmUw6c7dd0BUT
 Ew6y0rQVHynphX6cc4Ooj+X/IePwreShjctj2nxfXZT7n4LUJ6mWAT0jd2eiTK9C0wpY+3ciT5i
 2uhQO2y4B8HznPEVNRcGICP0z1GF6wX3o/cjp0n/eCG6vOCWNTpa1LQHfGrdDTgK3SOJY5hQ3ZI
 qJg+gcLI1uBAhR5bJnT/mp24aqQbMopHdcWG7P9cC844snYXvssNG/E93l5MJ61JzkfiDvmcF7x
 B6A7rW4J6P0vTRpj06A==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2bf58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BBJQNc9AFPM2Ar9AcygA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vG6Pcoj3FozCZZyAZELdmMSiLPBx7xVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35222-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:email];
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
X-Rspamd-Queue-Id: 58EF941F1AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight. Add
support for this GPIO controller.

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpio/Kconfig              |  10 ++
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-waveshare-dsi.c | 208 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..e24ad7e32034 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -804,6 +804,16 @@ config GPIO_VISCONTI
 	help
 	  Say yes here to support GPIO on Tohisba Visconti.
 
+config GPIO_WAVESHARE_DSI_TOUCH
+	tristate "Waveshare GPIO controller for DSI panels"
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for the GPIO and PWM controller found on Waveshare DSI
+	  TOUCH panel kits. It provides GPIOs (used for regulator control and
+          resets) and backlight support.
+
 config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
 	depends on MFD_WCD934X && OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..94f16f0f28d9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -206,6 +206,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
 obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
+obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
new file mode 100644
index 000000000000..38f52351bb58
--- /dev/null
+++ b/drivers/gpio/gpio-waveshare-dsi.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Waveshare International Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/fb.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+/* I2C registers of the microcontroller. */
+#define REG_TP		0x94
+#define REG_LCD		0x95
+#define REG_PWM		0x96
+#define REG_SIZE	0x97
+#define REG_ID		0x98
+#define REG_VERSION	0x99
+
+enum {
+	GPIO_AVDD = 0,
+	GPIO_PANEL_RESET = 1,
+	GPIO_BL_ENABLE = 2,
+	GPIO_IOVCC = 4,
+	GPIO_VCC = 8,
+	GPIO_TS_RESET = 9,
+};
+
+#define NUM_GPIO 16
+
+struct waveshare_gpio {
+	struct mutex dir_lock;
+	struct mutex pwr_lock;
+	struct regmap *regmap;
+	u16 poweron_state;
+
+	struct gpio_chip gc;
+};
+
+static const struct regmap_config waveshare_gpio_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_VERSION,
+};
+
+static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
+{
+	u16 pwr_state;
+
+	guard(mutex)(&state->pwr_lock);
+	pwr_state = state->poweron_state & BIT(offset);
+
+	return !!pwr_state;
+}
+
+static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
+{
+	u16 last_val;
+	int err;
+
+	guard(mutex)(&state->pwr_lock);
+
+	last_val = state->poweron_state;
+	if (value)
+		last_val |= BIT(offset);
+	else
+		last_val &= ~BIT(offset);
+
+	state->poweron_state = last_val;
+
+	err = regmap_write(state->regmap, REG_TP, last_val >> 8);
+	if (!err)
+		err = regmap_write(state->regmap, REG_LCD, last_val & 0xff);
+
+	return err;
+}
+
+static int waveshare_gpio_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int waveshare_gpio_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct waveshare_gpio *state = gpiochip_get_data(gc);
+
+	return waveshare_gpio_get(state, offset);
+}
+
+static int waveshare_gpio_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct waveshare_gpio *state = gpiochip_get_data(gc);
+
+	return waveshare_gpio_set(state, offset, value);
+}
+
+static int waveshare_gpio_update_status(struct backlight_device *bl)
+{
+	struct waveshare_gpio *state = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+
+	waveshare_gpio_set(state, GPIO_BL_ENABLE, brightness);
+
+	return regmap_write(state->regmap, REG_PWM, brightness);
+}
+
+static const struct backlight_ops waveshare_gpio_bl = {
+	.update_status = waveshare_gpio_update_status,
+};
+
+static int waveshare_gpio_probe(struct i2c_client *i2c)
+{
+	struct backlight_properties props = {};
+	struct waveshare_gpio *state;
+	struct device *dev = &i2c->dev;
+	struct backlight_device *bl;
+	struct regmap *regmap;
+	unsigned int data;
+	int ret;
+
+	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &state->dir_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(dev, &state->pwr_lock);
+	if (ret)
+		return ret;
+
+	regmap = devm_regmap_init_i2c(i2c, &waveshare_gpio_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate register map\n");
+
+	state->regmap = regmap;
+	i2c_set_clientdata(i2c, state);
+
+	ret = regmap_read(regmap, REG_ID, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel hw id = 0x%x\n", data);
+
+	ret = regmap_read(regmap, REG_SIZE, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel size = %d\n", data);
+
+	ret = regmap_read(regmap, REG_VERSION, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel mcu version = 0x%x\n", data);
+
+	ret = waveshare_gpio_set(state, GPIO_TS_RESET, 1);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to program GPIOs\n");
+
+	msleep(20);
+
+	state->gc.parent = dev;
+	state->gc.label = i2c->name;
+	state->gc.owner = THIS_MODULE;
+	state->gc.base = -1;
+	state->gc.ngpio = NUM_GPIO;
+
+	/* it is output only */
+	state->gc.get = waveshare_gpio_gpio_get;
+	state->gc.set = waveshare_gpio_gpio_set;
+	state->gc.get_direction = waveshare_gpio_gpio_get_direction;
+	state->gc.can_sleep = true;
+
+	ret = devm_gpiochip_add_data(dev, &state->gc, state);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to create gpiochip\n");
+
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = 255;
+	props.brightness = 255;
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, state,
+					    &waveshare_gpio_bl, &props);
+	return PTR_ERR_OR_ZERO(bl);
+}
+
+static const struct of_device_id waveshare_gpio_dt_ids[] = {
+	{ .compatible = "waveshare,dsi-touch-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, waveshare_gpio_dt_ids);
+
+static struct i2c_driver waveshare_gpio_regulator_driver = {
+	.driver = {
+		.name = "waveshare-regulator",
+		.of_match_table = of_match_ptr(waveshare_gpio_dt_ids),
+	},
+	.probe = waveshare_gpio_probe,
+};
+
+module_i2c_driver(waveshare_gpio_regulator_driver);
+
+MODULE_DESCRIPTION("GPIO controller driver for Waveshare DSI touch panels");
+MODULE_LICENSE("GPL");

-- 
2.47.3


