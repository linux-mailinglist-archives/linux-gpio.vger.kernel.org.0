Return-Path: <linux-gpio+bounces-34249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OVcKW5ixmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:56:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AB6342F20
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B04C3086415
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF913E3C76;
	Fri, 27 Mar 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejBpNvln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gczbKQsq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7EC3A6414
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608566; cv=none; b=hjb/gCZQVYlm0PSr4Pnj0inGabHyrh6K60xVMtC5J55GG6qj7rJ1uFtFSKr/XE40ufpi8qLuPdif1vzLs7fi3+a9fs3Vuz4GEcHRVw9se+yuifvOnRhzXcEpXejVIb4NdkP3cLQMJDYu6XzbdDYoruxXGdVlRHMN1vggKXik42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608566; c=relaxed/simple;
	bh=yGTafMlGbvzjDOgIsKdMNJy7StRtDQgGFTKJyFecXU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCsPHXQAxDi/zffJb/pO0vIz47IAlHQJpxdOXvrVW2pdKtwYbFttTTTUK9+T0Cr7grU5nNHJCGwTOweqWlO+pfRnLTTTCdW5VQlK9Ul57fNQ/9FAi9KLdNAdgav/er0L34X+tY0Pw9mu2kP3CR6v2gm7LIEuuhy4BsD62MvFwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejBpNvln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gczbKQsq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3bb1860253
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2QThIW+WAgDLoGil8v9ADRysmqHlj3FumE3QNiD3vQ=; b=ejBpNvlnGaUN9kDb
	AIu/Va+if0gIPjnc5nNJYM3k1IRDqOaQ/KFAnfkI549XRK0n9y8LGR/Q5BOhVm3g
	EuuhamxJC7gdtDN9wpLbe/E4HDOxTr73vJzVcpoC+Xmrom84DXGW7uMv6m4T1xhl
	e4RGqDlpQo+BAKye7TU2TJW4lkIpUqcS+XDt+V48o6zTLxQSS7RZWkYoVr5MxeIX
	56o3tql+2HkzhC+4x8MbV6oc2J4WQJSYsrH16UcFYf2BtAZem538/6r7RXIsW6nK
	dFjdlGGtaX6lFL5hE7ttA+0CvZI77n59+lyUt2I+plhevvEvXPgKGUQiZ/LsQgKd
	v11z3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2pbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so48573411cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774608562; x=1775213362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2QThIW+WAgDLoGil8v9ADRysmqHlj3FumE3QNiD3vQ=;
        b=gczbKQsqJeAB1WcsBbPwIwCIXa91w5OaJaXlBnKGnBa7QTdnzyW9bUZv+p2W/9iezn
         GobNov2bpctMn+Ca8HqNGDvtEqttS3QKTUKvelr0/7mFZQfWKdddiQLz1pRMvIRxeNfR
         iPzY+wdLNAZVByovHgZfqhYccuQk1pzb63kfxoXYdFdGyVSWwYyqJW/NGTClv+ASPaS1
         ti2c4tuQWNptFNvyEkTeJ48OxnLNt+hZLKryUta83xrojE9v0YYxtB9mDtqhzwHk4N3b
         O1Hc5Btxh3UxMx47FYxkYg4NhfrlltgfqSVFHgpx5IDFCzcg4pCxgXdqUal5KntnV1Xe
         w79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608562; x=1775213362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y2QThIW+WAgDLoGil8v9ADRysmqHlj3FumE3QNiD3vQ=;
        b=pYdxgkblqgUZLCD3CyNs62i9hNZelqSYSEbQ+I1ZJF6La6nM+nvLXvcZdBNoB7ilGS
         TXCNtR4h5sR/HDmim6Zg6c/JcgjrxKKJ9KgOlygsLXzcV6sd3w0TPxUxPt5hEnZ7KaJ4
         GDPUuiIXBvN9ezcG3XLmudr8r+qqkFMYW/pwTuw1GehJmfm7cDzTU9AYHof8aiFLbWmF
         MOzvk7ou/jvRlIFq3qDKcyMak8zOa3UtNT2Q7/koq4TY39Lq63JlS98WtQofj1B2M97l
         HWBYdSaLVUI8mAPv5aXkldNHm4O20Vp6o4vbn4mpz0mR3zoYjHtTghdoiuWdWmKH2F0A
         GEwA==
X-Forwarded-Encrypted: i=1; AJvYcCUmKJtsMgWxq3YxKl3E9Om61R1qiwbGvXO4bHke++Q4cLygWwPKObwAuvsRHOdWkyjKXU8YZAy4j2VG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3Am/BUCiJp/1chLAG3QpuigNHBIwy6ey/x6C8F1AIZaFQKTP
	cyFUu5KGjYLBX66NWg2/zetQZIxSKjlPjCBE2LSSeZ/IjzplfUGPu4UjKdahUlSqxLcOi954+bF
	uWKTqFX4SHLbFw9yokOem4EMcz4GKPa12084gksDo3j30AXsxyTMropaaJiHs/+sP
