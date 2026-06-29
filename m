Return-Path: <linux-gpio+bounces-39107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xpndBOFOQmoo4gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:54:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1836D9164
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ElViAz+h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QEF15ymy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39107-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39107-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA2A304A866
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6358A367295;
	Mon, 29 Jun 2026 10:52:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E59364021
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730363; cv=none; b=K3vXceueqGvrMne5hI6JWGFWBnrr6ZptvFTKr7hM3Dtgf+GwJBUmm3UT3ENZFwFEjHa1HoL283Qpu3P56AbPAmdpozWWOn2kMWfxp3wk/riIesWC9OM28lBb/WmQgCQ1/mTu4hxVqpct1WWmhzjWdXg5x4vecX3rUrbXWdDdX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730363; c=relaxed/simple;
	bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8sRr9v2HfIHBR7GZz5tiV9yNv2w+/M5W9LLNRhvIFpLQulkM91oVL//+t0cLsxV/CSHVAUSCCsJd9jJi2mAQtMis3VYmwtLMGXR26AxbkctDSGSHipJXBMy7aElBAStdhm0rvKo/Wpgyl0KDL/9FqXtUMFnnZIZagsuUIdIVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElViAz+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEF15ymy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKrk2656157
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=; b=ElViAz+hI+q4I2AV
	oBcrYXf7Y/iTAIxg9V2VlqJqdwv7+VoCTBf2TW5dO05ntXLoDRQuvTFQvFlb8nDH
	XgvCW7hSGJlOXd0vNZaZEstdLZJE6tLD3H0f0QNYKdmw9eI6Kydyp2i6yJXbpCUP
	V7xkArJMOsxzTPPk+HKlxJ9+Dx6EUZ2E/tBy7tXTeSnyXgF7V/i863IczWcSBE/Z
	NLH3GLd9bPc1WTwdI3l9LwZuSbbQRlgbhWboQSwlXwH1QUpGlaQ1jnod4aeoPBqQ
	tnPuUIFYCc3aeX/aSPZLwteB97JyUJXNbnluL5PRi4BN20OpVC4Gb7f9SA5S0qU3
	Q8/CIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7ge79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b4b575561so554818585a.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730359; x=1783335159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=QEF15ymytXOQqK+5s0AFAYK3oY3xQUZJ91RbXOoBzH2hfvcPCxrEnyhOZGEK8M5Z7p
         RbmWrR8l4ZRQOcyeLk+3tBHAuLIgry2SduPJ3u9Nr8snjObJlkDULbbmucek3m8ryF9R
         aBB581RhXkBPbvg7Vx13S7qjE3Shb5hE5DWldHfhNQ3IVuUFdI3VEI3aVtmrUda2sb2b
         Mt7MLOjfF5CyxMcFVrNu1Zi8BsemXFVxDGiBQNbTNZIG5jwFFx4/HxIi0YKhuKhGGUjD
         9+TqKVwT0/EszUjmIbBasVHfaP4OcuK0D7GsDSGTy5lrqFsOcwjRGPPv+tgmFYDOwoI3
         kwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730359; x=1783335159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=mO3P6Nc7wA4LlPDfTil03rSYfKWYXbHYXbeeZJuLliT3sKp6Z5m7fafsqSSXcd5XNJ
         Bw/JMZgJbB48EAlgUC2guJNIGgdQ6p6nXkgtSEyk2Xzq4kf0DGUTkrMbOsGt6J8Fp9Bs
         WJ2aGm6IQ/cKyZUFnPjqCmfKPwbIyQlDAOmncteFCEJpgMDj+fALTZB0w6KA8dD/SV7O
         /QW/xFhiK8U6wO8HvA8TBf6fRUyLdDo2oJct4j4WKt8+FKwYOWZV6wvvz4pbm5J1GouW
         Gx8isnujw40vu7KniGXfXEOn+bbtyK8kJappYB5aE4al7xH6ovqT1etbCecgel2tb9Fs
         7Gfg==
