Return-Path: <linux-gpio+bounces-33317-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGUNBSS5s2lXaQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33317-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:13:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7F27E9E4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41EFE31A3230
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1B736C0CD;
	Fri, 13 Mar 2026 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnBwfq7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VI7/5gM5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C3B365A12
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385749; cv=none; b=PfSwGcu47L091HXT/izupsSts+fj4H9gi68V21nKDxSMl/og9SRgs43vgMefKatjo7358x7Abtj/ft1sOFBgWOVXrrF5z+L093vIxq7NQQsbzDy92QFG4PPWRjIWtTcJDF1SLobtr8JAUII1l0iO7K0zCjQRfPuHsgAzlofXwQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385749; c=relaxed/simple;
	bh=RJyJVigQaOLM0F29T8s/4IhVwmKqS4ZNXPoeDAhzrkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRMjRdWYyL71DM7J/E2DuNUH52+fMMYqkAWz9LOraycrjYvmt/CXhPSPPSFFduN4X6c8H3QxKgLrVlpL+KQ3egShGgMX6R7vGE6hgfhmKX71i1OEI5zKsLznjdY5F7gfR6bGPxHwMKhg8Cw1i+eJuD8tq6+OIf0bKIDGcBW7UrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnBwfq7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VI7/5gM5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdjX052345
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZBGna102s7UxMKQ9bLg8nid6z7Q/g4WSEiY00RCl3L0=; b=QnBwfq7RRGsS3fGU
	Js0PO1nYVjvfiAJCG45vb7H4EMdm7X/FyaN9eqS2/9BUbqjcOMG1Orztb2eyy0JD
	bTcegnnN4N1BK1c0OAbWET1IivwkcjZZ6tdluibyaEZjn0Eh92Z8s5AgTGZlBek0
	gB0SA/7CQe6KWMRHn4tUjqDSb/2ledeWJiAmcFsxkCR7jVGuz6LNAWYA4dR7NYQz
	LJ8c5PQf7HGm5yOHBztsbdNZ12NIPDBYk4Ue8C96LEcyxjCtZjIsZILdK/jlHDi3
	OOMQJFcz4ZXarzx7S0e1TlcapeluhzVe5+CmWxRfxZm/l5yqQ/JPVUL3gCiclzI5
	YAOl9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w4yes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a1436347eso454863b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385745; x=1773990545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBGna102s7UxMKQ9bLg8nid6z7Q/g4WSEiY00RCl3L0=;
        b=VI7/5gM5MVJcJXXboli4yxn8NlPLbkuV2Mfq7hNgu32Ud3k5mxzcm/Ny8nruVr+0YI
         ipt8GNnC6/eqx+PpY1rzwxreoai/Mqx+HtVQCUPVii/6Vhbj+/9PyYB/6XGzYB2+wyQf
         Ea7jAcjeGqFXeECrESA2Xf9Hg9Sj6A1mE+EWUDf+WwNY54Cd6J6Yo3Ql5IYRW6EfXe0J
         L6onM+0sMW4YT2t/9mKWW4iccupQ+Z7QLyXvwbl+REb3aTVym4aoHY0R66axSnOkZl44
         kBgHUnNEOrSeYmxsXG3Wl9WEz9AXVFPAXjuAUTCnt73w7Pqwf4KtdwoSiJboLE++smAM
         dioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385745; x=1773990545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZBGna102s7UxMKQ9bLg8nid6z7Q/g4WSEiY00RCl3L0=;
        b=NkXaQM99riqsNtvorM3LowxNMXhNYJSUiJs4c4+J4YL5sQtPEz4jt2OvrzjeC2nJN6
         Fa6qy3tjAL/2STaX+/COT6uqKF2ZWi2Owtze3ybSyBf/3FMW84mQH3yZpTzBZTFuKA1F
         Ak96nkjyQPPLQcPDLZItMcf8muhN1EwFqNHASMKWGETcBVt50qGZD9Igy4Atrfrfh5qO
         ao2nadHKryU0o+3munyYKiFXWUjvvUWFld1ve31fJZhWjTnpWi2nvghjuWk57LaRQWyU
         J2+qs3VU3jSbKB0RlDCDUMTeOv+URuJIolt4wTSE3/8JqLevRBgZNgPZMhY+TcPon2JG
         J3tw==
