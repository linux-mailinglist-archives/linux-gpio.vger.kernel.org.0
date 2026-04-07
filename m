Return-Path: <linux-gpio+bounces-34790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKafD8391GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 405633AEA71
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B6C730060A0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B403B47E5;
	Tue,  7 Apr 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjuV/BiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjLlPfxj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758503A63F6
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566279; cv=none; b=axBpTy6Fs5kbenxF96CT8Fd8CFoQFE+S5xPEU6JIsHVlydLGMX33YYGqu1CIIWCOTRNiMwz9Qj+ObNF9RcBtQl/Nnj3xAKlf8VlHtnHP9d0Jp6xKZZKfvfaUXCFAFLQEC0sA5wybfxJmWkRxxhj9nAmvaj+VC54qCc75cAzfFMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566279; c=relaxed/simple;
	bh=J6H9SbxxS0yRZ3xxXuuGqxHlzRXpBkynpyWCI7U5UbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuPVpxbkJotkjE8ynLaaSWEFL+hiEBSifz3iuOiVUdwXDf5I0gcL7Wfz527ozQpmuBxts/HrOvKtRgvyefhiQwapzgeyxruOwhC3UZktALv6qfjE6k8RUHGEujVJZpX7a7bjG0s8G/ja9hWTu2BLkbaQ0xoJG1tD4funTla6pxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjuV/BiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjLlPfxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376j7N72009223
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuZJ6AhpjvvkTzhxwoCOwLXOgdQmvfBixaS7ScQNOvE=; b=fjuV/BiPW+sgo6+m
	Fwoch6wdTOeMQ33Q3AcWQD7Yw8decXobeIW2TOTUL/V74MwSpZy+vAHux3bdYDB9
	j1S0qm5AReBwwMTJZvt8hprJWR59tMENc0CZb7UJLBGZ/kI6mj9uzgBZbM5Xr8JG
	Bbsb9KQQuKsuid0cZsJ3nqUO2+J3dYuEijdxoDcCTGG08ARxZ4KP2hU2ARlkEtp2
	ajoiKsFUey1TaEaVB5LGBbYMHYaRqSj34uru6VphvXJwgjAs1Mg50+4Ac5ilrVzx
	aFmOUhggMFvhhuHzLrt4WnUlnmUaQ3XFExJRkI+m7yPQ2Bm/yAk7Q19qKz8LvMmc
	xqJZcQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtrxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so219576391cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566277; x=1776171077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuZJ6AhpjvvkTzhxwoCOwLXOgdQmvfBixaS7ScQNOvE=;
        b=cjLlPfxj5ufKy0BhyKjBlq+ABDLshUkzHpXeg/uCk0YigVE+fkCB1b9l1uANyxKHm8
         zc6Oc+VTkbq0Xh7WbqNuxATAP+DZwIy+7DuQWLSlOq4J6eyorQ/Vp6vc5esHzm447j1N
         02I3TMl+DoeDKaACXsxXBO+FVezPqknQb0KpZzQ6q6KvRYryjfQEOsWN4pirYPpXAlda
         umowvzN+f7hrqVR3aKVgne55Av0SRzddufOu8hVOA1E4Y/zRPYqLVwi2hSL7sm3ScP5y
         AAbldxnbJuP3VkPRJoU7RUXV5mWmvi/GERZ7l4V88x6CHzVj5H2vndK3VVo4EjZb34l0
         sQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566277; x=1776171077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xuZJ6AhpjvvkTzhxwoCOwLXOgdQmvfBixaS7ScQNOvE=;
        b=ZRLtGFzqPEqTBvSLDF5K26XyVlxef53HbcNmnpeAo5NLK4kNeYy2WfAv4/qr6aaGqY
         cZZy4RdmBULQRQYSPlXgG+2NtiwPkJQcpR4lYOUxQD3c1mojhkVrpzZKOvzSp5+rw4uf
         pLFVZTUS/iGFcVHZAq36SW/k+/Iv6DdJCcQ+jxljxpxPbjRf+gR90C3WKKW4nnrZ93H0
         QntVfLH2l6OMP4FYZCOWRQlZw+ssuhs36ofkTBcKKIlFA1+fpsglexw2WIbCVBsgRXTG
         +dKCRJTHKoK45oQjmrd0IjRNFsYsBqiyvUR4vLrRhGBLrX4MnV4VE+SfptajdcjbDIA0
         md9A==
X-Gm-Message-State: AOJu0Yy2lzId5uBMQONtO3E62U/ifejyjBrVD267revGQTZSQuJkzacf
	+JZDs83A3qSFbLUOvph59l+Uyv40p9ZtzcGp6ta6PVKbfxhnNjVDyIW869xdN/+slGYo0ycxoz/
	/qZOs2dfxoStyGc9jFFk6qWq5zhiGAupsNQfeFwo+5EZ9ecK65Jb9QahoOa6WeBRP
X-Gm-Gg: AeBDieuvLvnzm8hnrOmCsUaC8dFlVWsNmckMbwDtz7ds1uhdnttgO3MEUCmDXuyAYPj
	/Y3dmnKzC/LzVNsJVxjqMG865Rc9cQ/QrGLe9B6ACQ9Uh5XDNFwNOfRD6faP2mhnDYiixlsvkHn
	RD+wMX556bCSyFNJvV7mKbJPUnc7JVBKFKDQOngU74mIKQIgcEl8co9RjnqgzZSj6Kx22V7sVBD
	JwraNoZVELkFXUKDztynB0B9FqYBuIHMgqzxbC2qLkCzkiLFbMwjWeP+hpr54te4A2ZDiphZw6N
	9Nso/1tYs8h6xpTW+z/nps9VxZzSQmrGlBuIr9OCm0Z6uuYsVyeldBnPApOQl02JNXxzJyPsEy3
	q2SNyeDqeD0wvy/KHqHFalrDyVAggeqmtxC+MwBvVXc8lxMNpyOQ=
