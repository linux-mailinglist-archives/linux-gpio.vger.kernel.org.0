Return-Path: <linux-gpio+bounces-31785-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CdkJnF9lWl8RwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31785-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:50:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1D1544CD
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32CE930028D6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAF532142B;
	Wed, 18 Feb 2026 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faq4qar8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hs8mu6s6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678D2741B5
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404652; cv=none; b=cnuXRN1cpp8M+bL+L88oAmwR/ik5T2RlLy8XLAUs7MImgY4mnvuwpsOe7j9xHCzDVMaMbZc6YmA3OnCa4un9KKuK3oQRcquHDyS/p4wkxVbIwoaK5JpElppdHy2tMGzseMTV5Z3ypi74INvrhvlrz6AP5se8F+m8wnM/COb5F9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404652; c=relaxed/simple;
	bh=DzYMixpCsVQBRGTk7c0hy7iISVBkUrOlXFfV+oZok+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=myd8UJrYOHVI+FnWRm63ZUDsPiFcU/ktp9Kqd2zhl4BKP3ZcBLY+m+v/c2VMIcis5p8ov+x2JJVySRyY7DHB4/ubPqO62ZEEUNhGYUF3uiUYGRr7LWgEqfT48gxqCrfxl46Is5y61jUIaqWa8JYUsFzlz1ndOBmp4wuWJnzp/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faq4qar8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hs8mu6s6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HKqen72784643
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uB0JxK8noh1LXqzhOw97LK
	l1QPWBrBC27tzFvv3+cuY=; b=faq4qar8NbLSdu7RONMP03c9wNFaSKJ5jqYaJf
	D5BcsSODJoSmomqbWDsHyVbe8xM5z7e39lSWibS3lGTAIvkphwzfirpaiCeE/mIQ
	/myNTAT6thJRRlFP9PKOiVR/pvzMrQzjF2qSA1g+FXJnzy34yQTIHnq0u1DeW2Jc
	1cV77/UNyG/tSn4IiO8UbVdC776P5sM5DHTxHZKh3cR63ACJBSpAatVR6j+1ieJ4
	6SmaMQEpzR8UizJfTCHQhst5RWw/oDUrZxH74Ic0LAVOgU6mirWSQzUZ/VOLJhgI
	7ybF1nGY2ent3jbO9CF9DBmKstjViP8x9Q+9bCHUg6EhxEMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk1jtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:50:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so3073267385a.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404650; x=1772009450; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uB0JxK8noh1LXqzhOw97LKl1QPWBrBC27tzFvv3+cuY=;
        b=Hs8mu6s6Pz6lvCTU80wdcw/fJ3IJs8diD+/IcLjn39Gj9x6Tmue5s0kVYiIjGXrByQ
         zm1i1dQ9nVu26X8eR2K5z4oP21HhlhyPbo/7V4ZumDfajxxcGQL76kbl8qU0k9KCC3my
         nN7vP/rRI720JSguxvSa3BSVYydSV0m/h7tZnLs2k6QF6g8wbLJ4putvh/BUd15VVySG
         hj6hjerdR4ggNKLrPd5hPXEOO+aNE25+sUSFgNOMtxTYR3sRRc5sCWZlNQ86jCP7QUYo
         JEicDGYxjh38VR1Ng3kJAH03fUksHtIbdmDGFW1o+v5oUQeYUIpoh9h8rqhVNlPL97Wd
         8dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404650; x=1772009450;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB0JxK8noh1LXqzhOw97LKl1QPWBrBC27tzFvv3+cuY=;
        b=R8dJVf3a9pXa3LFlcYa5PNn6BmZVA19L44aytPnja0M57FqjkzKPFApOShPy1lz60O
         wpi8FC9ncBgVzhJi6ZyCIMnpIfO+RxCdJhgRWLL2EipW6VH9L86j3Bml2Se90lON1s/L
         AMtEmnFxiDxAGvmzWuUR5DkzTszuDQDVTd+7I3M9+X/ZNBxep1vye5Q+wE70zYTJmszz
         okahxhiaRtrSHIDdLs1Dhxv7oIdOBlMWR44SCoUXO7TG2vFOYTM2PP7ohPb5ukDjjquc
         v7Rx5ChGraF+NGFSzqmiCSOCN1wXZbjk8ZWE8duxaw8Yjr+G2dhS2NEfs0Wp2lkPFadr
         uHlA==
