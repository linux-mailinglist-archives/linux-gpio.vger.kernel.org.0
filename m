Return-Path: <linux-gpio+bounces-36741-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMNPCOVkBGq6HgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36741-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:47:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9AE532810
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7243F30872A6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4567E39099A;
	Wed, 13 May 2026 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJVgNseP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbME3NeO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0A37DAA9
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672856; cv=none; b=lhgglZfD5P8ImUOUxUFieBChKCVwu0CLhdcimKicmwBIqXVbIKeh9Bmmvr+GW4Ynw+E0zpCoxRm8MMA5X++duIV71RKCpiivQuPk042DyJByiyiakB7QG0ev42nLYoz0nFP0RJarvqmEoanh6qg8EdubGXIv+3/gpRQut5sxNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672856; c=relaxed/simple;
	bh=pYvGHUEMH9axsPbwsBDLg9hArLWJFnGaPIfS/ujuSVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BNaTS/jl0e5oud/+vh/uIRH7DKrldpqJDWO2dicqNRlXq8/jzKbZJ+t+Leb3fE1bk26KG0yuvQL8qY+SmBI8pZnsaCfSo61NjI74sOwod5zuEJm7wv1DIe4B9Z0ipFm5M3A6HjINIhV7VFwpihepcWJ3UEg+jTEVHed+hzSI/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJVgNseP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbME3NeO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9oeWn2338837
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2CzzWp8VUGFzhGIkTqOGgaysO80SSmVjHS4kPqU3XI=; b=CJVgNsePJJw4jUyW
	e6tbGxTJ9fDRM2w+fM8NRdQSr/O1vcwpN21dQIAZ7vgfcpUcD1XzXsOpDWQViS8t
	eJDuPlL8Gw05zbcBaQdPhmBLv0fcgbt6UaLhPujvfj3GB1PVjz7XRlpiBKKaCgBG
	s+KbPc0pkMTGw2QYwWh/0gPVVqXFzxRVOisFY2dr6XDJaAn0TH5EeNvWr2zvxWko
	tNG0gYjgY0IHEh166TUDzMXniZDTBV+zsySI8tLnWLuwSfE9ACgxqQRie0h0zS7c
	w+IKyVBrjGRk72n9BlHuVf5p7sSZ9kZpu5jX1TlKxHY/bE/Wfcw/hE4bqjlII/Uu
	yVdrxQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxb8qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff0bef198so135338521cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 04:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778672852; x=1779277652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2CzzWp8VUGFzhGIkTqOGgaysO80SSmVjHS4kPqU3XI=;
        b=TbME3NeODpe6AtsR/nmHPKt6NH0Qzla3hFIRapGebMhzYNXK7asaQLlSh/F5Tzze/0
         CzR00IuSW1De5s501Yrpw/fIu2Z4VlOMkJvG0o9/t9h9j0PW+GuXd4XiWMa2g7kn+kCV
         REhBAN0cZF5accR6t1L0jRUYaBBe93mEXjcWnR3fD0geyrSOqxDWeEyVU8Wkp5ax3MOL
         IIleCxX1Mc66kYlHaWwQWKhHf3cEZB5DBH12zqCJRPPfYbCoeL2HazSgCWFel53eV9YS
         PiSGfkSyIV1+vygRo5250dHQXmZY955bKpfltsZ9+RI+s13kHRbchU5lSx2i+a3TEi+5
         Wl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672852; x=1779277652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y2CzzWp8VUGFzhGIkTqOGgaysO80SSmVjHS4kPqU3XI=;
        b=OOvXGwLVsoReqpuXvgEeZBqUcegn7TvT6LjXMNwQZVwBpSH4dlrzVcy7vwt6dF8b1z
         dmGWF3aUKbjbTtPcsg2noLQxjpyDvuAIAa5izOzBKSy3OmWBSfNSMcES/ttOWG02tk4k
         k+S0l4KbrUepf9q6cn5qzFffUbOV19RcF/jfZq6NE1BPYd6wZp7dQ80/Eg8aMAsVnN/K
         e7K2ooajOzen74WbvwwMqwpNnvVWvWEA8csachsJQyFGd4nmigIAhDvnHvehccZ00h2D
         E0xsHvbPsx4VJ1UU+Eqcpwsv4LQuE2ppwR3vXCSgmLf7F+kJmruEBDXJlZ9ZZBoUW5LF
         hcjw==
