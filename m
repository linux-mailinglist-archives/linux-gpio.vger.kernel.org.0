Return-Path: <linux-gpio+bounces-37296-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGt/MLYjD2rPGAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37296-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 17:24:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B25A840A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 17:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FB0C330AA88
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08C031AF07;
	Thu, 21 May 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kRFjpJA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fv17U/tO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4FD3A75B1
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373329; cv=none; b=mibh8CVavEyOAl8oo+90LuLc24X2aeHFSiWtY9xzKLOXn6+qN8aWBRiqpCjto68JrQR9ay99ZGASmtXxgEEWCbhcFsNser3OBsCVYvXvlSvk3dNqQuo99pPfx8mwRXVLfsnWH7jVaYA5+qbYzlVNmG1s+HUpo4XyFsJpMYmeAJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373329; c=relaxed/simple;
	bh=1rat9CVwl4Niea8fgGERMdP4TdfM0tYDE6ELOJ13qUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fslL0nY7CsEuX+RxPB23GVCSyZV+dbarSVd+N7R8Cy3uhtvFlehdn/RGVKBCvoa4cmMJF4n4qRWOpE9H06s/mSgMqa37N2Ogm/bw73iPfZExsDeSxaEBWJablVQsCWEiil2Tv5gMTj8+R6UufkliZno0NhZI1UvFJiOpa5Hl/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kRFjpJA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fv17U/tO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uxx3772831
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 14:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tjQZHonofPoPkduzjXR9qz
	XB3BrD17EPQfqK72P+4m8=; b=kRFjpJA5a6oyulsn8g2fmcZsdMJhEKJcP6hjv9
	DzKSSKwnQ7/GCiUyLbMOp5pnATbPKk+iRtkT7Dpee49B9HvheWLGRSNSDora7zzy
	/vnkqN5CGqw+X11pAMotMBe4izG5L/Nd3fRw2qL2JXWCWw1I7hgjpMx9xUkT1m0f
	Buzt45Br+tZOlFcfPp+cRYw4fgx2nDH6CdcO2BlYLTrpW4Revjt90Jx99ztw1R3l
	tvFrM4sXhh0t2ChNCqH6XFI7av/1+HgU0eeYL8Bx4gpP3lQigIvdQIX5L0X73LM/
	wK6IoI0yPCBR3Z+R6QFDlbSDe4Yl+fEeO1Zy2nL/ZzTOuUnw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43mkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 14:22:07 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-47bcb08890aso12048139b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779373327; x=1779978127; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tjQZHonofPoPkduzjXR9qzXB3BrD17EPQfqK72P+4m8=;
        b=Fv17U/tOpLvR58NoUjLGGJmrIiH29fthXKQL0Ufnfq+wuayW+Wxgc9p6VBi5vKNFkg
         mMWSufx4yxPjjhF4LCJre74pnND15K18v4n4+usSI5UybLUk3iexTEg56elfEGYkB/Tt
         2/GEhnzbz53qsEKsBzyIKoksGjd/fn1oeICy/Op+xG8E68jyC4gm7skPQcZHdSstnNJr
         DsbK4v96h0VNGSEzfHhsatMRE4vVR60hkhJ5qDl0F6/kPUrUP9HKhQLeuQAuzgCSJcST
         JkqR1sePw476qWlpYqfAyKsMd1MSYlkj2w2Y7n3/9Mli+9MdFwMvPO1FJ2Keo67TPIm6
         BiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373327; x=1779978127;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjQZHonofPoPkduzjXR9qzXB3BrD17EPQfqK72P+4m8=;
        b=jFjVgZLlCYSKmvv6MhItbi0fdN4XdC6bjsXjjfAmfLH9uxX1OedIKx2dW9crvs6StK
         Ish3JvuWnkoMkFLTmwmyEUx8M+u85eBUQb20plo3ukNZzMDeOTON3F1x7eVAK6WMnIoi
         pAr71uLNeQ1kDFdpAu1QFmN/O33W0gXjqO/7zd9rP5D6td+JsOKuX8WI8+sgTLqwNXy2
         /amo/bn8lbxOtG820Y4RLGNOI9u1zQdmBhpcYQyHbgP2ZrgSqaaJdJyW07+1L0vHzeiP
         XBuKgq12GRL9artdjRQnOmMpDT00+E+gRODc9tAdy6hKTD4fdItCV97mqRcwEdMhxXwe
         zJUA==
