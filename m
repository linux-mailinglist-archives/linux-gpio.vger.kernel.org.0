Return-Path: <linux-gpio+bounces-33482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGK8CeHNt2mDVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:31:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB7297075
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 478033017BF1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74FC37BE88;
	Mon, 16 Mar 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E49y2Ii+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2stmIX7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A8351C13
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653466; cv=none; b=r2yT+T8XJVKIOsrr40GaebxxOD6Uu3E4IAgQ1rZ1JN6+F1zULTDnUq4oSaInGMotVCc7fxpkcLA1v+YmVXDf/BExlx7wue60zGnZ2Up4PerBfptF9zs0Zh/nWyI6mEOqU5+s4294HNgbaXPvyQepbf9G0KbIfc97ANcrjeKoiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653466; c=relaxed/simple;
	bh=t7RcN7LO49r7dPj7bqC6IblAuRL1agNtTGBpDgSRPig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t+5Kr75dE5K8Mg22ocmB53FnZiZL12Xl5CC08mUgEUbO116ZmS/FDk/6L3lQ9TVbRH02OMnM+ZAqKkzA9Jik60+RfFcYMpu8Fxlq85DjYixjITCapCDzKeXRqlBQ8+VWvWgPjxwPRcqD/utvnXIKB9blKFWuTxSACcn9v2kB35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E49y2Ii+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2stmIX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64bIC2672139
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DeyKDaUclElyGC7jv1SxBW
	X1XxpjNX/2b0YP7ulhDVE=; b=E49y2Ii+M8RiVkcpHG7wpoR5riO0XWkyudGnzr
	62ldSP5pjSSEk+zs6XxFkzOj8mAgWomL93We5UJss/eFAmr0dDOgbKgVJ/QNQqtG
	Zpm68PiCkcq27DDSM9Ekwe9vdbZ27SWQIH80n/gRG7tDJG+lAoqylyVqWvkjB6JE
	sYc+sLB1SjNOP0aO9KHKaAVLQaDz3b3QjDttkhIeCT0enmLidAFvL7kSmXRDbO5o
	oK9I8D2YlNuj9qUnXy58rDmgSk18z3wUp2Ikmsq5cp3oComeo2Da6eipzVZIgLB0
	p9ZAleH0X7MiAd9kSzzA690Mtir22gOQ+st0QkLKybYDhLfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xn2n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7a25c5a9so2607445585a.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653462; x=1774258262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DeyKDaUclElyGC7jv1SxBWX1XxpjNX/2b0YP7ulhDVE=;
        b=f2stmIX7Rzub7xc3J6qLna8SJbFcKVCAdvJ6DKiVVuF0snmilcW9dhE2TLhlrZthAV
         OKd4te0GzfbMr66keimV2MDLHWXAFivIEvJyDaaK8Mkr9nj1AR4/f8jCWJh6gv2gjyae
         0CWWbasfcuTMsRmNCs4qD3XQDm3pypJxX6PJ47ZFSzkz+e+08URg8XiJjaYTACbsovLx
         nw/ajDqqVkcO6/XuBTMTDeoP9mayYg8pjp+fWzVbFbrCr6jSgA8K0RGFlHhZ8Rkof2gC
         1G0ndlxcmKn2mQWeVbKQEumMFeA46h3kdHED3qYNeoNAtc/mzpgN7GM5obI+nQETaons
         cjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653462; x=1774258262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeyKDaUclElyGC7jv1SxBWX1XxpjNX/2b0YP7ulhDVE=;
        b=bxDy/kvmEcnSVDbuRRsMhWxrvD/Uxf0j3wXbUISVKvgGFdoEcySkVsQg4JgLqbfhxu
         KlS5+AeJ9xosre+djdTbCLsVoSbXR3TPrD12G3+81UHI1cgpESX23i3bxLKmpfFN3nHK
         zOERrU2zs4cHO2te5yI3ZeuRn6W1BJ5WKfKH9Rjff7qsWvMpXJSbpfF7fAJ1DFf6tOL0
         kAFA368zJP2Bg6bSfRAzLWPEh302rWAZzhpi78UdBbY1LlbhdHnje0qmEohPCrhzlIKk
         EHWcQBvfgFYfxshtVKxyXSOfHWoDsNOWJH/pYZ222eyChnpH66OmvBUS+tjIP35R+Bhz
         gtMw==
