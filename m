Return-Path: <linux-gpio+bounces-31593-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP3LIo9DjGnYkAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31593-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:53:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 379511226F9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40F5F302768B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753723542C3;
	Wed, 11 Feb 2026 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EK8IO9yE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+vXxfyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF0B306480
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800001; cv=none; b=ikgV5NTJk5/ySJFYtCGbveyoBrX7E03DAMbz7+RZe49mKWMJDc3ZlWbAWxPXX69uFRSoukf+HJYbgs4i0ucH+tAZfMHmDQdeKGNu1bHMjOoM3ZeSa+o6q+LwqWMEA8xwx7jdaocKVXtvQWggxssYNopzy79ASCGvBH50o/qKkGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800001; c=relaxed/simple;
	bh=a/2liInywBiVyvZH5ZSy1dS+BQtS66ZsSM51lFDwn+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aER78/inMkiaqGYcG0BDwcTpJjFKUZX25XsG2nbvWRcbOqTkp5pCw8Ti/n5JucBk/utzkaOucIl+4Ip37N3JTwPstNz7QH3Xyr7flVak4vacGfRB6BWp99B20PMiVCRkbnHUeau2wsiLwT+nOFsZ8Eg6FgNDxb3dhlvPR9OxwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EK8IO9yE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+vXxfyC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B8bpME4177319
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RS3ATQIauI/NfFT2FuRblu0XJKn0tBFCAKh
	Kp+3IEVY=; b=EK8IO9yEaUISZAP/8Hx+3MVpdMudQy9iNwnfn209xbur03M3zVf
	l0ylx1ASlmbdDSs4l0c9SIywwwGHA1xtE9E/xSHiiddHpcgTpJhJQefeiDco188G
	zWIRGWvklXPW+2rNS9Ta/zPwdJBYKX24IyCybqpZ8g+AWT/0emUlPo8oWBfA7smZ
	/Dp5cYeCNFTMizCz3pm9S5WDJ3+WC5mgwkx+FJiBu4mPCOo/OT7FPvKH7bXA5h6m
	c4q0Zape8+ZZ/+Vzgavp43StdOIAHDBUeP+TfmTfCrBv2xIMsYfR/oyZYfIU1QIv
	COXV24C1Er2i4EYIp+mIcstloxBUUW9jGSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c879mk1te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:53:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f07fbd0so2115041185a.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770799997; x=1771404797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RS3ATQIauI/NfFT2FuRblu0XJKn0tBFCAKhKp+3IEVY=;
        b=L+vXxfyCGfTpdkbZmdQE4xNC/g3vFNCere3a65U0cRbB+inMgKMfo/BbENfjoNgyX2
         W5pZ8xkOzrI4X9dKrf6Q+TZkYEUXvz0MqK1r1r2yn9ArMsqa+LJQQUDdSMzC2N7J/++4
         U5r+w19A7sg759TmJ8oNJRRB1FnUpjRgyYwxes5a13XsTpw6L2s6iyXvdxGQdRQaJkhT
         8rCGUUeRDmvAp3uE4DJM2ZtC3ZHLz29HCzzq5KrfMQ6+w4OcgATnKcJtX1ROjYitncFP
         6u9yL89XYYUQUDywiuPTcAZH2mOVss+l9IE5H8stA8z+zx1AyJipmlhavHiKlTC3AfLE
         gAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770799997; x=1771404797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS3ATQIauI/NfFT2FuRblu0XJKn0tBFCAKhKp+3IEVY=;
        b=t9FZMw45BSVPrrc1kXglbkW4FCpld2PNQ31k8KD6UZ6rdnQ3oM0ocibALjuBrCT7jp
         4TiMiPRKxfXOkmFgcVYzzQOK92JoutqG0QYXCCblZfEIjWE+6MIEmmrCvQSo3bNpoLMp
         YIS5s3+QdJKqXmJGLYwotQJjyxZJCVldNvbMgPbGFRpT7iaKGBvjHr8RxJVUfEPB+C5O
         7g+H9rdPA6Z/qNrxgL93ey0VOp6zs5I+MYZUrry+vHvruXklMJ/GzgDF20hqrsukfYFy
         yBHT7yJouuSGM0kXhZmzBvarTkwN6h/3rNXRQj+Zs4N4f4a9L12y76ml4MNue+lP2HGS
         XHnQ==
X-Gm-Message-State: AOJu0Yy3DlYXfO1nqODHeZ+6p2X1fJDyTD8jrfidqYCZCnEvceC2tVT1
	YNLFvJrdg2GzjpzNx+7iV/5/4XLKkyLlhhJcrAcTeuTT6l/0zpPVPEIZwJSqqxI72avaN/RRlh5
	yLei+rufx22rBL0R+uphxsshhnwrKNQ5X3pYlJq4PKTIBKg8QTeqRUi8dqsf0QWwj
