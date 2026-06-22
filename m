Return-Path: <linux-gpio+bounces-38815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7BFQGNRBOWq3pQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:08:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC56B02EC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:08:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LiE1kWRP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HXVfU1Lp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38815-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38815-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D62930B13E2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01733B5820;
	Mon, 22 Jun 2026 13:58:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C23B42EA
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136708; cv=none; b=onmdVjccMoNu8Eyu4z95umw1mxECSn9MglG/wqmH3ifk0eUcWoBV7Q85cys9Ojgk6mFQcyEauwXChp2o9BEu9WVaVmvd7aQNywSeepGt3NVQY9nuH+1kUNTBTo/BtNZ7KJmmHGaJUvcZnonDJh8mJL5Cqf15fw/yDGr0Lcr0S6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136708; c=relaxed/simple;
	bh=TNyV34+CyN1cw2JgN2LKD+wrxO0GVRRG+cBQyrWLn+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XssTGSY5aM6UEbZLEl+KOLuqrV29mxBzPuOnBRDZy9WQkFSSepxl7VHUMISEPspVytw9ZQQ5vKZypg35rcJ6kGZcyFRC3AfLQ3ZtbeTEAIJqp7eTDOmL2TNQdrFwMDwSX966S63NgsqTD/0unDJhPQdYBogNOnZjlG2GD1waqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiE1kWRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXVfU1Lp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGAvB1283664
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTlOlUBIwjxukfLePDx5Icoz6blAG/1e2YPmvVidKQ4=; b=LiE1kWRPP0B07G9L
	Ei0G/KlS+k8ycFq6OWxrhh/Vg4iOJe9H2xCkXWhVKJHeZcl9VO3au4rUX2YCl35x
	1GEyR1lBFHTGwz0UbdngtGf3GEKGHY4jvibvu1Q8H4Iahx/4dGgaMAoEV0EV/Bh+
	THGoWM2+7wmyytI/s2AYNULrGEDO35PIdumIr3L5lKiHO6VRieGqDOche7uRHWV0
	qX5Tc8ocaj/38cu1lTyxfmp4O1qlbGENngCgengqmQ4c3lJAQdABGAuguznh76xs
	S95ByymGM5Z/QlNBnlP8lNrL8ILe8YryyESUG8H14+1UGZ3Hfqw5Yw6vbsZr4aVV
	81qbxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n405rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159c4b210aso860499785a.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136706; x=1782741506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTlOlUBIwjxukfLePDx5Icoz6blAG/1e2YPmvVidKQ4=;
        b=HXVfU1LpUkme1PUPml9tTY1uqG+hkSl3AdnpyFubj4aPZg6DTxVTpT+uX1F0tmfXyb
         CPJeJ5GiX13MV+/IYuP7pd1wM5vQMjri5TnWbLaRx5Vk2auzlp3+VjxTxOQL7MuJsxIk
         1xfaW9kwnz2CGlnR8e3smksXM+O3JoUU66JVdCgD/XE7J1sXf0AHskOZBtVgsTY7M1cf
         Zqjo+0tdJwaxRm3zGOicJvgP/bVcBaQ0Q7t2/0XvL8otui7KHDgm5AU7OOPMN2aflfUE
         gznqu5mlPUpMdKGFrsJA+g3Z/H7+ZQL8UC0UAOVkkcpOdg+/VsnSmtrxUGedEW0LQgm9
         CPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136706; x=1782741506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTlOlUBIwjxukfLePDx5Icoz6blAG/1e2YPmvVidKQ4=;
        b=M5n55zk1bYVWbf73+zE7JJcV9LmQQigJSK48Zswn+G7asgEY0XbMuna9jPbDXyU0Li
         2crRHfcKwrQMUhd4DHr5gbxuCZpT1VWl0Q2n7/wOClnxgb3KhAL2bnatVd3fbPN4im5M
         dafrqmu+HPRWpkNZng484SuXnS0GfNdcGf+Ii+EtjOnNl2dS0Rgu5axBWbaYrcS260Wz
         Ap/19SzzMjAcVtuO8wjtrjYdbvLKYCMcCJXMElHpRcxJDlSdsqQsWJQrQYeDi3OYd0n8
         gD1DijciktBc7d7E5AoIfVCodS7rvJ3bVqyCNkaJ9QsSw8oUiOLPb1Eu7kj0xa8cnb7C
         6K6w==
X-Forwarded-Encrypted: i=1; AFNElJ9i7db5XPgFHGi7LoBTfHndWBE6rGeB4oqgzAxHPKCu1DJVb/7x00q+RXXmnHdNluMtAmw0x+IIg1Mo@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5jESQParN0QE8e9EfjecqvbFefZhGiTpOGAkLRgQTvMBy07T
	bwIbFfJratrHCKFk1ZfNxcehTxBcR8GQCS8d7wanNS58MtIIPjGmcCiqBiGz2/NC//8L1EPYd/+
	0Nw8HhonfZ/erh6VyVov5n77zyPAgb5L4bvQDxhDeAkzltCPx577lH4bEs976tUwv
X-Gm-Gg: AfdE7cnX7iKDxIm3vP0QO2IEy9Pzt36Izjxta8+rNRndxYUqZBTUb8Nt5+XrNxBGXbC
	VKMuXFHI5hV8ie54BlWAeE8EZrrIIXIJVItdeHnamzhVVctzVrac3q4jJMgEjZUw4Xp8GSVb94c
	z6GwWFLLEHBHxcpVODoz6BJKShLNnrGM/LzM3qP9qec9xmwiH7jZFJy8P+LmaQeuAsbq9R6x9n6
	SuWTTFKecvLAm9jqntbiGihb7Vw/BNNnLEBFNCdd0KAWpSJODoqt8sO+lWOu10leLubsqih+EOj
	vua8n5sBPk8wQk0ypa9jLdNEUl8BSSP4H+CIbBXUygSFC+AwemgZCyzOCUqxHJGjMCJv3e6hfuz
	OUHUulRFmkQaU7q42Pv4fb/Q4Kfxms0n8siseGTuy
