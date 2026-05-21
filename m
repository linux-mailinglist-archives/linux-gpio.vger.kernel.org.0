Return-Path: <linux-gpio+bounces-37250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hp/EJDLDmovCQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:08:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC35A1EB0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F31230B19A9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 08:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A48A3161BE;
	Thu, 21 May 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCun69/M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1FutHMZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A35317160
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353401; cv=none; b=tDwVMG/CqmEGwsZkOqTljchmN241P/XGsD8cHF8mw/y6uHOhp2ilS3a0fzWNFSN38/k6v9ZUQ5J6nXpQT/d1Q53bmx89tWX84EJnT7LqywJGHtuq+GIR5WxRSOu3GNY7BUrKZkWUG0muX1JXo6GVWvNE3j9uMseNAmesC5K573Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353401; c=relaxed/simple;
	bh=WCZvhCtju2ALnNkB/dyRi/nnFp8xIIOr0dEsissD+fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dkQfTRNshDBz0y+8Tt+9gy2ks6lnT59syaVxB+HH+8R3TFEPLEOJNvHpwdIRnoC2QQQNABr3te2pDvtmmpWWzucvNE38b3BUJBcJAZp4qEyQvmJ3qW+v5RFOW88t0TiaOzdRGbCs135LCDeXFndo8X5riEk9QD1YmKmYro12Opk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCun69/M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1FutHMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5LjKg3084910
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+eyYGxzLV0DgLeMRlYrMnVQl0ZZxnZ3h2lIptTAZys=; b=kCun69/Mp0PJRves
	Lau8l5tDEHendJ5/prEBN5XRB8asHhY61z2NVCIcD3rEDnotEQTvpXpdwxXBf5/Q
	gbcpVblnCwjHXSZpHHCypUWK1Dv+2PV4dWiloFUa5EVzKxbr8tu9RG0wsWyWgYZU
	gGBngjuPSFiCS0QArvh1ZX44+/NGUxjzv2LBBZ2Cz21fW7WYPCk0OzNmos8SmVXZ
	5995lZGnYKzFU/lqIzE5G6EF4rwxuv+0ffCn4QiGorlxY0cpfUGEXf3kOBEeZh5p
	JYUt/+P9VLUbjtSKEce7Z4NfhmJdM9QxGTH4ztwgcvOh2NP+4d4cP0X/weHhtDDy
	y+B3ig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4gsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:49:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so172963531cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353398; x=1779958198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+eyYGxzLV0DgLeMRlYrMnVQl0ZZxnZ3h2lIptTAZys=;
        b=d1FutHMZDmjfS6L9w7a9QQtCzeXbbGWlnUaJzPUuyM4vBs687ATjg4na98hw11ZIXa
         gKam8EFbJf/sknzBDtE8uRTteFsHUbfgSBEjyxfjg3jcXMy+atM0K9Xck2iDEDdw641v
         YdDHiANdAIis6HEx27dQpXo/eWKee0Lufqe02UrMUmyKO8RmwGqvXo2MNQEr31M2ZUN+
         O8LtE04+15L7qrUFwfaADGcWMYVnUJzCZbQ/ES3R/KQVw49K4JGArWmwTEMVlF4gWV5T
         xc6aqYvZlfUoTq3x2J5BdbfKyt3GIl81CDsgT3ICgDthI9Dt6McgFJfyZok91EK9/ATq
         PdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353398; x=1779958198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+eyYGxzLV0DgLeMRlYrMnVQl0ZZxnZ3h2lIptTAZys=;
        b=VDoAPgjmXwd8zk3mTuAzbILY0VTXzsQVABdS5JnZaJDHXbpFU76d7ujr4vMx9XMvam
         ysgDdli7RidLSjRnQUe4F4UMfxryX6gdTNNz9X69JrG9DA6xjIMs7kYliEBC3FYpdW4i
         4h3xEafZJY3V4cMyXiwVi8K35GB4E9h59PsclRo7GKR2MvfVjFvYK53LAX2lNN97aaLx
         eB4TCP3/8P4qnNPi7uTX1n4efNuJi1lFvP2KUZK1HeFQzT75FXu33KNCglzTaw4PczNv
         jmiFBDl7HLpM8bTX+6FvI1bdDxXWAHnDNzRkZHktfdqkzgKx//qM47WvX7eib6Ys5ES0
         vrlA==
