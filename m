Return-Path: <linux-gpio+bounces-33484-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Cw+rC//Nt2miVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33484-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:31:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B07732970A1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E4B73025A75
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367CF38A72B;
	Mon, 16 Mar 2026 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUxCM7cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUJ58Kdc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6383388E67
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653469; cv=none; b=C7srmzpsnNGcJrW9XUTAn2dh1RVfhS3qT1xXIx2uEa9EwZPgMWn0IIEggfRlsHQDB+waABncStke+/cnfwJP2+qsNwXh8T7wbQ1rGXnifjIXION/Al49ZIY3VcNXGJJqViAt/z71B7xaHIcYP1Nw/8FAqlS280i2RQEpgjDExCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653469; c=relaxed/simple;
	bh=+44tN/bN6MT5lqNgwWH+8Ci/5JUP3X2LCmvp3kkEoB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCHusH+GU9NhJyEpxi3lxKqIECpA1KYHXxTzbAy+dYDQDvolt/QT97dIl8HRp4cT7F7JbpbPtRgOTDDLbHmZ5SndvmZq6JB1oHRSmHLyI9ZP6/GjsJ05jNcFQdeym/KSitLUIcKayx3mvV1SSzi2vv3QwXtjEsvIJTqri4kuags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUxCM7cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUJ58Kdc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eZe744013
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCr1tiqyjJgScRsh3FLfIf/Dj6zE8CmQnzu+1BIIhkw=; b=kUxCM7czOyt7WX+N
	dyUBLNFkMil9ZYvtK8+wlu/EhULIy6hrQkaWsNnC/q3f7fjCoukQWmTvRdEk+kj6
	q2GXLdmFeD6oyNZyZ742aolKgnicvKv4vT80MgAKPuJCPRRHhaTLObLfMbV+xlQB
	qgBoucPalqSftZwkU6uwH5RS4yRb8sLxI5Go03DnMscV8f/ZoSlTD8vDCokyrUB/
	sPC5+KWdZ0m/nw59/QGzOx4v6ZB2gVAmIc70evZg6lJ9fDXEzBc4rJtNZoRuk3nS
	EDEudZKklG7mr0JkToSUfKWloDL0N94Fj4W7sib67Yufx4mOaZEjsSuWs7DtvD9K
	Av4V3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bd492-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so2607152085a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653466; x=1774258266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCr1tiqyjJgScRsh3FLfIf/Dj6zE8CmQnzu+1BIIhkw=;
        b=kUJ58KdcktEzxJ0QHHnZdRqulPkj4bmPFdJAzUdB3ubhV9kbPjz0chyHQakD9R4DGw
         OJD9nj980qmwTUZUowkD8OOyt9AjFYBSDCc+i+Ai+R5RKVY7QByJzgWqPdH1uxjac2DV
         g1XBpvPgDcQT8imEs3Pz3SGo5W7BzG/hBBNX7UtowMwFKLBZlxOkFRBTNN9KEi0uzXyw
         piODb426OlTtspOXM2cPtHSW+5N17zs3ENzIRlSlukEP2sjWEbp//pZH1pbbgfjuvUmO
         X24Q7Nn/csJL+cxpmf/2BwiYxQLuQ8CFEoOu9C79lHVtLMRdEVZhMxiwoQwDw+DesElT
         6D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653466; x=1774258266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCr1tiqyjJgScRsh3FLfIf/Dj6zE8CmQnzu+1BIIhkw=;
        b=p//Gg6uUmnlKI97EIpG5WChxB+VFpDh83NUzSY1PwKaAOxcL12FpEPUqhsHGi/ZG4M
         uK9EqZ9fLs9MmBCygsS8rvxjDYgDyH5rkcuVU9gTMEgKMZpFUsAPhacTrdiGSNq1/5DD
         fVMEE74UlybEHcHaziJ63gXDgA0RRuzZk/j/qiEcPO6T01GUZ2oisIG5kmUMP4k+o92y
         AACiNwRsSEmMoWhLQr80mZV29t7pDnM1jZ90SZLqBBPrcp1FjDxyiOXaYh2o8UghnYx+
         fyyDj/udEFVPB6QGW09OG9jGWO6BtmwlCfSs76ESGpw1+k2JZykeoxikLG7WxrV3Rlun
         dHeg==
