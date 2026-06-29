Return-Path: <linux-gpio+bounces-39108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7jgtMn5OQmoI4gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:52:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 909246D911A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:52:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bcTHCiWx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=keLiTJaX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39108-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39108-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C52213015C1F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFFB364949;
	Mon, 29 Jun 2026 10:52:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66812363C7F
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730363; cv=none; b=SrApkGXmqRgiT1Ly734r1o/SRgYPPKk0MNWMDAeefTjF9yc9IcIVu5RRpr2pSj/dzJ1rJt3ShydZsLGos442XCQXedAq2aX+HVS3YxYQNKyBjmqMXDeF6qaf0sNvdekOH5J0VjcPV+nOsbn+sSK1Lz0sqv2eDX4BqW1ej+05ZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730363; c=relaxed/simple;
	bh=zaiJLexiF98y8XcMe93LaDHZUMWvIUjsVpeVPy2+qgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmahZx0+FPwoGwwYRKzXcLoF8tkVFBD2zOKfsgutROmGzPdEHLipjScB63msQpVDnab4sdoSK7TgJODzOzLF7nL4kuPtBzzEWuY2ClPa54GZFY1q6Ff6XbbzvnFukEKLve9srkody8Bw0bRD0Ma9gL8ePfXvwYoyTiJL1qfS0/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcTHCiWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keLiTJaX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCZU2647685
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=; b=bcTHCiWxOiugwPib
	8HDNj5BIp4aaGBKPQ9EAztIhY9W6IE8NzwNP66CJNSru6o52xP8UOivFp1zYBjbE
	t+OaFyfdooNaLb3Z7iQs7aiPWKhpdw+FdmxLfXZxB64J+Ig2a301ImbzdV9AWMnq
	oU76HFygbwb6JtyA8S3Em/zhNIIOpReqhGX02cv3B1j7/RMCC39YXf3eNruxDnZn
	uwNgpRVB0Wfrxc/LM0BgHeW7DueSdkBxZ83XUoXTegcwdJiqxNfGURIHKXbsIIoC
	TykM3SJCq4RM12zyWBi3Qb9hmvaCNhS3CvZXH/PPLFD+xvFEoyulnvxvaU4o6Uqb
	OlbCuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgwsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d4b18b373so387115785a.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730360; x=1783335160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=;
        b=keLiTJaX/UJ5N0cKqfAqmVEEGNmSYAmxE/GE1loeLPpmxUcnu4pGtFGFqTqo9RhlmM
         W55rhxd+Uw4p4/QvRUgKJ6Vtjh5sf7nPQG3qsqfwh1CcmxzjzysUFAUQlsOtvqiQG1O0
         RWNp07HPZBiEP13jGi3rEKUrhPodDGZlMCh5HDx4pgukcLpzgPlcB38bOPn1oHx3gR5v
         8HHEGzmUwYczT7A7Jxn3AK7RATkSBiTaIcjQvOAPiQ5hQDQmRInxsllv5rjmoEo0hBiZ
         eacSmoMWA8rdteFityLd3pKSSfEheVjR3F0MKVATQNkGVh5Rm3knX2lXACeBU0D4rujX
         +L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730360; x=1783335160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=;
        b=SpHzQ/lIlKh8Tzy0GqYXfSW2qSv0YrQwU0CNwUONk4gr3qg/CP4MvR7RtCKAiEPZqo
         Wnq48/u9tkn4M4V95WZZesREh66yugcQuw4Le0+YHBOpLKMiRJi1VGC/xeBb36RLjYMJ
         jYlVoQ8QuRxYKvVXvK23VMvTnXpsMFVKmb+2fxkod/Nf/U/RCJ9zjTwNjw1fT82kvNco
         3PlYiOfz/pNuXtKjQb5GkKBlbVX0VOJs7pSPT/bt2iWi+xFO7EBFpHOFxlhlYW27X69g
         Ss7nCQEWR9x7mkOZHFMedXmQSFy6AhuPi63CXSDnEqAzcy7NZJCihP3UXTN9B/DvU6ld
         pIWw==
X-Forwarded-Encrypted: i=1; AFNElJ+1+n+Ufzrb/UgQqbcGhvH9Ecc3FH/kbz9yiV1EvDXTduONKsnoClAyqE/uPK98hfO/xQ8iJ+SjeFh7@vger.kernel.org
X-Gm-Message-State: AOJu0YyyvS3aKTBp/fSzEfFPqbiyZR5mmVKaa0s3VYAPcLG+GrISpKB/
	dGHun7qYEW2Hu0nSguaEEyR5j55/6d0Uab/alY9QNYSuQHTwVk37HUCDuLjA/cuOskjnGwIVAQ2
	DAb/PNaBfwG2puAN/43F8OIWX2x/wxx8PH/vbXscocJd/Ts54UJgsfQJ4Lcpde76F
