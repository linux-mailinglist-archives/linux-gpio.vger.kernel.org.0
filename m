Return-Path: <linux-gpio+bounces-38812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ay+uNMpBOWqypQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:08:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8B6B02DF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:08:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cHizuXYQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=goHWyS4Z;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38812-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38812-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3ADB30ADBD5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20993B52E9;
	Mon, 22 Jun 2026 13:58:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D483B47E0
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136704; cv=none; b=HKy4Q3DomTx2GO14lhwaCFIzqPu1VoCr+ub/u6y/VZEpVNBRHgpT88epO+d4v8IqhPy2nty7ae2mqcAAUtBaYtGDzxa1nD5q7ouHdZ3cm6HqiESSrWpSHohuf67UOj8dde4ARTe2OfBFRieYTsRgkiO1TFKZO2RqmMn0rrVkE2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136704; c=relaxed/simple;
	bh=1DU1PDvo/zU9hcikwE/99fdF+eZs/+X8gpiroGJW6YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvysUdRptHMqwN82E1tQjdT+fEvsnMgDneiLNUjN/LPaL4vQblSdNsTbTzMl6Xh2O6j/yS6lkEXpq5FYWqe8e2DilUCM/r8hzWkrnGxWTZgnY86h3eZIUmO+kfjj4WmS8dhj/Dy95ubBLEScz4xAlTQbMbq3+ocNYAuvVuELVPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHizuXYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=goHWyS4Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGIMH1261213
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmkmRsn7rZX3u6eLqnsZbKxvDZ71M5bSt/GU9ugU6jk=; b=cHizuXYQL4Jf/neX
	AQLn0+VlcR476mRf2c9n6OvkwOZjqbSSg/1DNR0z7/10V7oIIcisBiJwIXLYLdhM
	LDZ6DlN7l4hdeD4V5I82ZhVa8IFwF0+K2PYYCOI2T4xdNgbrTbFGKaYFiKwvDO/X
	MKmtScrf6eK9tCebxr9GqJCGJZq3u/SA93M3OzyIsKl5Avbz1Jp9XfPcgYmHGQkM
	DEf2pKPWgLJ2X/GGsQvvx2XYBh4D36AcoZlZlqSsaUopTM2KN5PD6c+4b+lP3JO9
	tctW2hnGvwy+kIMk5MNnIrx+moQzjK4a+Owget52rLvryTTHMP16bDr/9LwfbJ/M
	BZYHnQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8nmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 13:58:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6798c46f723so2971588137.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136701; x=1782741501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmkmRsn7rZX3u6eLqnsZbKxvDZ71M5bSt/GU9ugU6jk=;
        b=goHWyS4ZeJ6aT1naNMUIWv1PQ/72D2CdpAF9MrNgbuLUAuzUVDOGvtXyE+9NY/wXFf
         EJZfVtqr60c92PokgYo6TYG7a2otRCoRuDs7B1LEcm/GjGEaAAZ7B0tWaXAZK+fI0yIt
         sbGKpEc6AN56EeOe1OB7Sj39rqOq91rW/YikoahhTwdrcsMtNZkqtCwFEnP8OZ1mkg38
         655ciklvVBnOqyupGt3E9e/1OZNPTQvfW0fz2NKa/VHrqBQW5Sl87nD2Zqf25nml448f
         D+pYCJvfTP6DoTzxd1u5FjeDWTYgWRZTt36t/nVNVCyXKVrhQWvc4HJ1a5tVRXNpy93a
         nmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136701; x=1782741501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fmkmRsn7rZX3u6eLqnsZbKxvDZ71M5bSt/GU9ugU6jk=;
        b=Ycw911IrPOCntboNP+LJefkrMCva0xyMacplfwxeB5TR9k1hdCrIxmx3rEDlKzsBBf
         U3DdRA7Jj0S48T3RYi3y1UpRnjxAgOi/dosM92hGks8P8xajRFB722jZmNkgXjrJUBlx
         Qq1efdxFs6Ke4owMjl67bvmcd+Jr6Rb5heewChXAK/34Sg04UBzYpeVEQj9AKdI97ew/
         9vD2xS94dkByH+PAUYN4dzC/bsius0oJypaomaRlaDfX8ayB7HBz7BjtZSwT2PENm7HP
         vIV9t+Q3ng5Qnm/pWhugbH0VnVrAXFY4cqeG5pBeZxQ7VIrEwO0aR5ZRT+1D/e4wswpE
         SD5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+zW03nKtKay9zz3wtSt5psYG+HmpspR8Q1KpG5gdOA3D4NnzLPNxkuDr/Ir8ZlxQwx1wEpCqkBQg78@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjvc+hzmx8tT0vFaPpvRReoZXfw3XdGvhjkuJ1UiN7gxtMFfhO
	QnC2tjg/uIZ1Gjra1Q2xhjQW8YILe5AHBukHEU2Dr+zEmy6cDjh1VStOeVy9UTK3YmIGSS9YpzP
	nG1GxlFihRsXPD7U4Lc5Q2G42myvln0up4fLLKQGnPWWOXmTvR8YVSyqI/t+UmLLc
