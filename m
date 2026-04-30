Return-Path: <linux-gpio+bounces-35920-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CiCKb1S82lnzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35920-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:01:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728B4A3182
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E284C305DF82
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F1B40F8D3;
	Thu, 30 Apr 2026 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLdaDsF9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHB43sOq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3140B6E5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553859; cv=none; b=kidJJhG8rvA8ffRE5nFenkBOcRwQcMpgrcytDEvUjutYvjGy/lIhU7YdEhYj5PpLU2I85pFqc4ndpe7KghM/Kq/3F4G+e1IshKFnmVesbMzt0FiTB2b3qbYla/a0dU7kynej+Bn8B3Yn6sniO4KkW6xQULkBqdVajpbgfuqpMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553859; c=relaxed/simple;
	bh=le5OGgEvHvVZGP+20XqyMZWAbVSnN5nMXc6oeFBCxJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXkLUAud6s3Zs5G0eDcB845W/MCXhTi9ckI1mlJDXLgpiBb7imqcnPUT3C5JdFDSouXBcu/nfD5ncD/pzBWj9WnN3vOQTa7nKmy7qImSzxmVXsrx1z9c4jBXXNDD/a8N1IdSIXlmA4eyf4gyPHrH2OgtBCRLwjlR+eBcHpvFFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLdaDsF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHB43sOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBk8JW1820460
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=; b=VLdaDsF94a7DtHmA
	m098gqynMEbhYaHiLcNm6cD2lxaP6+jy470C7+YyVZMH9h2TgCTc68OVTLhPuizi
	pkpasivJ6Ro3wzFavdtlo5pvlvqkJyUgBx9b3zGRUYauhxdmUJgwMUapUY86NP67
	mr4EtSTHVPyg+zsxauTy27+wR80ECz5dk/eRcB2OCl2+sbOR65T2eR+LC+BSfQBA
	amc6Yv5YstoSXyJv9zkMqK7lST8rPY13jj6KBvCsfi1X0E+PP2xVul9bogwjPN9m
	bPzaS17SCKHDwJCPJ8+40eeEj1kiloSS+tzA+fcrmJAqKoMUHi/Ie3QmbA2tOdkW
	9SpuiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6geraem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so8605221cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553856; x=1778158656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=;
        b=MHB43sOquwxWg1lrG6y8a5RCM8tbFoVeiHeFxoTx3g/oyeSq4s/lsYY4YhEETmgj5B
         HEcWs2Gieep40+dFlUXV8phCP0siCrYf8R0URpPxWdKaVIPEwv7fDKRvDSNlkuSMr2cQ
         kJEyncRuGSHElK6hQkuBsMWOtpqA1cTBYyiIFOlONOLBT2JMD67ehzNzTSM1gsBDxbhJ
         g2m1SDc+1NigxbXY2RvOjFTnYoh7LIFgPxfYrVFzle5HviMjGkfgItIoL80bLFd5V31V
         x715itMXXsmo8+xAGa8uN+WZoEpDmxNY2YG6zX6kbQYw2RF1ja6ZETrXopeMXFNVu3/6
         eOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553856; x=1778158656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=;
        b=CTX2DnCzD2Fc5OseK+O4q/U4C4jokbIXkb7IN+BMYTLTT01SPheC17lCbUj2EHiAOd
         BJSAhxyeyUQsAdJ7dOWK70J/7RWOa+oSqxNYIUG10knWtT9oxmy3Gv8YtCUaO3Hy+Sk2
         7vRS5BOexvIYBMCGPeFP+NsxdTH1ZumkuV4dzF3DPNTokR2SiN+JhkqPV5qDgTsV4tDM
         o6EtB7689pnln198yXihprNbwTwchVt1YZlCCwHBFzizhXWvyIA1R3jaxuG1C+f5s/t0
         n2x5ZiiahpZEri+NKvDYDdsPXpMdtA2Wtaa0X4Nukqf8WrnxM7FEEJLUHmGAAKFItW2s
         nvvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9D6zhopM+U3peQk1gjhPmpB+h8JGj+oiSbJAbvPVLwtU489Y+FARTDFgi7hs3JVo14Sg+YwLHkkvd+@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvvtnOcJo7lsSTNrKwBdku5U+XX8nXt3pki3vIT3SKFAGPcru
	US9stYFdRaAOZ0qsYg1nZTFmStm06kaM3M3RW7R8Pd7edghXFxYLd104zzuwtDQNkgJPJoN2+gf
	UYvRyuEiS7N1srOQ/zLC1853w/Iik7xu4Oval/JnzTqrnOUgaSsJ3b/quTBkoOc993JBuGpjd
X-Gm-Gg: AeBDiet/Gm0rYGUR0tQknmv2hQ0XPOgh52zBlmlktsT44M2VFuSdNUk5sbRxOaKcucJ
	FOIsAAvrIwivzVGspV+uDtTwu9/OIntwPvXfIjUBh/fQC3FuE9e9RAF74Y8Oz5CQRAOsHioIDYw
	Uo35fFDZg6TX/zVfIN6qXXW6b9AjiTnpgQIwEV1O3v1O10CELni60WFwx9PPPHOK+lq/svCMMix
	u2nhWO2WgO+S1RM3i2qqt7B8qMBRViDt5/lpmahGYJuxswD5hklRag4nY9BX2shssAxXiq4kato
	lb8MZQy2Ck2MAFRG2oxXwzHVvWd4l29kdLFeis8z6zP/nzFp80fWTvcV1c1r2+Q5WkjTzZ189oH
	IYxCvK/YsoITsHFlnguCtnjCw1cnSLjGGjEPPknQ9II0EH2vupj9YumvWJhh/XQ==