X-Forwarded-Encrypted: i=1; AFNElJ9IjWhlsNrncu3LUWNRIYMdNV2RM7tPc5qNoJ6w52VukIpVtBKD3Rx4FT4IbKkcTrcUC3zvm3eZfILw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PjnnB8oNEegzwBJKZA81e2RW0Peyn9y11Cm428E2domdhJnJ
	7vFgn9uSdEbo88wsxFXL24dy9s3yoFftT5ZDJsmS6tN3EWL0HfwlOp7TQeDGpq+EcY53UyQdLgZ
	wRuM/pv/zr/YBtMzznVErJ+QmkBU19wb2eBJjAhaeR0OAuhZAD0e5suzKOc6r107H
X-Gm-Gg: Acq92OHyrtaHvai3IoLtNglOwX2ncJ12EPaiJcoedVWbXuZBxiEsEdGbn98EKt/9juq
	+EE0HzBBXKJMGl0/IxYLkdBcSeae49PEjAWiKKYfCodOKW047gqJ/7SvwKgn38mlEU5SBR9HzX+
	WHR79K34SR/Zfm7hDnoPJoFMsLz8hrPgw9gwCI0CkIU0BfY8RC+ddZ7z+ZKE1q+hng9VkEFbqtN
	qixDFHASC/T5EJ2lz5HzqsQZ01AG5RWr4JmvuiAx6Jk6jv9Fq9WfTMspq4oHt8fgv6jy4Z2Vtcp
	CkvhUKWVeUY2M63FDFeND5zsjKv5qqhwEgq4FY+JY6kcIcRDjR5nzQuHLT8sUp5OJ3Qh7cw8YW5
	nG/E4mITmTy+aPE0u2d/yATwP0ZXuQkvYnbCwye5BSycAxfmFig==
X-Received: by 2002:ac8:7e92:0:b0:50d:a6a0:8f09 with SMTP id d75a77b69052e-5162f5a0f55mr37163881cf.39.1778672852333;
        Wed, 13 May 2026 04:47:32 -0700 (PDT)
X-Received: by 2002:ac8:7e92:0:b0:50d:a6a0:8f09 with SMTP id d75a77b69052e-5162f5a0f55mr37163431cf.39.1778672851806;
        Wed, 13 May 2026 04:47:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5f00e8sm41615855e9.2.2026.05.13.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:47:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 13:47:13 +0200
Subject: [PATCH 2/2] tools: reuse libgpiotools
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-tools-common-shared-lib-v1-2-58ac28a9f1d5@oss.qualcomm.com>
References: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
In-Reply-To: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Alexander Dahl <post@lespocky.de>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14057;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pYvGHUEMH9axsPbwsBDLg9hArLWJFnGaPIfS/ujuSVs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBGTNx/CAMeF+n8ToSZmu2OCHBFUp9Ns1OO6Uw
 LuwMl+S+ZqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagRkzQAKCRAFnS7L/zaE
 w5/yD/sHyM/O8t9aXTkeqKQZkWMVtSjfpeOkRYG4a6kSynavlda4+mEQUNJayRO9Yp3MJIlKmDn
 6Z/cGnN1C8t0bPx/CF4KS57Qfqd1awA+aV4Qa5oz7n2fCMJfgKxt+RURJbnHepovSLLB9mPTKJ9
 u7Wpe84nxImxFyvCoSud+5q86RWZOaqwyDjZi/w6ncYG5WpRT5qWd3xgudDU7xFnedDWab8azFg
 Wf7NTAeaaf1Zkmb1f0Yt0hLWKFSKa3scGti7Xu2Vpg5VUUyhjJI/P8XtdNY8/trgtCPATQ35OPt
 SIMIKxiqv9LpMJOfnlp/M2YedfpvAG1rXnEGpKH8pcNErkGXmCdyJ4HzT/vKpWEw2ipZCClXD6J
 Dg18dPg4kIQ3JXR7lWmyu3cngWGepVjSkl42M+dGdp4KI3MQWeNvrGyzLTsfIzXtmYxBfm3wHTZ
 TzjjxuzRqdHqNlPbZ/TFF69WcYj+/1YHW0XyoaUw6CR2B1bg3Ek++qSWJmFiHUO1nUtiLiTz3F5
 PPpfEYA9RYdJUGSyTUdv98o8fUw2fARHey5WFoyLACiu2/9I+PQAkUyfwp301Q0eW1fUAICi7D+
 P3+3vgrHuWLCrFa9Rq1kQkuO+IniK7KBmcVhtmF1DLcCo09KBwuSprM6fDS6hMBlA7+Ei/PQuVR
 1ENiC+dTM4zEJGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: uHqNsWyn0YfT8W3pZy4EcsubfQWFqSod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyMyBTYWx0ZWRfX0sDbjcVWsswJ
 BKKYQnhbrK1iiDMJPSgHRroS6DpDcUA6RiplZdgCEbkzm4vI9Kcz8vq0LYZg4JEKjEo4X+pWaG+
 EtHzaGPrMGva4Z7C40mjuDDZ93Gyx58WWDsD88G4ABTqIKuiyvsfQJ4OL1DleaxaQuoobWcsLzU
 +09mdwZdzNqymAdYX2Z9DLYXXlyaIHHd0Rl44yTFcAx0eQgDKRx95K4e0su/XKK9a7ua8B4sMyW
 GMY+zL6VROJiOuSu5UHM2J25fq5NXnd07yct9Sv/2j9tIKZmbugMBMmActMoehnxHWRINoVYa+X
 rnzFZxOPZJUFAP9uALa8s1UJfTUrDYix3YskRVk+C5wAMS9WrJPB2uM89yfOeGBfX6K/VqDIEXm
 2LKn+8G2Vm2hdGkQeBdwmXi83Ajz9thhi52VTKqFI7jW0AyC10HyFC6giPdfdLItw/JdsxMiBoq
 jzbYpB/u2dmF+z0javw==
