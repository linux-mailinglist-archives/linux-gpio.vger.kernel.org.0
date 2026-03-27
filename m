Return-Path: <linux-gpio+bounces-34248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG7MC9tjxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:02:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D034308A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE5D2309F242
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CA93DC4BA;
	Fri, 27 Mar 2026 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hichv7EF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJmNPJK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25794351C3E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608564; cv=none; b=AVRWxSquQ0nfJcCNNf64zF/EvM2g3a25RFY/WW3eFnftsFs4QBzBbtSVk4fiql/iijINQpU+8bxBK8Rf+Fz2+10HEZljEuLLek0Q9ubzvmPN8Ski4zy/BKJeVAu9EWcBOu5Vp9kMQZOpFKfUBu/n80KwBqhx5/hxHyd0OkrHCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608564; c=relaxed/simple;
	bh=mp6cPFK/Vv+GXOIepyLHSkp+q7Q1z9lsaX38R7rjd80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rJhqRsRGyeHMsWLlBVaTHYkIMyFTmcALOeQZsq4auW21YsL/MN9fpoH2ibmb+A/adkpQZypwgFbpU5HtLqIyqdHafRkX8lilyVZH4EjlVJvLNqtGYZ51F7lgfJ7g0+YjSCdydB9ApT4/nvxegpcCxkDdOsS06kPclzEBa8XMaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hichv7EF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJmNPJK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wApi3717664
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+4AHRyTM420KLyS9QuYLn1
	fMC3eGRw0pJDtYQrs3G+4=; b=hichv7EFCUDDXIEkZZXWOJSgdl5cx8ZQlRhpQ5
	hlF1uUIbFs8RTkRY7v5BYoIxZsS8wiOuPhGaUIQFwpvg4tgZPIHgkzrv2bkCvCBH
	bdN/jWxup5HriInbvLXs6+znpDfhh93GmKPgzJxjpRyPPtboPxm02EJsWtasio4F
	DV6u8PZXv6sMqTcHkIjZ4t/mN/heFZMvxELVUBgGw+O+rImEO9Y/Yt+p7kUVVIkT
	uOfI8dieeaULPMPNh7P9k3OEOhTSt0GQxCS3M/ZG/UwxwvExMZJPG6Zp4XlqegZJ
	WsXORb+/tdCcMjRHLnJ8K4Zx6IPvQEgrO3b3SJIEnl4TxhHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6je09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so45346631cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774608560; x=1775213360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4AHRyTM420KLyS9QuYLn1fMC3eGRw0pJDtYQrs3G+4=;
        b=GJmNPJK9/pQo+WcNmNc5vlHvMi6/M5v6OQB1hx4dFkKIQo7GVVMu5r+XqeODnCHQ95
         09bJqh6rT/TpKOOxDC3y/nXwk5eY/n2l02gwLdOAXLAiJMiYez0J/IGeUxKK9kAlczoK
         1dNUNcLwbwoU+32bc2RFRrwhrESgRnACTtBcvoBESDqdbJBkM6pK29tQpeMf9wJ5oS1d
         O0hW2UVFqUsqVBZz3D8u91s0nEDbImTxQC7lbTDgkY27FFb2Q4SboI56geSuZk6WN18R
         j64UmyMEZozpALD6kUaU4fRB0ltnqwfmYdrOxVSWkS14DV2PI3D/MCtBE8po3r8aqNhK
         njug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608560; x=1775213360;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4AHRyTM420KLyS9QuYLn1fMC3eGRw0pJDtYQrs3G+4=;
        b=KsROeDtie2V5rgbhji9JIHDzDDyHUBFb92LW8nxqxUFPI8uP2VEulpNtmnBUKBQZ3N
         AAUIvsEHOZTzK2nYuBNr9cy4gG0gEoGFKV/Kq/AmJ3uxTPgTtM9tPgQ6qRKobn9MWnA9
         Wn8sqrP7vNHfOqwU0TE45JrkUFbs8c8HjMR1LRXDBFWopPHl7Im7cpDOQh8fsp8l7flt
         7RRYMCXdSCJR9/MGyha87pUjg9EQ6Y10HMkBwtxOsbl4MkL5vP1Ie3GwFG05IxWQjXLk
         Gi5FCdjG//H7kl6OjBJz/IpGLrX2iTH/Ouu6gdH1x0D4OzdqlPvOIwZuHgQGw1IR5/Cn
         y0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV82NKhiNpb5f54Db79zpGXcNegbU1642lGZ8vPxM6s/n9Fw7DtrKxNG1EmdXBZa2v0POw6roeMu9t1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3z85ecVCfNdZlNLGjzMwDQdTAZoFgGzVwseQ5VWaYjMhZwHjU
	Y9KRBH8gsuU+Cc+AP3MBySclrp8NPN/YLWQupq6r6CDt7MKFFk8k4qqyvC68YFJ1VYE+N7XTqDA
	srK62u7Ei4JmXEwe8IV7vp+SvXtjVzSOBU9eBkZUZKaImLzEqi3cGCtsx6TATQ3clRzk1w0BA
