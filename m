Return-Path: <linux-gpio+bounces-34793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPwpItH91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7E3AEA7F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE9A7300405F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF4D3B4EAD;
	Tue,  7 Apr 2026 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0QrPcKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhswySZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4583B4E94
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566283; cv=none; b=GSEpdfd8c7dh0I8oYQsPuaCK3SKHck13AWI8AZOBA1rv3Odc2vdv9Q/cW3n/Rh+loyuqofrO5FiqrpnHF4cUcCTF4OSCcbpbiKZUkoYPvq2da3s5pjt7hYg+GdBXzrxD8/HClIsbd8a5fzyM9MGTbhq7H6TnXW4XQqdgSuBpuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566283; c=relaxed/simple;
	bh=LFAus8JvuYHpPvm6jVrQiYCWjVymPkski4Us0H8pOTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGe3wwqasCdke0tgVvSgvHaEc6u82Gq1HK/V4m1oNM6BPzHX2HdqaFI4/c2rgSwDg1DFXL42ZHsZppeoByqe+bQN8tSCcHHrb63VwS7Xbp8ZD+F0sjBq8FaABtpv6krIKuPjJ7ZlKQoTHhrijdSWy/Dl2M2PcvWvw+Jrqzc2ecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0QrPcKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhswySZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376tmom2009900
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAkFwyclbebV7USWStrCtNnlMRDMI6cCrl5uzx/e9aQ=; b=T0QrPcKoRLREjlGK
	j73zJxsP2Rl3Qoq5+V25BgRzpgG26+7b9NBAUFvrmFcv98GH0CNwTRz2vyKFjBJ7
	V7PbzHpRmbNDDs/Ez2YHtZrNILegcE43A5fMHhnqsW36GrLwtWIvZVsqmmfYftgi
	JpoptPHXRv+9Lm+KC+ZwmIyR9xJiQnZPX4AB0dqzvc4wZxdY47doxtIp0sWKBbYN
	mMmRHzglwyPGH2eCBm6TG9BRDh4eJGLZ1Ykk6ZFAuxar4irRe2dnk2frHw/lJyg+
	4ftd7LXQd7EOK2IaVSTuAWpwbzOxATlQcM2qr6iR5NC9as62KiqtwFvuQWhYDzfi
	ahncMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtry0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e4c29caso54033861cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566281; x=1776171081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAkFwyclbebV7USWStrCtNnlMRDMI6cCrl5uzx/e9aQ=;
        b=UhswySZZ5dwj7zPJAgSI3LhiUdfCmKlBktQC7TueakByqnn2TzbZ6t31SmtziQH0be
         mDYbMP/w+zE8PGS8wBuq80BF0kPsuHkAo3cxZQFuCV81nvTIXbtUpWQyELELaeVhGW9z
         DausUSz8HwAZMxMmsN05KYQF97Qvma05x3y9aQ6inYEyBMF3UOpnfwl2qWsVjEvIgBlQ
         vMR1/SU/PYfQ4IwQOXtMt2KtMlgdYWZJChUB+wkExwdBMYmA8ZdJ5ehp8xDC8Idkleme
         LWuyPh/hw0GFLIH5CM9eeDZSXfkmMACqVz3Jkg9IFVhwkgf4PX7AXxlV+Z5GPJr7FSiL
         hWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566281; x=1776171081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAkFwyclbebV7USWStrCtNnlMRDMI6cCrl5uzx/e9aQ=;
        b=Twtgpk97IZ1XgIgQhjZsko+QuwWqYIAwzNTvONBoBlGhlkst7gWCfueQoPyACn13IK
         B8LKAKD5wfUhp1bPJoHGCMOV6qeinElHCJUclrZz0CdEC5V/MgtOQOcf6WcnV+M8orlq
         DbHumUPfNQq5lEzm3BuFBNt1IyTCGdfEoJzNbXE6UMG0AbCUW4FCD/KlVALK3Gsy9T3u
         TLLT/gSX3p/CpeCh7mjqs97DDfkUfZwXIp9A1h2IJgfdG51euQ/xTK1JUdHhOcDV/0RP
         epXFjlbGFk7dvz3RpbIDRuPxIldw2F7ULTuD7sFeuPbpfCIiqEzsYnZrxGpO/M7ZWXvd
         +vyw==
X-Gm-Message-State: AOJu0YxTtsu5UFq+InFU3YcQrlLQa0WQomvkk0vqjmszCrSF57p9DIWU
	AgIoelBeXGcvOYqy4cuVFE7Wh+BDL8iDxM5JbaYoblPtxvIPcFxAHpHq7rjWLentqptq4WQ6q7l
	H1DiCD7AmvYumnXMw1a16zi7/OB1ny/YnYgC/wfB6Sbe5e4ftX7nSCHSVco5KnfRY
