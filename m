Return-Path: <linux-gpio+bounces-33754-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEovKZCzumlWawIAu9opvQ
	(envelope-from <linux-gpio+bounces-33754-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:15:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 241392BCD5F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24782319E3F0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCC53DA5A7;
	Wed, 18 Mar 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogDtvo1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkU40m8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2233D9DCF
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842484; cv=none; b=SFZ5P1Gyo45bsscZ7BTtZzbtyMKBX3umaEGbeCZ89gXzRXu/ksdBl88tgGMP4DuXGMDAP/DUEKsE62ZdG9Rm0d/In3Fh8PpVofkoLnFCmxnfOtRnF2a0RGvI4hx7dVJ8EDE00kwItq5jUDzwnF7KKXDyuZ1NEhqxjYQuUUdLxhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842484; c=relaxed/simple;
	bh=vGRIVNQvNxgwYEGhjI74/Y1IUF201zilUAtuMVGPtVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rL+K02mMLhCl9t2r6NwJRahtse8yDnz7XLKYjjdyS+WeTYNzjI1IJwqcMv9ezg5/qA7DLPPr+K5j4KcSJ0C3YcJKqcilzXXAE3jJmWpiJ7fc2ZqSOZI+VyHwAeVL3s6VQIzvf+2EbrPwVR2zNGfY4L4ReKTr8h/nzkmK+uQFy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogDtvo1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkU40m8y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBLSf320576
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFw6FFTXrfCiILH2Pc+y4DotjS6oQUBVV3Cov6fyJH4=; b=ogDtvo1BXu0QSd/G
	99ssGn37SF5nwvt4jUBAS4JQ/u6bF56Fsq6YTkpcjCAV8yTZ+GSXNoETGdkBpr1A
	wW9iDuWMEvwxmNSwIA/+tZNfMGdkejqeT5yXdPDo+lG3GsxebWcNOn9YPDUYesmD
	gr/Dl0SHKaO+GF9DP9hDHjcjx1ExQoZ7qDwXx25C0r1lXXb/dovt889v/G6J8+ig
	YEzZwPVFE2ssiGlt3y8m5AdNRHjrbsBqylzFPZHKojm4oqzSzT+bXeYYoFL0j4U1
	WBRT/H2E18nuo+QgsrSL4JlDHbu+5GT+VX44AJBXf45AJok/Dfi8e9LomtizKQI2
	OynCWQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrhgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56b0c1af64bso7640334e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773842479; x=1774447279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFw6FFTXrfCiILH2Pc+y4DotjS6oQUBVV3Cov6fyJH4=;
        b=XkU40m8y3Jt8G11JMfTHHRz0IkMf6YDpg6UYY4lQsApSa1P2i5PCT5LYOvS62G+Bb5
         KnC13uMrEFH9RbIyVyRbNCY35gfM0K8/X8+gBp69gJGAQPe/0JdqKv+o4FBATyQx2owu
         k6yA7UfZgJg8/BZhpg4NA8VEPuiTXeeeRIVPgj6W3s73SUQuEuAptc2IkRA9kDXF6eAJ
         2bgwtjkrC+5Gtb6br7u3MLxC71PqRE0XBfG2eUPPzE3yfTC3Jz54guf6neY49m+Kh1Lc
         Kw+kRFU//OpQdY7NsDNST31afHmrs1H46X1wIeL/BU7HbUay6pCW7oAp0YECePDJJGLf
         CSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842479; x=1774447279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFw6FFTXrfCiILH2Pc+y4DotjS6oQUBVV3Cov6fyJH4=;
        b=DxKtm6vuOe4XNeNNi8hxeljv6XFTB9V4/ZQwn7bTEeOweS466bUClk6PnTz9HHjiJz
         BWIbfo80siLMIJ9mnLmPnp1tGFAPWc72ZoMQlsdBIuoUr3S2dvfMMJaERuFVwElIzhno
         23KHSDQ3V5BYJ4vgABrzc2xLljeJf55vC8h1ulCPVjat3Qy/EgMAc8m9cyuBOCqmwoXH
         421vaSqb0Qwkl3hJAhxRXrtJxeD7rf9uDhaC3PA7O7xqx2MK3jVRe3BuYRj9bRK+uBHK
         OOWCxffXvg6cbgLspIyeChNvU8Ny5jQm6VwAMqb21NmaIHAe8iGqDZSMEQ3wh5KTdI8u
         t+mQ==
X-Gm-Message-State: AOJu0Yxoajn8PXRb63X+V9fWmEAf+i+eePncguFHmZeXH4f5mI2io7Pu
	O/EUXgJ8XodUMoD4KxxeIQu7DHP+gHZO9C+sr/H3hOcW4RDNdSDTKn+u110MtvcYMUeusJKpRW6
	GiREf/fUEsICJAo35Ejt9AtnVIyW/MM+RAtBZGaz4Oyr7OFGUvGKgfNSaz/DdMxjXWPWAjYTw
X-Gm-Gg: ATEYQzxxR0Rs1Yzl2RDJgSz+3YmrmA5y13dTfsAqW4s+4PoHS8TEThUFQyMAQLSsIGf
	fC297mjK5tcT7qfWPp1+aZQrhSRwHWYtLSonbrSNXikV4NuFaupZNi7dIdKt4GGgS5d0KRyiBnX
	yUeupjB/lPXpnpTKy/RHqjy2Kxycxi9U1pBNpbg4rNisRK+o+/cCSPhgk4CSSY6D/Jjn7ySmAlZ
	4BOp/bd4UzQfmUgH6vBJycMTjQ8jsB01PBXuwvFYX4nPHhCQKDVKdLdyT+7oj4SNp04zl0OaNwv
	dYFxX4ukPmBWMLXmSnk37BXMlyiJN6aU2LAtx6iyHqKqqIIACe1V6yjoi4DDzsCuCSHBMeuSwGF
	UqOdeqV9e9rfYvFxXbjhZNsZBcQf9gWj3XM7PA1sokfiXmRm0G1D1
X-Received: by 2002:ac5:c00d:0:10b0:56b:9534:c06f with SMTP id 71dfb90a1353d-56b95dad5bdmr2602836e0c.3.1773842479360;
        Wed, 18 Mar 2026 07:01:19 -0700 (PDT)
X-Received: by 2002:ac5:c00d:0:10b0:56b:9534:c06f with SMTP id 71dfb90a1353d-56b95dad5bdmr2602788e0c.3.1773842478624;
        Wed, 18 Mar 2026 07:01:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b8ec:50c4:23a0:2505])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm214207566b.25.2026.03.18.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:01:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:00:54 +0100
