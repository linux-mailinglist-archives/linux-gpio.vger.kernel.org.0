Return-Path: <linux-gpio+bounces-31548-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kx5Eu7+imnJPAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31548-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:48:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E5680119145
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55BE6301409D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 09:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BCC342177;
	Tue, 10 Feb 2026 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoOC4VIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHbhihe+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F6F33F39E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716905; cv=none; b=NEtwcEEdULVAIy5Y9xnR3ZUCgSif+ZQkfOs0kKl3wuqeyFBi5rRkUfqLVhPpwy7nYHXxA7beoRbhyUR19flTVZAhrCmVZNuV/AfRnd+mBrgMrNGIDERJ7VnMMOtd9Y0GUdWNePq65ZxjFg7AMtVOzGTJMoVCr/b5yhDuaAsNDG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716905; c=relaxed/simple;
	bh=e3dSQfqVhgsxxhUTvmPgK+yGjRC63OjJTvyIHJC7OgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tS2rVL0TGw2E9qlL0j2UkcWNRb83cFcx3OR/oh6g9b+Q5JxfiM1fzWp8BjpglAdKkFTigbQsSqYqpYp5RU3FGk6+rkgq+l8xLi3DcYBzhOzk31MTVtiBbtLl9a7dHtRuP76wEiEXXQWjo2qtcSUIxTfHe3hytNdfCfsl5x6PIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoOC4VIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHbhihe+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7PrSX4003528
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w/GzpqhughA55/Qv9bqwmc49R9hRD/5gwHY
	ISOiMX3Y=; b=HoOC4VIG7awe+AB/6dgXMBZjhYWM+m4P+GcVgAIq8Iowgtv/C3b
	0i4QsMl0yjqf1GMkOttxvv5Z8bmB8eQbPMhwj8O2BsMIGnP1pJsIPfKBc3VN8QIn
	Cs5kqQ5AhqtN2cMBpl/rozRh0Dh7w3oOzazlMxmYqvL4hLPg5lOMW34jqYef2F4Y
	ssLupxdq38ueRzj3u4WqSMya4UxTepXZ77yI9gDV93UNr3R4jL1PDw/CA2FKadq/
	6ee70YOxRufc1wnNtkaaMvpXLesPJsoBUOVmLuQzsEOMtEjgwGQ3fQ0vL8gMGfqW
	QkQz+gcDuS8ZoQz4atd8Qchr0fnrlvhM5ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7r23j270-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:48:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d3be24cso92736685a.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 01:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716903; x=1771321703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/GzpqhughA55/Qv9bqwmc49R9hRD/5gwHYISOiMX3Y=;
        b=kHbhihe+AUlT+NasCiSThl33Ivj3xhA+FLVw13aH2zrnyOULTOEGz0f5GgsF50w64N
         8qCmJ7+AA/e60GwuF2mb7WNS7na3bX9/CKJYmzP7dowBNUlRtT+8BLneiVv9iVJCzH/Y
         gieHUIwoS6hwDlbFiOVq7dd4UVLUUDli9EXI66anKpfqcTPplInJ2lKtXxqjH4jcRBtK
         dkElBWemTPXmdevpRMEHhfwJtzh4AuwadxIwGSxpfWbvMbFuR9bKFKEdi1jzxzRuRr7V
         Q2vbGabQJGDG9FBvurgVswxqi6SiYwiCo4u4x4/i138joP5Ft9TBZ0aur/y7rPdU3KoW
         dOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716903; x=1771321703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/GzpqhughA55/Qv9bqwmc49R9hRD/5gwHYISOiMX3Y=;
        b=BkaHd6Pf0bYDfgtibMaKFw2swkJejzZbnGLgZqs0PaSeVaKIyvoGESVzQkr9/SSc/5
         as7fdOR7dqlIv+Oto4soBl4pCuIyGNGZqYHOUIAqDJPqr25rmbxMnsWLkHg3hqn0Nbk9
         0ZPcds80qJK0yaRnyVgu6xS6g+1CpnQp9aLa1tHjKRKzi8+3GxHG358SldsF+eWe7o5c
         4G7RTs+Sy2NizNaWTgVfIZbMICbVQNBK9RBkwyCutxL0SXOyEuT5lLgfjW/PgFEFwobU
         GYMq8W2mZl+VW3XlGV9yYGYl40qoVLDOEogciBRHls0IX0naO6AfdzaYSKjUH9nHC57N
         uXow==
