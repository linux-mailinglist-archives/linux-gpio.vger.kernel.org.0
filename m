Return-Path: <linux-gpio+bounces-37175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBXiBudlDWquwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:42:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1D589132
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E627301FAA3
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B404F37CD46;
	Wed, 20 May 2026 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogGZwT02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoseE7/R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394F03769E0
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262941; cv=none; b=ROgOev4AUiZ1YN0VBL2WbdqLT0o8U/BkLi5GOJT+i5SpbSRJpS3DJZHCrULn+Nvf1cCCytJIp7zj8PaIn76/6lHEoQ4C9xS9e7uRGKQdJxpUVzIhKkvOsDmy/805Ma+OJ02vY2Lxs20l2p9CzXZeh9nMVLdqnTe5oSGaf4FPu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262941; c=relaxed/simple;
	bh=XFzN6vM/Oj3ZhWKDE0Pqw3nGv4lwE+G7MDQ+R+DGRWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mjz2Aqr7Ls+yylUR5UngfXRZj/bPgnmTnAjyvpH3LgiYdvax5P2Ju0kCa1B/kPBRfAW7oREve8XIRxhTz1PVHwlSaI9tVggFdH3f9tU/gK9iBL1ifPHdkyvdGcTCCLSkGxI/L6Yvfx3p0lFHsXnBsnXHoibWqsa6tjuqOmVk75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogGZwT02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoseE7/R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JNCcDf2065195
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IXEJOp3nNbLPWB6txTpAU9
	4P/zOlvq5ax+yaAGGQzjI=; b=ogGZwT02csbcbo2AdKo94WcLKaqX8lEIKOPxmR
	yhUy+/fbHmyVc5r1V/bvWuynwJlvHfPJ/pUlRwBBaGOM5fbkTRJlym8eshzHBXfs
	DPRe9t3wjI5XQ0hM3dtucnc/PzlEDhJX0bvha5UsrQBIJuX5qXUtPqdOkXFeOSPL
	onNmUycUHfVsAIpF/G0M1tX3mHdp+7cHPU+mLnYASE+115cpPq9ROXo4BHD7hqKy
	oS0BOX2rVwCfpiJ1vl6LRU6SiWa8WGE47lr71hbVzUTK1OPTLOeaT8l4U6ztE4Xx
	W+HYug4RLgOCXI8I5axuwoa9phVK4PbPO4l9iRV++Zob5HqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3hu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:42:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso136797061cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 00:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779262938; x=1779867738; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXEJOp3nNbLPWB6txTpAU94P/zOlvq5ax+yaAGGQzjI=;
        b=RoseE7/RcqVCW98U9SMe810gR4fW1Vi4PefJE8c8Ebw03/O5znk786IJcv47ITpKVy
         QIVQ/OjsQ+3GCuefCJbcwupTOQqnJKALzs+Px/Q2wHJfi1yhiOaAYjGeDM4l+HHYYXnf
         +1EzHGdPgVFBQ31tBACxG9ZuFQibsU6Qj2VlBRT3xaAsNnx0cSb5LaRBs8YLgbNEXICQ
         9ZkIXh+uKqE8dPQdm3CBFfy9m315LJd13/rX7/i/K6Oa3HKyaB1FKpolIoHhQPJnc2ql
         b+euLUNwDNgfk3I7qUCQg82Bqj59DNvsUXTZU3l/qAkd0vdmb4jmwUExLIiWJViJeQf1
         Mepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262938; x=1779867738;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXEJOp3nNbLPWB6txTpAU94P/zOlvq5ax+yaAGGQzjI=;
        b=qGX66tsbDIVXcajcf7MBZi5z7g3K/PISn9FmaPAW41hNiO9Pm0qabnu/ZIiOvuckQD
         c8xU4LPSP0GWEmJsGbZEITQfJl2eWyDxaJbH5NTXNjdI6CF7y0MAE0g0WTlywPfXeO0I
         LxGtTvo1lq7dtPbfE0TGrXoE279s8Wv7orDzX9l8LeA8fjz/reGb2+lN8ztw9Os5DhfE
         043c6Ujz+bOuDE3buocteoFEVWdMhgLxSqDwwOPfKdVlH9J5wWjyIoNK6ZV1+Y5VPSIP
         BizQSgfnEoz77Iy+6LYTxu4vjXRIaY8GLBhXfrxuaSy5q/l6p7vaFKpYRkyPr+ZFdmdQ
         kt8A==
