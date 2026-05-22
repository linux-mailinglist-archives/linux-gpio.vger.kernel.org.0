Return-Path: <linux-gpio+bounces-37329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PHtDs0fEGqjTwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:20:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FB5B1090
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10989308543F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D5C39185C;
	Fri, 22 May 2026 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ln4/cUDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2gZfoEH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E33AE70A
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441179; cv=none; b=J70nsAX2XTComcmhXfg26IBTXc7iFtPXbuWIfDS3Aj1MHaMLFeHosDS0Nqj66DRpXmJdSEL84IFEvZxXNTkhwhgeOHzlRjCdysAtzj9JUziT1NSepYi6IRRrWsz1Bkyl/FM3SbU3lJmSyEOXpCAXo3YN5jegPiMsJj/KmGQYDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441179; c=relaxed/simple;
	bh=ri6+7Mshndp9CACThu5Gvsc42fp7xD2GlBt6c+BQ99E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtyMTlpgyEQ1zU1+JEO0hMk54RCt4YijB1wwt7l0F8Qzr0bbpNlRFbSp4JiZFI/Qy0LvXTJmg7yZFzakKKbynXXjV9JZH+w97JsbzWvZNiHyGz05W3Dcis+WydapZoeUQfCgZTsETd7VGHzTM4mmCKjXwphSmAjRlS7dYOgddJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln4/cUDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2gZfoEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Aoka1816074
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HajT9N9mhu8ogn6wOXsYUoUBDXAOvtcNKi4FVtUWAAI=; b=Ln4/cUDJcDDKJPnK
	5FTJORWlZAol6r+dc+w9vLf8Vn4mBisR9/7USVNPmlJIprG2Al5kY+KR0Z1Pd16J
	OHNNvGhNU6HBqgb0z2D5c7OGTnCYojS01W3QD80yvHVMpHeH+Ay5Zrdf5uRYwBYf
	LUTqwiAO5UlccGg9afFt5RJ97lT64Gaa/j2ThZ+iFLWuYEDSt7pkEEeaKrOpYaSN
	eqV4/Q/kqM6VzUsAG2yk2SpLf0T+lcwOV3c8jAcEVTYIAATggmOTFTqSqCG/jxxb
	3DK6dwovhPmKG4EuEf20jufk3PDbPWXco8MBZJUlp9ji91DK3k1MDEyC/wpGiwBU
	8ZuHZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm18cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516dd6e4ed4so1254951cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441175; x=1780045975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HajT9N9mhu8ogn6wOXsYUoUBDXAOvtcNKi4FVtUWAAI=;
        b=F2gZfoEHLcwHrA64TWOGi/FrBAuILSJtZha6Rm5D0qcUjezIXyH/60dLn5CnrmjD71
         epY/+VJ5KEfLISbLcN68bzfWcxtVhCcq+W3pI8iyuAWMuqKY4uMDYAMZHy/fxarpQB+g
         u2/u58HTs+QmtGsws+SRScAH15yQGHtuR5sH2pAst5RlcbuTqxssQeykYOiHN1aQLyCu
         Z6jrPZR44iNDAuBvxBfxsUvpx3FhwObGuteTz3qnr4z8BA9eB/joZPFjx976aTsxMFu1
         Dg+r2to86KK+/8jtTswwuUFfwhqkq1uMRVM/9ehmEptniGC9B1gNrpbN855ddSGq8YqJ
         4vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441175; x=1780045975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HajT9N9mhu8ogn6wOXsYUoUBDXAOvtcNKi4FVtUWAAI=;
        b=bx7tJISBdLKQHu5Cu0DWZ4Oq8AJQZ1SPrgNbivrG49QRk2pGSklDVsaxoX4QsDLjgk
         DsNkPLdzJcieQu7pxDBDlONmten/Jz/iI0c/q3FiAER5en4H5xsvSF+5JrNiI1nPb4Tz
         dFFjCi+Yw3wq+5n197eS0NaQcdkmxE92lymfF3hC3y/+bpe3drBgrjz5+945W8GsmqhP
         aKWw+V3YqoXhmlzgFzdIRcCP5DU0TtpMOTaI/vfsLAZGlRGnzYLpOBGObUKogwjnwezs
         P51GW2fPmXMSw64rBiaMBWNRX8SFz8KM2yXQ9cer8nPt38qcvAZ6IA3lJzhFme33adE1
         PjbQ==
X-Gm-Message-State: AOJu0YyRIWl2xC+bgh3jCKt5XArItnR6SzqS002+xAotA/JCIClr4laE
	17dmpEJcMMapnncIL7Ylz1AuqqjFVz2iOcy7k2RD46tRbBR/Vwo1HjZF7pSI5g/tHQZICLyOrR/
	UenjlwxLiVLlDSuDnGZKdP7oWeoWKfBkGAYHA9i5Y9IuFZ2wpsKrQ4+uaJDH5z2BPpNMW7AvZ
X-Gm-Gg: Acq92OH4GNVA6Cz038x/GC7juR84TC45dGClCjsCNLuE4/pPMGrIaWHNxjVNceUVFdF
	NzMSGZMgylRN6yzXW93285QyzxgMqSYwDhiNv5DiQXAoSiRXoNt2mdEcTxeE0e99rgIdKmap38v
	fDbopthS9sxc34cFiLdgqLMXTvFm1Ji8/qsmZ6/F42Zdwx6g9ysTl+39b0imgPnJS5VZoajM5gs
	Zihgi5Js3nCcWKATvSNEZyopF47aY/3lF3VkSZO0UJuQ/nsjaX9FMXUFVTZsXCsgSjZnsK+wc8Y
	9Hc2X8hNPKAjKszlrvJCBK9b1xacnbh/FGZcJ2NcC7AoQuSyePpPsP7qUHSx8Yt9cfOQ0Lp0axz
	BUEIY733hRCfCdtnO2gwSL33tNpuZ7nq1SJCIy7raaBPDy4sQBgUkO/KHeI2s
