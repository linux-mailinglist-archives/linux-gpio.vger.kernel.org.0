Return-Path: <linux-gpio+bounces-32551-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uExJNHtTqWkj4wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32551-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:57:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8388A20F21C
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18D71303C52B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9770037D11D;
	Thu,  5 Mar 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfLV3pQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5YPXriz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130137D106
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704318; cv=none; b=nWhuNMF5Jm+249utX987w39kmKUJdXT2yWJM6MuOvbJAPLRyYmZZTtkYd/P/5y4R0+yed8b8WH9yXDia5cUEOsG1bO4n6MnRTQH52MT5G61BIKcgfdFgbzhhM/0plMrVPtwdWWHa2bKYMHyUnpRiY5/9vB0wuoeRFX/3FnygkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704318; c=relaxed/simple;
	bh=yLeXFSR75ccR0iQLMahtPOCj8es5shZ6FJ/i3qInIHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgDtMtcIYWC4glti3fw2IUV5ZmnqAdrw2bd0Dic0edhtvXLl+JFrJ+QvwZe6eGh0iG8HhCPup/wZ4ZwXHVMpiWh5gMbxxAbdNDQcQFSkkDAeDzPHfAjGuCDbV287Ew2vMlFszK0kK+PwEwjGzglB4XKmpk74Ez5G4C81HIW1Da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfLV3pQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5YPXriz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258tv0Q3473514
	for <linux-gpio@vger.kernel.org>; Thu, 5 Mar 2026 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=; b=LfLV3pQvclLyN8oO
	WGlEmqiZs4p5Tcg/XKjCFQZf7kaW4HFV3UqOlpEU9/saeKlugDqgksH/oGlDX6dE
	C9P7zN1h7dftsFPBdhDGSPa3AMk+8TXQgIokjjy37xaGhMps46QfCjRTFE+ptke5
	e3Cnb1gAsd+mXCg6Fn2ce23cnzrUbu1yOfue51hnOGdwFM5E9Q1VeHUy4VXODF/K
	G+PH1ie3w9DEuPEdbsGfwwNhxoCjv04Ju9t1WuVUYV5Zqw267+NeTxCto43Od1Mv
	yshpZ/YMTezNyfisZ3uCiuckuuZfaGa+mIaohtOPYF6pqz8bLM+ancwRlo5B0kkF
	aFF16g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj18479s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 09:51:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so5473119685a.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 01:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704315; x=1773309115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=;
        b=C5YPXrizTAOGWy2N6AncBWKC8F4UcBKYxLow4j6pY1Z1X+7ctYUo3oMIQYgrs9JGDt
         AMj+XgtyzcVsickkeDMktnAb4cxIRTxk3Pi8vFaxYQSfMyDbdyJYUceCn7QPK73AjYHO
         zxAxFmgOBEICLrDRAyfsGs/RS6df028xmO/U4J14Ea9XQ8YaBUsqh4IwdhCN8QgaASm5
         gpISCnZiRbaP3kwNKaKqYS/7fm8eCLRL+pmrAKf7UDawWQ7Q91+RUQXI2V4bPhtCr/6Y
         RQfFZyFLs+a0Fh5h/w0mrd9B2/brH6yi1Kse83hXDcTez7mcIgFY1fGAuA7/SDBFpWEn
         mEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704315; x=1773309115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=;
        b=kLgMxSXx08j2jJIjVaBqCBrmVV8VcatdaWEdLCCgL6Vz9q0RuuJZ3+6axjfm5vqBXQ
         UfuoQuKUDDq06ld+pvlvsFaFMDCI+/b8m1WA+OWre9pxhyoG56mKM4d/QAvxj6PpRmVF
         MzVIQU1oWRC09guSL3zkKJK8rXco2rDBH4fcFL2n9dB3pNN6v4NWchUcFOwWvuvcbeug
         TrPAI1Yvk51ZN+uXPu6u7p/eOcBdknfejyA1Ce5zVUuqiL4o7VACSnCL1kJZRgj7B8n5
         NsOIG/vfs5+5dGO6gveDvrjpWtU316BEK+OySBhfHtgVQr6m0nqcPEgLoL/1H0pNdtpI
         mfVg==
