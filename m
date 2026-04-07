Return-Path: <linux-gpio+bounces-34794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHSJH/z91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E23AEADC
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60554300DDF6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC823B38A5;
	Tue,  7 Apr 2026 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LL8IIl5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOKtAdwd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC573B4E94
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566286; cv=none; b=tiW7ecoMSM6FWy1U8rm6pYDohzx+N8ibhr64Z1fZ1cxjkE9p82UPxAdJFW5CCej2z+KbBkBUpbz6spaor3CogpBazWAi3+DuURgz3EsPJX/5ugxzR2usuJK1iHobXrlnQ6mR+/s/FtFUFMqaC12GIEpF3gsjPmnqx2qWbRXI/r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566286; c=relaxed/simple;
	bh=QcYImDpN5TkDug0dC80MP1pvUi3MNvU9QmDLgfuGPTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHJY99SnXSobCnH49xOnQ4t+FpTM2x+xcWBRQ1uQ69cZvY3x/A5HrKKYTbjiiYPSXXutY1O1ClkxBEm+cEmWJFwbolzk/7Wtx5mmh5qDxARlShnXEm3/ffONsS2BfWk8F91qkjOItYId2KIPGrEeys+fXiZOc1yt9LkkLOrW/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LL8IIl5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOKtAdwd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376bKRP4009056
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qB0sD4z4hqE1kG0Fgs6AZ8RF1Fk0V8uT0WylMzAZrY=; b=LL8IIl5eG67083U/
	BKVSChDImcx2NGUVd/0ZtXPfXw78jY1rMDqvVX7VtOjqLIY6jdvT4GLH/usw4ESQ
	Uev1bt217kuHmcxOfBOUws2FIiQwW0DEPTk446FeoL0tPb0o8HZbaQsJYz17bfEz
	+sHm9zn9MFIL7c2j5opcV8wBXwlqgWPxhAbI6lTVPTeooqEaQDqnc4u2gPYjScMB
	XWuHpDvsFADT+4x8tynA76PlMaZTEQd4ObJ6/3G/HTzoTwae9I6P+fsPOppDrRvn
	MKhuARo03pSLVO5u5C8JTAOD3v49PR/g+SQYTWwYQmufYgpfNf5ApxWHHuqPnw/s
	tuxK2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktqb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d63962d83so118027941cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566282; x=1776171082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qB0sD4z4hqE1kG0Fgs6AZ8RF1Fk0V8uT0WylMzAZrY=;
        b=DOKtAdwdrH9Rne1RCH/EnzX4yzIOKTqCV0TXmTlFrbrSmcA48hsSdqAlIo2PTyOs3b
         rvVOLUKFcr7qn1iS7C3wNMt6ADwhe86oABrImIsKQq142qBBmR/CUZKim6ws0ovRU1jd
         MIvrNaudfts+BGIRWdurfIM8qnyJ8G/x2BcMcCLo0qr88mSnTS6ZKqhBaeXi8VCYUTBb
         iRWs3bTjvQFlW38fvJ7fM6ZSh36t+hHSqIDjWb6KsBHglSitDYwxy9KhCLoglrdw02+q
         Q0lJmLSlRE5OGJU5grxeHYjq8XgcPxOFb8KHKDXboSME/bXrBCY7MzF3xjZFyRnvHSy5
         MjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566282; x=1776171082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qB0sD4z4hqE1kG0Fgs6AZ8RF1Fk0V8uT0WylMzAZrY=;
        b=LTMNw9Xw3UjXdvmVZ6Ux2p0B9zYFPwsQyGoFki/VADodzR5hwn6ZxQ1XPWZWfxGfCr
         Ea3AUpJSdzY4k7OrMpNWM4d4Saldw9b2HB6Oo6TCvHHrOfMkmK373+clcxXk9Bky+K62
         PrVJ26fErHflC3uVIkvATC65sAEeANROgwfqKcksuC7TzspfPyFkOMQmqsrinPS7eepL
         K9fXeRLhgGjQlMrQvuoPTXfPA0q9PySwKjYD8DlrjAHBSbNnJCPJm9JX+PPRtCWxjyww
         PxlukedgYNGmiw/UQ1JU4Yrbo21rZcu8XHHyFCyDg8WgzWHcj1LvB/HyY8GhruWEyDaW
         iYrQ==
X-Gm-Message-State: AOJu0Yw7IYcQwlr6nuft3lerPq6mtpsotF2eg+IG5gPSIzj8SgYPlnfT
	0NDxxvphCyMGJVueaexdG6dzmeF/6thyyY9zkYtvH1shO+GhyC1EuDmqGsQjHxqSI/tWDgMsnLi
	Kj2vscsPMjtwwE0c4ENuqQ/yeqNXWK5k1Q4z500k92S26ArNvD4Objf1VaQeirlMZ
X-Gm-Gg: AeBDietxAUUf887sDWLppsm0AqvcYRIb3Tm6gxWwPD2V80fNfxW7UiseutTrGUKf0ba
	Uu5LK2chIF8dM23yzeX4jobVAvnBBg6chHoWVsZtZc4w7H+uUXLAEFM+dLLAZC1amIUuLylRcow
	Lqc4UQ7U+SmAcaBORsICKJigVTocS7fXuKwglp8K9lD4C/ZGOdZQoPhjvSgm0j42JEJojL62cNu
	MmoM2yU+CpWyFEL+icrFtwKIg72xt8ohWHZAl6UKgE6nqxBPPg3hAuRJwfdM1EE8AUn3L51mAGT
	v8VCHpJXM3fvaAdDXKw2vW1hSeYdYZafA/DeStIlwhmMZZ0PBEpCVGpdHEWv8pd93e4Gc7ljFkQ
	q3f+3BxzkpqivCvkfdScDn06yQSgJhXJHFkLtStiBh3bnQA7Po9A=
