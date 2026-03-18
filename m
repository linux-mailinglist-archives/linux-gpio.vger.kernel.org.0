Return-Path: <linux-gpio+bounces-33748-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLhpEOulummaaAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33748-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:17:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AED2BC0CA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2616F30D90CE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28A73D6CCC;
	Wed, 18 Mar 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKsYZqTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2ak53K4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363E3D6CB8
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839664; cv=none; b=hyACKgExFvoA1cgGstBxSc40usOcpY6AujqQQ6S0c6n+cJcfn1Rp/DihHBbJCs5hbsSS/K5AeKq27GKxdBTGVjxRgTZE6ZjlexsD6nC5jeKGC2rEUQpFR9iPlmbiJhsG/KcqDNzErOJZ7dyeTeWKlVLcuAeAGpnC0yd7u3TaN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839664; c=relaxed/simple;
	bh=oxvLUtDR5l5xU7A37eR8ToOpfukZ+o3Ph8ytXiGY144=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=He4pXNSuoLTtHrwfdd5FVka7tB3VopUpuI/2Nb5mru3pXu0mkxMCS3TcSv5qEAbJkSgfYGZEasCbgnE2k28cg+GVEShzPYvFFX8ZZN3FnWQ+BvHvU6mke9PE7LE55TaqgVMUiEKEuUFy3GzueSaOzPPXfdhf8mONGMOqDEJjF2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKsYZqTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2ak53K4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBB9oh320093
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FTR7PgjmEgwZ0h6BjbPsa5B2yzmUZqRL7eu
	FCH1Ka70=; b=jKsYZqTNAjc+vgkrcEVDBpSkiWq20Mv7ApdqjJEHonePssJPdC2
	NvBlIoaW8mX3ajXQsDULCrS+lRtaw76UTu/I89Ncpza9sK+NmF/Q/B3EoDtrRW7L
	r1uSPBth+kdyPLgbJUo3WvHU4d+02BA7bVssKE1nfT3FU5KSJQbJTGF5ZV88QSwq
	J4RgVcfqy3pHTuNcqLenESE4tk467bNFOrh2LhqYc7nr9bFZzl0Wrn9/4OzUg1fY
	qEpQmhVm66Xn6xgPag7iwiu9PUZW59WaZ6K4wSRupNvBTtXJ7W4M2rijCWQ+1v0l
	nzAPJelC3zfxMCnTUUqMjJA0tthL2KKuEsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrcdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:14:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so1033541121cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773839661; x=1774444461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTR7PgjmEgwZ0h6BjbPsa5B2yzmUZqRL7euFCH1Ka70=;
        b=E2ak53K4BkSkT7G7kb8xoBG3JFtq5GmAiqx0YJXMtbmK2TiyiA6CiMFPddusNCgcIw
         Ttrf/ytHuE1hrnqg6qYE6NR2DVHhELL0JcFBuMAVfG+N2BnRtqFd17/0ejKxD5YYQlQb
         tan/ePJoVKri8KMDuZ8VoKeQzjcwDy9+F0eRn2rmQ/f9q1bJae3fY7kKcLNVUej4hcxz
         x55nr5UOIQuigB0s3tru4EeCps4RCa/NXTaLsTQDQp7hNpgH/iYooZXiPuLDFnSV3GNr
         w9eaTe9r+Q4BnljsIxb7LRDi4sEjaJJfCLCtU8AY1UF5F71Qmy463G22aAO/fs8VV0N/
         +mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839661; x=1774444461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTR7PgjmEgwZ0h6BjbPsa5B2yzmUZqRL7euFCH1Ka70=;
        b=Rbeq2REIv99uhPTXS64VUoYw+Y2ftcnulnc3BLpY0RF7QePd1jgFFfvjsF+/DsCnUH
         lhGiy500L1oPI61jm8sM3Y6/9CjnwHuob+hORnEvkNnST7ILryuM3oFHq8ss//VwSKVL
         Sl0lnDWamwCE2R/mK/c536Vq/7UNNAqJo00rn85g4UjbNO8tX4+W+KaAa0Th1Crnyn9W
         tUw4JSrtoYcPDbchfEXCVaLEd+BPJVW18q+OK5nOQs2eCl9DKzAX7wnonLlzOS/7JNlo
         jSuAiFcXl8TaqTi9Z7y7Jrs/21+pE2EppGIY5JPdB4xD3apNC6iHxivu5rKNPg5afRJC
         nWTw==
X-Gm-Message-State: AOJu0YwVTkHFEinQoT7Kr5c4h0CU2YwDPEMey+tjzis1/BXUcLeQc0bq
	/L35xxXQtayGgf4hIo7ljQI5W1aXPm1S7TPuy3DQn+WGSmmBUjAJVmiPn/psqexQiYB3alpuXcR
	yYr73eCGwlG0Bd5K7VTTHBXvdQ4BiB7GwRsk0ctH7Icjhv9jTf9FEIU1rh2bW4PP21ip3rtpf
