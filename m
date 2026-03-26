Return-Path: <linux-gpio+bounces-34213-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMDaCQ5CxWkU8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34213-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 15:26:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6E336BDD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 15:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCE2530060B0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 14:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028003F8810;
	Thu, 26 Mar 2026 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuObGuZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSCZ0AEh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDEA39184A
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534713; cv=none; b=rhOJPChgGMqEgLGoXBCY4lWW2KTm/4NUU+5sQ9zDqt9+tKZ+xv5QYmcW+2+vR/eZ3OwDRwZXRUxRWVlnDfS+ldwpOawSE5mWB2D1CfpWXWe6QHMztynqOaYppGfk8q61tym8M+KHXmt9foYY28DpIQg4bvAiqevyc9C7upmeFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534713; c=relaxed/simple;
	bh=621EXQPHHp1oek5UIpVZlw/H7Y1Xhl7Qy8Kc/NSLT2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m9NYn7e6keezUWTl18qTmh5SKYJJhsLEpixxN9HJWtduoZysD8uEqqSHPHDY8bMQ7ZyIGBBl9sD59vX1YlgJg7NsSAVTNvqf6D+jG0CoBjRPY1FhK28T9n7tpTpC3IpCRw4SRScSIRqd7Q2v43d01avEfnfm2mzarY7bePMTP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuObGuZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSCZ0AEh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QCsH6Z052332
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 14:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GRric16bnLzc3ebet/NeXU
	0VKg20Q/aQFLGLCvrJZJ4=; b=MuObGuZ7xH678q1Be9ZSZOINz+AadwYZ9kFmbh
	Ehvpca4qN+8yysO8SP5gKOuO/4jSL2pMg45ks/6LMVImkaStr6xsB+7aMHOTxAQ+
	EVTG9rJqhm8+z4UkbR0rcyXK6oahAuMpE470Abg7m6XZQ4nGSxNXdc1D+zyZbzoL
	cC0Q44kISZEMl8dZNGC3ORC/P0bKH2JIz3rNPXl0aLLlXBdWMZ3sztR2V6VsImjr
	V0lcBDdt+2wKs/cBn/U9/jalBz0o8d3SoWupRWYgvj+Nn5wW9bybE7Vp9COM/EDP
	HZy5NMATU7MTRyu20o1e1MFIjayChx0u1mCdX07BTzzYnIVg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t351u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 14:18:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffaa85b95bso1469354137.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774534706; x=1775139506; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRric16bnLzc3ebet/NeXU0VKg20Q/aQFLGLCvrJZJ4=;
        b=jSCZ0AEhCGG+03nLOFa4ojeFRcyaUS9i3SxNEFKtb4P83/Wk1VRjakoM7nppEdO6yR
         VQPrZO93Kb3CBT05j2+JG+BfAn8/hDU/z6rYkpaSQPocEAvXkrvNGbHlqe4GYmKy/RGv
         CSjfQBJreaQzM1kmg65rZh2MJwwga5AYSYP6gtb39KOsiKHcMXG96cKDZSe2RAdBKePX
         qNBMfCs8g1Bim3qm+qccpIDraReIQlZMYNpGL1lY6Az9MXCM9of56umpm9aG28EeQOlB
         qHnoPyP3w3NqvDyI4cJ++d91ZWRArBR5ISv6qFo3wAEXs5Tr4ybGWxhtrBdeANcicbyS
         ptOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534706; x=1775139506;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRric16bnLzc3ebet/NeXU0VKg20Q/aQFLGLCvrJZJ4=;
        b=OUpC/ncEQJshBimjP7XiTWV3H34BeaXFtK8qOc6bwRR0bIXuJT2+XWeyayw38t2bax
         WxBv4mHMy9wV4GP995EcPvR5mr2TPsEqbfXvOiHjJGnv6Rcgk3YEkDDGqqFUbyTCPHH3
         jNs0A74C4fEqiOQfPwkWmk7+AUnM1hfAh+PYHb20ANNQ69IV287OWOmp2pF69ZFicloe
         JnPmqEmw+g3HQd3rlG4rHkVGPvW7Ni8Ex91rMhCjuaEsTitP5KNBdNlOXmEigRXgjLRv
         jBKRp/wr3ZmXyfdx69NHQPXOwAUuCfS6gNVS8Sv3RzWYeFxVl0wGKMezEjUNpIRbvrW5
         okwA==