X-Gm-Gg: ATEYQzyx90uLUeF6snyrPB4kaiOciN+zunGMu4zL4G2FEnuINpiOTJ8B1h2bp2FXaYq
	V6LdV/cDrIcvOjb04fMIphpXEwDAljl2HlTb8LGS9VmQhSis4d3XpKidoppajLkDcRRfGw9y8cx
	PuL+WiR3pmqPZ2UXzPt9ejMAmLPYKBFyOtAFzfRFDVGcI7uSBFLe6wOVP2o5May7SXN6D+dxlhZ
	CZDXUn/XQecTp7NlASLiZ5/iR9f9PxTxlLu4oGT/YeeaerpOzKWXJaQVPL35oK6jep5Z+K7n1yG
	iL5ywtQracPWDhE5n2v5LEp5yzpu7I4sRfHAcazHZ/Bv29u0RrfH10SBL3/bOkpV4vVWor95j95
	i+sZgwOMPiU5wStO5WVcN2Z6zZk4FTkWng99VKT7u0NCwzy0h+OA=
X-Received: by 2002:a05:622a:1801:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50ba388b87fmr24059061cf.18.1774608560303;
        Fri, 27 Mar 2026 03:49:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1801:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50ba388b87fmr24058891cf.18.1774608559876;
        Fri, 27 Mar 2026 03:49:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm14989445f8f.4.2026.03.27.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:49:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] gpio: timberdale: remove platform data header
Date: Fri, 27 Mar 2026 11:49:06 +0100
Message-Id: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJgxmkC/4XNwQ6CMAyA4VchOzvSbTDEk+9hPAxWYAkw3HBqC
 O/u4ORB46XJ36RfF+LRGfTklCzEYTDe2DGGOCSk7tTYIjU6NuHAJQgmaDsZS2czVOi06pH6x2g
 1UhAVU1BmuchLEo8nh4157vDlGrszfrbutf8JbNv+JQOjQDPdcCwrplWVn6336e2u+toOQxoH2
 eTAPzX5U+NRQwVQHEHKY8G+aOu6vgFMl8RzEQEAAA==
