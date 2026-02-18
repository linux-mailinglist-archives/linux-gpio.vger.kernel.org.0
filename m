Return-Path: <linux-gpio+bounces-31784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FLtFhB9lWl8RwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:49:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE39154492
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A62430028CE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB215326927;
	Wed, 18 Feb 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAnZJBLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2qs59ax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3813D328B76
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404555; cv=none; b=EwwxRx24ZJPcGq2tcTygGrJqYDfkThexdTYiZ3EoFZDP+t65XhTP1dRUR6LzLzZHefSY2Xd7eVVMiUDDMYcT3FQal8jdGP12TW6Zmq9IhEuWa/4Wx6KDvqT2TpcywhbPpE+3s8eqo6Ik4UmB4CR8b2a+1qr3dPDhwAUaBLlsoYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404555; c=relaxed/simple;
	bh=YN7o/CAQgMzx4ghHr1Oe0xZH3sF4jxw68XqxWK7r4OM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sf2Di+rmJm+5jEyHl8ZqZGOGOmc2OaukeTfMb/kqRXg6Q1N7ncGhlVd9CfbTJpZ1ntQaxdx3KsGO+mYz4uw20rjtvbhUUmbZN065Pr7XEqs/tLNxymxEX9hXqVQ8Q6KigWsy+QoeO2Yo2WIZXuNi57yRvfdHzBU0COrqQH8H1ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAnZJBLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2qs59ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HN6KJL413923
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CGRp20VIUJzGZoTMF6dj1Y
	0VnGPC/Mj1dfDd1nmGyEA=; b=HAnZJBLrahXq2GEJ0LBw1saGpEH/IV/Yr/4E7p
	YZ7jrTl7Z6dc6WHzgcFSDTqdwAlUrj9fRmbZQvx7HnvjhoiAzMOWMu1aWcGiZRWO
	RSIrg77vIxfYftsLx/2kGvtsfswQYgj1HE+I9eCmeliTIYr0dClWpnVcvhu9zoy4
	cBzQ4c92WWym9f514bGZeamEsDTKe4LdLX2mIyoYTcbcyMaSd+CumyeATh91JAn5
	hwFYm2hK1ba8jmm6+eRw+1D3xJHTs+/40iLBhywxd3JDT/oYVjL1D+U9tu5mGq/M
	4cDDUpLXVvzOdkLCu+GtmD1hGb2/1JXtUhs8vpj5LFEdGrEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1q6s5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:49:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so2954766585a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404552; x=1772009352; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGRp20VIUJzGZoTMF6dj1Y0VnGPC/Mj1dfDd1nmGyEA=;
        b=d2qs59axHI/7n2nJ2WxyKhXGie+sQ53ClMCD5Ibrc4o6Vc0LVG0fyC1LizXnyKKlso
         hr/xXEGCio7leQIqwjkZpl1O662VpE4T3xb5kcn17HR78uPvmhdYS5LGN0sguS4H2ocL
         EDibf4E+hDXeq/aCgrmQNePtbSSnuxnIhat3aq9qAaxsTX455CVHtAJUVKor9Qu+srDn
         FVAe72YqGiBG3xn8ayNtnae5u/FAKo33hicPHKz094omif/+zJCn+JGvHjedVyEkTqqe
         9EIvJVFxOg5SRtd1N8J4IeWqucoQlhQgj4GGDW9sUadm9ACLDM5WEcCYYZV8Y8ABTCeQ
         mBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404552; x=1772009352;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGRp20VIUJzGZoTMF6dj1Y0VnGPC/Mj1dfDd1nmGyEA=;
        b=b60tgaB4Jfy7gtE5HTHB2ZZMNvmQfvXObFIVpTcyiyGcg1+/aH2SHlDoQHloOCO0Nb
         +QSuVUv+Ws5Wjct7tbleiCyqMcqdfsAfe+lFfejTSMMRdLBZz8uREKb208w35rLZInRr
         QuTq7Htjy8FoJK22HQmvabGoEINMz2OIa4+6aWwXDbR6F2eCRZJtXuUiIcq5g0Dc16kR
         46k7Ey+3eaVlG5VMTXuIkdaXbC5hxKL3FAe90jH0mOyzQMFJIgg/KFpcRS03na8mWvvL
         LhN4bS2WyxRpE6mpT+gV0U/4kyrLmK2qHd2lJ8kG3Oepv2fj+WXTElfEtYD1y5/ygbQi
         0iVg==
X-Gm-Message-State: AOJu0YzvsfQpnAAYmrPrSMHeQc1VhJMWpC9dsZuNhGuN3h4mM4qlhHh7
	TUmUusbu8S6biEI9WXdkiUMSZQwvuympdyN57O+SYFjNU4/50jnDAQ2wOcgsu3qgtYRhHJmsgys
	qNxeDwuDzP3HZWRXFnsOhfqswCMXBDB7uUYsVqVn5t89AMeeLdetCnloDB+KL09bWoXYWve5N
