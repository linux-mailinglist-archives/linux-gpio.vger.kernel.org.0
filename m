Return-Path: <linux-gpio+bounces-38106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QbATEzzfJmqImAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767065805C
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eiLU/yQ0";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Erb9mWRE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38106-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38106-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D463F306FB5F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8EE3D300D;
	Mon,  8 Jun 2026 14:48:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6F3CFF44
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930113; cv=none; b=RT1xweCuUQE7Eqo6UDuJdOKzoPB9cTJx7pYQI5FAXdQKpWLx5dVm6oxu0BW9EjR2d+Vrt0g89GIvXI8ILfaSlpbweeIQUGpbQFNOQulQ/ywCtM3Wl3PNr4HYFGTZg+omjVZAg6Qdi7gSDzjo2gl+XlBZvemv0xH6cMu6M0CPrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930113; c=relaxed/simple;
	bh=k7bmhchWJ3YH+OKGfzW2Q3rXkYOjzuHtVTNp2plR1PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFRHckL5Ftj5Q9yLKmGz+mHkQek4rS0ZII/szd3Tivj/geO2JyC/8bJgp6vs2nOO5gf+90EsHjzESUIRnfQmMwSn02JSZDo3u0v5AYREiEDZFC4cEUzaEg/fjwa+VwQkBqwWn/MA41sKtU0YBgeyuM7rF/R2fXVKf3yb5TmphJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiLU/yQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Erb9mWRE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY2GX3872753
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	if95cIHHr93Zce38ISULehIX24esSGGpqrZXCA+2ROY=; b=eiLU/yQ0QjvrSvIx
	F3vsTELSVMTEZ0S6e1vPDVaCLiJ2uZwbnMeq+arfuLQm6023U394Ta+OyKseUPaz
	9Ste7ph0xjsUI9t7a2CeJrZWWbMMeXgJUEfLIKztdKP2kqBpMUPn6+uaMW5vGFNm
	DOeK8YImbJXZEudwESSEXOZEWkdss5APWBKGQL+M7s3MO1w+Wlx6ow2AyDfYNWPY
	sC8qNxPQjmGl4W+rh1V58YxSQ2PVLPxk9bdLuB9xY6+sMsxbXlVYl6FTgHTMzBdc
	64i7qbn7P9np3ePD4IhlsR6i6ZjErsmHYKqkoTfeq6ZsaBZyGeQ20X2ECnmHsRcx
	xkEaoQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enupth9ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:48:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso2166538137.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930110; x=1781534910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=if95cIHHr93Zce38ISULehIX24esSGGpqrZXCA+2ROY=;
        b=Erb9mWREqUVU2KElST1cu+oR7XLuj0xNb0veOW7MAqVgpad/x4cI94SXxcj1E3u+/c
         exq3J+1JnZ8pIV4SZSp/6eYDxZAv7tsaOI32xls5Ia2nLJT9wp9R7qCQyoxiQmAqk2R+
         J1XAxI6KMZ3XUEoa3jfFEp5Y2vO6jv4x5YAbJJUTiEmXEZdwxbwvzzYWdmQtcoMQFiUq
         Z21nYky/uYzEqK+wEbXU6CwfxkjLQnxQwhPNoclpQMmKDTpVvJb5tN8yGD81J9mg9FhY
         4rjDgf2G9lPfUEZYW3FhcdoW6Szs5Ck4ta0ZvQqcBqssQ1VETfGV7muze/PYJaSAAuBx
         eiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930110; x=1781534910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=if95cIHHr93Zce38ISULehIX24esSGGpqrZXCA+2ROY=;
        b=gKBy7WjtZbwBob2wGqajKwj4RXjVosjxcQJUlFvrCFFOKIsHvF/U0VeNOU1e9To5u4
         oSHQDihnbtxUQ/caCWpr8LFFkYsaAC/ZiFCuMn5rJ5HFT0wxrKPPdGAbRvrTGIMkDCC9
         maYN8Epwl4RN933b7pAyIscdCONnIjEkVQaThFql5hr/cPpuAqnenKL0HSlQ0ZBfCLm7
         3IW0HxZVt2uUKat39zUNgXIS+w1FKKoXtzJbcHB2lI3ZHV90V21ImDqGZYmmG+57ZI5D
         FGTsYx6zeoQpW7WPw5yjGt1jYPWhXIsizMSOu7xRHIQrBGjNZSIf6JCwbQK0QieRX/wm
         3NHw==