X-Forwarded-Encrypted: i=1; AJvYcCUftbdsZdPNEhxqLdeZ+0ZfRgq2WzWf1HTjJw3D3mUCaA26Wle/L+3DGR1wGosOl/f+50ij4vKMSQLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIt1X/sfiO1NruLFkClHVQPhIR3N7uaxcbPn5pkCDFQwJR7iA
	231TptIknxoUPtZz30Ocg+l91GkWO80SO+ErjrYko0aoTRE9qvQbmd1Iy257VjZHPuYPwC4tzi8
	b6mcYA5sqjD4sZEtSDcSYJSolrSjNGqVUgQ6E58bxfIZBUK9GeSugjN0q9GS3ZnSvhTUTCN2Y
X-Gm-Gg: ATEYQzzAtPdbG6pdXbCAk7n7A6TwMqvYbp/0QIvQSj/Gvw7jZ/W9bB/wOGE8KRAbBCl
	RZYibb8yJaahnbc0+Xjo3qsGeliurVPy8p/keimnPCsvnYaPEsmRDnP8AXugrcf71pEnQ/0Tg3J
	OBroDmYS1H8hXMtLpIBog7CGgpH2z7PskU+MYxJxtY5FlbtOVYKcUneloTcIBf1R8VmUGW+TKp8
	xhngKV7Do9uK9vJIwYHaBY3sLA40xTUPa0c4EZytjqJw4L4X3XpCZ7jzsScARUkgZ6P9lZ6hsW4
	20FrahYDcQVxXaSXqL18T+PDNKlCldjE+e2lqJg3xOQtZVdTKw8YeR3nNo/KXwAtGLiMapE+ggf
	3+1dIAtK/RkJU9lOCDm6ffolEo0q2pmkMau9YNxCKEFZfXM2PVO3V
X-Received: by 2002:a05:620a:4627:b0:8cd:827a:2abb with SMTP id af79cd13be357-8cdb5a683e0mr1537566785a.31.1773653462488;
        Mon, 16 Mar 2026 02:31:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:8cd:827a:2abb with SMTP id af79cd13be357-8cdb5a683e0mr1537563385a.31.1773653462130;
        Mon, 16 Mar 2026 02:31:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm43930688f8f.5.2026.03.16.02.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:31:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] gpio: timberdale: remove platform data header
Date: Mon, 16 Mar 2026 10:30:47 +0100
Message-Id: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfNt2kC/4WNTQqDMBCFryJZdyQ/WrCr3qO4SMyoA2o0Y22Le
 PemXqCbB9+D971dMEZCFrdsFxE3YgpTAn3JRNPbqUMgn1hoqa/SKAPdTAFWGh1GbwcEfk3BI0j
 jlJVVUZqyEmk8R2zpfYofdeKeeA3xc/5s6tf+VW4KJBS+1Vg55a0r74E5X552aMI45ilEfRzHF
 0KphS7DAAAA
