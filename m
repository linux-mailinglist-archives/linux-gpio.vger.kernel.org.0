Return-Path: <linux-gpio+bounces-38173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X1vuDy4GKGoD7gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:25:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA066006D
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:25:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JcppJsf+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a1qSdXjW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38173-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38173-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5AD13019FD3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 12:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0282416CFE;
	Tue,  9 Jun 2026 12:18:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69396416CE2
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:18:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007486; cv=none; b=SV5+nCbY5/7xm5Q2k+5J4jXxNE8o+tDs2maSInB185oc51r2p/cVa2CgiFIChWVRg5mzoE2+PZ6m1ZMBV23rr9pcfBFyZbDNoArp7y1lZe7DDrErwr8hdwV9dN/tloCN4yWMRwdOJtQnf0edQPhiSeEQKGs3E6nQERRZlGnSNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007486; c=relaxed/simple;
	bh=nar0emxytebIupxX0BbQ+uIycAZ2+Rqi/ZQKsomCGH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIXOFLz/0uWqo+gdcz9u+M2Ub05lXzm/zmVzZkkSF+RPKXVp50udGIboTLjQuseMHsamONDUT2meDzF//A4PrduKbeLs3Oii9+sjwAqSy5hipC0MJzZt0pKIUufrGZfB2Ow4kbqx3NTyqxJ89mSkxeUsaiYN67ikAHaUdMyFTx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcppJsf+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1qSdXjW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnA3L518679
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 12:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xj8v8UtAuVxHyPP5eMrKQYg1H47s6EMB+vuZ2IQqSqo=; b=JcppJsf+NONaXIIr
	tDnak3iF9+3RNQBVxAxrIswjpXID9bWywsE+uzeIdykndzmNyPvhARUW1ZCilEnO
	H6FJC1yJy1jIpBOfOEr9yXqU1lHHKP4vdPAZqdluaWllGHyhBC42410qKwVfBfp6
	Y0tKPVo+UpR3v38nlLcwFGNil0lAOSDWNp3MUbwB75f8k7Zaoo9EBVaN7yK1moTP
	+Ng8R5JdwQlhCJtD4QAxhg802vRKWJtl9lsRUrk8XMOAV0Fog+aGL1/6hn/BJA+6
	bmJ/nXgjc6cCsWDAtAXIaMHfKEADHU4XuTRFytG5rge+ULXW2bBKqw7NW3kr8o28
	LNkn+A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ss163-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 12:18:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96388871d70so5091460241.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 05:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007482; x=1781612282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xj8v8UtAuVxHyPP5eMrKQYg1H47s6EMB+vuZ2IQqSqo=;
        b=a1qSdXjWv2kagopjDtWHu3/gbgETq4n0EdH17GeCpUrthnU5eq1IxDbQnxJ/seVZxS
         Er1AFoY7Ra4IWy7q9G5xKFaWgu8wtUByzsAc4TSNpM9u0DXzH+cisTtOeqfEFNLXMi2H
         WDlldFe8pjX8D3rxadlWQ8rify2D2cUdJmqHwjwjEexjsNUxgJFjylK47JtpkhE4Yc3u
         cTynQtnJXzUxUSE7pa75IHQiAibf28+vmDn4vv2b4HeGsihlVR+eBZKfpnGEtMQKOHHy
         kgnKuiMXJRJOWTLhSfMMucMo8irNaVxAtxVH8Y2t9jMyHPjcPhE84Gwa9pul3fZi3MH2
         cMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007482; x=1781612282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xj8v8UtAuVxHyPP5eMrKQYg1H47s6EMB+vuZ2IQqSqo=;
        b=nYB+WNU2Wv3l2H+rCfJtQrhUdgfapYBfKkmYJzglKkFibuL0wtnv39kc48SBgspSyw
         6Bl56t8WY2MK8gMZJ4SkTp1inGmik7oYONWUQsT9AOVI3S8L8y3UdmyA0TtSFyBiL8jk
         +XhRVNsFuwxq2a83dGllykY5LOovsWCbgvODuwKmeX0v5cpTrip0o82UH8aItPiFX96w
         86ZEnj4ENUpdQ1QH5ulE/u6PwTnb9bChvLMo87qXBuPu6Jif5TjKdCqpRlZHvmCZpaAk
         f/X0Jr9z2x9WJDjr1qz68lhqeRV82xlJUQnNrZ6lSCAgO0F3FZrxhTvkW7+C6Z1hrygY
         0zDg==
X-Gm-Message-State: AOJu0YznGzfIlvPL+kDzSFrwNEMpwSNFN7NBfLKiLz9EO5qiJGC7J271
	ssA+82jnJ6xbCSErYYGh2E0IZ9eBTnwB1l+lO8gkjHmlaL7aoqlbIFjTnRP3K+eWyJ/1T0zNYrQ
	AJ2CkPL2xYeszQbjRyfUY8uyKKvCjAyv7sfPJwdNhjnEzDl1z4TL3Qn9vOo/sNF+o
X-Gm-Gg: Acq92OEwNFWAyq9sSGoFzstl8ueEil0wn39eGMqQfX0nNZeUK6OkqWzlC32TZzO3mfH
	08rg5aR/gS6FtP0+QXJbagbKsJF0iVT2KL5WhRoNkR87l0GstUbq8V5iwY/W/YbkAIEkBEd3iKb
	3ZRmKMYMf6iFKVj+El8JugPOxSzxZtdY2yzilt+3JhnUqe59H+m+FRGSFTzoosODUeHQOI9o7AA
	un0Tc1bwXDbXSkQG7m/14nK8NUAHQa4xcCIptCPQB+AwY7QtIPs6pQzYayxa8oYV0nFhJqnb3ki
	NqZeEcJWEJP3IFC1XxMhpWvGhZGJKFPg/xAKS/LE7Kp8i6sVj2c/BxZVkePhtLr0tZoJjmwIjFA
	MqWiLC5JW+eRvsNxP3c5X9UhcV12Kzr9Ed+XI3bq97yoYk38TNCWkV3eZq3UsQQ==
