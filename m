Return-Path: <linux-gpio+bounces-31265-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAzLOH4be2msBQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31265-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:34:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 874F6AD8BC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75AE0300CC1C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 08:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427843793D2;
	Thu, 29 Jan 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZ+e/kZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PchpeZrh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71001ADFE4
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675636; cv=none; b=D8WAkghQNYgtwxeKdqYSreGZF8eoLNXPsfoxxaN5gyJvTLC3ysHvIaJmgRe/o1fWx2rqCryEuBx8Fr7MCu1su7S001pZOVLiMl89oR81HanU3EnOYn2O3ZsEQ36+OAlE7qOt/yBwYPEHcLjl3cyPT+8cQyAOkR1botDEfMR8eSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675636; c=relaxed/simple;
	bh=Rp4eWS6K2LPGlTY1whwjufRv0SdYHoiTxsiJRJoxQos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+yakIv9HcdrZCKh1Mk0jplHbSAe6OMVGkT8SuKpcf/nVXzWKXRnzA9QhvhjPNwR1DA3qT2t5gOw9+4aldnUkfUO1Qz2chzTTO35Pp5plPobsaMSPFHs0cd9jSfBSDVyDZqtpaMf15RvskgCrZQk1wZS7K7xRTQDpDt+hlZcUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZ+e/kZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PchpeZrh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2oxeo2034129
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r++wupaoeMHVUQiWZNyeVVCDxB1U6o8YaUE4PRTZyMs=; b=OZ+e/kZczmxjBy4l
	yBl16TJQ3CbhYok04T1mE52r/jJIh6w4unlbLwU6yusoUlxvxwiKefYE/CRbkWtY
	/c3w4ZPAhpho2b76vRn2ARR3DUafzzp0z/I7z3Gv8REN09xHWxVN5z/TczV6njeV
	m6iaFnHv9lDFEDvEQG2hexB0XatvSSF9QeWSW01Tx/N0s16ntYyS2gY/DWAVExjy
	w35WQukt8a9poCml/9IvddTxE3yEkqjqbjGKt8xfAlTak5e1EZJZPi5iyGKhhuNp
	F5ZReTuWXI8BaZ0YmUwjhfzZzQtOPwQb1sWQ4+efvXzcSdxJj1clEESPlLq2P03V
	nGgyHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7jv6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:33:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a291e7faso311999185a.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769675630; x=1770280430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r++wupaoeMHVUQiWZNyeVVCDxB1U6o8YaUE4PRTZyMs=;
        b=PchpeZrhCSdyiik6/x3Dols+4Hg7La7WvQaloGDLIIAS3G/ewLuuA2AXCSWvTCUL9j
         dYEujIrfgF8hSg31Ehf+rckRF0GFffKmf9TTmq4TjNOGnpjPajCb5OTTtFxCq/1+gd7z
         jiV4NnD8/dXxNwsai2suWPg5tC+FpmJtaRIks17nnjPn4ZTxDqv7PjeFUgr0xK7gtIDI
         qSv5nclhgc3j/Nia5E0kECD589190aMi/YiPw4QAYWHOzip/bpvgqTiyOWBzEUHyzPO4
         o0yeL4D6bt5trj8sl3XxSdcJWHA6G0gXSICew59uVRfoMtpteab2dSf5YFZKqV/+sds5
         VFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675630; x=1770280430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r++wupaoeMHVUQiWZNyeVVCDxB1U6o8YaUE4PRTZyMs=;
        b=wtor44U/kLcLfOhObqoX/jqVaRaP5/foNC1rNrcLrBaGMudwtEjr4XgRqwtWuX96sX
         Sgzs/dlO0YeaOfZ0Gv8y7D1ido8jF+krlGP6Ha8HSPEKzDX3tH6Z87rzvdd0fX8LwcSj
         i81GcvQhc+hdkGfjLoXs1UNiS1/H7ZtvTSeFlb6aeNurzFO4bG6rZdznTyN4IDp6MfxP
         43UFcHMfechiaOD5XFzCIbSWVnJuXVaU7cWtWDE8C8WDmreu5yPC/XqIHlqO45LXpZ+H
         OUgcshSDplY72cm2Na5Vda14I+jF+xi35L+cI0qjKRUa3Oox/mMh3ztc8wBOsJW6rKXg
         fv4g==
