Return-Path: <linux-gpio+bounces-34801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNctMgP+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA83AEAEA
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5407330160CA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACF13B52F5;
	Tue,  7 Apr 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmIr8Oh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vuvm6iKM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09893B4EB1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566294; cv=none; b=M8o+q9TQBUcrz8x4ofXp4YsTPPZyoDFtAopKSRKy6Dvtm9wHfuzKI368Ob9UvLtXwKTl03MefCyXtAyh43A8cLChTsACNL3iz7rkGlrHTy5LkW75i+E6kGj7ivSzVMdSO6aaYqm/at8Z99ytxpuCyDOtIPtXnIG6MVH7PVxrdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566294; c=relaxed/simple;
	bh=TWQfrs0e9dEhBtvqktC9bbmzHUHGE+Zx6BUUNN2PVtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9Xs1l17TNu0GTs7alj7YMmtWOuiEVUCFzYJl9bg2P8e74ITc1xYMUfqyxnsNLCMlPH3+wTYGbEMt72rhBBXTTHrBuz9daEcW1OvOZSESPTyX6OS6OC0U/6HUhcQgut20idCIdrsU8oNGkFGWwb3qNBMQNLXaWNEUzgs6TsSk6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmIr8Oh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vuvm6iKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gUf2492494
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIn0Nd0KRxJoNJGoySq75CLbbZd40MAzLAkrYFlwrxM=; b=TmIr8Oh6VsXm4dKj
	YuPlH69gcPmnMzEIgy+O78L75wB2bmZRMq4M6LmC8zgxPbobU46GyacufyBLw/L/
	4GQfMFjTjd8agHMTPTHAOMyQIyVC3Ov/FfYX4ebInZZDF8/d7JlDjARri6NO7Rge
	HyLKViaDtjLuKptxaeu2klbOnwk4rvQgjay7cDZ1UDD4BL731lCJqsEzyiw6sHNN
	9ztEdecMzwfOoinNA8MJDQa9XOcfJNhb4BZbNOLTqQe4NSSl2Sb/7YhklUG5erFS
	E9sVmkly/9FnnG7ADJcN/s0yekI9rlCskIw6Ak1Q2jJAB8j98W4FlXbbcF4GJNAA
	0Rj7Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8tq31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so1122931785a.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566292; x=1776171092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIn0Nd0KRxJoNJGoySq75CLbbZd40MAzLAkrYFlwrxM=;
        b=Vuvm6iKMnxL+3BamdDC0tXMHxxwROoOXzoQ6AH5JK2Fitiv+gbgQjhsMCKhm3DOAZ3
         ZeQMrGp0+pO36Qxc9DtR5pcXgf8LNsjMWkBZ6OZG5Hi62+eIOouw03Z9gjii0Mybd/yz
         /zeAbKKjBZ1DsohMx6qld86hxph2/e1SEkwKtq2ccAaij2pxuAHAww4CIq7Y96qrUjHt
         9TzeXIRjgznEWyZPAepLFB5E+HHgXq0nYvkgKNilUH6M0CIKqcQAdWz+YJbJUCZR3XTD
         Ih032GRDmfpPqPZbjGQcjppwpOOrDhzirNKl+WkjJUqavocqooKvLCviAEK+d2XJfcSR
         3mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566292; x=1776171092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WIn0Nd0KRxJoNJGoySq75CLbbZd40MAzLAkrYFlwrxM=;
        b=bDpPMwh8ujX5cFIVVO5HIUD3snHEcjCnwrb0D0hzbDZ5Syxscevr5zIuDSX9gPBt/1
         EgI3YZ1Mtu6HIn66atDOeCqrvfEb6cNkLvW/D9yfaDOHTDUynA1tzKa/N8m/jxQhE92/
         ska8vkbj7Nn947CjknccT4jp+UlvLgD6hrDyb6D7O0a8REKPa0LV1OMTP/O3v6x7ZmCi
         GYmjFUZvidSB3qFs9q8pjfpKIJ5JG4QQmkMmNd2MMyVYf5miaNVpLxqq0eSU2aMCYzBR
         D/hr4nlki+Pwd8kdkdCW+PqZq+ecW6NYmGyio2TiqMaV0mk1wlnBgB5OZycGkZmyeEYi
         tviQ==
X-Gm-Message-State: AOJu0YzFrWHd9cEXU9q+oJ/t1GTTtN44NK5pgkHCbfbHnIPlTjCoxd5G
	hjy8mtcYhNwQ2eGPeuviq4hWXcV6PMnAe5k+eNRg8oMJxPAcsb/V94gh++a6ygpkHkPuTzKb4Hb
	kSmV/wbgHjveyTdvRl8ptEDduzokBi4oVu8myQqVrnXrrKYfuNZ2SMHX474PWf5zM
X-Gm-Gg: AeBDiev8GwHMmjTqyGyenscrbZHmEqK04tggLsrkN2qw23A1WTNM00yreQKARXe+Ngr
	OGHXbXUKeOZsPj+rznObLLJArVdiJezU4jA8DpksZwqIaF4JUx1+iq0eMBbmpFac/t6f3idwCqq
	khAL6iha14hPdlflmleg5Xpi/U/+/M/vYxhG+PjNrQNYPmjGbQr0tbQJibIpHidoNYPHFH/Om6j
	nWo4Wjxxvpu4v941nRbm5fNYOYeclvxseUvE3m2mLIVBAA2eSLvUxiaahAZ0jGTm7bmw6a+TcF6
	ZE2cr6oWfPlRa1sPZROgIcI8ccPzKN9v/d6Le3+anm/bI3Tjl/a23DW31Lz+3/gBtpTPVWclfto
	8NtQfx8hm/5zjvCROK7U+JQaH9FNLOeNPTKmnwPKXn69sdSiksWE=
