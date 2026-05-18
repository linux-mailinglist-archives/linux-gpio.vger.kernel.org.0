Return-Path: <linux-gpio+bounces-37046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MtKCsPhCmrU8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:54:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ECD56A1E1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6C9D302A19D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24B33DB638;
	Mon, 18 May 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5FD+KkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8K/4rlk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654CB3246F0
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098014; cv=none; b=MGp4g0MyDUXraaU+jAg3ND28Zx/dTX4T5mQpULfFVd94RDe8aDZvXl/rMA5s7FNSnj0AC/q/nGft0GmwxmtGCIlO+cS1r+LPO0IF0PHcvuvyX+D3d85fbhakB7a/b1Q0tkCtWsWYH56AQlNWbK0xQtOl5+G81TiyWrzHiHwdDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098014; c=relaxed/simple;
	bh=zYq15zJaTodTUUxa4K1jAJQsNgsjMYf4I7qct0aivN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omWXrSXgWBUZae7dB5bg/FtGCb0xZqzGhhJTsl7tmHFGB5Hv5SK3B3HbFLHzeM8bFtBoPb6pbouvketpsyXXv2PGokUUrhaS7DupqO3LU4k/9EN7OqOMmWoAM1xpDXU3U7Guck9+FNH5OTFU/t3Py8m+f0HVOcTbPeqGv93g/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5FD+KkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8K/4rlk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I86rBr2125765
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoVaRtlmXNSQnATwtOu0DsJihkIy/RSq0X9Vt0SNFgE=; b=T5FD+KkHSwns9xA1
	F/8lsGdLvp9/mpjEPLa5LvOdwWo6+kXUvGqXWg/1h3stUaklgSRdfgwR1QnTVXrs
	YrxCGqogSMvsOwlKa8LEHWNOC66ftzwJtbs1/15ieUBHPcMLFty/5vXgBTewgjhy
	ItZMTumZgqqDIe2FZSb8eB0J7tq7Gt4zZ1fK8iBvuoo0NMyr+cKfujeeSMbrz3Yg
	s02YSHyRynmRSw0F2boS5vG8K0slp5d/gjTr7BAEMRyC9c5RL5BYynEpKnFrs6lU
	AbX0QnX49/TKYQzL61KOzAt/OdZh3uGgpJ124uX6j7ZqfyCmFx42nAwbwLpn4rXk
	Zq5gFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqwvmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so61358891cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779098012; x=1779702812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoVaRtlmXNSQnATwtOu0DsJihkIy/RSq0X9Vt0SNFgE=;
        b=e8K/4rlkzKntD317CoZZzxKK49FOxSchFd54kxrmIS6kpVlMOIkqU4OT4hhP7M9KOf
         PRU592gF10XlbG5uiSv8yr9aRz9TtlGO804v0ZF1hLKiBt4NFvHzYQSZCenqSlHsdYF2
         b+VRswsBBfLApNH+kmE16G10mZorQo5kE8/Av/jVswxoYOp0FWlpNv/IcyAfZLHdVuC9
         dIXN27OZNXsjwjWWp5M1SLpnXUnMCKKDm6l0yaE3PDaX3MHz1V4JV3RvSU1Yx3pmBimN
         6zhFFckgtlhdl6uY2AZfFs46VMcv0EzGNSetoxG+mmw8Oydei4YxudcKHlKsJLmRANcv
         wjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098012; x=1779702812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hoVaRtlmXNSQnATwtOu0DsJihkIy/RSq0X9Vt0SNFgE=;
        b=ckYv1hql9KEGi4UIAj0zgqNUkD0ncH66B76GQhce9RODMSPektDLvu6TL6VhuKWBXH
         RenPVMcxOcZpCExc8x40xeiAz5u5hXGz8XdIe0JU/PMkFhOdRDv+v7RFxOycDLdWgX/1
         6VSGmjD/hT4qJDyzHiqdnUy6qr/8cIICNONzoKoaBAAzBuwhEUzMiXp/KPJ9DmBPFyyr
         OSzbcWOLo2xmHroM75zqqG7SIHoeQipqyEmwLn1AmbLM1ElFW3GvYfrCGozghgTokeNl
         ZbzooHCgIlop3JKBnmaqIkQiqtQYRqxZ1UzJDfMZ7PuxIPTHyLPnOH3UmncoZQ2flPSD
         Q1nQ==
X-Gm-Message-State: AOJu0YxVxOoBS3sNQOQRGdTBv9p6f8d+wUaJucJxXsV1lIalvIkghW98
	/TjucLnK2Iz3oPv3wSUq8J2NVdkMUjy1+ZXcp1r9Oen85Cg4rwgsHjF4+tMGtVQVmulhhnPnwkv
	nvhywVC0dJB4PEvIILqqQjmFJQeoQ5gE+CvPYtfun2V7T0zsPaS+wIt1NBQHgmqwH
X-Gm-Gg: Acq92OEWKKlwQgkE5Jk0maEzi66zRoTUTKxw9f806Ft66qAVbf44ow6DIO9/i1nDlvW
	TViXqMsNlYZ+fnglKclajfys3LuE3APu81HgmEaVcIY2zhWS6iFqmgiXOuwWbR1AaV6rqG9l1+F
	zkLBJvaCwxzVuJ5K73ilvlf3aXa2egnRucLUS3uoZk6lz2zRSDsrLNW6O3AnS7ZtKzh68h0wHgJ
	Z6weTq00Eucjo2fSa4rwbnRdcBv0eP5rMuy8jPGmjORkdLKv9cVKct7hboJle6hMXrQknZEV0rg
	1tXDDQj262MFi0RvKa2oeKdVxtQNcJW4FKY1+2uXSkNPHZkBW2BgofsQHc1mVY1J6tTSA6zryRc
	H85e7FLTG3elqYFOWBg7A7ceHiWpC+uDjF2YM9jzI59IlLAblPg==
