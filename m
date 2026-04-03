Return-Path: <linux-gpio+bounces-34626-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H5LBmiCz2nLwwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34626-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:03:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5741392873
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 11:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8F133052D51
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2F638F23B;
	Fri,  3 Apr 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfGhGwEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGLYio8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12BD38E133
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206890; cv=none; b=SLbtQq9OgQrr14hLfSEIog9eyDpHfK83ZAu3Mnt320uQbCBA0rDTIV3lFPMO2KDC1XOzjd/H4hdUwOpdiIrih04BUo2id1TD0xCiJj4ibWPpX7DygzbsVgHAuT8I03WCRPDYwMG8XzQfRrqWHu4ovCg5wYsVbSsgzbFDVIfSb4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206890; c=relaxed/simple;
	bh=6uCp1Ysl7V78biYQoDwkuBwMYgVUwIzJQtdHSigKnPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sF5kjJ19f2R7fpZNHXA2HxjkPa7D3CvFhNyyFhzjZB43A8Yf7yi/AKeeS3B5P+VX/uGWP7MgfnRFVCd9XgkKLy0m+Ft2D1CbTfTItYKjKsw77ll9ALu44rvp1PljMm8VCreJfaXiq15oavHcOAy04l2xZUbCEsyc0KPlY9o4RIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfGhGwEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGLYio8S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336F2mT141818
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 09:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGmJ0kOto3TdclPZzU45pqwHEm5f7+OSuMf4cNBX13I=; b=DfGhGwEFK12SOEHR
	6rxZJsTvuwB2oBKY6/W733qyudZjh3hB83fLvWoI6PvfeYyo0iQWhbfd3PAgc6P/
	kXvaLeXV/c9izPwvRTu0vBEdEfOrOy3SvX12a/0W8JZz8/gSbFeb75R+gJ6Mnles
	pTNYkp1Dojj6u5aGfApZplEJ5Jiqr+EAtXVz89vlUbaV02FbNvJoo0lAJw5N3loE
	UCI0WxPTIy9+r5n4a43fv9zC/045oLp6Om61AWSley3+4Xih1Sir4CL2HRHqKo3U
	ALJoF00NykdRVfo0dQiOSbgBxvPII7m6f7gF4xQ6sGANmKHOp0AuMuBg+/8IH8ZN
	A4krGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0fp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 09:01:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so52283921cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 02:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775206887; x=1775811687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGmJ0kOto3TdclPZzU45pqwHEm5f7+OSuMf4cNBX13I=;
        b=MGLYio8SD/2InzNkFpaRRJXNRj2Q0HvCTJH40wj3DnM6Yo5DkgYNI31BeU+W+lzu5T
         wijLX4oqO7Zs2iLHrGFSunyiUxO5IeBYoI7wQPmdc9bJ+JJX5c0Lm42kQ3o8Lf+8wzlX
         bbhH4iq6XWNSbAaFHegqx5nFC6ianLf9ZRRzi1TwivRX1Ej4n51igfUsH5YyJR7BljOG
         C1FYKoVOJmBW7KNI/56TsWHrCtOInWfhFnnx/zD5/otgexJwYSdxPo1+Op/P2y2SVE3h
         agG83jGG26jAFFXWoiYESMz6qzQ2DQqvh0mIstXEdFEa/BZqDl0r/78ag9EO7p4kNIOU
         XZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206887; x=1775811687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WGmJ0kOto3TdclPZzU45pqwHEm5f7+OSuMf4cNBX13I=;
        b=HigqxCR6o96cd+hRuQFV6jFlsKMxkNDOC4V9GnCj1PA7Kx/NMwghF1p+1jvcHBqQuV
         AOs3J7nNoJr2gzEPXw4fb15zOmx9kEMNGC8zXcDUD4EHVd8f8gAY22lHA3WUKfhstRDr
         Az2kI/CEhvS1yc/KApolPqJHCK0AQJq8Ol2VEJYo7IB9q1sAdaY5Wuffp4okKfOtAUtm
         c+2Of9o0crJHv1DYKhxPJuwA4+OwcIW3wj+JVQsmpZglUqnmitcn/Txy+YEa1bnkXI6w
         Y4caRPV8PfDEZAcwIe1HYIrgb8MxoqbIrCq4EC/gvJe1euoseIwPx4QkbZHE9J8RKgo4
         3mWQ==
X-Gm-Message-State: AOJu0Ywd5QXuVl16ZZkqcGApFlJnZ32K4wXtPWArXHpgVJClmsPBjyJ3
	qV7AyAd0Ro8wpXII7EQvOCT5ylq3JXoyfLiDsCGq0UrbpVqFnDPkcp0Z5IkAm9ApK8kkiLtpu+C
	IGPpuLWWxptAoyrCWnUwg83jKwi/zoaUBfGSijAZCNo8p+tfcKvCJTKZqjNLrafVlFxMR/vdA
