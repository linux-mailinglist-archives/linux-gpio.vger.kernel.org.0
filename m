Return-Path: <linux-gpio+bounces-38104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eu1FKR7fJmp7mAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C465803B
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:26:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aLs1ZdMQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="aq/Js4fe";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38104-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38104-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1A03330F629
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABF73CEBA7;
	Mon,  8 Jun 2026 14:48:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9C3CDBAA
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930108; cv=none; b=WOrViO5KhLmVjD0JODgQdMoWwmhNqMIvriAwi4K1QPsNqSPOTKbpKIVRrIvkcVErRuXxBlgw5wSAzDMjPczZEnQpLHIGi5dkISy9WlKGgIw5HW2qxPuPeFvhvX5q3DujPNRAm1XFAydnSjZAmNCrsDFhEVfPpmpUnWAJWTdfJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930108; c=relaxed/simple;
	bh=aVfdx2Jz+VsylgBF2IkG/HzckxPvhchwq68DzAMs8QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYxghRzIqnNKszhBw7LY51CjwX3wFVVv4ktt6tgInMj3Uw4F5HuJkv8vOdrST7p128yhZ3wuPuM5ZqeG36bPQDonghcRwdhcnby0OzRC1TAHJKaqvatOO0ZabHP3rWCpsQP/zzrl21LuHwENwcClETDB3lkJg1jlqBqfeWp5HrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLs1ZdMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aq/Js4fe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXoeM3381079
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	479NRtDsj1x5zCalM4d0I2EaEA5X+2Y6y8h5geUldTM=; b=aLs1ZdMQCSgGllCV
	sSMfUoLXZYR7NmnagZ4DpZOGNLqWKxEBCLES5sM/zI4Zmx8Ua6guezlFfxjVP5Ds
	qMt/SJ0G3aFrlBIeD7kZ1ok/x4Uw/aREGa9EhYEcwkNSTvO6DbkbG9oY3NFvTojq
	KafCtL5dvRFzLjUxOYdefbgb7Bv2l6HOCvJkfK1+TA6vY8q8MkOE5IRullc+w7hv
	dXub1Z0NJ2GFffg5yB41lkNG4w4f+GLqL6q6YqtR8W/ZZNaotD8xgRueZ4XPM2FH
	vBrZNfTsY8vhC+2LHwZk5URtcFo4MPM0QmoA7ohSuTiiPVzvocnuS552cW9aczha
	ogK80w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx40a82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:48:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso52687741cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930105; x=1781534905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=479NRtDsj1x5zCalM4d0I2EaEA5X+2Y6y8h5geUldTM=;
        b=aq/Js4fewxia9Q+Y5YMNu1Fj0vd/dbLza007PuI7FmNyh7iytqWUj+gmTE1O9CIss+
         qQ83MAf0aaFFT40T1sjIkT59Zu5OQPdiOpT2nAOKiPbZfCrvVS8jOAhDf/1QgqLKwjQA
         u4zOhAOAHcF2gnmY6utW7oTsH2ZNqkGAVdaTwWszd4nnH4K+c/7S2+xfw7J+JzLa9h8Z
         zE7ZqbRp4jrpdCcOkbtwtquPMjVKfHA2SSul3zj7v+j65tl/JgNnGIfDPpEd0o04YyEa
         RfYlIfTu5tig/yLMQ6nZzK2PWhI5kRLSgHNqQWQus5Uy+Xq3Dz6CQqoICOpzrDJEntTi
         OZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930105; x=1781534905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=479NRtDsj1x5zCalM4d0I2EaEA5X+2Y6y8h5geUldTM=;
        b=UlIb0Go1p6v4BIRA2F3faDzLA9434QRvw9EteuE3/avqkYH3/LsLYuxAhcXq+mjdld
         3c1RyRAyQnfHKJhxdNAXLYbIwNAwXzcTsydsi44qGYYZkiNftkfj3K/lLQkK+fFkuN2W
         +zz3wywAxAZ1+rDDLoe/5pvaLjqdQWWXkrDvAur/NFcpaqyrcMTq7RqEmqymBxAhILz0
         3ys3Roza/B2r4kfXaFGOK5K/d5dXtrkHjJTHKOHwesn0SLjY7ji7c5SJHM/fArL/e1Z7
         BAXT8WH3ZNvdsFW00mr+7FTk4fSHheuUORuJNYyKaTvlsLTGN7EvcQfC1oQ5gZNuEQfT
         Qdcw==
