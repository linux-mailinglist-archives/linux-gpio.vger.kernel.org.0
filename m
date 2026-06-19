Return-Path: <linux-gpio+bounces-38703-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0uAI4r+NGotlwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38703-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 10:32:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A76A49B9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 10:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ObYttbRR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XjIpCjv5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38703-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38703-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB9BF303778B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 08:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AEE34D385;
	Fri, 19 Jun 2026 08:32:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A4BA34
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 08:32:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857927; cv=none; b=sJpAiJ1SHwBuAAo6ScYZrY9b4AkoDEmjGxKEyZ8vH6+wQ4jhuDPsY8JW6EfYnqx+LKjQaaQCRCeh4iWKV0lmF84Sq7zISgoyGARzU+GxTkzdfszH5KMLxT22y8tQ+nSIXl26nrzGu45+0uLpKOURvITMkZIe8LGFySZD+e6XQc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857927; c=relaxed/simple;
	bh=FnaBiCnrQyq03k2gZX9tac+/C0Yo+iAvciKVYwcSjBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5XZVvybScHZ6IL1RnIULNRfPGddMWUm0pX0paFoEmZzTJrQiVMKGALU6JUaOYiWB+SEOuHgg2plVKoaIDbt06C9/+aDZsps6CycKs+KW2qabbNeyAJymU7u9N6xNZTOpxRPdX6Vz0QwCdsC/TAe8Nh3YULR9ZL4useKNEa/eD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObYttbRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjIpCjv5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q6wS4033855
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 08:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DJiZ4WBIvUo/A4yp4gf2bIUteyqtvz71LldtQsn06s=; b=ObYttbRR1qMMmQnR
	S4aVci/jM/QcakGazc2jbdrixxK4fQUC+cJ4q6ab3p4j0yKSy9gAHDXobQMvFzqQ
	KkD/CJkXqhBeX2lqxCd8+2HOvT/dsL/95tKVTWHaNy307i/SASOosav/4wbc4dmJ
	bou9S8W3/wmj5/yKk2RTZEh5e1uqDZzZLz47kiMdzaph8GGDkHu+kHREGcK0F7GJ
	IOB20d1M04VgTbJL6FyPwK368IMfAmEpoz9OIx1Ya7o3Q2A5OUqOfftPhdYYBoX7
	3+KTGbHiH01VBlV7jGjahYEUJG3gMENifklVy/6Vzz5pIuaAIIo5abBBQW6/KDtk
	gPJnSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sagry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 08:32:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157db42dd8so405827485a.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781857925; x=1782462725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DJiZ4WBIvUo/A4yp4gf2bIUteyqtvz71LldtQsn06s=;
        b=XjIpCjv5OX3OD41JEnXgDexBlwC59fLooC6nm85EbBeSF6iXaCoV/Uk0N69GD3wc8s
         y4ZY0BCGvk3+QW8wtWs0xysqNJ/9dHH0owMjxKfxpIDtZl/DrhVf00iRvNMz35b0ff4U
         nnxbZx9a9PuAdh3kqtpA4HQEqyEF//bHarklRb9kGMc88LarNzm+ZsOFM3yz8QkMF5vi
         6O810T+ahAWV2DGLXyCR0EKvBo9R21URWDz3BM/TzUjCpN6iqbSl2+KuJsHvsUwU3nix
         jixGIkUFP7Ay3WdHGckhF2xkmdvHFIrM5jPNPNkVl6qOW20eafn1SRjOGfWHoDqX5ULf
         SpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857925; x=1782462725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DJiZ4WBIvUo/A4yp4gf2bIUteyqtvz71LldtQsn06s=;
        b=fN5lpykoyY/CmnlPlDw+maCZyDvf4CUFJLhYa9UbBvOZRCrpozK6fchtJ9CSjR5thf
         +xuyk7UGGDAT5X41i1/ABbRxPp5egKgoFrVpCB9rfM9eFmRPJo6gr1uM+jjITSSVTL7w
         7pIrDRDvjkPmA5wrgMeqQiVkjGezKRGj54O65d5fofNRqO1+K+d3/UoVjs312v/CGXoN
         wS2HYXTB/up+zq+dZA4v3Pznyhz1/43nBuFv1J/ecXBRcJlx1ZnWMdKWFqii2ygGTHc/
         +uelVBfwY/GzxtL1LXPOAcJEKaWUZOy1d3QGF45WOsoBykp9V5kNuYM3ac4v1VHd8zWU
         Oudw==
X-Forwarded-Encrypted: i=1; AFNElJ/OG8+mVaF7uiHmFN+5vWGfW/od1r3g3TZCUlfY0YIBJptG8y5BYKO1NvW0RmNQQmaXk/AzXQb3UHF2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7xnN60aB/gCUbxd+HF4paizEp2i8Q2oXNAWFiMWxh4R3RM7aT
	lmyc4o5VucJuQTLn+Qtu93WzlBsn9G/J3aOGUjzzZEoU92nuCBKLls+cKGBkTIdfiKCy59y+P+/
	ExYEt0822l2PQcjTRTmuD3UUWRHVdWjicmybumJyHd/8o6Z63czmxPBTqAAaKNRCS
