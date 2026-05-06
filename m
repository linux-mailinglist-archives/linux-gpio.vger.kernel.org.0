Return-Path: <linux-gpio+bounces-36262-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDlKDMj3+mmlUwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36262-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 10:11:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F894D7AE9
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 10:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67ACB3017275
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 08:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83793E2743;
	Wed,  6 May 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qacc7q2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYmzkP/5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683923CF68F
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054946; cv=none; b=VsAWrpLyWVbn38LVxGlWchVG0Aa3K5F45Lp72ZoET5kBRiJekz3Pi3qryE9l4Ku68DFP+tlKT+WR2YALKV3WuUyUVHNwq2RdwOLL6TUWVs/p2LM8RGMKOaZdrQXyrk2O8c0nq+Sig0Lf+CspSyOr2IZYTqs2+XjaamjIGMUif4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054946; c=relaxed/simple;
	bh=P+aIVfeZyl/NuFW9I6+W585jBf3YpKwwP6L50Z1Ia+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHvY4tvZkR5MI19TBVzxl5sSa8z2Q1bCEXmkqLZF6WpdTzV4kTJ5GqgIE5pUdrww+28RAoIlsSD/DzjrDBRjNUWsqm/BsXQadjHuBD1/T9BGn+wQ6OBCvEkZw+1oUHJEnRLbcmbWztjtX4eTJnzIJL+UtzIGbzeM6Fwj8ipm1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qacc7q2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYmzkP/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467treL2427900
	for <linux-gpio@vger.kernel.org>; Wed, 6 May 2026 08:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaAmCd+SBWMRZQ8hFYtrPf2PXb34pZuhF9Y+T5OYGPY=; b=Qacc7q2HcJQCjpOg
	DHPXuyUNrLXR4o/TEjWIV4CfhvjDFKKsUKHyTDCnC1A0GB/qkdn/RbOJ1aLGHD1s
	K3+M1njSiehcRjNeoCWq2u+LfEbmdVtK5I509I2nyqLqJzSuLgN/jhb1tqam9n3X
	BKR3TLoB8WNYXr4WhQb4XrnVJ/vNr4kLtvn2mxFCqJrM/brvYteIpNyjnPEGvKmI
	pVRvFLSs75tNKBsXaBKxWjQIyfbxOvhE318LwiDfWGYLgqNsJ/CjGR0gtScpy8tP
	99sf4dSJjXyC0tjzyG7mlW5NGn89u8JGH16t/7fowtH1SjT7aKQcMRiaCB40K4dy
	CLiX8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph02cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:09:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so17626311cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778054944; x=1778659744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaAmCd+SBWMRZQ8hFYtrPf2PXb34pZuhF9Y+T5OYGPY=;
        b=VYmzkP/5/8UReyvfpdz7AAAZ9+WwwW/xfWPdlANhpGWcxpxifwplYufH236GdZdCAg
         1SXTQOICIpnJVi1VmRxRaK/BVjwa8q2RoL18lXEaJLzgtYAS/OuD60sQxihjm90D3WwV
         7taYs7PunNZyGy1A6MIYsyyEMj84WiyPyNhQ9Cb5x1QYsm1TjQSN4/VLu/VksTUQV+Vj
         wic7tIH9kB6+Ql+XeDzEMiMmuqcLDS5WoQGbAPDnPduNj0RZSFg4D1gPDOZ5jfu5J9fr
         DF95leSPiH83l9o+qF6ukPir0XQUuErte5pPiCTNk05FcjKWp106mtCZWBhJp/svXnwj
         LgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054944; x=1778659744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XaAmCd+SBWMRZQ8hFYtrPf2PXb34pZuhF9Y+T5OYGPY=;
        b=o3+MfqQHgHAkX9rUuvHKbEBTPJ1OZVK8Ib4rjBP+kU6+ffXtCbLgSZYFi6+bsZBYdI
         AvGKCIHl/8KYbR6LKHEl4vfEf1cg3jSlh01G1l1d6JdHWq4MxxgrWRWQc+TCDHuh8zI1
         Bo9ObNMS6RvKea+mKT2HuOv4PDjtlsnmZeAzrNd7p4e2Tv0zYrRFe5P8WSSQCWo7Lnu4
         LEKNZoNqoqzDKSCekBNqjmaqiIs1iwxKAJjYkif0KM5Ote+rWykGWGt067sketv2TNdC
         uC3AAK0S7KMs2Q6ZYEcWLaBu1ly7zBm+0mbKgu5Q7rB4OKTKNjvcdrWb5JT1L0B+OxQo
         i4/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8g/O3E1pRBnOd5fwjx8eluqhcs89DTKjCCaIcmrJxURCgu9HqKACvuzIKtvcsEMJaD4q4kklU21p3M@vger.kernel.org