X-Gm-Message-State: AOJu0Yz9CXot7Ee7DGgyEhAFx7dR1FwsXm9E33x3w3jgzWtfx3eMXeb3
	TTBogXAEBCol30hDR93rVFIoOmKzq/Qbg9xqpYi24lrU6/juadi7VOHA3aUdualCTfh/ObMZaNE
	R1hFRFK+qNNYuCAWMH76eJeX9Mv6J9S5C6JP8fpF9joWwGE7EVInfYNhTCDJt6I7u
X-Gm-Gg: AZuq6aIDx7+GdwB26GFmGrAZYC0C5zReG+Cc1XX7KonCylpGU9zfIxSXlY4dwp8Kvf6
	CX0FaiTh+yJXhh4d4eeacM9xmLwZkdNYxzbEPf51AjNIl8QW8l83CAfG2mc1lfFmZC0kiwRGDHq
	JCm0+gZE5FENZBQa/g3mQQZnETIP4Vyl/68c4rSE3CtqcPatiVzotmrwaa92YHG1BBtI/QUqTB8
	+lIRjM3Rj0qvc2lDVBPCZ+JmG7V0Q1fVTo77z/77cLV1Chf2d4MllyhI5WHLGgsjjtO2CEuv7h5
	zvyITqYZOKbmOtXxMXk9gaLnyWr0So/R+6C2pM6Hg7FS1+KuWMdZaD99SgMLRuldxRsQtCIFcu7
	h/0EA6HtNxP6DfDGZHOgDgHYhmuv3Hb6barpR+USBWAjksDwQGfs=
X-Received: by 2002:a05:620a:45a0:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8caf17e757emr1814102285a.84.1770716902625;
        Tue, 10 Feb 2026 01:48:22 -0800 (PST)
X-Received: by 2002:a05:620a:45a0:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8caf17e757emr1814099785a.84.1770716902159;
        Tue, 10 Feb 2026 01:48:22 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1964:f977:ccfd:e173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376bd5a074sm15492135f8f.11.2026.02.10.01.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:48:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label matching
Date: Tue, 10 Feb 2026 10:48:06 +0100
Message-ID: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX9jdgnNa9VwSA
 0lnoDgz74ahf2Z5SQ60loaP1XIM8PC8Xf04QiXY8SQxW3RH77cg2IAZUGA20PhiG0PWrAiy9o8X
 AIqEx7AOQejf3x5tb6GSvrcjX0UEiv1Mhvstj3viUMI+IQvF4XJ/HvWKSMSUHkQs2DQLr0nBIGR
 Xp1UuH8HAjEIXBVX8dE1uiIQeqPaWW0jkW5orO+4vgROqgD9re6rc0cYQp6SYcNfV2CaDVmTuNn
 oYXmxHYPsVHqxeewhhLx02KEuoRvDxvipT7QxF2x7ldcStil/tjK19pX6F8rb6Qt/12gETvpvfZ
 j4tGm22v+Jg5rzwe7mJXcbPmch7561jee0G+C5ANB3KzXtRjFo3LKmC9dYQuHM+dbCyg8v4fnb/
 3m7VC8GeYwlAz2RbRiZnf4M7rPsZ4mnICYDN1t6iEGCEm/srI6bM79JquKuuJ2wYiJmbD2Vi0kz
 v90laZNL/wbsII2lLIA==
X-Authority-Analysis: v=2.4 cv=MLRtWcZl c=1 sm=1 tr=0 ts=698afee7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=4y_y0rSijc1pqmNUuoMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 83v5GbT6i7JFcNZ5OcTp-bdZBgqzGbao
X-Proofpoint-GUID: 83v5GbT6i7JFcNZ5OcTp-bdZBgqzGbao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31548-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5680119145
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

Link: https://lore.kernel.org/all/aYmV5Axyfo76D19T@smile.fi.intel.com/
Cc: stable@vger.kernel.org # v6.18, v6.19
Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 21478b45c127d..c88313b0026b9 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 
 fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
+	if (!gdev)
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