X-Forwarded-Encrypted: i=1; AFNElJ9BCsZBGYBYI9QyU58K4yRvOlUOi5pOjSHTr/TYYDE8x0gIi4a3tfbKVytDvZBcy3QsSxs7sJiIDIvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZ5ncgQ6vM0HHVzbRH4X0ku/qquD/fbS9qdiQXbbxNoKiHhU0
	W/WkVjMXoi7phMn9lziK0LdUSTZCL92Td67br0vkTvmINBHnYHyfjCfBGc0xRA3vUdT1E868QVX
	hIBAM0+eIk0jOFIs21pc8DtnrEu17DFrH8UukvNmZaFzGx3aNwn2NisiB5V7oGavA
X-Gm-Gg: AfdE7clwdg9YeuZz1TI3f7RAuBloQgBVS+ZEU7PiySJJN6qC/i/arkcSz2Ktj0hpE9G
	yRbAcETEz2MZUJyfpkwLRgooQID0bEoaszdZ7moZhgx31BKOhSPuHpDERNm7xrT+L4knXf+Z/60
	iJCdeawL/VdMYiUpjb2HiH0VMSOb6w/q51FMSFUm6yTSzoxGN+jEZ3oRSnDDueE7YTIkHhaWAas
	KosfKVLFZCqUQu3q4T2Jbu/RkhK4ivMuBXJCq0VraRBIasIMZjeDHEHWJoMImVzaEZbK50C0w5T
	Zr0o1RPL50F4w6EPvvBxZOZOAngjuCag5RtPAeupGKQW7LSaegga1WwXCtZ6pnV5QMITcrvCkYd
	zSEcB8W6ybNXPXWFF1x02hWI+6QGG9FWnGzASQfE4
X-Received: by 2002:a05:620a:44d4:b0:915:956a:71e3 with SMTP id af79cd13be357-926004a8459mr3564824385a.13.1782730359351;
        Mon, 29 Jun 2026 03:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:915:956a:71e3 with SMTP id af79cd13be357-926004a8459mr3564810385a.13.1782730356974;
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:06 +0200
Subject: [PATCH 1/5] kunit: provide a set of fwnode-oriented helpers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-1-b90058b41839@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5500;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5s8+0T+1rYepjw78mjOfJ7HDxeLmBF7VH0Z
 H71ylVa+QSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObAAKCRAFnS7L/zaE
 wyK1D/462lwu84IwHESL0dSs0hJ2NL2jtoDUPJhLurRJpvJ/TBAr1M+EJnvGrAEVJg593UIwlXs
 /dvemDRvgHfXacBumVZZDk42Gdlp29dXqcu797sviaGoLhFpPu6pgsVQ5LDxhLzWwLz+L43TOh+
 9ahkGhlmiW+ehjEEVt8aTmwNHb51pyjbvkQgXXDwWnmylILqBrT7JbsYXSTMRkoswlRW0PnCJP2
 036BoOuu9q42gkb8ytXCN8cb4fZCBmmjrmD4zRUD3arv4ukEgPyval3GboC5PlG301wZQtuC0j1
 3ofSnx8GA+l0l8Dd+p9bDDqfUvnChlsHxhpoKL+xoqiVUiWwd0Y5hfZVRRiWzVRlHS30Ln2jwQe
 ahgArzyjaAhGQNu5T5jSeq/9RhwjeudDUfjBmaHOmbhAHwJ4tLN6QSfdnTQ/OQ2/nFn3AXmsPmc
 aZ7HIOtieVGY9aRxob3G5/iGISSsAwr4GOWDeeME2+JN30j6m2WfM6c/nM25ff5BxK7IwAVMdkP
 e+BsDJbGYmwFtue25YIG/hN4TgY4WXsacRP6OiIKy/vjB9Ln6RteCFQYYRwFx6xT4zTsXlZvOQ8
 HCzHpJF6FZJlpkbkosn1lXKeH9V6yA3m4+L354JE51z1sCxZGQmqOqzp5D7Tii4KtrhaG5G5qPB
 QzYV5FP8UEdItng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX0KV4ZWDSZoVS
 mz3nwHFiGkl7MSguuElgW8VEtBtoJ50nD4CL1Zc9KQrWqtnbTcJ6qpsQty4IXvetkAQ0j1wRJX/
 yIJDMzjZC6o9l7y4tTWShfume07kauyf4JQ9vspi9Kra4dNGEGWZAvJG4CxqDsg4c4ag9oe2zpY
 0DhQX871MufQ/jvNf59JhDqKUMYG0slrhhhkJRH+/JyUNnTHlNKzXkcvFT+AchDinQoCTpJxlb0
 +FFQkoLNkztdvrhJcze8ZyVHXSBGRskhaxB2rWcgGf21eYUhTmm710d4f+PRZXG6wCGmk5qfwR9
 ZjAqZAPAF0wRb0fmu3gF5oLeT+kVecOLSXRqTmol8sKTfXmJUl8KVvc3PnP8Qpq6Di95tEjd8Bn
 jaqOaukb2/GzbG9dCbpqkNLlTYLTVNuyKw1EzX24hqTV3E3jpdOgq2cp+RD+v3ilkOyc9ltXI+H
 YhTd6kf+vyXRQ6290/Q==
