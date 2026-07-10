Return-Path: <linux-gpio+bounces-39831-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pSP3K0j5UGom9QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39831-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:53:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E173B736
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:53:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F3ySqATy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Oc026SDf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39831-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39831-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48097302DF93
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A96279DAF;
	Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B832C26ED45
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691521; cv=none; b=S9Za7YJZhcChGSec5HPRb0CIW5sN2V9OEjn3MhfIvaYkQovnxFT5neCmAGVtbcKlZRRYcvs5nUy7T6OPxGlvq+TEENQBtg+h2gMqcVFMyFNnmP4RDMPmqgN9DJXGI6YyRrtrvSo6QKmXnV4jk6DP9tWNA14O9pr7YDc2HwEBFOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691521; c=relaxed/simple;
	bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9ZddRXLAcgnPg7IFqMOTE99XHwMcPjDnRX6sKGTJl2Ei9bvVBod2B0N4ejSnmgZj3eQfGX30FBocpON0pbjickI+byLLlHTCdscfW2zHEks+coBxJhA/LzubyeZpZoAONseCxbzffP6cqkp8QuTGwJNIHxAUNOk4gTXafxVRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3ySqATy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oc026SDf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6QFS874086
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=; b=F3ySqATyHKbPSeSH
	ugB/fD+6KO2wJzEN6VpmWMmQfMwQjYHaMBRlHIMe6OjQdZDtCS+FAL+APZSICeY3
	FqqdeYqTMDcuNBgslxX9aPeJ256MGDQ47y9mt6weF6/8XT3NvMzcGIpUH7gGaQ6a
	WjMIk6lHeMF8ME6eigPCUM5mqjqwnm4esaToAU0UFkT86xK87kJQdHErUuoKUF6O
	Lvh6PTVNeAlcJipZg9wS1E/dU3eU2oWUSfiphaLYFB9tui1gNMPCWf9MLiGJ9Kgo
	/J2SHb0afwipAkiYwgtCq4v6yFzx8grNMj7+mqF8pZilWZM0sktB6F4SIRQHphTT
	72OTSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8wp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:51:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so18914791cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691518; x=1784296318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=Oc026SDfNQ0qNjbeEriD9Ay7uccTVca+FWj8GHBtaPcELXv4Bq1sb9V2nNV80O9qHC
         70uutP+ZYXtBt/koY8Q1+uKjlEF8FfIw8UhEvuSTKGHPS7G7R7nOzLS0w4g9vIuqRIG2
         dtYCnA1KQY6NJ/i8IIHhd0ESIOhT1c5O+dB+XZ2huZYuc2Z+o32OhrCiaZoLsz8A63pN
         +910qJtqTKExPTcWc2q2p88jid9PvUR65+CLKAIUWvGOoY+tzDd3ubm2xr2+Q/dj8sJY
         JBWD3EHj3aGfDpVHwod103zuD34z6/itMsWOGW5YcpnQrzMaxwpmTWax+yL/RP2ffWb7
         CnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691518; x=1784296318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=gGHrnvvAo62Ki5e1U9HLJDQczWG7iffOj6qLNt0v2WsNbdCMMFd095eUrJR3YsCm+e
         V5RsnUZc1k8GQij+YmuzQ62uWW+4YQ4o8PJ6kVfP9UmFp2nVwZBjf0U58lWj02uEMWFg
         joEQFey4vZy7tc6IV2VFteS02mu6j8GArYjIM8D8t7pbpPQ4FA0F4kIBbgfpVgmfj8K3
         s7u+6NBdDDeH2fzjqG1vnQILpM25gX33tIDvnsBeuSvyTrIz2fgpg6oGAb8eJ3hGG5YK
         ppLZO6a/eBGmy01dMeVSSHejzYMbCUsjCZWIYFBhPIgYR87ntlekkOZQNhrKnivr3pVs
         cdIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQoQSdkQNnd5Ey56KJWNthbFHvira2HJVl7I7RY9oY7ZG1JC/OcM0y52pDHG1HiDU4HM5J8l/sF2NH@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrQPOauVqMx/7ynBJRtxI8EhIdx83sKXYqCn8CTBhdefrR7EG
	TcoxNnrFUUqa3AeJyqdZ7X8haOvqLvMaoTnc2m7/Je8/mFgostxD3CjRwz5xP9CnZejZcWYixm8
	sIQothb5/elT6OugPLf+TMQ+m1wA9O7Psk0u8E6JnzOQ3As6ENab/8PhxI5NChbbN