X-Forwarded-Encrypted: i=1; AJvYcCVjOz/6Gf2XNECjZK/PY5QQipxSepenMFv6Gg/FdYq/kFw2TjTmZMryJCWJYuTbBBJ3rHSunrr15Eg/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8FkKN+vt2w10eLZL1lN6qnTuE2m4e1D8TtkJR2tHZXVYJoyTP
	O7nwpjivJ+X9yPCb5TkFfYgiEYRyJx+05Vdaw2bzI9O+chsqqGLYqWo1PKJnoHt510MVrfKJbXe
	8f52tAc/Ren56n1iSomFTx4mRQkuPlkQmA+4OBdV0gWh6SZcbc/xQ9yjmxalVOS8RI1G9eZHb
X-Gm-Gg: ATEYQzx1/drvuXWN/zxYzrH+9kcPiNkpcTPdF/94++NjCOsSAjUBJc1IyqdBguv9w/y
	G8TJWoXnN1XxlMAFKqDn1WI1lcWsJnpbDoFx/Dt7paXesA8fcOB7ZEDt2WtvPhObFEHXbDlGZ2Q
	9WL7nS03LqyjCfElbShduzdqclG93IOL6E9KYO+vttc60PQ/LNWyiyWhjBMmKisZ5+geDU7H7UX
	ZQrShY0socNVOJFKVy+drdE79syY0O9b5RqxWnt+nuXhSISvt2cH0YXKPyaNGSVXiheQ0hrHy2v
	s3CpQZprtZMY1I5uX2IDn2XriXz9vipDoWbIa+BrvhGRr6EnIjbc0zIq5mYKiB8tW6c5h0D21M2
	k328ktrNDvg8A1LDeJHv5xwPynvz9VA9ImZH4vH86du8BRTh/yNLw
X-Received: by 2002:a05:620a:6608:b0:8cd:c086:98d5 with SMTP id af79cd13be357-8cdc0869906mr1162161785a.22.1773653466010;
        Mon, 16 Mar 2026 02:31:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6608:b0:8cd:c086:98d5 with SMTP id af79cd13be357-8cdc0869906mr1162159185a.22.1773653465549;
        Mon, 16 Mar 2026 02:31:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm43930688f8f.5.2026.03.16.02.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:31:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:30:49 +0100
Subject: [PATCH v2 2/3] gpio: timberdale: use device properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-timberdale-swnode-v2-2-ea0078066871@oss.qualcomm.com>
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+44tN/bN6MT5lqNgwWH+8Ci/5JUP3X2LCmvp3kkEoB0=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGm3zdGh6r4LncUXJ/shWyJta9gn4gMbQFmzdjDdzXGk9wwXB
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpt83RAAoJEAWdLsv/NoTDTF0P/05r
 VkrhOy4tI9rgJq81+hIlhFWLpUTGPrA/OxozrkuHybIfhdqmpNtgvnE6xSmaI3RMAdq/9hSbl+6
 +KuDlznioBeilHfw1C6UQmRPIyXlG3NBdSZg/LQzteQlbJZr6ySv+MI45ibOWGNg6/oOXR4+6Ak
 4k0YcdhsOf/jRrs05x6rryHhKOQDOP2Gf0W3JEMdy8bia9ag7WYmHtz8RCjLaww3BOpi+ybcxXM
 iwRsHA8IwxxlHXejrCHK9p2w7CJyd1x8z9rPlzVogTZKoqep6Z/MjHLDBTgr8CxBYGvyQ2FdHE9
 aLqyd6naFwWVSGQDop6HocKANgzDAKO/JDvJkvkaeZARgzEOjoIqH55S/8LyEil5rnY3Y8UsFUu
 4jCoHTnv/lUd8V/Q/8szGdRNNTW8HjK9Gc2s9Nzbg5DV/fzxROKWgKVk7ATZB5MGV1RZqhAl6/2
 6IzsIZ8YxkizvvidBh3uK73pdGfLPqOmOrL8+FiVnU10WMzTsCXs/pOH+U+Yk+hHisLdZOmMeSj
 nVhYpHSyazXse2uR5lWCT7uXcnVmC5qGSrQXE3DK/H916JCXLGxBEfHVPsZTkVaqg4SkahXyjR6
 ghLmht8Kaoj//hKXHxR6fvug/mGS97I79xV7hrHVf7WXeUG8/IUNCEsguYfBUwoJudJgeN2bYwL
 LoZMV
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7cdda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8x3tX-5dUG4wHQunnKcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX8JEnRRHYxsuS
 Nbbas0fcUJkz3EaqEXb84LszR9kItuJK8sw6B8qVbtd7KvSak3RSjKf7Cx0d/LbWmVC2vp+JO16
 ZG6W0eY3sPvyUlx5ADpScMzlyFNgwkFSPBrokZ4qMWuNjQBWU/kcr2uPxUFhX1LnXwiXtGA9ner
 L+pOEGTb+5fvu1F7h7sQlE1XcL+36Tkl6DvtRrKSJDFC8wI/40/CB3v3j5aGyCHp8lv521kGd+s
 stZAw3uAaUsgICzDCGFo1+sp0eVlSxUB767YU49eFM2/6hueU513CmZSWIZHz622CkS2z0suElt
 PJITm2zdsXCrU9eU0UNL7Q3MdB5oKh3M+ulAS3OPUuM9Q72hfynrAA6dFDA+lD3i/bSDfFqU3ML
 3jq4NPpWhvYWIiZRpgSampHL2ZtHQ563iDa7WPUT6PM8CKbxD7EvTYg0hWEwd8NrW1wDg7lnql8
 tssSco77pNQuCSrCVJA==
