Return-Path: <linux-gpio+bounces-34649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aErJAd7Gz2lH0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:55:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2651394C05
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C25F3088537
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DE83368AB;
	Fri,  3 Apr 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA4hAnnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhQEiPBN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEA3368A6
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224333; cv=none; b=ZY54OU1SVQbBVAhv7NrWzktlrO6kmoSOmMOZ2c0COA8GuaDnHn0YyRAKWtMamYm0GY8vW4+CH9IjykmXq+JkmekBL/XTg0EZL2boXNe/Q0tomVJyWtVDdJWVg/+PtNQcFJ1pOCUgWn0lf4inLbId0pGkFrHen+RmPHGelYtWBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224333; c=relaxed/simple;
	bh=tSBsw89+EgLqL9rsGM6nffcOTxXCKvBjsnCc9VJADCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCmPJZANQzcZ0A5C3dC2czcHQkmu4qaHdsXinCEVUevP0jnmHeCzqmsrGxoOWODWPnwWt5zV9GNbDCSXzDL3rRbU+3ERQVjqtC/ZDibyYk3/kSGaXPqkJSYCzt6Ap0QyQP67vKLlM8GbVde9NCxx4WwoEQNhKT7RtO6f732u7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA4hAnnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhQEiPBN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DVvhT2360451
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=; b=kA4hAnnZmv5H94x/
	OTYim2w+MWizJGnpmVBblBDjCY9Ah8uQeLEo+7iB9qhrzm/zZgfLY2s/YZ4G5Z5r
	iRqP5tgj3s87OM+I61p/MBUqcs97aQ88XPHIq6ONTUnG1m040D9U1m2zJNGT8wEH
	z1Pig7dAfbRcELP+uJJj7sOaG5RWTRTvkzovCieE4PMejVV14FKg8TEO0bqRrrfA
	lDjRUKAq4JfMWiv4mTZw0yKL1Mw8YRaRw12rCsJF/0T0pLiJVDIzKcKjnEE1ReC4
	dIx2qA+Y6ryIqjQBONPEENriM+qUZZNvy9a07DUD2cteSjNFma8IEAB5IbGI/WmC
	mnzQIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1g1we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:52:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509044f54aaso55295201cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224328; x=1775829128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=;
        b=UhQEiPBNuGaxFudCbA5g7x1FOPoc4GVCKVev0AEFo2AN8uUzmUp2SZjbRIZW8elxSN
         VdVuwnztja6QlBOLl7SXwDsacA4T/2Z9axl+h7y2TPLUcN8Z1RgAJdC7GGQB/uFv+ImM
         nEGkTYMS0FKOfDlAe/JChpZJjuhLcmuR41qWjSnkx2dbUOKtNPr8rKhO0JDLu3n2gL8/
         0TO7MybACl41JhDLaCt3/HpdiIygvHtzfqYW4dATyFrQe+2q2RFcJELbCha3ZyqvLGWy
         eWS4XjHBMFUUgh2IGz7DwsR+YVc7CD1f15/W5A7RQXSlNSzcsIPcY7gJC//iH4w41F+u
         0qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224328; x=1775829128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=;
        b=TU1BupkjZftttZZZuk/DjIxPi1ICsc5KaoF//3wDAhg+EDSp0+zVlkUoCfu+JeeFmf
         Cfd/dYouwvPBPizJruYtgf8VfXcmImH3CIdE84I8DlHdKckbKdeJP8mzOH6/QysbXWHg
         PftiLpbIJWvi4Q46o1Ato5P6GbRA1KwbQbcBFprZqSLNXstA9B7OzlDKde/GZEW02VCz
         jUepwpN8jMzMjR0fr/4CUia48oLucdLt5kSDnBu2az4vRhebbG2Hc0fRi15B/2hkHFhL
         i8kfAhKrnIGv645Uot/H+pLExr240Q1KNFU3ilJG7Y8YKVLzCT3Yn/RWEDevqRw+j3my
         Tctw==
X-Forwarded-Encrypted: i=1; AJvYcCWtvhqFUCamYxo+Xq3AmMbriA6Cp7/59Z+upBWwaaiVMoCbk2JPRU9MggHcnEsDybgFppGNAmhDH2P+@vger.kernel.org
X-Gm-Message-State: AOJu0YyV0Ll+LPopeWwn23GiOQNdK8bTmZUnF2zWUrd2Ynn49dpO5d/U
	hBiNTMWAWbh8tqsKni94BQbxNg/Qz50mEG3sfqUDEjCoPZaAAS3C1e9nKmO52aG+AtafvWFrZ8y
	RhUku1Y9qUKvoGqcgElcEhyig6u5D4QrBedKnE1pivmYf8vo2bqLYvuAVbFCm//k8