X-Gm-Gg: AfdE7clAl+E/69uvlUOgKu9N1jhhRv7jKzpKcsh5+hSVKtQE6QPmXnJO26An1onuI+F
	xigWRVvDQ9fAE3o3qyOVfgFI3z/NOMe07t1f8vOOHZk7AQKQeRjR8BUuTXiEUHDuKhbNXIe/kVC
	fTdW13HP72U4LIuD21yLpgtJ7oWuNqPB//DWIwZtW7zf34cHU+wB9oepWxb5gCfgNDvRX/CGp2t
	S/yLa+3GlrkuQouEn/Q5cKpaOgW0rS2ENNVh6xq7SUhK/bAquYxJznFl58LNSVZQMuohaGWj/y4
	KOHi73kJocoKdHCEMqkcqdicnPmRjS2LlQoWJSQO6S0ZnIC+uicpnRmzGckp9cAPeopjlrFPid0
	2voSVSxGK6sOQ4Uk4XL7rXnCCQ0mN2rFXVYrG/VxF
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2373505485a.54.1782730359604;
        Mon, 29 Jun 2026 03:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2373499085a.54.1782730358805;
        Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:07 +0200
Subject: [PATCH 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5901;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zaiJLexiF98y8XcMe93LaDHZUMWvIUjsVpeVPy2+qgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5t0Y9gDbRacLGA38+hEuDqKZaDGylsWKnXO
 jty9JT45GyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObQAKCRAFnS7L/zaE
 w7uFD/0dTneqZ2cF0h8mSLdekIQ/jforMnCahzb5haC6IBoks/HERg9gKPMxr47I2RsPVJ7EDVM
 Hoib9K7MhaLH1ssXUnzGxzU0t1EMHsuRtCN8tSdU2IuatwKVMOx2zDirAlmWxkzSQcxavkC7Ahx
 e+8n1DLlKhh86o/5/Fi8axWIlgA+Dudef8ISacUz5pAvqH6zt/roj0xGWvfU5BZxkltg+M66yer
 Nln3PG8p2DyQT0yGZuT2fIUharosrL9b1JJt5s88QLhZAYpUTw2XXJ/o74Ap/xWxUecgX+qt7bJ
 FWFDUsh688jD4rEBuIBkRDPXZ3B4C7PtvqNE+9X5ZAhEqzF6Vy2GBclxYelrom/cl2j9XZANLpK
 ulae2sg4T4JHrCCCW4HQx4RNTe+NbEBKRjoT4mDAqPaZ9KzFMOyJGH72y/YlFtnY9ad/+x30oQi
 xkB69uuRhijx4LqFTY+Z4homeXD/mjMENJEkqXUPDhZ5dJ6yi/m3xr9bIpCP4SvoKwtJJs1K0lF
 1R2lcIHbpjH3LClw2tfnx/Bh3s/kCLBNzrmK8Lk4l7LFA3Q0J/j/iqqIrD0+mB/8ecnCSd62QQ3
 5nRaC5cA9KISwqiIYPRMoSuaSj/A1WQwlgc+vcCU6XrmBnQlURX9wycpSW93N31yN0WVU+w0R2r
 e6bu2CsS6ySlHdw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: o6Ldq1XHEmMbYPyf0AxnigXvHjvuTqm_
X-Proofpoint-ORIG-GUID: o6Ldq1XHEmMbYPyf0AxnigXvHjvuTqm_
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424e78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hYae1UF5it2L3rE2BuUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX90Owu+cjaLWI
 UTx7nux4BqVy0TKIZE/guAbKYdTP5ZliMF8SnKABmZwtZreHgkfst8/k1fEV7C35qqu4hUK0uuY
 KnIZO5q6NwJNlun3gy2p0Qk+xfrVfK8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX7GV2419+bLrj
 u6gTr7iltKhGL4O+g5QahYswIvNSkqhGEVREfueYlw462pZZbafz3PG9eTa1TIk8LuXfw0g/2le
 ffXWB0zBpQUhoRzq/ILDEQmFreIIyauwLkaVujuosDwD0MmSdOKyfa4HHSvCjQlRDMpy4aUkPSU
 Jp4s34GtD7nOMcukF0VwEjqoZjp/1RbOf40dylwl6bfpalTJ+RP23RpwO8LmmhwxVC9hRf56sFU
 NoFyzuzJfaR0SIQmOmPVtl+Qn1TocId0a/unBbmkh7wKB+9+mhG5+OwWC5iC4C9wcq7CDjaStF2
 JIsvufTiO0e9Ak9RkMd3dC4OboykilnZ1vEzws4TaA6qGQ7V575BdNsPoh5/3zKi0r3RFOFaNWA
 3RL3C3bNwUcywvEyk9bmRAfDigcK241YdtkacIUF6wKc/BhmJtBTBJM0yZQOOfXjpSNTB9JjGk3
 22e6vvT+sVcjykqcPDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39108-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fwnode.dev:url];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 909246D911A

