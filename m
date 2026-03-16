Return-Path: <linux-gpio+bounces-33501-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEmpOoHUt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33501-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:59:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 426442978FA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF5C33061455
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71643921EA;
	Mon, 16 Mar 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hl+Lf4vz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M93Wp13i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CEC391E66
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654361; cv=none; b=up4IfI7Cmv6YwYYAZeswTK2Oad/Pg1pYX7w0L4ssNbyFW4tJMFccOd6Mqdti8FAuCbosBe6Hwdzv5ikrQ6qJFJ7bDUrjXzBz/zpyWJVZDunmyZvrjslFXUrZDIq9Pb7oSDhKM8ug6CMgyAZGLm6nbm3xIenGmsRAUD5IgJpRSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654361; c=relaxed/simple;
	bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alOYVMWnmaNUCJPZ3NZZoKaJPWV7RX6OuzPPQeoVUh/DGm+KNJ+G3MF2xjG2pLT3nELgR+rVH1cNGMiXPMYeuDR8L3r1pWrhyZ2SwNTAp48yEbeqPyB8ki+P8X5kw3qBFuRnvvB3SVkJQ6iK0FgyoiH4ctmrVOiReGdvURt5Abw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hl+Lf4vz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M93Wp13i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64e7N3777705
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=Hl+Lf4vzQn30io76
	uYKe/wekuPGHSCD0rDQuZCjaU4RRXLKlEdbTTQyBHIVcqcX7dyBk7/HSVyrShVuR
	VpFWb9CW5spylabrF+lL1RbHl3MOTCqyRaxjBGQbOSEdN0SnwIEmh2sm5PzLsa62
	wYsvkO5v03lh9l8NjrOoLRMHnWFZtqP9u1mRYS6I32QEan4yCXrDMbYVHRcqQ/9D
	3c/4TD5TMX4Em6ADmMb0SSLht8CvklmVQKEtoKxytufUza4m0b/FKpSXKadcJUzh
	M9rDc/soWG2pmcCGTGsJbllAYOym+wWcoRi07/Ric2/y8qIrlp9fgqcU44T8B2PP
	rAd+xA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vyyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:45:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd781c0d90so3146128885a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654359; x=1774259159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=M93Wp13iGsvelwKMc/qfujoHdwXW/nphRoiJOqh/X/HBVeir7t++E5F/oTUlbSVkd7
         u5CAqXzSamFq8+0bp/wEXrsQjOzTH8dDAGGeLkGUkMYz01VUqqPKGDwflJHmLyRzf9B0
         /QrSmm54+dffDPw6cTWzyYYeCsp7TqEvKVjaImGoOb/cPoW5m32Ed1lNlDs4zfJW4BCb
         jTKP3xQsurOb7Y7qL+JKoUT2tlfbW7f7suh7V136PMLe2lGSpr3wNYiI5IqDSY7fQ9G7
         s/EeF4jYDiFsTsbXwhvokZ64hKIvbI8Z2MSqvOnYN3L+S0c264n6evgU0GJwGI5P3e9N
         PzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654359; x=1774259159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=Hy7ORak9Hf2DAAMG0tHh6p5Vv+QPVrf6+vSTgPNUecB33VP8zlQMknhoLBJAUFpPa0
         StI76BV04IW4j0uUXM4myQQ01qy4VkMZ4iYunOA9H7S66T4S0/WCvTn2IQiR4mk9ZC5c
         4dROz3X4ME3WtCi/u7MK2EyeMQ7XmQ61Mhg2llm3dBnhZ5/hLRKf4FUtsGd7m481gzA9
         JIhHDONpRmcn3K6n0MO1tQ9lBN75dBfH39cvYIX/w3A/QxUX6xLVrCuf5hn7zp8o0zd0
         kfo39TyBQorgAbq09I+Rp1DceAv7Qt2bjm32Dfd/LxuDmcNOq0471sXSkdLzkoIV1E9h
         6XSA==
X-Forwarded-Encrypted: i=1; AJvYcCULULpyJUX2Ty+S1UHBZUdM5mFqtwNNQn5vvEMOEGKuJ1MRdR1B8kgqq1dTVsn3Cq6jJkxB12+AY134@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCfNCifZwv0m5wjck4Ia9vuUa3qaleihimY4mFf1RGnDuuoA+
	14pkhqrHPqdOeDPdjMIagysZHfJ0QLvTPgSuoC7r4C++ZEem1P4FFSHXdYCIbLl8KbYzo3r4pNM
	3ZGINFWrzJ988IJbvKP2X38adXuIlOO67aFnmzDSZuoW0sypPJEd+AGXK/ZJYHkZJePEtUKu2