X-Gm-Message-State: AOJu0YzjcgdF2y1kBYQv07ddi5cESaRNds1TRds19RZB9PeVl7zIoL/7
	Qf1zBnLVSDUg7o+a5/cuZ6fZp7kyBS63Oj5pA3sehhRWnHHKs8hMTZFm969CDjwKc23Na06nt4v
	gJtokuTZuwoE3/L7hKbYAIHLA5hDi/YLW6BBzfy/sXAzvTo+bQDe6n1H7XWEseB/gQW/2u8Tg
X-Gm-Gg: AZuq6aLIsJadw4xXmf0Mr7F5TbF4q7Gjue389L45vOEeW9+8LTQZCvZSmeB5Ta7GUSc
	Kqtrg4iTz8ZfJ+eSBLvI/3j4YRtDg6kBINPjiI3jDNVEQb4HPfXe6oQhGIZTCl2+p4N2CNoAAOp
	Cp9d+LNl98MdolH5WNMIXQ2uFLNk73jXO6EaH2LQTqZ7V0Nbsrw5Lii6tYWpu9lud2ATgRwLXx8
	U0NmRER57N4MfjkubULBmmYUqitTF8aa+9oZOc69kOyTULO8kpTqvsnDnDC1Dlz6eX9776b+Z5C
	QkzSoucqjuTRtOSAj0oi5q0qViK0cH3RGaK6mynoVdZk33jwNk78FJbj94eB+mNyZ9TtST5zsq8
	bxsEsBaK7PQgoURnKkA3nf7KmYkQsYf1kPfobAgjgeMzMrotjHbEz
X-Received: by 2002:a05:620a:4003:b0:8cb:38f2:6a5e with SMTP id af79cd13be357-8cb422823efmr1893753185a.25.1771404649817;
        Wed, 18 Feb 2026 00:50:49 -0800 (PST)
X-Received: by 2002:a05:620a:4003:b0:8cb:38f2:6a5e with SMTP id af79cd13be357-8cb422823efmr1893751985a.25.1771404649356;
        Wed, 18 Feb 2026 00:50:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483970ce7d2sm31246375e9.0.2026.02.18.00.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:50:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 09:50:44 +0100
Subject: [PATCH libgpiod] dbus: daemon: watch for "add"/"remove" uevents
 instead of "bind"/"unbind"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGN9lWkC/4WNQQqDMBBFryKz7khGU5Wueo/iIpqoA5po0oYW8
 e5NvUA3Hz6P//4OwXg2AW7ZDt5EDuxsKnTJoJ+UHQ2yTh0KUVSioAbHlR0uyqrReOzYaowBldY
 opbwKKutKlD2k+erNwO9T/YCZu99QQ5vIxOHp/Of8jHTy//pISNjJWknZUDNU+u5CyLeXmnu3L
 HkKaI/j+AJ71HkZ0QAAAA==
X-Change-ID: 20260218-gpio-manager-bind-vs-add-44450137603c
To: David Lechner <dlechner@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1935;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DzYMixpCsVQBRGTk7c0hy7iISVBkUrOlXFfV+oZok+4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplX1m9WNZU+5xCnL9koYHUIAaMXTPTGY2Dpst4
 foZ+HzfR5WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZV9ZgAKCRAFnS7L/zaE
 w/r7D/oC9Lk0OIeeb+nJJJn9LxuUE1K5ZGeIqbTz71ZvykZYrTcgyaImsk5aD3ST98w+Oikezg0
 4VfshqaJgSczIAtCUozEP6cwTakMHWsF3R2sVODAqr87a/RTHIqZjtReTYdPxDhYPD7Z/WFqsFi
 J2Vj++YqEVkiIE66RgC/YquVttx7H03Pn0w1ACywyCgnDN+P7cdIlmr0yF6mLfUcvjI+wuOBOXe
 H0Kigypm26VawQQvJVef1gEXaSAfLg65ayA3NcbGik7UerJQSzAPtWD1GbtjzBlhvYFYYPpePCj
 5YSHxxSg+Rgl5B2k8O9sbZ4IUIUv6I0+jneqC0ul+7uwpj+8GFiHGOeuHH49gLgcqxF20xyg45a
 YOeD+HD5kofa3/Y9fsROiVgigIDZrum14JjWWhNpC4KnnmatP1627fq0C0FZeaFRVmB3dWWll9O
 UxAhPKwm0pYY0l0Fdyg4qKVlacErKRevnXaaX9EIUtHaDn8cn8Htj4lF3njwC1tu7lwFV02x6eF
 Y3Al8nzUKxLrHe3I9nGK5KFD0zm1GhD3h+fQBzuwScgUkOFlw7LZQB3kZkm6i3Sd6lfXUwurajh
 DU0XvXaS4ZzbG/ma+ME6NFmmProPbJ88hjNGeL5h4uFnCCS++EeurKwfEQjdr3bMtVQ99V4IFkc
 xbv8lvTw4m0pzAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DbMsUc22qjc8hH2ONfJEmVLsO_duA9dN
