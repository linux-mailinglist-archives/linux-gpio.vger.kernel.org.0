Return-Path: <linux-gpio+bounces-37337-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLfbKBArEGo1UgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37337-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:08:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731A5B1B41
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB09730B2FBF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CC73C98AE;
	Fri, 22 May 2026 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gog9LOn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="So43AjY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9B23C73C1
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444105; cv=none; b=fPbN8OBq1P5fNkHUqMQbtnsi/uvY32v3LYIzMKDLYFY9NMovg2wHFJT7c726mbTCUmlr1n1j7XdOk6rvzO8AjZvzzRBfkdTr7fE9AwweBFe3J0kazUsrgqJYz5LtItyoTF7LgdGyQ2l2L69NjzcjO+fnrZrHQrYi/zZhP6ZApp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444105; c=relaxed/simple;
	bh=d7ukzh/NudkL4BoJYw9Va9CTE4y34ukq0FYnDAyZZ2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U69I3Y/QeV+JaJgyiERlWoUkSdD/UlD5J/te1vaYuMkIXGqzj/2FeKVysBlRsA4Phw2kiljJD+oQ7qsVTbmcN3j12JiSUhxLJV8NJD2yLS0T6897OlbMs8RvV13LyYn68dn2ig+UoJyOS7oIRRYZmxfb2OEEIgTlBOxRIuqHG5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gog9LOn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=So43AjY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9RiPc2765202
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 10:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MWIZKzT0Q7TXmE+59bTGDJ
	AP8K4h/tgdFeXa8OxfQ+k=; b=gog9LOn8sdkOLHBxN+YZ8vn9YLTMGcihUsd6TA
	TtMtVYTWuXA4FdtYZnzVAbh8MJpCNGiht+F5qP4mRhxulr0sqyBGzAV+yBo7alvh
	EMISmnX5G3n3DzAAVGNQqayB+sK4vRtnGPh9/+4nxZ4VknjRNWEVm5zR/d+KH++e
	uzb6m6YIwD/kmtJnGNHcrbWSROs7oVcZyTTyceHo+jWoDXy2SBLDFCaVxaUL6/sZ
	p7l98y40bV0Y3MiLXtpdRoxEhI+p4cz7MLh5iLaCX5KXRq9a+cuDNLGC88JnDcfm
	Ek2GIzhoyFKgriu1wwLEyUR2vMaOmpW0GNMHydoXQvaQHMIw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7veh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 10:01:42 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcde7bf859so19309964a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444102; x=1780048902; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWIZKzT0Q7TXmE+59bTGDJAP8K4h/tgdFeXa8OxfQ+k=;
        b=So43AjY2bZfS0CD20AXM5UoefsdKkX+nIqFBCykY48Mr8Hb0YzSg6bSgSBa7VZBUqN
         igKP7miN7IjWq3k5grkZGIRCrvo1dKL+TkR4QiUwyuLHjOoXh6kXaHwOdregxAcuJSk6
         CNSxw2f56qf7ev6SdeFU57EaRvbn2po939owea2n6H5LZgwk5zOgE4tiYWIOt3wSuFZX
         zlecvdEUZ+Km4bQRohoZL7Hu2X2btBd0oJu4GRQX2jFcNdMH7UmaLO5ENwYsmi84xWe6
         +NcMDuGX8Ns3fZv2KUZXilA4JlrsT8WpFQcSjRaC5MdCLTNtY6q2JIVaYtSc1azZRsj8
         G/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444102; x=1780048902;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWIZKzT0Q7TXmE+59bTGDJAP8K4h/tgdFeXa8OxfQ+k=;
        b=IBP+5wGJWAW5MGG/xJKlt9SzIwcEm1TDAKTy2lvQv/OhB687bqTEJRYh5ne+qCMckr
         CIv85zWBz4+0CdZT25Fn49sympOgyF/JcFafXmMn+U7IUtd8Sli8zEIbDueVmMd9rCC6
         ca2xYxiaH8IxAq2zThTY2T26QKtlIGYs+MMiDMQvcMlSQL2g++vsgorosaIceUtMi2Fo
         bEEfNiLVrNpaGaoMycrTvUpQINWUEpr8EaraaIyONlEVHefUs772NQryAUjqISa2R4mQ
         RXfpYhSywbQcM01tmzji4QchkwPoSsIEXWBPfHXxUbyUdFt0jEe58V/Y59800Sd8BdcQ
         dd3A==
X-Forwarded-Encrypted: i=1; AFNElJ8CtpLahMZH5VZdlCdFQBVuk8Ttn3QZYDRnWHqjLDkctiYiWj3i6EwmV3eLCwg2HR93y0Tj4jxRPhTh@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfEiZ7FJCZ1SOXfHLnk+3e579ioxb9sqn5AQobdQPdfiR90MY
	r+vQD9hsH4PRlfExD4X90zYqfyq8Ci7eQISvVUbeiGiusZjmjViC2fORMluQyhpQbDhGezWk0b/
	vv4I7nNFivSunyJdTFVfJhN+pIU8EDODl+lJ9v+D9HM3VDd7IYn101ENKhH5P8ZiE
