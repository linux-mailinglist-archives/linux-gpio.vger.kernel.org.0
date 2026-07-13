Return-Path: <linux-gpio+bounces-39971-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yoWAJnJVGobTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39971-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:18:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22974A442
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JD/KNSWn";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ORP73FBv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39971-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39971-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04C4309C660
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE33A38A72C;
	Mon, 13 Jul 2026 11:15:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13C389101
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941320; cv=none; b=fu0/6Qy94MEifayIKZEnXkpT6oCJmrx4CNSujXRMq1Jt3+8Ogrh9tiLXyo3VrMhDbCuUM41BEHy/s/6yjTKL41NMTx1JGVVYkjkwdXEQZw/gHhWX7CNhQxBFA59XuHZb9NU1Xg/YuY8p1577OFckWSOV2OSrUMLqNgBTC/d43gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941320; c=relaxed/simple;
	bh=W+4x54SXHSvmG8iNR7zCrefhHtiBz/ghaUo8GDg9VJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7bjMFKUPw3pG3RIjNHDHBpcG7xNCBRe3AGxqw+t6aRcT7ltiiPuAJhpMHc6Tug3aS3DMiAgHYOPTza/8M/xFYHQX6MscGJmQFE+OYpV8glhCKEbXrFdWGZDPX+l1209ceEscKJprSVFw9+q7dq1+ZSBE4ECLsZaV5mYS24mHD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD/KNSWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORP73FBv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YoBi794293
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=; b=JD/KNSWnQspOuGRL
	zJfe73pU7DMXV8BzPKic7F7jAwWshVjoFiwKxOnShbid/YqaUDQV8owzwHr5Dj/2
	i096Ql2A4atVxGvut3zn/Y099c/DIogel07lgYwRFbKhhPFls4R7STFF/hwiROeS
	a4XVHMLPjqdHuzRwSLLrZMT7LkJm+aj8v/P6xSnaV8KJA4wOjww2aGXqCYIVvb2z
	Rgfls693TApsqMuQ0vgZWYpYyfKuimfKLdYP8XNkJ43ssyH8lMpcv8t7rm/ZpECS
	MKcYAhFjrRXPuMOr+DyUQpVINzWbRdFf278OD8P/dQCxBkc6rVqYDTe7IoWtO7hA
	SDKl3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0s1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso28274581cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941315; x=1784546115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=;
        b=ORP73FBvrKvtJBoI2l/b1dOKwgjMpWgxg7c6Lew7IVtZlBLHLf2ByWnUpv81jEEG4a
         94EDLFDSLanOG7Gg3OnvPFngTVwctKp4Iq8L42cTBe+XZ5o5XPu9nI67CQBAyBVlXWAq
         KsAF9iTarQO1l+RiT7GC2znueO+PWqKLl/Gdz0ng9SHKEov9bLbXA76IsHzKa71J0fZa
         5j/ZCNX0YsxiEcA7OD36cg2enIeWZ58/5k9MnfKMDijKbAW+NuMKLkBwIOZ/VUrcA7G9
         uPr3Qg3/2H7LVzka4TJ2fWLm3feNAYqjyWPryEgnii2DK4dNCPEzKtLprxBKwtoafg48
         6/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941315; x=1784546115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=;
        b=sQXL7XlV50bYN1ylJXu6kzzZlWcdg0q4EhD9jMkgeePn81xxvCbJ48nnYho17eMje8
         ta0kJSyW9XM2wno7J1/FkxKaws99zvoxXSTKx3RmZjrcS+wv99tzE/ncjYAFSLFQHxQp
         JnKCOQJKdZ/D1bTEqPYFy40buGdukMRm2+wkyb1cAAWxzPonfdSuuED+hh1OZBhr70zj
         qcl2+RnUIrxej0SMVn4EmlB/S6h/tkSdP0Ey2E3KP+LaJIDpbJF8Rgvz1Doq3sNaF+03
         EchAi6gD1qNXpEusEHhUXHsqfNAyFraQlJ05s6l4U3zf7Hd6KZTJkHg1coWdGd3zls4Q
         5yFw==
X-Forwarded-Encrypted: i=1; AHgh+RpiVJ95+O6vg89zuzQXOMcsTyHlQwfqUB9zjxmS63NMyjqfodcF/pgSQ9q9D1LyOsRIJOGfb+RPW9UP@vger.kernel.org
X-Gm-Message-State: AOJu0YwfR+KKU5C+27cL7wygPKv9IARc0SK8vrjYDMdr3QPnuY5LcmVo
	Y26zOoPTgpRb3IaWZqy9/m6cxc38OWBvvUUNRwppLbnyzq27pv0dclb6CVEoz+zuDG7gU45dKIM
	3b17ajEJpFbfndM6CGYp8t+uT3wb7ZUyD2FMYqxg1s5jtFwzoBAwutncYuhw/H15C