X-Gm-Gg: ATEYQzyDHTpCKeBwknORTd0Yyp5OdVpPmJQwp9J3DwN85ibFrIepQqEVNyFgThjxqxn
	dtM4CTH5SP5U6dNz/iJuvBkLiFvjbJjF+aQQ7zOjTsOEfk53P+o+ZYgx+GzhvoU4u8KT80X3a1e
	vglj1I8iWp9WR05FpRliMtnDe2vpQgrYttnOM0R9GPhe0TwT+3rqgzlHBggcLpKyjt2syxNBB4u
	/6HvCZE3UgctJuZzC/ca1TTQeeCKbPFtYxUsfCHLfGCxwdLJIkEQNvQIbhh+I/yQwQUilKKS2CM
	xGs9LQwagyX3BJPdfnNnSmcOXbn0emIHAwcXPtUPa8E9eaHYM1ocKEDbc2ijIxcW1JD9wx9ZJmh
	MDaKIovZmfWDmClJjoNBZILnKGE/qsu7bMg7VbBcDKq98biHZwRk=
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr24196831cf.52.1774608562133;
        Fri, 27 Mar 2026 03:49:22 -0700 (PDT)
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr24196571cf.52.1774608561736;
        Fri, 27 Mar 2026 03:49:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm14989445f8f.4.2026.03.27.03.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:49:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:49:07 +0100
Subject: [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yGTafMlGbvzjDOgIsKdMNJy7StRtDQgGFTKJyFecXU0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxmCp2RpsH+Nt8scr1o6krf3YKhvUAAsuyhCMY
 pVrnjfVwI2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZgqQAKCRAFnS7L/zaE
 wzUvD/4mNdgR9rXZ9Fxwd73uL9q8ltDJIQ3OygcnBzJobuk5ugjOSoqzpCEVE2bPCZw352MLw7K
 OV5TUryWX37dHWy85rndBe8MUYTBYVmLgfO4zdyY2lT7CnP4jPrFSr4V8XNoAl3xwXERn3Mk03A
 7tkhqJZQSHhH+nFo5VUa0IFrB/zftkGMbkKTCCCHqbpZBNyyWsNdWMB3ucceYWjR1GG0h0AG8qi
 zqg96OqpIRGeQTB4VUTQndQHed28DQniyAnWWjQxYmc8aZ7dSj5on9fj3mOJdk7l/8kRSgAIEYG
 TkQ9JicIEVrSk+ZOX3hWXa+8KmzwIlBHK3B/ZKYupLn+DicGN1JBI6Ie6Jha58wGqm4TpCnRLeO
 QAblILHkrCx1Lm03nOH/crOjz5CpF+WFykgvq7gCUnTaSfY2tn4CSNYclQkq3pieDPObFcWB8mI
 nvuOyV/ge7WkEyn8g2tHLkvvhxbejUDWIwx2bP2hdIMCaa/0ovoLdF6TggI+TAS6Eq5i0wtnucj
 HMc4rOI9wTy4Rwq3fAm+fiFCP0yc8VuTmmUT0wWcZUqahbBwNE3R8vVfKzL4PB0UxDXBiEQbxBE
 dNV5IihVi+vE1EpM9Oc1VG/RClaC97ADRdlXdUOPLyG2ifjeqmEQ9X2nrx1lqU0sJvzRvmvOHvY
 AIoa6pAD8UHwZGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c660b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WkRWUyuO2Ui2VqscpFkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: z3xjerkf7NJdbnc-d98PyzgY9UWqPxWZ
X-Proofpoint-GUID: z3xjerkf7NJdbnc-d98PyzgY9UWqPxWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfXy1naiN1kRWYo
 fjgGmDCwZ/Y1PcVipdCH7lGFati9fY88XtAf4IAakotWzUghbG129D+IYN2lTLUUxDYCRfgRLDb
 Zul3LcZ8CDLvq3NmOQxuOwEYVRLZ016/AQUweCuIpITjlv9tnNTMm87b3ManmMkr6CZhD0HdhMq
 ambxT07tFFLj99HuAa9IMwxZxsFX4jMdQoIoOkNRjT3AYsRhlmWY+CzeouZ1+1wmx5j2oGAJs6N
 yLbNcWfdoM1pQMlxHmfiPi09Qh2eNGt8H/jEPMtf6jnLx2IURYkJpNckraGix65Iv2/gDxWMNSl
 /f6HfWESPx2jmM5n2fDUoP7kWTVHCzdx4QCXFJgfFqyyq6+nl26Z4OeFLUMFPl9zdTK2oc9IS1Y
 pB46vFDlQe9QK/uQH/X+1O1PuijFWl4HXOYWQarsROhhTE9Mr5GaG27V/MvcVXlShQssVIrCIs0
 kNv/Ux/jJg8EuWXIlGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34249-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 49AB6342F20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This symbol is only used inside the timberdale MFD driver. Move into
the .c file as there's no need for it to be exposed in a header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c | 2 ++
 drivers/mfd/timberdale.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index a4d9c070d481a182890a58e4b8c850c4c29f7f17..d79419215cc292b705031a6432e877b94f9a1805 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -37,6 +37,8 @@
 
 #define DRIVER_NAME "timberdale"
 
+#define GPIO_NR_PINS	16
+
 struct timberdale_device {
 	resource_size_t		ctl_mapbase;
 	unsigned char __iomem   *ctl_membase;
diff --git a/drivers/mfd/timberdale.h b/drivers/mfd/timberdale.h
index b01d2388e1afe59e14f77e10678bdbe599d2b90f..db7b434f766d03deb7c45ec1c8c5ded003aad087 100644
--- a/drivers/mfd/timberdale.h
+++ b/drivers/mfd/timberdale.h
@@ -113,7 +113,6 @@
 #define GPIO_PIN_ASCB		8
 #define GPIO_PIN_INIC_RST	14
 #define GPIO_PIN_BT_RST		15
-#define GPIO_NR_PINS		16
 
 /* DMA Channels */
 #define DMA_UART_RX         0

-- 
2.47.3


