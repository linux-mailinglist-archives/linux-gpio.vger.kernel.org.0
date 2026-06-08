Return-Path: <linux-gpio+bounces-38105-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gbgWBBzfJmp6mAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38105-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A0658038
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JIeL+c9m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=buHgNgfM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38105-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38105-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7BCC331C04A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1733CDBAA;
	Mon,  8 Jun 2026 14:48:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD23CCA12
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930110; cv=none; b=pX6BHsuH8wgHysP9bFr0+f+FDLlDZNWM1VP6oHGSUA/6Dlc0KO2nJfeFLhNIroTWDeAl6jXY0h3gYIWfDeY/IoZoi710yGgVZh0QW+mc3Cu0pm3f2WdAt5cgmled7wxuG7z8NPiPJNyHwF/sbV9jxCH/pElQccMsHnMnyFy8fTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930110; c=relaxed/simple;
	bh=144k4TpTiXRujvJWnxRDZ3iT6YjslbkUI+py1UMMXxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEDx9SP8aiWTD6vq3MYZfKV1Qkm7vZmeKwHXDrQ8V890gsnsK8W5xeWTLVGKyoiZi+fJ35r9X4LUZm8uyU1lka2M1egqMdxQN8nzoIGIUr0/Lhcu82QxsSloZhVwtdmWMT+druGbbEqMns/ogpKpmoEx/EPhhhRiGM+a4avku6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIeL+c9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buHgNgfM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY1tv3872737
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+c1FTLxAkF1ltoFdVRzmknStFJT+dtOU/crdMPUYf3Q=; b=JIeL+c9mBECdM0CT
	xCENd3qgAJ9sdb6g1SY+ijs69mb+ZJTaaX/V/GzzWadWUyt7bwJHtKtS6k59BBZS
	w2DxVEGct2W8kmiaceYBIq4stSpWDiviszJbhkOMBTQttcenKqghfLSdr8YNLFH+
	V//fIanV+GuClqdJPe0icYJ9M12ZYL4EcZPvHMKYYqk57axS46D1kvyy9JAcYebK
	/vD1KwtwfMtk1P3Lxp4su3YRfq8hgCZL0dvhicSpibDB9BJAC2ssATXG1tSN6GP0
	PN3HXH+MnLEhJEijjF6TOi9ao+LTugWlnQOSjRmOwmTCoPsT+tGGDMbSlhgOq5ph
	paNbrg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enupth9a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:48:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so5047846137.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930107; x=1781534907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c1FTLxAkF1ltoFdVRzmknStFJT+dtOU/crdMPUYf3Q=;
        b=buHgNgfM4GD3WVmgv92cYoS/VOPKvqSzS4zN3IRLIlhX/gSqPcJtIUxO2C7zlGgkwH
         o+wIqOhULsgWqkY12isrXLfQ0qy+3hrN18XOI+YC7WcUwdsa/uKdhHjrHuCQesxG+QQI
         oMxzgvzwHeaX1LBvrRtBZAZt2FyCZdISlb9Ft0Zmrhc+gJYQO+OTiWaw7LiGhsJRFDL0
         LkPqvjDYfrvrQz/CoS8fREG+Xzi0e2sHE4fPKlXDUR+y3caBdhtvO6IT7pyFJ8gAZH+h
         j3WnpA4IVzb5MKNGjvlkV0AqbqZG5AyYzWmnp6r4lQchlPEjQ0bf+hWJ+S2dfkhcLk01
         YFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930107; x=1781534907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+c1FTLxAkF1ltoFdVRzmknStFJT+dtOU/crdMPUYf3Q=;
        b=EmAB+IVQaLpyN3m17sIAk/rY+y7oNfPl2Lz/bCccHeDBu5d4w90z+e6EUsC80eLm3i
         x5rtjaKEVVqMs3GGBPwDoRTeWOzuQEMzqqjw2ieWpJJxIAXqSiDcPGnoxS8l4TIzmMhn
         gODginA1jW/eBXVJcfCUjJPwBQlYtqaY6XCm/w3jwqaabZNLYYxhRSVQbakj3aQFmpkT
         2zSRyEQDi4q14R1L2qcoD2mCqkGukHARJi8pVW79M2e9Yocd5TBWIA53E5GOKq1cqjw0
         qTTln4KKLa8ZCZzDahGdL2m6FUqF5eSAmXxw7jfIN7keQQ45kaxjLDbOY5kgAv+WMw2N
         Zs7g==
