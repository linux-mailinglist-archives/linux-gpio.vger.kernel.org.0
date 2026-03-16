Return-Path: <linux-gpio+bounces-33502-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC+UKGjTt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33502-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:54:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9329777E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F3F0302290C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455C23932F8;
	Mon, 16 Mar 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmRWhV8p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIlDKoq4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E23921C8
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654365; cv=none; b=iXS5NdjvpjOF6RZx5kojGexi/sGS7SmQsgjx/XxKTGg7H7MnRcVgGwyjq56u3tAZ7O5xIFFQ0BDezuvxqJ2GPWRjuySWOlKvzhoqRlWlHcx0r+WyNT3NFFE+w++KY9awvUcsrf+0K0/jknQgP/Akivc9Xv4i82m/PZkpa2dqgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654365; c=relaxed/simple;
	bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVgyMojkXmsD0xKT8gAc5Kf9VaW8cMcONG0VXUHoE+mTfs6r5Cp9RqtNXJVbn7TCKWxK7GIZQmyoUhSiP1Ct2LT8JpQxIB7nGhy2hdUGshH7eSLoVcFymNz1GkM+EosWGCGACQVCj8DCzW7v0Ewn/T6yBn4jBk7vGbkzOV8S2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmRWhV8p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIlDKoq4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G651jM1068005
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=MmRWhV8pxvq6yPAM
	Yg5E1WSc+BeQb4tX+XvJ2iUF3BjbIcU0ZH5WZLOgUYzAYRw/7eeCdhMbin4qtwWh
	FchyrhgzJ+vAGzFhWchYm7iXBPYgZCUgKcoV0dRKlibhTWrrrWrtiNvgo5KmeefG
	VyWfmOrp0y9G8UxLUetK4NviyuVlCozyEXASZgn6F0/SbZpHTJ0kB7KSGd/Nj2sd
	f+8xePkvt3dAR3HVM6WGKN6ZiMAKk+hazqGJYmUxIcbnwW8dctw1bI0zs3OfOxPh
	adpbDRI40qYCMnj/kEJEL01743iHjrrMuxU41dAps/QAazGcbWS13bGGXTwOPdTC
	X8ElmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027d4ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd858e8709so4896737285a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654361; x=1774259161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=IIlDKoq45Q52DgpC5tJOGkOVPd1MdgHiA6nLJP6f0pltP6RTVcXQab/y59WtKCplby
         SL4nAybqg+VW8iHCO2yAN2XLMzRxUylTnji/2Fg6ELYZ1BME9u8rIj1veNoi0b5xsLeu
         cB4uk8rjSD1kq3h9XVxbUFRXGmx90+q5YI8BC48JqiPGnxYmY4XU/guBa24FPdU2pULK
         yAj3Etq6WPy5IxwUnA9krb7joUCjQwU+WXStc6/p0aAMnUpfA3wNZkb0mwICkkAGJDLw
         wtOAoeCq7TS+X8E4nuPVk5d62wrk/rbfjRrOXIbE+nlg/fyqqX9FhGa7ZYdSPIzzFxCS
         wfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654361; x=1774259161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=o2Qtgw+uSS8JghSiUJnJ7vVa70zQ7SSMo2lyvjp8UyYCB1Bq9plJyVOp94KH83l3QQ
         utzgNB1OcgWUknjdgCjThBRw/VFVC5Sm535UHqYyz1SX7h7NI1mhEiPLVJ4k5pohB6Fa
         HxcgPpDwClGuAjClgqTBNgouJ9cJop5MtFgpVe9+orAbHQqOlkrTzpmM8NDy0Fv+PgYz
         IDYUVAMV+Vyv/TIzKCSvyXqfD1z4wWAU4jUSJX52aZC9rM8F86uhI00iHHX47WVG3azF
         I7bMRe6T2xGWwBYWdPksx47gybl/vVnT2Tx1T4y8tH/CGeV2DWngYWfFojXK1WPCxYUI
         9t2w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+115PAF6lGdUtT8wa9EuGiJQ4UgbEvzt7QSrsXnPbFQyQGId+Q3uag/ZUWvh0uD5yFv6C1rCVK6U@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4je48Ik5CLqfoo96s72rrc1Hv8/rogJbuXSBuZZj8zHIdwTca
	9X10ZN/gTqeAVRUdi7uLKSWOrNe5wlAxX+EdYuo2tTwCOGMAEVnVS0EJWopoQZiEvvOTVBGgvY/
	foiVAa8glHv+a1trBE0nf8OZbG+bDhvKswKhylyPdoxYeV4nYr6tTre4CAVTxRamM