X-Gm-Gg: Acq92OH0FgtwDIYkOsq52zHuImkr22ib+2qsBknZz55giFllU4tQheU+HGCXrG1d1tl
	zcKT+uwV36fGiA0QbkuGRGIWdaZNEW6ED5ruhC2SQwTvlsaI8+i2hOgD9v+ZTTjWYf+GO4NhKEm
	7Hbyzqd0Fkir6wOD+hbSjKWq/UWFzecTP/PJk16xKLp5QMtxJlKakCqamRXkavGjWUNgqPMk+Nz
	oDWxsgDwLZEhRXrDy4+J8WaW0cCLYjQVTPItQAjIXplagMs+UL1yA3XjN7v2EwkgY6jHA9tkPjO
	ZyBx/1UGgpcq3U3/w51uXflXVFzP7KNg4fxF8UgBILPFnJeuBpN1XkV7PsuJUtZuZPxVgDgF/oj
	EMG3cgVx4T+/fPBWbTTTpodv10W7Q8otHPDlZbUrZQwNrFq2X3A==
X-Received: by 2002:a05:6820:1527:b0:67e:16b4:aa13 with SMTP id 006d021491bc7-69d7ed3ddb2mr1581313eaf.58.1779444101232;
        Fri, 22 May 2026 03:01:41 -0700 (PDT)
X-Received: by 2002:a05:6820:1527:b0:67e:16b4:aa13 with SMTP id 006d021491bc7-69d7ed3ddb2mr1581294eaf.58.1779444100753;
        Fri, 22 May 2026 03:01:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c5eb0sm35152265e9.2.2026.05.22.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:01:28 +0200
Subject: [PATCH libgpiod] core: allow modifying settings for existing
 offsets in a full line-config
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-line-config-full-config-bug-v1-1-b138958bf05d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHcpEGoC/zXMywqDMBBG4VeRWXcgGTELX6V04WUSfwiJJCgF8
 d0Nhe7OtzkXVS3QSmN3UdETFTk12FdHyzaloIy1mcSIM4MIRyTlJSePwP6I8d/zEdh5tdYNxvY
 i1A57UY/v7/6miDnsyCt97vsB5+5+hncAAAA=
X-Change-ID: 20260522-line-config-full-config-bug-6fe116501322
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4250;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d7ukzh/NudkL4BoJYw9Va9CTE4y34ukq0FYnDAyZZ2M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqECl+tnulGACW013OQgqYLSqQtpUt77AsHAR+y
 0clR2n5DDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahApfgAKCRAFnS7L/zaE
 ww/HD/wJyRUkcGxaqoCuzrTZK1oGcJ2ICKlecQNUMVFYorjNjwjss/QCLouOpTAMEZfyRole/fe
 mF5pkewiH6RAMR9eGh2QC1hSzvCLkMBT/ZKiw4Y5hu3ytic5MX2FAs6254XJekHvdDQllCo+P9x
 VGYB0gqe4uZefhuEvjfQ2Lg6Bp42ZUWYZYhpS2G1V/wE6LNo341dkQkLnTXkp62yf5IHYgoEmzM
 qXJb/Jl/YTGu8MfN7FifTlVlqPiPy8RoLbE5TCAuVvFpaN7rmkt1LLyVtofmCHyTdy+wAW5QbT1
 szcJAkTVl1jSpKJqFe82nwN0NfsaKQ4rWGZs2aeCjho7vUeSy/At6NTV/VE1lkD7DOu5xmrIlIW
 s047OYVy/iDVZjms3jtWYI8+WOXCarIb18GXXy+P0Tjhg3t4wSV4S/pZf2uD2Idj4al6YGRK+PQ
 PGuHu60BZ2VWCk27Eh+wLESDphnW6A4VPAvwRN5QWSXBSeeEgZK8frXEtfGrcqtcCxtvoz865ZY
 sCGaVnGJGBmfJiuKkyR+OP3v+x5+Ys5BcSTLHMcsJceyFmcdygidlhti/QhhlEmZ3GuBUFJ6Ixy
 J+pXW+lpraXJmgHTp4iZuy2wdmX+SpEVx+Q864D5OAVoMWZMHxGXqdkvQ1+qGRMXFbFqT5VntwK
 G5eeeE5XvnqmUbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a102986 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vLc0x-vm8qkEegjXDqwA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: Q_NxZriUUBaU1TXs-LmBPuMe0VxF0zkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX8oXVXaqCDjCJ
 hQHz5vIIanzlPkeCGj98ixBvllEwFmgTrwBhFvCN+xMwJ4e8ewAEGMZRaLLigKmSjbxDccvFYIp
 9ye6YpNzwHUcIgZkoghrCvPvPK8BgwBV8xr8Pwaj2MMhoPdJUU8yU0cLwy2W65lkKnry6awfPdu
 jf90xwEqXE3WOx8iVarIuzQ3BcWN7iUxxjCG7rt82v8Bx0L/RA70Uupl5EDIKhsx/+mXsvPEWr0
 ehmXK9f729kIBCdnrG8PkfX1whwTkSjSUanln022xASatxxK9lctDU7xg8zbErMq6QsuJlU43ty
 trVebsY/8pmUgErIi0u+xxp6Q4nXGw+AqhzK894xibT1uidM53UxqIGwMxiX8ewT0PDMtsIjXY9
 7cICXFiCFhG3Asn928CJTB5cic//NCFmSnmdSep6zf2QbRmR3a74lSHDL7kJv3rxamBo8lAf2Jt
 q/HLIXNMECc+g3zh/Vg==