X-Gm-Gg: AZuq6aLWlwmOucR8dxdZsDyIg4Dc8F3Efgy8Ki0XLmP75gbWDNKLB7FTxYD573lJcAu
	WQBHVR16s/+vvnyg9a0rosuNW9okFNbZDxJ7M4OEL7JIQ4AFD46C8cw9TpsP1tzwDflVfCDcgab
	kjRONIX9plupdLG15IJ9Xl/BffODy5e3FoxQBpznOqH8eUZaYQ8BFaerXUWWHSVAckpGrR5AqaD
	KbhniG6P7yNYoUyKS+7Y4C/lrTfnAoQhSl7fTeisju8RFN6zXCSqTzdxoTai9BewXIkS+0t++pG
	Vn2AW7SePqvldRH9u9V/Z2Pv9cwbx3sPBOaW8C/fyXgdKxrjPjjnLBHrN/CnzejrqZkpytExh4H
	A1MbXJyIYolQqdBYl5d7QykU3lggTvocX1dvoTz1nV+JWH67+QhwF
X-Received: by 2002:a05:620a:1aaa:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cb4c039d86mr1694726885a.81.1771404552170;
        Wed, 18 Feb 2026 00:49:12 -0800 (PST)
X-Received: by 2002:a05:620a:1aaa:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cb4c039d86mr1694725485a.81.1771404551765;
        Wed, 18 Feb 2026 00:49:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0deeasm530700935e9.12.2026.02.18.00.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:49:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 09:48:59 +0100
Subject: [PATCH] dbus: daemon: watch for "add"/"remove" uevents instead of
 "bind"/"unbind"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-gpio-manager-bind-vs-add-v1-1-b47a44818f6d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPp8lWkC/x3MOQqAMBBA0auEqR3I5oJXEYtoxjiFMSQggnh3g
 +Ur/n+gUGYqMIoHMl1c+IwVqhGw7i4GQvbVoKXupFYDhsQnHi66QBkXjh6vgs57tNa2Upm+k2a
 FmqdMG9//eprf9wOZeQmNagAAAA==
X-Change-ID: 20260218-gpio-manager-bind-vs-add-44450137603c
To: David Lechner <dlechner@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YN7o/CAQgMzx4ghHr1Oe0xZH3sF4jxw68XqxWK7r4OM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplX0CFQfJWqs8+RDIGPxmCo/qVQjU3XRJnDuKb
 VEDOMA4A0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZV9AgAKCRAFnS7L/zaE
 w8oGEACVnHIUN7+58qZr5OVKePjOcCgmkQSlTuO+vqBoXj3rxGpk8s5aBNR86gdX3MfL7wxwLXu
 Frug0kItiCT8PWn4ekWhZ9EkRRJec6nWLY8GPXtRFGn2CL1URIBNlRTnlQysBJo65S3D1aPWPdc
 4jNTdlC4KLXBmDRFbOmcyGt40SOsUQr68mwBTpQTaYzImKioMdBeaHGlTnguZu3cui4KF1yh9Pj
 iERXFq1PhQ+uIP0juXvtIlYh1kyLLWG4yNckR3A3zfxzm1qsJg+prZKOCSka8ygLLctLnKOqj0Q
 eWAxBb4voOM7QYH3KkXVboqbhf+orne7d42F16O5lB8e5i9RLlSeNZjcd6GG5rMhO/+5ZdmYFx7
 qV0XMylXB9v04Rhn4I9rkeNOvXWGFu9BL46SnRV07xJbtEaZ3RlbENgiwvN7Lt090Q5H6vHKnXu
 37mbdvFCJ3DOpBTOT202gWeqdaT3Xygn0/Wbx04NWobI56HNlNbUGamf04wlHPk9fYG4Nl+c293
 cdVLevW4f39yGoB6OZTeb+0AXOF5xgDBOEwD/waFIRijFagV0YjM9sHbPpolTgTdEPhtq0TXHVN
 e2n0GF7ydRrTsM9viTjyeky+wlo2zlL3UiXpNATmpk0rp2TiE4q+lTm9uGxOM1jAP8Jb4EydwUv
 gS+5Zha1xIDdV0g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=K60v3iWI c=1 sm=1 tr=0 ts=69957d09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=cOMQYcUYbZg3jg2J3mMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: tBw5fhuEDAYl19XtBtNe-4cLuDtjwG24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NyBTYWx0ZWRfX8dTfQLRQ3Z9u
 +c0+CD4SRQSQ9EY2FIN+RKnhPST3LkbzBbAOuMHAUjDltuugm1mjjINUnp1SNNSyWYybswy8J66
 obJehW6mgLwlIs12oqecLVhENTDUwMg1hZzsGLWTRaMhucJ4KlbQqINKaDHqbWMuhUg5Zf/xh+P
 8B40w7J4xyssO+FiEmKLaTNiezi+GjyRs5TILtVrtS5wWK1dHG3vsUk2Yp4zqX9JhaNKQPAAW74
 9/cTrvWoD5i9fIsZuTlGBPrk00DUGwezOD5diFE7bYBtenaiWbxEy4qnn7fQqLJRM96JN+6v7V8
 MIg/uFGfv9WNBT1K2VfJSJ7tB49Q4jLkdpNcC8dy7+vdD9N4refxFVp4iII4dHyIemOigUfZCzX
 KRnW6F26FNQ//+u+6jHSvuSfUYTahTjQKijd3Hpo/wLJZWy69a8H8XZD9y25pb2mmq6WnrUbvAU
 iprXBXw6J/liFshJeKg==
X-Proofpoint-ORIG-GUID: tBw5fhuEDAYl19XtBtNe-4cLuDtjwG24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31784-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,baylibre.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BE39154492
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


