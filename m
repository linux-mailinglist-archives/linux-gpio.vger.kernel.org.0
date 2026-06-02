Return-Path: <linux-gpio+bounces-37784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDXsBFqKHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:46:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9A629E0B
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D63FD3037F5C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95A33939D7;
	Tue,  2 Jun 2026 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goPwaRQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8Rji5+q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4217A2EA
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385868; cv=none; b=SOAaKndd3wH+OZzSjh/ADZvfuRQvOlOUz5YpWnUw4DhJbe2XAuUnCRnUCafifbKH4b7BiApbOxvl4o8lM5ehcV/QAAEvCzO/Y71HvQxI1/Y8Qho8/S92urAPpdy+NhJbEXUewwgofR7BmwzhQ2lmYKt/tLCRqrTL1Mj8JBi3zY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385868; c=relaxed/simple;
	bh=KVBPtr4M78yWGaPysdPmFi7CSc1+3HErL8v5yLnZ238=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbFFFgSX6hhZR9K5jLSwJhDxXdyK9iRxCFEj2mWPc7Sfh5Ihf8JY/Uxd8JtKOFDuZu8LbB7Q/gl98qzTEyiwa1cQg3cE0ip74NGKcQL+cwbqucjkdmlS1tlznY0C8/cseAlI1HbSBYUs9JYkp952Hsyv/oAONDabwXyfwzm6q68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goPwaRQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8Rji5+q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245ewT1938710
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnQUieh9YC2Ib2g7ga9/bfT1vFdwYnW1+0tPfXbfca0=; b=goPwaRQIv5nlKZ/w
	096uRymqaeFraSsi2VpbLK4OYvAAQDJWEyqBmMjBnqHYV9/02UWrvTGOcE1SjLgY
	PMGX3ZEskABpIPp9+ru+HI9uZfreoKtOmOKtC1lQHsQhZHrz4Y6ZFh2sKbQA4HnY
	2ibf6IUfT0wgtIVvpCrF4HHEE/UydYPKWpHTr+LtKL9D+MuUKOY6NOYQZ2BHwJId
	Kq43cAUHxhWVJVYB0CpV0BbzXeqxky0i1Lmeda6lfNxXr1RkbAAcbqmcF5F1PPiu
	zEaEQy+DRllX7wAPPU7gXC0QfBDBNrG2ZNNbzTVI7DTZhXDZH+5cADsEqX/V1gMr
	kWvOzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubgs5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so47660981cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385863; x=1780990663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnQUieh9YC2Ib2g7ga9/bfT1vFdwYnW1+0tPfXbfca0=;
        b=h8Rji5+qpq005r5x1xucOYrF9j1MRNRSkip7G9M/n0UhXC7OCnHf8ChHJ7ENgDrcrf
         twop0CLHniVVHRelQnJtf9yllKT3JGNjz481GdcPc5L4P7xisv49NRy6URWDQdHjDCOA
         CNPgP1miYvxsA8CKj695GtdBLsmxw2ljH7tP0MDSAmL0f7m66lbTn1s8P6B37wShgep9
         gUhmd4zfbquUkDHVwRGf8DgA1rHpJ8lPpPIzxn7EwF8D54Xk8xApFhG4afp8JQxAz6yK
         WR4wmDz6nptqR/m1hhy3QswsG4Raxpzbd0yk9nKjOYUdMsEsa+P4etnsiYcS9nZRgamp
         68IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385863; x=1780990663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FnQUieh9YC2Ib2g7ga9/bfT1vFdwYnW1+0tPfXbfca0=;
        b=Fe3TQIKSnXUc0dgMtoldbvbC1A+vuAYFj2dFGANmSLT8O6hpyZYXgU0y6AdQbozgnJ
         gitls+eXtWl1t3QtkAZQNxTiEXHBQpZTj708JVtDa6medFSsHq8RoyPAVIIPXxX2kyoF
         AF8Wlo6waohOZN6SpJLozjAd7h6ArTvCqOGs5gHyK5gKyMC2pec/MpnQ0PUA/ays6fa3
         /P1zzYsZhdcrRMay+2AAy+L0gozc23K9unRG5e+S9iMbp9aqSWGjl+qvroaA03bsIsnS
         EWXbIN8+m8X/JEVdu+ri65MgR0IojpU8CtZ6PAzI0Ly41fAoRcYkXjAvtrhfNA5BILVv
         WSPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qtS3DXSR4lbY4oAAlmnFKSIwDE+qKUZJ3LVXkdYDyN/BuZgLVnXXpbzsP3UPYTb/eSmxWvTC/kxy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QaRKDce89nXeMajNjDOdITEaCRR59r4voEVD8m8DDqdvYItL
	ND6Nr05uFL1i/Nt0/0Tn/cI5DO0g4TAdhewSFlwk7x3iXngVPJ8nNmMHFI3fBnOl0eCFcjAhaaj
	yG/dbNm3JhFj0bYic431ab87QEHSNxy5E4aIWK5qe6iRTfu6XCt5a8LHnhsP4iqsxcTlYoKFG
