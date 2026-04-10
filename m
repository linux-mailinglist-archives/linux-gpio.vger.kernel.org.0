Return-Path: <linux-gpio+bounces-34982-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN05DT6i2GnegAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34982-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:09:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04093D3314
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9755E300E169
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A427A395DB5;
	Fri, 10 Apr 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDZJbw28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNJk9nNP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61A3939C1
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804987; cv=none; b=RsGilzIFfCT78yRRLE1AhmC/ZgTO1rEfKG4th5F0fmRwYbZSWiFdJrGpb+LBuDSU5EQfqGaWYwbwtih7KvWeacaEnMAuoPS3PU/KUUyUwtnWfjQNIs3mluKnwRWu/jrJucLNr1hH858T75Zs4P+Q4w+2IqndvLfgHtblg+dXifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804987; c=relaxed/simple;
	bh=/xh8mbmsndrtfR6dGnoexqxNFoHHbegyXk8sqrhDi/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRY6RN28MQyyAvSdUzhEIQ3cZwdNtbkHJLDcjQRrtiV8CzBMW96Texuns7hJ5Ea0tv3S9hvw/unh6/K955GhSiFwy6k8DlVifK+PwwWMfqq90qHzQJerHlmwdy6VEHOUqvWMrh5TpgRaqbyN2yZhTT7MacE0DvIMOiTeBF2nFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDZJbw28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNJk9nNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4gTJd2698273
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+
	XEf1jVQ4=; b=TDZJbw28P7WvcFvFthM1dYWl7MpKJOVzb/nmk83ywwpePZQIurg
	pQLwORmoW6gH15oGMA/yBgtVtZfW62pBWog+rqSyHM0d9S3k1Ty6dTKBndlAA8wN
	R9NQULd1MQ/+WUaYDgr7LL4Ron4es66rYcDkNXbXeTB9hcE8FMd91Sd3Y8FGLlxG
	Y26FYG+IcdWTJlMpY70fWiopkb4gka6ARm7t74lZi7zmbW8B3BpkwV0CNZkHM0E+
	1EdwVtLLVU9p3FNnIv1rEIBWucMvFFvqBZuVsE8HFYBvbvaowQWv26dChumtmMwM
	u+l+9lBe2BI70nrzr3l+d4uxN6RDLQuqI7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9t21b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:09:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d68dbb77bso34842751cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775804984; x=1776409784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=;
        b=RNJk9nNPyS4WHtOo2OiUkqXrKtUEpHWNvpRXbI6Zzt+DKG1EXqkTc1MDqPTbBFFepq
         DKLIKOqKDG3XZm3K1bAFdOYzyIgmFTGf+wxXkHSbEH/dl83vSTEUvOFHYUh9zFM5fjVz
         cJ9ubviHKJAqv/pjnOMec87Xal2MxfNeekLWucv+hOROH+dZCqH2zTWUAOXJ/7IHEyj0
         P5K9LHF+ZA3/QrUb58qJGzBVkkzoa6CmUApo9Y8po50W1prsjY2aWcp+EZqPGzikImul
         Xsv8Rv8fLFhC5xEMiRg4ATGY6FH+HURXqqaGzHCbwdpRL3UdHXuGNnL/wEi6k7idVP5q
         kKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804984; x=1776409784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=;
        b=ocOl1w1uhje/fpCmHEjvuNE+QXwIXNz/wS3oJ5mitq9rQ9AAgB+6xZNkxRqLrM3hAk
         T6UkWSNYYslyxhotgahlDVU9AghnUitbwoFm3C3AqYS1dKvYFphMaV36UhIVscaWDGy+
         CIv1QhEGQtsE7PuFfSj+nc+fksg10bps/IxXCnYqtacfDaOjqN4Q4oE7+9GF0dhOgUjX
         ycdvWm7x/TKA0k0b8et29CKfKghl0JOkhlp1JAritmwfAeecXOexMfiITreXPkXIiJAp
         J8maaJHSLANQvpgK13GWF1KbhtxTkDuU8an3BBJrPmiOVQYssAqcGcLptctRzvU0CmYV
         /H0w==