X-Gm-Gg: ATEYQzzaTXsh4h/CigezZE4WsEVvuxVqOU+lYtmX17v/28c8+tXts3teucdcTU5bNLK
	9/Bkdoz6UJQZV43MjctPm/M9dJoCLjvEtfnUiv7HSmFzL4alxmJbAaaSl7pT5At+y4bnv8R3pUF
	7MXcH2s9vP8FXCwMvbON3wrMo0kde8NCScDmosBFdQ4YI+bQSyDtkZLfD8V264Etucr4FZtZJgj
	MUDH60gmw4KiIKkXaRH8wqYjJ8olKyMnWCDQrgYK/Jzqcs0SFEZuEPFMmr55K1buCCRnMnEqVD+
	bE4rnxhpMBVcUIQh+ANxfV2TYPf8oWZyGHjbdEZfsI8pHE83Yl0Z0tnH3ZkrJ9FladvSiGAYSgD
	SC4m4AqeW6xhjV4G/3cMkgfrOuDtp6oqCBCjFljfY+8L88b9dlfc=
X-Received: by 2002:ac8:5a81:0:b0:509:2b02:c1bd with SMTP id d75a77b69052e-50b1474593dmr38534981cf.12.1773839661470;
        Wed, 18 Mar 2026 06:14:21 -0700 (PDT)
X-Received: by 2002:ac8:5a81:0:b0:509:2b02:c1bd with SMTP id d75a77b69052e-50b1474593dmr38534511cf.12.1773839660804;
        Wed, 18 Mar 2026 06:14:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b8ec:50c4:23a0:2505])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e5495csm33610055e9.2.2026.03.18.06.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:14:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [libgpiod][PATCH] tools: tests: remove SIGINT test cases
Date: Wed, 18 Mar 2026 14:14:13 +0100
Message-ID: <20260318131413.56575-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0egGUn_IwzGPpysIeMVM-zw2yvkgY4iI
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69baa52e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=SM8aDGyoM4QLOWKCpHkA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMiBTYWx0ZWRfXxZoIH5gGxIO+
 ozDSo575Ur8Cpp5faQI2XtX5155aLA0MTrwC3A1gWPefr2RIxhCv9WLiUT1ATt/I0qkMTrHkg/F
 oN5bhar2wTsXiVHb8vmJBfYQh0NPkCFu0KU4/qIQcuE12kC9Xz48glwEFvoGBPC13XVKdr614ek
 +r+KIbb5iwEPtsUoGkh6eakOdSdWMIQALD6gLuuTk0JQTxBLOq/4O6JsQlpiX1SwCBsu7RjX2CX
 S9hFvH6uCzfBlVJbeu0U9n1PsvbzrwbPco8qFkS+0FJwM3SjgW5ptmHDTTCwodo/8poCcZxIhuQ
 k2JgHHdtc6ghDGPk0xLZoTBNB8Mk34btQvZLj9e4S/Uww5RQhz7EF4NLWv2YoIcFDRLZOO3kr/l
 WJ4wusHnVk3ru4BxIPOYXF73mgBCvfp+uZJ5jGAEXGb9cRasQPNDRaHLbq1f3fUVIiCKRruvWKH
 SpocP8hVkwXY7eZt7GQ==
X-Proofpoint-ORIG-GUID: 0egGUn_IwzGPpysIeMVM-zw2yvkgY4iI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180112
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33748-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4AED2BC0CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In coreutils v9.10 (specifically with commit 8c2461933411 ("timeout:
honor ignored signal dispositions")) the behavior of timeout changed and
it will no longer propagate SIGINT or SIGQUIT in shell background jobs.
This breaks the test cases checking the behavior of tools after SIGINT.
We have to assume that if exit after SIGTERM works, then so does it
after SIGINT and remove the failing tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpio-tools-test.bash | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 71d6e3d..62f6836 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -1415,17 +1415,6 @@ test_gpioset_with_lines_strictly_by_name() {
 	gpiosim_check_value sim0 6 0
 }
 
-test_gpioset_interactive_after_SIGINT() {
-	gpiosim_chip sim0 num_lines=8 line_name=1:foo
-
-	dut_run gpioset -i foo=1
-
-	dut_kill -SIGINT
-	dut_wait
-
-	status_is 130
-}
-
 test_gpioset_interactive_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
@@ -1907,20 +1896,6 @@ test_gpiomon_multiple_lines_across_multiple_chips() {
 	assert_fail dut_readable
 }
 
-test_gpiomon_exit_after_SIGINT() {
-	gpiosim_chip sim0 num_lines=8
-
-	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
-
-	dut_run gpiomon --banner --chip "$sim0" 4
-	dut_regex_match "Monitoring line .*"
-
-	dut_kill -SIGINT
-	dut_wait
-
-	status_is 130
-}
-
 test_gpiomon_exit_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8
 
@@ -2503,18 +2478,6 @@ test_gpionotify_multiple_lines_across_multiple_chips() {
 	assert_fail dut_readable
 }
 
-test_gpionotify_exit_after_SIGINT() {
-	gpiosim_chip sim0 num_lines=8
-
-	dut_run gpionotify --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4
-	dut_regex_match "Watching line .*"
-
-	dut_kill -SIGINT
-	dut_wait
-
-	status_is 130
-}
-
 test_gpionotify_exit_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8
 
-- 
2.47.3


