Return-Path: <linux-gpio+bounces-37929-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yQHoNwEuIWrAAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37929-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:49:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5B63DBB5
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:49:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XLV6Rxry;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IjXw3KmB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37929-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37929-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EE6D3009382
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3904B3D6467;
	Thu,  4 Jun 2026 07:48:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CB3DD860
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559321; cv=none; b=h3MTJfPpParXRKiqXs1GpHiXHz8XUW0cKP+L1KnQaW5NuFpd9hoWGCVzv3e3o8VPzQqleFggqVeWSIz4EOTncGZkP4uNDXbZbZ9ySMLp2eno141jV5AW4yIVeeoSKEL2HoluvuwO5JJ4oDZhpFcmw1SCHLffLb7PPlseSjUQHWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559321; c=relaxed/simple;
	bh=IA1tYAOrpZTpujixS0qU6W7TIK+BLxzrX7zDCnJH4JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+ilquFFy/WF55+Qyr/Tb/mt9tzj7oRGscukrkKLLg/D26pS+iOCzrX8WNjnHJwJeZi4punyQ4ekgfFM151dP2/ejnPzJNIsSDtf+z/zlswQexiwY7kpOIl8GUJnLN0F+KVZu8NZ1RX53D5zLqZWP5mKUwcehdyRj1iAb/eM+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLV6Rxry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjXw3KmB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542K29l2368039
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsH2d7EPynx6waIFoBZHjyuMTrDvNhDjVIfdwKI4dCw=; b=XLV6RxryXzI3NRbb
	qbnTNj1KCCRtZ3YeedkN/tIXQRCHpRSty0Q+VmAjzAD0yuPapzozqLZuPfLszNQZ
	HjEbkBseIY5aWp3Gnc0Y8xMRAc4QvnqnD9eD46fW/5KMErgLEJyps1/uOP1omdxU
	r4GF05n9nXQ2SaoYMYcpsVucmgRDGOuIlKq8mNRNOnyuSv1MMIhPLy8XUqTqBRkj
	c8UvuoiwBH0NNmVHQA5wDCP9d5GDQfzTcyuH64nTKO1vT4/h/iwq1VvNwLtZRY+i
	yzWPp5J9+vmBjKKPoHcTmUletH03bbodxoIFPgtNUeg5XW3boTjfMA6z5KblEXtD
	C1M4KQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gmmdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1a8a6c8so4240541cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559318; x=1781164118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsH2d7EPynx6waIFoBZHjyuMTrDvNhDjVIfdwKI4dCw=;
        b=IjXw3KmBVDGntKF0P6R0uAI847nzCNzoNesZLRSJAQPui/icmjdeDQmMlKdTBPmxMR
         veM1hXwV7ycY4fpSf18fHuhvnuPGMYevlocl5yIFZKMQmsKLzyDNOUtaMUkFT22CQfqo
         Jh6X6qlDiLFjMVGr1SRk0R5SFtioPkWl0U/OxqxA51GogapEHXt9Lkyrh1Vp9VFUFcQh
         bK8yeQs+zTPTsm6p4jNoTXW29clg+nNkWSsnP3tybnaBq27F85398UKhzwwTESrzYGFp
         DJe9pd0jn3pfERA2B93khrQdAR2ugT2h8LPncrwGaZDVHhc86RF2pi/NkVUP9UhS6QnV
         3s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559318; x=1781164118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsH2d7EPynx6waIFoBZHjyuMTrDvNhDjVIfdwKI4dCw=;
        b=kbXsRJ8rWsK4ArzKxBNv1kpCeoEMbBezRs3POSG68qSO39PU2LBEM/oq8bwlPk3yxP
         fVB+MNvtgaS5JJmqP8t6S+uvBYZXywV2fSvjYGt7vaqItn4lJhebUrcChMurif8t5+mq
         nioVykWWUXAXLn6d9MnJBK9ODOMOzoSQwz4K9BEiDcXweuL5lCkmtzn1ikmqpusgbb9q
         qKRRpNr32ECKPARQPs9XHAryqSinlqCInhzrXs52oTzxhiyt2qvZ3UulhI3toUaCDl4D
         J2ie5vy21KJ3a+aeOH96olRQCKOtJ68xxDmOLvX5tbeAIOgMVG53P/+AehLQeNSJa+hP
         p40g==