X-Gm-Gg: Acq92OHx0l8z36pXLAZLvKYT3agtqSez/V9bVGztZt/O8foazpnONuK0mRx1cfikplU
	cgRL+oHM+1s41lL7kH4TdiSph7Z/kRvzHpdPpOglKRN594Aky2SPZl7Fnixjv0bAnIekxxgaYtN
	bZscyaOEVC7inGOQLBQJGtSRBrg+cs7HhfE3Hz0y95KlD1EtfE7nBaA9APAeG9A1ehazCT+ssLr
	xqYmRrvnWgqaqRQYk+T1elUfJk7RLhKw8afFW2rNIlP01sidX1BpmwGcz1nUFUfKYvQyhM8FLZp
	7mKuUUKDHn17dD+QNYZLGKmIkMTiRXTqklq9fJHtLpvrRNKTYXnOytF/S57eSJpvW4xLRzeuYQp
	aLu0GXZmA5LYoL4Q3MiNeNtc0OiTtWn9bw9tx4VJBeSB8FTFsWuj6yqWvJqiVQGetdsvKVhbf4I
	GzI1nopxZSNCF9bQ==
X-Received: by 2002:a05:622a:1f16:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5173a8353aamr199298311cf.43.1780385863048;
        Tue, 02 Jun 2026 00:37:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1f16:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5173a8353aamr199298061cf.43.1780385862615;
        Tue, 02 Jun 2026 00:37:42 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:14 +0200
Subject: [PATCH 3/9] core: add explicit NUL-termination after strncpy()
 calls
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-3-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KVBPtr4M78yWGaPysdPmFi7CSc1+3HErL8v5yLnZ238=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog4aPa9h7xrkWbRw5rQ6T08Rv14aE5H7G9ok
 l0aWwmbC3OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IOAAKCRAFnS7L/zaE
 w5SaD/9LLyoVAg5baAYpyGu9kfFNLVOJk9JDeG3jxqnhu5YQP+/kxoPyfz9fFrdNE7YsU4imooQ
 7SNnul+YW4VF+FbWTX2DB+LHVRR5sO7o90xleTr/Lx8eszfT173ymmGIINjTrtsrDpFupv/8aOF
 jy1Uw4d/XCtkdGE26jVNyqBLh0mf9PCoHTW8LN0e5n6ZUmuUxRWG3ts4vThUUjfzH5oTUuiBKWt
 QLsncczkZchmcq2tAJ7SmU2dWPPe3J4QIMSeNInL4KfPjmtsvImtyLgR96lbxJWGWUqf99UiRYK
 gRLj0BL/JGNGm/1AXf0LWSnAWZIqsH+tnJH5MvSp7694xetC01McTfRjo6Ia/IZ1ezULQf1F40n
 Ex20xY9zEz10xUbdZFTO2REBWSvRfiG1Hwpo2cpywhKsnJTrdg9pQ1yMrcQ7yhxOrB9nTVINA8N
 hrUiQ1omF98Ap892TZdCaHouLrQT5QKfSSKFJ/1x+qCtdS8qwyKHagWrvnf/NPI+iycIfJhh428
 7BKvSERwzg9mtarVzp+mEugtgOXfETuG+yLpw59S3YQFvvpQS7OHmrzP84v/92xfTn4Ty+vW6xr
 jDoaIQwh/l+3U/fwyidpOSFp0FF7Wfa8ZR1G3bCzaWoCABjl1Wj4g7e1s8FnmD9JmV7NII793aA
 9xnf3W7YBzBAz1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: DOHcyNwo-ZeVMHN60h8k0blnoWf-qLzK