X-Gm-Message-State: AOJu0Yzz6sdTLyQAK0fs6ZbGp7XrtWQd98wghrP8q+X/3JEbu9E029yU
	XH+kEE+rGjY56H1P86NLRq6gp/BTXmrXYKdizXh+loY32dWPLmWBw55D/vTom9+YeeYHU91suL7
	u0ZzH3D35b0jXEH6bfyXG5xvmhL3JQnEy1Jr8DfqkLen/KT5E6zkD513LcrhPscbZ+zXhGhm+
X-Gm-Gg: Acq92OHWwrNe/pEwq9gXOW/HGUFt8iBzQNEeePcSQFQ+uRVxP4RNZFEC9PaxOcYWol+
	q4cTU8F7HjJgaLVcvUfsVP67oJZLF8Pw8nBQMJ4UzThcq4cMDmOZMq2emkKbU758e8kIzUAQpGo
	BBh+azVYFprWO+hz35cugGC52nWmlWmEXFBV3NzAhtbOIn+FSBKBCq0fnvKN8OH28/fG+j+Dl+L
	eWi3L8NfUzM3qomMKpSW0T9GqfS16CPqcFVBxxv0HtYKzsGBHIZHcKWRNb6urRILvByTxFbylLd
	Q/BWVTter22Mm6etQrFopOFVI2CKxSxr94LNmvk7V5uMHe1koelnx0/X5SMMod5+8Nlksha5v4V
	wvKoz6m1a6yVrqZNuNCiBL/6LpRKzW8MGV/TqidwcKQRUjVnBmeo=
X-Received: by 2002:a05:6809:1d3:10b0:485:403d:9b92 with SMTP id 5614622812f47-485403da2ebmr483398b6e.22.1779373326626;
        Thu, 21 May 2026 07:22:06 -0700 (PDT)
X-Received: by 2002:a05:6809:1d3:10b0:485:403d:9b92 with SMTP id 5614622812f47-485403da2ebmr483328b6e.22.1779373325408;
        Thu, 21 May 2026 07:22:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d3515asm77835655e9.1.2026.05.21.07.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:22:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 16:21:55 +0200
Subject: [PATCH v2] gpio: shared: undo the vote of the proxy on GPIO free
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-gpio-shared-free-vote-v2-1-7d948edfdbde@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAIVD2oC/4WNQQ6CMBBFr0Jm7RBooVFX3sOwqDCFSYRCBxsN4
 e5WLuDmJ+8n//0NhAKTwDXbIFBkYT8lUKcM2sFOPSF3iUEVyhS1KrCf2aMMNlCHLhBh9CuhM0p
 rbR+Vcw7Sdg7k+H14703igWX14XPcxPLX/jPGEks0bV1djKnPmtTNi+TLyz5bP455Cmj2ff8Cn
 jRbRMEAAAA=