X-Received: by 2002:a05:620a:6842:b0:91e:df9f:7804 with SMTP id af79cd13be357-9208d5e9cb9mr1756024585a.38.1782136705933;
        Mon, 22 Jun 2026 06:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6842:b0:91e:df9f:7804 with SMTP id af79cd13be357-9208d5e9cb9mr1756020685a.38.1782136705476;
        Mon, 22 Jun 2026 06:58:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238900sm208247495e9.4.2026.06.22.06.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:58:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:58:10 +0200
Subject: [PATCH libgpiod 4/4] build: fix incomplete dependency gate for
 introspection
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-build-catch2-issue-v1-4-be95e28f310b@oss.qualcomm.com>
References: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
In-Reply-To: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=884;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TNyV34+CyN1cw2JgN2LKD+wrxO0GVRRG+cBQyrWLn+s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOT95pBYCXNW/mulny4LIeJlrWBaDfWoMClXD2
 Le+1B8hixKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk/eQAKCRAFnS7L/zaE
 w8X1D/4zMlcqW9+oaeXdqfQcE68xXNBXd2ppeEhZLL+0pWFwt/r2VL/PMmMvtmwHbBXqrNY2Znn
 JrIQZOdPG76LAc2/kEHubAWC97e9mzaclURlelL+Y5CBNNHB7UzIV+S1n8CYSwhd8dxgS7YgKoA
 8/q8cGeGUIQJ/ES7KjgWsGGKRGqfGCqwfXQOITVY2wBOX3bHaTS0Ssjip5gkAXHcfMwFrCFmsZX
 CQIr9kS5bL9nTsU9OKahHSwoH8+/8nIJpUPsGdybhYNaV+EeYQ4gfkDtuN3gN+9LxOe5YDglJkn
 JmFMrus6ArNyTrzalTYgeW5rMDF/wpdmCwDVTqToandjkhADseuYQy1zUm09tJTsIZ0Z1PdvOg7
 UgH49z6KSU/GS9bJcWkl9PbqJd2bUziqqyjYY5P2DbljU9sNRV2qLjqrX+c7RC9fJnCFlZ5sAMT
 m5azltxcENAxxAhgPgWum7lE9z9Aw+zdlK545l449F8cMnQzJZ/81X0SomXAPBFxHJsq2pUy9oM
 m7zfK/hWFnfkgypVmHRCdCZZSxZrcah7d6XaK1cTyO+LfKctOCD6z/8QwPp8gfXFty4k1mdcOKm
 3h2cxrRye8jQZUcVp/XZNkdRimhSPrMuK/pOBIthRkDwvOrS8+tdCMdXv2BC/5yOYDifKoWMIEN
 pfS4dDHzeQ/HMPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX/EMlQEektkUn
 p/DDmObp6WpFv8tEkg49k5CDr//N2nlzG7Y2u8PlNh6f3u63mrnkZ5jXLUTwzoYmINlH9zo5ddD
 tOPVbmEWmv8j/1MQAPyFQMllOG3uVxo=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a393f82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yxqizE7zeAQEkMO1ER0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BJW56Kjb_gxW72QKpwVvGb0oKfqYBEEH
X-Proofpoint-GUID: BJW56Kjb_gxW72QKpwVvGb0oKfqYBEEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX+D0OJg/NhTLR
 ApjI33+mEnD+tJimYzF5CkYC12FRYLQlgyi1uAmBieSeYYO9AsAAFjneMPhdFzOUqpNAE1rtimP
 ++Fm6HDrTG6gUcG2te2y+Hp6SRXsTthW/nBIYFVtTE0zHCJCVDHayjrMcd2LuL8XF3ofheE4HVq
 SXGBiPjqGSKMAENMW/eRvmFSKyDbpXZnNEMp7dx2flt70ecKAXilCqzal4QTotOwXiIHZ/50nh/
 +bDHAw+/EGXnUFH/TQ5g9gZwTDdc1OXz3KU7thSqG9+rlN4G29LNsrzzmVs3u7A/WHKGhC9cHlC
 zfmFMGiTZwT4vYDP1dq2KmwpA3cYlBEQoEkbzxcQv7/xeX8OobfW1i2PRpuPoShC/xWJmXKHQGW
 F0Kpg15GgRFmzS7vSdiYoQyS4zrsS//HpR4WQK2X7g/lcxUTykjnjUQakU0XL3nS4VJ2qbFvsD0
 xrp3EVUJGL91genWcIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38815-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFDC56B02EC

The introspection gate in bindings/glib/meson.build only checked gir_dep,
missing g_ir_scanner and g_ir_compiler. Switch it to use the already-computed
introspection_enabled flag which checks all three.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/glib/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
index b8f8f53c2a4e564de1012ccb4979077e9813e7b5..c832b6abd3579449c471e7eef6649eb96a856129 100644
--- a/bindings/glib/meson.build
+++ b/bindings/glib/meson.build
@@ -90,7 +90,7 @@ libgpiod_glib_dep = declare_dependency(
   include_directories: glib_inc,
 )
 
-if opt_introspection.allowed() and gir_dep.found()
+if introspection_enabled
   gnome = import('gnome')
 
   glib_gir = gnome.generate_gir(libgpiod_glib_lib,

-- 
2.47.3


