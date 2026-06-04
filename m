Return-Path: <linux-gpio+bounces-37920-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fJdmD0EuIWrOAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37920-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23663DBD1
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GawGWmku;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jokPGrGY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37920-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37920-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7051E307BC07
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBD73B6BF2;
	Thu,  4 Jun 2026 07:48:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B050B316197
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559299; cv=none; b=Na8LtudMQEyPsnswboBRnozJ4qno3L6UmMFfCkj2039DVk9oRXNXwM3s+y19M+2PnDa3gfJlpPBSlz8cbnN9STlR74LNboh50Gn86TMFZ9oS3rOaqtODma9BhzxFEqZriLquRCNIRYGD+5bXgI2cngqbQhpkbMBrkWvprRA85eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559299; c=relaxed/simple;
	bh=C87cpg9TXW8s9LTtcf05BlSOFP8RK7AGjWPmn7H5OoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtJSkI1DoVwP9Pl64QOymEh9EMFcFhTiIuEFp1VanTU+JU4MeKWt92VSips4tS2fewFJBWr1H7N/72dXombSpkiUmA4Dk6L+lzwYXrljQbxnPYeU14niJoVu2ZlK53lnIekFLvOnVKFQb++5sAyvAS5zsu7tIJPTF6NSfQw/PP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GawGWmku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jokPGrGY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543M37F3234783
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5oNCiUKOdOd9P+58fP/OT1LaeAK5dnkALQx/AePNr0E=; b=GawGWmkuKwTDUq4K
	u8UeSfg2A/pUrJn0gNVdXPZFaLUe8O835KHsCrublPtsrud4oGsvH1pM9jIyNoal
	KheaEt6OnoKyHOgWZEggtAVeocMESgYd+diqTVHuP9mBuJldv1TmM2bVqJdvhOlp
	bnmLukL4O6Vhb8GfKsCgGgXLOFCuid7CAoHNywMAnUyTFDr9IQmWhdPllqp6ogkk
	BMDyC4a6LnUzlRBM3qemCb9g9ceqr3Clz+jbDqtM6q+4p9PRzG8sdSMMSgJdfhL5
	ujNoy+jNcwK8WhljnWiSn391Y64PyrWYPGKJ1NnJtszQiLQo+T/OATaHuLp287rI
	eholAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s2ku2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07eb05so10557691cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559297; x=1781164097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oNCiUKOdOd9P+58fP/OT1LaeAK5dnkALQx/AePNr0E=;
        b=jokPGrGYEgg1QivcLLuP9nCnEDh+IUsuKzJgXKxvHPctIbxXqRSSuDmwqduOSTcMcS
         JsEWOIzU0kSqO3CZ4cN8e2IaDGwS9zh5iSgQrGBgue86AUIuSRbxV8AGprFBrX1fWekq
         gwOb+YiKKmv2r1Q6xNcb8nLY/B3RC5kxYiy+P4I7i/g4HliPjbaZa/odjZQ5YgXgg8sr
         wWrykWeajCejNdWr1EHK6pBoy8ppAw2bkIi8+X99WUm01n6VOh6VOOtdEyvqcfqWL6Zv
         wo0TMivujVZonTVommXehQXPtPROXYp5Wl1QBtzMcAvkA59Xop2q5Y6IbVOoT6t5iyOe
         4yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559297; x=1781164097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5oNCiUKOdOd9P+58fP/OT1LaeAK5dnkALQx/AePNr0E=;
        b=XcDXgHthATWMlVprO/RaMCJjC1+fGyem+efoCOlPccN/hUZ6ZEFtM/bDpo6lt9F6O/
         34p/xTb12yj+XS1H44Xkxk+IEacpKOquZRCP9CB9O3w6ukiP2sEXHaIhZzkDj8Dqlatr
         LfGJFpILoIW2FoyCNWB4hJg3AnFWMwe859XzEhmqxCJ7qZv/t/v+chAPszyLIzBti5cv
         xtyeQdxQjwE6AeahBUjdwf89WaCDiQPOL4ogW3R+b1hM9WqyPDHKTQ15BTaIGC+18eIC
         f181ZOK9In6DurMgO1N5wvG/0po26sqM/us8C4iNPhkkVeV9TCkTDbs262AxhlQUyDCf
         +ABA==
X-Forwarded-Encrypted: i=1; AFNElJ97LNXU+D8LYRY+DwEdLoNkqlpQdyX0gcIinCPfpBGbrlfHk7px+LvIWnegdc2i5MMDLoMG51iE+2/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NDrCLxpR5RV3CIA8ix8EpdjbnhGxnWIiyVBRQJDYE5jlUetN
	KR7BLYAutA5Egju79Vr5867oRA48jirEoqogBtpm9eOZKQMnYZDgcGtQYmwBigbzFRllgCrDrBI
	SRKvambRiyR7Pac571ReWgCO5oko6CR0Tl07e0dLIcKr8Z4Nl+uCAwnP22vNtLK86