X-Forwarded-Encrypted: i=1; AJvYcCXzdxjgz7t/ZJ8DvSvLQNAJhotDqMhZy/7i7xa+JaiGA/Tj4kdVmaq86p1CC6t7zlrCv1AkxjunFFyH@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYP4LDbp6dQSle36qebNGKyDwdWOBDNmg/Ginh98zYjDm9eMS
	8VcQz5yr+jJuWa4jV59tPLf8F6sJOPEPnZRq/2OPxzxtQJcS2PYjiK828dI8HkGFvx47EWrzYE8
	onqCu9D7w2WQhXNvGMKjuwsch2bue6rg7j4Vi1sAjZzopXZSK4CI7rlPtjKr/45UX
X-Gm-Gg: ATEYQzxix+6KyKl1CoOXmYL/kwLlVJ4dU8QV8QdPLFeQjWwQuBOAQcj6mI0ZSnIGMBk
	IGRpRn39/1/WbcF82U8z9855nZNkZM0t7PRsEDb+euMx4nko+QerDnMhlCWjYL5Ec2BmzISiBFj
	aRdqOusVjazrQ+EaYJnIOgoIKco/CLoqx91eifS+l5ipYXzLXgu5FCO9HF34ntIupzSjlrnKHo/
	tj0IFmBCdoPovKO2aeBpzmI6vR8hiNDY8OM1Q0flwJqxta9NT4trVYrq1wSzMExMahWyXPozgFW
	B6/Sm5L51yq/hXR+muBoSp9m0xLTFwEEU8TBuBiKlkGoEqjjCtJncIKZbRnPxe2uH4/0LpzSW6O
	N1GHzR7OKZm9V6MvJPN5MhDn8nF59ZMytdIsWMnw90yN+/1P7BBkaa5W2
X-Received: by 2002:a05:6a00:928a:b0:81e:4476:f67c with SMTP id d2e1a72fcca58-82a196d976emr1922409b3a.3.1773385744781;
        Fri, 13 Mar 2026 00:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:928a:b0:81e:4476:f67c with SMTP id d2e1a72fcca58-82a196d976emr1922376b3a.3.1773385744317;
        Fri, 13 Mar 2026 00:09:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:09:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:41 +0530
Subject: [PATCH v8 2/3] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-wakeirq_support-v8-2-48a0a702518a@oss.qualcomm.com>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
In-Reply-To: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=1348;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=RJyJVigQaOLM0F29T8s/4IhVwmKqS4ZNXPoeDAhzrkA=;
 b=D8zrgRQtWArQCv0Zo1sugUcPcd6RMCLTFZxMCAirCh1759Ub3bZFRNHVBFJlIJBo9VhI1BjAH
 n+15tflY2ABAjeEzI0mPp3HJ+vk9sBQ+glRmAnvJ+fcrsp15205EQG5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Onz2PWwqOL_8VTlytC7ewc5R-7CXPc97
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b3b811 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Onz2PWwqOL_8VTlytC7ewc5R-7CXPc97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfX4Grw01g3rb7l
 YpRh2zDnd1N7b7vrDgjxkWbtXmo1O6hMAKlhf7UBKhAvIsn8CDcSZs1gDsttCue+NO4TOJIxL2Y
 r6p/j12fm3bYTQGiCQ2Z2T5c9MkZzFeYMlLYLUm8qEs1J5ajmRdJV6Lb2DAybaJmLPQ6j1BV5gw
 vlkHwndWDI0JbF7dyimzoiEZbVoaCs+QCP5L66HLnd4Cn44fXgYkKHX1YYGopw+y3D1lg38SLVa
 jmmdfab0rLQH7I6NLORxU6i3/FGnHZPIKDoUnEeezO+E/dGNg5L5E4VwYawgBJIjuX8h2aSyRZe
 LRUKYCGyD0hpOe7UabgQZp8DRs97woRhF4LmkIcDe3liEZSdN+y/CUy4aQvPcw/ZrZAjY6t5kAl
 nmI6Z5gxGWuhjy4FFF7B1sctzI+6fxKtMJkxE/NKsCnNPBIRoPgSMpCmcokOE4Cv8JSNw6RVboe
 S8UIVkwcvaB6HzNgCFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-33317-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81C7F27E9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
 }
 #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
 
+static inline
+struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
+				   const char *con_id,
+				   enum gpiod_flags flags,
+				   const char *label)
+{
+	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,

-- 
2.34.1


