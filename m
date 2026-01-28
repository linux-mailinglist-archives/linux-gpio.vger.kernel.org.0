Return-Path: <linux-gpio+bounces-31199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO06JjDKeWkezgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:34:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FE9E438
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B41CE3012CE9
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B90329C40;
	Wed, 28 Jan 2026 08:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGbKw+I9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnTujBVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CB28750A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589283; cv=none; b=H2LlZfrUzSqUb+Td8tz16ko5rlIG3QTIVXij4oPLNlhhrNuiwsZw71sL/yb6H4OVVGgKvzRI7A2zvYcBUml3jybDVVCaXW6Hq8Pd4m2W8qHQZ3l+Y6yzRHaHmmMfkSFDFjowg16tmVqQ6p/2p3VLq7lFdifWgYfqAzv6vl7TM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589283; c=relaxed/simple;
	bh=4GoATlini5cili1q/r1KvCweFB/L3qHkAYqZeZLC6mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPTiEoDAbqqwG7uSwhhDg3wleMtyZKPVILdzGYGj1kIZ+F/cvF2q6Y6lid+XCgKRiSIhQqfx/Z64GJ/KOjny0pmLWdrCqd/TDoR7guA5QOx0/bjHHYJqaWucZdLiPqQhA0XBiV+95R3LHlFZBVb+SnzilzZ/CJH7RPu+jj1vZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGbKw+I9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnTujBVo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S1iHJC1714636
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cM4YbbwLxlZdfa/MZFQvlcZ2nOy3bOu5nF8W7uOLFm0=; b=lGbKw+I9Akb8+JeN
	FNznUn4dYRHgNc9AE9xDho7KEPgFPgMVeJDVj0ux3SPp4M+VclSG0jc5hvKr9sZo
	7GXD8AuISrFE10THJ1Uh+St09Urv28hxMGVYpARkIMl/j03oW/ZyxUp/xuFKD9xt
	6NFXAp98SxfAw0uYGIz4CLsmwHJG3gNAdPrK9W/urRXXszKIJ3NmYq3DZYf1/UJ9
	mZ5InWanGkhlWY9896Ci6BXXgk0ZFubrp4Br0vONjFfkNbtTymSuUFaB1cjR9D1b
	Ljm0PYMo0e5rmrLQYBDr91A88R6q1bBLtuE5R6hifg4vMMUN3jEmCNrLWJKgx2DI
	mEh1JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0ayaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 08:34:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so321850685a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 00:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769589281; x=1770194081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM4YbbwLxlZdfa/MZFQvlcZ2nOy3bOu5nF8W7uOLFm0=;
        b=RnTujBVo1A25Ixz5iAvMcfwivTha+EPCES3e99PN0Z9iiYYaKIPaDuxiU6i9KfQEFx
         esU4iU2ElfXkT5g90yY7EBCDVvpgAUJlfKpgzobaUbQHQ9izjYiHHUMYkBvHPXpHoq00
         kq374NCv9p8oXMMiO+eA6urxJf+OrpBnfYrd+6zgOw0orAh86gw9ta46JUkPoarjeeeh
         bEaF60/J2pAPIBQ/NsRUcVtjfKrKBCOq3Pqh9y1YHFQVWJm4svcLVsgMyZDP2pBPB23q
         rgQsTHurEtlgyR8dBGQ4XmIeFMH6rIEQvbAUN2aU0EqaXbrckYNKKp5/akK5KCML0w19
         7w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589281; x=1770194081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cM4YbbwLxlZdfa/MZFQvlcZ2nOy3bOu5nF8W7uOLFm0=;
        b=YJdtvoJkxPeb0HKu26mHmlkJFeVoxKaGIO9Y6+YkussksCJygbUhfHYvECiacIwmL4
         VeZaRei79gvh4ZDWWqWieK7PAMQZ9oXNDvvRQ4d8yDDTgzDBASsrXqE0gJFk9ytJKxW8
         uJPjrsVM4JMrAHvekxx+V/RCp/ZdN5FoyJ3mgxD5gzgjxf7oQ6FPALHRzrrlY0k700GR
         x04vnAovYwF4yTfMidKZzac9pmZefJ5j0r0BSvSdLZsb3PSqgag9Ifv9xXwsQkVPKOVU
         9LTW7Ph8B+HwCv+v5H9Gf0gnl5JSDaJRTwfbQT1nYjBVFuH4zt+eJaJD67+W1qcKIrTz
         RUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCViKAKSBy9Brnla7aMg3vCTRMyeBof7kB30B5+9rqNsDSS7bf68Dag0+Psi7CwzsbddTtGtH8YyGx67@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qoTBRMAHmw2oXaaet6MddbcO7iH9qDCpWD2+voSpf6HhpLgK
	sJAcyeFMkPXpjtfXmGqolY/OjtRtnltZ+iCaJ+HaQpCsH2vM7RuHKNoVCFkGtuZRwEBG+Jlct9e
	FQUyD9YfqrsFLeOFc9FrtyVt3w/iZFsJQJqye5yhTrGL/YHDrVgXo2mHlhzHzsb97