X-Forwarded-Encrypted: i=1; AFNElJ8j+EGWnKWkaxXEljnH0XdAhTFhR5BtyJ1TOVfbopwRVFIuO180NVxMmFEyjS4Hq7DB1vTqGYa83QzX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79aVk/TqpSdceDtjo3pwLzok3pERvi51pbnfaGTNedqvjFGaL
	8XNLXQhe7GjJOD/WfPdj8U+ux8nkQbBomgxcpz1f7idRZVjDtDQH9wiDvwjpJR87kdJCzcB98nd
	hALsN8bA2kiB5E/7ctcuIcdEQ2r8Dycr2OA9+Xquwn+HzyJJgJG8yLTmJfh3GORTg3gqAqCLVi/
	k=
X-Gm-Gg: Acq92OEWj0FTyFvZlXDAfFgDKcWGNHWYWC5jSwIKWs5PrCz0ljQtYg94lWJhP2sm2jU
	iMzwLHTAKf81F3KOE+1+RM4xkkuy8zSEtwpN3fLPiMR5vroJxwayGOzrXmVN6cnvQKjXpVRypZS
	GcB3f2ZFveSJUhIJHFWjZsvxU+FPAvQEE0BdPBtGvkHyb9iridxoSErDPu05t4mC7V2cWs7dfwn
	pan0qp8yd5GzgNj/morSJg5BSZyuLR6xQ3Zgi1idfIDoGuvOvyqRGI9j0P6NqgOY9rXAaBZWdlF
	CaKXceH+UvBKmkJauHpTeLnvF1Cletr9rideWj4G3uIVTuRbry9uy7BEWx+vzUJ1ebphy28t8O1
	tgyo9JcJs6ndQHwteY6wuq7f92UEPNULuxOnG1qszhJXB7ULMnKt/bMKulmpd4KHb8wQTp/3vL/
	TU2NvbrtA=
X-Received: by 2002:ac8:7e86:0:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-517786d5317mr94820561cf.38.1780559318084;
        Thu, 04 Jun 2026 00:48:38 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-517786d5317mr94820291cf.38.1780559317617;
        Thu, 04 Jun 2026 00:48:37 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:54 +0200
