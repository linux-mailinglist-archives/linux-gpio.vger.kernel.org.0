Return-Path: <linux-gpio+bounces-38813-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwPnGtBBOWq0pQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38813-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:08:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E9D6B02E9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:08:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VQJnqGAd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i2g9j15P;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38813-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38813-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DB0E3055409
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3D03B52E1;
	Mon, 22 Jun 2026 13:58:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5DF3B52E4
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136705; cv=none; b=MuMUCoWumsjVVEJkDlCQ+XkPXOaSZc4s46+zek7lSpKv5JQvn2r9UuexMF1zeIMVZKosD3L4qqWPu02nd6e+seCi8i3rYjS9Oq3k61F7vXs/Yx6DtppReX8SRjXNrJa9Poa7TxrO1F9u4FNXGir7Ap60aPOg5ZFWCNpQ2hx0j4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136705; c=relaxed/simple;
	bh=4TS+xwOpJFpnt8wPJCqQyVs1Wkj4NWIlfSbbW1hZJx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1e478z5YHH/KSN1ZILC0YIl7rkx5p0i0Wjxhno18bjik5Lxg06JyqFjRkXJdV8IfeKwZXaNi80Hjd9f+GbgTVdLB5RoaBDc/1voL5evEceEY6n67DHQJP2iGxEr5Mqx3FKzfzj+BYy4aY7XBOiR58dIcASPdLEXXCm0i77yoMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQJnqGAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2g9j15P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDSZYd1120910
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDWsnHuw1+8DQ8HA6AmM3OwOxrgQGLAfHrIvWM3VPBI=; b=VQJnqGAdBvAvSpEy
	UfR2u4r7Iz7mSCtTUHpVcJDGDgY1fGWeXMRJh7BuAASy9i4WY1YdTiSVQKkh5rZl
	HquKXp6mh/ngK4g6oe5Q9HYCHpuNIeK8rcQK3P1/jVGfIKGTv/U2E2UiVjtxFR3p
	FQd+p2xRmSGKEEjrdfHTUIqhgbj6GQf2Nk9nICmoNOa5KZbA+YNMaD7cSZQzYuOA
	6sYngptaDTwkVyRhf6RSDQ2B2lX0tDIurXlEGa/QipyPgCFw9tFOb7QHs3/K9dyN
	qZ5qDjOWa8XbIYgaeSibGJWwQ4f8C3skUEfri6qcqgEROBpatNqHuZ0P/fzWORP7
	U6MTjg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5ye83c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c554284973so5740447137.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136703; x=1782741503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDWsnHuw1+8DQ8HA6AmM3OwOxrgQGLAfHrIvWM3VPBI=;
        b=i2g9j15PXfb2sxfoQrj5LxMeQ1TLlBwnn3JCnGK/bCCbItEA9KDc9zDbHqudXa2tMt
         Im+gG1RwXn0HHiEimCY5J8cTBMV2JKzSvavpZ6i6hOP1PjSSal1qHooMk0NA7sbQlj8V
         uozEyvEqKqPhmnZu+a536q8xFsJNoB7uelFc4bN8L5VEUAwZ3A35dIznvIs2oas5k6jL
         Q7+3hod/mRXTLSjfy60yRvRXANGocw0ekJw6s2M8BK4/z1zMOI+iw+/6qR1Jn2chwqE1
         ltulEyhDiZrk/uOEYl4JbgH/czUMKfZD/inRIqCjcENX856Cj6Agwn6LASldZTuDgavM
         2g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136703; x=1782741503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pDWsnHuw1+8DQ8HA6AmM3OwOxrgQGLAfHrIvWM3VPBI=;
        b=NOdkrF6ojXNWnb9F5dGy92dMDD8PgTWC8B/QtFAihCfs7QaP51aVD4eBVzmKoUPGaN
         opDKB+9m0CmVWckGrmQUmwUQ11mKG5Nd7SZkd0GKVwTGhUvYf0PAjE455fMFB2/4nfqh
         akhoO5Fz0JaZywFB7m6bEFlebChr5cnguBH6G1BIXneNS/tahzY25dZx02AyEP23Ig9s
         zHINMLqpkk/oCwHKE5hD49SMEYcstb1fMmuKt0Q7KiwQv0WogM5tDI44ViDtEH+oR1Dx
         YJzwy7b/dE1zA7/iHCDWce/QFgW1DpmuPg0eOkNs6YzCCoxUxTFJIakYGb8TYtxZTp1G
         rB7A==