X-Proofpoint-ORIG-GUID: DbMsUc22qjc8hH2ONfJEmVLsO_duA9dN
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=69957d6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=cOMQYcUYbZg3jg2J3mMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3OCBTYWx0ZWRfX37bRFMSK20Ui
 Ca4MwwCzrMjKuEs45m9BWAXfsCTqaZbUyc7aDE3zY3O0CVmyukZF1ciJIGueyLVdmGchvwgpPNE
 mGTYROKP7mWcD9vfKBryB2lXSlX3lsIkU0uEN0P8XpCcQI9VCaL79qghZRad0R8wp2zejhbswr8
 vJhPueKHI/kdL7xtL7Ne65dq/ornj8opEnLfK+XDb9CIsyoaJmVtV9oH7K+vgBF1x/hj4zZNNuQ
 eNe7m+XwIgPh2awbdQgyVCeKu8U9RFskrcjqM72iU7P9YMMnKMW/quR6r4KSKg4IbfhZKmYMmMH
 tL21FPW2GVX+O0P9o98j+fTnANaqqE9TZf78o/Jfw8D7wK9j86vXhI5CJhfhWb6/a+YYC1cHkrO
 oiunBjPUReHRWlFanfD0HvioxfPm/4NWKf6qQFCXxvmg5JCbGRgwnMzvCQCj4ozYHPhU9EN+b/c
 2IyWnpulPjuJ7A401xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31785-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEC1D1544CD
X-Rspamd-Action: no action

Linux has a stub driver for GPIO devices (the ones on the GPIO bus, not
their parent devices!) but it only actually *binds* to it those devices
that don't have a firmware node attached. This means that in some cases,
a "dynamic" GPIO controller can remain unnoticed by gpio-manager.

This behavior is related to fw_devlink handling and - even if we changed
the kernel to bind all GPIO devices to the stub driver - a fix in
gpio-manager is easier to distribute than a kernel fix.

Since an *added* GPIO device is considered functional, even without
binding to the stub driver, we can rely on the "add"/"remove" uevent
pair when detecting when GPIO chips come and go.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Reported-by: David Lechner <dlechner@baylibre.com>
Closes: https://github.com/brgl/libgpiod/issues/175
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Resending with proper prefix.
---
 dbus/manager/daemon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
index 4627e8c96b420b8ad9e36bf7b884a702490d53f7..b9c295a55751d7d37d8a93033e9e1ad7ec8ac5af 100644
--- a/dbus/manager/daemon.c
+++ b/dbus/manager/daemon.c
@@ -785,9 +785,9 @@ static void gpiodbus_daemon_on_uevent(GUdevClient *udev G_GNUC_UNUSED,
 	g_debug("uevent: %s action on %s device",
 		action, g_udev_device_get_name(dev));
 
-	if (g_strcmp0(action, "bind") == 0)
+	if (g_strcmp0(action, "add") == 0)
 		gpiodbus_daemon_export_chip(self, dev);
-	else if (g_strcmp0(action, "unbind") == 0)
+	else if (g_strcmp0(action, "remove") == 0)
 		gpiodbus_daemon_unexport_chip(self, dev);
 }
 

---
base-commit: ff267fb439b5c307fe75b47bed4db11148b29ff1
change-id: 20260218-gpio-manager-bind-vs-add-44450137603c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