X-Gm-Gg: AfdE7ckCPAvf0d3B9qdWHRKmznqIvwg/SBeYXrMPxs+NMib9x4eSl52aLozuhiN4aoG
	GCQgazwRbMiiqTTxJ7qWh1uChCwHUpcf67NPP2fJNdRATETRLROv6TvZMUEq+Lj7bJnbeaNu+2C
	zXhVog9Jtmtn6SFfWMq1MtwmfG3cfOJ8ZzE0yBz3NhjQ/OHEM7ClFuzMZ/VoK/WexvRXyqidZU5
	yTMS1MjBVCZgX0HXF6zbGB6AiwEWRo7O2IsvjYWbQ/jkBCklcy7MkSvI1QUz/BI93GZRrc/3fjw
	/fuLcON7IQ4oZ9mDe5rO2m5j8Rc5VZcHJfHcR5nteL7jkA3CsW4qfk7KYmGw/z/a9QS5aMhb4e3
	GWoABGwKg16P6FFnz5xwdZezaV8qY7Wt0PNHVKw01
X-Received: by 2002:a05:6102:8095:b0:632:73ad:6c4 with SMTP id ada2fe7eead31-72a01dbf899mr7728913137.8.1782136701440;
        Mon, 22 Jun 2026 06:58:21 -0700 (PDT)
X-Received: by 2002:a05:6102:8095:b0:632:73ad:6c4 with SMTP id ada2fe7eead31-72a01dbf899mr7728869137.8.1782136700891;
        Mon, 22 Jun 2026 06:58:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238900sm208247495e9.4.2026.06.22.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:58:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:58:07 +0200
Subject: [PATCH libgpiod 1/4] build: don't make catch2 mandatory when C++
 bindings and tests are enabled
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-build-catch2-issue-v1-1-be95e28f310b@oss.qualcomm.com>
References: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
In-Reply-To: <20260622-build-catch2-issue-v1-0-be95e28f310b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DU1PDvo/zU9hcikwE/99fdF+eZs/+X8gpiroGJW6YU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOT91YhD8wcNXK8raPrb0tp8HbawbSLb8wlDKv
 /J1g9JYzfKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk/dQAKCRAFnS7L/zaE
 w1A5D/96qWZFzOJnFcRk0Nq0v4BnXFncAse49v39I1Q9Gd3oq3bD7XTINS66lKfliD8q1y4kwIO
 3zNhXFnNNlVWNSgv1/5fNkE3nz50XqkoSjDPYHovq5ScSWnAhBwJaxMklXKrRdILzOKC4f43ojy
 jmoh+fvbXlRwH2gzHsRm+8w1GUMpJpNxPi9we7CYNMvzV+A5g7PJWt3MrDpjKdMGbtx5VdY2FPf
 fA2m/hKSAkhqC5cpR07ewjOvdaENQalh2wjxwRfSIXwJIRonrYBbZUpkfqDOknyDYvwSahQkqHZ
 2AqEjDqZ55aFERhTw0RE8fnC5Sv3PgTiLMHeey1k/Hp3OopNc4MSPoqAPZvNFPe8rQgYb2ITYjQ
 u40xDp31TwnHoZD50LLFO3Z5kz60fWeFq6PrL/3J3J7wgc1yeMMZyfMnDipvXmQifJkPFdhe9AR
 iobPXGEc/JBAx+nQ+NjlGP3YZzvroArS8gnMaKFMzUkEjj+sTHiepX65PvLfRNO5U/EYYrnuzll
 vJiOF9PzFtojifNUmjJUJTl3YhXWuncezSsfRjEgfcqwZq2BkOmEIYXuaVaqeHtTpLHHvw/vFsd
 emsQ4Gxcliz9ZOI44TmkHq9IyoZe+/rF/O8PkCqhLX7N9z34AuJyagX8jm7WkU/Zjw+ejFBxnGL
 vWoaE2b757bDD5A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOCBTYWx0ZWRfX15qNm5llSUst
 b1zCSnLhoErL4/4XvgB2ZViYPB0St6mFiB8TFVDQwpzYBlJJcLKvGoI/boYycMTaKzPha92N66Q
 5Rgo5fmtnuFNmeJVQpMZ0mSsabfUi+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOCBTYWx0ZWRfX/A4PpN+kJZ2u
 RD2LxPJQuTMv/ync2duhSHqTlVWIF2/buz5i8shCA7OfKRyFktjESfq9BsAu50uvfiL78bsI+q+
 inBuGF0tDJmFzAUlnwmhKRjsD1n+nNu+xNGFvbm5cnVWRd3lsKQ6dm2+8FoFdBbkZwxVvKZAWV+
 AWVKWuixeLsucKX4V7V6EUE42K3VYLIP5Sg8Bs2HRCPzRPZTrFoOFRLaDLTATrGF4FLQ53dLfES
 xcXI2xY4ep/7jHS4uKyp3xGRlRTwSpEbvVzOJE+LXj682etuH8iM/YcB0yJkNwZMSY3feoxmcgR
 VyyhJcck4HaKw3FezAixrm/m1a3WBlvMpZvrnjn4ch5hPZEgbqdSMCQ+CyhoVXH/JKYJjtDddzZ
 VA3hix5fO/wz/wRlvVmXYBeunQ8GUwvlzgvfSiavoE0ikY2DFGA2qNbWeXvxw4jAA/vLgTH+iuL
 xmMOtnzzeqnqYLe9ZHA==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a393f7e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=wmFtSX2CI_Lhy2VUUogA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: whTixtQJJH_Yrl7cRVDNaHcaWoqj2ToN
