Return-Path: <linux-gpio+bounces-34244-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJpfLLZfxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34244-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:45:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C52342CA1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5661A3097E1D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858573AB290;
	Fri, 27 Mar 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJANN/J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZERQpbSe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68CC3382C5
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607495; cv=none; b=RIRG/wkUgYJjMFhHcuVQLqXQCtfGY7X3I8kj8445g04akBDDvX1Y5iWMOKxrj2ceJtZ4WjW4YYVEkkAIjCwIF8mJWzxMSZ211rIFx6iC+jH6nEZNO26ncWk6/qVewnrK5GYm6nLKp89jdv9VaTxu1N6gBGxDuI473dnu39ERKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607495; c=relaxed/simple;
	bh=KrXRFKkz+jF/UwU2ye387/82NSUQuTQydckj94JpMVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOEIsbxGi+zVfvMHV/0TbsyWbhjoMuHIWpzDe+m7r56ZLPCc9jS2+criuDnQXQWlF/CXkg95Ri3AMt7d+LtZoVixhLiuo3MxnjwrQ04fdv2C5u02Hemp4EK/JNk8LQBr1JX0IR/B9NlOuvEs/TOV4SGMAyMip6cX+viaJP3m/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJANN/J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZERQpbSe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vtPA3716302
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5hfaYAFxKyc2m5Hj2P39tbeouZR45XwtpVCilRgDEs=; b=mJANN/J/ZmFtIfLP
	QooTy8MSKHdmYNWaD2BGikTssecPR/9nfC+mJRD997MacSw/BMOAF+ABIVRkmf50
	2RIDNLYHqOuG8KsAZmMq18xvhXtXRmM6kF/pwLIDV5CuU4bxI8tncs+a0jQVLjv7
	R1CycZtv3/k+X/t8QXRoUX34/+yfmniqgIrM296wu6K9Z82vJY9FqVolvaTXz6cx
	GUQYZoNKgEvZa3extJAqAK5BIbbP2ZC3iCRgqmPO+ZH5gJ6kn7EcB7M0niFqcMN4
	7EwFfwaRRb35ZEbEqtP7kOrn9ISm7i49/FGjV6SAmPIzSBYn6wMWC68J0N7gHvkz
	InCm1A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6jc0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60503c61e89so66050137.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607491; x=1775212291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5hfaYAFxKyc2m5Hj2P39tbeouZR45XwtpVCilRgDEs=;
        b=ZERQpbSefOC2NttblU5gJur9hOCwWb7Qys2gjkyLW11R0SKPy8r5wGN5054C/eDA8L
         skuyuoS9e5fn2+4ED6dMeyBE9bz0ykO7LpxJ4eqPoUdw/uygH7jjxmMe9dsgG5A4RmOy
         JsQ3vJJbAM6BteS3ZqD1PPkLlW/ooRubc5eTp9He0gJFQKeHVAlsfgpjEWLDOtzcw3j9
         Faaw53sXiQNI5UzdbOH6aRR7XkP5vn/wTfF/FfjtOvxjALGNsFSKvTmIm4WGgrwoZb4J
         l7R6yY6WPdxO8zhd3ln6VzBm7oq9JqZh7F2TopBAYpNDipBF9vy0dlLytzcExAg74lr0
         0etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607491; x=1775212291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5hfaYAFxKyc2m5Hj2P39tbeouZR45XwtpVCilRgDEs=;
        b=Sqx5oIzL1lhSc1bOVw508pvt59owNjMz8qsm1YC/E5Kk2b8XSiTdqvSOSY+iqjndtq
         UfpTjam5dSCxdBFBJCJSBVXk9bptaOrbFYoAeKmrBnmUl3sITmpjK8T6IXoHMN2PkpP1
         nnET+KKhHmtsWOmGzup6OuJK6DZzBzi/GVdAxToscd0trJyvJYFhkk1uu9og19l0+Ftx
         Ie8GTlbbDyyVhsIACV38WSmugQJ91LoW5RpIN4ZXuO6E/Yf8gp9yLDRLSBZh3dVrfXkv
         ekISrmoR4ajaMJWrmDBXkA+Yf2GMc95SOAjeq18KgGmqmTMizhab+AtIIlugmRjMyJma
         YH7w==
X-Gm-Message-State: AOJu0YwVVRH4gRALs8j8k4mAZ6aPu6gvZgp4ci92C8NcFATt02Aog1eN
	EbqelaPh8NO9gdJqbGJSZoMaKdB4s8C9/mxJTw7YNC+5TASeA35Cs9I9oCNQxXRGF9j/7wKficj
	UWDA4s2oYH6BSxJNOmAwD3R2A49vB83aMobWDsBMH0YbQYo6K42eFathMvMBX29ET
