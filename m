Return-Path: <linux-gpio+bounces-34467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC0dEj+Ry2kuIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:17:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A44366E0D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 198B1311F246
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C254E3ED126;
	Tue, 31 Mar 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArdJqIV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFw20c8V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA523ECBED
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948265; cv=none; b=dK8hZ9lAVWwxZkpNVYOojUklXrPxHtgKbando91ydaeTzZ6DiHh9IuwX32wDtdNV67cB6fJ6UaaJN55bfMQB1WNxBx5F2TdPsaDa+0L7cYpe0jsxVW5Gc0gH7CK64nRM/C2zZ3hEsoGkwAXdhXT+mFpbFLUrLf9r66fk46vM9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948265; c=relaxed/simple;
	bh=MggrnFNmxk0naPdd55CShBS9dBhFo3e+IIWyy6ZAXM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8/MygePaTilnZE9Ih7HXX20CoSfsI2hbq2Q28FwRkv3bGEoQ+bdTr7CXg6TzL6R2G4rpJlppUL26U0t/dJEFz+8ab2VEybjgyZruHMnXeAmiR+ICj+JnxZDDZIKZeSOy8dFGLZESChjfLDmAbg6sijSgoBwBmWd/fh462iz1qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArdJqIV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFw20c8V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5l1rE1842388
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=; b=ArdJqIV92hGo7LI0
	LTN5FUViCm4vMFyX6FFaItBR8KioeKWDAXYutrTQWLlDTyCFACtRoOGN9yV9qhr+
	hNvDcFAjhuYmY28J/oVXgyHtzjuR+4DGlYM9k/GNGdKjfUZDrChdgP9VpDrbXQcj
	P/BzX0/+xBPz77kLgLwkL7scg9uff7GaBCbuyiS7JkXPvUEnRKsxch75uXUsklup
	Qk70V/aSxYAT1CeCq+AhK66AV/Yv2yJ4qBmoyotw/OgmLB4//LofQhOrTbuuGRcJ
	pEznIYEUv5/i0YWiyVVbc0+5aSiOTD0O3pu9NyZzIh/vyb93BZGPHlZ4V2QYmyTS
	kdAX+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsj9rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2cbe7223so178510221cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948262; x=1775553062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=;
        b=RFw20c8VcD78kJOcIORnX+XytK4G4MwChSD2TZwkWft/JjgRfHwRVdCmMYUgFsBKxI
         mDNW7ZgXjfEvYJnVK1vEe6rVbom2RaKjmEVvMpVFtPSVOaHIYZpmYJXyc7BtmIxofTm6
         XNS1Lm96PRRNO6QxX3Oj7X6h+E74OvQJxh992GjG32ZhI+Zdf1sQ76Kk4knab7o59LXI
         xtKN4FpZBPcJ+Ww6Ku8Rl502l9as35ajNRjHxSzfo55/DHuPLgDangbyNdWPpaM0/SDg
         qUooFCXwQobiiLIGtOC+qxVZeH/UUWBs5Rhfn8PDAKyFPJMoFUx0TAAZME7+sqpAOxtg
         Pqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948262; x=1775553062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=;
        b=qMdhE/lyncuZY/NuYIxcmIQeytvf0v5GyuCZ2UrZTi997rflXN6E/5268Tbj8QYt0x
         rBQyzjEm3jn8Vom546FFsW2Mk8cEvNBXA0GY2LM7AcJmu4HLIT1AFIqceSLp3YAAedc1
         VLxIK4v4+nEcxYUOrVoa7JkAvaDlggrG0uSuf8+umy8XFqwyvDOaFIEzywuSee+iLxBk
         KxckZ9f5QON1R22neyYsYTpo2InGS2attfQ8hqkTQ//hiEH05vwqX+L5zMAAX6GnwqQd
         400UvHnGx/kNFJcSbnP5mwQbg1H7OljqQzonu06TR3jgtRP6i9VjvowtyV1tpMoRuekl
         tSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn5VfTvEx7s3D9oqp/bm4w00HtrjbgATieeLTiqL2wcQJrT64pZXrGVkWrXvaAuRgT+0a2eTImgIKi@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpm+4T0qhiiq0tbTuJTYAE98U03cSIJq2cyi/9CMXTNFHPMIZ
	JIg6zImUACRv6Tsfk9sUtfl9/yvNzC25rVT8qejhLi6Qa3AT2IRWtkPYs9v3CyttoygiI54Vmma
	IiWn8mzPJfhQXh9EbKgzJK4I2D5x0lamDoizOpL3vExIudkuEbAvNUARjgyVMVYQrsvXMsEFM