X-Proofpoint-ORIG-GUID: whTixtQJJH_Yrl7cRVDNaHcaWoqj2ToN
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38812-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,meson.build:url];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 29F8B6B02DF

If both C++ bindings and the test suite are allowed but catch2 is absent,
meson setup would fail the build with error(). Follow the same *_enabled
graceful handling pattern established for all other optional components:
compute cxx_tests_enabled based on whether catch2 is actually found,
emit a warning() instead of error() when it's missing, and gate the C++
tests subdir on the new flag.

Also: enter the catch2 discovery block based on tests_enabled (instead of
opt_tests.allowed()) so it only runs once the test-suite dependencies
(threads, libgpiosim) are confirmed present.

Add a "C++ tests" line to the Bindings summary section, visible only when
C++ bindings are enabled.

Closes: https://github.com/brgl/libgpiod/discussions/190
Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/meson.build |  2 +-
 meson.build              | 23 ++++++++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
index f7f8d9c2fdf231304e3dedd8aa4fe8645da639e1..92625b5a7eca57b0d36b79ff452ed066050b577d 100644
--- a/bindings/cxx/meson.build
+++ b/bindings/cxx/meson.build
@@ -69,6 +69,6 @@ if examples_enabled
   subdir('examples')
 endif
 
-if tests_enabled
+if cxx_tests_enabled
   subdir('tests')
 endif
diff --git a/meson.build b/meson.build
index 0a9a20d2ae3f427f447ec6f671c065da5b8c80c6..6df91b7ef17502e5491b85d08d5eb777e3968c4c 100644
--- a/meson.build
+++ b/meson.build
@@ -98,18 +98,23 @@ else
   tests_enabled = false
 endif
 
-if opt_bindings_cxx.allowed() and opt_tests.allowed()
+if opt_bindings_cxx.allowed() and tests_enabled
   catch2_test_dep = dependency('catch2-with-main', version: '>= 3.0', required: false)
-  if not catch2_test_dep.found()
+  cxx_tests_enabled = catch2_test_dep.found()
+  if not cxx_tests_enabled
     # Some distros don't ship pkgconfig or cmake info for catch2 but they do
     # package it so check the header.
     cxx = meson.get_compiler('cpp')
     if cxx.has_header('catch2/catch_all.hpp')
       catch2_test_dep = declare_dependency()
-    else
-      error('catch2 not found, unable to build tests')
+      cxx_tests_enabled = true
     endif
   endif
+  if not cxx_tests_enabled
+    warning('catch2 not found, C++ bindings tests will not be built')
+  endif
+else
+  cxx_tests_enabled = false
 endif
 
 if opt_bindings_glib.allowed()
@@ -204,12 +209,16 @@ summary({
   'D-Bus'                 : dbus_enabled,
 }, section: 'Components', bool_yn: true)
 
-summary({
-  'C++'                   : opt_bindings_cxx.allowed(),
+bindings_summary = {'C++' : opt_bindings_cxx.allowed()}
+if opt_bindings_cxx.allowed()
+  bindings_summary += {'C++ tests' : cxx_tests_enabled}
+endif
+bindings_summary += {
   'Python'                : opt_bindings_python.allowed(),
   'Rust'                  : rust_enabled,
   'GLib'                  : glib_enabled,
-}, section: 'Bindings', bool_yn: true)
+}
+summary(bindings_summary, section: 'Bindings', bool_yn: true)
 
 summary({
   'gpioset interactive'   : libedit_dep.found(),

-- 
2.47.3