X-Gm-Gg: ATEYQzwlri03e1FSm6x8qnZlJYxP5dnxSGBPe/sWz2a4c7iQJR/LSkqcaxd2e5TBckf
	Ua6DbJ7/R9kpR0rzwPGK6ZGAan1grkWezsmTeSNbbEYNynSYQ/DpsFBXUJW6/CX9iLWB0ZD4NTH
	WGIuw8yOnT72Q93XVzE9cjNlqpBmEkKt9x4JCBW7O2esgOD9SW9NLeEYPj1wV0hz50Rg2icTEfv
	UAlODpKBqveCPxrCTb5f/jM5GxKCgAnetJ9uChfRMm0cTMSebPEsYOVt8AieQlw+acVxzbkkTI1
	ARx/cOwhvFiizrlE8btDii9v4VR8uIOu9Ln4VY9uWdjhOijr8vh1mQxeRoJhAwI18yPnmG89B3k
	R/pHbuRbEB6bUR/xfyH/H7OibH/WLdltzImz6Rgkq7NXsWiBcSzSF
X-Received: by 2002:a05:622a:1f88:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50d62b4fa9fmr43413161cf.22.1775224328261;
        Fri, 03 Apr 2026 06:52:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50d62b4fa9fmr43412841cf.22.1775224327844;
        Fri, 03 Apr 2026 06:52:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:51:51 +0200
Subject: [PATCH v3 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tSBsw89+EgLqL9rsGM6nffcOTxXCKvBjsnCc9VJADCU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8YAvNkQYAMYU2+XmQ39EqvAL7D+Os1c/agWm
 lWlplJNjyeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/GAAAKCRAFnS7L/zaE
 w79xEACi/EvAOBokb2UlYyvQLhzNY58ORTrHqYEOL5dnJ0LMUFJxnRi1gRZPM8kds3AFjqK6s0b
 z9z+08cH2hhRHbHZxxAECRMT+T7StWLJLK7aSMAjsaSvZTbteomdkmQ6QSBYcgNrjx+T4DCGXEy
 XdZZe4WGT2wIJr9c0tvF5G0dKKwJadko2QHV1UBEKkpkmliH1NBD90hCgNoqxriU5v2zVUnM7fh
 pvlMidJ9IQwTBN9tQzHZ2cNdtL6IRIAGXOIdWll9yt0Qjx3q50Jfe5DTdm3MpR+RVFg14neZsBO
 p/dlY3E7/8FzUm9HUWJeNA0QMrauzjLbDegIFuBKDnKEw1t1goj4IeMTF1/wMQFi+f6XELvJ/QX
 SDOGbXxkZafCChsb9luUjhzdwH037EOqsuFKUnN+NfAk+TScsBOsle4H3RUZXGtWedCcXaVE+eC
 n7a8qMWaWBr3nVx3hEZjMDk2dxmqawVHBsJos1xWbHlyGOIjvH5Bc4h4ul1+x43mgWwkkU3BNvZ
 pL9hFxvLwySDRvZbl6H49UmlkLc9UxTDa6Ph6DAm8BmsBMISprLDcDSH8VvFPLbssyyVwRLND7R
 TRyJvIB8CzTBAtuB2XZV3VSUQ6+uGpLqQd/abQmrHqqeWWjk/M+Dd99SYX6lZDBgtA2z4SWuTSB
 sXc+J9OMfBcep9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: shHbeRcG6HDz90khh2lTukbxpgbBR62-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfX3qbDHcP8tOLS
 lHoANJuvDwjaCokvxDtYKBQxVYCjYNr8KjTAEFNidHav1sZboJEuzxc/SgK4CGgnppUcNt87UXW
 L3NGZeMN4bQ2jrmhXX+2pPABk4JgGy4Lkv6/7FOOfzgb+xN71QorZ3W36uTUiEH00DlIgJRTOYa
 pk7WUQWXLHJ6l1GhQMtvvepxsRYQ8f9fx95HY7P13LWw7YZQJ3453iNr7brOudAxFl16HuRNyHH
 aLWd2jg62xic1AAuC8NJFlW+VuQW9uoiYO9VSo1ASeE3qMhmyVXdvaOs16RGtcvocSNtru3G+0a
 B3C9CUXV61sa9/rXxA4qBvENuvMtjMAGzMkCJTytwmwcqqDJ/InF5yM9Yeq81z7QnygeEJXLeRQ
 j3bWsC2f/YAOsfNvGsDfSNG1x/4s+uyXq9jYxxnA0wlZKjJiqgJlX9kgeyWFJnGoG++VPBbDpe3
 CcpoateHu2Po155qYtw==
X-Proofpoint-ORIG-GUID: shHbeRcG6HDz90khh2lTukbxpgbBR62-
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69cfc608 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34649-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: A2651394C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fwnode_property_get_reference_args() now returns -ENOTCONN when called
on a software node referencing another software node which has not yet
been registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENOTCONN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..77f4a3b00641bc9535ec32f8654ea7f547c34153 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -91,10 +91,19 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 
 	for_each_gpio_property_name(propname, con_id) {
 		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
-		if (ret == 0)
+		if (ret == 0 || ret == -ENOTCONN)
 			break;
 	}
 	if (ret) {
+		if (ret == -ENOTCONN)
+			/*
+			 * -ENOTCONN for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
+
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",
 			__func__, propname, fwnode, idx);
 		return ERR_PTR(ret);

-- 
2.47.3