X-Gm-Gg: ATEYQzwPd8+DkXYPhyFY6pKyse1qrMG+GUOwcqIZR6khwECXBaIra5kzv28yidwTEb2
	3SuuEoKkeY2MxSXzY9HWygukjiUlXXXhhGyeyMowmD/pf4RroQHkNUK1l4DMO+E8Z4QockhQ42s
	8aIGFlB79WVk81I9A4AZ7oDEfDqrjCwn6tcDjQA/kDVWCXXljRCUUmSPsdNpS3HECJidbLzNIwW
	IviTKauqIYeGr5dj5WkEvXhjNtIW4EGs6Q0muWmsqy5bM+jR/2JWJsMQrL0hH2lkrKWri4Fs1ET
	Gd4giKXExgJiEq5MPLcTJqQ1UvHa5YUtpzS6wj5cN4yuv0nDhB75VwyBbqhVO7240/i3yiORciL
	smjwKYvydrXjA7Bht1/eoIhJW7vQ/OpIY/YQSu1S8WiLpQLD+RQ==
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr28919291cf.64.1775206886939;
        Fri, 03 Apr 2026 02:01:26 -0700 (PDT)
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr28914851cf.64.1775206881690;
        Fri, 03 Apr 2026 02:01:21 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b982:38c7:df87:b18f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm14086962f8f.29.2026.04.03.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:01:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH 1/9] bindings: python: build_tests: do not fallback to distutils
Date: Fri,  3 Apr 2026 11:01:19 +0200
Message-ID: <177520687647.9862.3566515171681543955.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401001459.19159-1-vfazio@gmail.com>
References: <20260401001459.19159-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf81e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=dXvAoEkxAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oCWrTzlkrs3Pdi-stK4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=iJ39DRKJB4kz2P1Iyp3E:22
X-Proofpoint-ORIG-GUID: 59mjbWMGdQNVHdOT9N86xb_8x_6k2XMk
X-Proofpoint-GUID: 59mjbWMGdQNVHdOT9N86xb_8x_6k2XMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfX2fSHZnnEZyxS
 9yh2b2ThK7Jitv1L12eu2LVfkq5pGSCPnYBeei4OWxtGdqm0Mgh+mYYQaI5ZhqIQ11pKE9X4owz
 D9vsvvnJbEsODYynjLFiYNsm0hYA1ygLI1ISog+4gBOtNFgEnk74oqDpubb7yqvFwVq6ZRFZ4x4
 sE5cFR+pA2azvuCca5jrVQubwtsVGpwtdi7m2uqMZugAWQL23dy6/en7KnREjzFlz/Ern+Cwwy5
 sdkoexe/A9yXaWIIxTpMB9l7l4cF6ccLzw+qCBtebmjgYBYAtkXRxDFp9xBQ7gE478/7yy51xNX
 m4LS7uaLwuLOLLL2lVaigwpnbubf7Od2jpb992+ytSGwYcRrsun3LWvz9rj9Eu3BKjghSHkO/yT
 IhwLAG4P+Uhpx96u+vrlE1bPTavaJqety3PhSyJz10zH5MM9ZvD/25nef3OplN065gFUUYdOVV0
 sUoTmoU2AM8ebhjJjmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34626-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,pypa.io:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5741392873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 19:14:50 -0500, Vincent Fazio wrote:
> Make the assumption that the build host has setuptools>=60.2.0 which
> exposes the logging module and remove references to distutils.
> 
> This conforms to setuptools' logging recommendation [0].
> 
> [0]: https://setuptools.pypa.io/en/latest/deprecated/distutils-legacy.html#prefer-setuptools
> 
> [...]

Applied, thanks!

[1/9] bindings: python: build_tests: do not fallback to distutils
      https://git.kernel.org/brgl/c/f53d6c882553198593d63e10af93ff6bbcb8a823
[2/9] bindings: python: build_tests: simplify the Distribution
      https://git.kernel.org/brgl/c/ddca805d92001eaaeaa86540211056f17ea0df3f
[3/9] bindings: python: setup: add type annotations
      https://git.kernel.org/brgl/c/0bb990a59eef3191d7c1ed6a7254f935568f8b84
[4/9] bindings: python: setup: apply linter recommendations
      https://git.kernel.org/brgl/c/49843b8c701f7c61674912875e0dc2cb5bdb4186
[5/9] bindings: python: setup: use logging module
      https://git.kernel.org/brgl/c/0c466480e7791834c15458ae87cbd21fc6d608e4
[6/9] bindings: python: examples: add type annotations
      https://git.kernel.org/brgl/c/d130ec7666e3a5871f6b7aa261b7a305397ea28e
[7/9] bindings: python: examples: apply linter recommendations
      https://git.kernel.org/brgl/c/485b81cd4bd5f8e9450c4587ff4a06ebae209962
[8/9] bindings: python: add a lint dependency group
      https://git.kernel.org/brgl/c/5efa9e8144dafa47b0ddf9366e149ddee50b6211
[9/9] bindings: python: update linter configuration
      https://git.kernel.org/brgl/c/530fa7823b12f91cf64bc1a9b755857049d5c2e5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

