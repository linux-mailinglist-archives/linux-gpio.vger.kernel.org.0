Return-Path: <linux-gpio+bounces-33495-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNroH4fSt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33495-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:51:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF629762C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B70EE3048889
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBAB38D009;
	Mon, 16 Mar 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG5AnnE/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7hqEiSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111D38E107
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654346; cv=none; b=L+19igEG2s/tWf7p+DiSDj3rV6vh0r8pfL1gmh+xHKgMPrT7/Be1Drv3TVHkuKg4mkStUUcljwXAsM6f3bDPp7ubqldj0YXiyZ04pZaoxTEYyN27r40sikMk4wKh9mo0HGZDT8qvZ7tvbiSk24rLGz59WrKfXeiFEZLsoez7nX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654346; c=relaxed/simple;
	bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/GMUZovPmMeBpuj5qw8kl0lGgwNUUIqoHVo71EYO1itnDkh5hJs2HAkHPvQ/iY53rgXMGV7jEVJlThrsa85vsTfYLipe/a7I5lQIhMgMAlkp3U6UjPJ0OEYNj/U3TP/ux6WPZPvQvRnoQsXkzPS35uooIEdAXpaxDarZoZoBoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG5AnnE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7hqEiSU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gNX663080
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=JG5AnnE/nAF8d/x5
	VNIZyMN8e+o8g6YrZNC+gLTWBEM1Xas+ZiKr89y/CXRTT4bT9RPPldEQ88BRua6G
	jrREyefTSQ9osqzwq9nJXafRLSdTWwTTp0QhGgPD+7YAzotryVWhbDWkRKnVvEs2
	aD9wb14V/8Q4yyCj9c047R9SfGoH81QjdHcH9MiA0ebcqJSUqpU79HIveU04njFU
	SpDqFhUq1HxphOPBVQ+ccAQ3+1o6zsHcrGy9uNTdoh4OcfMkTQpPHjnuf+XlkSt9
	pvq6nWtzXYYLT5syRvp3D+wxegyORD1kIWzYT10ntFCvBbF8BCXFkmEVH/mZRxYU
	QGl6pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043n2p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:45:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd409so565903685a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654344; x=1774259144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=Q7hqEiSUp5DnsGH3MFybGnH9GOdc7QSurgFSALV92gx+B3e+65py2pmc5p4aNIKCEc
         UecO27lJOt+8Ub7cc4buqfWZxh7UsCPemFxgCzfYU/RZ35E7odg5FdaKh6UhKVwUlURl
         JQlHN2H5WKZu0vHegTgUr90HWT62TKBJbPTrc4pShNcho9M76Wap+p9d9uVVy7WwNAkw
         o6W+dXFlkkjtytTqPRX1lEbHwoAzxEu4vy0AQ0cFL4Oxc9sdE9WapUMvOAFE8tZUQMYL
         puLVraS0Z6C4s26wkkYHF5z4jshul1n7C52Cbs9J1JKmaHoaHoj24zooTQKy9F4Dn+Ry
         8aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654344; x=1774259144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=iaJMSiBRcxmsO3z+nYw3oUO8+SL6fkA6EJNUVN8RP5OLRkY9bK8fFHIvRZ4xV5+7fJ
         m3UtlQjkEzWGOYDRgKQIObpLUHhxZpflqiQ9Cq6gubRs8NVPvLUcEiGZnjJhAvwSlVPQ
         UdAcXfEGmt1zcNxJMduRkBw0NJq2oHJGHdjID1gEndrci4mEbytaf2l6ncRRmxdBOjMX
         Blt9F1GDlmI4TKn+XeLRE6s/t6E3Rsm4aHFbLNPHwmcoN0dGCYz/rOm+vMxChC5LDdlj
         CIAgDOr79HmtCBAz14U+4nwAtuR0dHDldY2/aMmkhEOXxlSmryC7NALh7JujQ2OS/SaF
         oFmw==
X-Forwarded-Encrypted: i=1; AJvYcCXfaDNp+24yBnBIbF0+MLae1Qfc8/K0N4D/g8UbtbzPX+iUQh4Jy1toFigaBZCXUFxZo0cgXfX3wYbS@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAghIM19ooBx6/8GfVXXTlUrtsguD91bVkNbDRDPz3b7oEB2c
	/cLVZXWfP19Iw5NxmK2Un8GeY0AnrNMXg4UXjiHGxYW5+gTQ3SBoiX5RmZ/9sGqKGyCGPivAxMg
	HRRSsoJeBMRMB8DU95SSLPpnaW9lbvu/PK4dhNA/j5uhPsiogKMX5cL6mNPaobnEm