Subject: [PATCH v2 2/2] gpio: shared: handle pins shared by child nodes of
 devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-gpio-shared-xlate-v2-2-0ce34c707e81@oss.qualcomm.com>
References: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
In-Reply-To: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3635;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vGRIVNQvNxgwYEGhjI74/Y1IUF201zilUAtuMVGPtVc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpurAjQC/zTKTNa6ISVRO4fkb5CMWzyPj+0eFCj
 1XhfkOnUL6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabqwIwAKCRAFnS7L/zaE
 w/pND/9txde9rKNPlu3GlLAi6r0+9qjQB8YQF8oj+XNbB7CjEIsW3jfNJmhbKnmLc7c3VRBsMz8
 09wJPguJu6Xp6xVDI2vmV//qJzIFa08xOEZInshy9UE/j6EBpi4/WqtaczzAKIt0tsWLn2SQrUE
 vDAZih0M4Y5tpaqMtn7MUgCcbgoyTbLMm4SzFYBsv57y57bGGDeMBmTW616pgp4wd4c/fkSyht1
 3BwvgS7IpVyD956GmPyRofRFxpxaZvTrcndVcQ2UFf259omDezFoVTVCf72x8nw9swsyLT01w/1
 o20x6BrgK3c7uvxGA/hYCK28iOm3HXorqwAAqHIfCe77i3b3dZsR3U84Va5Akc5748ddswYoLUs
 2jsX7rRFs5zFKgJ+0PE3sW0kg5QtFPa2PAclIpx8TkAURj/JlS53V5OTirMweYEJOTMS8NKP7UK
 rfWrOFGNfNSpCQd5vmfi1NuhQGCUu1upE9NgoT1FQJPE+1/4zmahBX/ozxgUtrmnLLra2MZ5mxi
 HrAM5YYf8tQarkAbPzqJUHxBAS6DQua0Ddx84msajh4gZ5oImI0ynv6LMQ2x5hpoWvI9LQmK8EP
 TNwaHV/nvgh2FDLoEbRsKk9cnBNOPYVSpED5h0Ja0vXmqAbSECv2QD2FWRnSA6BOJw16vDDJk08
 JX942sRRDDZPcOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: PqRHHrGoRu9omGQyXSKpujMJhSGS6c20
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bab030 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=CIJz31xmX84a09M9gvMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOSBTYWx0ZWRfX2Mc2ZZ2rhNyK
 MyGYsA+lCWn+GJA+q2FEtYCT7ihLUHIYaffLpBc4gVfSG5VC3NVcsjcReTYj89HacbzqJ0SDXfh
 QTg9am08IpeceDjsUYieuayAWnkPsMRX807nCd4Pp0SdJlKCQ264M6rfoq9DKwef1HMQZcHbI1W
 tSGOS1TXCSa5zciUYn7fL6V1Ctkw0Y6oboRa/lIOCB8hV6psZS7Xa9xQeeDsVycWyqzzh3a15D8
 3LFNTDFH+/pxYsdPL5qrxn5rcuP9MF1j6TVEYHtaQciVK0ZcuYnScfQ1mDe5VO8MKBHOBERrx1H
 su1l/lzNXKARyGaB0w9JfOxkR3JlTLwQpwwoH//qgBG0aMPCsehkiLg7aqGxJb3a5EF6+R+GvoA
 WcM2eBqYmalk3Io6wvsnyZhz7u+uQVVxCTNyx/VFJXZU/VuwpEMuQcQqiXT7I5FRgTT4yt2p1yV
 4j1DWJlbhaftwXeMoUQ==
