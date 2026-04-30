Return-Path: <linux-gpio+bounces-35834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE5KDyUG82nawgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:35:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D01F649EAD7
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DAC4302C5D0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B863DD529;
	Thu, 30 Apr 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3yCv+eO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+pJ/Zj0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367C3D524B
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534469; cv=none; b=VI+CcVVKGtwSAmM1bnm5mkq76pisJz0qNi1T5anYfGvk6OrrQkIqHMXOMb39caSqAirlkpY3SC9NFuVioCNxUjTDvWgINAIkmap4EoJ49CteO4oTxb1RPSogwyUt6RkBg30wAPo7Y3yKI6o1Y6DZm5f+WkqYIetOLXazKbtcbnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534469; c=relaxed/simple;
	bh=0isVpghelXoSKwPd5BDTOfUOhe8G+mSFyfnWyqokP+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kz6bjmE7K7IH2f+Ddht/nthLNi1Hwpd8Y9LoDrn1wxoTYpZSioflWodBvsllDDwUVQ0vjUei+bomMaMmOLJ8JukbhLnAJtj+MmPuFitvgKYUjoU+zvexlC3IOsgBK2ePCW/wa42hDjkdcBaAWCRd3p+t3sFoQ7TuMF/D0GAL8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3yCv+eO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+pJ/Zj0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U75A1c830980
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=; b=Q3yCv+eOgXQ6X9GR
	HugoST/ZYazdpYD04NUoQfKTPUUUkr+bviWG894/1rte7U6CCzEsLSKw3u0fixOZ
	Mqc+GfJzjuqLjeTcsSH9K3CkkdBO1et1je2keJEH9RHpJkLVXmbI7jZdL4TwPhTe
	eU+LLvI5V5kukD+yX1NVQewxDj+BQns2jvR8XckgbGXpzoZcAZXzQw3PIB26lbDw
	Nig/WDbQbohnZLBi/wsPrf2HuH9i2SHYgKh2kg1ydmu+Pv+3Eu9Sp1uM+VS9cCzi
	b5+z1kE6DDrHbpE6FbHWe5y5ONfXO17QZX4UBdhTM7/SBOvifI7mkDEJBA62xd40
	0dOcXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq03cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:34:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso1556521cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534456; x=1778139256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=;
        b=b+pJ/Zj07iy1ppcZcOAlk40Hl2RqGKfsUIMIi2VQXFMe3TwN7ZFAfBogWIhx2Ez6hn
         qRv2htKbt4qrna9oBRTBMJFVLS2ZkoVLks6fkw5S+kEp0WDpLRPyuHZ2epr/AJ6yXyMx
         140HneYsX8A+ybIUB33et2wENa4JCP94EndslGFqDOQpqY6w217JZqAKbjYkTk3K6PrR
         XyBzf+gS0B9My82Fuf8ko7qrA6iBXjejKkRyj47JHp8qNV04WcuGhKJTp2GxCWyPus7R
         hmb+KLLCeKaMJ46sSUImzfAE196m0cTvZsGaRfWZ5RSk0P8JSHGX6CYUSY1po92pv5DN
         e/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534456; x=1778139256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=;
        b=o1pnyGTIsjqSi3u3pKSujDj88FfpybES2jbnYgKpLQwPNYRQmi17+N8KNXJFB5gEV0
         FHec1mxX5T1Pz55OdhI8KZrTr4t3/gfdDHMrIa7yP1MZwUQNSvaMa+LjNyc71A3KulNP
         jZwUZJaOFqMkGbkCD5vDs7sdwUDi99Aw20EAdG0UsUVloHvGlT5esJVyV0YCa0wc2IKD
         DgBMgoaILE3xXsb0yYO89LT8zt0qBdM5pYFg3J/X5IxZfvZpaZXq4PhnrUGFwCnj/VUc
         ZS7qvgqVErGNeO9VCCcHMtqB4aVvLCslcmOkl8r3oBivFv0cY5yFMRL4fKQ0g+vbfUug
         Tm5A==
X-Forwarded-Encrypted: i=1; AFNElJ8RemFU+pQORXyiL7RgGf5Eq/X5vFG0stHiPsf4dw7x1uTvJfNivHaSPg6W8Z3z4p4zO4f6u3DhD3Dc@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHNcixK3kcgebVpAEjqWbRcwjR7pHYb4JXtSkznHp9bxipJ3H
	NdInAHZVBy6i6EvXbVmprCO4q7frolLBftRFFyhBXhkDKvLWXu9Tm1g5SuhJtOTGPELmPhVtx0f
	ZAgnnPRZq6PoLftzORXgk310Te2mCzSd47tQfK2WTgn7bcNX2sWmTl7EditeN2mUT
X-Gm-Gg: AeBDievHMHuv56PEFS78hYE2a+Qo8HjFIlQg7mgEJwsbowj+gLZNXOdsCceUI1MAT7+
	0rqHAM2PNUUb1+dqWlOyf5N/KoNZuJnIIjinyF+E0YjUGbmPaNXOFy89MptXTx0e/6kjYcvYfoE
	mzRzxb1a7CiYJIP3JGl7fyqyKL77qzqBit+30IIuHVd7O3MysOJjvCD46Yzp1k/6dOz795ssLpb
	ehYnEtSwrtQiLKCs/s+yDXmHb0iGVgegmvq0VQScX8Edi5d+EYUUOfL/4E6YMC7UoyMTi/BXrG0
	wOv3GiBHFEMMFNkAint81XBQKrVp0rx4HhFGwKLtLxzaF27bbU+XniTZ5Fa1UUSGA+QkUqoxOoC
	niJO3qzYtIkNqjsnXNLjlVPuBB6KVThV2psR/uz+1fi+NI8Wlpqg4KFjg+YEV