X-Proofpoint-ORIG-GUID: Q_NxZriUUBaU1TXs-LmBPuMe0VxF0zkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37337-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,xes-inc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2731A5B1B41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gpiod_line_config_add_line_settings() checks the remaining capacity
using the raw num_offsets from the caller. If the config is already at
the 64-line limit, any call - even one that would only update settings
for already configured offsets - would fail with E2BIG making it
impossible to reconfigure a line once the config is full.

Extend gpiod_line_config_add_line_settings() to only count offsets that
would require a new config slot and use this number to check if the
line-config object still has capacity.

Add a test case allowing to verify the fix.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I was running some tests ahead of releasing v2.3 and found this bug.
---
 lib/line-config.c         | 43 +++++++++++++++++++++++++++++++++++++++++--
 tests/tests-line-config.c | 25 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index 24357f3ded4b83d4e3cd5382d9ba6a89afa8b30c..c9e5cb0d9d2f27e441856ffa1b09a0e57a0db2ba 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -90,13 +90,50 @@ static struct per_line_config *find_config(struct gpiod_line_config *config,
 	return &config->line_configs[config->num_configs++];
 }
 
+/*
+ * Count offsets in the input array that would require a new slot in the
+ * config: those not already present in config->line_configs and not repeated
+ * earlier in the same offsets array.
+ */
+static size_t count_new_offsets(const struct gpiod_line_config *config,
+				const unsigned int *offsets, size_t num_offsets)
+{
+	size_t i, j, num_new = 0;
+	bool existing;
+
+	for (i = 0; i < num_offsets; i++) {
+		existing = false;
+
+		for (j = 0; j < config->num_configs; j++) {
+			if (config->line_configs[j].offset == offsets[i]) {
+				existing = true;
+				break;
+			}
+		}
+
+		if (!existing) {
+			for (j = 0; j < i; j++) {
+				if (offsets[j] == offsets[i]) {
+					existing = true;
+					break;
+				}
+			}
+		}
+
+		if (!existing)
+			num_new++;
+	}
+
+	return num_new;
+}
+
 GPIOD_API int gpiod_line_config_add_line_settings(
 	struct gpiod_line_config *config, const unsigned int *offsets,
 	size_t num_offsets, struct gpiod_line_settings *settings)
 {
 	struct per_line_config *per_line;
 	struct settings_node *node, *old;
-	size_t i;
+	size_t i, new_offsets;
 
 	assert(config);
 
@@ -105,7 +142,9 @@ GPIOD_API int gpiod_line_config_add_line_settings(
 		return -1;
 	}
 
-	if ((config->num_configs + num_offsets) > LINES_MAX) {
+	new_offsets = count_new_offsets(config, offsets, num_offsets);
+
+	if ((config->num_configs + new_offsets) > LINES_MAX) {
 		errno = E2BIG;
 		return -1;
 	}
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index b510e0f074711fadf647fd8030476eb20275d1d3..a1e2e7ef559a15ff5f7285f8b0f233391978fbd5 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -512,3 +512,28 @@ GPIOD_TEST_CASE(dont_allow_line_config_to_balloon_out_of_control)
 	g_test_trap_subprocess(NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
 	g_test_trap_assert_passed();
 }
+
+GPIOD_TEST_CASE(update_existing_offset_in_full_config)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	guint offsets[64], i;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+	config = gpiod_test_create_line_config_or_fail();
+
+	for (i = 0; i < 64; i++)
+		offsets[i] = i;
+
+	/* Fill the config to capacity with all 64 offsets. */
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 64,
+							 settings);
+
+	g_assert_cmpuint(gpiod_line_config_get_num_configured_offsets(config),
+			 ==, 64);
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	ret = gpiod_line_config_add_line_settings(config, offsets, 1, settings);
+	g_assert_cmpint(ret, ==, 0);
+}

---
base-commit: 0fe66719dddf1a206cb14baba136a36a32fd2f54
change-id: 20260522-line-config-full-config-bug-6fe116501322

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