X-Forwarded-Encrypted: i=1; AJvYcCViJ/ckuwK/+azbA5nTBFF0tvShU/u3vObmvxLvHteCoXgR8NytfEBpefTzF+l6GbAWI0azSNAsiGkA@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQ1TqfqZko+BJfaLCsu1Dq5XJSGJRgCZJjqC0A8jkXIj9lLlI
	EEYxUMoCI0bFh28U8DlpUp2EufXX8BWAAj2K49KdExwjXKSsZ95l+RZwvI0eYbavWIxAOut2aRM
	erX9m+3zfMAxf+UlCsK2zg+pBNNyrauXf7LLBwZEZcEyCzKNqhjD1koqz3Q/OsATY
X-Gm-Gg: AZuq6aKNY1OiAw0txUCjgyY/aWKTvbikkE5Ag0xDaXL+ZtoRW/38fMgxE61Mj6l1JlW
	c7mVk0k3BxBsNVKxLqeqZbH83AIthNhzriabB3ecKiKrcap2vAy8o6LNowr9fYA5NFc1WmtuLHl
	wNpHdmoNa20G6zEgR9yFd8H0f4GSW3y1zTDKpuis9iC6zvmwmL7MA0lUaBkWlJK0GG9vi2PFMFd
	LUxM26hyBrjGiRx2zu++FppJAEgBiAIJSfF/jnYecaqHScBY35mjzcPnDxgyVKF3YL8iRKmyLH5
	I2Z8+uvr3KmvpeeR4aR7PbrBX5Ecutl7HptBEOoKwzVxu9UFGWkfh91of0EEd0/kuf0nEic9BFy
	KqMo2qQ2X3vw40ezWHcjQAJ66I9tS/DjGMEM9iJE=
X-Received: by 2002:a05:620a:191c:b0:89f:19e:46fa with SMTP id af79cd13be357-8c70b875d23mr1020896285a.20.1769675630398;
        Thu, 29 Jan 2026 00:33:50 -0800 (PST)
X-Received: by 2002:a05:620a:191c:b0:89f:19e:46fa with SMTP id af79cd13be357-8c70b875d23mr1020893885a.20.1769675629977;
        Thu, 29 Jan 2026 00:33:49 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:eb30:6a8a:1705:215e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm13298559f8f.5.2026.01.29.00.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:33:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        robh@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: (subset) [PATCH v5 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Thu, 29 Jan 2026 09:33:47 +0100
Message-ID: <176967547599.5796.2816287193040668949.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128085114.1137725-1-pshete@nvidia.com>
References: <20260128085114.1137725-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zZQD1RxVyM_e3IritVIZgEZUxta45Glm
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b1b6e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mkNFcrO7423Z3Jl_UjwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zZQD1RxVyM_e3IritVIZgEZUxta45Glm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA1MiBTYWx0ZWRfX8mOmRbMwo1s/
 VMqZgAvKAgLEJwiup5B5mlKGKjjQIkUrWSvJtHSOfE30uuLZ9njLW+S8m+1GhGRzKBAUzsd+Jki
 qpmNHm2/yb9WmrFeYoB0FNcVctvSo9ke23PQP0GUWRYCUQ5EgmW9N7lEl4hkDHWSKtFXalI7v13
 mhPsJ9YOlKu5gjY5wB6Og7v2T1Wk8d4gSTka5l34RF53uW2TkCkyD89BVHm9tdsptni1lbW39Lr
 aZq0jnpw7bbbHN82d/Ig8rDw12HSsvV37UIEeqwEGM5vercCZAi+LMgmzGgC4h8ZpGOxVyFoq8Q
 ICt3rlHAsAK24SUuxrIIeUuUucs819jPyB1/0p6mQ0yD1zkShrslq1u+tgxmnaRb+MftaqXlcyo
 feyMmaNGRqdXM1abdXzd/AjvZzjD4ha5jfhey+L6bEUyD5huwCeKYZ7tIRpI2JDpnfuSTS/9BZG
 IHQYP41pSPy0YpYxIvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31265-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 874F6AD8BC
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 08:51:12 +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra264. The number of pins
> is slightly different, but the programming model remains the same.
> 
> Add a new header, include/dt-bindings/gpio/nvidia,tegra264-gpio.h,
> that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin.
> 
> [...]

Fixed whitespace errors and applied, thanks!

[1/3] dt-bindings: gpio: Add Tegra264 support
      https://git.kernel.org/brgl/c/b565717e1d50078b8f13f3f796e707d24a6f3fdc
[2/3] gpio: tegra186: Add support for Tegra264
      https://git.kernel.org/brgl/c/af9b4a56f0000fb11057e204ddfb05d72ba4dba0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