Software nodes can be used to describe supplier-consumer relationships
between devices they represent using reference property entries. Unlike
for OF-nodes, driver core cannot yet use these references to create a
probe order that avoids needless probe deferrals on missing providers.

Implement software_node_add_links() modelled on of_fwnode_add_links().
For every DEV_PROP_REF property we resolve each referenced supplier and
create an fwnode link from the node to it. The driver core later promotes
these to device links and defers the consumer until the suppliers are
ready.

There's no allowlist like the one DT needs - devicetree phandles appear
in plenty of non-supplier contexts, but a software node only carries a
reference property when its author explicitly points at another node, so
we treat every reference as an intentional supplier dependency and link
all of them. Graph "remote-endpoint" references are skipped for now: they
go 2-ways between endpoint nodes and would create graph cycles without
the port-parent lifting DT does via get_con_dev(). References to
suppliers that aren't registered yet and self-references are ignored.

fw_devlink resolves the supplier device through fwnode->dev but the core
only records the owning device on the primary fwnode. When the software
node is a device's secondary fwnode, mirror the device pointer onto it in
software_node_notify() so the consumer can actually find the supplier
instead of deferring forever.

While at it: purge the fwnode links in software_node_release() now that
software nodes can own them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..48eb67826f9e1917acc7a6a513c1536a7ece0961 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -699,6 +699,62 @@ software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int software_node_add_links(struct fwnode_handle *fwnode)
+{
+	const struct software_node_ref_args *ref, *ref_array;
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct property_entry *prop;
+	struct fwnode_handle *refnode;
+	unsigned int count, i;
+
+	if (!swnode || !swnode->node->properties)
+		return 0;
+
+	/*
+	 * Unlike Device Tree, where phandles appear in many non-supplier
+	 * contexts and a curated allowlist is required, a software node only
+	 * carries a DEV_PROP_REF property when the author explicitly describes
+	 * a reference to another node. Every such reference is therefore an
+	 * intentional supplier dependency, so we create fwnode links for all
+	 * of them.
+	 */
+	for (prop = swnode->node->properties; prop->name; prop++) {
+		if (prop->type != DEV_PROP_REF || prop->is_inline)
+			continue;
+
+		/*
+		 * TODO: Graph "remote-endpoint" references go both ways
+		 * between endpoint child nodes and would create endpoint
+		 * cycles. Let's leave it out for now until we have potential
+		 * users.
+		 */
+		if (!strcmp(prop->name, "remote-endpoint"))
+			continue;
+
+		ref_array = prop->pointer;
+		count = prop->length / sizeof(*ref_array);
+
+		for (i = 0; i < count; i++) {
+			ref = &ref_array[i];
+
+			if (ref->swnode)
+				refnode = software_node_fwnode(ref->swnode);
+			else if (ref->fwnode)
+				refnode = ref->fwnode;
+			else
+				continue;
+
+			/* Supplier not registered yet, or self-reference. */
+			if (!refnode || refnode == &swnode->fwnode)
+				continue;
+
+			fwnode_link_add(&swnode->fwnode, refnode, 0);
+		}
+	}
+
+	return 0;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -716,6 +772,7 @@ static const struct fwnode_operations software_node_ops = {
 	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
 	.graph_get_port_parent = software_node_graph_get_port_parent,
 	.graph_parse_endpoint = software_node_graph_parse_endpoint,
+	.add_links = software_node_add_links,
 };
 
 /* -------------------------------------------------------------------------- */
@@ -787,6 +844,8 @@ static void software_node_release(struct kobject *kobj)
 {
 	struct swnode *swnode = kobj_to_swnode(kobj);
 
+	fwnode_links_purge(&swnode->fwnode);
+
 	if (swnode->parent) {
 		ida_free(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
@@ -1105,6 +1164,17 @@ void software_node_notify(struct device *dev)
 	if (!swnode)
 		return;
 
+	/*
+	 * When the software node is the device's secondary firmware node, the
+	 * core only records the owning device on the primary fwnode (see
+	 * device_add()). fw_devlink resolves a supplier device through
+	 * fwnode->dev, so without this a consumer referencing the software
+	 * node could never find the supplier device and would defer forever.
+	 * Make fwnode.dev point to its owner in that case.
+	 */
+	if (dev_fwnode(dev) != &swnode->fwnode && !swnode->fwnode.dev)
+		swnode->fwnode.dev = dev;
+
 	swnode_get(swnode);
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
@@ -1127,6 +1197,15 @@ void software_node_notify_remove(struct device *dev)
 
 	sysfs_remove_link(&swnode->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "software_node");
+
+	/*
+	 * Drop the device pointer mirrored onto a secondary software node in
+	 * software_node_notify(). For a primary software node the core owns
+	 * fwnode->dev and clears it in device_del().
+	 */
+	if (dev_fwnode(dev) != &swnode->fwnode && swnode->fwnode.dev == dev)
+		swnode->fwnode.dev = NULL;
+
 	swnode_put(swnode);
 
 	if (swnode->managed) {

-- 
2.47.3