X-Forwarded-Encrypted: i=1; AFNElJ9uRosjmtSzxsiOpCVZCvEIv21vhpERo0qcPWwlgtcaMdtzVJglttJnDRLMLNj7k9EG4MOA/D/teR/B@vger.kernel.org
X-Gm-Message-State: AOJu0YxakCOYBmZxEi0dPIutOBIDlcWjWM8eAlVRZzdIK0EXNziOlYCf
	1eII8gSX591sQLNVSNM6v9Xw2B44D9xy4TS+SLkTdLJaFaIyYSe1Mz9TvNEtB40+PV2Ay5/ZALI
	03t7WE1I3xiTSCoO4XHdP6ngyYgL/UYVmieDW9Z/by39Re4prXPveeX/8ga7vUFR1
X-Gm-Gg: Acq92OGD2RYSxY/EnKaXdILkX3E8gaMbsgGlsZYJsqDUibzr7jGNTpGW8Pg8CQnFnWx
	EQbi1PbR+7Lik8meKfGd9XgkOS7PMtoXwy3D1kSxsy2X8zhGxsiihWDjGfe7WQFUBoDf7erIElG
	FFC1cPlE488jSfK1PHS+a/cdv+GrGxjuXBmBTErFE08+bzBNd8ktAXTk/NmTFJA58g9rhLhzA8S
	uH7fdYbeSUsEFhsVh0CF6FxqOWyCpfBKTiBx1em1GSQuYuZaF4Yz6xXvPjjwxY4Fzf0RG4DOcUr
	mZs4Lcj43JzWuv6Xyy7xLj6I0dQqEpotOWc7J+q5+4G8Q9243hV56PLSxQzmluAP/yahEbvXiOt
	JlUgUvfEMS3gjEyop4hMtCVDZmcm4EXD66+oClABEQWbZVp5es6TDu6MRlGpG
X-Received: by 2002:a05:622a:19a2:b0:517:71a1:6e05 with SMTP id d75a77b69052e-51795b521d2mr213932281cf.25.1780930105061;
        Mon, 08 Jun 2026 07:48:25 -0700 (PDT)
X-Received: by 2002:a05:622a:19a2:b0:517:71a1:6e05 with SMTP id d75a77b69052e-51795b521d2mr213931401cf.25.1780930104283;
        Mon, 08 Jun 2026 07:48:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm462705665e9.1.2026.06.08.07.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:48:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 16:47:51 +0200
Subject: [PATCH libgpiod 3/5] tools: gpionotify: don't watch lines on the
 wrong chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-more-pre-2-3-fixes-v1-3-577a5ba426a5@oss.qualcomm.com>
References: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
In-Reply-To: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aVfdx2Jz+VsylgBF2IkG/HzckxPvhchwq68DzAMs8QM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqJtYqVe5ZVGPNm5+vEanc14o3MU8/BnK1gWyCY
 0+S/4dgIbiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaibWKgAKCRAFnS7L/zaE
 w+pJD/kBqkKbPE7+zl/lGE/l8Q/B0LChKZ2NADpK7zQeZh2g1UTFj6XeB8dEIYi3trFklfst5Cc
 TqRjKeEsnQdomk1Lbu4CqB6fXCzD+Knfy5xGG/TK6ESWOjycOQpFjwGxRUp9F7AsWEo/8mZpR5S
 ULKh+6jbQgiaNXEQk7Wun50B/BpAUwZHXu8k0eSyHxGrf9EIRvLexgn5EgXfsyyWDC8OuX17bao
 hYqztFCXuT0m91ywx4AVo886v8ZvMEa55JQfpasuYsdUuvdgpvEBAcFAMy5eNOR+yVppst/byAy
 EhvQCGeQBQaG8R/9xqWL2q1GUPMCkuf6WyoILD9+7fngti8RsPhQ5P/1YnDdTavTulGZ5G/edxL
 y+L1dnyawYqaTN/3iw981aLYZMcT/lrwb3zwYnulB0Aww/PD1gKpii4tF6Wz+uWucIYa6RckmzJ
 26akQtwfEji7NgqGwi1NHBolMeWTr2Pe+C9yXFpEiowyQ8WAi9fZtyQC3J4OKzwED1C/e+/XiUc
 VQP767NmxAxi1jAsTRvtZ8RvmIAvDTkSeR7fkQnv0sXytasfnFK3AqJajGFXi+gQFrfkhVUyp7/
 CG+tkfo3eK/wii043TTx07m3IDNUTwZrbrgrNtDGgOZUBQt5mo81jROZaRpi2ovGcSbD91DgXtO
 9NOSnpDzPYMfXLw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26d63a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=g2hFgUtsft_NzPg5WQwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FNnV1BEdRWi_EbuJrsm8lyi1x4MEUtoa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfX+Ng2YyDehjiF
 ySJT08918+oeI0LG1Use9/QvX87CyGq7I0e6MsgNlQSJkyz0EOYbqlUTgif4/WxFti3MPI5ONVX
 g9+00RAQ459XTWSbDDwTVu6RrDzJfI8J2PjY5srqXXZbWXnyw0P0YEfbdoWl6KLI5TIsJyiBHOU
 zXoHkH7d5rkzmLz0b6LTrfJRhBSR0JyNF84fjBv2r1hfSi3a11ngkO0aeeNm8byRA0vpf5O57PQ
 5hPFRWGQ/lCuBI2Kg/j5I8p8ewEwROZds3+eROU+5qRpvpVNzX9PllC4O5Co/+9rJSYsRlKY0at
 5RXgGTsHaC0IDsK4G/FrNKsipTYJ3lUhB6AAPJiMIaC2WZPv5ZxAoyKBnDmWj7NNXo4lQYz5lpR
 76jqEi3IOtxD1N/rYkhEmuTMNdux+BuxnFj7jKZfw8j2+/+uEPccO52oWZrCvc1i/Aw9kPsdo7s
 RfiiPO18rcXLXYl2jjg==