X-Received: by 2002:a05:622a:15c5:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-5165a219b2cmr212818211cf.45.1779098011813;
        Mon, 18 May 2026 02:53:31 -0700 (PDT)
X-Received: by 2002:a05:622a:15c5:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-5165a219b2cmr212817991cf.45.1779098011322;
        Mon, 18 May 2026 02:53:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm35199301f8f.9.2026.05.18.02.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:53:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:53:19 +0200
Subject: [PATCH 3/3] gpio: virtuser: lock device when calling
 device_is_bound()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-gpio-dev-lock-v1-3-cc4736f3ff0b@oss.qualcomm.com>
References: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
In-Reply-To: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zYq15zJaTodTUUxa4K1jAJQsNgsjMYf4I7qct0aivN4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCuGVFAfy1R8b7zp80udEvExX+tzyGYNwYb4ow
 eWjKt5b0SyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrhlQAKCRAFnS7L/zaE
 w6liD/9VVoZijfRfDMOedSOYZGHjK14G4hsHtlfO0Ow+n69b7TN6/uni/1K0WNAsXrWg9P1C5Rr
 fp6FEYzeLvRrc0Vljf3uwmoOc3Hq3oF/4auLl9fQZchacKi1MYIxcyMPx1ZymoPEDTD4U33LiNc
 LxaasLWe0Iyf5sRmBtFuow4wFOMDLk7FMPPfkuJBQcbzR7HLsuba4V1IWvnGED+nGvU3fNO9DkS
 MFHB4z+VGJrVZ8hulx8lv9Z54b9uTOGZ/GplfQ6VEbeLy235j6sdGd0eu4au1HUbRGGrWKi/LAA
 ln21br8IES8fF2JewKSOALCcb0BcTJEWo7W4qRtEA/K580NPF4LlXpD5k0UlI3Pm1CW02mOCGDg
 erBNw5X9Bd8qhppPK1plyIkix3aBloQvRAuw3u3xOWzmnocGqvuMapinN5nb96iRd7SVoUuJDHo
 gwIaOPoPz2MYCvCrUbT381nz9TqnRNFThkAebWKOFO8D6AfSX+lefX1gavUkywi8uUTNwn3z7/M
 ANvDuZ73tY6/aDNGyx+W6My3+ZucthfyTKXjPd/DC2HL7pSb3HkTbKhuO2FvQjAKppF17e4bF7f
 sO9npB0hXkXC7dSx84KFl8mxSSCj5xFTTvWb4pxmJBxqzttrA7D6+E/t7RX+WjyLlp+dNqnzGfY
 /yFgt4IZ/Qo8ZLQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 2gf_zyWZb-c5zUkWZVwpBun6OtDtlChW
X-Proofpoint-ORIG-GUID: 2gf_zyWZb-c5zUkWZVwpBun6OtDtlChW
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ae19c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2JntzmVzRHTdE25HVRcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NSBTYWx0ZWRfX5PnTkxBjZfM1
 PFLO3g8/U7aX14XcGzBZkuKfg0vKE+EPEZ/uhoXbb/6AXBvGyy3bnSLll4kBLr3YdUXXCJpfup1
 iwvndC/T24LZUMx8n58685S4heal9a16Mc2nf6L7O9SXoXtYwPXVwatyXhwQhh/liI4adMTeF+h
 dbvQ7fyc9kDA0rOQQkrAnXmMI377XAXSyRLcuEqz2NYJXD8xi151Q0rakLObSNhV9tKLozPsbIB
 7c+SRU8m/WBRimqNGYjIllb3qcidKv8oU8it3OHQS/lRJh5fizHKUYj7+x33mrpHW9Vdb+YYSX8
 eb4lykbK6nbj8dfpxph2YmMAWIk3cOW6CgesKsbmtRmSk4FmB2HPZnEgedbmt9g+OgX0U+CBd/x
 10yZWnHLeB6ErXLjnVuynTa6qluwpWwOuUuholBbdATvKbUMIyieqCa9bG5YZZ7zsq/EYUV0SGb
 XfW/hXGvAEBhO1hlj7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180095
X-Rspamd-Queue-Id: 94ECD56A1E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37046-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The kerneldoc for device_is_bound() says it must be called with the
device lock taken. Add missing synchronization to this driver.

Fixes: c3e2a8aef28c ("gpio: virtuser: stop using dev-sync-probe")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-virtuser.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index fe0eac920ced323926b2bc83ca0a2eb5f85c2154..128520d340d46cbaa36b492cbdcb996bade93d77 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1477,9 +1477,12 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 	}
 
 	wait_for_device_probe();
-	if (!device_is_bound(&pdev->dev)) {
-		ret = -ENXIO;
-		goto err_unregister_pdev;
+
+	scoped_guard(device, &pdev->dev) {
+		if (!device_is_bound(&pdev->dev)) {
+			ret = -ENXIO;
+			goto err_unregister_pdev;
+		}
 	}
 
 	dev->pdev = pdev;

-- 
2.47.3