X-Change-ID: 20260313-gpio-timberdale-swnode-03b1a0945359
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t7RcN7LO49r7dPj7bqC6IblAuRL1agNtTGBpDgSRPig=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt83Lsv1DgzbszzaT6knK/YJSb9Qzk6yoEC6/v
 8GMQUMJsb2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfNywAKCRAFnS7L/zaE
 wyUEEACL/ecySdtWz+HC6PX9998/HlB5wLA6kVRW3QjV02bhfQVgWg1t4u1P1cBtFf42VrJhIat
 tTyG2+dF68q1sK3LNsxtty/yBO/uHSPUQlT9yLTg3aVQ3VMusfgyyu4rH89zZ3q1Ox8HFQJIVaS
 rALCsmyljBvIeqC7FxIjMaqKx1aixFBD8Go9UGOa/RtygzCVV2bKjwBhrwEMgTA/UV0hQxCLgRR
 kcp5hpq7/ztyrbgdzaQx3oP5qdZXm+klfZq1bOKydm2FeFugayvWR58aAHdips2j2XOa6BNLqhP
 hQKnCi0pyeoMGuvS+qorLysUDcUSMCvuFB1+wqrx6hM6VCqTWkHtARcdPyuDhQ/BsGvtuD3oecH
 h3+Hx2hLkULXqa2hUmhxZPR/6YxG83GjUS//HIfoFTGpS7qg9pJqv5szcVzkXAtOUzNBoQOuDhT
 MDbqe6rXtUQ5HzXXFDvptV+dxNGnMFJuKgTPbfJuWeJ6h4cQ32Jl5TxlQVT8/UQ8F1rnmOn3Ya5
 Sm6wZEbAeCa6UBnzvq4a7ng2/8y+dcO0qk0NaygEd9IJPtvmWtLTzSCbJfBJkljMhaUYgJnpGqH
 2npjoFsIuIFjkLQRm/BdyK8Gp0I4YFvB2z9oW0ze2b5gB//Si9t4ElAGrWA4SMkDVSsn6P1JFsK
 1fMcAbBuOfOyebw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX2TLEdH+VmDCd
 JqU9iFrjJyqshBY3o99h3tckWBeNfkdz9JYFjGTFASJo7pA30cE3435bN/IrZnOJl0X6dq9ktEO
 UjQE/bGd0Sj8Aj0gQUYX1jHwDgCBV1kMm6GPixdTSoivDeqQOgPCGGB1DfBBu2KyOkGJbUlQI+E
 76kVVOuv2sAT3LJdn/r4fRNpkiz6czJiClcrqXBlHJMxk2E6tOK1OMaI7rmc1RN05VjDauVyzfP
 Zbx/d+FM5HN53A0j+M+QIpoEzYZkCOjZm0RMmwj63Yn+JBIHun7OlGgjxLuaOYkL5xY+73Wnumc
 zQ9I0MfyLCU0FWnDNmcZXEfyjYrkrxmJRjUEndgezEyn7UjddzfTIiPZMfinyw/cgjf/l8aL9x/
 ae9GnVPGpZncGV8K+vaC8YwUF4oDfHIGE7GEHB5GnQtFCc50J7FsxFmaRwUMo0gM3UEtQ1l9QYP
 214elfV62Mai/FBQEWw==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7cdd7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=p6-fBqgG8KB4fA7HuiEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: fzMk2mP7KlIdu6W30jBPEIjMOr47o87T
X-Proofpoint-GUID: fzMk2mP7KlIdu6W30jBPEIjMOr47o87T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33482-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96FB7297075
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are several GPIO driver header scattered directly under
include/linux/. I'd like to either remove them or move then under
include/linux/gpio/. In case of gpio-timberdale, the platform data
struct can be replaced with generic device properties. This series does
that. It can go either though the MFD tree or GPIO with an Ack from Lee.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Change the property names to make them consistent with existing ones
  used by intel
- Link to v1: https://patch.msgid.link/20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      mfd: timberdale: set up a software node for the GPIO cell
      gpio: timberdale: use device properties
      gpio: timberdale: remove platform data header

 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 drivers/mfd/timberdale.c       | 29 ++++++++++++++---------------
 include/linux/timb_gpio.h      | 25 -------------------------
 3 files changed, 27 insertions(+), 53 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260313-gpio-timberdale-swnode-03b1a0945359

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