X-Gm-Gg: AZuq6aLc3fGHDKFxa+icBYjeu2L0iZkwUtQIu2NAyRlvYvBiR+Rg1jVmar8UOws/8lG
	izAcUHUwmDyPWOwQxUOVt9L7T+cDK4VaC9kP5gQ4E5y9q0seS86Ft3mvQXMAa3QiRWE9eHPr5PH
	2+CFf9n6Y8Qc/hBgWvIKuq9Jtt0guPMPfyVHKScvAAmnM/Eg997gemrJl7t9KSTOKAHEHT7q1Fq
	a6nXBLO2oeuc2G9vbQ/w5kARmD9caNZ02zVeGU9/84nbbUhhtJdptWd1oY829gScsZplvrkGSfL
	59SVV15X08XUKysKG+9hNlb2onP7Ac7TBp7Uxj1moLdzyy/1Aoe5I4QowYWSxMG/SREdA8s9qI4
	9FmcfFU1zqw3BgbcnBisfNGcW21mjvSBynekiaw==
X-Received: by 2002:a05:620a:4507:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8c70b8d11b9mr554088785a.43.1769589280775;
        Wed, 28 Jan 2026 00:34:40 -0800 (PST)
X-Received: by 2002:a05:620a:4507:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8c70b8d11b9mr554086485a.43.1769589280324;
        Wed, 28 Jan 2026 00:34:40 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm45165645e9.11.2026.01.28.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:34:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org,
        will@kernel.org, grygorii.strashko@ti.com, ssantosh@kernel.org,
        khilman@kernel.org, linusw@kernel.org, brgl@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: omap: do not register driver in probe()
Date: Wed, 28 Jan 2026 09:34:37 +0100
Message-ID: <176958902316.4537.1901338597465599154.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127201725.35883-1-dakr@kernel.org>
References: <20260127201725.35883-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: frKpBwbzaRNqjdEm8iNo8IlvlECOC1f5
X-Proofpoint-GUID: frKpBwbzaRNqjdEm8iNo8IlvlECOC1f5
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6979ca21 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NmoZXNGLfAXcYQ8gNhMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OSBTYWx0ZWRfXyhDT4nJwYJJQ
 Tsy0RFTUD9RXfehnGqV28mqLmG47x+G+38Ehx4MKhVTxwa81wi1tn8jxZhJqx5cqypsanY7XzMC
 NHvKMDmcHBpk8R+0HYZHtJwwed1brt0MDD8sLBiDt4u5GWHOVaJqeW7irTYVUtFBNHgSDv1j0fU
 7dU5BNwUQn4asVOvgjMuxvpZ35voWcFWyauj8rkacNx6FOTEExdhs2kAHVxhmTezXyHKeQDr6i5
 9K+ElI1wHeB2/+9AZv7l4yEXZA2EthhzC+0rz0xZEiuR1qQ4yD4xNiUpd8k8c5oNrcPaQjnTOxx
 rfOhORmhdgeoFUZRZUQN2mMAmFb+5saHAU/rBz8L9e4BFNClkcd6PA+OBOcNkiBeIKWU8GsOuZ1
 q6bodDLJvQ6SP8DBqKkmxKEHEsAW+pbGhst9hmw89wXdp8TkHfHfIjBfzz8Clfj8TW/HYIzB+4E
 fPlJSPE17Wt8C26/OAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31199-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D72FE9E438
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 21:17:12 +0100, Danilo Krummrich wrote:
> Commit 11a78b794496 ("ARM: OMAP: MPUIO wake updates") registers the
> omap_mpuio_driver from omap_mpuio_init(), which is called from
> omap_gpio_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: do not register driver in probe()
      https://git.kernel.org/brgl/c/730e5ebff40c852e3ea57b71bf02a4b89c69435f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