X-Gm-Message-State: AOJu0Yy/AjZCV6Pzf3haobRv9ps1pzazcqE0fGD0GK9lpzNmUVZyk1b0
	OYL1q9ZTI1Atu1YJ0eHi33w/UjlA7FKoVNPkDoc2o8TP/uAlpzlkBulaD6RwJfp0+mKN7faRfq9
	WQrir+CuwHSobtcfF9slPhu2y1v1zT26y5LVnmrGeyC6gUcbRBiq2mTE8DKZzsfZk
X-Gm-Gg: ATEYQzyxVIKchQnCRxT6Ri2n8lLj9IJDiKaPJBKnyZ5y2r0sinI7qGoEYwVXIzzF9UI
	8xXd1Kl+l61TMH52/9y48Oup7Qh+EneQyaUpUCY293es6dkd6euWpm1LCVtkmSgu307kgbkd2br
	HRwc810zz/gekD6jhwPJVqKK673A/ksZ6XOBcsOjCoc/iSWm9o7UUNa0YY3fyGwXDNlyHu0EP2g
	wKJfWh4GcV3EtXKcNuB52NbHwoddVdXQslHNcd758UxaGHgNqStF26ZPy7OK+9gWK4f1ofau67O
	5aFUxRRQJ2yZx2CmwFqABU5n6km94bT1mH+bVhsUL2l2Ln0bmhO4/8J8m6yXHfkHfuU0+TZ3fJ0
	YB0Z979VgmYI3fBmQ7c9t29yhTYS94gfdq4MIELG2rUmeQF2CX6y4
X-Received: by 2002:a05:6102:4b0f:b0:602:91f2:6af6 with SMTP id ada2fe7eead31-60387292b42mr3666438137.17.1774534705905;
        Thu, 26 Mar 2026 07:18:25 -0700 (PDT)
X-Received: by 2002:a05:6102:4b0f:b0:602:91f2:6af6 with SMTP id ada2fe7eead31-60387292b42mr3666405137.17.1774534705399;
        Thu, 26 Mar 2026 07:18:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f36c:4a15:cca2:5268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722ca344dsm28405845e9.12.2026.03.26.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:18:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:18:18 +0100
Subject: [PATCH v2] gpiolib: fix hogs with multiple lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAClAxWkC/32NQQqDMBBFryKz7ohJqpGueo/iwuqoA2rSjEqLe
 PemHqCbD+/Df38HocAkcEt2CLSxsJsj6EsCzVDPPSG3kUFnusiMzrH37HBwveC0jgv7kVBZVba
 mbFSXPyEOfaCO36f0UUUeWBYXPufHpn7tX92mUKElU1tztV3WFncnkr7WemzcNKUxoDqO4wuwB
 k8yuwAAAA==
X-Change-ID: 20260325-gpio-hogs-multiple-1718d38c1f5b
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5124;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=621EXQPHHp1oek5UIpVZlw/H7Y1Xhl7Qy8Kc/NSLT2Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxUArTpjhGsVZVIEntVMWwNw3iQyN+Y78frkYb
 5UhD+ibRAyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacVAKwAKCRAFnS7L/zaE
 wzl6D/9ldtf3KeWmDokFrdBitjh2JJKcql0g7eFtpgGt1FVnIOTbZOA2FiONBfwgts4iz8tU/KR
 WRUJ9ZtFn/JQGf0LHfMlm6tOOZYNR6kJ5n+u9DlK3xE1YPuiGbJUXxUAty/NxZj7vYu/RTmlmEj
 6tAaHH93aT9sr2SmRIy5QHmVHXd6rgEJTYGMdvsZB6nEohH/udJQfbnbEHPxgVvxwLCZpLgUBTG
 u2iycFLnJT0rhJdW1IgXRJazcQ9C5X3osncY8+TkKbGWnI9KOu2rL2q/Mr7slrmOYfZho/R6A2j
 XAiCjt9uoUN0fpNkSliZ/N54XIUbYaSCtsEuqOVqq5o2xyqd2hd+hnvPm8pfg59bsq5DHlG9Q55
 Msdayck32M6uBLIEIAWxBGItz9E1dY19ldmIwoFNfpkXwtVtopW85SgyEQfilgaZM+SLgVRwJwy
 7aMk66JgeMbFGYPdWyNLhfF/3SF7Bi8oc85P7tZsY2Yu9HQ6hq2jT9J5P3a/IOBSKVchZJ9p0/T
 TvbgB5+8sOV8tfconne9rp9aMStaBpFlXC7W9Gc3ZyN6aGiykRODRcyKyf/YdTCDM89TJRUc6LW
 qYVTVKk04aYGnTOIWig5jDb202Xj+uFESABrtrtsHV+ku1N8bc53WiWB1Go4SlZspdAeVFBHxut
 k3ulxNiAy25pS4Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c54032 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=tBb2bbeoAAAA:8
 a=BPk_T5_A67p-JLsZVCIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: UuDaZOXrPFAWfXopVMhlkAoppR-LP8VZ