X-Forwarded-Encrypted: i=1; AFNElJ+9Wg/c41XZSUGrHq3O3c47OfD0s9J39MhX9xEo+JfsZnWepE/ysYzUeJEmL97i6OZVEe1xyIGi9GpA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCE6uRuk/7oTsv59VjT0i1rXqB7/EhCs6PdOeUiCl6Z60Ecdu
	FO/GPvZWBxhhcinUvI++Sivd1g0HvgkUygXzlA4qZ/wHpPe3j2YoxQW12n21SVNbr0OyaMwQEPS
	lULQBf+++DnnaajRk1oZ36bBuommpWwZRd+7qjynbbmxK6+xyXsXSQYFjLdRD9HDp
X-Gm-Gg: Acq92OFKoPtG3yfRmA0b2GbkBYwohuEW2e+LJ6dKav0yda6q6Xn3huE9rPQfAGHAx+/
	HL36FLN0nihNwhk0OZ5fUjpY4GMs5v+FEPZKBZjZWEO4HlyclNk0v2YI1mJo098Jrd+/Si1BASX
	oGu5F9N9P15UDpP5Y+GGB3EzroxtL4izS8vtyRutjlSCvv+ujf628bkY08Dq7uBS4fPv2mnuWF/
	dZsXtuZ1KF8tQoimQ8q5TSuAe0/89cZU44uDHwNZAfnhJEw/97AZIBvncV32hRigKHxMu1Ci6JJ
	FUvsdmNQLIoatM5nfx+AKheGZ+1Tb5ovEmaT4s/rWCAO8jHFsKdvtC+1hvrYQ30wZ/SL/J2t/jE
	q61nkRMfH3iI/lUK3aN3vQPAK81aoWHSPgO+725s0/5TerIW80mVQ4WSgs+m/
X-Received: by 2002:a05:6102:1609:b0:6f0:6293:747d with SMTP id ada2fe7eead31-6fef9988a02mr7318664137.14.1780930110170;
        Mon, 08 Jun 2026 07:48:30 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:6f0:6293:747d with SMTP id ada2fe7eead31-6fef9988a02mr7318622137.14.1780930109641;
        Mon, 08 Jun 2026 07:48:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm462705665e9.1.2026.06.08.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:48:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 16:47:53 +0200
Subject: [PATCH libgpiod 5/5] tools: gpioset: store interactive sleep
 period in a long long
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-more-pre-2-3-fixes-v1-5-577a5ba426a5@oss.qualcomm.com>
References: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
In-Reply-To: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2861;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k7bmhchWJ3YH+OKGfzW2Q3rXkYOjzuHtVTNp2plR1PE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqJtYtIngLBX8aM15WMn1SaGOAiVZWvd4wydRGl
 ppxyut+pc2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaibWLQAKCRAFnS7L/zaE
 wzXhD/0XnDgE2wvK6UBTN4VvaJ+yY94yfNX8PIbNemwhxC3PfiI6aOs31qSrLb4q45FnpFt88Xb
 bMpUpB+sl9WMdzGdSu7nwFA/eRKu1UdIBXDhWGVhSAWbbkqiEwDwcWI4Bj7UJXdQkACnASxNtB3
 JU83Ic4a/rEZ/BCIY9yJAKDaXxwskumXrqTEFlDbNZFZxDRHXtNH6qo5kSmytRd6qwUdQhgzICz
 3CvpwBrY5C9Kryt0tzQeevKIIxpWFSmDKDYQsJXfV60EbHrtj+QYGdoab4/mK19ZFZ2p79MqXuJ
 0M1Q1C80EzrjAX3Bl/z1CVEY1rlMVgSVoaDuaLat++eGaDHj6cTg/ya+fvYFiu1IpWVSovj8lXs
 Z+Yqx5tNNZM2/yemc6iFzNSVkvgMzVHPtOd2XHf8RmtId8SbH5LaNYE9S8fJ7QoOjK+BmE8lJuM
 opJUn6c4b7LZl9+n40GYe73EuRzTLs3X5/3bJO4AGBin4IzOpf13rDhHoEhYwj1O68BWKxOyCqj
 r5QIUc78oDxLrv4DZeqPad+ot3eQ5i0zp/S7rM6XA3Fc6abZDVHhC13JQSt4if/YcGRVM5UZ5DY
 mn7H/bS20WcXPXxGA9skwI7UeVKGziDwb7DskWS9p4G2JLl5qHLA6KVK869Anojc7KlC28Ger4Z
 DKm8suyf+8e9/+g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lPDepv3ugjRtgZgMysGqwmy4Xia1CnuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfXz/yF1do4SBw4
 na6Bu+CAM0vXrLOTJ3XWL8WzYmRohYDSD0fyFkJqxS6r3It/vNdaQFXj+jsV1ihbUaL3Nw6QTRg
 puf5D+HYtmHQsur+NJ4kwjx7F30jn8dgaFXXOa4pv2llAHT60Q3F/EfBYlWTV3RFzpFxAaw/SEw
 rmfe17PEPWLFzgVnCbZSZn9YPYsRckf1RUr0CCbR6zvSyUy3CE8IRLR6bSj/zgpXLgAiDlsxzzE
 SHSVfE1+SjkcqGmfgkPQ4gwMB8UcfCzQdNgIPcEfUfFD0nGLWIsv7aU7n0yuCvtcwa1EmF4N3PN
 ZS1Op92DaNI1kOyOJ+cwDqGElqC1outWwADJaY6TDrX1LK4SEA513LSiqBPrKqTahBk1OP7LmtS
 gtWP+3zejaJzBZOw2712D2sTf91GDSMYigvnr3CNHydqp+8BBlDp5vgxpYNI+7KWpASB0hQL4lq
 PiMkwNhKlvG14qr9Odg==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26d63e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=C0J7ZV9EjNVd6QjtXroA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: lPDepv3ugjRtgZgMysGqwmy4Xia1CnuQ
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38106-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 4767065805C

