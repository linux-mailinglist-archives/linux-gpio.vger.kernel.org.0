Return-Path: <linux-gpio+bounces-34119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEfTCGO6w2nUtgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:35:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7514832313D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7C430B13F6
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C8F3B2FC2;
	Wed, 25 Mar 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fEebZA1X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EH9n4caw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7233B2FCB
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433927; cv=none; b=QO4mKKs4zaD6wD18nivYpctZm2K3MC7iKNqAcLdMmwLX3t9GSaskmkUvMEWGKuzu/pbrhS6dwmz4buMbfFHvI3q03giLuYHjWLgeGuICsNcnx7zPaJpUyZMbufcIes9jIoLQ91X8VocmNRj9CfY0RMrLIp3KOpcNcd5HLLEocMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433927; c=relaxed/simple;
	bh=upm5nVM6kPq3mYUHZTeXnTQlCYL0wpRlbP5OgA/r7WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B4rlKvjIQbR/PaBXCIAJJAVyKHZ8lMQL+oBU9Nt+DEKNiGCSEGIhHXUWnjsi54tX9d4lFqokLC79l0rPJIMXDhg17vMtb++k4uEPwfGmktW6xH2SQ0FiEx7yRROVNhuK+C+XcAsKSJ+A6qwXShGJMg9iQDyHbCXa6NsMrPQTy4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fEebZA1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EH9n4caw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA2src560040
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 10:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=To08I+ejB3z/JqhwSWUj+t
	IPIu5mncu7meWph1sJRzU=; b=fEebZA1X8Ue9dpbbQIciny7e+Ml7nRjUHIsokt
	CrUwr9z0FfF4VZjqNgcBFROo4xGpD13sRlXBT9DDAS6CihTJ0wyQLNM7IulkQ81D
	WysAHVqcaYIELRBpfXZ7rMwJb37sj4G5JvNSF+IlJs/+dvP/iPia+MSnx5F9KKh4
	9FXDywGetVjSPEs3zHaAhIHYlSAlRV3//fwf2RhyIbRHyT35MlIugUr1afc5e3Rv
	UPdYzI32DtpA9Rfu26geuHMOqGycqiKoW1VHnD4oDgvP1JxbulsnDLgdG0YWRlDQ
	/c7AKLJ/10FT1Tz0NgRYEvBfXL5mMDYB5qT3Fmqj1NiwzZFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2r26b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 10:18:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so326080361cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774433923; x=1775038723; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=To08I+ejB3z/JqhwSWUj+tIPIu5mncu7meWph1sJRzU=;
        b=EH9n4cawTTd6SUWsTEviVmoQKiXtHoD/6iIhNYePdlUTAShumdDEe4lp0PsCqtHTs8
         6RU3QBs6Ghkqe25RNHKWCqEsxq0Dw4hwLAJp4AorJb7+mej+mE85qssOj9LCOz0CvE+Y
         afj0BeTAue62MLYMD9UZz52Csj/Tb5VQmO5SEhwxOHAstVTIOb+U4rZ0TQKIz0PrUtEI
         Kchm4VS3mf2dR08ePLOGYLmTAqP3Y1BU0wGvhJAAzgNdwq5gXwcminggrnG3dR04gXiT
         3IuHL5IKqhNCMK2MSKiRi/jeMSklVv89bDe3SVEbRc50IYCmqzVReKaKzi16+tnT2nRB
         ianw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433923; x=1775038723;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=To08I+ejB3z/JqhwSWUj+tIPIu5mncu7meWph1sJRzU=;
        b=QKkjCEJ2YoUuv4jRE+dZYuVojHC7ED4Gf1SgGhsH5WKw2WBAKpbreBmKuhl4C3LvR/
         iuPdGZzKUZJuevzQtrcW6ba8fyBgpZOSvXeYixFeD1emDmjrzdqr/YySa6ZQddadSnyB
         rCKOPwkDZl17ndxniEbn7kVrLt2+bqBhWsbM0aBGtDWnyEvKdV90ib8VSSolqLOA5qEh
         oj6IzusGB6bgfhcc0qQRTKIUR+j5cw/gjWyj/DLT7BwgIeDu49JOsvOWZZ1ZtDoo0EbE
         VcyRaB3nTxSeWhdx3ksuSeocpzgJKvnTqXL09dKFmlfKL8/lt/X0VMKemhnYb7G0RAbX
         va2w==
X-Gm-Message-State: AOJu0Yz62XFxiyKzHpk7IDgO49oxVRxTjHHfCo1C1BtLg4DMQvSnd796
	6O9bMxWjjf2oJRfmpdF3kXAKgkkXI+a5YgM/ldxHepVAthV8MSF+IRtWHZfnZoRU3I+jKMpDcP7
	yEDFbn66fBxWRJcSN/ruZx+6lWkQRLj1u+M6LgVd+6kx3rjyIafgF57sw7IiLCwqV