X-Gm-Gg: AfdE7cm2v5g1wfj43FyeUl9vijYO3AwFv7toVgUpZGDUBzy9vJrUqtfW2QJWswe8r6w
	vEstWqfdRJeDECUbv8RcF2Ctg4Q1/vWd7QIuyhjT/Q1xDcfq/AkmSTWwGJS1+sDalrcl8zTxVvU
	kskzhq/fro/lLHHX+/dghyeTQ8AfOjt2mZ8UJJyIGJvLutBWE77Vpu5HvtRRe89actEOGP/Dx6m
	kwZ1Swy9mgNGr8Qp05LyGRG6BsvCuW8cF3AmRrnKIEpKv6OQjLNS7aVH9+gf0Fy2IBogWjjpdL7
	DG/02r5XDXgK6MQ7xOheKQUiKWnA7pia9wXUFfBXiyycI/pLapbbwWo0hLwhi4ImnL9arODu1dN
	y/8QMF2OlDptNGTKZcT+/7CXuTGAtgIT26+SgbHw5
X-Received: by 2002:ac8:5f4c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-51c8b2aec7fmr125426791cf.12.1783691518094;
        Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-51c8b2aec7fmr125426501cf.12.1783691517650;
        Fri, 10 Jul 2026 06:51:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:23 +0200
Subject: [PATCH v3 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-4-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
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
 bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPju14ZePJwCsYAjiYhx8i5rjT5UTbEC9PAiC
 443aOSLN+WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD47gAKCRAFnS7L/zaE
 w3UKD/9BiRulUtSRsu+ohMhsfYeNZYC/zsyq35GANqEkhKyU76r8Fli1KjU3pHnabL9XE5f8owq
 14X4eblkJWpyBej453pKePC/c97tcsKEYKPf3UBUSmHBUu8z8nyDonDQrGW4NeuAKI5BQnqFTmt
 isFpnJNKAe4Pq416vnY56HSdM85KZvviEX7mEHxmyITHf+O6C7dy4iMnYojkX5UIvvpAoICDWAa
 HPr0vY7B7Df8O2/vifavIDtUA/Qw3XBgULH3jELalHz/h9OMWcDPmS3jxRaq58M8ZdVSQ8QW0FK
 R39uMNGn+Bv2MflNRLRAHLp/YuBD7TXSQIqaatRARwqXwHn/rkcmM2tkn1MUoRtZDy7P/+FXc9J
 X1nLKucD6UvV2g9zC0iru/vtBpABVt+Mv4QpwahJ33lB6amKOYmFKwsVS+LiLphdOpeY+rj3bUw
 CIuweJjVAVGflWl0cf0zoeUVyZDyoAfHSgfFSpbfrXnAiTrtu2ob6CnOcEKqgZNxowr68H1kd7D
 U3QDBBMFrdUkm294dPJjEHD3njv1IZbuRYQOBR22e68sLUMY/BO9WG+2KaxOEJkgeMzbFmHas7y
 BwG7YdxUgJH7H5UwM+JQbwwcfryU+Rn+Xrk/q3i3R8ulCm73INqvvi1K3xOTTg4sanfjQzZuNHV
 osiKy0L3HjkFuPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f8fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: qxo8duljJCaOXxKxofQ9ea6za6uFgos4
X-Proofpoint-GUID: qxo8duljJCaOXxKxofQ9ea6za6uFgos4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX8Dzqquiq5wlM
 1bZsel8GCy1BKQv9P/Kip2IhpnvYcLJrhcMHjyVIBvpgGn4ajp4gaY4ph8BDIxBxwu+uJditVXI
 ez4D6d9ICFQL5QIvbqMICWRdivwVV6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX501VtMjB4hQO
 b4nqbztqpq0af088AfDJJUFMoIILIq4HMFX1UFciM+nMj9hR8DUsmVqWfXnAlyRdmgLrX9DMZFV
 uwFNmkmbo8RyX3kJEHRWZCj6F3msADW9Dvbm2idp17LQMPgvhtqR+7h2wo6VFH1mAHtCzwkac5Q
 nAOwcz/8Xl11EXbuh5Yf5lNxpiK2+Je09Ovu9W0utHacdvvSl2eSJewtqA/mBAv64ayg0Saf30c
 1OoSdjIUjMTn9gf1NKNqCYYQg0u4q14nolHEMjnAuzzH/Du6K65Jp0U72XOvzf44LbO+DFTMtq2
 rYy44Kp2sT/K44FwKVCXqQvMca2sMzTw0Vxvv+x9d8/T04jZ+CA7nd75EjzcasfMSf3TJ8TZgSl
 Z65ZSvwhnJAlYmN64DsNOQKRHhHEuV61BAE7hZT+X0Nsc9NFkbc59HOEOacVsi8BqrIKaQ51Gmr
 EBuIlzXuVeQZTxMRzjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39831-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 257E173B736

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7741614c941ceed9e46e9caea72bad77cfb7618..da886aa69f362f4cb9dc529a26f8dfc67649d7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,6 +25101,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3