X-Gm-Message-State: AOJu0YyyWv/6dxVU67KZ990SZrVIyjuCtXPQA/A732N+aM12Zaaz0UrS
	H3rZig/r9Z+9NpY7c5xBEXXy0v4rW/OSQcirqTzWB2Pt9f0zOy5mUW9ra0G9YU7uHcILKxOaLPG
	n8IZHCeI7coTBASewBZ2VD6YZvk4HbvwHDUMnBUjHHc4TuT0XCzt5mHmO3QimMw10c1bi/jYn
X-Gm-Gg: Acq92OEd+x+VlizupB5E1tA48QM67IU0PReAnxB6r6II4eKSjazNfoNQpTsrm/O1D+Z
	SPgImwXMTBd7RmRGquzzEx/W48QrVuSPZ+uO6vMR8oWGC4dF8rtghWMncWGLHey1K/Iv8Z3Xrwe
	gont3K9iO03nbsDx1sCIfUBjbmq+l8vgJ15Prw73gRGRav0fUy0dV6xIoqNWYlenWm3rmmSvP+I
	NJSQPaKvwOSu/vRsxkt1CKhk1e/cS+jiGT9BNfcXv1c0smy5KtjqL5eaWXJ9gYMWXt+9bFW8Xgw
	PN10TknaVzhdcQ3xL5aeHTxGtE6OByyeWxZzQmJWk4N0SJZ//9vBCYsy1doYMYIMlZofONoRC8Z
	vs5ofS5DqnSRX9gTaPL3MiWm5UpPtJw5ixSE3WG3oy7kP+OF/AS0=
X-Received: by 2002:a05:622a:608e:b0:50f:bc35:aae with SMTP id d75a77b69052e-5165a25e9bdmr296796221cf.52.1779262938477;
        Wed, 20 May 2026 00:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:608e:b0:50f:bc35:aae with SMTP id d75a77b69052e-5165a25e9bdmr296796021cf.52.1779262938070;
        Wed, 20 May 2026 00:42:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm127410435e9.19.2026.05.20.00.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:42:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:42:10 +0200
Subject: [PATCH v2] gpio: cdev: check if uAPI v2 config attributes are
 correctly zeroed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-gpio-cdev-attr-padding-check-v2-1-0010daf8059f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANFlDWoC/42NTQ6CMBBGr0K6dgit8ufKexgWYzvARGmxxUZDu
 LuVE7j5kvct3ltFIM8UxDlbhafIgZ1NoA6Z0CPagYBNYqEKVRWlbGGY2YE2FAGXxcOMxrAdQI+
 k71BTqXTb4NFQLZJi9tTze9dfu8Qjh8X5z16L8vf+KY4SJGChK3PCqm1u/cWFkD9f+NBumvI0o
 tu27QvGzRPHzwAAAA==
