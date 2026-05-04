Return-Path: <linux-gpio+bounces-36042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rGuxCAt8+GkmwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:59:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F374BC09B
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DFE530071DA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 10:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDAD3A6F00;
	Mon,  4 May 2026 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjxCQTHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtipSadE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE83A6B75
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892357; cv=none; b=W56ieoIafJKP9ku+kfe76AwVe+26/5QB9IkB5p/jGEhzYSiiLCV6LEOFot/CG3UOAu5WyKziliFGZ9MgchXC2TknPwNlAf0pHDZyIHHCSV77cC71ufDiQmUq2RblLMYqXhO/M5zX1bSlNKj7s42Tt3G9S1Ks3raW02N/8FpWBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892357; c=relaxed/simple;
	bh=q7sjodupZIHIc9I4GAe1Aft0vPiKVykD8x7gkFb6F2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBMEaL8KO0FPRc4oKaAI4GwMzVMQA4EVRkpxINz6iFX2L8Glfl7zNeDkqcp7HsIRb8nsdkbQtSCJWTujJhJ3tlwa56HNUbs0Z8lEh0sjFPLL+P3gxK8tJaVo5gY8mgwTT1d4A50V7mkMoQT90UErBhz1qTSTpwCWo460MPnTGvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZjxCQTHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtipSadE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448frdH3825305
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 10:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V425kPrDLA0uTBm3PMUPbEBK0sw5EqIjTclbLbItzbg=; b=ZjxCQTHcBUEOBrYA
	FJJ9fqNxRE82nwc8i0k9fbQGpfAD/lrvdXjoko2DY+CCkoi98wqATVfX1SmlVOl1
	s4XuYSY1NCsw+qJO5CUvwQ5NvHGM+qOPzNqFfbEeddztMxSwued8fy9LTRIAUwmW
	xZNlUqbehYp0aeLmEy4lY7tv+172JT95zW2EkWGjyt6Xz6jRmT5aFc73bCxckMej
	3nCIbQjiD/KxHakXp3S/IN+uRH/ri5ANf1KAxcaDxLXJyAo/DpM7QmEEYfTbBKLp
	oQ9ONQ5xcGM/tEHvD3zZ0lwltL5bb1n6wpxca1vo9bzxhN4y+WqlyH0YLmGO51B9
	MJRsHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3ndbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:59:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so70502571cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777892355; x=1778497155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V425kPrDLA0uTBm3PMUPbEBK0sw5EqIjTclbLbItzbg=;
        b=XtipSadEu38nsDkY+pUIOTL74IIq87YRboN4q/hFy+9N1cUToKTUDl1lHdXzB4G2gu
         NqfkOSWo90BPG33OVR7zUup9zy2vUCab33FxCbbiJW2lFyF7EF/WGU5d2/SgZt4bc+ca
         TUIxTSRsrT65VQcEfSIsswRLvZAJ8imyuoYS/dRJ5gpPK/uIS975L7iZCdr3gTRrV/lQ
         hhYBukOjW8K7W2loemwo8KGTeALJy6OY1ThRMXxhtJ9xyLkqcSoPZLlSm2fiFaWkgOxO
         hZ6SOx51XXGVdZ6mABT2IhoURRtCSInD5ZasnWRJFrm7JkfFsDqwTMPDAiVeRl/ZTqRX
         KFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892355; x=1778497155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V425kPrDLA0uTBm3PMUPbEBK0sw5EqIjTclbLbItzbg=;
        b=oPKIspa5hMSqHkoi8l6E36qbHmNDbKKyQfJDSlUDRvFqWbERe0ShLnah6h1/e4f9xX
         evt9WwcOonxXibS0LzFaXGbGoM9cJdHurE5LNfFA/CGl2koub0gonG4DnIYPLVeYR1C/
         MsswOYJWqvN1CG6jZPE2qxvGFf3U+UWXtXYQKI85MuYmd2jdqehF9XZHcrGoII3Fy7c9
         R8/I16Xv40JJDK/nVHH7uyoIZm/BUm9Ow2s5o3W+1RhuDariLE2kcvaGv7dKsKuDLlH1
         4MAHI1qEvmmnG7GFjlkBnV29g8SR8DZITCYigbmf3SotMNuvJjJ7lJn1uR1m5qNqMp6X
         cTLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yxxIo8+fbFMjMSLQqermQp2uE/eDL2L9gYDVL78jSeHHD3tS1bMMQS4R2gm5+x5AioIi+Pd6OkMN0@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNERsGMNLdUKGFJuwe+u9LLHsdTwvFd+Klqy3hOHPk2o4hv2w
	ApKyZEc6OZXkWQJSYMpi0ugvV3+Xz+PS6u1PVJiFQqXnWLx8wzMfxIXWohH5pWttCrqtWbpQVnn
	Gqm0YtJDTRhlYT31BKUgqh8texY6AcMmjlPGco03zkfCmJa1WhSZTeP6MLQfgsVqM
