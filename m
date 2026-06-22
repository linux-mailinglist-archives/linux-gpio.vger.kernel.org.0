Return-Path: <linux-gpio+bounces-38814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 61KsDZA/OWr4pAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 15:58:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6376B0187
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 15:58:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hrpZjhHG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EF9IULy9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38814-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38814-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F31AB3008C3F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20EF3B52E9;
	Mon, 22 Jun 2026 13:58:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C03B52E4
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136707; cv=none; b=bk/WKL8SeRCvj1rRqaqaqY4xUBEuVfEBIJE7iMifadEOOVuJKpELY0fR+mR6Nn4jDKbk+qxwjigdqhYpjvcJaG7OtltFwSEOBBnixtoI6wl7+e4qdEg3OkCKBRC0uKT8bhEg4AUo4qVUD+ZmYIcn2ihIedlgyOWmis/lFOhN8GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136707; c=relaxed/simple;
	bh=T+vteBRDcaxyJBnOtDhYo8cgVqV3ii8g3ZOn4CReEc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bY2UhgerbjQQFhVBLHQjsHUJsTn+FtYFBDoczO6B2sNeCxJ9ilry2iWezP8f2Wwtd06GALJXS6G4TOSOQTaOR32Ecm6HHqTwBcOpGiays2zFyGSOcigmL5hsBWH4UGgo23XR6JWN/ThjLRr5Oz2YzyZQs9ZcWiZW719JzWBYejM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrpZjhHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF9IULy9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG3MX1062158
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udcfr/VHfcIxbjLNOviahi7Ng3/eGTikw0BpmoTdjNU=; b=hrpZjhHG2V7JchZp
	qSjQlGEGGvUDCMZr3RioX+bOYCH2RRl4zjIeJbXEcqgqFCaFb1XFgCNuPtdi++AF
	WPdur3TPEeR4SNta5JZCVaHkOGCi0XQrLT+/TKEtgQLzJv9XBO1bVY1sGvi4eThQ
	vxdOu7eEx0CF7pTJobxAB5oeP8JGGGQRivZL5a7TKd6JaEfivpoUt/1im7EdrcjI
	C49Iv3ojLbHHBwzfMfpywq5UmbtgC9D+ovY8dOaSJbnmVA07YW/O0dPbJ5k5oULa
	MZH7fua2pJJJuOx3h8/4/MGerD9cg2RCKv7JFObAOzD0BhDl2xsHAWScXr7Lon7y
	2/hwzw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1ssr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6798c46f723so2971838137.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136705; x=1782741505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udcfr/VHfcIxbjLNOviahi7Ng3/eGTikw0BpmoTdjNU=;
        b=EF9IULy9mhsrlWDH/ovN5tWEeCZCuTwXYqDnAhmVF6b4Ong87Dr1VHtdpU3RHm8bmb
         tZxo5RgZgGQvnkKyqmqXiBGGRgu5eXkHNLIaNDnQzkT/1ZR915KQADYx5cQibtKxBhGy
         8nZrIA7W2xQr3RtyS4yiMT1fi+oMXtY4KkWffud+No//C2pD3btfBLEdyAgk66lH7iMQ
         DLPC6GYtwxDqHOuLsxrBE3B4/TxEVw3j7tqL1i02yKRPORBLu/dWkUcA9+UAyphNUfcw
         /6wRUNIQ9JwUzq5XZrCgtw8nlFTjh5h8tx9SrPjGs419bDFYnDO1hbP4AU1sLq67rzgn
         VXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136705; x=1782741505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udcfr/VHfcIxbjLNOviahi7Ng3/eGTikw0BpmoTdjNU=;
        b=pZiC0Y3P6ddPtuBEmopX5nD9dl2Tde9+jJguAdFxQrOGO41wvZ/w1HwfT2UtGB8XKo
         r2iercwcYIO5/HdbWfAXT4izsDmQLMZnglnKK2xx/aTxuhDNz+HsaqD473HDwHJR4iS8
         9VBUPZY6d5q9uqof7jXkllahcGRcvq9Vu8Mzes3uC+fOVkEI4RUaRn7MOsLb4VpmVT+O
         KAm67u8KegitKplfxntSOzbCEq+3dIyZOtJOd1UStgFvm0rRVBWC2DyTq0/ERp57qWTG
         9MiyzQ8PdnW5ir9FJAqYBPc79IDVWxRefAq3ViY4KykmQjOmthsH2OBvp8e0WCQoArwB
         pJYw==