X-Forwarded-Encrypted: i=1; AFNElJ/tmoHLtO8R7g0jJyAsvF46mAFhfxRc/Xa9/BvY/Atc//PfPamEc7fKHRD2c/rDN6kc5pRrP8PPJ+Sc@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiDWOYEA5fZ5HFC8TJFuvhjocivWkRIBknnw0M9bXWnNsf2DW
	a2iD+msx8nDZcgTs5TQaMNn+re086yx/KbTqASh6Sr2zfj9U84KVSebVEHDlVWQ6oYJE1PcbIMU
	OBwMTKGcOxo06CzpKIVpx/jJWOaWAAlq87YcQejD28L3jCf0PbcNHrEXTBPYkzw2v
X-Gm-Gg: AfdE7cmS7pgJ848DphoHF6mMVarXEkxhRTyUtLpdBT1+FysPjTJ17Pk9rKGwkjl53Ey
	7q3vjjtZfnU3f4Sd5YMbzz628jOZwrnCiM7V44RbgZMVaqV6V4KXBJEjQssBtF6XS4PTpAXQxAz
	PciQXznAAO16cGSJw4N/UQz2IX2ixFafTVZ23xmm3JhLD6CrGFfZpquahbU/X1A/mdCzuiu/9sh
	ohy+5nS+t+AI4uBEHjFIFFt3obdxtVNE+iOxPlTSTm1Tz1hG93VK3XVXHnADWGvDWpbONmHUn34
	NESNftocPSZYyrBB7Cky0Y604S3M3mn3UTRwXpE9CONzulBN3Ubn4xDl4a8MFxDvoPolGhrMt4M
	iUeoZczPPaIAN5/RrrLLEJnzDIfs+vM911G30qjs8
X-Received: by 2002:a05:6102:c8c:b0:631:26f6:7022 with SMTP id ada2fe7eead31-72a1fbebcd1mr8675144137.23.1782136703106;
        Mon, 22 Jun 2026 06:58:23 -0700 (PDT)
X-Received: by 2002:a05:6102:c8c:b0:631:26f6:7022 with SMTP id ada2fe7eead31-72a1fbebcd1mr8675116137.23.1782136702717;
        Mon, 22 Jun 2026 06:58:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238900sm208247495e9.4.2026.06.22.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:58:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:58:08 +0200
Subject: [PATCH libgpiod 2/4] build: include all test dependencies in the
 tests_enabled gate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-build-catch2-issue-v1-2-be95e28f310b@oss.qualcomm.com>