X-Forwarded-Encrypted: i=1; AFNElJ9dPEGdUfN4/8VJG6ECGfa/pFQMiyhVNdW2Q6FfK4OPgL5nr8JRcx0G7mzry9LoC33dByfChvot0C/6@vger.kernel.org
X-Gm-Message-State: AOJu0YyRylWY1FD3O+TgZMyffBdCTW9juc1NEFAC1ATtRj+b8p8zOaUP
	JnTocPXcEy/Z+dDklUjtQzWZ/91pOKK46m8b5/bBC6eq/SgGu+OG8oG/khKcj8/Rhe5LHdNuR9h
	ZCrCBDvw8dB7cbHEn+LU3FMlXg10FRqBPh6lBuRQEJXJE8VudEJwutxSOLqOg7O3F
X-Gm-Gg: Acq92OH6LKQwKeWBxRtxt8BqzRsW32ociZ7d6WDsSVtF2NjrOTPw4KgiACkdvItbv9H
	x+S3L7gwSV5WZBE7D+nH9oTZwnuTYh2tvNUO9yabtTvPrmBpj6sEwAOCyLC86HWwMEf012BD2Ec
	Rk17XInXckFzBppbOy2P61CS0PND2WCPFi6Lruxt5dr+IBpzRYW3iMYl+EGEY2bz0JbuRQK1utv
	ot3eCw8LFY3b9FAmtCeHC8XRdTrEpycnXrKpO4Fe84phUpXO5YuoEZ6WDRMjfGq5Q8ti19QuEYs
	qT5KNvE9PWk5WPzH5a5PAlei+id7OjyuFlc3R9iQeuMy3CdlpNMgiEylPxsxZxZWJtUgFQ5Ic7J
	7ozo+NOGjJvagt6fLFfafIFh8Q8+c29EDUNuH6OtfUiz7J8U7TA==
X-Received: by 2002:ac8:5dd0:0:b0:510:1543:31eb with SMTP id d75a77b69052e-516c560ae9emr22797331cf.53.1779353397804;
        Thu, 21 May 2026 01:49:57 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:510:1543:31eb with SMTP id d75a77b69052e-516c560ae9emr22797071cf.53.1779353397341;
        Thu, 21 May 2026 01:49:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903cadc03esm9295345e9.9.2026.05.21.01.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:49:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Thomas Lin <thomas_lin@lecomputing.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org,
        braden_zhang@lecomputing.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH 0/2] Subject: [PATCH v5 0/2] arm64: Add LECARC ACPI IDs for DesignWare GPIO, SPI
Date: Thu, 21 May 2026 10:49:55 +0200
Message-ID: <177935339258.17744.11531359965950896952.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
References: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ec736 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XCN6OSF3ifbBXE_oKz8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TFYwdZpgBK-2m1rPbDCulW2DxPFoq6KU
X-Proofpoint-ORIG-GUID: TFYwdZpgBK-2m1rPbDCulW2DxPFoq6KU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX5Izr3i6fQ2G/
 hrar3aSpA5sWG86HVk6O9FsCF7NK8kqpFqCHsmc7UMO9aHm3cKop2KPOR0DQAdD4VzSF7CX8ckM
 PaWpmeHa04VTmdS53AZVTHOlMGvBBJMKLKnoLD8BnkD5Ez0ExTj4xI+LtN3K3cBJQ4f7kWI/KCH
 xSpVRlYVmoRWq94SpEcEGwSU8vdn3fh/1r3Unm6wmE/aVMEtHZ++I3EMZSLuPkLsoWCFokSQbA4
 FPPD8cTrdH4E8pbMeqg8nV2P83csj3frcG0U7F0aLI2tWSdfp6PdyHcK8nSL80MR1Z2h7MMGwGU
 0W45IyagyOzK5ErY8Cqoe0w7J10MLkoySPZk3fvYBvNQ6bxXyxmGdZQtFIuKPzZswwDkwZvaCWx
 pdgVLQqgzs6nvtjK6/rq2UU6WYnRtACImN1nDIohX9YtQyaLDdYNAYADje7q85z9LJAId0zo6ih
 XeRJPUnIMy1miZXSDyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37250-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBCC35A1EB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 10:34:48 +0800, Thomas Lin wrote:
> This patch series adds ACPI identification for LECARC SoCs that
> integrate Synopsys DesignWare peripherals.
> 
> LECARC platforms use the following ACPI HIDs:
> 
> GPIO: LECA0001 (V1 register offsets)
> 
> [...]

Applied, thanks!

[1/2] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
      https://git.kernel.org/brgl/c/d01bf517cbbd5a4b0c16ba2d5107bda0e361b00c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

