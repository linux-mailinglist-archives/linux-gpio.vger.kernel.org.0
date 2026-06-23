Return-Path: <linux-gpio+bounces-38842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UbR7Mr5wOmpT9AcAu9opvQ
	(envelope-from <linux-gpio+bounces-38842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 13:40:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 417356B6CB9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 13:40:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W9Dyptei;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rv4Wb8JZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38842-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38842-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2230307D994
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06423D4133;
	Tue, 23 Jun 2026 11:40:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD73D3008
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 11:40:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214831; cv=none; b=Stn7uYXfzUOJYe3RZ5jv91nu5ibKD0jPmkvdpUBDP+n2d7RD5sHxgN4s+Q8MoJf+W4jRjmoquKCwA6XYQYSF/O7M+9Bcsm+HvT+qOMKiaqsDFrI3ETF8+kN2odb2hqi9eJ1OD9ChXiubXNUH62UnQ5xYQjPEwzc1BPx/WmnbS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214831; c=relaxed/simple;
	bh=jHkNQ6FaOdUkM2uNMuAqCvpborVUI1aXDW1QA3tuJYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VIUdDCXvvVEFxXetVPjwwse3m7M8Yont5VRtU+k78K7I++c4zBOPfn18iAwUIoJqFr2bkEFumXSje7sU0+1FCoJeWhqFJII5HWOufgy1Nf8GfGqm/ENT2WZFVAnJk+CruIt3G7/uUy57v+bBDCnA67qzKdGPvsvN9U2mcXCSAC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9Dyptei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rv4Wb8JZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZFYL031289
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 11:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jxcyGYm3tYGxnXfnRLREux
	5AYsEpAe7lrpZ9GjwH9CE=; b=W9DypteiwpxGfkVGJa4MjR10AakM/+NTZteMEH
	iypsjB5y1+b7jky8OCzQbn/sbp4aExkSosei3/IVlNcln5WWRtJ1K9FjH7PGrBML
	ZwisYza9P33wkjVrOZ4GK1Tqm0PzdWD4BDCKJPajW9+DuU/VJt3GFghmgT3IS65k
	pA9QhHaMGGjrB1qaEV3cTxeFxc2rsiCAg8ZbIdWPiJ64BN1kmY+O5KHV5+JDjzfW
	jdRHoSGBs9l5p5+X2Hd26SmNiD5vH6nAXsQqDqH6gw1xKoD2ROU/3Vsb2FJ8Ev5K
	zkVhxU3Kw63OLIU5m5J5xy2uVqcKeCMFLyGNnXZfiXL6te9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68k1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 11:40:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157d38ab37so524545985a.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214828; x=1782819628; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxcyGYm3tYGxnXfnRLREux5AYsEpAe7lrpZ9GjwH9CE=;
        b=Rv4Wb8JZ3E5OCldQvlwBjzoI1akl6gUrgeh6aKXdQYt3zBpHwYN0ti5o5sBFW+6PfL
         roIHpDxxuUlN2ON8iB9Zay9eqrb3IwsmlX0rGWxjGu+t8QzCHeIX2vkqpLnPbDTIUIFD
         3bKlWA8h2HHClAkn4m9ioqQqLDbmU9+4C53nyzIHViW8MjGxgqu+YVwtqP5KF0AEG4kY
         OwavLlKHZIyTEyTag/KRK5h9hXJ+gEBErgIGhovr8HMMK5hQGehn2SWvTyfFTpAPU7H4
         utlAHL5AErVdcktaqEskSEiUBBYYkn+MR+2ZdwJ4lq8RWRo+QZOnQWHQzvvzENgjhemM
         JfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214828; x=1782819628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxcyGYm3tYGxnXfnRLREux5AYsEpAe7lrpZ9GjwH9CE=;
        b=L8M4/LgMxfeoN6TjiH4QbwIT0Gly8mLXI3n6Qd4bJWw2O5hQtVHYJEsihljF/QfQta
         wKkhMCV32diVbFH1OewuqgzGd9YtSr2+Rugri7KLSwTP5PrI7NjRnEPCzReIFA6Y08me
         8hgMTihAnqPdeEntmgUR8in6HJiOGY3OOylrRklnaVKXiWCLRl6WKWYXyu+BADwbRcI4
         MU85cHaOwjnRJas5kRYPaXA8sFFbsYhl0Lie5j7sKGgNlOnSHYtV971KGXaGABqjUkNQ
         auPWlwSeOoe8UsLRRHPvrVBvskEDkQYF8koXv858eBR18bTvh89oUL5+ZSdiXeWo4RDc
         JsZw==
X-Gm-Message-State: AOJu0Yx3LLXZU+l7OPg4fLBcuiE2SnkywV06CHf1y1BmEE7FpiFwuaHE
	DecAmVM3irvt5mXBIBesGG7ShwBd3qqaqKIhM1w6Pb191qqrJcEA0lPfSq3W6sDnyrUApDcUBlq
	nUvSepjpa5GXq2Na/9FRHBhriVHnqT/iE8Yj7izh0cc6o+fU9OUU09NK7QFMBQN77f9NAMNLph6
	A=
X-Gm-Gg: AfdE7clvrxSu25JHhXxZTp43B1KeBoTWnCbe+TfB/Su40GrlwMJTY3E85iqzBxz79pl
	ZJltyVtHIEvsZllPgJQWij1GOidfYaUMcmmvA2VRSNYY1HZtJrFqoo22o63tGRZwFMmcL4do9ug
	4RdujGegqbTk0Ejy55Bw0exVyk92Mq0sWFBRMfsHcqzM7u4/Sqhd4mSBOj9DABJ4cKWdmbTGZ0U
	L8U2JKCLePys/1J1kC4kgU9XMzkR+uqzzi44jnNuVEVCq/QLD2bKXgPShyUK0GG6PMF6PuzsxOU
	DKqrbmB02Sg0AxhLdztriFwHcTI0wcaaXrcQNshJGDdcffjTNSvRay3x1GEn2qx7HvgZUTQ0qP6
	gc9YzWZ5ClvBk73JEdovruzlahUNXAC0UByZuX9bH
X-Received: by 2002:a05:620a:444d:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9208a9bdb09mr3240407785a.7.1782214828355;
        Tue, 23 Jun 2026 04:40:28 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9208a9bdb09mr3240401485a.7.1782214827766;
        Tue, 23 Jun 2026 04:40:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ac73:5de7:b9d6:d9e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm34309829f8f.6.2026.06.23.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:40:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:40:17 +0200
Subject: [PATCH libgpiod] build: fix dependencies for generated files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-dbus-meson-deps-v1-1-b37604ecce3f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKBwOmoC/x3MQQqEMAxA0auUrA3UKoXxKuLCTlInoG1pcBgQ7
 z7F5Vv8f4FyFVaYzAWVv6KSU0PfGXh/1rQxCjWDs85b7wakcCoerDkhcVGM0fErrONANkKrSuU
 ov+c4wy5hK5IJlvv+A539nkBrAAAA
X-Change-ID: 20260623-dbus-meson-deps-ff2e9ba43d0f
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jHkNQ6FaOdUkM2uNMuAqCvpborVUI1aXDW1QA3tuJYg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOnClc1O3X2p9tQT6Vk0ZMvsakjsnMIj5OqJr2
 kOw9OLG+pOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajpwpQAKCRAFnS7L/zaE
 w+2ZEACurdHBkqM1azUv27DPeeBqpw1W14PvAeqj/MVTa9Fe3Sw+hGl/HApW/wf4yGpW7756gg/
 ux4dW+rgdx0hOm76KoiNnJR/jRNlWBkt73Ev6yOEYAv0f6a+iDOVXGrzmXw0UmhIQYQWKox54kw
 epor2fSITKjkfmd8KXr+KsUEWHKXzuCaPzhag8FFhEeeDw9DQ2opzV27XBbLQrDNIdS/cJfM8dk
 hXER6kC4tIhQPdPtzjK/3Z3AnVL7vulYjOJn0s7LZ09fZnyH45LUYc43Jg3eof+HK2u6mlqeLob
 h6CEt21yGxtF+ewZSXSCIXaLHGcgV/tn0nzQW3olK787LDlXa+jtEP+fe7MYHKx5coaqD9MNnd/
 FwPXJ5PdNKTp1d6JBXgRofRo1mmz2eIVVccoJ5QHaoypgrYtE3hXpmqxLo3tx+y1ZiH8ThxfR78
 vaeNbo8cHWei1pgNmogutajI3RGtkZlw7Z0KIovSsUfE4oBBfj/g/FqYzkZ9WCACmVAkCxJOa+Q
 4hexHAzM56K0kDc+tqOT6TdQPQlk17amMwCkA9Dbg/csx13Xj5A1yV+LrLjDEt5iVSvr+AcHQPb
 jkSNDCLh5fEFk1Aex1/nWMYmLrD9TiDBKfp+3FPbZqzW9gWThrhbwBfaGrAQ9X8wLxqF0KVUAKy
 UQAQsBSxjHPV8Ng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: L6Q9S_YJMir5Y3rgvAaItO7TNC5LTAq4
X-Proofpoint-ORIG-GUID: L6Q9S_YJMir5Y3rgvAaItO7TNC5LTAq4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX8RN18haCw1yO
 9cBQ2XaNKLR0q0k57gLqTLuUTXGP9wGazUAFUZJ7Wm1oQ01CBpFNZrmjayZ7rwzg7xk0Jo1a4Cw
 /3RpmvI5YLqO6e0XxlGSvtjeAumd2ak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX4go08kAp3EyM
 5iss727n4jx90ziQf6Rzj4CG+EqZddQjaZgj7+5eBOkJS0mfKjb7P3N0PbDl6CvKc9WpW2OIZAe
 Bkrm8sMBqcEBdgJu08v7QnooRy8uoKiOp9nJwEEKYrMmCDATKE8VuSV0HShcFW/QaJ7QOL9yiwv
 JhHJD5eKdanzSSDmbMlp07Ip4+IcsngEOlJpkStCdcPI3XORxWpLK0Zfwyo+9cAGD8/0W73AFgw
 pO5FKm6SVdS/h9jJifKT0NKYjvZMw6Bme6URnNb+Bq4j1CTSFkO21c8lv5tXcRtClbwC3r8+FOb
 Yb5MpNGjm9a1to6eUBQXzGqzDz8jMooTXLPE0BL3NhWI2J3rVJUTz6m7bAGtfafjP7Iv/4IIXCS
 0IRyAk7qXiM4xzJHM1nIH1sxAfb6421+Hhy8kWNBSyP8xhhijXXXoNhk1WEUMtBAC8NYdInK6P1
 DqhY36BAoSpVMCrYBkw==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a70ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=ggLMRjvuJn4wQXQ6rygA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38842-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:luca@lucaweiss.eu,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lucaweiss.eu:email];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com,lucaweiss.eu];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 417356B6CB9