X-Forwarded-Encrypted: i=1; AJvYcCX4wqs9z1TsS5z1ckqVARx3VBbUg8uV0nqwPpndIQy8a124GUNDb81q6uLO95JIYxvHIxL73fakSj0m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ljRiu7jaEx3XO2W+FkhV/VFOG/iMa8z7VPFS1+7p60gKdYWG
	WJpZ4hCW7kW1UvE9dbOh9M4yO8/LriyDZnfvdGKS54Qat9A8841gS6hfxawS7+27rhu6NsYfLhv
	CJdepemHmACNnvtuZolrKdTuXhURf34TKDtdDxzEiLdZbys7t0j+t7a3gRz89DDRsMYYFtTSR
X-Gm-Gg: AeBDievCvdtXwns2cJEEM/oI7yadA5sBuWZ7dGm6th1KuS8fuiuX2G8HZR69TwknNqM
	1+AaWfWNtjdUgRssVWMKoND27U9XwvLhhKgxK0/rHn2WH5G8inpezxxM2OImp/MmXuIytaLEHKW
	SfMy5aV7DS8AQkDCtpi4H0o2LxdK13rq8uAvAz2yEsXfb4HOQWcL6i+aPO2Iu3VoHXLhEd8M4x3
	qVmM0d6Vgfp6t+r/wdiAEwPOJG3VPjCg++EhhWWLnlc0MuMpgYPI9Tzq0/UV+24L3Z2YkafNAIA
	B1JAuX/tiLvf9l7bPbEo6clDxjeh5ieiBGXGKz0+aYxs4CVjOlSiDWHm3i1vbLX58bovw1tRqKG
	F514G/7Jn5wUl1wvUUf10V/5bVPcsfyWM0TZpol6PgjUu/sBnLQ==
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr27268941cf.43.1775804984526;
        Fri, 10 Apr 2026 00:09:44 -0700 (PDT)
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr27268711cf.43.1775804984031;
        Fri, 10 Apr 2026 00:09:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50289sm5338689f8f.28.2026.04.10.00.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:09:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Frank Wunderlich <linux@fw-web.de>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
Date: Fri, 10 Apr 2026 09:09:35 +0200
Message-ID: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NCBTYWx0ZWRfX84GtHKOQuqGP
 Kpm2limBrHr/xJXgMs1l8NrgznFmLBxUhFuKzcF2iet+8n87IeVog+qISG3EqmoAoyROevJCY8+
 N3TWban91RLkxB3O2lrn7X/zo083t19cfg+xEsBY/N7AtqVSnOmE54SDHIUsukZrLeY29tKIzxr
 Jv2NRWKJ5IeTLkMSctmYttpRCELbIAGrWnFIrqc8IgaCm7m7wXYr4GTVL21A3GXtTmlHDKHmAs1
 zk4UnhMBtNi7BWX7zlHMA3dzf0O6YtI+JOpkho/2w/bqNrr7b5uk691ev6sxFl4VVoGLhAWBOlh
 Phmp/0ATbdeKXt879i+INI23pZTt54YTHCbqEU/lvAAMEh5sSE/4vFWQFWgEQ6AC4igMRLnYLeh
 Lyf4wcp72ogKl5KG4dXhAaNuaMvSTwVNww4BkNWEC/cA/6XJrLQvz4wrXEmJlwkyMS2y7811D5z
 urkor5nFWnfiF/yNUgg==
X-Proofpoint-ORIG-GUID: eCNjowaXSAtkUjBxiteuITdZOlU47tO5
X-Proofpoint-GUID: eCNjowaXSAtkUjBxiteuITdZOlU47tO5
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8a239 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gdeKHt93fcZDdug0Yb8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100064
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[fw-web.de,kernel.org,gmail.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-34982-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fw-web.de:email];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A04093D3314
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the gpio_chip::get_direction() callback is not implemented by the GPIO
controller driver, GPIOLIB emits a warning.

Implement get_direction() for the GPIO part of pinctrl-moore.

Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Reported-by: Frank Wunderlich <linux@fw-web.de>
Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web.de/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 70f608347a5f6..071ba849e5322 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -520,6 +520,23 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
 
+static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc;
+	int ret, dir;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
+	if (!desc->name)
+		return -ENOTSUPP;
+
+	ret = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &dir);
+	if (ret)
+		return ret;
+
+	return dir ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
@@ -566,6 +583,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->parent		= hw->dev;
 	chip->request		= gpiochip_generic_request;
 	chip->free		= gpiochip_generic_free;
+	chip->get_direction	= mtk_gpio_get_direction;
 	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-- 
2.47.3