X-Gm-Message-State: AOJu0YxXS5wfPNWn4CVN8oxZPkktPKpEB8QheAxq2TcIISf7kEEogJc+
	0cOdKjAN+bjl7QAZR/Nnk39HWT02P8coQ33c3H300MJCLQboG5Pw+newl0uyDBaljUjgmJICXom
	hoIzDj6CwBQOewBQ9oNo7FNX7CqfvoOXpjIPEY4nokv6KJQE+TIiTwhgDK0pZexnR
X-Gm-Gg: AeBDiesPe9Yf+bBvqn0Gpo+6Ko5e5FsoyTPcxQqwVAYNPcOMMPix+uxfdom2DOmWvF3
	UV32fIdu7qz62k2xvjGle2r05+VKsktqk197Gpmc0/nq2wL0gUds4PK/LvqgSZH1DupRmtZ31Eq
	D1l1N/6IlrDZQGWW9GR5H1YnSQEe1IUA+uhBjxnWof2egaWKeKthlvoBXcBD1PjUILYDwi1TvYx
	oz3mUn35pwRtY+4DXlQcoZjD1z4uXJ8Ugd/y7YzZofaSV+OOWivC/bKzknM2trmhNIs39GDaXc0
	v0nYGzPJvmhiSmoXmR/l9DUhN+Udl+DGzF0SUa8fdKBsnbbRskVEvgtW9YxLm0rMpgWI0DJcjXi
	Ijld03NFDgVjjfUckAq6Yn/0QY7ABhaG+friXTwQ+M7HfwEk/AiR192x0VFqE
X-Received: by 2002:ac8:7dca:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51305285fd0mr90894691cf.10.1778054943578;
        Wed, 06 May 2026 01:09:03 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51305285fd0mr90894561cf.10.1778054943140;
        Wed, 06 May 2026 01:09:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1cd7:fa68:b1e1:a93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530c1d07sm10955095e9.9.2026.05.06.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:09:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Chanhong Jung <happycpu@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: 74x164: seed the chain from DT at probe time
Date: Wed,  6 May 2026 10:09:00 +0200
Message-ID: <177805490864.4124.505982607018854833.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429035134.1023330-1-happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com> <20260429035134.1023330-1-happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3OCBTYWx0ZWRfX1prEuwqqUFGO
 5zN70lFAIB5XPDKg02kjUc+f2Z2p/DMNVak1MN51V1U4+qJOgLRsJT9OIAy1IymdeoeMqVVrGAN
 h8VUkAKRfDHAYALVrsrLRHDbjqUjJg+gJoh8pRaRnyQcCNr15J1e8A+ILoJqByr00kRRx0uW/tE
 u/JAmC4dLyDOsdrS4wzK5haO7zPnbn+0GLhRHktjb4ot/2F3kwvS/3bKHb2rZdjyhXuPUiA2/G2
 T36HtvTMMlWdAlgkEcPdO1V4yLXrqwGNY74xIRwUdR/lRKdzl0UUnew348krUTxpm+r20LZYdmr
 MPnUr93eM+nB9F64ApKKm/YacatH42Ycxsa5763lERqu61WTW6Nmo16XBxXI4IjGGPPOsScSTWR
 fe17um1TTADdgGCYa0eAVWOSXnkmKu5GSGTAnEYJOWXgHVO3X+UhX84POs2yUyNsNVua6KhuveJ
 t+VNZjMxK48JGF9eBQg==
X-Proofpoint-GUID: FHtKEwyjSg64HVgFhJI-2_d5-93nFp0v
X-Proofpoint-ORIG-GUID: FHtKEwyjSg64HVgFhJI-2_d5-93nFp0v
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69faf720 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=h0xZeIPYvt9JjOhX5-wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060078
X-Rspamd-Queue-Id: B6F894D7AE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36262-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]


On Wed, 29 Apr 2026 12:51:32 +0900, Chanhong Jung wrote:
> This v2 reuses the existing lines-initial-states bitmask, as suggested
> by Linus Walleij, instead of inventing a new property. That sidesteps
> both the v1 review concerns at once: there is no vendor-specific
> property to argue about, and the bit-N-equals-line-N convention is
> already documented for nxp,pcf8575.
> 
> Background (carried over from v1):
> The 74HC595 / 74LVC594 family is push-pull output only. There is no
> read-back path, no defined power-on state for the parallel outputs, and
> __gen_74x164_write_config() always shifts the full chain on every
> transaction. The driver therefore publishes whatever sits in
> chip->buffer on the very first ->set() call, and today that buffer is
> fresh from kzalloc(), so all outputs come up low. On boards with active-
> low indicators or other signals whose initial level matters, the 0x00
> publish glitches the chain before user space (or gpio-leds default-state
> walking) gets a chance to run.
> 
> [...]

Reluctantly applied.

[1/2] dt-bindings: gpio: fairchild,74hc595: add lines-initial-states property
      https://git.kernel.org/brgl/c/d6e1a94888f5a4306c9998944a0f29f7bcd49411
[2/2] gpio: 74x164: support lines-initial-states for boot-time output state
      https://git.kernel.org/brgl/c/cb77f8933467d08c8896674cd39ca98550a70fd6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