X-Forwarded-Encrypted: i=1; AFNElJ9qckSHsAimz+NwkrSqBpbVxtqDyprIzoCF58tamsgRmjeC+l0KVQW+mnbFyIrWUwHuCt1HsOqoG43Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0syHixKsq2/xPXSiuXNoEKRZ8j1Kpfwv2hB9AWhtG8Yv4EKsf
	WnzheFkWcLeaKyYu7RJJT0EiYlWsqWikTn+F5mgO9Oepbg91qBAF8cCz7F7jylCQM0jNVHsVjkt
	JM3yMd2tJjuaK6lYyxKKx+FL3X2GxgJKyYgMLnp5Sfee0Nv5G8P35gugVPrKB94rM
X-Gm-Gg: AfdE7cmM5LeMhikBib+On8nwv7w2Z99Bwi4t8JJYTdGbkj46sT/PJRwFhf5ZeEPW1iA
	JuCX31CToD/Q6HORFZKpHbrJfWKxImDydk44nR1Z9wCkTQFtDbEJVqRHprzO4GNk1SPGiwgF9Cq
	RKa2Cx329pKIQPeT3rNLqjjqQ91p2eex9/IevQRbiMnuXu6xinXqxTUsTDRtlUBNIW5QkUBCp2m
	lg8j6b/nSKhyXglZiPiC/w5iohY7R+RXm0iVGkgzFkF3LrpsvZ1GAv2KX2QS+MhV8MeHndlNxZ/
	8TWCXQSMPfGkBE9s0yYZpbiHFkX1NaCrCjKy9+x2nyu6pRwPYpuwoHnfj9eMQFe4zHenh1RVsgJ
	VehCcyoSL73x7cDmT16U68TnZ0WRf8lsJj4bYmy5l
X-Received: by 2002:a05:6102:5803:b0:631:4580:6a42 with SMTP id ada2fe7eead31-72a040ba0c4mr7727162137.22.1782136704710;
        Mon, 22 Jun 2026 06:58:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5803:b0:631:4580:6a42 with SMTP id ada2fe7eead31-72a040ba0c4mr7727118137.22.1782136704287;
        Mon, 22 Jun 2026 06:58:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238900sm208247495e9.4.2026.06.22.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:58:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:58:09 +0200
Subject: [PATCH libgpiod 3/4] build: fix incomplete dependency gate for
 glib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-build-catch2-issue-v1-3-be95e28f310b@oss.qualcomm.com>
