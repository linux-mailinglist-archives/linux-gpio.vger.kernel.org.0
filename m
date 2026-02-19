Return-Path: <linux-gpio+bounces-31871-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLvfEB87l2l2vwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31871-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:32:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 970AC160B3B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9360304B4ED
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7238634CFAE;
	Thu, 19 Feb 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMX94TH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzIYAYQL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C434CFC8
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518701; cv=none; b=Cf217++Sg4GQMENXiQ8ToxNWu51BKGHWnD++CiAvqQ+nZayOqqkbk72n8FMr6VM4E1ZcRdRWsBapCuTlFuGWrrwMzGuLKEzQ9B9KwO2qyVOPP34a3+b8fZJmIEHGpn6OqwRyR0QrYtoswybAs8+hf0uGhMsEuM3jFUo0PSx7vkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518701; c=relaxed/simple;
	bh=UliX6sLzotx1qsQF2WyN927FXSQxxc6AV3CGUQohm/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LB/ilBgUu2FT1XaObd32y3oTNg+zzeVM65b7IvCh+rEXVGPUVdEkouQxnG33m6Wu8sGC/9NqWF6Q+H7zcR0LB8PwGwsZq7KzDf8bFp0vCLP27SBuMZeqsEMbGMNWu4LGAn9PUzQBp+BqNwqs1QUu3kNjVoEASo3FlJkTkvXwWt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMX94TH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzIYAYQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JC7d3i2883966
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3i3Zc/Bg7Z+rAWlq8NW6uaCfPIho0nsjbiZS7RQ/uk=; b=kMX94TH5NLMxflfp
	ELxVADN3XlxGc0EFZ3+aFyo7svO3hdLMH3Gf/XEq1SqHUPWqr/9WbYIHR6jWhlo+
	xMgiiEjhgN51KcpqLyg+m+XxhIEa1CEALPLvPoQqSRO63niTMBmSon9GnnSDBGBj
	oq0R0Pmm0G//P6n0QofMu3gtcZypWnfffttDfI0c9F9eCS0+PB6q4VrjN1jeWDXa
	Buus46427s+yWNyunuU1gTDN8x9+ilSAjtf4rylKSVbXmIUMT+K1Jylc7BflxFhK
	erHrVGvlm3t3ACI3IAQ0XAkoCM3PtMPoeBcTsK+xBQd0BoueEI8EfvytYgtae+/E
	dcl8TQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfga9vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5f557e3890eso21436005137.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518698; x=1772123498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3i3Zc/Bg7Z+rAWlq8NW6uaCfPIho0nsjbiZS7RQ/uk=;
        b=RzIYAYQLOcchk3q6Gel9i1DtaItUBOgaChIvMO2210hUwt2rB7CU75wFJHPJRCK7j8
         sylWIUnqpRdWv1o/l5f5QGrPIzFpDlPfhqWBCI6cGERpqQCTzOh5quLyq8Efsz0YKlDJ
         zT2O7ZeBtoWWsmE0LIvZROcWvh7oqBFLFeAla8k8wyEL4/q9dJ0tf8ROUnH7kfGS/J4o
         Zr5YKdvIEglgUq4UKSx6CXk+p+WYSqA6jt2uI+lFyezl1lb2ZcfnDZgtFOhecltAclbm
         V2ttqSf0LeBGEyegC+Y+NQnDR0yzRPAe3ebj8jkf6e/0bv4/CFkAJkLegi4B25WQrGkI
         /jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518698; x=1772123498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3i3Zc/Bg7Z+rAWlq8NW6uaCfPIho0nsjbiZS7RQ/uk=;
        b=cR12fKMwtnJhmM0MZLavNg3Amp6MGyGjp0EePTHnRex1RuKhJ7GpdGnXDHZvZo7G30
         nRs1Fj2dvO1vyZFS+Jv7uqRiX/kZPntgsJFm4JlPwfqPfFJnvErQfkGJqmNw0GoxpEyV
         0LaQLNxVCiLHFjfWZjUAFxvW+QzcpdWSr0+qJm5iecbMra5f6NBa2MHy01TDJVJn+vUY
         GqZhilanoEg1kL2jku2/8T3BjfSwkDyVuqmLTMZjIeTSPzNVtMnQkCJtY0R49F/B0oSE
         kdrT9bNFF0a6+Qpdwbwyci1gz6aGu7XjdsRdFioM3gSh618EOdGhoAFN8pvEqtXO7u+k
         76rg==
X-Forwarded-Encrypted: i=1; AJvYcCUzsXJNUznVSsr6UOZHSoREad5YSxtHPHj2futxWWivpajauVejmrA4inBZFZtF9959JG1732cBo746@vger.kernel.org
X-Gm-Message-State: AOJu0YzPG0dZTvayabvijObOSZ5YyW8gshsSL0T92s2mNt2+Di2GhwRb
	Wd8I1De8mPCnK/6MSK/woeGtsUM3zNpP4JcJ0J2H3dmHffavKmPI3KgFMBFM+tt6jW8xf1e711u
	SG+XkGWULNd9bD5ujTcMuVKksAr3FftI5bFmeVEYQsjDPd6+vIOxHPVuuZEO+iOU6