X-Proofpoint-GUID: uHqNsWyn0YfT8W3pZy4EcsubfQWFqSod
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a0464d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=uqiAkArUBbFli4ZbaFMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130123
X-Rspamd-Queue-Id: BC9AE532810
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36741-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,xes-inc.com,lespocky.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Reuse as much of the functionality provided by the new libgpiotools
shared library in tools-common while retaining the functions used to
validate command-line arguments, print help text or bail-out on errors.
We keep the existing interfaces to gpio-tools and use them to wrap the
API exposed by libgpiotools as we want to keep bailing out on errors
without requiring tools to do a lot of repeated error checking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/meson.build    |   8 +-
 tools/tools-common.c | 316 ++++++---------------------------------------------
 tools/tools-common.h |  63 +---------
 3 files changed, 47 insertions(+), 340 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index d755167cfbd7c2a7400d28cf5e5d5f9eece699d7..5ecf7dc5d221d52243478f9a126e6512d2408981 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,9 +21,15 @@ pkgconfig.generate(libgpiotools_lib,
   version: meson.project_version(),
 )
 
+libgpiotools_dep = declare_dependency(
+  link_with: libgpiotools_lib,
+  include_directories: include_directories('.'),
+)
+
 tools_common_lib = static_library('tools-common',
   sources: ['tools-common.c'],
   include_directories: libgpiod_inc,
+  dependencies: [libgpiotools_dep],
   pic: true,
 )
 
@@ -33,7 +39,7 @@ tools_common_dep = declare_dependency(
 )
 
 tools_c_args = []
-tools_deps = [libgpiod_dep, tools_common_dep]
+tools_deps = [libgpiod_dep, libgpiotools_dep, tools_common_dep]
 
 if opt_gpioset_interactive.allowed() and libedit_dep.found()
   tools_c_args += ['-DGPIOSET_INTERACTIVE']
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 5aa51197c521a373b421054459c8ef38f3a35a1e..56ed90f639790ec54a3d6e9eb6ad594104474d7e 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -4,8 +4,6 @@
 
 /* Common code for GPIO tools. */
 
-#include <ctype.h>
-#include <dirent.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <inttypes.h>
@@ -14,7 +12,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/stat.h>
 #include <time.h>
 
 #include "tools-common.h"
@@ -431,154 +428,39 @@ void print_line_vals(struct line_resolver *resolver, bool is_unquoted,
 	printf("\n");
 }
 