X-Received: by 2002:ac8:7d87:0:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-5102aaebd3fmr22953951cf.1.1777534455734;
        Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
X-Received: by 2002:ac8:7d87:0:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-5102aaebd3fmr22953561cf.1.1777534455111;
        Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm76132625e9.2.2026.04.30.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:34:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:34:05 +0200
Subject: [PATCH v4 1/2] ACPI: provide acpi_bus_find_device_by_name()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0isVpghelXoSKwPd5BDTOfUOhe8G+mSFyfnWyqokP+g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wXxZC+mASP2ppNNMW84j+0XxHWW5nI+GRHzG
 tayHaJ0nXqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMF8QAKCRAFnS7L/zaE
 w8dgEACegJw/nKBn+I0OhND1U3+dBoBHnWiTymvDzlqlzPb8Kqo6c/IazxlfmWakeZi6zVfDURg
 j/0slWcp1WjemC8d5k/wLUlm9a485s+uTHg/bCwtmYkyjbwem1uUtqttqq/q/0YH0A95OXrU9I/
 FLMBxbaUleTzwkszDnqDBvwIMHNn10SwZ4X/qk6iR84oXEo2moYEFECFlkljqfwQNu0H9/o5dVK
 XuGoydEaaKrCF4mjQl+MpBY3OwK4cUsqZA/WoqJB5oR/6bqBPX68UiDBLgFxBvbKi/Rt0w3m3wU
 HbK2hc3Ll5MGRnrQmdbgo2t3jfEju1a41cHic6lAXdVD2zNThthh+Swleir8MLduY7XqETGRdc/
 0XbWPfROHaZU+no7NRmhZmZk5ZhvnNj+HKKMsNJH9r0sVybVTLgRhVXfi+FDQAlpbGRNIpDHR2r
 aYayi6IzNR+QmpuP9hVwpH8dwKzesqggOIChdJlWufiEGUgGv3N4Fim1RfzgqXnsMFlCF1mA2k+
 a4pe7kb9CuPYtwlwVtpsXpyUNmMxBVISt+v42bTwJ/ixvHQa5bh37O04OzvUGoADJBfEPs+clCt
 pwT3ZDhtN4EDdXp+q5JO0rAfMFARf73MtQbXpt9P+VeSAuZXYhNb1n161BgMBv/ay8KDXP78imI
 RUvXZ6T5ahpsVHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GV83fLwlrWQhLN-UKCWP7M9c4FZUqCwU
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f305f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=B8ktV2ObmFyAxeXX9HEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX5Itk3zEyCS3f
 VhOW7NiMhkFh9RwKbisQGzYueDvfUt/OIv7ozII2XgnG1V+TssjzyrtEBCRMfF8cp3ITZLLlSZb
 aWwxELCc6yFOHw8PlVXVYOu0qcXkKYAm7nj+LCVNV7tzgOD+o5WuixFGsqAbkFijts7Uo16Kx4z
 CLfseO7eYeR2CPmO14FSGJYKiTbCL0wSOHq3OmemY7Acd8x68KqgCSI+7US6RTbXnPSxFoCJny8
 uthLto7Q0ul1dEibvhb5416Pz918tUXpA2KNFm8Qf364aCSZ5AZvV1ULItDpehio19+R2lrLI+c
 zBN8OJK+28MoquuFcIwohPwwXSKXAkKvtMv+wOzTxqbWveg2tjyR8DhVo4sgidD8AIluQmKNmwY
 ut+qOzQi2J/SZAMasBv5gmp9s6T4u/dWvB16aUo0IPlluhs28jTVqjKr5cQXpGj5zUPmn1XuXxS
 sC4jFKwfJz/lhITPRsw==
X-Proofpoint-ORIG-GUID: GV83fLwlrWQhLN-UKCWP7M9c4FZUqCwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072
X-Rspamd-Queue-Id: D01F649EAD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35834-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Provide a helper allowing to locate an ACPI device by its name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/bus.c   | 13 +++++++++++++
 include/linux/acpi.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..5dd8459be03db4165bcb59943b94ea7db273ad7b 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1181,6 +1181,19 @@ int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 }
 EXPORT_SYMBOL_GPL(acpi_bus_for_each_dev);
 
+/**
+ * acpi_bus_find_device_by_name() - Locate an ACPI device by its name
+ * @name: Name of the device to match
+ *
+ * Returns:
+ * New reference to the matched device or NULL if the device can't be found.
+ */
+struct device *acpi_bus_find_device_by_name(const char *name)
+{
+	return bus_find_device_by_name(&acpi_bus_type, NULL, name);
+}
+EXPORT_SYMBOL_GPL(acpi_bus_find_device_by_name);
+
 struct acpi_dev_walk_context {
 	int (*fn)(struct acpi_device *, void *);
 	void *data;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 67effb91fa98373d7bf19be5ae3d8baa9328d6e1..10d6c6c11bdffcad14100601e104520366dfc30b 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -798,6 +798,8 @@ int acpi_get_local_u64_address(acpi_handle handle, u64 *addr);
 int acpi_get_local_address(acpi_handle handle, u32 *addr);
 const char *acpi_get_subsystem_id(acpi_handle handle);
 
+struct device *acpi_bus_find_device_by_name(const char *name);
+
 #ifdef CONFIG_ACPI_MRRM
 int acpi_mrrm_max_mem_region(void);
 #endif
@@ -1106,6 +1108,11 @@ static inline const char *acpi_get_subsystem_id(acpi_handle handle)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct device *acpi_bus_find_device_by_name(const char *name)
+{
+	return NULL;
+}
+
 static inline int acpi_register_wakeup_handler(int wake_irq,
 	bool (*wakeup)(void *context), void *context)
 {

-- 
2.47.3