References: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
In-Reply-To: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4TS+xwOpJFpnt8wPJCqQyVs1Wkj4NWIlfSbbW1hZJx0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOT92lqAnimnk6DuaX5m5oPUjhjun/ayqUbLxu
 0bcaZyTb8OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk/dgAKCRAFnS7L/zaE
 w8bwD/0QXx+wXstDyUZ8kyo8QReT7292FK7i4phjVAnnQbmRsh+QVzlyYbyDeQovVz1gPT+i8c1
 CBDBUnUqZkfh5IBTZC3iFxhOEFQdufpD4E22HAg/GP1stVilwR67pTsCyo6+e1J5LjhH5+Rm3gd
 rFywauQTF+rNFAMiOdnpU26ILPRawYNMUprQSuql5R0jX9XibTX/rd/MuvTDXPIspelin2d3xW4
 PxEnEpvROHGnwf3CrVjGfCjtMzf1O1wdF1qn10Wr1D5iiyrOIhXmpDZtIAhqCdJ0jHcLIDaanwS
 R1Pi8W1QMMwt2Zn/6BH+lAQcwfmD7k7nBlb1xrNn9lXsibuEYIsrXxXHWWGfn8UHHPTLGjRtjTd
 Sc5CvPVH5luXi3bETJ/xYGPZmqS1Z52h6fWxGea2TolRi+OOHzeZ74BFrUz8137xkK1jXej2pNh
 Di3Q/KiQnXVQF2ZjjZNwi3CXqkAaRJWtqxkJi9mpWjW+3diOUlfX4vY0HyFlEB6wI4v7BwbKDkG
 L1DAhN2Oynqf1ziaAbXSNiVOJz5lm3oCVD1fbgJTQDO/uyN6RtfwDodYy/4MiPBT6PLMkd0XFyE
 RWuOOpCpYQWHl9lxgz3L5jPrNlU36xw+x+PfEUPFgXEIhpnxHpFegv+xV3o3QZpqert3yN2U74J
 EnkbvoFzS5MToAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: M_8FXcSufyKshobIqekq8ctIA_XiBu20
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX1hKixtcrJAmG
 aZiRGKCNjuDUd8JBWZ0H0voxp2jSMz9A59R3hTHT4xsl2sItjRJgLussPl+McLstq9xwY0HhlRj
 GQJJtTU6saynK0P/09eX4x182M7r1ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX7V2IK8YDz/Ay
 tVU1HJcG2sDcNtGR7Pig3mLuUnwvtSrIxlOvD22tnua71nPqYEf1Tefhw6HBk026HNTjVP3zBil
 NYBeXEhrkqrbgYkTKAIrvyEalIYX39JjgVS0lJM0C2zW2CzkqJjxWQydgJQ41DczjGdjXlNzYhq
 QJudNySZwlLv0HdBmTGzx8Zv1TW8oeqGRynPvlFmKtuTnajQ9OvI2dyasyJvL4jALTy6l2Gn7y9
 daDhQOeJR9CDd8lrNmjEwByivgLe0vKvcUUANXx1Miwhi5NZDHMaaSRs9KuxAlOj9ikNr2ltIf3
 s4j1ibbrDmpDI9+YjI22zodDeqE6odR8RAteoqjEh67X+1y7gCgyIqPFIJq3zwrtmBHzxxFSA2D
 52Y+Qzx3TAoRcd+PstOJzKsbs3WHT4ycBV878412/Nn1bPsEbnBNy4CXgCXPowDv+aYpRixp8R5
 0w/GvdA+wglJYUmjQSQ==
X-Proofpoint-GUID: M_8FXcSufyKshobIqekq8ctIA_XiBu20
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a393f7f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vBxaSqD8zgI9wcms4GQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38813-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,meson.build:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 00E9D6B02E9

threads, glib-2.0 and gio-2.0 are required by libgpiosim, gpiosim-glib,
the test harness, and the gpiod-test binary, so the tests_enabled flag
should reflect their availability just like libkmod and mount.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 6df91b7ef17502e5491b85d08d5eb777e3968c4c..fec106c50b8acf4f6cba925b341137ba08c2a9d6 100644
--- a/meson.build
+++ b/meson.build
@@ -93,7 +93,9 @@ if opt_tests.allowed()
   glib_test_dep = dependency('glib-2.0', version: '>= 2.74', required: opt_tests)
   gio_test_dep  = dependency('gio-2.0', version: '>= 2.74', required: opt_tests)
 
-  tests_enabled = libkmod_dep.found() and mount_dep.found()
+  tests_enabled = (libkmod_dep.found() and mount_dep.found() and
+                   threads_dep.found() and glib_test_dep.found() and
+                   gio_test_dep.found())
 else
   tests_enabled = false
 endif

-- 
2.47.3


