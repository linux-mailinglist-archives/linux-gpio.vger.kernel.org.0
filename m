Return-Path: <linux-gpio+bounces-39110-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3PBZAi9PQmpE4gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39110-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:55:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995F6D91A8
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lqRQzctr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iWEWzrcn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39110-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39110-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA858305FB2A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A51368D43;
	Mon, 29 Jun 2026 10:52:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0A2364EBF
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730367; cv=none; b=By50Rd1KJvv+U6pG72ccfGqhnIYfNXOPl/mvhJaBSBusFZbsqjLb34eT9zI67suBEo5xJX/Vq687eIXFSnsRnY7/ktcnOldHrUR+w+9h0RdMWJISU1BbSzhhE5S4pjEHv1aLk7ETjF8ym3jhWIVERPStTn//cTNOW+e7g4CDkFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730367; c=relaxed/simple;
	bh=QYS3EqsqHNnRb2qyR1WrVdwQJM+VvU5Fqh/2g07zTc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2nopRd/fKc8xLg5+w7T8TwpfL0X3jr5JcB7vRlyX5CtqfsRlgxFkrhZfhVT4coBXUeq10IU/lMr1YkayB49Hx9G3fLVrIFiCZa7Y/tXzGHQ/FZukyELZSNq/dbWYOiu5pjELmBlliLVcUY/3XSkx15xZt99+DUt1cKp4zPn39E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqRQzctr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWEWzrcn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASqFY2601127
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=; b=lqRQzctr4Kajdav7
	lYx2um3APIHdIRxFP7EnCv74uA/yCPZPdr0IuHoKsYM4z6GlXM8rmP5DCf5eBz51
	FnA3YVGfswU8viV7u48eQGPDmipD/EGXfN1SOnvgoEz71EJrvFYS4T8/2W+JLZU1
	rxQL3Og5rGGfuBVhXx9alLxU9dN+drAPNaUj+Dljt6xQKcikodtPfv9ur5BFHJHC
	20AflN73fvRlBZQdQO9Q/bXB7z7m77eB8WKur1vUf10JSz1dL+1K4ogAtAWPIsTc
	QczPnIplWPB2r8kSI+pZ+WkBgpFdwz0hOkNKXJxNMAN+8CbhO2beSNxEaFzlBHCs
	lu9Ntw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8ep0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e45453c94so357777985a.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730363; x=1783335163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=;
        b=iWEWzrcnQwVhJbTQWUHkkUbm8UlbArRksZ8Ulvlr0cVuMYUcVkB+OrPZIj/zhmU2xS
         EoImiZ0cyRIlMkA+MLo3wQEqvTUNcIqxPvf72bAIGAk8zjQzdP+gGXFim3t9fiXk6AjE
         LPWYLJouXI/5n2FpKEotVOA1gqwuLb8wIi52k6zx38zb8gYrivAnC0Pi5ifF45CzsBF2
         Fa2Ht7ibFYcnd/OMm761qG28Ogx16iR2zTfnVDGrRh6Tu0bN+qV2VrSxy2RvECbSj/AH
         FAucBou10YvzWmfpOJitD0KqU2pcDY1+M0ydX1qnkBRmZl7UBfgzCwTjCggjNHq3guF0
         2wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730363; x=1783335163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=;
        b=T2aJItngowUic7f9f6j4XZHj++vguxDI3kuszHOc8V/qKiTtPxTBXADi1qpzUhL4m9
         Nn+nTe3INjwudi0hSDAoBmwtgtek0dcgY4gF20U2SYV21nFLJ7dHTbex7+4MkSBh4Su9
         ThyJIsSaxNniyc+D+nesBgEm9rgFaE6gql06KmngZf/DkzW9lxnv7CeOJcENwEAJbmlj
         GwEs4xOzbfdRptgCdrMXhj+GSIR93/5KEOSY3uXiTUk7uviwTDxelKuN6akgXH+/q7ar
         jGRUWR05IZFEfrFR4AOwaLt0P3YMpq876WesRKgzH+tF2Bz2uHcCcWSRCli65s4oMIfk
         Yqow==
X-Forwarded-Encrypted: i=1; AFNElJ9b61Sn4h161nZWjUDwfXyDHD+rA35EGjn/4DAo0xhq4m31zvqY5OQkOJHEbhj4J5H1d6ObEgdbJFMx@vger.kernel.org
X-Gm-Message-State: AOJu0YzxE6UYi7nYhqK2w/nfMEuzoaRJi2bVhvDunFi6FnmteicST2bh
	4aafT2pC3z+bamwI15yaiPo4pMOzeMyL2i9757ipBvlYSHv1V9rOJ34illeGwkJ2kom4bq/EtIZ
	faOFAyOhmJj97mqmdmLcESm6HXE47cWY3j09KC1479TNyW2aqHrQUaaZ2ca+/4SqZ