X-Gm-Gg: Acq92OGSj0HNnSvIaBkmEdrRqAYbn7HN8T5RCYAz5m75sceJ/Z17UDAxO3Pva4YX8Ct
	nOYvuB7wWWoToTlTEpgtbFSRHIh1pH74+MRXgdUJgM63kqTg/OjQ8ZvT37/5o6CB/TiwARFIxBc
	PzF+/PN10to1X93oOJKVB9pB+S8dsZos6S5LJ5oDrTKLx9ckh9hbtT7kaEnTp3fVf6PGGv77G52
	8XggcZic4IersWcSW7cifZV55eYH30cPnVf6crdXlfh//vi0td6xoj64FyBnqgquYKG2Bnajmhn
	1gpLluhoUHwJC+p5i+wrkX9zqvvsZdAi7+WnCR3rO26PAMa7Bop16uHKsLErrdrwcVU7vJsBlKl
	LljonFdBpeQwc6F7n13aJiDainZvmuH21hNMimVhm9iBX4653v/aB+BLQ7CoO+FF0IzlQsvdvHY
	pMiOt1rOM=
X-Received: by 2002:ac8:584b:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-51778634384mr104906221cf.19.1780559297043;
        Thu, 04 Jun 2026 00:48:17 -0700 (PDT)
X-Received: by 2002:ac8:584b:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-51778634384mr104905971cf.19.1780559296591;
        Thu, 04 Jun 2026 00:48:16 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:45 +0200
Subject: [PATCH libgpiod v2 02/15] core: replace strcpy() with strncpy() in
 gpiod_request_config_to_uapi()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-2-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C87cpg9TXW8s9LTtcf05BlSOFP8RK7AGjWPmn7H5OoY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2rpPFLq9mvDxLWW1povXJuJKrstea2T8yxT
 GfqnfDsB4iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtqwAKCRAFnS7L/zaE
 w1JRD/98TULgvUXwN1eXVguXcEj9P6oF7g9YAY7PudxtOdsp78iXoMeLJwUnh7zd2IXRHZ+2kfd
 msS/h0sE8epcCs7lXV7m5z93rXUnuGBd57aAx9PL3kv+ocOUSKZ7kHYULuuPodIUTAgMzubaUlZ
 qa/RAooiNG4nSsbRtiL3dW5bGN760fzvACTb33e4ifFPryaxcVFp//R/LjG8VtZ//cfmH5SFt5/
 5KH61v8lvePXB38vhPZ9OC+/gmrr5yhEDiZZGAkfLSwznO69TUmha9BLY8PHLtHKin29KbnoNTx
 pNiBSqdDeJSihb9PENAKU2yEOvugtd+LvMhR2HxpmkG/GUSZbqVCZ5R6Nksz9+reqaI6j7rgqvI
 ZuapFFaEkfbjKpe3PvuaY/vcxSHQlo3ADYBcvVbHIqXbaTax6ksMrWg8f6ghsVvOZyrYsMaJn3X
 oV5qJq+6kDDG6vdONjMGG80FTe+F7iPeJ4HUvDNi1qryjnvaZmzSKe4WiSH9EKa9thDGSvisp/z
 yQEPDuBc27tsdcmW3IbhFLrrz/nBpzbJ2qJXCaASo8YUoUTNZiqwikalgUzul7fMKvIzyFWMjkZ
 jZu0Tpmo6hjHLSYHeJRH+Jj6iCuDr3daqc424JCbOQ2MZ2DCmKO7E1xD4nQPfeHFeh9zjjL8nwW
 d3C8aopTyD36JCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: rr07InihMEgrrSJo5V8_K_eqFS3goJm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfXwNYPzId1KbGq
 CNwCcczUWrwANlpeyRdenJDVXrPsXYnW0+QHUAdUTtEptAphOylcpsDhRNrylUzIgjntQIwzbFP
 Ol5LoJuwQi7BhNByeOoyWdrQCSlFbjf8naEe67qLhYrAk5iGoQoaJ9T6hoRTMWzOTdI46zKX+wr
 F6lRq+dJSDxHt+9rp6Pp+algLyiQ9G1zJJJuS1YhlM5fBBY3c3Cl+TU7vNhG7Lh6qzJn6BTeoxu
 ynpQR2ghyM+OLMxHOmFzreLRepG5UYhKpdeOBp2UZSUUwCJtZUfTToJGzCRQ4Kd243WhABYWu/M
 wyd+jkybZb4FVOzPluO+bStUVNSzKhGBdyiZTOvf92dXuu8JJVeSw+y9fmEBR2n+liuM4O49drT
 0wku1FMCfQ9IrIYQzYF/arfF5Mbn5xoBiFH6/w/rfGS6l7SnZ+oF8xgn51Y6SNpG8WweATqQpkJ
 af9dbhFJ+Pj0i8Xnv9g==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a212dc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=BRC6RPTYY3SoABRGux8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-GUID: rr07InihMEgrrSJo5V8_K_eqFS3goJm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37920-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,xes-inc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: CC23663DBD1

Both source and destination buffers are char[GPIO_MAX_NAME_SIZE] and
the source is always null-terminated, so strcpy() is safe here, but
since the copy length is statically known, strncpy() is more explicit.

Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/request-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/request-config.c b/lib/request-config.c
index da055c5b4bf551fdb062b3bb55dadc11a6ce7a25..cd22028c4af8dfcad9953b20c7e4c37f269c9124 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -74,6 +74,6 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 void gpiod_request_config_to_uapi(struct gpiod_request_config *config,
 				  struct gpio_v2_line_request *uapi_req)
 {
-	strcpy(uapi_req->consumer, config->consumer);
+	strncpy(uapi_req->consumer, config->consumer, GPIO_MAX_NAME_SIZE);
 	uapi_req->event_buffer_size = config->event_buffer_size;
 }

-- 
2.47.3