X-Change-ID: 20260520-gpio-shared-free-vote-f62333ab4fff
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Vasut <marex@nabladev.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1rat9CVwl4Niea8fgGERMdP4TdfM0tYDE6ELOJ13qUk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDxUHV5v8hUac6HLEvYQXkTatbtsuwpfb6fJo1
 uspQdUZ3t+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag8VBwAKCRAFnS7L/zaE
 w0yUD/9mgwuMNoqcp3xQCZrP9Fi6lKeKgbt5otASRC027wvX9/q+X++d5sXfE31iFsPSAuJGovw
 akDqVNx/qIfAkMM+wdBj4LfRLN8byup7bE9p7fNn1086l0uxuJ63OavrcWwml3I0hpak5EUbkAL
 Fl3Uy7g1TkUXtIMN06ptREQUggyo5aUujh55xPqA2fY9cVjsAy989LhAoLMlChJohNkbjh9iKez
 D7wHhPaN0xXd4d4Atbs2WherT6kDIKwKH57ToifliQ1QqFlYCC9+8/fn0qgna4IyPfeCtzv5z81
 588rdK2efYGDfHmIi47jQvL0Y7WUPSD3dAx7zBCdmo0tERhcnpv7BDFgTTVAEMCY8mkrvceUEfY
 GOMzhA0g3CgkNJzDkJjV2Otni0zd/2QQeu7BhbVs5wQ61wy9O/aMXNy8Grf0vH8OKKxFIgJ5Mi8
 ApK+tdGUw3JMhUmx7iLqIWchUtb9wcvBsRu+x2sh0vXRp4zn1Sd1tp7e9cMW9rYfKbPeKhHh9r3
 ErGpGTo5YMcwZs4cW3uymzWivccd6K212W1JjyUMemzV0vb9T0oYMzkDBhisDPNQyFjvVl8/Atk
 33Rc7Tfi69elwRmG/gNf2uolAgXrZ+Byfyr0FyhWXKMQ4TpkCOm4FwadIyjLT2U1Dn9o0seZjqM
 JEcFgj6UlUJ5wRw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f150f cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=C00im2qEfLC3rBLg9RsA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: L4LDnGSI-M4rbGjXPdi6c8V7yOT-4qjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0NCBTYWx0ZWRfX8EcBFwgjJdOa
 MZMhShJDE04Zq6qMl7YiFtGslOvbEDrHN39j1D0GIdwtoCLRFPtUKqhMJRhAME1c5LBiYcGZKlj
 NDkZVPX67lcS62PBMkKhq1ZD1TLv8N5shqei6tkU7Kyu5nj6vd+iU/UttTYpHaJ1dNOKR+c8mgj
 JgOvtNCPIU7xyACRrabAGkXZin61m2YnAkRL5dtbdoFlozHBwtWY4MCJARZQFKAj9FZX3JlYElw
 ta4640XtoHwJdRVCv13DfFQwmdSz/mf5xjv74iaTsGEX/HU69Wg+easo0E6TLgRVaUMlPEG3KSI
 5MmUrDohJSKkvlGngEAYQWooaC1oh6qkwbi+wDQAI+w/azqmqbfVpCz3Lyh2ZZa9RNgQ1RBBdZ2
 OdPvJtAgImN20A50F8B8mXzAIJ1MeIuKIfHbOIoP0mmb1uTrAHNmUB61UYrzcmdyNtDEZuXuNUo
 DVr0u/zdK33A9RloI1Q==
X-Proofpoint-ORIG-GUID: L4LDnGSI-M4rbGjXPdi6c8V7yOT-4qjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,sashiko.dev:url,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37296-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 346B25A840A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the user of a shared GPIO managed by gpio-shared-proxy calls
gpiod_put() to release it, we never undo the potential "vote" for
driving the shared line "high". In the free() callback, check if this
proxy voted for "high" and - if so - decrease the number of votes and
potentially revert the value to low if this is the last user.

Cc: stable@vger.kernel.org
Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Closes: https://sashiko.dev/#/patchset/20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d%40oss.qualcomm.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Sashiko commented on this pre-existing issue under my patch changing the
voting heuristic.
---
Changes in v2:
- When releasing the shared GPIO, restore the value to the "default" low
  using the existing interface to keep track of the votes correctly
- Link to v1: https://patch.msgid.link/20260520-gpio-shared-free-vote-v1-1-6c54966583e2@oss.qualcomm.com
---
 drivers/gpio/gpio-shared-proxy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 29d7d2e4dfc02c34fb3f2abc343ee30b61579b66..c43a117de016af03282961ec843ffa8cea00ec5a 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -103,9 +103,17 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	int ret;
 
 	guard(gpio_shared_desc_lock)(shared_desc);
 
+	if (proxy->voted_high) {
+		ret = gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep, 0);
+		if (ret)
+			dev_err(proxy->dev,
+				"Failed to unset the shared GPIO value on release: %d\n", ret);
+	}
+
 	proxy->shared_desc->usecnt--;
 
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",

---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260520-gpio-shared-free-vote-f62333ab4fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