X-Forwarded-Encrypted: i=1; AFNElJ/H7EihMNB9jyPiZbyNQ9c+rHRWNbcj0KKSBajKrqnkfiuwqTKy1x3X3NYnNpGfI5z4eWJUyEpmpovO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/f3o1qFiqqXxTarkt4L3izbjTnhU1V+FaOsjAnZW5iq1Ewvu
	qgw8RljYAJYcx0sP2BnViqNAS6HRY1cVudgYgL6yY0CkcHxgsu9K1Rsv20jnstknQ+FkrY5ZciI
	fQqYonUBlSUXUmjSAaxqPPrB8sZVZ3K4wcQfayUqvjFPr6ciZXeAFOSWT8lmlKyhh
X-Gm-Gg: Acq92OG0QxiOnLOsnVg6C29F2KNFnNZwdNjwnwC/aDA3m3I6vlmFry2GRMg+HYS4uva
	4LVcIKSA2HZbPKZI4zV/xBGG+IOxZOlcEF3/b5y1GYRLhnAs0IqY6LLRq3bywuieHuWUh/TFrAZ
	IFyahLI2+2SIvz/CC99JfgsdswX1KnHTjFihKDme1EAruN2neE/Sogkq12dt24+kODuBtBBRz9A
	GSMrl9xREn/a70wx2n2t+IpazDDPWtm85jQ9vwZVKnKBsPX5OoclKOMnEdIOh3B+bwPJEC6VzTx
	LimsQpQr56ZexN+SdX0mbx6jMrMhKCaEyDKCyLwVcGgXrmOZTYXuLzgB9iN6X50qLJtK9HryaQv
	FsLY86rTTnCA4n/UOT5L55fo8jLy/hB03bOi6o1xX/yW0OtMHxSLiZxqzxpct
X-Received: by 2002:a05:6102:5694:b0:643:80f1:350a with SMTP id ada2fe7eead31-6feed1ac3e0mr7887985137.2.1780930107046;
        Mon, 08 Jun 2026 07:48:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:643:80f1:350a with SMTP id ada2fe7eead31-6feed1ac3e0mr7887956137.2.1780930106646;
        Mon, 08 Jun 2026 07:48:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm462705665e9.1.2026.06.08.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:48:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 16:47:52 +0200
Subject: [PATCH libgpiod 4/5] tools: reject trailing garbage in
 parse_period()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-more-pre-2-3-fixes-v1-4-577a5ba426a5@oss.qualcomm.com>