X-Proofpoint-GUID: DOHcyNwo-ZeVMHN60h8k0blnoWf-qLzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX0HQdTricchaL
 sW4ll85ZqD8QsAVcdMwt/jM/0VpD/e3OsidgsEewrfb7DgqWvx1VgBhE3MyoMpoJJBbOjdVXYXZ
 u9N7hjb/S4oqSrFcClx3nsOcrcWdidPffnDLS+qwUf2cdefo1C/LkfLsra1V6Y3Jw9+mjRJaI7M
 y1+Wkj7vOFUS4UE9/POmEI88FZ7ikreYjfQr0xzQsQiwyKe/TFyKFZcAKBzD6FU/iGJs+KHGuDS
 c1x7692lVJ3tzsBTaGyGTh8I0++7vEEI0zaBBrbslGKl7ryx0otscQjNriLiJeTgvwYLIMuqj8e
 8sGkQDVfXBYqiqdCqqueQaqXg16kQyeJmpHoxUswl8EZz5fySuufaHC5er4UXu8YXFKtK7809Bj
 aX4c6t4fp2mrzLvBhzZmdePCdKOQd3PEpg+BgfSzhZ5xwlve35VB3CkRvmenIWmu3p+beWnP/yC
 sUaRap86rElUBcBKL9Q==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1e8847 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dUT4seM1aVMALyF6Z_IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37784-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2C9A629E0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both gpiod_chip_info_from_uapi() and gpiod_line_info_from_uapi() copy
kernel UAPI name strings with strncpy() into buffers that are one byte
larger than GPIO_MAX_NAME_SIZE. If the source string is exactly
GPIO_MAX_NAME_SIZE bytes long strncpy() will not append a NUL, so the
strings are only guaranteed to be terminated because the structs are
zeroed with memset() beforehand.

Make the termination unconditional and independent of the zeroing by
writing the NUL byte explicitly after each strncpy() call.

Fixes: c040d4e15e5d ("core: fix 1-byte buffer over-read bugs in gpiod_chip_info_from_uapi()")
Fixes: 5533f277aa28 ("core: fix line-info strings termination")
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/chip-info.c | 2 ++
 lib/line-info.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 6b55197f96b78ea66559394e4e788c4263ede5a0..972b2a82a8034c4b66850b246d412a442a836285 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -58,6 +58,7 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 	 * the worst case (would have to be a weird kernel bug) it'll be empty.
 	 */
 	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
+	info->name[GPIO_MAX_NAME_SIZE] = '\0';
 
 	/*
 	 * The kernel sets the label of a GPIO device to "unknown" if it
@@ -68,6 +69,7 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 		strncpy(info->label, "unknown", GPIO_MAX_NAME_SIZE);
 	else
 		strncpy(info->label, uapi_info->label, GPIO_MAX_NAME_SIZE);
+	info->label[GPIO_MAX_NAME_SIZE] = '\0';
 
 	return info;
 }
diff --git a/lib/line-info.c b/lib/line-info.c
index c61b78907c946a1e4f6718ae9e7f0dbf354bb0d7..1613c9242d8749159334b124ce911452ccdc8a7f 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -149,9 +149,11 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 
 	info->offset = uapi_info->offset;
 	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
+	info->name[GPIO_MAX_NAME_SIZE] = '\0';
 
 	info->used = !!(uapi_info->flags & GPIO_V2_LINE_FLAG_USED);
 	strncpy(info->consumer, uapi_info->consumer, GPIO_MAX_NAME_SIZE);
+	info->consumer[GPIO_MAX_NAME_SIZE] = '\0';
 
 	if (uapi_info->flags & GPIO_V2_LINE_FLAG_OUTPUT)
 		info->direction = GPIOD_LINE_DIRECTION_OUTPUT;

-- 
2.47.3