X-Gm-Gg: AeBDiet62wKr671B18bReGklG17GaBfv1hoVhB8aXJ5A3b4aTngY0t6nABPuSEcstfQ
	7alsw7RHZbsnAUsYNOmzUa6kqEw5bdWYvt6qeZ0RVtZlphHzhbZgRH+vSu+FAY/M0xEvjxefl4d
	CVNfMkJbg29xH6PnKTsrU4Di4VuvdYjvO80IgkL59qrG81fk33XZJIH7MPMz5ajEpceR8qxb7xN
	2DACmnSnExikRdkJg1zXTOSvAp0xc43/UYoKlNCuRM6tqAU/kCENZppZbJ+2b8nzZ+iBJ0NW7p+
	W1KEGnZ8hf6xISow0EsXxrx1EMl29j5IyVDmIWS3HjidZ170YwKl8QenJi72y9rxQ2xM6/WUJtJ
	0IzU5B+WXjYe+eNb79cbtlGW306B4IDwzr/TOsHj9B38gI8i2Sg8=
X-Received: by 2002:a05:622a:14c8:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50d62b396eemr240070881cf.17.1775566281000;
        Tue, 07 Apr 2026 05:51:21 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50d62b396eemr240070501cf.17.1775566280601;
        Tue, 07 Apr 2026 05:51:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:57 +0200
Subject: [PATCH libgpiod 06/14] core: check the value of num_lines returned
 by the kernel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-6-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LFAus8JvuYHpPvm6jVrQiYCWjVymPkski4Us0H8pOTY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P24kUvHc9bHtHfVn09Pive6gwRM2FlO8PYCt
 hsmL3OzLkKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9uAAKCRAFnS7L/zaE
 wwT3D/40KS0c5oobU/xamNCgZn7rGeNrHFOqrtDNbciGwB/oKSjWS392el9UZg7pET+Rgi6cccU
 UZzmO+an74oaoGn4a8+uVk/nT5IRKRLyNXmldfvk1ypnjL66FLgHJBZJmiVpL5Q5iGxvcHtQ1DQ
 OBetRnDG9p7S85n6oWalvo+KgNjxH/cj6EDPkStHz6eF1JHXr3WxvOaVLFdshECtSf87HJg3nj0
 toD2edFd/BrJRemDfXTix5NzWSfr1tVcugiPzQurNntPKM2+kB9xVRxH20DVlAkw8JeKl3P6jtN
 FeVA6UZy7NLqnJ+hwXNiVJ6HWfBPZLwcsHsir0G3MB1IW2rGLdq98XqeG4H1Xow4hfnjUfbMiMY
 5wpldJbSVbfkPDHlNZldnLBVmB/vFUu4jf3VGLtbXnxW0rn8GH1yrcWCLDPe47JBwPrVnSuVAih
 LV3WeQHkmyNsVVk54Ril6JutxU2SioseFiFFYveu6FYDQ42QH6Vp4uB/FCzXUgyt7fGVIxOf9iM
 9EHBn6DERfFlLPezlPJ2gfqhPxeSlESxNuKAXwX1BjAhSonMNAkIAQsiAA/xNjVG665J5AuVmL4
 ZboSQzS/AGWhd8ksAVimhF5Um++Zhh4R0eiLsC86E8HkKZ6mTemR7u/zOTd0rqsDF5ZSkSEd9Mq
 xE8fYsOeFvnmtkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX67QcOr73hcCD
 2TGzhoXE9EbQxlNCRfnpGVyvUNOTBtVyvAt8wrZbfG9/0EzUYHjKhDoSzXE3XRznsguwL/qvj+q
 kH/CkiURlcDmYbVpUfBncbRusiSzfTBYBCEKtQ5SnIE9MVH5O7477VOSwxc+vJuBdk6Difv3Ihv
 /21I7IpHttJDFJXapBIGGj7lAIBCgIS1E8OvdII3PLagB/TcraC3F6JKmg3t18sHi/ZVNOWEpkd
 7dR9KhGFRLuP+tAqFo8dppgLgALrpaYZOXUeD0NXbuk38REmbAwGS70VSMs8bAKUwX6iKJ10gCf
 PPgqfNJ96ht8B3AF3OaCKeJmLLl4weBQd1aMiqwP1CsgoB1rLp0UT06C2YDJrIeZmpKKktjwyHn
 lvTZH/zhm3Ob0sJw9VI+Nyz2Bt2CqAF1NxP2Zf1JVzo+KI5G7H1axeogjeFlRXhbLQoKCYmdWVp
 vI0xRA3rLSIh9SHztww==
X-Proofpoint-GUID: Tmwo_rvTvYiflluerKEmNiwwywrmDT4o
X-Proofpoint-ORIG-GUID: Tmwo_rvTvYiflluerKEmNiwwywrmDT4o
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4fdc9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Nn2DPWRt7RAnnKtp:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AJEIOyoIwW-J_MfQ9_EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34793-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3E7E3AEA7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gpiod_line_request_from_uapi() initializes a line request from the kernel
ioctl() response but trusts that num_lines in struct gpio_v2_line_request
will not be greater than 64. If the kernel or a malicious kernel module
returns num_lines > 64, the memcpy() overflows the fixed-size offsets
array. Add a local check in the library.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/line-request.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/line-request.c b/lib/line-request.c
index b76b3d72b79ffe60be0dd2fdf28c6e7de35f77d7..2d41d96aeffed731b5039565672ebf894317a2a7 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -24,6 +24,11 @@ gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req,
 {
 	struct gpiod_line_request *request;
 
+	if (uapi_req->num_lines > GPIO_V2_LINES_MAX) {
+		errno = EINVAL;
+		return NULL;
+	}
+
 	request = malloc(sizeof(*request));
 	if (!request)
 		return NULL;

-- 
2.47.3