X-Gm-Gg: ATEYQzz5gHHXFfmbtRrXjvikwPagyUoQAi9MIf3yVYrgUtUz4eLGaaP7wgn1ZnfwvDF
	zJd75du+IVsVO2barwHoY2fOb6iLugVOxiAf3BboZdgFFJ4EIi9KXYrlgPBb35OYFqFFHOyINhh
	70ccEFna4EJCxWp97DwCIt7ngFAWBcwd6f7CMqRYA/LTsemImlGt78nsdyly5O188ucUnNpOV1I
	FPOgSFSXAyQv6pC1o5UdZGmNsm9LPNiGlNsBKRQ5RiNzTA6kClkjf/AK5Z+aHS+KHGvMA6OWw4I
	m5F3rPmDsMfbQRqjkz1+02iJTKduMxHklVz95K8YYagvOkgN18RLB7KRMPzijYIy9b6NugheyO+
	KMOdXt28J3wvZ+qKhHsXQFfCXve0QA5EUVXUw7zCpOWoStArCGarR
X-Received: by 2002:a05:620a:4488:b0:8cd:9a1d:507 with SMTP id af79cd13be357-8cdb5b05cbbmr1541325285a.53.1773654344084;
        Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:8cd:9a1d:507 with SMTP id af79cd13be357-8cdb5b05cbbmr1541321485a.53.1773654343591;
        Mon, 16 Mar 2026 02:45:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:21 +0100
Subject: [PATCH v2 1/9] arm64: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-1-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E50k0Yyy71AuZlT8Wc65mGgqmwiMHz+yTE9
 mBP//nBbEmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfROQAKCRAFnS7L/zaE
 wzh0EAC3O+9SFE3V6nL0tyeLcO0MhgOELnTHnumU0Trq6qxKGHWv2wW6+NzHZXi3AfchBdL0E51
 n/t4F7uCATqYUI7vKH8azhV/4lPHX8SmA3OVwnPbYWk9V2Dn/gnAev750KpWQtwnf9PSrz5Tjft
 DvYivEJMrr2Bliop6ub+CP/OkgFZ9/3ZNwVjGtd2wrTScmGg/p5AXyj9l+6kivWIxz7s6OmwV9k
 lK2dxVVy3J0Tsrz1TaQMYfulx+Yy8aom9UeRNHPlgdSokyA01eHQ7eLRtEhXFREQvZdRBh8+dGn
 NBiSftUMD81V/Oc9dB6rHXafNgk71B8rq8TYqW/mse/eywvTtgYkkrdKfD7dBktZM/sGCXcYyl/
 oKaPUBa/CQhpNu2cwQS5ono7MSRaKGG4sOdpQW0U8iuRuuMJSRCm5VLyD3rV85UFvLRoILKK+bc
 npCLMn6s60pbCe53JNECxMlnR31Q90oI/0aXVK28IFcM0xM4FTQnVVm7RqnDlyJHvB7V2CKNUUi
 lhEtZHCoAmOqaIiZyeTGFqYFKryUZNA7fNS/h59H42ZU5oFk0BoVvDfIkrx4+MjEOo9QzKMuAe3
 UN1ji24LppAAKJPaYClbLqeKvGJlGjbvOHxIcXPYqYmvb4EVe/30U2+xg/BDS8rFMEFj/re88ci
 MvP1Pmh1dsosBvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX84FaXjAPktuE
 RbutG67RMMs96HER7neCtznq1IoD3llR0IWGkbWMPJXAKgPEzlSqrtTuIQKSjjTqoUcEWGRDiNx
 ien5fiBg9LKRT1k44NwPO4DkTjCbXU0JUuL9o78zEhAI8cGJb2wi8bwTJ9bMq6720xwpfV41d7M
 IAxI7RtNSyMN8u/0GJVFoFFu4FJvV9bKXGKh6bdEkPE85emTM7C50nr1mgVVCL5EZNdHnC2QuLU
 JE3V67bz8YEInzzvZconWJ1q1WhR1FG6CJEicW4r/t1y2uxAQ0dnm9gdlWdj7VGuZrsu5mHK3PM
 IJD88ZN1oYU5nTUndnkHd6V9K54eg46AwxtT0tQSW4PgTJxrk3yDGG2ecf8jtT1hnq5KevvunqI
 H6Tc/lU/VbAqN+EYEdwYCLqvRxmLVZo9A4IlvgT2QGztIrpi1vJ38dq3D3/TAcBmeufDgTpImG+
 M/3hs6RI1Xa03nB72Yw==
X-Proofpoint-GUID: NCWbcRWGujfjAqs9BBmKN1Oqd7GZ36cb
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7d149 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nExzm2HfQztilrPChXAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NCWbcRWGujfjAqs9BBmKN1Oqd7GZ36cb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33495-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10CF629762C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419b4249a6860357da8b3dce2e2146d..9441ea827524df368f5aa1304b0122bebac3d245 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -245,7 +245,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806

-- 
2.47.3