X-Gm-Gg: ATEYQzwfPdWxjVBmiJlDhC/UcElYtKPI7yMdls67Q92WUzuSxtFiqIBhf4b9acx+IcX
	QuZ6JOaqiK/8QH2mHK/QRoqzR+ZJ6b2fwgMt7LFz390ir99nEWr03GXuTHj4mdM4Kq/49+7E2BR
	n8JeSo9+n6jQOYGGQaYZsQAlVRch2tJeZOSVUC95H7ekrv1qcZUwaqfGp2GuTUXlQ4soBnKrgio
	442BE6QEMttjyzMLpUI0ZBatU2O65MX2Fwwb6bZOk669OU9DCHKckOXVQMR7TZOFuAaimnbcvbv
	eOkacZsDCXX1iU5yM8AKwTGncZjtsqU575FGFOdcIEL8i5w6bBEx2eaf7IhHbv+L16901M/xCdN
	9uB0rzp9zLRJSzMWSH2kg+kPvt+w6UznIGT7VKlNH6SBemY0WjPU=
X-Received: by 2002:a05:6102:524a:b0:602:ac40:96ad with SMTP id ada2fe7eead31-604f9302ee6mr724959137.30.1774607490950;
        Fri, 27 Mar 2026 03:31:30 -0700 (PDT)
X-Received: by 2002:a05:6102:524a:b0:602:ac40:96ad with SMTP id ada2fe7eead31-604f9302ee6mr724948137.30.1774607490385;
        Fri, 27 Mar 2026 03:31:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm13382138f8f.16.2026.03.27.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:31:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:31:11 +0100
Subject: [PATCH 1/4] gpio: sim: stop using dev-sync-probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-kill-dev-sync-probe-v1-1-efac254f1a1d@oss.qualcomm.com>
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4666;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KrXRFKkz+jF/UwU2ye387/82NSUQuTQydckj94JpMVo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxlx6fbHoe0JGXF87CeGIM7R+wqh0Q5qewdDCi
 6S8H6vIPDiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZcegAKCRAFnS7L/zaE
 w0PJEACMaD6HcUHNPOrWJPsFePi5AGVodPeSUP8S0N3+oKBH/EuE72gUMAN47OSpNbQfmc33Rhl
 +6MV3HB/qmOOlScAzwynXtONfD+s1YnlDwrD6IDHhDjJ6br50UsqrwqO7xes1fgcrngLWYyIwqq
 5VmOpavG2qOtvanq/GtkM2PFup/Aw2791gMHcgvo569US7PEVXDt1og76HhB6BYEdrrt9woblz6
 ZdD9bX7TXXiJmvCR759t+7yuSESbwBjcURspjrqRIcjwGJAlAe7b0lsOZZrx2OtwHMQXBOu7tw9
 V9myeaQ3QeAmM9Dx+ZWVks7+rS1WGWI9rei06qF5a5yjrn1H0oubEvOIQ5ZuncYhlvkibm1lzPh
 REObms3uoRqRVtON9XtiIcWVGzEvNeaK2HGkn0sVpnht4GioZbB8g57cc9cjai12HbVXqCIV6Su
 hoMPXQhL3wpFDrEhqt29waClwr99Ue5WAzcWhIlPezjtKxha/2dnxtpyI8HbtNJ+rFuf1vvAC/5
 ZwwlJy4bbB5aKs1KxA4vfSgBpesB/i+OZ6qvaXPi1hLMbcGgM+vCpIXj8B9SEelzGt0S3ognJUm
 4joDwsNGW+1rg4C1N0iv7QmQNmNwAfOzaFz4HmQWJ98Ji6w66TGf7BP+Tmk2aXLFFEudtY1g0lx
 NjN73/iRj22Q2AQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c65c83 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PNVl03acetVcUdc3VX8A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 24dNacvRqwbC_N9YoE071TpmMv4mV8ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX2zwQBGxmwHN+
 LK+vAZLNuVzZuarY0PMok2Uno9qtTtEF9qeH+dGLIWLL6sn7vdMKQJtXaqtrolLFzJnEyuKv4Yc
 miqhYFag+30qwtyBtUmDO++Jr+S/7mJCvADKwB9rms2JlpEw0b3r8fjFNUD3yvvh5KyiqPeU7CR
 INK+qtT7ID0DZcMS4BKMmIdpcfp/2lXpokn/5SRJP8V5t9F/xTGPQgnOdwGZxBZe2Vv/kYhQNOt
 LjNJkEgi6HMQZlvHdKt5yQ8nd9uc7Jglivcv59OedaLy04O6B5ns6SCgXFa42c4ANkFn+7f9Pbp
 JH54z/6E6uaEYYm3IvhHNKCqnwYsp165Fzi0LA4PmPBethSvvsWs3eopV+1jm1EHltQdh+sreI5
 +FAlYOpueOOZelhQXIruOnOf9qaSlGAzUqvjKO8k0IwH2C790cwiL3CWPTaC7kHRfkdUE8MYv8e
 vzqvK/K0KenX9uDJONg==