-static int chip_dir_filter(const struct dirent *entry)
-{
-	struct stat sb;
-	int ret = 0;
-	char *path;
-
-	if (asprintf(&path, "/dev/%s", entry->d_name) < 0)
-		return 0;
-
-	if ((lstat(path, &sb) == 0) && (!S_ISLNK(sb.st_mode)) &&
-	    gpiod_is_gpiochip_device(path))
-		ret = 1;
-
-	free(path);
-
-	return ret;
-}
-
-static bool isuint(const char *str)
-{
-	for (; *str && isdigit(*str); str++)
-		;
-
-	return *str == '\0';
-}
-
 bool chip_path_lookup(const char *id, char **path_ptr)
 {
 	char *path;
 
-	if (isuint(id)) {
-		/* by number */
-		if (asprintf(&path, "/dev/gpiochip%s", id) < 0)
-			return false;
-	} else if (strchr(id, '/')) {
-		/* by path */
-		if (asprintf(&path, "%s", id) < 0)
-			return false;
-	} else {
-		/* by device name */
-		if (asprintf(&path, "/dev/%s", id) < 0)
-			return false;
-	}
-
-	if (!gpiod_is_gpiochip_device(path)) {
-		free(path);
-		return false;
-	}
-
-	*path_ptr = path;
+	path = gpiotools_chip_path_lookup(id);
+	if (path)
+		*path_ptr = path;
 
-	return true;
+	return !!path;
 }
 
 int chip_paths(const char *id, char ***paths_ptr)
 {
-	char **paths;
-	char *path;
+	int ret;
 
-	if (id == NULL)
-		return all_chip_paths(paths_ptr);
-
-	if (!chip_path_lookup(id, &path))
-		return 0;
-
-	paths = malloc(sizeof(*paths));
-	if (paths == NULL)
+	ret = gpiotools_chip_paths(id, paths_ptr);
+	if (ret < 0)
 		die_oom();
 
-	paths[0] = path;
-	*paths_ptr = paths;
-
-	return 1;
+	return ret;
 }
 
 int all_chip_paths(char ***paths_ptr)
 {
-	int i, j, num_chips, ret = 0;
-	struct dirent **entries;
-	char **paths;
+	int ret;
 
-	num_chips = scandir("/dev/", &entries, chip_dir_filter, versionsort);
-	if (num_chips < 0)
+	ret = gpiotools_all_chip_paths(paths_ptr);
+	if (ret < 0)
 		die_perror("unable to scan /dev");
 
-	paths = calloc(num_chips, sizeof(*paths));
-	if (paths == NULL)
-		die_oom();
-
-	for (i = 0; i < num_chips; i++) {
-		if (asprintf(&paths[i], "/dev/%s", entries[i]->d_name) < 0) {
-			for (j = 0; j < i; j++)
-				free(paths[j]);
-
-			free(paths);
-			return 0;
-		}
-	}
-
-	*paths_ptr = paths;
-	ret = num_chips;
-
-	for (i = 0; i < num_chips; i++)
-		free(entries[i]);
-
-	free(entries);
 	return ret;
 }
 