References: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
In-Reply-To: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T+vteBRDcaxyJBnOtDhYo8cgVqV3ii8g3ZOn4CReEc0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOT93BUMOnBZaaAbHwBsHm1YC5a7eEVtgmycM8
 MHHtXuT/UqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk/dwAKCRAFnS7L/zaE
 w6YED/933TioBjhrN1lhdob4jykf8BVj6gla6CmJpv8auoaZoT6mZeGTbv0NPrNGQCubtEuyMV3
 SiZ4inmGIPw0dI7HKNenYyI4M4N5qcFgXgu+GpOtrUGUJ61W35QADB7VRKpMHsi3Lm+HRzMU83K
 SyfReYL+V5BmA65BmW0wY6Pe2lDbRShu4GH+K61asYiBNKXiyWLYKnITHkCSJv7aLQkt+9Nm+Yv
 yPgmF5SSDTcev3MGZYp0+cg1PpTIqQD6FnsbEh+QXZr19irT6dLKhyOUO6POGs78DI0ginI9tHy
 5IMZACAgaOQqSOeBcgC4Rnzx0tjAYt5hKZ0fKTsZNdGXHpvUY1mvI8r2H15fJPXldg2xtqnIWOx
 wG6al9kpKhjir02S2Af/dOdfCNPMwZq7tZ9pg5phL5Do+6XIwvId99Sn1thonxsj/ZTrH2PY0ZY
 WCY05QCGkmQ/g8NttCzFNOZ96hODD/QJUpqwzbGzFS91ef4R+EeLhxZoJfd53RNKoIhNGdAC+Vv
 sbbic0NkRtnLwdY+GTA93EWXgBbtGNBF1nNj9PtpGPBE+3G31l5VA+82t9JSVYIpXgvHLdpyAL8
 PGUBtJ/i6nA1u1avsMpalwhR8sQjvGd5EogUBdBXPMQwkqGk9m+avP9mquc7OP3vhGF/OJKXeou
 vmSUjQ5LN7fjiow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QL6ZdDwaYXpjFy9--0H9rPrSrFOnbqRs
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a393f81 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Nv-u2RkDnC-KkYc3bYIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX3oj9MmrTJr+O
 mfT6mI76f33wBjZrfi0u5Hb3Kk/I8Y4Q4NLrR9kNijxJhoSY3F6zERE9gyl5abBTsFmr60bMV+J
 XI7XyxliTva9V0kylxphBdDOGImnhhg=
X-Proofpoint-ORIG-GUID: QL6ZdDwaYXpjFy9--0H9rPrSrFOnbqRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfXy2Qns+C0bNac
 Pvft6PHM05JMqxtY+gA97OHUG690ijpez8+iIGLZg6h+pcGGLsbCmS7dvW51kd7DsVMRkPnrZhE
 0TmMMwtJ5yE+mCNyM8xjzljQiVL5qc86xFlDBbQG03+Vr2+EzvXboI9/qRRQ1ii29Pi3cZmyrOq
 KEB3a1NdgQwXoKYAimAcBrYY0lXIlUvbvMjmxP5pDfoteiHJyyffwDHYsMzXM95qOXfm0U+D6H8
 YnXwEXD6iWazHoHuIQbMRPCNx/YrfhVidTGQSHlhfQ+u3RoVPhj6qf5E+pghrqgU5Ttiv0h+C9y
 cvrE6iarL/0QSla+C05wzij+krAaLSkJX5tE0Ojg5loqb1whkKvU9OTJd2PgV0rhSnwHuv688Hj
 bnSc3dcN5b5BfFlmMThOB/vOIn4j0wioMyJXEXjb7JyjqJYYxLhUutRdYbuT3Qai/gn/7RMXOyq
 QtUZxtz0E8p+ZNeTvPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38814-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 0A6376B0187

glib_enabled only checked glib_dep and glib_mkenums, but gobject_dep, gio_dep,
and gio_unix_dep are all required by the glib binding library and examples. Add
them to the gate so a missing dep disables the feature rather than failing at
link time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index fec106c50b8acf4f6cba925b341137ba08c2a9d6..7a6306d8b494a8e576c78f33957159033ccaed46 100644
--- a/meson.build
+++ b/meson.build
@@ -126,7 +126,8 @@ if opt_bindings_glib.allowed()
   gio_unix_dep  = dependency('gio-unix-2.0', version: '>= 2.80', required: opt_bindings_glib)
   glib_mkenums  = find_program('glib-mkenums', required: opt_bindings_glib)
 
-  glib_enabled = glib_dep.found() and glib_mkenums.found()
+  glib_enabled = (glib_dep.found() and gobject_dep.found() and gio_dep.found() and
+                  gio_unix_dep.found() and glib_mkenums.found())
 else
   glib_enabled = false
 endif

-- 
2.47.3