X-Gm-Gg: AfdE7ckgzXOw8JqU5Y2n8Xfv5HqDLLbrtMcR5ocY5QmOOQ0m65pyFX+pXtY6HibK1hF
	DEmcLi8YG6Gl46KKq/hMzfTMGnDm0x1WZlv/vm2EPjTu6fab1xjnb3J9K3E8jSM0FBKrpWg3Ib3
	WZTH561ETCa+4LW/uxZ+o1dTaswyEK6AaXcfpEXNjNLXPNvOzeYgSAJhX0AHZjQnG8BQGihs1mB
	lgCd8A/dJtpXMzk45GbQ+GwrdZbdil8tbdsPJWdrtoSj0IQ/34CCQMHVzoMRHI1YdDnJRoDljNk
	8G/VrHBgZYVXwlRg8LZbHtpiYfhmolGK2S7fMw1Hvh1XEB+fE+p7bC5v8Y5L/7Z6Q+3G6T3Bpkv
	j8gSI3NyQPami6eeiZrUeqaa8Pm6So7QJoL5uNsM=
X-Received: by 2002:a05:620a:4142:b0:915:89d4:df1e with SMTP id af79cd13be357-9209139778amr376544485a.27.1781857924688;
        Fri, 19 Jun 2026 01:32:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:915:89d4:df1e with SMTP id af79cd13be357-9209139778amr376542485a.27.1781857924264;
        Fri, 19 Jun 2026 01:32:04 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3c8c:867d:dddc:8715])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b359sm48986305e9.9.2026.06.19.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:32:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] build: gate subdirectories on the *_enabled variables
Date: Fri, 19 Jun 2026 10:32:01 +0200
Message-ID: <178185791849.27065.2802490339511515392.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617-meson-enabled-checks-v1-1-2ff45c7691fe@oss.qualcomm.com>
References: <20260617-meson-enabled-checks-v1-1-2ff45c7691fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ecte38eL9-9fXJiHRQGuKyTnKWndljAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA3OCBTYWx0ZWRfXwRtwDiAv6H22
 GMrX5loxO4+gUL9wvPV0yIB46p/frw5HuesYE3wy1MyrdEaIU02+2G+dIBx8DrBaZNEX4p8lI7n
 wUJ3VXchc8tJ1akV50Gv61eGRxilmyMJz+QP2d4/W/owtzLVxaPDfSjmx+6sstWfyWHNKXZ6x1F
 DqT2WY3VhOaKqX6NqtK+ZUa80qPMa0AJctiLIP3v/tFtIe9293xgXFfLXDsdxkovXHrH/pbaT/S
 eMs/uD4gbFE8wi5KfqE6KLjy5kHsgNDTMxmHRpmCtyJePpFpgG34jYpqHhzHIJlEJ1jlA7ZCYlB
 WmRFZG0tUUMtJCusDqTGxG7zb8koZWMHbPRX5MaURyjPnRmoGV6U00PiSZRPh3otxGcsWSid2FK
 M38u0jn+0xzcbBnaan+TNboAAXn/h5dtrBCRvklxXvRSYkmwn9fuOKo6CXCPAmpIpnhAyDL1ZDD
 96AaoC/uTLX9md0dUBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA3OCBTYWx0ZWRfX7UUHgh6hFKbG
 mJrlL/Zy2f4BnhAOYj/Z0lrSnq5+kZTCpFE1dmXTJodZtcGwRppIUZhnRKmTsxb4tPt2ydcwu77
 ZnRLh5dbS1lEnqjSFyzNjS8BmQ96cag=
X-Proofpoint-ORIG-GUID: Ecte38eL9-9fXJiHRQGuKyTnKWndljAw
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a34fe85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=b6V4cNkHXip4hyIWhyoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38703-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: D56A76A49B9


On Wed, 17 Jun 2026 15:46:28 +0200, Bartosz Golaszewski wrote:
> The top-level meson.build descends into tests/ and dbus/ only when the
> computed tests_enabled and dbus_enabled gates are true, so the test
> helper libraries and D-Bus executables are only defined in those cases.
> The per-component subdirectories instead re-checked opt_*.allowed(),
> which is true under the default 'auto' even when the dependencies are
> missing, and then referenced those undefined variables - failing the
> configuration outright instead of quietly disabling the component.
> 
> [...]

Applied, thanks!

[1/1] build: gate subdirectories on the *_enabled variables
      https://git.kernel.org/brgl/c/40538a7b48c9a6bd50d6253f86fdcb354b45073b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

