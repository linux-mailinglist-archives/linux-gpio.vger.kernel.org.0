Return-Path: <linux-gpio+bounces-38811-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C0zcIY8/OWr3pAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38811-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 15:58:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED5A6B0182
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 15:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ctq4Zn7B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LF3VEvAw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38811-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38811-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 884F03011EA0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9493B52E9;
	Mon, 22 Jun 2026 13:58:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789043B4E8B
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136702; cv=none; b=byZdo6Y9MwUht6/QcBLAVDk7i0pr1J6ifPkX68rvRxzoHRwKQa8UalxgeHc6HaonnGRFebtvUe7U7PMCTLxgtoN4/FK+hy+tvPLcd9GjXn0bzih8MQnjUX4MtppY+rJaCwIi1iuLwdXkVBzMTdwEz5/bHrBu1REI/qFM9baLdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136702; c=relaxed/simple;
	bh=+syU35nDd1kn56CbcvWmAU7fRQBz85CvPrjv/zj0epQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G0k1bkj35CcM3wr0/qXlD+ehSyLWiKwb4fFCUbwSZkAvsyMgiTYyuex4/W+SmIo99zjibe1Hry120dmX04/yLgTk4km/aQ2jliO82Wg2Jc9m5g1h9HkSwwuLBFTDlr/YuV42qn+fhlm/Tq+UETzRWM+j07YA5AL90HkbtiwVjbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctq4Zn7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LF3VEvAw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGA4d1261017
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1uKNyXKhaAZB+YX8ESfBuf
	yAcvV+GQY4UaSa7BaeBYM=; b=ctq4Zn7Bb/iJpYgj5ZnBzWwN4xnlYSfdXxKJUm
	vo/2Dyj3kV2/WWks5quJNPONaHj9fJTyCPyv+szNkTrUCPHEYDdydpYL4OsicKnK
	Z2KZ3T1Zoy1xiWQt3Pl1tofxh2BDFXGPeh7hFz+UiT4Khh6L2lGAMm8qwWoXi3O+
	aiviMH1SB3eWZOmnhDgBmcVPl/A0FxSjyRfLThzfzHGHJvmcbuFV6uFntXlSu4/h
	NzHpyYjJQftSPWMXzRL8VKjmapJoM4wIg8SQaEuNf8CiwnI0ulYOWNKBzHUx/jmx
	mpX4e2WeMvMVXM62FPe7dpnu3ta6ut+fuPKoe5hPc25PBudA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8nmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-726a0352f82so6494160137.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136700; x=1782741500; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uKNyXKhaAZB+YX8ESfBufyAcvV+GQY4UaSa7BaeBYM=;
        b=LF3VEvAwHFaBvW03NT4ZlWa7JoixJ277woUYeQYCgrE6OfOHLSCnZJfuJXktIzgXeQ
         XDjjLMnJ/FUDnmI27oTl5Vjays43L8Gdj2I64kz7YznuaNAC7eVqZPD89nD7QB8PKfnH
         uC/KsLD9ZUNbGFNRt/Wm1dxIoKU9qePeMBwcgXoC/dNO/MseXFHM5zuLHGpSx1ryTDbA
         AM1j6mHFSJwQmcHCgS8pa2hmUnRhV8ZJtNpLFfCZFQ/eMdRYsDR9DYlgr/WrJUjLA7Eu
         72V3oAN4Qd4VKs4T7YkqkX0kZR+k7t3WRBneBP8C20AbVZMlnaTf5j+0R0zsj4bplA0w
         YFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136700; x=1782741500;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uKNyXKhaAZB+YX8ESfBufyAcvV+GQY4UaSa7BaeBYM=;
        b=JZXIWtDcZXFGckCY9853cDiVotCfbxH2iY0WXFvvAFb6mArfnAc65jF++ahzV+sSV0
         pxHMDwmmSiRp/HKhJoovhqKLv4XAPAI4mQlWuht9gKTAyxJJtjFmwS+LZVGd/MaSSSHS
         IGjqPfZadzmVnVwzqLBYbsz0Lq1K3tHDimm6fB8leLKb90T8FYN4COwf0w/IfGvm9wYR
         4auPJ68kmopkMXBh5/gyXAYkOaYccnvaH+ux2pTTZ3WGSqP6r5C9hd7YYsmH2ATZcpo2
         rIdbQLZoJMKyx1O2LIXlMh8mDdOqgZ8MHs6y+ff7fim8pw93L6RV/+3n/XPUrKlirjU4
         RZ1A==