X-Gm-Gg: ATEYQzwgE1kNxEWJp4ET5Y8tKniZQFWLN+zijV7/bbcVA8kutvDz5y8LC0/pV+pU9UE
	ENtZt45DWvteyMtCzQTCJ4My4aEOSqJZsRh/i9xB/Gnx8YSlR+HAibb0GYpH2ITCVau6L5P+NgZ
	k14S+AIlr0c9NzUQCGK9BMvpW2TiQh2334Kf6Qc0HJH+RS+KUIvaDCIaDHaPgbDZK2lD6qjLMYr
	J59AQS1M/MLaGWTkbcuXR+SYEZbFradruMbV17V+7HnMF8mrp7te+/0YzeUyqO3lMqnfJ3cUCDn
	yuBJZR5PIkLuS1gARc0Z4VkWp5uC+V1ZihK3R9qv9ZjbHPFmprZkEgguQOEiw2TEK5gl5Fcqy+j
	mFCT6J6VRJGjAQcmUTbb8KU99Ns8QnxHiCSLaPU1dg2YyYiDJdZU=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr213552901cf.17.1774948262573;
        Tue, 31 Mar 2026 02:11:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr213552511cf.17.1774948262145;
        Tue, 31 Mar 2026 02:11:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:11:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:10:48 +0200
Subject: [PATCH 2/3] ARM: pxa: pxa25x: attach software node to its target
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-pxa-gpio-swnodes-v1-2-f66d86d10d8d@oss.qualcomm.com>
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MggrnFNmxk0naPdd55CShBS9dBhFo3e+IIWyy6ZAXM4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+eJTJaOJhYYKrmHTnj/FYRzIsrwxAGxdqjY
 eY5kKkIs52JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPngAKCRAFnS7L/zaE
 w9UDD/wKlPtR2jkgbEGcUwqu/4G3iPPsVKXDDiCZ3KOss5xfDFeB9PpZ0/5vLAjJweK9Z1T31OY
 5R+4kR/SF3+Cl/AVC7aBQpYmRz4Omq8gJyRGH7UY1sQdpsjMxbCXC0+PXcM1ca1WVKL9WC0t9ne
 HBf34n+WU8tuZrlCpePgEfIU09bsnlujsDuE9cSCQpVtU615mPHFspniw1H0RhO3wxnYQ3Q5FkT
 Dgq2/ZqXKyfjx+p/MqqxzU/mloaLI4gzrp0FrV3zjLeeqHTaHBOTRf7XhZ20hdhzpRkyGi520Lz
 kpYLlj7G7SW3tLtyMRokZV+aHaiXEX6r03Taev+6RVPJspXK4DSCIikiF1xybsaurIDjl+wEo3U
 90BiEjLhBJXF1nDG6Ae7MNTYzTjCajJmNundWM3wT4c48uXi2MppZy34fxa8TDEN3vQG+llDrhk
 GpsfuVK6RS0AVXa/cSlbOjIoZ2i0PPjktyBwkfZhBH9w984j3f8IsHo7rVg7nTiX5hFmVJBK/3N
 i4Ky8newNbSqlWpABmW+PyMXN/S+1JvGQh5EUhAH0fBBgBMD4G7tfE4AVGeoQPljt05k7V+ngaL
 XnKMXtpVt9Mmy14gMrMyQhVADjreH//RLuu7uvSZZqf+9e0XslOEHAeB4WmZ0TVjM4c6Btjm1mg
 zFEG3cL0YXVIX9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OYOs9SNIO7fbRuF4f3yJ-7Cu2w6mH7CM
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb8fa7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=quDaMypmeenIOiKoCAoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OYOs9SNIO7fbRuF4f3yJ-7Cu2w6mH7CM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX/v1lLeKadaUq
 +U2CHanKw1z9PTWSKf53e+S85HeVsySzVO7O33rH60Ia+6etA/nv1vuvEMuCWl0Cs0rpyszXNaM
 ST7GCpOJiuMV12hik70gq27G7Fpmzm+YckuaTqzvWev7oKc9oKc9a4t0ad+HmzKjdlB3xJ28mjP
 aDnUonFTtp+LpsrNtigQNF4CiqFLdqmmGkqSh9C2cJLmi8JBZrtZQLQOFtGpQia7FbOWW9E6iDb
 gt96eqKafYQUWSA6Uleiw49Z/HIiYdPIxOd6r77M57DUaXSboEifQ9D+dn4b25Adk25luO2KU8n
 vEnVT5UXM0cHoFFGFkG3a8CiiZsOqb4IgWRuhbLeipI6vaE7iBb7NS8V53Z5Llyuru4Pv73AR6C
 uF3OXfUDog/GTkTvDjzqYdJskuZ7SP7nL7ycK/a0oeufK9Qu//znN5VveIPcKy2Qbh3OsC8kzoE
 tKkk/YTVG8a0YLVGbsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34467-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3A44366E0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Software node describing the GPIO controller for the pxa25x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa25x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 70509a5998142ec6b9c484e5f094751eda6db6cd..6875774f2cae1db4798d18c813f445bdc31b15de 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -179,7 +179,6 @@ void __init pxa25x_map_io(void)
 }
 
 static struct platform_device *pxa25x_devices[] __initdata = {
-	&pxa25x_device_gpio,
 	&pxa25x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -240,6 +239,10 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa25x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));

-- 
2.47.3