X-Gm-Gg: ATEYQzxitk0tH1P28AC040uFqfnFh6dVoLCDZIcsxu5ipDIUK+KA1ILJUyS6IXgXgwo
	sx6dqjvSQ+OSrb4p2jcjuLadJ7nZHMcihM0Aj5gqXk8He+4xONOGY1iJUOs7OK4uLGBWz+1y+Ef
	0D+Kx6IQEMvYIeRsNRRCn43271JNntFgypSwQ0Ry9fR6kN9wWu3d/jVnRVEKTcba/R87fD3sLYZ
	kCoKJ30tJIVXT0icuRwH+MaQcQiP8nCtfWlmTsPa/a94c6lqvG9laQGdnoAHPI/cT0nsEev19Sb
	VCmyCTK5C+BVboYpd5A9Su4OrOVukUlR9L94G8IPIdN16VcRMTRVRQmz9bnSROe5E/9jrjPfKRY
	E/Z7bzs6pXWJB7qrRhf3zV0yJV4Sy94QxuQMwkq4U3g7wyNGGZyHa
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564738485a.6.1773654361422;
        Mon, 16 Mar 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564736685a.6.1773654360971;
        Mon, 16 Mar 2026 02:46:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:28 +0100
Subject: [PATCH v2 8/9] power: reset: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-8-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FBUPuNGhiF3uPrD3MLEpw265O2ryCfQa0A0
 3Zj48AI/n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQQAKCRAFnS7L/zaE
 w/O9EAChOyuMMoMQSI3Z2l1Ai1DTeM7NVpOttafe54EyetzU0xw8PjsPlMgISx0CWvQ0gahGXVq
 fw++E21GJiYXzpJ3b2aqPC7+zX+2H5Y5orVnw/nRobgzElec6gqJpUSmgt1YDLvxp0PtuPSm6Ya
 A4iXITqLKjd0udPk2gaJGei2UMy6fkjfX6uyNSO3TGmBLquvyFRSevreObYkrywIO+V8vgMiMpa
 wZpzyJZe7cDpXUdQRXxelUAxN0B3TcO/io+SOISUGGzvRwiGpfQQcGSjttrm6om3sHQdwjdIMyV
 toCf80JzUY2N7Ki13DRxjZVnCAOFIXuD2K59YObtzbB9iqtXojbGl+NFNYXRpjhlk7+LOdFCwVt
 Ys9JHWGMBrCk1t9+CpAgigQ1LbMxDP9+5EC1frWy4rS7uBZlOEaozyHrRn6q1i4NhSgPKlIFqU6
 E4Qs06xlH4ks+yPLrcLn5D7P1nGkri8AAIFhOWNYP5POm11KHxerWB02ZbqkwkvkUjLIkumX0wH
 xegWOZOlRuSPp2wPqnVW8WZQqOh3OPUOPIcPnt/UxPvPlLXsz/MvVFadH4CmLG7UVcsD81jpgk8
 L60flzwaTd17bTl5BJJTYa4ZBOk1876I9o7jppj4M2qDWpFv/RRgVGA/71+FMt4JBE9UpRcNRD8
 Kfg2tDgl4ySflcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Jk1pLTE8CGWptu-SMqyxF9uM5wbgeCwX
X-Proofpoint-ORIG-GUID: Jk1pLTE8CGWptu-SMqyxF9uM5wbgeCwX
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7d15a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX6+BjzYMXvXC8
 h8I9ML8uHaiEos78BOgyvl9IoooE4HrV/n6tdXyJLaWPaJ+PTL9Ke6+IYByWPXUJKv0P9xlrlAJ
 xFe2/FVnCy22OgCSHi3yfqo0ahcd1fq3As5GLukl2PP4a4hbQzv1DS4D4ce0GZwVobmH3lbQrZh
 y1RVi0PbNwZggevTxrp6UEl0ko5d1QKo7kxc4voTuy/RaAVFBRkjNkmeyJKB8uRiLySBNf4rX92
 0PGwiGM3Q0Dwi0mdPlfzGaot56ERzG54uJU6CVMZjtvOFBXqIWKoFFq8fIoO2P1FrRQ268hU31E
 Q7Yl5qa/OpfTPkb0rsVRF8xZO8OnlxuHktNx+uV0ob7CNbJTYZnmAoL7QF+8T6X4FAbtEnRIUU9
 JNWAUsuLu7cSKPSkfM+dMGyqv3mrC/5cTHvcAKgdtj/ksgW8H5P+kUmSZLRcOMuKee7wMDw+0SS
 8pOHA8pmbLzcTArsaDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33502-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DB9329777E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