X-Received: by 2002:a05:622a:e:b0:50b:4d01:fafe with SMTP id d75a77b69052e-50d767c83d3mr183177841cf.1.1775566291992;
        Tue, 07 Apr 2026 05:51:31 -0700 (PDT)
X-Received: by 2002:a05:622a:e:b0:50b:4d01:fafe with SMTP id d75a77b69052e-50d767c83d3mr183177501cf.1.1775566291585;
        Tue, 07 Apr 2026 05:51:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:50:05 +0200
Subject: [PATCH libgpiod 14/14] dbus: manager: use the correct loop counter
 in error path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-14-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TWQfrs0e9dEhBtvqktC9bbmzHUHGE+Zx6BUUNN2PVtc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P2/Un5tlDashDmxlUEGkJ+dXVNCxZGvVxkGW
 0RnhvQ+cDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9vwAKCRAFnS7L/zaE
 w1tJEACYYI4vklwE3Qxi6qstF8dTmZe74GicAB2+lJvDj0pWvm7VmY3u8itmYaCXhph5WNIOL8j
 E+X9Dz9GVFh0nFXdkxj60eNcRaAvTNIzAK2Xeb3WPkpdr5haGaAiJcHzxkq2hko5bsa6pdF7HpA
 DlDGCbbmP7UxCZ9BTCTkvrPmBjFMNg1BhMvSUyFkF9ftHGiDNUPjwipW4TpPPs+qiDCTd5aAAjy
 4UnE4LbB9UHQ9AKlsmc2Tyb6Hdxo2dah59YqA8vwXSwDMxNb2OT/RjcdxWNbtfDzaAyYV6IS3Re
 yW7nCd6aNOTungNnLt5aSwpeAYJThHtIrmQqSq+hbSohgEBOvTIaIPwDEkJb7CRv09RjAuD9cpQ
 0woFzXincg4BtJMLTDMVMyi9BisLWrJFQeazJuapc8jK/MQizF0ZZNnJ/uFVxG23F/y9D9bAo4A
 xc94rtUML6WQxaewZ1oKR8tCfMD3eewHhCFVYg9fYvR19D8XGlhcy3fEnJ3Rkc5VPa7/E5rg7HH
 hhyFc18wX3gBBSQ6aohFdRSVf80pEvFTJJKCARsyoBPfCZS9L2Cmoy4DhV8xsghNGBMBI81YZIZ
 4KguCxJSbxAFf9ocKn5KSMgU9vokzCzugKO7E+p02GpcJ+AX64yvgpFOzJGwSF6aWO1F3gt9yLh
 zOIocm9iwIKj+EA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Dbi0Ip6oqO8_saurDuo_AeEPnNupUex0
X-Proofpoint-ORIG-GUID: Dbi0Ip6oqO8_saurDuo_AeEPnNupUex0
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4fdd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=c9hAuP_oBUhSImE421AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfXzR3Q+aEQ+yOd
 9z+GHfX8hBYPtbbb5JdIgqV48E1ayNCZtVMtzIai6J1HucVb4AkeSHyNgJXx8XnwOBXAbqf2sFK
 TlQdIFKhDxzdpUQHAO47DpPD94eIdv5tYCxmsJuX6+7/yrYW9PtSwybtX8NYB2Q9qcMUMzmFiel
 2VZMoWGubILqWRK1Za6yHL3tBNdanT3goyUtp3KxmuCTuiApuFHCSoeDcbNmouJDjQt3ImYccCR
 1scJfgWpipr3v6kzTJqP4rK05w6YE9ZHcCf5GEIHHpJfy/gVBq3zwO/6CD/0KH6yNvNErEo5gqt
 Ez1YhcRg9jyNlfPkKY9cTizRIWV070iCkrooeSw1IcW5Vsuu9xOzRVB/sbx+Ms8TtMXIYlA4sIf
 FLvMCGyNlLcoVMkTLqjTbC3hM8pqWXDb2eCbS/kfpfT2rWtnz/EKlmSDkryG749R23hTk7eyXlS
 vBQ7Xu7cDzQL/3j33Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34801-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55DA83AEAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In gpiodbus_daemon_export_lines(), the daemon iterates over all GPIO
lines on a chip and establishes kernel watch file descriptors for
line-info events. On failure, it attempts to clean up previously
established watches but it uses i instead of j to refer to the line it
wants to unwatch. Use the correct counter variable for the inner loop.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 dbus/manager/daemon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
index b9c295a55751d7d37d8a93033e9e1ad7ec8ac5af..a702682e568d345c597e3a1a2462c85197307f78 100644
--- a/dbus/manager/daemon.c
+++ b/dbus/manager/daemon.c
@@ -308,7 +308,7 @@ static gboolean gpiodbus_daemon_export_lines(GpiodbusDaemon *self,
 			g_critical("failed to setup a line-info watch: %s",
 				   err->message);
 			for (j = i; j >= 0; j--)
-				gpiodglib_chip_unwatch_line_info(chip, i, NULL);
+				gpiodglib_chip_unwatch_line_info(chip, j, NULL);
 			return FALSE;
 		}
 

-- 
2.47.3