X-Gm-Gg: AfdE7clUcq8NQrXrlB/gSNEVuYkLL1ik7CuF4Rn1hnw+I68QiJqxIMVMYnQ02psl5yE
	usm6L9WeJ2EDbmXfu52wfXa+Y+2E5rTOmq4YnDEaug3KgEdZgrAMYCFrNmwZ8GsqYicPZ9WfKt8
	cFMqMhIGZYbSSBIeZLwihfESZmoSycNmolGGjvgPLL5MoLd+PFTslOR67bOJ9bMDei3lRSSSdSz
	luyo7kKs2L86JnQngt9C8ghrH1D+dLjkW1LFKX7hRIC03PeC3QBFmVXzknDZyfvaOqDEJg63fiR
	bzjLCdXOTgqtU/Z8jc6EyhxN6d9nlihbvI5L3IOImrHCDXonXYkwPGwHOMp/S46/AG1t4cgATuL
	XNH6k0pdKMdM3VAvvviRe7IJppsx1YriPcN7HPOj+
X-Received: by 2002:a05:622a:5513:b0:516:ca56:a44d with SMTP id d75a77b69052e-51caa02e1c2mr128571521cf.6.1783941315148;
        Mon, 13 Jul 2026 04:15:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5513:b0:516:ca56:a44d with SMTP id d75a77b69052e-51caa02e1c2mr128571201cf.6.1783941314689;
        Mon, 13 Jul 2026 04:15:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:47 +0200
Subject: [PATCH v4 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-4-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W+4x54SXHSvmG8iNR7zCrefhHtiBz/ghaUo8GDg9VJY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiy441BqBZXkzBL7+gB9+mfFhdM4Y+nxwH32
 viBbBXLEfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIsgAKCRAFnS7L/zaE
 wxGbD/0XjM5SUCmLLr0/CpZ2O4eglSDLMnTe+PCk4WFrytuv0nkkklMcmuO/rXJ73ryMSYNRsOz
 gw6KArw5En7YnHt/oTL52z7uiyj4Crm7aN1M78N78Dw3ltpUv5keC5V/vexaXO0+YAZnqqr/B/K
 IDoZVdqTtG9O55r2/ChQmU63N6TsDL6nsC225TJgpjHwJ95QOONzET5WM8Io+t5JQREjriZOyUl
 HJ8Sd6x9jliHz6ohBhFOtQrmjvgpMYRJL/8RVK/zqd4tRS3NStZ/FzM6+bV/RgcYodKnt/Zvhtj
 6qwc8OE5RxpkWiB1RqTwS5p/aeH1Q3ys70ZO1xKT9Omny7wncY9zqr0//PV1YhhSRw5FZRSt6mi
 d5mQx1dmFMvgiZJtpINX8a87qPQeulvgfNoX6RMwyA1WeZ4TvSU+fcSYzJRSsFgpKGg9r4nDKSG
 40k9iaOplZDo3y2kL4xIH1zMUfkNNAekxbIbsgPm5G4jeQa1RZjHoE7pm69aEiH1w+CwlJqEftC
 GLybrwHegXBXYQmIRMmlLFF/xH3rEYB4W76O2HK/S3V+nhowH12umt6gqY+vqwCvE9LA14DWPt5
 GDGcYc5rzIx1N/nDxqwrRO5UqH0mOgIqo6yVh9FLjFhnqKE52Gqd/4DlkO8KVfoXnfNP3z8o85P
 iAOUf/P3EMQZU9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 78p9VBnMIs3RiB2H3M_XFeHFYlh15Py4
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54c8c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX0UrNJXsV1A3U
 trjhwxkTme/R9BXPLKv3CuM/yQ4uxtYfC3eyczr8zdJsyVeDU/fs0/XzIG9Dk6xkl3e3xHEqWnS
 Lf+X1JpszMT5rnE0UlzOa2MYUXLCN9U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX9nFjr81bnrIC
 3rUu+3lAD+zyhABAqNMxGFj1SVwLnXoRL5q/Za5rOuVQn0N1uyG+wcq1pSxGyt634CfVeYRwjnk
 mR/2cJhREWNCyWSOmW/v+onc4OJkG26FWcffKphVyLxyMqbXVh1TiQDDqKeldRk4gKzajWgbkKd
 hPcNqyQBQc1mG69oHesqZ6YtQo76GFagrSHGZpvyfq5aou00cKtu12hHB+cSL5dhgGO3fGvXtu6
 WnBGQG1KNrJVoljoKmH+rh773acPdNWwY+hh21k+KEKiz0vJEitBKTTy/G9mKWdNBNcIRzUueCa
 rjXjG8ndgfER1V6vJSauKZThgkIkZyP88LKBqw5xtHMF3DEhvZJS1lO3PpY94YPB2W6Y+YMIGkD
 OWK+TtjyNKXNa92lTIEgPBOpHqCLgyi7A/7DnUNRyrzFDv73juR4bZbsWsdjdNsNEO1EggidQAG
 AZrlzhQx/aZqXqIeB6w==
X-Proofpoint-GUID: 78p9VBnMIs3RiB2H3M_XFeHFYlh15Py4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39971-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D22974A442

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9dfb14b9d477fc0331441f96c158b0474f63026..a7a5d81d30658700b3744e0b2994211d75074883 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25102,6 +25102,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3