X-Received: by 2002:a05:6102:3a09:b0:6c5:d55d:c091 with SMTP id ada2fe7eead31-6ff068c6a26mr11196574137.14.1781007482524;
        Tue, 09 Jun 2026 05:18:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3a09:b0:6c5:d55d:c091 with SMTP id ada2fe7eead31-6ff068c6a26mr11196558137.14.1781007482102;
        Tue, 09 Jun 2026 05:18:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm64099018f8f.4.2026.06.09.05.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:18:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:17:49 +0200
Subject: [PATCH 1/2] gpio: don't process hogs on disabled nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-gpio-hogs-fixes-v1-1-b4064f8070e7@oss.qualcomm.com>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
In-Reply-To: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nar0emxytebIupxX0BbQ+uIycAZ2+Rqi/ZQKsomCGH4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqKAR0tQopBif2mWl49zqdeI4AVV6JdmBmsd6aY
 q1ggqpAjnGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaigEdAAKCRAFnS7L/zaE
 wxXSEACeGSwxTNIr7aTOBmAG2ocYpClmGz8zMJfQDiVexb6C83qNqyG3zBD5eNOzCWzh30lSDzt
 A4XEdYWSNTVwH/STCdKY6X4dHsR6dCpHN6dfVWJaw2h+4iKZmcXzqFQJB/zIBuvnMqLE/polJZS
 7GaCvc0woi2JHaVJfAJVCO/Ph0KmHcfpfqu9ut9g5WlxtKelhJzNFlz6AsOKXdkkX2ujI5XtznA
 A2f9UNpUb3UQKfbzvvVM3EQdfTqodxRgINtx8qPdvGUlUfx80CHdqriI7a5XzvWqoCvZNrCHMhe
 x6/NFAGR1GUfWZpNV87ggSW7raJRRh8LpuvVHAqWWxTV4/c/1V7Rc4/AcJo3QkgjPiJs099KT5H
 p096IwhzAiMvBj3WqEnug+XWVtYZkApHht9FJXJA6arkJ2I/KyyRMaHnr26o6vp3CgZsNrrqDh1
 7SVbO2oUdBV1Hq7nN1Z6UDSmVBMfvEN1BXCRutUt0bbb9JVJPcNTAcW1drC/o4E4Ruk3IeXJYAv
 BNEcVG034fmwD/sh5YW79Xa1unbAwWD2GceJ9pQV2Qoo2AsujhWVP5eqrre7d0H7bSzoYTDqLaa
 8o+pGqQlUEeqmeeuIBA5nvSRKFAfRbLh0yGDk/jOvWo4X4Ar4IS/+G7pcUA3nt40G8eBzY5eEfw
 d4a3O0DQdIKcGOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX6sXnb9Fv4qc8
 aRnbQFX2MRRwP1d8gIih5JeXNgRe6Hv883ZQom0d5AuWjpXiCGZsw9br514huWKu352xao00TQ2
 dpdAWlKu7KCIPBFWyH1MYr9sisTG5XgUIHZ77i4g4ynwTXXQ1edTLcLSDop7/9POD6eSuJy6l+3
 iSQfadBGuaxkag52lNAw2d4nG7BNC8jGsvu1OOskUJ8zYzteXc4zJflR+CTS5+206tIczJXAHou
 b8Y7L0ovT9EVKKyMMzPGLE780qSowArA1b8Wgo0T6AlOAcoK8tSoofuu7IVtTQBJ57VNtg/ImId
 MNxxDVh5KVfxDNHXthxGQLBxT9FojXbDxs2mYoRK6ooJAgHTNSC5FO7GFJJA1xk23N8/YLGVDcI
 km5r55/o38gaj1ZoK2NzrDWFLCfgfPuqNF4sWAO5EiBTfX4NMWXdorxkjvuSHvHrCXk9a0FU2sz
 G63q+yvMYZ7XcXGdznA==
X-Proofpoint-ORIG-GUID: 2JQx4VVW-cu2eXh5bYvJA2Mj39LdPT3w
X-Proofpoint-GUID: 2JQx4VVW-cu2eXh5bYvJA2Mj39LdPT3w
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a28047b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=3oFxPOZCAAAA:8 a=EUspDBNiAAAA:8 a=ksoNOFOTGZS1-H70g6kA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=LnykDHEuWDBM7K51tcvE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38173-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:mika.westerberg@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFDA066006D

The core hogging logic uses device_for_each_child_node_scoped(), which
iterates over all child firmware nodes without checking their
availability. Before the code was moved to the GPIO core, it correctly
used for_each_available_child_of_node_scoped() to skip disabled nodes.
Check if the node is available and skip it if not.

Closes: https://sashiko.dev/#/patchset/20260608210108.36248-1-dan%40reactivated.net
Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7bb6f114d64d9ce3eb930f1d79d0224bf7920c37..1fc7ee9e1158d21f7c75e6cb95c33f0af44835c8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1052,7 +1052,8 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 	int ret;
 
 	device_for_each_child_node_scoped(&gc->gpiodev->dev, fwnode) {
-		if (!fwnode_property_present(fwnode, "gpio-hog"))
+		if (!fwnode_device_is_available(fwnode) ||
+		    !fwnode_property_present(fwnode, "gpio-hog"))
 			continue;
 
 		ret = gpiochip_add_hog(gc, fwnode);

-- 
2.47.3