X-Proofpoint-GUID: UHx0QG2ovqi8lb_8wnPLsVr653SbTUBy
X-Proofpoint-ORIG-GUID: UHx0QG2ovqi8lb_8wnPLsVr653SbTUBy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX9AMuuePKlGzD
 XdPkbw+xVWfqyhhpk7SXBgkO7wSJoE1QeTrDOmxzlzasYnh0BcVOvo5brGInB7A5az48GtX6wnY
 7LbxMWNSIqDM17b4+B37t67GDXPIS1Q=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a424e78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VSMHv2xdrKP6GTymTuoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
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
	TAGGED_FROM(0.00)[bounces-39107-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 9A1836D9164

Provide three new kunit-managed helpers for test cases that need to
register/create dynamic software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h |  26 +++++++++++
 lib/kunit/Makefile     |   1 +
 lib/kunit/fwnode.c     | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..239bc71eb5072ccead0beb51fc0882bab69c6877
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers for firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct kunit;
+struct fwnode_handle;
+struct property_entry;
+struct software_node;
+
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent);
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 2e8a6b71a2ab07a738964a7ef0f442fd53e085b1..204e02b10eba1030c6d511991fe2f6271de64603 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -11,6 +11,7 @@ kunit-objs +=				test.o \
 					attributes.o \
 					device.o \
 					platform.o \
+					fwnode.o \
 					bug.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..332490f07fae78e0fbf2930f9c80da0cc7dce028
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/fwnode.h>
+#include <linux/property.h>
+
+KUNIT_DEFINE_ACTION_WRAPPER(fwnode_remove_software_node_wrapper,
+			    fwnode_remove_software_node,
+			    struct fwnode_handle *);
+
+/**
+ * kunit_fwnode_create_software_node() - Create a kunit-managed software node
+ * @test: Test context
+ * @properties: Properties to use to create the new software node
+ * @parent: Parent of this software node
+ *
+ * Create a test-managed software node and return its firmware node handle.
+ * The software node is removed after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the newly created software node or IS_ERR() on
+ * failure.
+ */
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = fwnode_create_software_node(properties, parent);
+	if (IS_ERR(fwnode))
+		return fwnode;
+
+	ret = kunit_add_action_or_reset(test, fwnode_remove_software_node_wrapper,
+					fwnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_fwnode_create_software_node);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
+			    software_node_unregister,
+			    const struct software_node *);
+
+/**
+ * kunit_software_node_register() - Register a kunit-managed software node
+ * @test: Test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the registered software node or IS_ERR() on failure.
+ */
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *swnode)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return ERR_PTR(-ENOENT);
+
+	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
+			    software_node_unregister_node_group,
+			    const struct software_node *const *);
+
+/**
+ * kunit_software_node_register_node_group() - Register a kunit-managed software node group
+ * @test: Test context
+ * @nodes: Software node group to register
+ *
+ * Register a test-managed software node group. The nodes are unregistered
+ * after the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes)
+{
+	int ret;
+
+	ret = software_node_register_node_group(nodes);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, software_node_unregister_node_group_wrapper,
+					 (void *)nodes);
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register_node_group);

-- 
2.47.3