X-Proofpoint-GUID: WyBRY4VWt6PpcC1ZGXP1nt9aRX0IOvb2
X-Proofpoint-ORIG-GUID: WyBRY4VWt6PpcC1ZGXP1nt9aRX0IOvb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33484-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: B07732970A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The top-level MFD driver now passes the device properties to the GPIO
cell via the software node. Use generic device property accessors and
stop using platform data. We can ignore the "ngpios" property here now
as it will be retrieved internally by GPIO core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index f488939dd00a8a7f332d3af27962a38a3b7e6ecf..78fe133f5d32350567c28a1cc982d7bb3183ff2b 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -14,7 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/timb_gpio.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 
@@ -225,19 +224,21 @@ static int timbgpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_chip *gc;
 	struct timbgpio *tgpio;
-	struct timbgpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	int irq = platform_get_irq(pdev, 0);
 
-	if (!pdata || pdata->nr_pins > 32) {
-		dev_err(dev, "Invalid platform data\n");
-		return -EINVAL;
-	}
-
 	tgpio = devm_kzalloc(dev, sizeof(*tgpio), GFP_KERNEL);
 	if (!tgpio)
 		return -EINVAL;
 
-	tgpio->irq_base = pdata->irq_base;
+	gc = &tgpio->gpio;
+
+	err = device_property_read_u32(dev, "irq-base", &tgpio->irq_base);
+	if (err)
+		return err;
+
+	err = device_property_read_u32(dev, "gpio-base", &gc->base);
+	if (err)
+		return err;
 
 	spin_lock_init(&tgpio->lock);
 
@@ -245,8 +246,6 @@ static int timbgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(tgpio->membase))
 		return PTR_ERR(tgpio->membase);
 
-	gc = &tgpio->gpio;
-
 	gc->label = dev_name(&pdev->dev);
 	gc->owner = THIS_MODULE;
 	gc->parent = &pdev->dev;
@@ -256,21 +255,22 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->set = timbgpio_gpio_set;
 	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;
 	gc->dbg_show = NULL;
-	gc->base = pdata->gpio_base;
-	gc->ngpio = pdata->nr_pins;
 	gc->can_sleep = false;
 
 	err = devm_gpiochip_add_data(&pdev->dev, gc, tgpio);
 	if (err)
 		return err;
 
+	if (gc->ngpio > 32)
+		return dev_err_probe(dev, -EINVAL, "Invalid number of pins\n");
+
 	/* make sure to disable interrupts */
 	iowrite32(0x0, tgpio->membase + TGPIO_IER);
 
 	if (irq < 0 || tgpio->irq_base <= 0)
 		return 0;
 
-	for (i = 0; i < pdata->nr_pins; i++) {
+	for (i = 0; i < gc->ngpio; i++) {
 		irq_set_chip_and_handler(tgpio->irq_base + i,
 			&timbgpio_irqchip, handle_simple_irq);
 		irq_set_chip_data(tgpio->irq_base + i, tgpio);

-- 
2.47.3