X-Received: by 2002:ac8:5fd4:0:b0:50d:b164:5e40 with SMTP id d75a77b69052e-516d43cc4c8mr37574341cf.37.1779441175320;
        Fri, 22 May 2026 02:12:55 -0700 (PDT)
X-Received: by 2002:ac8:5fd4:0:b0:50d:b164:5e40 with SMTP id d75a77b69052e-516d43cc4c8mr37574121cf.37.1779441174890;
        Fri, 22 May 2026 02:12:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d4cefsm11953415e9.14.2026.05.22.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:12:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:12:37 +0200
Subject: [PATCH 2/2] gpio: shared: fix lockdep false positive by removing
 unneeded lock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-gpio-shared-deadlock-v1-2-76bca088f8c0@oss.qualcomm.com>
References: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
In-Reply-To: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ri6+7Mshndp9CACThu5Gvsc42fp7xD2GlBt6c+BQ99E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEB4MQ6AmKBk6QFHXbXtDeQb5jc8HuNdTWUKy0
 iW1+s72tHGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahAeDAAKCRAFnS7L/zaE
 ww/mEAC6K8uyY1ppER78tPcR+azjIeIs/QCFIRNegYsQFOGExdC066I9g/3VoGRpe9z5wgSz8R5
 Qi0Dj92NE2MTQyRquyFBVlx+q1A5GaMiEnbX7bxU/4+0n0FOGWFwvsoH3I4JH4B5ybePQAH/kbS
 lINxRcHqvnBDSx4UE1VyJlUYmhIk8HkrycOvi4jbOXKgLsp5NaMeiNDaoT3tTp86IXUFJylqk/N
 14dqX0JME9l+Ia/ORmM8AEzyDlVCqkCHLtmwvuL4lMfS3bvVJQ4+SQEqzPifjzfZCYS2z73395Y
 wVB7QojY9wtQsaJ/EZcs+bYikR7u09Ev0Bk2XwaWZfSPUpwmjWPA1hVQEyKGiKnfEtJ8g8B2NeF
 t89yMRwdPRnpT2Gu3T8MhfIrDrCQ1kapfYozQTIiDMJPWXg7u8v44VYkUYVLN/nNzIkGvLPl3+R
 34LVlyrSdm0rK0aSRdt09/2C3TyaKcBqLgDfFxAJVuNvi9Lxq8xqNSFg1KhBTJJxXNM2tZy+WDi
 EbODq1osOk1nF4ne9gjVLMlRJ+nSVTHeFaIorzyYpcdKsUjxtEHZgGz03/NoDsuYkLgI+Q68u8p
 of++X6VKvRx0eXnbU4cAfAXGcpcxyTPPXfm493WKU+5S7+klnJd9vYlq1xnrKxHeKwbLfhj8XX1
 KLKS+QRbChK7h4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gTszX0UsiS3jUZog1SpTZ3ArRHo9ATmx
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a101e17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lLOHQsxOTyeWscW5USwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MSBTYWx0ZWRfX0+e4nabz1E84
 m6RaajCiiroMvYnCpwQWymX8qj1ISYihQGkqEZToxWBqmumb4/AyYcoleCEZ7CAli7ZHO1R51ue
 sW9OZcSU3fG7lFw4Or91Mq1R/4FkaEeJZpl9t+KuMTMauR/QiT2b7bt4cRiQeD8Op/R+vLsT7OY
 udg2hOPGoXNcnMEQU/2uXR9+JMtxU/mD+/3F4+eWKrqhKx0HCtFUMT+V+nrAv5n11eOqPiRWesP
 +dGnEnPaVI8+RfikiRH48McHPdU/vTMHKu4EEua8DnXMjz2bup/Ncxoiw6svrOHCBtu4aQjgIYU
 y/ClzkQUqtI/9CLRFOl32wyMWFRJY5sPoRSsm1jVaxKuGb4Lgz2jJrkcr1lDp0jJ3x3iYoKJ9OQ
 4vrhIvmX9QiYIcDPTgo0C5m44570BcBwAoUtkH/Fy1BJ/sWJL1R9Ie6w0aHovhiq/MpW5IIfKsS
 Mc65Qgsq4pBAHD0hf3w==
X-Proofpoint-GUID: gTszX0UsiS3jUZog1SpTZ3ArRHo9ATmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37329-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 886FB5B1090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

By the time gpio_device_teardown_shared() is called, the parent device
is gone from the global list of GPIO devices and all outstanding SRCU
read-side critical sections have completed. That means that no
concurrent gpio_find_and_request() can call
gpio_shared_add_proxy_lookup() for this device at this time. There's
also no risk of the parent device being re-bound to the driver before
the unbinding completes (including the child devices).

Lockdep produces a false-positive report about a possible circular
dependency as it doesn't know the ordering guarantee. Not taking the
ref->lock in gpio_device_teardown_shared() silences it and is safe to do.

Cc: stable@vger.kernel.org
Fixes: ea513dd3c066 ("gpio: shared: make locking more fine-grained")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 087b64c06c9f42b698abe5741e63102538beb488..de72776fb154f1f2ec97a3e186dc96366f3cee8b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -605,8 +605,6 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			gpiod_free_commit(&gdev->descs[entry->offset]);
 
 		list_for_each_entry(ref, &entry->refs, list) {
-			guard(mutex)(&ref->lock);
-
 			if (ref->lookup) {
 				gpiod_remove_lookup_table(ref->lookup);
 				kfree(ref->lookup->table[0].key);

-- 
2.47.3