X-Received: by 2002:a05:622a:1116:b0:50f:ad91:890c with SMTP id d75a77b69052e-5102ab5ce84mr39085551cf.22.1777553856070;
        Thu, 30 Apr 2026 05:57:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1116:b0:50f:ad91:890c with SMTP id d75a77b69052e-5102ab5ce84mr39084991cf.22.1777553855520;
        Thu, 30 Apr 2026 05:57:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:18 +0200
Subject: [PATCH v3 1/4] ARM: pxa: statify platform device definitions in
 spitz board file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-1-5142e95f0eca@oss.qualcomm.com>
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
In-Reply-To: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=le5OGgEvHvVZGP+20XqyMZWAbVSnN5nMXc6oeFBCxJE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G3t8nzhFRsjrDI9eGbHFJU9emBtQhe0Q5Cr
 YR8J1JNY4eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRtwAKCRAFnS7L/zaE
 w9rrD/0QfmraIDyLjS5UdTWnqXIPC7cPhdiOzzY0t4KJ4Ti5SIbbTHmiTJZdekxHKxQOE+Fjg/d
 Jnk1J/fb1e3ESI3Oy48DQEEh/nXUzu8qpSnpg1vIfoA0+vASiGA9jyImIkWcQX0NeD4goUnAYng
 /OPmzwCC1mfaPUCJBmoYuuXud9h+JDi7CIU5PfzNp3WB4ORa8KpiJs8d6MjUyVsXDQUKdwvZzQc
 2wNVawe7vAioKc7x1tFb5hXqxuw3psadcFaGiLwPOMNy5J6FmAbpLj2jIWEqegeeGfYVMdAmTcy
 yz5D19dJ74rP2t7AWceTQH+zViGLeZV3ttO2hmLQGBD8wa1D9Ar/VwRCDAV4mrU+TR1Ggdhgguk
 uROCkb3BOcaVVua1rUkTD1Lpj3PKSKS0dIEXsjdNgIhQ7HsN1Iorso3+TLUMnqVFqjT3MLLjtg5
 FYdxngjoet5BRG1wR5KMm4Mx1PBott+oHhW+FwFl8tDxLTc0yRyVLJxP3WY1qIHDiUW7jO48AYs
 ejrkXp4LdwzDCdUYP522X0nhSOIWa9+6A/+6BXcvC/B86TMfByQZIYwGloKjxekOqXyPUhdQH8Q
 9PIjBe1s3MqdJRcSzpDQg/NKk9EC/jZ1WYgQcH3Rpk28Al9CITfxWYejKIjnvYFliXgD/9N9G8v
 uYBoiSMnM8UrkYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f351c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EpCYgoSSk4DMBEGV6jgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: M-t32dr13VUV3bWEAkIy7rrgrcmhZ8sR
X-Proofpoint-ORIG-GUID: M-t32dr13VUV3bWEAkIy7rrgrcmhZ8sR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX27ZBt7DDFA9t
 SczA1EVavTsOQKm/GS2uoXFNGbGEPenGVybUWlf2eGrhy62ar+IVXCbj2X/gShsoiYSjQFmGOHe
 6rKO0NjVZowcCWwixa7amjqfITSSvMfyuB5CoJU4F5em857s5wrho0OoALmvId6vOes9q7EI9Gi
 sBn+CI62zB9b4ES/g31tE6xT9wO8/hVb8Hu5XS64O89uzYHweeRztvWhukolL0UmM3er5lj0hl7
 hL/4L0XGA1vF4vkvnwWg5pH887bM9Bnq566v3lD5PxwNJ2LrTnQ2ATlz8gBIsvTIv2+v2qJz5Qo
 E4al/vGWe0Imvzj9IqB55zfgdwU25Az2AZ/PmbfcbdmZ39pJoEK9QOtF1dDr8Du6izgqzIv5j0j
 vC5F/s3uUpQhe6DG25OM5Ag18EF8LvpOtKVlLo1gATfUicWucTp+ImH1tJwHR0vLq3AFTp+cufH
 fvlvkac0txYbKP0tzdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300130
X-Rspamd-Queue-Id: 6728B4A3182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35920-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[linusw.kernel.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The scoop devices are not used outside of this board file so make them
static.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c0b1f7e6be87411359b0020257ff12c73bbcbae3..3284b9f62be970555042a7292993e45d56fde47e 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -165,7 +165,7 @@ static struct scoop_config spitz_scoop_1_setup = {
 	.gpio_base	= SPITZ_SCP_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_1_device = {
+static struct platform_device spitz_scoop_1_device = {
 	.name		= "sharp-scoop",
 	.id		= 0,
 	.dev		= {
@@ -192,7 +192,7 @@ static struct scoop_config spitz_scoop_2_setup = {
 	.gpio_base	= SPITZ_SCP2_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_2_device = {
+static struct platform_device spitz_scoop_2_device = {
 	.name		= "sharp-scoop",
 	.id		= 1,
 	.dev		= {

-- 
2.47.3