X-Gm-Gg: ATEYQzx5UyDamOHtylNvgNlM14eeVzjGN8MOFlUaAafCihb4OfqF3uhr4Ni63biqpaG
	JVocLTolZGvdO4PP2/5epalfcQzfgwLxpt5nbMXe49SQpcLRoN1u9ezEF5qjr6OtIPCAEvKbtU9
	m25sGzOx5fUde89Ag5DPxtclHRoHK1bFvED2a7dhy0HCuKwDrt1UsCquu1zzGY28j8+0r/O/zVy
	ITJEiGDIMJOVKICe67sitQ8sSaVAGMR750KI/fmyYz1LxV0iAfj1cq/z9i2G1Ax+SclEk4nE6Di
	U9CZG+cA3FCQSfybobVpvwW52Vzagm9C7DKuzgkRjbGwabpq4C8tMcULMJA7zZm0s320Y8XnM9G
	Zfn0erb/Mju5+F74xHJvYZdGrRoyGbtQvm63atR+vB/iy2P16NB9g
X-Received: by 2002:ac8:5ac6:0:b0:50b:3ff3:f494 with SMTP id d75a77b69052e-50b80e0be23mr39718401cf.36.1774433922996;
        Wed, 25 Mar 2026 03:18:42 -0700 (PDT)
X-Received: by 2002:ac8:5ac6:0:b0:50b:3ff3:f494 with SMTP id d75a77b69052e-50b80e0be23mr39718131cf.36.1774433922554;
        Wed, 25 Mar 2026 03:18:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7116:95af:5a1a:58c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48716547649sm34627175e9.0.2026.03.25.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:18:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:18:32 +0100
Subject: [PATCH] gpiolib: fix hogs with multiple lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHe2w2kC/x3MTQqAIBBA4avErBtIo5KuEi36mWygVLQiEO+et
 PwW70UI5JkC9EUETw8HtiZDlAUs+2Q0Ia/ZICvZVrVsUDu2uFsd8LyPi91BKDqh1lotYmtmyKH
 ztPH7T4cxpQ8wqy8NZAAAAA==
X-Change-ID: 20260325-gpio-hogs-multiple-1718d38c1f5b
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4434;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=upm5nVM6kPq3mYUHZTeXnTQlCYL0wpRlbP5OgA/r7WE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpw7Z8/KkiXTi/PKquMou0xQbysDdIelEZungnJ
 0kdJkyXteyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacO2fAAKCRAFnS7L/zaE
 w48nD/4jZlDtvWs0GcRAhNZUvFk6TVJ2SoOjx7lbTs5wlm/mRxSSNLJjR1EFDAHXSe1FUw5F1h+
 EhpbQ75f8Wx70FQCip7b6TRnRmcgf4zNIor1UcPRddUgkEZxjUr3ZS1xeG00qOsfDddx+7aw86B
 O/kDOoCYZkC61zngRID0QKWhEUywp2Lvzbk1M9A2GKukAm6rlugRGt0TPD7j0JoDQRGrK2XDiID
 RkQCADuImCbVGf4MekUarAZt0xsB9LtVPJREysSa3V01DSaAe3QI/CTLPlIpaoyYba68QWlv2yn
 IXhXNmQoFrWQm16yWzdYegzHAeji30cXGyI6jVbedgIUr2LsWSiOcxjGZaIbQ3uqH8xHhFjl1NF
 kaIvDYLSuvr5XFtJeFrxui42Lp7H01c/rTp5qKVWwq0l7ljempWRr51OO14uMci4SqpqEKHnp9A
 EjYdVoxhrHUp6qgtI72Ijfih422cgZwY27AH70Ig9CY+IhF2ZFxEyKLarDxQ61U9Na6HC3K1TC5
 gbGGLXPrZoEt9Hwa5uBIH5Kp3Zg9kByun7/oOf61RClTHXB2K/878CZZ/iroiL/OyW7ENP7nccv
 ajj1K7RX0hAXiNecPtpRxk1kA9QnmXjbTUob5oDUARDNUhDmWVPgzp7FhKSXLja01Jf+qldqF6S
 ODATue8NOTQ6MCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MiBTYWx0ZWRfXzks8ik0eZTxD
 +9TJGjsfMJOzHiKuuQWJuXkKeaCCP9Z2hOz2j2OU3jEmbYt2jEB6p9fWlzW3RJ13taCdzIhewgm
 A7a9DnR6DHZ3/Kd9RFAgrut7hP7HS+AZ6Otcd9s9tgr0ewsZ58cA8f0xhET9QWnywRnb8ULJ6R0
 HXfyb3O/XGH+G4HoLXmYsLWV+bE67TVu8tQr/9w6bcOr9l9xyEgexDg+73G5F7q6P4IjiX4I9j3
 rlLDeUn1NbN2fsuiYyO1WXDz513hRPSg4ttbKlFnAdv3JP7mHKN6rJn+ZLJ+w8hwAjZjeyDq0/9
 gOzbqMarOzvw5eY4GrCaVUxzQNbs5kz2AL8QmVaNi9nj54bzoHYetwtpG01GaXzhPjtyF3Ems4Q
 tw6vUnBBhq7p79HN8qo4fZc0SJFuzqAkxnT11y86VfK5ZlYagvtpYCqEdE0TDFz8FBbOFmPIN5k
 kCca+vxwRWuxU4rpP1Q==