X-Received: by 2002:a05:622a:1f14:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50d62cb86f6mr257230701cf.59.1775566282532;
        Tue, 07 Apr 2026 05:51:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f14:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50d62cb86f6mr257230351cf.59.1775566282133;
        Tue, 07 Apr 2026 05:51:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:58 +0200
Subject: [PATCH libgpiod 07/14] tools: reject "u" as period unit specifier
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-7-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QcYImDpN5TkDug0dC80MP1pvUi3MNvU9QmDLgfuGPTc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P25hBZ+hNbuNXAwKrnEj7NF2WW8J5/LLUCuJ
 y8v3wPNaZaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9uQAKCRAFnS7L/zaE
 wyi8D/9ch0CnnPgArtJ7XZEPmP0DROWYpDLluoImJ5CwpD4jC9N+ivU5b6QVNQU4tjfPgx0tUHL
 4j7E+oK35rOH8AlVgvAJSuWyanSTNj6J/Cb6edVE9Evw0UbzYC9UYaQsRHGoNmzl2UBz882m6M7
 Qy61i8kCLMdkGRpvaWr/o2UBVjd8RewrfbJRNTDEVQ43XyElfQS86NGqcJkigX3YDSuTIm0XTWU
 koBRervyA13b4hUmpm7ZYKqv9dzOeDaTCA2/p30ML+dkA/PGn/5BLi+IZAAbOZFvRbiXD51pwub
 sCttStXlrwz4BjEvKT4DFso3nt4qjwuVHUzccA9TMMV2Rh6Pg5OKw13NXLt9KUWbUbX1fn7Mc3E
 KGfjakl4+ZZY0UoK6EZCjb6BIQKMWjN73sop/1HoP0E4ghcN3nkDl6vCqI2B/xJOeeuABNuVRcr
 0KMaPhGSPp6HfMJZzjsLCU5sS6RxGykBTRpoLPhmtzd2eYRrlcDKKWVDsv3YglSIw1MVftoq1AE
 yTOd97FUt/+WruqQR1WSomJpbDNmFHDU/7qGy7DsdVxSTJJcsa3zmOAPZwKQaX/YhRNhbdUpFWw
 XWLQYBNjoOIEd7vFgSXhZTvchkQ2GYN2NPCebDUkRV2JfojA/dfHvlcb/NT4CXOFBhCKXqv+r46
 BAEU9eXRWOkilGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4fdcb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ye0McKwldmagQdJxArAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fRWI84c7DQlZ4ImthmZT1szrbP4tRjii
X-Proofpoint-GUID: fRWI84c7DQlZ4ImthmZT1szrbP4tRjii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX6nTBM/cRbNa5
 UfDqEcceFLsxOQZxL++2bnH9Bc4pdhRFDyH0zGEEpJhcGyvUD+HXBKupBUL+n1iLFzEfJn/rs/z
 Ozf9xxpxPc/rbLCH5/jBGW8q0f9zYaUJILQMjUabguOzD8DG8bKJDPH6Rytrs+MgNOgtOcz6ZLa
 x/PCzu5i65n7eKALy/fIpcZY0DZkMYb6eLxVyQ56QkSVN3U/dURVcHEgBQGpoipGd81o6vTaswK
 YFSjpi5fCpJ/ZTAHc6q2V8Br83AlHTWFxcQTGn45wPgjTB5C9gbVeAECWdsLLKAX4BMyyRuE4SP
 WPO3NUGmpA/X14tNQcab4azjn8D8J90qN3RbvYHVor3o5FDetuvzK4z1RtR3MBHmJbGXF5QsufI
 1QDYVtuqvDYupAPwap2n//oDhgbiFykgfwF+n97HAe1LhDMGQJQMM8v++SfyX24q4i9Z82Lvk5x
 KDt/bLFb+Uo7pD0CvsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34794-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E7E23AEADC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The input "10u" (bare 'u' without trailing 's') is silently parsed as
10 minutes instead of being rejected as an invalid unit. Add stricter
validation and a test-case.

Fixes: 8ffb6489286f ("tools: line name focussed rework")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpio-tools-test.bash | 11 +++++++++++
 tools/tools-common.c       |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 62f68364b2812208df08ea5c22eb1ff55374d9a1..0bc6e7db590921a4afee6cb417ac64da2b77d9e2 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -1151,6 +1151,17 @@ test_gpioset_with_hold_period() {
 	status_is 0
 }
 
+test_gpioset_reject_invalid_period() {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpioset --hold-period=1000u --chip "$sim0" 0=1
+
+	status_is 1
+	output_regex_match "invalid period"
+}
+
 test_gpioset_interactive_exit() {
 	gpiosim_chip sim0 num_lines=8
 
diff --git a/tools/tools-common.c b/tools/tools-common.c
index af8873f06a0a28c77bb7a0d80641631acf3e173b..79950dd7cf968503548c8091bba4135b90ec821f 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -122,6 +122,8 @@ long long parse_period(const char *option)
 
 	switch (*end) {
 	case 'u':
+		if (*(end + 1) != 's')
+			return -1;
 		m = 1;
 		end++;
 		break;

-- 
2.47.3