Depending on the timing, we may try to build generated files that don't
exist yet. Generated .c and .h files need to be included in the sources
of the dependencies that need them so that they get generated before we
try to build them. Fix issues observed in dbus and GLib bindings.

Reported-by: Luca Weiss <luca@lucaweiss.eu>
Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Closes: https://github.com/brgl/libgpiod/issues/191
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/glib/meson.build | 1 +
 dbus/lib/meson.build      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
index b8f8f53c2a4e564de1012ccb4979077e9813e7b5..3965314f835792b363e93df0aeaaeb38b51ecc27 100644
--- a/bindings/glib/meson.build
+++ b/bindings/glib/meson.build
@@ -88,6 +88,7 @@ pkgconfig.generate(libgpiod_glib_lib,
 libgpiod_glib_dep = declare_dependency(
   link_with: libgpiod_glib_lib,
   include_directories: glib_inc,
+  sources: [gen_enum_c, gen_enum_h],
 )
 
 if opt_introspection.allowed() and gir_dep.found()
diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
index bf49d08fe4054f191ab8be6abddceec60bb809e9..9acf5e1f1d4cb9c7c30dbfbadf49755c26abb00e 100644
--- a/dbus/lib/meson.build
+++ b/dbus/lib/meson.build
@@ -31,4 +31,5 @@ install_data('io.gpiod1.xml',
 libgpiodbus_dep = declare_dependency(
   link_with: libgpiodbus_lib,
   include_directories: dbus_lib_inc,
+  sources: generated_dbus,
 )

---
base-commit: 40538a7b48c9a6bd50d6253f86fdcb354b45073b
change-id: 20260623-dbus-meson-deps-ff2e9ba43d0f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