Subject: [PATCH libgpiod v2 11/15] bindings: rust: use repr(transparent) on
 edge Event and simplify casts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-11-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IA1tYAOrpZTpujixS0qU6W7TIK+BLxzrX7zDCnJH4JU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS20YEDFm0w9PVS94Edx60UJfWgEw7kCwfMiD
 uovlnLXWZSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEttAAKCRAFnS7L/zaE
 wzlfD/9w1HeqFJMdHjxaM+/cvDT3Z/20evLEsylpIFxycsy3bf4D3dSErpniVfLAwAgP6DztO5k
 4oD+6lTp5LYbF7h79gh8OcS2CuPPU5gCkLv+UoysHjK4oMa9lZeu431tUi5fFcXgkUcXvNQNFwe
 e5A/DTB4LpcG4cpcxGOa5UU4MotI2LPzyc2hotVyaN8DlTqEOmrQtsOMmD8pKvLZLo+xjt7cMVN
 5A6TpMhJYxcxnO1CLZ48ib89a6KtGik7cEaNJ1KzC/yuloIAAUsVBXVgH9NBnICHzP0m26N4S3F
 tamH089GkUpqdEYLcoi6jncElEcYtQQoT5mq6/vdRqZbDdpi4RubTJ3+0tnTD81WLy03DW/HtDH
 0arqa1oGsgLSQi/lgQ6AwpoupnbjAR0NI4lhkPYJ45K42/xtLTntGXaLmMn/XmbtEM0Fyf3t4uZ
 tKrvAaDBuBkWDJoZz6bXtaJQBRo7ztXYGl9NMfS+ixKCEgyga/VmJa0QXQrYNppp1s9bfJyBcgp
 dwr2iQhFbnctgNcctGj0zJb1cy8GchH2qQ26Zu/7r2klPcxkSLgcfp4Bl/bLsd7MJdMCB5lTDb3
 weLtpAXcpHhmL8pnKUAhYgk3u9eOK+RuLIvaNQ7rBHKl+sVeBfEuJN/f3Zs9G8tGK1hpgJPp5j/
 8GalO06d8VDyc6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX/91AF3gb6AE6
 KULIMh5d0I7pldqaTxFcMAW0oKDXvkpBPE4GMg1Jew+vTj1Lutu2L8sT41Z/vM/CnRCtTsp5r5p
 LIa7sOk5Uq7rXasFxK3GNgu64MvdILxYEbhVuXrC9GdQrKZDMYU+vMvyudnnp0IX7IDgj1YT56G
 YVBgLVah4fEANlVy/nr8He+omgfnpdMf9qJhueTeOxwTkgPZGUxdn3zJFl2lL+bZ9D+cBsBgLIh
 ak7iOh4b1pBiJ/158RfmudDN2cRH9sQYdqHqbDhjBRFyKeyScBVuxWCPsrY5SG6cAu345WhI9tP
 AB6Tfskwxa1ee2J0vpDHYlU27xte9xLySBRIf0nvnXo6RKwlfmRnnoAWZLUCZnXskNUHK8Tn63V
 w7SM63lZ0AEGV5dh9wQmUwiYuOFMJ9W/Txy01Tiv+7KJUtefWyt9uV6ryD7d3vWV+UerA9eWimU
 +eHXsJXU5QMXfcFeHmA==
X-Proofpoint-GUID: TBkL9HjKOFrkeHomoUNA3scQX8W3BNNm
X-Proofpoint-ORIG-GUID: TBkL9HjKOFrkeHomoUNA3scQX8W3BNNm
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a212dd6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ThDzopB2CjkJibt6bSwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37929-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,event_buffer.rs:url];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: E9B5B63DBB5

The Event struct wraps a single *mut gpiod_edge_event pointer and is cast
from raw pointers in event_buffer.rs. Without #[repr(transparent)], the
layout compatibility is not guaranteed by the language specification.

Add #[repr(transparent)] to make the pointer cast sound, and replace
try_into().unwrap() with a simple 'as' cast for the sequence number
getters since c_ulong and usize are the same width on Linux.

Fixes: 91f9373c6558 ("bindings: rust: Add libgpiod crate")
Assisted-by: Claude Opus 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/rust/libgpiod/src/edge_event.rs | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index 45caf9ead0afa72dc0d5ea2f4facabb15b4bef2a..33d839657d0f909ed101135c91d9d376da6de7a5 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -21,6 +21,7 @@ use super::{
 /// number of events are being read.
 
 #[derive(Debug, Eq, PartialEq)]
+#[repr(transparent)]
 pub struct Event(*mut gpiod::gpiod_edge_event);
 
 // SAFETY: Event models a wrapper around an owned gpiod_edge_event and may
@@ -67,9 +68,7 @@ impl Event {
     pub fn global_seqno(&self) -> usize {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
         unsafe {
-            gpiod::gpiod_edge_event_get_global_seqno(self.0)
-                .try_into()
-                .unwrap()
+            gpiod::gpiod_edge_event_get_global_seqno(self.0) as usize
         }
     }
 
@@ -80,9 +79,7 @@ impl Event {
     pub fn line_seqno(&self) -> usize {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
         unsafe {
-            gpiod::gpiod_edge_event_get_line_seqno(self.0)
-                .try_into()
-                .unwrap()
+            gpiod::gpiod_edge_event_get_line_seqno(self.0) as usize
         }
     }
 }

-- 
2.47.3


