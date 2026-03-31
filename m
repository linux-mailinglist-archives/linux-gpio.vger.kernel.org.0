Return-Path: <linux-gpio+bounces-34468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAp1KFyRy2kuIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:18:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4EA366E32
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1E5E3040146
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B7C3ED5A3;
	Tue, 31 Mar 2026 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdOc0tFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcjNU/bG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE63ED124
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948267; cv=none; b=FE6c5xWejaF7v3eX0xEE+7Dj9bnGdaNYP8QzELpnC9Q+Npfc1WR7U0IUgMeTfxgiT6FXk2+xRn23cAtYNe1w81yCesql58mqVwLDwQFr0Zv3D0WbRmcdAOZQUaF72eBKJRdTz5Yqw1E4KXyqCD8xhUwpaWEV5tk5fObacjwrreQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948267; c=relaxed/simple;
	bh=lXrcmBjNJ9rFUWWUhMV/Bc6GOxeDD8rw9zJqRe0nAas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWr5eSsreQus1e/OQv49oOyIWziO3TwEjTURyTqkGW6b79oxDoW88m6OOQ1nbn/r2DtDDZFgMaLujLUDrWB94yfa3N4mOCw10A9eWJZvZkfm9bBHS06DSVPkVAGNDYP0CYtxvCXm+5pvHcITixJ9BijRZU1uF1aDlIPGcNg1U+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdOc0tFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcjNU/bG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jttA2049398
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=; b=MdOc0tFzP0fitCoG
	RfYYIB4f8UbT+5mwQwxkxPB8CNsfA9uIMRnwbdETyvJR4aa2T5bk/DuBX9XAANsd
	wozjQ6FJ2Z+tdyqgXwPatehkoXTkX4vv42mtuJEpF70yrOVWzcB4UPgsMxLiOsCU
	5LdhlHHLaC5z7Fr26ft9KPFZ6xLFQLlEd08r3KKgE1w8Gbn7vAr12S1ZKVFUMtLx
	IjdkXbTSf05JXmMj34s86w8k2kEOMDSttGYtsTY2Qp5LlgXeTueKa0DF1yIGf7lk
	vYmvfPRF1FyUKfHhpCFw88XgjtDhpqsQEPADf7Zg6skpnAKGLGFs2UTYsyzC9pby
	dpG4zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yr393-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc648b036so1995231685a.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948264; x=1775553064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=;
        b=VcjNU/bGtPoRs+QFc9ESqS8PJqUWdH/qo3vvZAMshGVq5sAEydCAy67h/s159GnY+Q
         srkN5JlDlbj48g6Z+tqA3yJ5snF+kL01F524zrS5xjb8xlazvWU1EnzR4JIBupXoLRlp
         TZfIYWus/Mzkq/J4sp7m+R04Vq5axW5YCUjLz+mc43gBl0bBiPwxTZpDUIA3w884F72Q
         2LtLKIAXF2t1t3+J/bkpCevAwrNYqxEuW8I8Mh1zXhHM98Mmv5rAgfvla0jI88QIEOMo
         MV+n9JIl9LoKmqLQSehDYvv6bxCtKiCG4njHmJIihBrM3tDmjG/atWTdlv4uhiIrn6Q7
         4WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948264; x=1775553064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=;
        b=ikYIga75LvUffi2l/rvm740jsWT8lbV5MgSJTFVrXGhBjJxnz5dQZ+y2o1jjwWV8IM
         JjbslI8B+xgGMlNi0CHxWnQHaEmh2qHrpAGUhedkopBqyn+CjBfAtuPBC8q8QJVfLiNb
         OnEvazbHRQNf30A7u/c82IfA8CIU5z7Gu8DbGWo00gg+vcgG1A/ORR5b1IE7KdYsjm+6
         BePV8E29b0NlRZbRZnzInLs57B96KQuaBLpOuAAUuxGLqBmbafRKlqZg1wtLLwwkgANQ
         d7ID6aUc2wWFEQsnEUJ+A0unpVK8qO7CPRhlv0ZqWO0/8QplrI3x7M33QCCEogckxgnk
         ZBIA==
X-Forwarded-Encrypted: i=1; AJvYcCVbTLn0dh+lg18Sde3M8cFklpf6ULEOEYzmT11WEzokPm5JiQfm/B0VulpQkthtBGznv4Nx9AF5Bb/4@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0Y3pgAoCBOngEeKskPqt05+/NSvEXiZTVbAM1K99ILx172eS
	QgwlODDp52oq1B9E3z+fHaS31/VCsx9+Fo1aFa2jSSeLBmpZmUI23Hq8Dx3wg9ymQ/s87ivmOqN
	pVHpLdO2aJdALoeEqIlq3bcyskGP52VWwg8UZk1CcWDG2boHDsZJapdkYirQoXMgH
