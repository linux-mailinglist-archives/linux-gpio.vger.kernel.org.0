Return-Path: <linux-gpio+bounces-37933-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GwSFL/wuIWoaAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37933-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:53:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AC63DC76
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:53:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BMhUqVVs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gaR7Ch03;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37933-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37933-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5DAB30ADFD5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A2E3DB317;
	Thu,  4 Jun 2026 07:48:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917BD3D1CAE
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559330; cv=none; b=n4i3UIKL7Q0dD2OSBs0Z1Y4/Aftme0r4oPFdyv4u8W79HgmE3/+ufL3IPrpBGMCFAZrwj86E1/ooGEXpe5tZ5OmFr+wMiGlzp5qa82WHNeaig2TpKNPkBu+2Nn1XH0fRpLDc0wmVpziKLr940m1vO1hxyeOLKsn4juN12ZjSh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559330; c=relaxed/simple;
	bh=WLpb8YRTy4Vaqm1SJoTRhVTyqbXtUBxOfAXvc5u5G+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=em+QtyTEdMrR2GUTXhj6zkXcE4/QL4biHuldIp5BrnAX0UvvZmlMrHxIyXDOt24MjZZGjF2HEe28VJGKCmtdwQUP78M5wfgRX6ThUK2UFPSi288Chpb/Ewhpj1chwsFX1Ar82Wz9GICDPuiZ0PNmywq8i4cm3O32SNxXq+zdg2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMhUqVVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaR7Ch03; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542umvB2367942
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V88zu69jVPJNPEEHBgYXZffp6cj8ViKBWbqx8JgDq/g=; b=BMhUqVVsXvYrObUj
	nB071ZxtRcZSi5th8r07094tlYR55O+KWrLuRivh4MIl5lHRPa4Qhfb+H+JjOP8y
	9a6H7cjOVnvPmDzbsG3mCqfmDuYfGqQI06TQPUaO8tE+RVgMClyQFIw10E7pgYQH
	UVCHy8vZg1ErmT6Mm1JEaZyJdyMdFWeWtLQjhz7J6LGjraf8eu2d2aTZi1yWBcXU
	qRC3Z2KHKzrTpHgg/Ct6A9ntzkxoZOhkWxPRrz86amiIdqJ284v6NO9ydhi9y8tl
	wLgh7i10TmZzIOBtRDvP4j+2iL/KBxf1KZ6+uX9Hjzc5/kcJheaOPr0jOBI9hY4D
	I6jWqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gmme8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51749fb465fso9235651cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559328; x=1781164128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V88zu69jVPJNPEEHBgYXZffp6cj8ViKBWbqx8JgDq/g=;
        b=gaR7Ch032gb5rZx1ZXMjawxVYBJkVEfzkC8rWFThoofuNLNu6sZbHH5W0hZHp3J0Tl
         6wYpZ/wgeZNf6YUu2ZQe3sNuE+o01LRrRtaiDy7cZKZ94qMlIRg+sip1WGVvnygxJrSv
         VNDv+tjBj4za116JVGC9jio7Jg7cZ0zMeFu7+BeGHC86gMW03wAslQEDwMXjKA9STNx3
         UPd9e56659MfWcc3uITdKKJmusBeGHnDW99irsi6VllO2dKLIbME6RBUVeTug1ulRfON
         wqaxpUQNWqmtmPkD0TIew3TeTS0EKLnjgKLBhIVEU/txhAb4+39L3TKKwAPFdb7IqiuD
         2GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559328; x=1781164128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V88zu69jVPJNPEEHBgYXZffp6cj8ViKBWbqx8JgDq/g=;
        b=RXh8IR36baG9PgW3aulO9NrIc2D/+FcfgiJ4waok9o39r1VA6lQPKuvs54VI27lyi5
         tPt9sBVrh2JIf5ErwojtO4lNzPVfAZkq5DlVKAINyoxR5V1nlu/Jm8irQMg4UgTWQLlM
         0thmvBX6jMbvvPqV1+ZzM0x1daD/a6Wy43+9vMfIoR7IP3+y+XnHL3zHLd+AiL+GwH9N
         IGmdmHxxaehTbXdKZyvIL8yd7jgroymr+RkugVl3BN0E5BuenzKybUc5PCt5cfGY+wsc
         LsvOp2pVSIZbHzW+7nNn3qfzBbms0Tud2KobfRC+YLpHcKPZDkOIiCjFyWdq6YGJBA+/
         vgNA==
X-Forwarded-Encrypted: i=1; AFNElJ9qVBcDcc+AOicLTWH05H/SFWY5a676Gk+CJjbexenmaOtNiux3RxK8rL4raj1PZV92CuLVrWng6dBw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hRRZTXE+lBKetkYEx1Sd1A51O7LKwBB9GbhRArFZ8sb0bLx/
	3Cnv6EVYviGUKbp6yixbuFi0VNrazHLnm5icnQlTb2HmkIVu5Zm4AOZSkXf1IbMqVrMVXAQ5lUm
	RKv/6E1Tb0ERtAlzmNBbwcq01rLIi4DCvojC2KtvK/5nE6ZQd4IV1628vFhHdZKX3
X-Gm-Gg: Acq92OHNuokjzfvxaFRL2aSYTJ/cyJBdZpDYFWy/O9IMOfIXFkfqpcUr9u6Hpna1cSM
	ZSjXAwiN7cwFcC65G6woK//hvK9xPczTPIYMI0IiOUrK0h6sAVxZgui7ODXHBgd6xqVHdtA8pns
	Px+jczJzKq0CAgFoGuFN3s4kF00uwv7zVS9D3rlwUBflbd/gS+VugX8+uDcCXwMvcdiSet6Rm2N
	ph0msgPDU9zafJAy51KLbY0B7d++lvjt/U33f0R2pAPGJvKzxxiAH0nmlM7vHWp1f+nxj9uWOtq
	EjmMDE+H2yeUDmy30kM5Uu7o0ByEd5tJJ35b1BNMpZBRAPNPlg3XEJvrbH6yCQweBZE3ABHn+hJ
	iEvBjqY1JKZpCJnL9x6btBI5UFRkynSEwX08rRyOeU1n3eFmtSiQzgqbzPgANdTmNr0+GvFtM/K
	FPAeTadY8=