X-Proofpoint-ORIG-GUID: 24dNacvRqwbC_N9YoE071TpmMv4mV8ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34244-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95C52342CA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dev-err-probe is an overengineered solution to a simple problem. Use a
combination of wait_for_probe() and device_is_bound() to synchronously
wait for the platform device to probe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig    |  1 -
 drivers/gpio/gpio-sim.c | 49 +++++++++++++++++++++++++++++--------------------
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4c3f6ec336c16129301613aadc8b22587b217005..a603406cb2e53a89e1da6214a3c1c256d5246be7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2036,7 +2036,6 @@ config GPIO_SIM
 	tristate "GPIO Simulator Module"
 	select IRQ_SIM
 	select CONFIGFS_FS
-	select DEV_SYNC_PROBE
 	help
 	  This enables the GPIO simulator - a configfs-based GPIO testing
 	  driver.
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index f32674230237eb08bbf8dd1337a79b5d0aa13259..e19701c2ed673f8ec5a2475e632388197a78339c 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -36,8 +36,6 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
-#include "dev-sync-probe.h"
-
 #define GPIO_SIM_NGPIO_MAX	1024
 #define GPIO_SIM_PROP_MAX	5 /* Max 4 properties + sentinel. */
 #define GPIO_SIM_HOG_PROP_MAX	5
@@ -546,7 +544,7 @@ static struct platform_driver gpio_sim_driver = {
 };
 
 struct gpio_sim_device {
-	struct dev_sync_probe_data probe_data;
+	struct platform_device *pdev;
 	struct config_group group;
 
 	int id;
@@ -673,7 +671,7 @@ static bool gpio_sim_device_is_live(struct gpio_sim_device *dev)
 {
 	lockdep_assert_held(&dev->lock);
 
-	return !!dev->probe_data.pdev;
+	return !!dev->pdev;
 }
 
 static char *gpio_sim_strdup_trimmed(const char *str, size_t count)
@@ -695,7 +693,7 @@ static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->probe_data.pdev;
+	pdev = dev->pdev;
 	if (pdev)
 		return sprintf(page, "%s\n", dev_name(&pdev->dev));
 
@@ -900,6 +898,7 @@ static bool gpio_sim_bank_labels_non_unique(struct gpio_sim_device *dev)
 static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 {
 	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
 	struct fwnode_handle *swnode;
 	struct gpio_sim_bank *bank;
 	int ret;
@@ -927,28 +926,39 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 		bank->swnode = gpio_sim_make_bank_swnode(bank, swnode);
 		if (IS_ERR(bank->swnode)) {
 			ret = PTR_ERR(bank->swnode);
-			gpio_sim_remove_swnode_recursive(swnode);
-			return ret;
+			goto err_remove_swnode;
 		}
 
 		ret = gpio_sim_bank_add_hogs(bank);
-		if (ret) {
-			gpio_sim_remove_swnode_recursive(swnode);
-			return ret;
-		}
+		if (ret)
+			goto err_remove_swnode;
 	}
 
 	pdevinfo.name = "gpio-sim";
 	pdevinfo.fwnode = swnode;
 	pdevinfo.id = dev->id;
 
-	ret = dev_sync_probe_register(&dev->probe_data, &pdevinfo);
-	if (ret) {
-		gpio_sim_remove_swnode_recursive(swnode);
-		return ret;
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		goto err_remove_swnode;
+	}
+
+	wait_for_device_probe();
+	if (!device_is_bound(&pdev->dev)) {
+		ret = -ENXIO;
+		goto err_unregister_pdev;
 	}
 
+	dev->pdev = pdev;
 	return 0;
+
+err_unregister_pdev:
+	platform_device_unregister(pdev);
+err_remove_swnode:
+	gpio_sim_remove_swnode_recursive(swnode);
+
+	return ret;
 }
 
 static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
@@ -957,8 +967,9 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 
 	lockdep_assert_held(&dev->lock);
 
-	swnode = dev_fwnode(&dev->probe_data.pdev->dev);
-	dev_sync_probe_unregister(&dev->probe_data);
+	swnode = dev_fwnode(&dev->pdev->dev);
+	platform_device_unregister(dev->pdev);
+	dev->pdev = NULL;
 	gpio_sim_remove_swnode_recursive(swnode);
 }
 
@@ -1060,7 +1071,7 @@ static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
 	guard(mutex)(&dev->lock);
 
 	if (gpio_sim_device_is_live(dev))
-		return device_for_each_child(&dev->probe_data.pdev->dev, &ctx,
+		return device_for_each_child(&dev->pdev->dev, &ctx,
 					     gpio_sim_emit_chip_name);
 
 	return sprintf(page, "none\n");
@@ -1571,8 +1582,6 @@ gpio_sim_config_make_device_group(struct config_group *group, const char *name)
 	mutex_init(&dev->lock);
 	INIT_LIST_HEAD(&dev->bank_list);
 
-	dev_sync_probe_init(&dev->probe_data);
-
 	return &no_free_ptr(dev)->group;
 }
 

-- 
2.47.3