X-Proofpoint-GUID: jYnshyy5SV-RvEpm-q1In7jOiCvdxcRI
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3b684 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=K1GLRSYOeZ-nItpvw9AA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: jYnshyy5SV-RvEpm-q1In7jOiCvdxcRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34119-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7514832313D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
supporting devicetree hog definitions with multiple lines like so:

	hog {
		gpio-hog;
		gpios = <3 0>, <4 GPIO_ACTIVE_LOW>;
		output-high;
		line-name = "foo";
	};

Restore this functionality to fix reported regressions.

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 84 +++++++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7ee45ccdf1265e94b68fe8fa0d10dbc6adccd93a..fd2821463ddc9fe047fecb3d89b018b5e23b925c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -938,12 +938,12 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
 	struct fwnode_reference_args gpiospec;
 	enum gpiod_flags dflags;
+	const char *name = NULL;
 	struct gpio_desc *desc;
 	unsigned long lflags;
-	const char *name;
+	size_t num_hogs;
 	int ret, argc;
-	u32 gpios[3]; /* We support up to three-cell bindings. */
-	u32 cells;
+	u32 cells = 0;
 
 	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
@@ -952,43 +952,21 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	argc = fwnode_property_count_u32(fwnode, "gpios");
 	if (argc < 0)
 		return argc;
-	if (argc > 3)
+
+	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
+	if ((ret && is_of_node(fwnode)) || (!ret && (argc % cells)))
 		return -EINVAL;
 
+	num_hogs = ret ? 1 : (argc / cells);
+
+	u32 *gpios __free(kfree) = kcalloc(argc, sizeof(u32), GFP_KERNEL);
+	if (!gpios)
+		return -ENOMEM;
+
 	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
 	if (ret < 0)
 		return ret;
 
-	if (is_of_node(fwnode)) {
-		/*
-		 * OF-nodes need some additional special handling for
-		 * translating of devicetree flags.
-		 */
-		ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
-		if (ret)
-			return ret;
-		if (!ret && argc != cells)
-			return -EINVAL;
-
-		memset(&gpiospec, 0, sizeof(gpiospec));
-		gpiospec.fwnode = fwnode;
-		gpiospec.nargs = argc;
-
-		for (int i = 0; i < argc; i++)
-			gpiospec.args[i] = gpios[i];
-
-		ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
-		if (ret)
-			return ret;
-	} else {
-		/*
-		 * GPIO_ACTIVE_LOW is currently the only lookup flag
-		 * supported for non-OF firmware nodes.
-		 */
-		if (gpios[1])
-			lflags |= GPIO_ACTIVE_LOW;
-	}
-
 	if (fwnode_property_present(fwnode, "input"))
 		dflags |= GPIOD_IN;
 	else if (fwnode_property_present(fwnode, "output-low"))
@@ -1000,11 +978,41 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
-	desc = gpiochip_get_desc(gc, gpios[0]);
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
+	for (unsigned int i = 0; i < num_hogs; i++) {
+		if (is_of_node(fwnode)) {
+			/*
+			 * OF-nodes need some additional special handling for
+			 * translating of devicetree flags.
+			 */
+			memset(&gpiospec, 0, sizeof(gpiospec));
+			gpiospec.fwnode = fwnode;
+			gpiospec.nargs = cells;
+
+			for (int j = 0; j < cells; j++)
+				gpiospec.args[j] = gpios[i * cells + j];
+
+			ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * GPIO_ACTIVE_LOW is currently the only lookup flag
+			 * supported for non-OF firmware nodes.
+			 */
+			if (gpios[i * cells + 1])
+				lflags |= GPIO_ACTIVE_LOW;
+		}
 
-	return gpiod_hog(desc, name, lflags, dflags);
+		desc = gpiochip_get_desc(gc, gpios[i * cells]);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		ret = gpiod_hog(desc, name, lflags, dflags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int gpiochip_hog_lines(struct gpio_chip *gc)

---
base-commit: 04310bd443d4a09a486c0bcd7a767e32400eca77
change-id: 20260325-gpio-hogs-multiple-1718d38c1f5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


