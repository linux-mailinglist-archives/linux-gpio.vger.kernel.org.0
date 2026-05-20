Return-Path: <linux-gpio+bounces-37198-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMF4IQeuDWq51QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37198-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:50:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05C58E34A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 096A9300B192
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 12:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DB03E1233;
	Wed, 20 May 2026 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9lM2V+c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4CSfoDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEE3DCD8B
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281335; cv=none; b=HkLPZk0B2TzZJcc5aRH/qCyBEQU6SYkFxSjec5KG/cZAssoETFM8dWp4I7uprlqGyUwArcNZshHrGVxBszTLjcQXGYt1PiTgOg2Eje1IZS4UvyVx0JwlKhTMM/plRiu+NRjNPVr5/Csf0jqJWzpCRiWCQBJPM8u+5yn/8/D/Cf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281335; c=relaxed/simple;
	bh=sSGluF6IeiELViBz7MuLzm6NtRc7KHjDoa/SIOeEL1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e7nL5S2euBxIL/OjkSU8NgIl0FLDnvRVhHsRU5Xm5xHrhlrfd6LW6BQ3dnQwaBko0tXkJ4+uuzImDpQd1HLwD7G2nW0a0TV+ahcZqKdvJK+dCOye79AncN5HY051tPTUXFpx9dKDcD5ry3XnAn7H31N6Jj+ARTtsUtBCTzKEDSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9lM2V+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4CSfoDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lf2m266960
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 12:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1zRqiJpltJl2FgANVheVGu
	JfMScxE1w+PBVqfKMXYUQ=; b=f9lM2V+clv0hZhKHssnN60Z86bUmciWZvnF7j+
	oXPoVeR74h+bGquQ0OvQWIV1wWtDyOkmpUfpC7XilGSGX6YYjmuWE30jHTXKQasY
	X8HVC+z6otQQNQVX4DLu84CA6c7s+iezPeoxpcGhVtf+v7ik5A9IZqM6vGFLv+bS
	vHb45l6Gtsz1FVRbCFEgIJPg5o0F5NeaGai5DOzApMjAE/ehuE7cP2PwLQQhSIvn
	HbJa9qsjMnyHNgWvpBLWdozpjg9ha72uLCW3+yNOyd59YQw9BHGIN0CAuud/2wOW
	CyDzaBxaZh9zOLa9l0eMUpwA9Nb1YUEp+2XMJFzMOVcON8mA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxrmdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 12:48:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so115813591cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281332; x=1779886132; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zRqiJpltJl2FgANVheVGuJfMScxE1w+PBVqfKMXYUQ=;
        b=D4CSfoDYsbm/cpX1KgSd7JsAG8BNgmk+gcVP8F4xEDCw3k1qcz3dSznQJfMtEUJ2OL
         JGUfZk9wxALzH0GPhxbaaCWXSwiZ6e5PEJ0v9NhWfK7auWrPQbuoDfQ0ZMSOam1jBa2u
         UVGOg7H+cNb0qqt3nlzb2vxPOx5KttXbUG2h966x20u9Ckz+REIgCu9RWNOXSXCpdSSL
         Z0lpktJA+DBSRvqvAQMFD+AtgVrpFAfjzloffIu57NFnJk60O5hdS7ne2KfxvQXamE1s
         260EBe6jX9cKITlvX/p03JEMzIHoYk1o6z9wiN0zH+UKxSnN4lCbz9cjJvE4tVqnQC+3
         bc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281332; x=1779886132;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zRqiJpltJl2FgANVheVGuJfMScxE1w+PBVqfKMXYUQ=;
        b=Xx/2jsu1a0zAvrLnv84/zeFa17dCiTB5gnAdHK7gEuCGx/LpJAUP8lOTpjqmsdBgWk
         pJK4KXTSfdyolfUBhcGUQsZmBVVNq/uJEalvdFzih7lK7GDb956UHVmBR6fsApY+qkFm
         5PdPd3bc2c0s3A3G2e+1pmfiBMA/cyCtxCBdEwj/ki1Owfu9ZFgw4B+fMaCCMe37enve
         u0Eg9kNrg2Kt+2GuU41OigMKKmFJUx/a7KW1je4iutgQPI8ao3oPbznVaWwrHDyWWjoM
         wQq+Qo1sCb/Ita5zQFVzsn0927NLBx1w3lR+YKuCWAGaDY3yFl3Lp1iS5ndhSTLgpxLm
         H9cQ==
X-Gm-Message-State: AOJu0YyL9m2vQLT2As2zup4g+BAPN/ouFCu2SXBNYUjDxll6XICRdL4S
	N7yW8vCoDj18PJam89UwoIJjZkP+lfGF3FJgR57cTaLcBboKxrWo4Cc7SI8BhnpJju2y4q5603H
	530lBTdsKQMiB8NVziuaHKH1/RQRPlQ17xBRqr/MzvbtmzNMwYsYeMjqTLewWKrSj
X-Gm-Gg: Acq92OH3JopBPdDsq5RME7BOYFx2UMk3XPIDDegdfblrmZ8NRFFe3ny7540gA4Pof8z
	dwxPygjCVP4NJhLfafqdNsfP+1Yu8RJYqBLMuvVZ61vWXBlAmRJ1rRlenxFIpSpxHz8R4jRfLKa
	Gw+lgPC+6691+NxnXa6UZOf8l2SpVi1DoU46c9s/jidmS4crezw7kaSJrZovFA2U8V7sXHUimPz
	NrGHfIKLXw4EBxczlf+EwZsKJGI/y+2K3IMx+6FGi2yb4Ttz3h5wVRaQIcXiYzxvESdzzVHCv9e
	E8jc8IUfGPfcXMJGiUM/I8QPcAQpsjWb5wQ+CoEnbeLieS5uN/F3ym8MR/ZBftpK2B1Nfa7a0oe
	c27Z3pf1v/9yiqYtuCfMXU4tvvAfNqGCZx65lwQUEvkCoWIgnL8c=