The interactive 'sleep' command stored the result of parse_period() in
an int. parse_period() returns a long long number of microseconds, so a
period above INT_MAX microseconds (~36 minutes, e.g. "sleep 40m")
overflowed: it could wrap to a negative value and be wrongly rejected as
an invalid period, or to an incorrect positive value producing the wrong
sleep duration.

Declare period_us as long long to match parse_period()'s return type.
The error check (period_us < 0) and the sleep_us() call, which takes an
unsigned long long, both remain correct. The non-interactive hold and
toggle period paths already use unsigned long long and were unaffected.

Add a test that issues "sleep 40m" at the interactive prompt and verifies
the tool starts sleeping rather than emitting an "invalid period" error

Fixes: c34a572c5350 ("tools: add minutes as a new supported time unit")
Assisted-by: Claude Opus 4.8
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpio-tools-test.bash | 21 +++++++++++++++++++++
 tools/gpioset.c            |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 2a39133045deb5f4f6afb3d039d0436ff8340778..f2b5ec7a69d46264dd10645d2af7275758866e0a 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -1320,6 +1320,27 @@ test_gpioset_interactive_sleep() {
 	dut_readable
 }
 
+test_gpioset_interactive_sleep_with_long_period() {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	dut_run gpioset --interactive foo=1
+
+	# clear the initial prompt
+	dut_flush
+
+	# A period longer than INT_MAX microseconds (~36 minutes) must be
+	# accepted, not overflow into a negative value and get rejected as an
+	# invalid period.
+	dut_write "sleep 40m"
+
+	# give the tool a moment to either start sleeping (correct) or print an
+	# error and re-prompt (the bug)
+	sleep 1
+
+	# nothing must be readable: the tool is sleeping, not reporting an error
+	assert_fail dut_readable
+}
+
 test_gpioset_toggle_continuous() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 5a68a7e9017cefd3661a3274bf1ba0bb194f132f..fce4a7de222f93121c99843a761c5308e021343a 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -739,9 +739,10 @@ static void interact(struct gpiod_line_request **requests,
 		     unsigned int *offsets, enum gpiod_line_value *values,
 		     bool unquoted)
 {
-	int num_words, num_lines, max_words, period_us, i;
+	int num_words, num_lines, max_words, i;
 	char *line, **words, *line_buf;
 	bool done, stdout_is_tty;
+	long long period_us;
 
 	stifle_history(20);
 	rl_attempted_completion_function = tab_completion;

-- 
2.47.3