X-Proofpoint-GUID: FNnV1BEdRWi_EbuJrsm8lyi1x4MEUtoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38104-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4C3C465803B

Commit 0de77e2abf12 ("tools: gpionotify: don't leak info returned by
gpiod_chip_watch_line_info()") moved the call to
gpiod_chip_watch_line_info() out of the condition that guarded it. The
original code relied on the short-circuit evaluation of the logical AND
to only request a watch when the line actually belonged to the chip
currently being processed:

	if ((resolver->lines[j].chip_num == i) &&
	    !gpiod_chip_watch_line_info(chip, resolver->lines[j].offset))
		die_perror(...);

After the refactor the watch is requested unconditionally for every
resolved line on every chip, using the line's offset as-is. When lines
are spread across multiple chips this installs watches at foreign
offsets on the wrong chip. Such a watch typically succeeds (the offset
usually exists on the other chip too), persists - freeing the returned
gpiod_line_info does not remove it - and makes gpionotify report
spurious info events for lines the user never asked to watch.

Restore the guard so that each line is only ever watched on the chip it
belongs to, while keeping the gpiod_line_info_free() leak fix. As a side
effect a watch failure on the correct chip is now always treated as
fatal instead of only when it coincided with a matching chip_num.

Add a test-case that requests two lines with distinct offsets on two
different chips and then toggles one line's offset on the other chip. No
event must be reported for that, as the offset is not watched there.

Fixes: 0de77e2abf12 ("tools: gpionotify: don't leak info returned by gpiod_chip_watch_line_info()")
Assisted-by: Claude Opus 4.8
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpio-tools-test.bash | 23 +++++++++++++++++++++++
 tools/gpionotify.c         |  5 ++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 3ec76dfac95ee276c78dac0c2f9792d8439f5418..00739c5a4008c636b667cccd1cdaebb624ae0ac8 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -2486,6 +2486,29 @@ test_gpionotify_multiple_lines_across_multiple_chips() {
 	assert_fail dut_readable
 }
 
+test_gpionotify_do_not_watch_lines_on_wrong_chip() {
+	gpiosim_chip sim0 num_lines=4 line_name=2:foo
+	gpiosim_chip sim1 num_lines=8 line_name=4:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	dut_run gpionotify --banner foo bar
+	dut_regex_match "Watching lines .*"
+
+	# Toggle sim1 offset 2 - this is foo's offset but on the wrong chip, so
+	# it must not be watched and must not produce any event. Doing it before
+	# the legitimate bar event guarantees that a spurious event, if emitted,
+	# would be read first from sim1's event buffer.
+	request_release_line "$sim1" 2
+
+	request_release_line "$sim1" 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"bar\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"bar\""
+
+	assert_fail dut_readable
+}
+
 test_gpionotify_exit_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8
 
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index a45685f22ff73b1e138ddcd662f35fc8df5c0755..ea4b0ca79bb7b710c9090cb524c0c12b96f176e7 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -407,9 +407,12 @@ int main(int argc, char **argv)
 				   resolver->chips[i].path);
 
 		for (j = 0; j < resolver->num_lines; j++) {
+			if (resolver->lines[j].chip_num != i)
+				continue;
+
 			info = gpiod_chip_watch_line_info(chip,
 						resolver->lines[j].offset);
-			if ((resolver->lines[j].chip_num == i) && !info)
+			if (!info)
 				die_perror("unable to watch line on chip '%s'",
 					   resolver->chips[i].path);
 

-- 
2.47.3