X-Gm-Gg: AfdE7ckZK8ezwbr4S41JhZK4ARbCofgrCTrrdML3mKNze92OJYzYJSNJwF9EIdgnej3
	KfueqQC95NVDniLnroHmGcYMSh1YnbzzMshyNZvhfVexbLI+1KJexicOoQsw34VRv33bTxJTxH1
	NKDZiy/IpE4u+QgnYy2DAWrsMWKiFRzHcXZEMgGYHlb2wpO+4bBiddO5CI5nFqqNO+qEB7rlH7J
	qPc7YaSdED/GjZKhwjPk6+nJAOMZICaQJq6yXBLS4Aj6vjEFLfdiba+HSSSBsk6r1elsY8fveUV
	NhMdh/HBv4urn13WCHfIupR/WeQetaBopmzMKHEIdM1DGDNgjEUdG14OkSHu+Cmh+NDeoBFqGHS
	BeE//xqza9RbqHnAqBqHW+zrjwHUH4JF65DbxUCjf
X-Received: by 2002:a05:620a:7119:b0:92b:6805:9189 with SMTP id af79cd13be357-92b68059702mr1417910385a.65.1782730362436;
        Mon, 29 Jun 2026 03:52:42 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:92b:6805:9189 with SMTP id af79cd13be357-92b68059702mr1417906985a.65.1782730362062;
        Mon, 29 Jun 2026 03:52:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:09 +0200
Subject: [PATCH 4/5] MAINTAINERS: add myself as reviewer of software node
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYS3EqsqHNnRb2qyR1WrVdwQJM+VvU5Fqh/2g07zTc4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5vAtDrLBxJ7wJSt3inQfdwNmzPhUgJvSVzf
 KKilDv7TSaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObwAKCRAFnS7L/zaE
 w0uND/45JdiqnKMuc5wUZ7a94clqHgiv92Vw4uq+Dt6H2vT1hShus81oLf7Az0Mn1+ZcdzO5inx
 eNYRIp8fz2ZpoT/6th+odyzuaJmtXtCX9sUQefkbocFl5tiYsgqMSRh7H8IYamQSvGNDM/wLcRl
 XSiMXhYxCf5B9qprngFNBNDx906crWvX0RxaHngioNcf2iXtpnumvKq1JacaM73djmyYrQOJg2u
 Vzd17L1sffP1Uf6+nhhVWDoyuAASM37vzZC5UMYr3+K2o1cjKECYdNfh8SVC1opRBjYLtgcNA6q
 QIR0awIpCX8jjCCsrMFOOMjPhW11xf5rXIQZnqYD4PMzhZ4zEjKCXT8DwVAKvzQNlaW931kQYCI
 bpeaTs2sW0Y+XAc6and8RyHWbCV/EII+gxghO2/OJJzZct+Ms8OEvN4kECINn8jkKB8ujR9Uwf5
 QwIrOrYACLqduoHLLAwoAPGuzjZiq4fSN0p4dS/6rU2CEtgtEWzoU9wk80VW7ORKXQj4beGR+qm
 fZfGoZVLk7A2YYK4f0IfUWDEyLVSaQyMF6YDJvEAyrWEggL+2h5q1kJxeOzwOtF5HF0kGtSvgwj
 nldxL4bakgFDh4R5P9SRskUl5GvrRvUF3ZZivjIctlqsVNwF2zj7P/iFX0jPKUCgkwB/LdHLvPn
 sKj75IPRiSn3IDg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX85w5SUBW593i
 cZMgW4HCzbtLK15q/xsrzIE5hfDe6x5AhB2ZUOxD+WN4wg8lVxn1hvv8KspTOcBFiFwJ8v8AmMj
 3/zeHVHS60B3MuiTepA1ZP2q91Rm7yQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX60M8o9YCD/De
 UXxAe+dSohFWPar7VqUtCKZ+0CqJB/h/EskW69B7qrHHke1h5IcJaQqkbbHsKcfmLaGHKdhGCiR
 58RDv8RkwbjRfSy8TfhEVC203tsIH0GL0YjyuDoc1Gyi0tqr1LpOytC9qEfPb+Nu/C4rHSQMJbd
 82zT4wN610Mt1Qc+LeLroAyhCS6rZQWuEhkt0VCuZDoew3X5AfllaxAEXwcK6MCDZsZaS0EhEIx
 7eXgsQjb8a6B1GHVK/VIY9N00cJY5kFPNZQdQktmbg+zklkEYXkxb/vg6VUQ+JrkrxrKEteGSDJ
 3MW64HuvEhUnI0mvc+FDHPQ3rC7lBURqEGYKO+sA0ovVGdDSPRzw5KcDaFyu4+XEA4GXRv0lD3H
 KyUxjhTsdxmY+9JvltlC5PoXdVRu3gUB0Gi5dS0wuiRpQHldFeCoLkPfhnsCkZsm+H+x/EpXYGl
 S5Yi/ta2mDFdM+qwSqg==
X-Proofpoint-GUID: LvJGKsA2ewkAOyMp_wEulpIx9DOSbaFo
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424e7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LvJGKsA2ewkAOyMp_wEulpIx9DOSbaFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39110-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 5995F6D91A8

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a994cf1b354f490d6c4e411588df88..e30aa3b63eff90bc0ccc39de774986ce17494071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,10 +25101,12 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c
 F:	drivers/base/swnode.c
+F:	drivers/base/test/swnode-devlink-test.c
 F:	include/linux/fwnode.h
 F:	include/linux/property.h
 

-- 
2.47.3