X-Change-ID: 20260313-gpio-timberdale-swnode-03b1a0945359
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mp6cPFK/Vv+GXOIepyLHSkp+q7Q1z9lsaX38R7rjd80=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxmCkJ6q59MJkmnAafDheOMuWKHmB/cJ4eXved
 +/16VMHSOGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZgpAAKCRAFnS7L/zaE
 w9uBD/4/cK7Bl7ST2FgR0tqQkTGXAnLGR32w1/jYYcGlUjkRdx+uTw2m5EC8OS+SPDH9N3tu8WC
 I8pxBoD+jIp4NSShIGU9WBAoS32dsQcJUL5btFUkEsiwo8hIFHdM1mSJuMqjMhfxrsIz06eeZab
 T3AlDA08+VBrwKW8Dof3bKZhpuhtyxGiq/ETHfr/B0u9Nt7e0+do1D0v4H4ZswOVOSUcP2dIuNF
 ymOOMAEh3EFQoYXQbC8ydOd//NF7WRiLtWf/QpZoX7ozxD6mFXKmePfjfihqYaI7HvGqAerwNYQ
 zU2jrk4P0Ndn+htxsNIVPlwY7ihLHK3phnWipLBM3DULV8XXL9QvSdoyjt+3THXrNdHwedqLu21
 yzr5oo7DMQgVkwvmCHx2Zuz0Jta6Ww/c0/d3WOUZwNTRfRzbKRGvx3ecs4QGlhffA04ll7y8pLN
 GqlWHuZlf23T8oUHepk2qAz2JCeN0lmV5f0KJ65qhoDannPn/9AEIt3YH1ClyvUuBbO6GMxDM+b
 zNEsF7jgjl7Ybc19qy76FOhcsem36hx/P5sjos1sylz+LG2NTxYDc9tUqnq2EgHBfMNZReoAwAZ
 SWizUlPYRbkLh9V9PTvlXaRO2NeUZXAxZIQ6JOMtwYMQWDxqzLNS1DWOMrkvNfAzAgfJIOkN9rj
 U9scL5vmHJSoXiA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c660b1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=p6-fBqgG8KB4fA7HuiEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: VOgKf69nN5CDSfAZX9HWPppeQgDrZIB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX5bISqeT3xY2f
 3w4mL26WXw0biDJJYskk4XP90EdLXiBNHl0S3afXdqoWt0sbjTaUVPe6suKxGJZyuSpRqxI9Hb3
 s6D6b3ypzBgto5woUsot2aOrTODLc60qCkO9Ecib9bmGK+qcd7KB4cz91pqEmSvJW0f2r7+MRyM
 fRnIW45QzQs0Lh1KUDPxutOHxKc9sCOKlI+eJvDQvzULOGNN7sUbG4wUrvBE3wn9eQ0PFscIv+G
 qif/lMWeY6CvfG9TPPfy/ztCD5Yojpk6p1yc7soYmxHiy3EUU1Le1oeM+bmwtaJUcW611kN93UO
 imzkI/diglecXq+C/JQvveUNbNKfVZeDM07fT/AzZLhNjln4lABQ6pa0fk+GlO4zPvhMIsj6IyC
 9dN2FJs0HLRH31ulfOxlXTQs0E8iqvLOEIug56egEscJcz0a7VlO/HnJ5nJf7BkCnDrJXPpTjqU
 uFjxr2bDYWapaddGU0A==
X-Proofpoint-ORIG-GUID: VOgKf69nN5CDSfAZX9HWPppeQgDrZIB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34248-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB6D034308A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are several GPIO driver header scattered directly under
include/linux/. I'd like to either remove them or move then under
include/linux/gpio/. In case of gpio-timberdale, the platform data
struct can be replaced with generic device properties. This series does
that. It can go either though the MFD tree or GPIO with an Ack from Lee.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Replace magic values with named defines
- Move GPIO_NR_PINS into the MFD driver
- Explain the advantage of using device properties over platform data
- Link to v2: https://patch.msgid.link/20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com

Changes in v2:
- Change the property names to make them consistent with existing ones
  used by intel
- Link to v1: https://patch.msgid.link/20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      mfd: timberdale: move GPIO_NR_PINS into the driver
      mfd: timberdale: set up a software node for the GPIO cell
      gpio: timberdale: use device properties
      gpio: timberdale: remove platform data header

 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 drivers/mfd/timberdale.c       | 33 ++++++++++++++++++---------------
 drivers/mfd/timberdale.h       |  1 -
 include/linux/timb_gpio.h      | 25 -------------------------
 4 files changed, 31 insertions(+), 54 deletions(-)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260313-gpio-timberdale-swnode-03b1a0945359

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


