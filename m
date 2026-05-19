Return-Path: <linux-gpio+bounces-37153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM2XFaxiDGpXggUAu9opvQ
	(envelope-from <linux-gpio+bounces-37153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:16:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAE57F67E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C55C2303258F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F15F4BC014;
	Tue, 19 May 2026 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCW+IkFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk3C6X7h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA843BCD1E
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196510; cv=none; b=O7Lu7HDymUWkiVV/zWVB8+dneMixAwjAsmuDXFjkseo4W1r5lBaeVpIuZuvWv+Qukhuh3ubXXxAjUVA9jwsDDPbg0WmnaIAHKtc48Oh3cHRGsIumOKJVDggedz1o5dMPvsQwqMHcTc5LATBRTUFaEcOvLFIV577Ls8WDL8iX6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196510; c=relaxed/simple;
	bh=YKWiZfPkIobtCo4vzcMMJlDElecXhx5I2N7ZmTnWs2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CFZp+j809MP1cL9qokJySue4CEGJqnWzhqZBWr3ZfyiEk5zSBqAAfXT6vFm09fpAExSK8n9GAu42zO6RcltNkDY+p/mbeM/qrLlSLGetMJmHOX3d08H0eU5vJkKwZ05K92a2irzs8wVQFssHUIIte0KVVTbG19g07vQEJF0Hh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCW+IkFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk3C6X7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCZnGM1395953
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 13:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rcENiQasZV2cGHWd5fnBp8
	yb558lW/33ZGqtPWbcmSU=; b=HCW+IkFtCOzGSPEH6H16/F89S/NQmNLNzazCiv
	1Mlkq6oYHpd+hDGCYWbVFREw3lDZjRDE6Th2pryAhACD36ymykTzy4KmucKAJpnj
	B+LYwFpFkdaSfGkCiPjkCDpgjleyRbluAQhsUaXxtfAkk/QmzICW0wAKPidtSKx3
	jRBRINsMQsMW59Tpf6UPosQVH3iTXrtMYXxyjAwxHvlYrQJOu2u04Yw9fULlR09Q
	I9o1FSdceuN8MkNzlynjuEaDDTpFK5rswASwjLQlsCXZqPsL4BN8sPVipLchqwh1
	HsUCYHWIxWD75RNWDga8Kyx7xZQXHV854pMWXJI9JePcuODQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8r0q04tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 13:15:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57525c1ed46so2450739e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 06:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196506; x=1779801306; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rcENiQasZV2cGHWd5fnBp8yb558lW/33ZGqtPWbcmSU=;
        b=Vk3C6X7hIqExIgtklHgC3DQn8PBglSpgH2iKUTiY/4TMkOMHZiaDLAuCPbc1JER76T
         lbtPV3lR9WFUiGJoBnx/2E7RkPW8LALZr+AFG4qTdcqQ8WfAE3Zqju1v45rUDKYpd/qE
         qBKssuO7vUKoKKQMWzCu3Yc8a8pXQjOQRM1VOzl2zIwbLWbEpMst+sdWkLOn53kaRj/I
         XfI6mHj9kudBYX6UK5q4CEVR7wwvy07uHXJ3H79zAKYs/mgyGZvWmt0EXkX+hn83yzZY
         mm+f9gHogdeK8De0dmvhEhv7KNb+qfgfL7WThOlwe4w57V1+ybHzjegpDgqDGpi6zO/U
         2q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196506; x=1779801306;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcENiQasZV2cGHWd5fnBp8yb558lW/33ZGqtPWbcmSU=;
        b=e3GeeD97hGLiEbZeAvSHKCimmtqkxYgXLSFdEy2QiOqL9JW3ZqnSedn//LbWVG9mVd
         Gr5AFCP3nFXi9tvCGA5uM9mZzrjqTfBcF+vpTqTnVL9TTYrF1nUUmzc0v+Kg6GSWXO3f
         IiPHF2qbyBs9y7zcnT3rsnOz5HfazXvNC7oVmIkyVYHZpb+xKTWyRgdkqZoIFz4+SB00
         /dKNVgQUVMASCdiLPyub8o8U50vr4+HUsLaBVz0C79XoMFnSAQv1rSliBGT8nti1fkPG
         2UZWvxW/Ue60x4kP4Rz1/sTB/y7sHKjkrvRzZ6cFIi8W2cMYSN4QIgT3eGaqe1arvGgN
         dJxw==
X-Gm-Message-State: AOJu0YymhQ5EGMXBr351FGT5moX9FlIDaye0BbKpoyZ81dA9xpKN1Ujz
	RzfOnqJ2lJpkRidCTJdCRT1AXkDmxzVcimm5m2Q9x1aUJuBRJgc/I3lQxUySGOdu8rTBc8J5Ng3
	6OgLXMJd2xCDZLGwOV9KdP8Nv0j05aF0F85ffgvtcXOuF/TJExluK6vplDZG65xVIpYEln2A/
X-Gm-Gg: Acq92OGNNmKdLCYagr0X7PTyJKicB6SWoZsUECFOqj7ectFbhwQttIIuiCkcSPu/RQ4
	jRic5pGy6mSfQhUSJQ7eoOjpYCZX/uZvJSUqOiROveNUApHXNTWy7lW0FAfsLBJPUpupwcYwBFQ
	XcQ2RwLUhLOQFHdzMLazKGZ9SGg/eS98sePcsfjofK9vu2tw3CfhLhs/I2xM2mD0oHBWtWo/Eub
	f2g6DhQ7IoFOiePxlP0gspEQ3C5b+ECdnPgssPHHUBA37FSG5QRPINsRdJ937jrTw8jDFt8h/KN
	pHuh8akHgzIX2GFS0iFrpGN+L4axG10qSYCSGkYeNAqaAi0iBEe1t478ZcXsfELzvmvlpauKJmV
	f6XyCKItYeZpb50D6GIcHTKZBSbyvkFbqaG2id7h3oUbmQsk40uA=
X-Received: by 2002:a05:6122:9003:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5760be3bf38mr10738326e0c.1.1779196505812;
        Tue, 19 May 2026 06:15:05 -0700 (PDT)
X-Received: by 2002:a05:6122:9003:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5760be3bf38mr10738257e0c.1.1779196505400;
        Tue, 19 May 2026 06:15:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3acf7sm45735877f8f.12.2026.05.19.06.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:14:53 +0200
Subject: [PATCH] gpio: cdev: check if padding of uAPI v2 line config
 attributes is zeroed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE1iDGoC/x3MQQqDMBAF0KvIrB3QFGvtVaSLMPONQyGGRKQg3
 r3B5du8kwqyodC7OSnjsGJbrOjbhmT1MYBNq8l17tkN/cQh2caiONjve+bkVS0GlhXy5RGDk+n
 lH4qRapEyFvvd/fy5rj+u8IExbgAAAA==
X-Change-ID: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YKWiZfPkIobtCo4vzcMMJlDElecXhx5I2N7ZmTnWs2w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGJTOhXl9t8usm+c4OipLzLoAndtW1HhfCBcN
 3iKWH9ELgqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxiUwAKCRAFnS7L/zaE
 w9gRD/9d31ecsIbvCb8S39qujE8NvxwuDxbBB1A6QjLMQr85JG287rLBm3T2fLqgkiE9WH9gRWn
 5bXjBDYURyhsUAlPyrckgNwFSIQ6PBS6+lsmp+5CLnIpnro6y6MruhNDvjcdphDR6xad6z7C/3e
 DJs7vkJP83cQkPZ5+Zu21NN8uNl07Itfw76e7bCULYUishRt+nxsHGh0r5e/GymSXTWEhnPdUNr
 NzBWzIXXeQasxfTPDVQTFMPw14ePz/KflBR1rzbybDAa5S+gB05is/R9/bG6ibIX2vQRRAZOvU6
 lUuDdY5dJoxifgc/r9f9FhWrjtMb68IUI5fBQVUPlqBKWfV6dJXYegy+0umaxACN11BpCLtasrf
 TztptEu6AxTVC8u54uch4DQ2HuSn3/sDwAoqmCgRvPAv0ECax1JsaMDv7bBsSVL3A0tJdkLPluL
 g7UyuhvENlfL2j7NoIEZuM5K2fXaiBLozCL+dCRMeukoOSeA/ZaE+S+qu6cvfELqtF+fHbGHqri
 OdBtfb7K9Uwv/EUBnhXTHRdzPZYFLOIZ2C9t++lgX/074AzsrRoOUXrb8bdK8yVggHLuDdE/8XN
 WbvNjn+6UHqmggDLs46UYi+FIhP0K+QJPCyi1/fFry50gr8id+5CMdp/QPQEYkK63e9Mwi0ElC9
 I7k/T6gew86SVxg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX8RoTuqqZnNnG
 6h1BjRWWgE6gMi77RYbYlXj+HxG1JQXhHa8eB9caJM1WsFfPcXjWqLOyxVs+0uHeTee+yJoMw9n
 M7jhimEi5ZRZErluVmGliNZUuZns3KuEHBVCZZ0T9TWvvS5F8YeEic8cS/eZvO0pShmjLnM0cdJ
 kitdMZy8aiEK2JF+Ms3uthAZQdrVyD8fpJX6jZXNC5jscq/0/guV74pfI6NTxLPGjw1B7CxqeCx
 RCxGAatR7a6YAgzM75vV1LQA8f7vr97QJoVeeDM4vfl/6VT0yWSSOcVOTrPxuvPOcdgLpo141yG
 oB172Vovlx8016grBwo221y/4WFvTy+bFQ98pjZlAdqWTrKXOzI5sBqj39xt4zNWsjx2HaJsBnW
 yOIkGloipR2EicJeDNHa03Pc0QJxMpcyY/qLMQB58GzVtYRnxmJyC3FCq2vu5e6FQlair6zWPvg
 1ZuVy6r+BWLHZt2MNiA==
X-Proofpoint-GUID: LhDZhZeJLuQAYNPx9zzvHLzN2fIurDaa
X-Authority-Analysis: v=2.4 cv=Q6/iJY2a c=1 sm=1 tr=0 ts=6a0c625a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BL_IfG5vSrN7on1ht2cA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: LhDZhZeJLuQAYNPx9zzvHLzN2fIurDaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37153-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADBAE57F67E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We check the padding of other uAPI v2 structures but not that of line
config attributes. Add the missing check.

Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f36b7c06996d70b2286edbd181899e4c572b9086..f6f49376a36288cdf44493334e766d6340294ed7 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1184,6 +1184,7 @@ static int gpio_v2_line_flags_validate(u64 flags)
 static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 					unsigned int num_lines)
 {
+	struct gpio_v2_line_config_attribute *attr;
 	unsigned int i;
 	u64 flags;
 	int ret;
@@ -1194,6 +1195,13 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
 		return -EINVAL;
 
+	for (i = 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++) {
+		attr = &lc->attrs[i];
+
+		if (!mem_is_zero(&attr->attr.padding, sizeof(attr->attr.padding)))
+			return -EINVAL;
+	}
+
 	for (i = 0; i < num_lines; i++) {
 		flags = gpio_v2_line_config_flags(lc, i);
 		ret = gpio_v2_line_flags_validate(flags);

---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