X-Proofpoint-ORIG-GUID: UuDaZOXrPFAWfXopVMhlkAoppR-LP8VZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEwMCBTYWx0ZWRfXwCzabLQ/bxqv
 KbnOq/b4vqV5idD2vjvbY9mQQGn3v4IqtSnYPmJcKIQ7NH3Kzf9avu7IW6vw8JiT34X4yWPFp2G
 lg2AR/+fp9jL+KDDgfJhBJ5svPOkXDuL8nIYwPmB5HKqOKfqGWb9z9UPG5PXtgKW3IkMRHlsWOD
 Z1lvKwjOwQhv8Rn1xHcRwM5HswuGm4IyPLSMAsnn01m7cDRLrXSJf8m2T63MmE09TBvXgccdsrM
 J4L9YQ7TRNrM0c5MihybyJJIzsIxWnwELYf467ArlD3enCekte6UhP8MZMBTbozqifwv5V1Q6HQ
 pIAPZL/WGZc9vA3uy76YKRow0Jl28qlo4pQNFTGioEhU/iSxm16gKmMBrZwE2m78ltA2L1QoXhf
 /xQbkvNoYLhkLFYSKg9WBNOGfNacvRDVGJ4+YBeYupq5Pj8a84CpZoFCv2REsEYBHDyhmhHhkD6
 4k6p6dtG8kHpzXoWblA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34213-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFC6E336BDD
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
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use a default value of 2 for the number of GPIO cells
- Use kzalloc_objs() instead of kcalloc()
- Propagate the error number from fwnode_property_read_u32()
- Remove special cases forced by the lack of default cells value
- Link to v1: https://patch.msgid.link/20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com
---
 drivers/gpio/gpiolib.c | 92 +++++++++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7ee45ccdf1265e94b68fe8fa0d10dbc6adccd93a..cc36f1d1f3edb2b5c8609ab5ba72b23e6db480bd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -938,12 +938,18 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
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
+	/*
+	 * For devicetree-based systems, this needs to be defined in bindings
+	 * and there's no real default value. For other firmware descriptions
+	 * it makes the most sense to use 2 cells for the GPIO offset and
+	 * request flags.
+	 */
+	u32 cells = 2;
 
 	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
@@ -952,42 +958,22 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	argc = fwnode_property_count_u32(fwnode, "gpios");
 	if (argc < 0)
 		return argc;
-	if (argc > 3)
-		return -EINVAL;
 
-	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
-	if (ret < 0)
+	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
+	if (ret && is_of_node(fwnode))
 		return ret;
+	if (!ret && (argc % cells))
+		return -EINVAL;
 
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
+	num_hogs = argc / cells;
 
-		for (int i = 0; i < argc; i++)
-			gpiospec.args[i] = gpios[i];
+	u32 *gpios __free(kfree) = kzalloc_objs(*gpios, argc);
+	if (!gpios)
+		return -ENOMEM;
 
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
+	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
+	if (ret < 0)
+		return ret;
 
 	if (fwnode_property_present(fwnode, "input"))
 		dflags |= GPIOD_IN;
@@ -1000,11 +986,41 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 
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
+
+		desc = gpiochip_get_desc(gc, gpios[i * cells]);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
 
-	return gpiod_hog(desc, name, lflags, dflags);
+		ret = gpiod_hog(desc, name, lflags, dflags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int gpiochip_hog_lines(struct gpio_chip *gc)

---
base-commit: 880e76d276421113e3017d1b950bf932dc4e3ce3
change-id: 20260325-gpio-hogs-multiple-1718d38c1f5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