X-Gm-Gg: ATEYQzwVWHHPz6JQYyPcuwNXJd/zkO3yHrei7N7THAzvoKCz4HXLq3903x8A8aKQNNz
	QP2+uDMDdnVd15XtIsmxzKoDvpShfxbQA2flaVQTX7pc0XKON6mkYg+T0TlBdbQ8EaQo644FY6Z
	7X6K/hHJQpcOJ0dOvSndONoznp21Pzd4VmZc4BzjGyRpBT4NO0G6diM3bdSrUIQf96xhvwyLk7B
	hq4my44oSOpLgq19rXZkn49d23JFyTFnsX/DnrrzuuPKiAq9uv7RvxHwCuKE0uh04WuCLjwkXAO
	GVTKrMEoHTcEyfoGua5Wvov8Y4zDaVqacnAckFljo7mTvT4rGdBcOflNoAzZIGuzKHJdfEgse/l
	yltjbqiSlqkLQGTyFDICO5Wqs6Fa4YAxDTyok7qd/Fc/9sKmkInw=
X-Received: by 2002:a05:622a:5591:b0:509:2618:cef1 with SMTP id d75a77b69052e-50ba38c8f89mr207886441cf.47.1774948264417;
        Tue, 31 Mar 2026 02:11:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:509:2618:cef1 with SMTP id d75a77b69052e-50ba38c8f89mr207886131cf.47.1774948263973;
        Tue, 31 Mar 2026 02:11:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:11:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:10:49 +0200
Subject: [PATCH 3/3] ARM: pxa: pxa27x: attach software node to its target
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-pxa-gpio-swnodes-v1-3-f66d86d10d8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lXrcmBjNJ9rFUWWUhMV/Bc6GOxeDD8rw9zJqRe0nAas=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+faIwBvVqVTptRLwY9uBOcWoZ1SP2ZjfVS1
 qfCp61DhF6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPnwAKCRAFnS7L/zaE
 w3dKD/9E2WKXApEehXfzw9zlBzjYoF7Ps5Cao7vjBzYmw54g0E2DzUlqHkn4QTacs+DnpbCmdzY
 IHaFvN1b5G5/tM6PfLrN9dJp4KUQHduEq3Zb+wEnpIkHaBd8WOCwys4Y79RYqkRCoVY4mElE1WO
 5BBM+YE13vEaYUCW7CWBfdc4hTzVrRGP7yUCjAkS/XQVmdgbiX5wcqNT7NEqFM8HQ/BngsviGuU
 LlGkQT3PzrQK8EzjpYt1lnId42EV+jIYmupT5jguZr1Dx8RbhJPu3LoezXlPA5Cmi2ze4c2C4Qd
 tBOrykbjUU2SxMYIGUGKQgNHOV4jQO+LweKFlGantmGX0QQ+pyAUb67IhPQ7w9AnecYVSgbVITU
 2YgX0n20BW/uW2GnxDA7JRQO1YnIFyhZth0406HypjDj8JeeFi1p3wFvkkg6bLFgpvlSEgotjCA
 QpaWIN1/tKWqKPPFqAQ2vbEcFweaWlJ4bzVBJj34vB5Af6PIwUf7cEy7cHtqYkkJti+nmUFcKlz
 tVhWJ+5tLX4Z4N3bibGOsOJDC3GCjZJhMTCUteYh8qE06Tr4ArNpjKxiupi+sghae10AR3496E5
 6jXRnMC/74/+ms5mY/2O8BSMddjJlnd0nuy2HHRnJZFVLHYf8oK7rv48TUzsTmMxbl2uQm4VDwO
 nJkgQAUk/ylcQEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: MmBxrK7B5dLe1-OFTew0ERGWKFAVRwNj
X-Proofpoint-ORIG-GUID: MmBxrK7B5dLe1-OFTew0ERGWKFAVRwNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX+funInj62rCF
 zqw5r2InHArDMuAay1MMaocuUX6Nc+dU72H/B16KBb5ovkCvZqj5J5peTTaf1PkKtQoMDP0VWWa
 k+hqtcDsCAbRBrqbPCSlS4EIiliR79uHxSygWLF+ixoCtwRKbh+5+9BkMvqZJqAAEIi2jx6Z1Id
 6KIy8vWraCPQ1iJznRwzQnt8JDSEpqZwyNIIRvZHopp4DUgigYqPdwIRVdFrGocvZeK7Nvp1izJ
 ux1lZSDgokF8/o8o00yCxsAeEhQYy1/Gp38+nyz3gnbIEGTsqWmaXXQqzNYvW/3aeF65C7VW2Dt
 29rHagOAF+rfQgvbbRN7Pef32+4RBkpIxxp7WxRp78D44IhCJuoQpyqLk3tYiWFKAJh5CF7vgqd
 hztPjz2Us3k9v3FoVagw6sRpe/B3JeT5foG9+K+GdtzPH62djZmIsZSd5dWFoN5WoDpiEkjsGo/
 uMr2mmhIcR+9jXSt5GA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cb8fa8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CBFrsqW9wnp9SfA-JgMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34468-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A4EA366E32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Software node describing the GPIO controller for the pxa27x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa27x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff63619790383859ba111e3efe7619aa6cbd248e..bacfd50939fd447ffa11d398867dea7fa638988b 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -277,7 +277,6 @@ void __init pxa27x_set_i2c_power_info(struct i2c_pxa_platform_data *info)
 }
 
 static struct platform_device *devices[] __initdata = {
-	&pxa27x_device_gpio,
 	&pxa27x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -342,6 +341,10 @@ static int __init pxa27x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa27x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa27x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));

-- 
2.47.3