X-Gm-Gg: AeBDieurlnkLLpBqq4fdfiXv2ojfQWgDmIfRxklsJsnbAvQM0+5WQMj504vnRC8ne7Y
	jHyrdsK4QABIVwQ6EpbHVzjZjBlR+R2XDN5PtMF7OPEkbXJZB1zWBsrK7UbFqyiNkfkRfE5Bn82
	cZKBcx6gYqh2kXNblY+s7EhJ75e548cHMGtqa6SVsRDIUY/44aTZz1HDLmHWezZkshRXiHHsKc1
	cWxetAW3j3Nhlmv4B4un0aDYhOUIov1eVH+gBj6qEjJfkyQvTmt+UhT95OLr4wq1BAZs9MHbhqt
	zDZzbIFOHHP1ZI1GUNN8jZ5w/ocg1Kq2ye/QK6QuhPfBTkuJwNI5oVL390IzJefao3cUqrW30Vo
	J5HrLqfqY8efTAOrlS2ziG5zoMHIjwwTK0EHCVT9TgRS8cXNh1J9HhFXz//ojxg==
X-Received: by 2002:a05:622a:5599:b0:50e:578e:bb18 with SMTP id d75a77b69052e-5104bf932a3mr137503481cf.47.1777892355029;
        Mon, 04 May 2026 03:59:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5599:b0:50e:578e:bb18 with SMTP id d75a77b69052e-5104bf932a3mr137503191cf.47.1777892354636;
        Mon, 04 May 2026 03:59:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm474728135e9.1.2026.05.04.03.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:59:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 04 May 2026 12:58:56 +0200
Subject: [PATCH v5 1/2] ACPI: provide acpi_bus_find_device_by_name()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-baytrail-real-swnode-v5-1-c7878b69e383@oss.qualcomm.com>
References: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
In-Reply-To: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q7sjodupZIHIc9I4GAe1Aft0vPiKVykD8x7gkFb6F2Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+Hv7CwKT6GTyvhgBKnb08MJWUVi55iNZXlnWA
 syAHRv+R/GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafh7+wAKCRAFnS7L/zaE
 w4JdD/9rRj/nsK+IO4N7Dx2OjHXgHsOoWxSi5TTD9VX8rMmcyp5wsbYdkvryKud049nxCugw7zm
 ymBiUjJBGo7BTI2wtOAsRcioql+CenMka+QOcmeg7/YNfmqOSED/ktkygx7T3yEYeUqArzyjn8i
 eeO7xHo4ZA21xTpAvFr5Zq7LarrJAK8ZIxIy1AgmW0e6lgvoAhjvqc78E44iaEq7TqQBXNNGiTH
 yIlaSSIylSTTcTvgAvPFb3EL0M0AJOTn1aaYA3igRB4zkZT04rOnanqugtIfrD3tgBqcJdcrRiK
 Y3WSNC/bsSGRtjwUxhZD6CLrCgU7BCS151cjPu4w47k3mpmnw40ym7AtyUlCzo8RUu4AAx1/EYa
 8nB+saNSaGKTB2agIt7mrPIJjc+uMVOJ7hPnsHtlu7HqQmoaeO8UvTt5YNLmXCX+5n5cY/7iBSO
 nV6njQYmP2se5A2or01+NMOsZcD84lfwIGYleERhNOA9JttVxhFfXvzArsy5OFAJaynPc9Uw9N6
 jZ+eNzMr4EnPnVBHikygIzsTfVmPZg9sHjlTfnQ8btytXkIqebKeFm0L8stTAZBb8rAqwY1RMsb
 dmQ9xPB/u9s9TzuQfWgVZdl3uHuhWcIUfTSXYO082NZkxPUENGCUT0UQz7JweD9MCe6zTuThhN6
 I2L0sqRAe6h3RpQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExNiBTYWx0ZWRfX4WW/Yusl0SF/
 pvRvRTsSiuU9066QV8xM33wWB24it3ff6746VcN7j1x5WSYep5lRbdHB+TDdPn6DSxg5FCUaMya
 OQpt/f/hLVp+x80krz0hrepHXmJGM5U3EbaFum6Jzedx8aDC4KmxB6EbOD1LWNKvohfY4D21FDe
 fiiCaQ3S/TvHTwKJWdA1d5KnCXlG5YplI54T17BhMmedL/4ma6IspQ5jpqznSn4UWaaKci5Nhqd
 kWk+Pe6frCVVWj17RwKkfoPQ6pnzOiUzdbicEtixfgdg/kvotjB33VAA4ib7PllA5+tqyJebTJC
 /z+hLzuAbkZQTCToHgUaOjGf0kruJDPo4u02sQd6YAK4LezGQBRwpI2mxMVDHdfBLpHsly9QBQ6
 +yKyfpBxuPY+xa3Z/8GMxuk22BiBI29F+PMDGr9yOuvXqEarLb3qTalyLSTwlnSHzJ8QFsSIfHm
 J0Z3l5CRCDYFCU1JhZQ==
X-Proofpoint-GUID: RhS76TdqM4MMUaASDM6vHoevPmMqkryX
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f87c04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tVjv3dGkaYTl1EMwD-YA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RhS76TdqM4MMUaASDM6vHoevPmMqkryX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040116
X-Rspamd-Queue-Id: D7F374BC09B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36042-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
 drivers/acpi/bus.c   | 15 +++++++++++++++
 include/linux/acpi.h |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..357b39db345d596314e8956d7789ef0cc51ad1c1 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1181,6 +1181,21 @@ int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 }
 EXPORT_SYMBOL_GPL(acpi_bus_for_each_dev);
 
+/**
+ * acpi_bus_find_device_by_name() - Locate an ACPI device by its name
+ * @name: Name of the device to match
+ *
+ * The caller is responsible for calling put_device() on the returned object.
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