X-Gm-Message-State: AOJu0YzdZzFKOSb2xJhJSWzQvF8zhSv66dR+XibMv5Q4qAKE08LFQQeZ
	aOlMlu7NUJ9uN/H9opiDTC78vl1dT7HpaLTXSstR7g7+Zrh8yHIGZ+xZPhdDSnLzHWs/f5ec0Ja
	TQPDBwqMqzXmlnFfUWkVefLq5v0s9rZDNpSZqSdUqsREOdcPiimUNIK67B+fbKAHg
X-Gm-Gg: ATEYQzyswaM3jz7QLiYuncfWU4hEfwt4xeSSAhoIExq1TWMAV46oRIyTEnnx0TJWByM
	IJWwoCYB8xaRLhzKTtTTiIZ39g0E1AWDy8+//E5/NpcvTUT3wpcgm/6It3WDFKFnOUCHdyZy77H
	suUmIGo0MFlSr1L0miB6vbm5y3lgj2JO45q/xPfR5iLGewOCvPYJt61fV3LuEu2SRm4AvNTjNqb
	l3WaLy7WyNVO1hKvqRV+vhna6ofcM55mY4mXV6bvOopN6W+py/JpDfzbD3eKWDws/8//lr+TXN1
	sHZcWxhuqA/b2L7ai/RnzHOULuKU+LfYO8SF8CovWBAP9W8CkSx13OPmO28HPWIfcY+i/fZpB/V
	ZTFjYn9E83iVgeRUPo6dIUyDrAkqRrA0vRPQLaVEVyHy5dCUg++pK
X-Received: by 2002:a05:620a:4713:b0:8c7:fdc:e84f with SMTP id af79cd13be357-8cd5aebfc5dmr661933285a.11.1772704315183;
        Thu, 05 Mar 2026 01:51:55 -0800 (PST)
X-Received: by 2002:a05:620a:4713:b0:8c7:fdc:e84f with SMTP id af79cd13be357-8cd5aebfc5dmr661931985a.11.1772704314701;
        Thu, 05 Mar 2026 01:51:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:29 +0100