X-Received: by 2002:a05:622a:138a:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-50d7c4b619dmr173986091cf.5.1775566277054;
        Tue, 07 Apr 2026 05:51:17 -0700 (PDT)
X-Received: by 2002:a05:622a:138a:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-50d7c4b619dmr173985641cf.5.1775566276631;
        Tue, 07 Apr 2026 05:51:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:54 +0200
Subject: [PATCH libgpiod 03/14] core: fix 1-byte buffer over-read bugs in
 gpiod_chip_info_from_uapi()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-3-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J6H9SbxxS0yRZ3xxXuuGqxHlzRXpBkynpyWCI7U5UbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P21pHslcxtwHusoxjsXcw1iqH/rMOwQM83V0
 XeasXF/4bOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9tQAKCRAFnS7L/zaE
 w/xGEACuGwO2KYDmvFM5RgtR9JjrxWil2V4egPhL0k6JmwXfFbMrmBTb0TsGuAg+tSrycWPKZDR
 X5xaB6kerryW1mt/bxjNE1LVbt53HpJqcCI4KzfKXOcvGMm6xX3soLnLUtL5f9mf2RG69EXAD7d
 UR+GVMniHBUtpjmvTXgq9WtGUUKJVtDdraR8GhRwbIS+dGilOcq+kTUM+l7SDdmxbrFykkpRmSR
 8diUbgwhSUaRyI2NvrOO9PgtNRLZQUAcvyVU1IXGtOOsmLWCDeLJXJaDx5pJ7nNyc6Apk584CHB
 jGk5eWGyabKYAUqmWtI0T8RULXaFT9dRANsG/ftZSkn7OALhbxSR9jXYnVikrmQ0I5/8SYWz8eQ
 UkEKs06bIYnnVceMu8XJbUB7gr0Qjt73zDms/IIrOxlaQ9sJWgdWwcsBVGxHMPZnv2tlHI26GI+
 XOPGpThMyPZCnp8VpJg+QPNLSNi2zERg0rOOlhpopvC+GkrFUsQqIy6aMeRlp/jXk6prQz6YgQv
 HsQTt9bhe4Qc4CwsbWO0P52d0bEV+cQQ5RBqBQvl3XInYxg25bSKHPe7erRG8k5OwvICgJN1fDQ
 6tZFnhSbCepEi8FTAAEtiku7Q+HFxucmYtfyzj3No94CSEEFJpNxGb7XPVHGf8Nr+yxXJ/ENNVy
 XAaUU4sdueU2V4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX0yg6IWOGnjzY
 xTEL2WRWFPwvKFL5Nw8+BhXmPfzsIBfuiMTdg0xlKjb5mkh5QusVT0JjVJSzelFWUap3fe1l0Uf
 gY3PGeZ4+PC6STDjGGdhy3pApkVdEScTnmeQh4NyD+C0I3MH2eLLsRoCgoOrHThTdsOXY9m9QDM
 k5hvy+WDHGvEbb60GtIFpk7Z+M3vghqJEI8Ec+12zcpfg05pqerugPIIgD62V+xrbetD42e5YvI
 fuR92icGMN6iDmH0vlgd9Ti1IHhYdX/oRRF199m7UlDcSbG852/RYZcPmvzdFNQv5DqlwTJLUDx
 o3ZVS/q/qLkM89CTCWF49qqTm3YL7C2c6Zj6C8vOxwI1o5MTc9lGf/qWGoRyfHfxVHb90hvEuH+
 GL58VTWdLf6IVqeCUP6t8/PmNwyilOIMKhiKzO6/xD9O0aTSJnGvmYeNrlbGKQDz2ajWM3fOkK3
 Au7pQ8PocYIlvm5SzLQ==
X-Proofpoint-GUID: UL_9-QMk7_qMAKJ27o_JolYWp04ScFde
X-Proofpoint-ORIG-GUID: UL_9-QMk7_qMAKJ27o_JolYWp04ScFde
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4fdc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3rzlRIdmsTTl-dq41FsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34790-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 405633AEA71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The copy in gpiod_chip_info_from_uapi() uses sizeof(info->name) = 33 as
the strncpy length while it should read at most GPIO_MAX_NAME_SIZE = 32.
Same for info->label. 33 is the size of the target buffer where we
allocate an additional byte for the NULL-terminator. Limit the number of
read bytes to the correct value.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/chip-info.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 2d9f44d1778e29fda05cf7cf7fa5d67d979d58fd..6b55197f96b78ea66559394e4e788c4263ede5a0 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -57,7 +57,7 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 	 * GPIO device must have a name - don't bother checking this field. In
 	 * the worst case (would have to be a weird kernel bug) it'll be empty.
 	 */
-	strncpy(info->name, uapi_info->name, sizeof(info->name));
+	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
 
 	/*
 	 * The kernel sets the label of a GPIO device to "unknown" if it
@@ -65,9 +65,9 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 	 * we got an empty string, do the same.
 	 */
 	if (uapi_info->label[0] == '\0')
-		strncpy(info->label, "unknown", sizeof(info->label));
+		strncpy(info->label, "unknown", GPIO_MAX_NAME_SIZE);
 	else
-		strncpy(info->label, uapi_info->label, sizeof(info->label));
+		strncpy(info->label, uapi_info->label, GPIO_MAX_NAME_SIZE);
 
 	return info;
 }

-- 
2.47.3