X-Received: by 2002:a05:622a:313:b0:517:59a1:82bb with SMTP id d75a77b69052e-5177878f2cdmr99349481cf.50.1780559328045;
        Thu, 04 Jun 2026 00:48:48 -0700 (PDT)
X-Received: by 2002:a05:622a:313:b0:517:59a1:82bb with SMTP id d75a77b69052e-5177878f2cdmr99349161cf.50.1780559327588;
        Thu, 04 Jun 2026 00:48:47 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:58 +0200
Subject: [PATCH libgpiod v2 15/15] dbus: manager: move g_tree_remove() out
 of g_assert() in gpiodbus_id_free()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-15-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WLpb8YRTy4Vaqm1SJoTRhVTyqbXtUBxOfAXvc5u5G+I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS22zrXDNjwmtk1ZTXNwdNjKERf0eZbMkECIc
 /J3BVeDCoOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEttgAKCRAFnS7L/zaE
 w3nMD/9YBhqrGW2XC9oUAnxFQTCxbYYAocmxB1q/a0dmjVP8F/uI7o29VvVzJ2dhCKeZQwvRVEl
 xoes3EepbZBKCGo6HoAjtCBk08DZT9uBwrcdL5gJG7RPX1ufR2sHlZAW/qmb2Tua624uWQrjKLb
 n9i49QLVAnRBONch90LmH8BplvdjP+atKCO8qJHx8IsKt3K4Jcys7cQJKeoMh5E95zXOYzO/+GL
 xdBDyN4gkFHTUkJmari4tvzpOP+M+mqrZAtRfIp00sE6fFqeUIJJvN8R8TjaaGid1gbJ1uo6G91
 PG248GlS+GNF2H7XT8HyWxfOTrha51q9j9hsR/hO1kK+y5ro3vQDqiqtSn35lKXYTfvYcAp95yq
 cEj/eeregmnjYxwWuNrBBA3WJmIBKxdlaiRaBOLOzj2fU4Uc53+V/ajowl46jDQEZnYFDvBvBIO
 IToq0UYMFMvxzDD4Udz65A5WuWAmm3xHMafo4OJ6/Kc9D5TiDkk93PDr/IY6Exa3GBd3BJ5IrL0
 URa5Mx8XdRFKRhoxq5ZMbVBX99yQCkp6BOA1qIIpVvHGHYZmyzUU6sMRUmrmAFyW1VICi5WYgEK
 XuSTH0CXkjtNhoOVAffbGXFFmvCro38pLktVyv7DhSFewnUlbLXR8hMZiw+VeCpnpSwm8HwtbMp
 gGIp5kXXAm/pr1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX38qPtCIMnCcC
 gsPziMiowsq/2tbzXzk8rYJhEd95HwOQAwAb/GbwQIfeQ+wTtP5XOBCiqUqwanGDPIP8sTyMSMZ
 j7BEgJbklc3gs2Y1VGCFDwMaLi3wPGWUdNeTZtdOo1H08kIQbPC8phfFutQk1IqiWDeMwxAB0Uo
 SV4d8DAp1IKRkkI5qhHUC/0PRGM5OXxfSTzQgy2+jp1JVjA1tZ3MzGPsJsVZr5wk6ZxsVUPL41L
 /XqiWACDXgg9ESmTh6ClO4JmOxinNrndaNQXBSJDvjV7ZYvSXMoJ9Ohb3AHEZMKLF9bpb3wLXD7
 D505pVOKwFegN493M+r7PXS/yaxodIcTtbdam/AglniSrTRK4mggmE/FMwJi2GNn+CjEu7cOHsh
 HswONaLkyf+SV85krAA82CHzxH/t/oCVKINyq9xjM6Rzibh4HJkzI1Nk/w8KZpHo4OlGV5aw9oj
 S3M9W5XcbRC2BseR8Qw==
X-Proofpoint-GUID: M_RKRRtpFIz24BOkdkcNwqWVXpu0ySAx
X-Proofpoint-ORIG-GUID: M_RKRRtpFIz24BOkdkcNwqWVXpu0ySAx
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a212de0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QhKqMiVfVvEh_S2WuZEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37933-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C1AC63DC76

g_assert() is compiled out when G_DISABLE_ASSERT is defined, which would
cause the g_tree_remove() call to disappear entirely, leading to ID leaks
and eventual resource exhaustion. Move the side-effecting call outside
the assertion, consistent with the pattern used elsewhere in the daemon.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Assisted-by: Claude Opus 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 dbus/manager/helpers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/dbus/manager/helpers.c b/dbus/manager/helpers.c
index 6e9046006d7594ce62948991772d7117a0f0ed73..ad1a084b8b19ce70e41cd4aa3a83123cfe9a56e9 100644
--- a/dbus/manager/helpers.c
+++ b/dbus/manager/helpers.c
@@ -43,7 +43,10 @@ gint gpiodbus_id_alloc(GTree *id_root)
 
 void gpiodbus_id_free(GTree *id_root, gint id)
 {
-	g_assert(g_tree_remove(id_root, &id));
+	gboolean removed;
+
+	removed = g_tree_remove(id_root, &id);
+	g_assert(removed);
 }
 
 gboolean

-- 
2.47.3