Subject: [PATCH 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yLeXFSR75ccR0iQLMahtPOCj8es5shZ6FJ/i3qInIHs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIrub3GKRGYVOnznATyf6cDQTE9HMMiXE/dd
 JGGx1EnnGCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKwAKCRAFnS7L/zaE
 w3yuEACRLeLuPAaAcj37K3QsyNwQjPOc0IB4iJjV4FzCiOgnjoC9UyKuFYAvefMNet2QRTI7ihG
 PIUxdCg8Uwbu6IBavAIfyYj+kYu2LKh7IK+/EoaWYcJ+vowqem2T5cDfR+T6wrOwkAMZcgJSjSI
 8jNwmLr7x52h50vitgs2AqEfzeQygMi2J8L7ZqLWMVB3TlYgOK7UUfGUs6/D3iuHt1/xAmPpF1/
 c5ux/zDcMHvl2UxRviEkq6/teNmO0Zb7jIy1NzZmlR91Rc//nBb5k+qSRlnP3oM0Fysl6cjWihQ
 BaV6v4fnvt6aeFAqX9kJwCPQtVFR8B22Bb2m6JdwF9X8Gy+Iw/wFPEFbU7L7FRha8lcqC3VM4AX
 +Lop3w9rtHrfy76f2jYO9eucsdRthzaQRQaHLDL5oBNiOtD9KtmTR6wYMAizArxZqU3ibeEIujl
 KSkLCUHyk0elsalUfwpWwZ9YWEgbdWNOz/M9MEqti9T3QUkkS44cjG+gnN2L+eUBu3XfCkkiqJP
 eCMcpWLeQmejZUVr0Zw0FBNzdFGvdaHF2J4+KeSDg9QnQHQIQErw8Ua2DtbYdBWvKGueczWHICV
 c2nYtImPF5WES/h14iVlNbJDaefOpTxc9K4tJaX6Zql2DHr7oHNqHonRZApPqJH5qA5hQo/wMGl
 eG/blmKCuQZz4KA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5t12ckQV0caOuql28yaNdKtwk2rcTiRG
X-Proofpoint-ORIG-GUID: 5t12ckQV0caOuql28yaNdKtwk2rcTiRG
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a9523c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5psZAbpHc07LGj0ksyMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX8kUcCC+tMU+H
 q4yh1l+P5UrtnsBJrJhH3DnkVFdnE/2lBYG82+SJaY9bxVpyGOC3Nl4HmXxtm2oOEcCpyrzlhZb
 ww1rEIs2KNFGlcs4MXZH7EkjLIV6D0HpLBHRzoQ4rS+KMM6SgpQS63QRH6PNs154gCqkmoe45oa
 Y0RXrCPd+EzAlS/N4PaEmeqZuchmk4aJX2bmE6zKl1sO0ZgIJwCXq9utjYd+ztij/G362oZL5dV
 4+ktH/w9G92GTZmerHyz4lixQi2wdtg+zQ0wJKIu9+fDHWauoE+eq683Nk9Ws2ivXzTAMG66cAn
 mI8muedm3AC8aAOS7ZQWwZv/X5dozKaine/RDHnd2p7JBn+tyS52OgJZqFjOf6x++xlPo9+EHIn
 dRagBzSEuhy5NMqMwT47sc1cZ53jWppRQWqmdow8G7zV4fOo96Yt/tgcLGwUIC7yCm5L33etKr/
 bo/NO5PqbGcJTnSSM4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-Rspamd-Queue-Id: 8388A20F21C
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
	TAGGED_FROM(0.00)[bounces-32551-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Setup a software node hierarchy for the latch2 GPIO controller defining
the required hog and stop using legacy machine hog API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 16392720296cd224732450c85419c35bbab506f6..1bec4fa0bd5e8bfc58103d1f24b22176707fd26f 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -556,10 +556,30 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&ams_delta_nand_gpio_table,
 };
 
-static struct gpiod_hog ams_delta_gpio_hogs[] = {
-	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
-		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
-	{},
+static const struct software_node latch2_gpio_swnode = {
+	.name = LATCH2_LABEL,
+};
+
+static const u32 latch2_hog_gpios[] = { LATCH2_PIN_KEYBRD_DATAOUT, 0 };
+
+static const struct property_entry latch2_gpio_hog_props[] = {
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	PROPERTY_ENTRY_U32_ARRAY("gpios", latch2_hog_gpios),
+	PROPERTY_ENTRY_STRING("line-name", "keybrd_dataout"),
+	PROPERTY_ENTRY_BOOL("output-low"),
+	{ }
+};
+
+static const struct software_node latch2_gpio_hog_swnode = {
+	.parent = &latch2_gpio_swnode,
+	.name = "latch2-hog",
+	.properties = latch2_gpio_hog_props,
+};
+
+static const struct software_node *const latch2_gpio_swnodes[] = {
+	&latch2_gpio_swnode,
+	&latch2_gpio_hog_swnode,
+	NULL
 };
 
 static struct plat_serial8250_port ams_delta_modem_ports[];
@@ -684,7 +704,6 @@ static void __init ams_delta_init(void)
 
 	omap_gpio_deps_init();
 	ams_delta_latch2_init();
-	gpiod_add_hogs(ams_delta_gpio_hogs);
 
 	omap_serial_init();
 	omap_register_i2c_bus(1, 100, NULL, 0);
@@ -693,6 +712,9 @@ static void __init ams_delta_init(void)
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
 	platform_device_register_full(&latch1_gpio_devinfo);
+
+	software_node_register_node_group(latch2_gpio_swnodes);
+	latch2_gpio_devinfo.fwnode = software_node_fwnode(&latch2_gpio_swnode);
 	platform_device_register_full(&latch2_gpio_devinfo);
 
 	/*

-- 
2.47.3