X-Proofpoint-ORIG-GUID: PqRHHrGoRu9omGQyXSKpujMJhSGS6c20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33754-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 241392BCD5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shared GPIOs may be assigned to child nodes of device nodes which don't
themselves bind to any struct device. We need to pass the firmware node
that is the actual consumer to gpiolib-shared and compare against it
instead of unconditionally using the fwnode of the consumer device.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 6 +++---
 drivers/gpio/gpiolib-shared.h | 7 +++++--
 drivers/gpio/gpiolib.c        | 4 ++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3a8db9bf456daaf021d3c691677a90fc6da15889..e257212fa5e3df249de0d06eebdb2165ae734ebc 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -443,8 +443,8 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
-				 unsigned long lflags)
+int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
+				 const char *con_id, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
 	struct gpiod_lookup_table *lookup;
@@ -458,7 +458,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
-			} else if (!device_match_fwnode(consumer, ref->fwnode)) {
+			} else if (fwnode != ref->fwnode) {
 				continue;
 			}
 
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index e11e260e1f590c46c5e575d3bb8f3b5a2240892d..15e72a8dcdb138f19ce000a33d3f53cb8f140bce 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -11,13 +11,15 @@
 struct gpio_device;
 struct gpio_desc;
 struct device;
+struct fwnode_handle;
 
 #if IS_ENABLED(CONFIG_GPIO_SHARED)
 
 int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
-				 unsigned long lflags);
+int gpio_shared_add_proxy_lookup(struct device *consumer,
+				 struct fwnode_handle *fwnode,
+				 const char *con_id, unsigned long lflags);
 
 #else
 
@@ -29,6 +31,7 @@ static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
 static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
+					       struct fwnode_handle *fwnode,
 					       const char *con_id,
 					       unsigned long lflags)
 {
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1777efe1a986c941da464da92255c261f27a5a6b..5df06eba076a462589b542278d4b849a8ee1032d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4737,8 +4737,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 			 * lookup table for the proxy device as previously
 			 * we only knew the consumer's fwnode.
 			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, con_id,
-							   lookupflags);
+			ret = gpio_shared_add_proxy_lookup(consumer, fwnode,
+							   con_id, lookupflags);
 			if (ret)
 				return ERR_PTR(ret);
 

-- 
2.47.3