X-Received: by 2002:a05:622a:94:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-5164186d7ccmr343557341cf.23.1779281332103;
        Wed, 20 May 2026 05:48:52 -0700 (PDT)
X-Received: by 2002:a05:622a:94:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-5164186d7ccmr343556981cf.23.1779281331646;
        Wed, 20 May 2026 05:48:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm529772365e9.9.2026.05.20.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:48:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:48:43 +0200
Subject: [PATCH] gpio: shared: undo the vote of the proxy on GPIO free
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-gpio-shared-free-vote-v1-1-6c54966583e2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKqtDWoC/x3MMQ6DMAxG4asgz1hKE8rQq1QdQvmdeCHIqRBSx
 N0bMX7De40qTFHpNTQyHFq1bB2PcaBvjlsC69pN3vnZPb3jtGvhmqNhZTGAj/IDy+xDCHGZRIR
 6uxtEz/v7/lzXHxKJvO9nAAAA
X-Change-ID: 20260520-gpio-shared-free-vote-f62333ab4fff
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Vasut <marex@nabladev.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sSGluF6IeiELViBz7MuLzm6NtRc7KHjDoa/SIOeEL1s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDa2tjBwaDep4yjLEzp9X5o2hF6eIuNooj7W8r
 6ITpjbZLauJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag2trQAKCRAFnS7L/zaE
 w6SQD/0X5PLWbeUxBfYp8JXM/DPtD1GyC3fqY6NW6R9v9WLtev/o12h10Xty3UGUd7A3xBTkvwC
 KA3wcSGzNsy0qTuh4EehVEw0N7ACsmE1Rf4cWKLsPrwzIanZY9C4vbur1qbPqLbH01CirhFtzjf
 IOJyH18++6Ko5uHNV2G4DdIXRBlsY/nv3Dn+F4ZKVBZd3KsDV2lQ9te8HqVdlW44zJ8P7hKQJeR
 rZJMcmurQhMqdUp6WywBfnyhW+xRgz54GNMaUjTYpMha9AvEjJS1fk5ZTIfaoTiMxOuz2uJrL9b
 86TKjQldqGIyBglu+Yznm8tmjKsfp1c3U3qc/RN45xW8BwrB/Df8Uul/OHUhXF30gp338bhrLMM
 hQue1WOYiv/Fs6OGKZ5mw+WOJOVjr8ugnAdNP3mk0jAtNoWUXfLYUmGzc7/pZ+A8XqWbp2NKQVh
 stwLkw0svSC/rgfbNfHJZghlw9Pq4TLBxrveW1lwxl1saVAIiTF7QJ7X7RhmPTfQsNIaUhaFJ35
 K0yk4oDU+DxzuGU9IGohA609hdnnKjSSH5ZBU2RMuBxeRXFKsBKoCSZJKuldPby3+jwPt/eAfyC
 fZIWc6wtIGo0ch8XVV2TOLhR5KCPLyRxoH68vN3H3lxtGKyxIByeT4ijUHoxiFDYl2xB2wse/iG
 0rV+EczeHl1r86w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qCnBrwZMEzip9_vmKUktKUo9kw8Xu1Tt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfX6iUDyGKr9c6H
 3dGif94xegiXy88seQdLsp++S0CcZ8dutcPS5o3Bf4bGFVQ+RI3oatIWWNymKAHrwgfLt3GdZz4
 K+ylFKnfuMNTzfeTAjxGnH2f8EvyVUbbVA2OCgEeOO2X3Ha97Tzy1LBbOZjkxA6kgl4O8jxiQxQ
 p6D4xzT00/ztSnbzl8fw3il7zsi45ptWHeyp4V1YpdiTzDflcyk5jAqwhZF7yiVMP0oomG/xvVY
 oX39iEq2eNnbBwipumcCahJQ2vp6kqDUOGcMOruXcsX7Vu9SCxuHtqzd17pRWI3r5GV8PQwX+F8
 EuOKGMAtN+BchMsy37rvVnep+NjOu8ubM4JK92igqW2iU0Rt3Pxl7FNCqAHk/idzdQlVHhAPnQy
 lJSiUSUyiLG7XnEhvH3VIlrDF7Rd1+VqR4crt/iShMl+y1Q+bfwKiI0KVpFvgOJMxfuYPY9ea4P
 p1mWkpjl9jBxlK/QMRA==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dadb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=7zj2WKjIDvOZ5DgqT64A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: qCnBrwZMEzip9_vmKUktKUo9kw8Xu1Tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37198-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B05C58E34A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the user of a shared GPIO managed by gpio-shared-proxy calls
gpiod_put() to release it, we never undo the potential "vote" for
driving the shared line "high". In the free() callback, check if this
proxy voted for "high" and - if so - decrease the number of votes.

Note that we don't set the value back to "low" when the last user
releases the line in line with most GPIO drivers that leave the value
"as-is" in GPIO free() path.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Closes: https://sashiko.dev/#/patchset/20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d%40oss.qualcomm.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Sashiko commented on this pre-existing issue under my patch changing the
voting heuristic.
---
 drivers/gpio/gpio-shared-proxy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 29d7d2e4dfc02c34fb3f2abc343ee30b61579b66..0194371254bef6b6225611017e882cea1a7b92e9 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -108,6 +108,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	proxy->shared_desc->usecnt--;
 
+	if (proxy->voted_high) {
+		proxy->voted_high = false;
+		proxy->shared_desc->highcnt--;
+	}
+
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
 }

---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260520-gpio-shared-free-vote-f62333ab4fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