X-Gm-Gg: AZuq6aIn+AW5j5GrBTWV7rMDh3zrpdPRjoaDBadW7RzS2EXSl5muKA5VekrIyhLIVoH
	n/x10mr0AeOqCOiKuXTOv++pCayAFO/Uc8d9kjZk3gjvju+AN0l16Y3qxvGbsLRQuYcI7lGJ+RW
	bso+2tw69NUtDUQgRWr+OSj7qTbNZMKAv7LLKkdTLkmKR4RdUwuCNYJR6GW1bLGJFPXBUSvy5bM
	NkqXAiOFUim3e24d9F09biW0q5Q2UjwLFE6r3wB/dgjpiTw8hiPFYXBvbNJempElv5Vnx8+o7NJ
	gFhT1UoiSSArVjKS/Qbq38CmdMdT0jdQvGEPmsBLhTgSeHFdLnmXnAhDD2Na4Is87wIBHmH63ab
	2z2+mucu9CiyMz9Wz1jVPBSJpIsbYaVbXXBFKQDfWKNbFTaFes2XO
X-Received: by 2002:a05:6102:4190:b0:5f1:5be2:114b with SMTP id ada2fe7eead31-5fe90c4a53dmr1474818137.20.1771518697911;
        Thu, 19 Feb 2026 08:31:37 -0800 (PST)
X-Received: by 2002:a05:6102:4190:b0:5f1:5be2:114b with SMTP id ada2fe7eead31-5fe90c4a53dmr1474737137.20.1771518697117;
        Thu, 19 Feb 2026 08:31:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bfd6:96b4:947a:52ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm20272365e9.8.2026.02.19.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 17:31:23 +0100
Subject: [PATCH 2/2] gpiolib: use device_match_fwnode_ext()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-device-match-secondary-fwnode-v1-2-a64e8d4754bc@oss.qualcomm.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UliX6sLzotx1qsQF2WyN927FXSQxxc6AV3CGUQohm/g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplzri7W7lUZ7RiuAYz8/s94t4gStwIJ23fD0TZ
 z0pKDMSqh2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZc64gAKCRAFnS7L/zaE
 w+u5D/9/QPf7fqpaO+syn275H8hFZ7xB+oT8FGaW9c2UtkC+ROtg8YLQVOYzoSG1Xm2mSbfnWF1
 R7IPDR7Yucpz+3cXd97ZkJw2tS8g1nJcqJVqFhvuUBWCJSi7rNfVZsdwMnDib89jZV4Gt3XPFcx
 pDYP9OAAhHEKe8HDc5TInM18PZv+4NFOdADgJNVlOIO0k4wozW3GnpfzfbtGv7Qu2gz1KfHsZEN
 m2pawyODYnOBiRaxMI4jlTvvACvXuV7Zj+TxucJE4rlkuXTMQWOj8TlQq8tOpaZ1HFSU3jAf6Kh
 wp+yh9LROef521l36L+F/BjetNeO50S5hJ6Ur6EmCOETVinMyW3t5Rla+FnN66DqG23XJsjNUjd
 vg4rIU7eZ8e2sp5kqHp9dP7ScpDlIJc5pnh0Ep9mA1I6QvzhIIlA4T0C+HlDF6mQrgaPSJHMI3U
 x3/v9PFDyiVFh77lNZ0LqNg9cZR4ojymZgtR2w6uUJfAMFKMXMXimp4Zqg18p1ONSx9mzaArjkj
 BWVeF+s9hcalMHlSLsDfms4HHL9TTLCmNC1mju/VI84P8fJwc75bBP5gzqipZwMFrsdI1bDMs0s
 nvwKaRhRvxR17GksLC8feRnPTC9AWK6S++G5cz80Zlu7t5xl+fT6vTwwEZL7BBRi4jjhC3jrADX
 7Smjg00wnMfUknQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9-dXUIOpNZI23V_HUCpE2jvtOghqYypu
X-Proofpoint-ORIG-GUID: 9-dXUIOpNZI23V_HUCpE2jvtOghqYypu
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69973aea cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=y8mqIuvH0L8eC_VtVMEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX51A2SH1ZZpCf
 yAGrT3y8POre8KA2WvG1F3endtH047gurQHG3+uwG8nkWAnS31l9XyXALEhReisBUlMgPd+u+LD
 DzlT9IeFFlQAfPkNTwprV8H1Sv7+kzeqmOqtSSkqZUoprDcxhfL6ztQ0eXtGkH9wr0D94bYB7i+
 vyrRrNlLyfuPsKtZNQUtTlpV2RJt2iYI8wbCYfW2A3ymZAU8rvAM6yYkMDu6fbjGEaFNpSwIZIT
 dF0Rju7IyA+ZJIuVEdWa2Te0C6OrVUq9NWWzsjwavG3upLPh6rbRcoBACV62VVmJnTfk44lvy5R
 1YQgR06lNDfkSIUWzXHpbeWXP7TxO+vXnoJB+G71aYYZdNlPud7b2rxuAwhai56GqBLNmnlesDa
 p1qI8U7/lTJ+hzviYmy2sAJKLRo+px7XqtiPA3q0yoQ0wdRqUrJQUD3Mg9R0Da9I5PxH+/KOb2f
 ca4L+oFaoR5ZmkERSmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-31871-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 970AC160B3B
X-Rspamd-Action: no action

Use the extended variant of device_match_fwnode() to also compare the
secondary fwnode of the GPIO controller device during GPIO lookup. This
is useful when a GPIO controller has a primary OF/ACPI node *and* a
software node set up for devices created in board files.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..0430a04ea060c38b5823cb48dc7a439b73ba9b83 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1395,7 +1395,7 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
 
 static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwnode)
 {
-	return device_match_fwnode(&gc->gpiodev->dev, fwnode);
+	return device_match_fwnode_ext(&gc->gpiodev->dev, fwnode);
 }
 
 /**

-- 
2.47.3