X-Gm-Gg: ATEYQzwHhrjS2Fz61ooxyfre3FYqOHVnRFuhILnwTlJ2kZe6aHcM/dQ3EbHiqcQwtNf
	Ezl1LjVao8DgudVmQE9fA3oupEC+40kpNQDEeHL5723LGzUrOlh9ZgBeP92/XwUU/7SAacLIIzF
	9dvtv3Y+LwUiBGsNTfk5orj2uk7zOBmZT45yc1mmqAzg4/gR683UrP++o4B+xT8HUWBN8Yh2Yux
	g566tCDD/VnJ7yhVEXbkourW3+1hwLcf/rAD9fV4ZfCfehg8bsfAe7KfSn5HOMJwKNjl6dzTciY
	uEB28yXEu43AzwAYF47Se6Qsb5rithSvnwQ6nvT2SxopCJhDXR5Mum+Q76hBZIUxQG2sgRkToJ4
	J6ohm5HrJMK/neiqIJzqz9dVpgE+Y4xY0iwzKxZGaPaXPgl/ylgmM
X-Received: by 2002:a05:620a:4414:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cdaa77964emr1854272585a.1.1773654358712;
        Mon, 16 Mar 2026 02:45:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cdaa77964emr1854269485a.1.1773654358246;
        Mon, 16 Mar 2026 02:45:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:27 +0100
Subject: [PATCH v2 7/9] staging: media: max96712: drop unneeded dependency
 on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-7-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FArM50N/90ynxEVRSFS/NTT+j+yQ+OqAswC
 54EDd8PnAaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQAAKCRAFnS7L/zaE
 w2ctD/9MKhohFhmRczPRr/AMx2JLdR9z7oMk+n5G8a1FtSDO5CTL607Gw7uz2zxKSciC11ogeJr
 3zFe8JsK1XRF2Nu24Z+zpR/oPpteX5Wq4AbVhT9cpLvZ0xGhjDiRzGQ+DO2Tftfq/Wx9WThBg/l
 68zbOWyVB4guzZaqOR0Wabb2NW05sEPwZKD6OafKLL16116FzD3ed/5tRszdwWGmzWghLrXyFZ3
 0fuw+qk16knXb6E7eaesQ77axJsF1A4t9mcd57UQhz8w0XqtI/A5HPeIwyh0rB1QtIEqn2HRkr+
 1X/UAyAvVzsMY6Kl+rRhcm3Iq1Br4Bo8pTWdK+O7H0GVcD07EiyubKif8CfMj23d0yW+5Gtrj84
 P3tWw046hxsNQmDgqURd+8t2r9qYc9pAPjheMlmmRat9AaWR3wQ3KHTVIRR4Z3ERwYLL8laOclW
 ldVMK5v6r4kdzJ5TjZqaIaIEkEyz1qbAaBAFLD7wdpMFowt6LxzNSYgo0Bifuv4Ig2+mx4vAIUj
 hvzS38tFSOVfpvLaY7UvDrqXefDEVp+dLdreYmr4FST6+bS0CiB1OU06jOioi2zTNZfjAN2EwgA
 UTLqBZ2xh2wNrOyFKAkzkfa/7pA7VZ8GaC3f6FI9qcfZtKSnSTO6w8LzFzW1YhHntTCAf2cf/Ql
 qVTwHDK48HzVnWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kn5agJ2LT9SJFQ1jGwHof8fi5fGkWMY9
X-Proofpoint-ORIG-GUID: kn5agJ2LT9SJFQ1jGwHof8fi5fGkWMY9
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7d157 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lbdJfbWXG8Zdtkr9XfcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX9sGzlNUYCUQW
 k3vC+E139yI3eh35XIVQnrOkJ5x9XnyVQuY6J80zKCsVVxQxBLuYZ0H5Q0fs5yqND64a398NXOp
 LASzCTkaNALPbNHztOOSm2y9sLLUIdeCawtwSS7FBjjmJ3dxutIs/fSiXwoWJeaoWWYlsX0TKkZ
 3CY9xUXErjpEnBIqoqjsa7LElfFgehFBpwSZLV2ZtcOQ2bsiXa3H5LkrSovuq+q6ac7rPd+hQb1
 3V4cbQNn+HBBv3L61MMTbvMhAaIc9w+MGDyVV7jPJ4uqgEkdl5ih2q2nI5fG2nEcpzi0Aliit/Y
 YXKVATStTw36J7p7ckZNvHSrJa8TY4VCNkfsGRm5P6fuPan3+vt1vydMkVUU0G8cjTz03JRinW5
 5BHAskQrzL6VegFcRWrQp62SbTRKYfdqHlQxasvdHLX6TbXmoRzpGet6wmD1mzQwC9QtLSAwMx4
 BseT6WlyJfB+68XVvkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33501-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 426442978FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd086cc3e5e95210503000d9e4d8738..93a2d583e90ddb2b797c5167a6d3373836e88126 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.47.3