X-Forwarded-Encrypted: i=1; AFNElJ+2OyvkLeWVrFv4DDCQqFYeRnSW+YGMxCkQV6FKVgW3odwxiBpGXgig/QM3Jx88d9kf41ZPhaHvA7mG@vger.kernel.org
X-Gm-Message-State: AOJu0YxujkMKu9br7PUZBr1rnQAbDSs+ejDkSomKUYaieOgTpLtm32SC
	x5gbQ2neRACWWshgCsLoBcVLhV/ZcHPJtWQGI3uCh3IIvEshwe25J3Vk/emQkad8flBtoGws/1Y
	ttiJVAQeYY9xxWfNWntzEDCkZxAYWqkCZ/moLy44OAKVPipCmo06VLddidP4pqcOq
X-Gm-Gg: AfdE7ckQjKZOtzBfytlCkV4IQypud0BG/3pUfGnssYLL/ZIIwl7FLk+4GQVwQscJQQJ
	25y4MGa3QjIRjCPesCls9msslI6veirPKdvI+INEKHDszxlMJMM8mqQqv8J7YSsKItNDlCClcd2
	5cttT6RxyKFBAG0+NwWxGRvIsOS6FQJUTnis67pRNBclT8zkPbnbXc/AjxAMt6QCWzLZYexi68G
	DCTtw5IFiZYtJ7pwW1irV3smFYBzcORqqxYU+f+i93w76VO0ck5ClbU58PYghFN8gC9vTL5cE68
	4FkM65wXw678EOZH3cOADp+G3wVPuOHOS/GteM7Sn5QHnMMUPFpAb6s4BcUa/ODc9fMU+A3rhRN
	ryS/y+OWA9cAA5MNLrCap91VHdbxWIGQNkeKveS8s
X-Received: by 2002:a05:6102:5090:b0:6d9:a879:8e39 with SMTP id ada2fe7eead31-72a0354514fmr8989611137.14.1782136699814;
        Mon, 22 Jun 2026 06:58:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5090:b0:6d9:a879:8e39 with SMTP id ada2fe7eead31-72a0354514fmr8989568137.14.1782136699402;
        Mon, 22 Jun 2026 06:58:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238900sm208247495e9.4.2026.06.22.06.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH libgpiod 0/4] build: fix problems with meson build option
 guards
Date: Mon, 22 Jun 2026 15:58:06 +0200
Message-Id: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4/OWoC/x3MQQqDMBBG4avIrB1IpkXRq4gLTab6g6hkVAri3
 Ru6/Bbv3WSaoEZtcVPSC4ZtzfBlQWEe1kkZMZvESeUqER5PLJHDcIRZGGancv12Kr55hdpHyuG
 e9IPvf9rRgnHasUXqn+cHOW8fNG4AAAA=