X-Change-ID: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XFzN6vM/Oj3ZhWKDE0Pqw3nGv4lwE+G7MDQ+R+DGRWc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDWXUT58hRt1wSZv4rc0Butcw50EiGObucPa9l
 ZRBtaXxwNWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag1l1AAKCRAFnS7L/zaE
 wwPIEACjNXkJGdl3Xd2/mIfW0GGbUtFj31JqxgprrFWXf89VLrmfaiflmtOd4Pozh9bGHWcGnKk
 wwGmxefTSxJriojkyKzYnyD7vysOE+OxEgEKG9FBSYHhjMS4VxumTvxPVDBvFdL2bs0BI2DKlOx
 8IK+zztXHuhtA9mlH5H9Y1pEb5ZxzqK2WhaeWGNUo7GEDcmN6qu++tCXLyx1VJ8qLqirs6WvUCe
 FlhC0RqqEPp+NPTJbB6HMxj7Vh84vA6UfLeek7BYnUmjqkpwRSCRS2PQ8YIeeoiMS0PJss1Fa6N
 pkPeNpBb2lYUcqEnm+lA1/2/uf0V/uXVM2nBTeKvQ4xCimQDveIBTMLV4oMwIF9dteVLItl/uul
 yh93Q1riI1VunLcR8T0Jlh2c7/m6Qxroi35jTHkmZTd1BwoZo+4ypKqXUkFJGVKpil50L9J+Q9h
 eAMcXEKdSUvTTDyYFhPz9fGeFcyq0MGp0ntnKo7YvWuDT89v+QQFo56DJ+meKJnbZA0OxmNTLT3
 UuUi/npmS5SsAtQUdSrrdiUOQWN38X4ib70IWGrVpERDyZvL9rDOrGP+61xy5P8ypShLGPd3I+N
 wixyiGFNWgquJ0G1rzQqXbiRK954h+13S7FjFViWzyHh8n3wMVp/M+Aj3lFpnZvBos/DkRGIZQx
 CncabsTEvLtgTMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: YuZNVFhu6Dg3EDHXipwQUa-zRt76VLCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3MyBTYWx0ZWRfX5jg6Dty6bOqW
 mmiHUCY7TgmraRjHVldGDj4If4CwJjciA6el25rw/wzW1xjkYH/1SDHV6UBVBOFvWeyrG3hN4JR
 METTqG4ieND3CD10B2AI6p2PpfIesE7+SKmCjfU+khFkV967mK/i7U+tGGws3QQR1TrajMUgP7z
 TRo3x7ZiMMjAhth0JSBJVyn/xsVK2K9CqdyEH3qKuQlG+f1IXGRx1VmrhykEctfx4cL4v141+KH
 PQ6QqxXYpf60/il+IDOCFqTjOuqsvMGA8jDjMORmcnsa4WQbfPIegwvygDC0U3iTllbNGfTGHN9
 KIOh6BhHMCX7fMYaZjwYl2V/Bv6hY18P1XiR/P/ijLKcD0TWma62o/pw9XPfG1obqeXr5S1WeUk
 2n6qOMLTrz0/oIq5dB4wSXjwF0EGJ4avRcWAsfouyn0EaHxNnhKnFdKayuCqcxOCzHWd/dBeNWW
 rnMv1l1EuaOJmGY7LQA==
X-Proofpoint-ORIG-GUID: YuZNVFhu6Dg3EDHXipwQUa-zRt76VLCe
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d65db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=BL_IfG5vSrN7on1ht2cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37175-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0F1D589132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We check the padding of other uAPI v2 structures but not that of line
config attributes. For used attributes: check if their padding is
zeroed, for unused: check if the entire structure is zeroed.

Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Make checking even stricter: check if padding is zeroed for used
  attributes, for unused ones: check if the entire struct is zeroed
- Link to v1: https://patch.msgid.link/20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com
---
 drivers/gpio/gpiolib-cdev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f36b7c06996d70b2286edbd181899e4c572b9086..edbcc86e4b26f88036ed12c13055bb2c371fb6a3 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1194,6 +1194,15 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
 		return -EINVAL;
 
+	for (i = 0; i < lc->num_attrs; i++) {
+		if (lc->attrs[i].attr.padding != 0)
+			return -EINVAL;
+	}
+
+	if (!mem_is_zero(&lc->attrs[i],
+			 (GPIO_V2_LINE_NUM_ATTRS_MAX - lc->num_attrs) * sizeof(*lc->attrs)))
+		return -EINVAL;
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