-static bool resolve_line(struct line_resolver *resolver,
-			 struct gpiod_line_info *info, int chip_num)
-{
-	struct resolved_line *line;
-	bool resolved = false;
-	unsigned int offset;
-	const char *name;
-	int i;
-
-	offset = gpiod_line_info_get_offset(info);
-	for (i = 0; i < resolver->num_lines; i++) {
-		line = &resolver->lines[i];
-		/* already resolved by offset? */
-		if (line->resolved && (line->offset == offset) &&
-		    (line->chip_num == chip_num)) {
-			line->info = info;
-			resolver->num_found++;
-			resolved = true;
-		}
-		if (line->resolved && !resolver->strict)
-			continue;
-
-		/* else resolve by name */
-		name = gpiod_line_info_get_name(info);
-		if (name && (strcmp(line->id, name) == 0)) {
-			if (resolver->strict && line->resolved)
-				die("line '%s' is not unique", line->id);
-			line->offset = offset;
-			line->info = info;
-			line->chip_num = resolver->num_chips;
-			line->resolved = true;
-			resolver->num_found++;
-			resolved = true;
-		}
-	}
-
-	return resolved;
-}
-
 /*
  * check for lines that can be identified by offset
  *
@@ -588,57 +470,23 @@ static bool resolve_line(struct line_resolver *resolver,
 bool resolve_lines_by_offset(struct line_resolver *resolver,
 			     unsigned int num_lines)
 {
-	struct resolved_line *line;
-	bool used = false;
-	int i;
-
-	for (i = 0; i < resolver->num_lines; i++) {
-		line = &resolver->lines[i];
-		if ((line->id_as_offset != -1) &&
-		    (line->id_as_offset < (int)num_lines)) {
-			line->chip_num = 0;
-			line->offset = line->id_as_offset;
-			line->resolved = true;
-			used = true;
-		}
-	}
-	return used;
+	return gpiotools_resolve_lines_by_offset(resolver, num_lines);
 }
 
 bool resolve_done(struct line_resolver *resolver)
 {
-	return (!resolver->strict &&
-		resolver->num_found >= resolver->num_lines);
+	return gpiotools_resolve_done(resolver);
 }
 
 struct line_resolver *resolver_init(int num_lines, char **lines, int num_chips,
 				    bool strict, bool by_name)
 {
 	struct line_resolver *resolver;
-	struct resolved_line *line;
-	size_t resolver_size;
-	int i;
-
-	resolver_size = sizeof(*resolver) + num_lines * sizeof(*line);
-	resolver = malloc(resolver_size);
-	if (resolver == NULL)
-		die_oom();
 
-	memset(resolver, 0, resolver_size);
-
-	resolver->chips = calloc(num_chips, sizeof(struct resolved_chip));
-	if (resolver->chips == NULL)
+	resolver = gpiotools_resolver_init(num_lines, lines, num_chips,
+					   strict, by_name);
+	if (!resolver)
 		die_oom();
-	memset(resolver->chips, 0, num_chips * sizeof(struct resolved_chip));
-
-	resolver->num_lines = num_lines;
-	resolver->strict = strict;
-	for (i = 0; i < num_lines; i++) {
-		line = &resolver->lines[i];
-		line->id = lines[i];
-		line->id_as_offset = by_name ? -1 : parse_uint(lines[i]);
-		line->chip_num = -1;
-	}
 
 	return resolver;
 }
@@ -647,72 +495,23 @@ struct line_resolver *resolve_lines(int num_lines, char **lines,
 				    const char *chip_id, bool strict,
 				    bool by_name)
 {
-	struct gpiod_chip_info *chip_info;
-	struct gpiod_line_info *line_info;
 	struct line_resolver *resolver;
-	int num_chips, i, offset;
-	struct gpiod_chip *chip;
-	bool chip_used;
-	char **paths;
-
-	if (chip_id == NULL)
-		by_name = true;
-
-	num_chips = chip_paths(chip_id, &paths);
-	if (chip_id && (num_chips == 0))
-		die("cannot find GPIO chip character device '%s'", chip_id);
-
-	resolver = resolver_init(num_lines, lines, num_chips, strict, by_name);
-
-	for (i = 0; (i < num_chips) && !resolve_done(resolver); i++) {
-		chip_used = false;
-		chip = gpiod_chip_open(paths[i]);
-		if (!chip) {
-			if ((errno == EACCES) && (chip_id == NULL)) {
-				free(paths[i]);
-				continue;
-			}
-
-			die_perror("unable to open chip '%s'", paths[i]);
-		}
-
-		chip_info = gpiod_chip_get_info(chip);
-		if (!chip_info)
-			die_perror("unable to get info for '%s'", paths[i]);
-
-		num_lines = gpiod_chip_info_get_num_lines(chip_info);
-
-		if (i == 0 && chip_id && !by_name)
-			chip_used = resolve_lines_by_offset(resolver, num_lines);
-
-		for (offset = 0;
-		     (offset < num_lines) && !resolve_done(resolver);
-		     offset++) {
-			line_info = gpiod_chip_get_line_info(chip, offset);
-			if (!line_info)
-				die_perror("unable to read the info for line %d from %s",
-					   offset,
-					   gpiod_chip_info_get_name(chip_info));
-
-			if (resolve_line(resolver, line_info, i))
-				chip_used = true;
-			else
-				gpiod_line_info_free(line_info);
-
-		}
+	int i;
 
-		gpiod_chip_close(chip);
+	resolver = gpiotools_resolve_lines(num_lines, lines, chip_id,
+					   strict, by_name);
+	if (!resolver) {
+		if (errno == ENODEV)
+			die("cannot find GPIO chip character device '%s'",
+			    chip_id);
+		else
+			die_perror("error resolving lines");
+	}
 
-		if (chip_used) {
-			resolver->chips[resolver->num_chips].info = chip_info;
-			resolver->chips[resolver->num_chips].path = paths[i];
-			resolver->num_chips++;
-		} else {
-			gpiod_chip_info_free(chip_info);
-			free(paths[i]);
-		}
+	for (i = 0; i < resolver->num_lines; i++) {
+		if (resolver->lines[i].not_unique)
+			die("line '%s' is not unique", resolver->lines[i].id);
 	}
-	free(paths);
 
 	return resolver;
 }
@@ -752,75 +551,30 @@ void validate_resolution(struct line_resolver *resolver, const char *chip_id)
 
 void free_line_resolver(struct line_resolver *resolver)
 {
-	int i;
-
-	if (!resolver)
-		return;
-
-	for (i = 0; i < resolver->num_lines; i++)
-		gpiod_line_info_free(resolver->lines[i].info);
-
-	for (i = 0; i < resolver->num_chips; i++) {
-		gpiod_chip_info_free(resolver->chips[i].info);
-		free(resolver->chips[i].path);
-	}
-
-	free(resolver->chips);
-	free(resolver);
+	gpiotools_free_line_resolver(resolver);
 }
 
 int get_line_offsets_and_values(struct line_resolver *resolver, int chip_num,
 				unsigned int *offsets,
 				enum gpiod_line_value *values)
 {
-	struct resolved_line *line;
-	int i, num_lines = 0;
-
-	for (i = 0; i < resolver->num_lines; i++) {
-		line = &resolver->lines[i];
-		if (line->chip_num == chip_num) {
-			offsets[num_lines] = line->offset;
-			if (values)
-				values[num_lines] = line->value;
-
-			num_lines++;
-		}
-	}
-
-	return num_lines;
+	return gpiotools_get_line_offsets_and_values(resolver, chip_num,
+						     offsets, values);
 }
 
 const char *get_chip_name(struct line_resolver *resolver, int chip_num)
 {
-	return gpiod_chip_info_get_name(resolver->chips[chip_num].info);
+	return gpiotools_get_chip_name(resolver, chip_num);
 }
 
 const char *get_line_name(struct line_resolver *resolver, int chip_num,
 			  unsigned int offset)
 {
-	struct resolved_line *line;
-	int i;
-
-	for (i = 0; i < resolver->num_lines; i++) {
-		line = &resolver->lines[i];
-		if (line->info && (line->offset == offset) &&
-		    (line->chip_num == chip_num))
-			return gpiod_line_info_get_name(
-				resolver->lines[i].info);
-	}
-
-	return 0;
+	return gpiotools_get_line_name(resolver, chip_num, offset);
 }
 
 void set_line_values(struct line_resolver *resolver, int chip_num,
 		     enum gpiod_line_value *values)
 {
-	int i, j;
-
-	for (i = 0, j = 0; i < resolver->num_lines; i++) {
-		if (resolver->lines[i].chip_num == chip_num) {
-			resolver->lines[i].value = values[j];
-			j++;
-		}
-	}
+	gpiotools_set_line_values(resolver, chip_num, values);
 }
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 165c250f8d664687d06232426941020e0c8a4ae7..85ee765255bbba991cd2e1fbe6b727a9e998d47e 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -7,6 +7,8 @@
 
 #include <gpiod.h>
 
+#include "gpiotools.h"
+
 /*
  * Various helpers for the GPIO tools.
  *
@@ -19,64 +21,9 @@
 
 #define GETOPT_NULL_LONGOPT	NULL, 0, NULL, 0
 
-struct resolved_line {
-	/* from the command line */
-	const char *id;
-
-	/*
-	 * id parsed as int, if that is an option, or -1 if line must be
-	 * resolved by name
-	 */
-	int id_as_offset;
-
-	/* line has been located on a chip */
-	bool resolved;
-
-	/* remaining fields only valid once resolved... */
-
-	/* info for the line */
-	struct gpiod_line_info *info;
-
-	/* num of relevant chip in line_resolver */
-	int chip_num;
-
-	/* offset of line on chip */
-	unsigned int offset;
-
-	/* line value for gpioget/set */
-	int value;
-};
-
-struct resolved_chip {
-	/* info of the relevant chips */
-	struct gpiod_chip_info *info;
-
-	/* path to the chip */
-	char *path;
-};
-
-/* a resolver from requested line names/offsets to lines on the system */
-struct line_resolver {
-	/*
-	 * number of chips the lines span, and number of entries in chips
-	 */
-	int num_chips;
-
-	/* number of lines in lines */
-	int num_lines;
-
-	/* number of lines found */
-	int num_found;
-
-	/* perform exhaustive search to check line names are unique */
-	bool strict;
-
-	/* details of the relevant chips */
-	struct resolved_chip *chips;
-
-	/* descriptors for the requested lines */
-	struct resolved_line lines[];
-};
+#define resolved_line		gpiotools_resolved_line
+#define resolved_chip		gpiotools_resolved_chip
+#define line_resolver		gpiotools_line_resolver
 
 void set_prog_name(const char *name);
 const char *get_prog_name(void);

-- 
2.47.3