X-Gm-Gg: AZuq6aJeY55B2f3n5NpQZUc2h2zA5g+J//XdVecSKktC7VjGOnxDc/HlUFEdugw+YNg
	x4LKVdERZmIBQUO+0jTIKikQqPCPCUIlpA7GkeH8fo//DAONUpvAM5FxKhAk83dHjvJy/y73Hyv
	Yl0zltE5VfbE0vk7m5JIzLhZguhrVCy7MJqbsg75tsPILN0O/0N1as9HpboGcIZY9NLIT9rVjlJ
	KB89h+J6U2utaThiPduRhP6xUQZJn9ROBgvBsG6btfXw+8diQ2d8xT8i0ssPLqZhN90wAt/lbcd
	HP9JEG/FldM9tIKWVmDFI+5mfGuP8xuJZR06gowrbqCwpu8wYyiFwCorhgeMhezAr7jyixq95D8
	1OXVlv1cdqy1U0CNy+7XVCt3WfxgxTNVIdcla52oKalyN9OgL5eE=
X-Received: by 2002:a05:620a:288c:b0:8cb:16:d936 with SMTP id af79cd13be357-8cb2808f823mr256761685a.77.1770799996889;
        Wed, 11 Feb 2026 00:53:16 -0800 (PST)
X-Received: by 2002:a05:620a:288c:b0:8cb:16:d936 with SMTP id af79cd13be357-8cb2808f823mr256759085a.77.1770799996369;
        Wed, 11 Feb 2026 00:53:16 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d772:ba4c:782c:2fd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e3a9acsm3100770f8f.30.2026.02.11.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:53:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] gpio: swnode: restore the swnode-name-against-chip-label matching
Date: Wed, 11 Feb 2026 09:53:13 +0100
Message-ID: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UKjQ3Sfy c=1 sm=1 tr=0 ts=698c437d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=9y8YAwuLlfTazgfakgcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3MSBTYWx0ZWRfX3BBkneFA06ca
 QT0L+KTPa5GVAfuMhApcvczKTjKIfcNtL0Z7SVr9gVEyZ9S2msRo+fgwWuo21AKBLM46u4PFGuu
 qnp7mjq0tl2X7UZ/+2c5D9/dB0FF+3rhy6Ywcob4mwrMBRpYuIN0F9kdBFO2C+qGZZr1qx7d46T
 1IJWSwANEmhHCWUjOZvcvAXYuMs457a/wk8cetw8wdXHd3mzlnP3498ReuiFo700gwMCfWm9sPL
 No3vPRzmvzhuucwNHqshJLVYRXGtvIhQ79bf4z6jK+QVm8mJxyRAkrRJYJaJz2A6iLsgWGYRyJv
 c9zuu2YPSdXtzSMZ6O0huCty6muNiGsrPHEkD+Wdax9DqQc5gYBML8d2cwWc4Ba7KEwg+jF/zg/
 VHjLyIjUR8KUpgTKIm7+WfycwYSMKe/PFTq2KeR9Qt+bMflCCvd4yG4rskqmiEAfVyLlo5Tr7qL
 FMtHj/qXlnMvuftYzNQ==
X-Proofpoint-ORIG-GUID: JzX7NlzGwmO2uf3eDjhpz7a67klvo6KO
X-Proofpoint-GUID: JzX7NlzGwmO2uf3eDjhpz7a67klvo6KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31593-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,intel.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 379511226F9
X-Rspamd-Action: no action

Using the remote firmware node for software node lookup is the right
thing to do. The GPIO controller we want to resolve should have the
software node we scooped out of the reference attached to it. However,
there are existing users who abuse the software node API by creating
dummy swnodes whose name is set to the expected label string of the GPIO
controller whose pins they want to control and use them in their local
swnode references as GPIO properties.

This used to work when we compared the software node's name to the
chip's label. When we switched to using a real fwnode lookup, these
users broke down because the firmware nodes in question were never
attached to the controllers they were looking for.

Restore the label matching as a fallback to fix the broken users but add
a big FIXME urging for a better solution.

Cc: stable@vger.kernel.org # v6.18, v6.19
Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- check if gdev_node and gdev_node->name are not NULL before trying to
  match the label (Hans & Dan)
- use the right link
- collect tags

 drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 21478b45c127d..0d7f3f09a0b4b 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 
 fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
+	if (!gdev && gdev_node && gdev_node->name)
+		/*
+		 * FIXME: We shouldn't need to compare the GPIO controller's
+		 * label against the software node that is supposedly attached
+		 * to it. However there are currently GPIO users that - knowing
+		 * the expected label of the GPIO chip whose pins they want to
+		 * control - set up dummy software nodes named after those GPIO
+		 * controllers, which aren't actually attached to them. In this
+		 * case gpio_device_find_by_fwnode() will fail as no device on
+		 * the GPIO bus is actually associated with the fwnode we're
+		 * looking for.
+		 *
+		 * As a fallback: continue checking the label if we have no
+		 * match. However, the situation described above is an abuse
+		 * of the software node API and should be phased out and the
+		 * following line - eventually removed.
+		 */
+		gdev = gpio_device_find_by_label(gdev_node->name);
+
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
 
-- 
2.47.3