X-Change-ID: 20260622-build-catch2-issue-740e2193c71d
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+syU35nDd1kn56CbcvWmAU7fRQBz85CvPrjv/zj0epQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOT9xj+bboXmjnlg91nCCabp+HZFgzmmo6hBue
 txXv2JyZ+OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk/cQAKCRAFnS7L/zaE
 w99REACnBtMKwk5vL1yiJP2P2x/odYPQyhJFvsvi1CS1G5DXLuab7DBL0t9wErK4tK9ImlUbKTC
 74ihCDdrquvd0wQxdGhu5bdIDjXSiGvwum20ZfNOa1qdG32MbAVpDoqOad5snfQMflOhMbGdUUr
 DUpzpZlFuW1ejjoErhJlnugrKezatkkFHy+loTEQ9Lha5rOGoJABLV0CoqUD8QLe4oQLWMnbXPg
 GTwHDcYfKXrBqmHm3+9jSsMcoBg2NTGDq/wGz9yIc1cBSxxt143DjxugDtZ/8wmaXUVcmxXF3Ms
 fGylETL8GgNZeV9Vqw9JOsVGsabqjYwwbPu8S0G0M4EfPvS0naYVZ9e3IfiJ6hHTn+ttsi+pihw
 oj127fyPKzXrM6T6QLUpIL/nYeV3g9ZMAN2/DeFoFAZCsi1p1HXj7OJV5fFNHryBPGm0yGbolKI
 4YrWVUYdmugDXi0HdRCjSDhFclCev53OxbL2CMWfK7U2bpHtn9tyCWxk3CvGr4ulUyvaQxx4D6N
 0/qDNq5lbwipbi/H+ENv0A6KtpSdFNNBuwl9La9e5f9jrvYSJN3Y13QFkr2X2Eh3ZIfrPkkNVZX
 i3tZIkDgwkwwe6UoYsUETx585GeEgtH+KLbY8fgJH95wYDDNfff4DdHzpddNFzSHitN3uI4uFV+
 19aWh5wpALs+lUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOCBTYWx0ZWRfX1b3tNjhCXEIg
 0GDjqluD4MqumCe5aFOXToiRifdxmcXGcUplj6Xt0AWKppFuLpaoO/CtpU2p/cT3pCxk9sAEzo0
 1SMnpfepSPRCpABGql55e6sebDuLErM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOCBTYWx0ZWRfX2XgUOcqLaehy
 KVZIfhyc8bqZrxoZnsMqKogrTZA12X2YQl5SiH830VlVJbsunIBGIbR/TZ4FKG/an6Tbozy3JfX
 sV+tq3qcgFOyPCV00eon3SCh7YTD/YvqxYCKElHpNbOKes2Q3//hrNAjLIzQ+GLJ+UNp8fSwPU1
 /kEcxByv7vclTJwMr9rAkgpjwu6hJVgwrhbol3UoXD9977DVrB0nfShkhVQzXr2+ga9SEkdvJnA
 oxV2NOzJkINwp28MSF/meEVqYVoqFHLCfhpzBfSdwOee9lQrsf24zeQU24mIwMbMwT1lVfH7XCK
 UujP3PbVnpWrUMXRt30uzAFGPeOnM7bnlZRI5AqB7spU/TZLs4MPu+0iJid4OeM88N2F++Vf/I5
 zi/hDmT3BiNrE0a/0cGXVwe7gjobx+fk0hQVzTm3KFRVgItpvxElyvD4yKOUzh1P+Ur8PfaMXh/
 1l7S3SvUsvC4rZ8h0FQ==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a393f7c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=LxFXY4kf7oqdHf8hpzgA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: j9bWC0oJ7Jyf4vusZiVLBkDxrli0VG1l
X-Proofpoint-ORIG-GUID: j9bWC0oJ7Jyf4vusZiVLBkDxrli0VG1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38811-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ED5A6B0182

This series fixes several issues with how meson handles build options
for libgpiod. Most notably: the problem with catch2 becoming a
hard-dependency if tests and C++ bindings are merely "allowed".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      build: don't make catch2 mandatory when C++ bindings and tests are enabled
      build: include all test dependencies in the tests_enabled gate
      build: fix incomplete dependency gate for glib bindings
      build: fix incomplete dependency gate for introspection

 bindings/cxx/meson.build  |  2 +-
 bindings/glib/meson.build |  2 +-
 meson.build               | 30 +++++++++++++++++++++---------
 3 files changed, 23 insertions(+), 11 deletions(-)
---
base-commit: 40538a7b48c9a6bd50d6253f86fdcb354b45073b
change-id: 20260622-build-catch2-issue-740e2193c71d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