References: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
In-Reply-To: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=144k4TpTiXRujvJWnxRDZ3iT6YjslbkUI+py1UMMXxM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqJtYrG91hk+XuBEDXzDCklUxubmdur8WvKNH92
 2Vygq4vYW6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaibWKwAKCRAFnS7L/zaE
 w494EACYRalt5LE9n7gJdVzd+WBJiqHO5K2QBReZDoDJapicv/vzAQKQ5Oi3QcPSEt0muKns6kF
 HBcB+MzeDRyeMoLU+RDbfBlr+BBrxTFVQPHSUcel3vPafzSEhcQ91+HTTFjTrR6Mez797/yJJZl
 X5PRVofI3xE6NvDtHha7KLlbEsWARcI/qmUPhEangKRQemejIiGlqV9k1lYqoInlrzKPB8S63+m
 epWpctJxPKgvDU0uk++KPZVLRt/YXNJeN9gnjXKCGOyXemfPSbq8unEbugQpx+0P78ZLWFOkCxU
 48KoSuyXNMj49GqOjeAFK7v9++lM6X9Y64Ej3PjxgZFNQVyA3VjMQHlzdIwurN7tLLWSMimW/yu
 2uzxxXCWIuX0v01WdM4qes849sAO+MptvV4VNEPRIQeLlWM0MRU5oaCNahvgM7xW0S5cCAQtNg/
 R5gFW2jsNXdVZZPgXwhC6oSPh2tXLgqguD+nSUvjkp5rqa6NQBa1s/h+a1DZzB0uQ61CIxjHhyO
 dMtJ4fKxMz3yBpRwlru7+YhgKDo3dLV0zBNxyv3fBg+9hC9XltJffKOHth1MCI51Y48UzYpfbtW
 iEizMF3b9R3VcfDJ+94TTIKx4ogOEeTjE+GOEjCtmuhyW46/h0NAoYpfR66AiS32rNDmDadvXWS
 Z775dGQk+jMPlAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 1tVaxICMcm0Tp3VKNS57ZaOTe6odSIlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfX0nE+lBiTwdHM
 0a6uXKbQ17ycg2AL8uOGk5OpOpBGzEhKVHezwqfk9BVInJWd//D381dlKXVOjed3XwzyES4C66p
 JHhD7oe7hGr5u5TUQyPGkIxiWBXCaNPrJjcAyJIO/KerhG38nT2SWELsKk1dvCu8N7+SUUuVmWc
 e9tIGMHLyPNT6KpB/34qeXZuRW795azgjkPo1vV2PB/QpkOjuDm1durqeaqEo4F6gjJ2GNzq8a8
 rrtIBqqrnkcX0CVkYinydJviYMUwSbbDY4o+fhom6rRK9wIb+dkOD9sbIQ4kAgxJWeuGZ9BZlXk
 iMljqRkBTCHs27oUXNt/epHYqGM8W0Xbaw7jej77ugakH70QCzmGg4Wxp04OeTziGsMdt0aksie
 HTRGKEnM6FRUNPwbzH8bQXgJztxH006FgTJd3ooCeEl9QUd+5nFMnPuV+HKjFEqXeydjOv//GH6
 VKukoVsoRIh4qK6bnvA==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26d63b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HksouPJwOdveG7lc6rEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 1tVaxICMcm0Tp3VKNS57ZaOTe6odSIlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38105-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 896A0658038

parse_period() consumed an optional unit suffix ('us', 'ms', 's', 'm')
but never verified that the suffix was the end of the string. As a
result inputs with trailing garbage such as "100msx", "100usx" or
"100sx" were silently accepted and parsed as if the garbage were not
there, while inconsistently "100mx" was already rejected.

Require that the whole string be consumed by checking *end == '\0'
after the unit suffix has been processed, mirroring what parse_uint()
already does. All valid forms still leave end pointing at the
terminating NUL at that point, so only malformed input is rejected.

Add a test that passes an invalid suffix and verifies it's rejected.

Fixes: 6702eed1a5f2 ("tools: fix an integer overflow bug in parse_period()")
Assisted-by: Claude Opus 4.8
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpio-tools-test.bash | 11 +++++++++++
 tools/tools-common.c       |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 00739c5a4008c636b667cccd1cdaebb624ae0ac8..2a39133045deb5f4f6afb3d039d0436ff8340778 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -879,6 +879,17 @@ test_gpioget_with_invalid_hold_period() {
 	status_is 1
 }
 
+test_gpioget_with_trailing_garbage_in_period() {
+	gpiosim_chip sim0 num_lines=8
+
+	# A period with trailing garbage after the unit suffix must be
+	# rejected. "100msx" must not be silently parsed as "100ms".
+	run_prog gpioget --hold-period=100msx --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0
+
+	output_regex_match ".*invalid period.*"
+	status_is 1
+}
+
 #
 # gpioset test cases
 #
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 56ed90f639790ec54a3d6e9eb6ad594104474d7e..4482ea5d6a4c6ef3cad3af2fb960d230e1a542a0 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -153,6 +153,9 @@ long long parse_period(const char *option)
 		m = 1000;
 	}
 
+	if (*end != '\0')
+		return -1;
+
 	if (m != 0 && p > ULLONG_MAX / m)
 		return -1;
 	p *= m;

-- 
2.47.3


