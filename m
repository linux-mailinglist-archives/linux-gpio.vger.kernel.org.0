Return-Path: <linux-gpio+bounces-39802-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UIBQBEO5UGoe4AIAu9opvQ
	(envelope-from <linux-gpio+bounces-39802-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:20:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44829738F5B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:20:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dYwUT2nL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HJexGLS3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39802-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39802-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42C6B3073F65
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8843D669E;
	Fri, 10 Jul 2026 08:59:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134903B9931
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:59:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673989; cv=none; b=B8DJmQbeh9jmPi16oCcIdyn4BN+587mkMwORBmQ+miX2sIlnct2gnIiyv/mfU1Itk7zmgnFgRGKayF6F+RuzKtv+xTftfYKD2A8wo+ZPvySTQ/yasok7XxcV+EAq4zZQtUvDiVNN4fTWtHjkkWRSACI6l/GiU17Dej0Hun5HlM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673989; c=relaxed/simple;
	bh=nY+M63encNWwjjYqCV6ioTEvo7HJi39AMKvwhi5REqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7fOrJ2QpAGHOiXdX8b9YpY4nk3hlx0UHzeROqHWjrVu/ctraoqmteIQ8qFJHE2qNT5Hi2jY6aSQBs9hPENOjq0w/ccBrRjNpbnqVfSc9N8zkFtiBsge7YYskMeM35NYtjfRUb5TN/nHCV7DZVU3IM942R2Xxn5NZ/906Fpp+qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYwUT2nL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJexGLS3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dfI7000391
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+Sn8CMkpmVKxquBuYTZFg907tkAOezR9sRT
	OZfdCNzM=; b=dYwUT2nL/850PU9cYcpold5Tj4UHWbsvMpAXgaG8eW/FF8Xud7/
	KDiYYwnonExDc9C/h7Ug8aLTI8lkmK7atTm2YvkkyQvNTTejJUOyn6NJevKs9fe8
	jdcfduwBg1ygs/Xx/Ijr9av5TXVvNvXg/q39QC2AwnLRR0xGNjb6+W7vc056QcrT
	LP2Se7lgViPNYqErEpRT8q/1ESPwG51IrbeHDydGW360HSFXdW2hBjzfHf1UH1Om
	TttufyAU+5STxCj4Fmzhs/JS1aNOHQtQUERDYlreWUV+8xwSVIjWqikD6BgeeEdt
	ngZjjWeHjImLC5rIvagSoSJIc/dtaG5DDVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24ufr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:59:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e59b0e0f4so51440685a.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673986; x=1784278786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Sn8CMkpmVKxquBuYTZFg907tkAOezR9sRTOZfdCNzM=;
        b=HJexGLS3BD6G3hPhumtSTd095w0GQqp2PHdxH9j/ew7jtzB1jACyAxj49IU6Sbe+12
         p7tMIGxADxMRl+xMacVl/qFBR0qBz7HIL2CJ2POu0ZeEIsyVplX98aMDxP1+yqTPAbSZ
         tFbtyi72da7OZ4oyEFmrDlQOPUvIRojRWxf7I1Q3biq087Bo7T3K7RLybYXSYRfuID4l
         Kq89u8VZ9ZygYAh/F4GPBYSQdBWg+7tjSDt+hFSqhcQ5ke5buVPqmBfn87VDQlFPxp7E
         ScTu50l8VZng3eSwbfcPv+iE2gJnKISmOMBv0pKHglaq5poB06Q8oIZLWR8cE4W/4QYC
         IHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673986; x=1784278786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Sn8CMkpmVKxquBuYTZFg907tkAOezR9sRTOZfdCNzM=;
        b=Hrio9vqKSa9zbmruh7o5v5yHjq7R6s0aK6qFpr6gjaQCIyIlLYlu+XjSfobRelC62r
         Z6vaI8STtt6QbLPGCUpP191BJ1CXUPoBaSQOPUFHN8l8Kv7yY+G0tgDJSDleicuJhAZn
         cnPnVENiT9wEDevPMzJHvDj2UqznTxrrl8oZLjW5AC5C7Y63FSyP/ut+6QPY02/Z5Jjs
         QrFHaf2TgmWz3R7Hk32dN0ZTcW4U5v8DYzSmjvsyssTrOclM+B5T1+Y74qa9hdobsn3q
         Cu8lm3kH7YDsaNuoQy56vewt31mVCSLA75GqU4NWncl7lYscb4NP82uSI3C12WwLjcho
         Tj3A==
X-Forwarded-Encrypted: i=1; AHgh+RoyTaZ8Q2xTU0AuGbEeyl55iUNp5Yz4KNuEXKwhxvoLuA/7Ya4YqtIrpdgCYccRxje+Uuf/wsBMTEly@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzy3Ijw52UUaKmySvodsQ8JDr6H/KVrALHNoA+qUVemSOsWst
	6PWvRQvn3t3BWBvJXoyfaSakT9SeEeH+QXAMc1OiUvxJfN30JOYis14aQwp6/7IwzVDLnYK1oqK
	t9JuyCawpG/F9SL5oUVhemCZmJuDfTqGXxH1EMsHnxht/sP8zQKP8BBehMDPG2b+V
X-Gm-Gg: AfdE7cndTp8v+czZfWEFNZu/iX5kHtP8PILGhr1rR97ZY4j2zkuuQkMnxT292hGtF6D
	YzgkT1nZLcHNq+XtP0eyHmlF6XkS+ZRAPPGkyNqqLgtHPZ2A4LaaVN80xn2aynl4eUKH2gCUMzD
	cwBvO83px5BuG48c+e2efnlYdbzFpZ2XatMZZnVtPlqI9CN/YthAAGkh+D/gvjPT8XqPD4mNMVD
	+exeFSJ7jLOfoSyoQKQtP8z6GuIxv4ig7u9naEsb348Hlaeqyu1vfAsQWZnBKemqrAvUV5VCCv6
	IfK/42FR08SCdBIAYk9dHFRdLv6huq+i7HzhqxNdiRdo0vWdXZzUiNUj9WRcr85KDROPXyAIyBp
	yW4wpYzKySH97ZS0GVwBVdmruk36i7ktA/laJ//8=
X-Received: by 2002:ac8:5a4b:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51c8b3019a8mr115690691cf.19.1783673986502;
        Fri, 10 Jul 2026 01:59:46 -0700 (PDT)
X-Received: by 2002:ac8:5a4b:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51c8b3019a8mr115690561cf.19.1783673986107;
        Fri, 10 Jul 2026 01:59:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm58562263f8f.27.2026.07.10.01.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:59:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] qualcomm pinctrl fixes for v7.2-rc3
Date: Fri, 10 Jul 2026 10:59:24 +0200
Message-ID: <20260710085924.8707-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ipuhjEK1ZZMn1uoX-AxFLl4Co9YmkOKS
X-Proofpoint-ORIG-GUID: ipuhjEK1ZZMn1uoX-AxFLl4Co9YmkOKS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NyBTYWx0ZWRfX3JSURhsrN5DI
 qBkr0X9IYB7TwNhNb2NKCvwy4mxR2e/Mbc0az7r0S2pAKTNT5GOzdmzUkKF28ZjsuWgd7jIbEN9
 JVEAtFACr8zH7MnVJwGehYyBMZFqRvM=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50b483 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=j1zNzP0ku-nBEIsX26oA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NyBTYWx0ZWRfX2ET6W+J4axEa
 1027UXlhaRYUlnApyZd8kw/if/NrwivZj0dopQfkERqF0RKqRJaugULvpNd1U5Y5UhLhJbDACSa
 dXHbwcCt4cDUL0KoYOS+Da4ncyJaEt6/lViQUlQHSQutTZM7Yl2JJxJo/spAhLiDM6NHFOWjOVy
 1wSAVBS7RrhGoaovHjT5ucqNEQfDnCLGmzh77+gLSqf6fhIczKkRxB3zD4nkAGSsjVt82nLtmgH
 +WK/RHKrGQQa+n4AqBtm9pX/lGf7sfSiw7cIa46z3+yga7s5xxr+OyUV366n0uvxJCp23spj/o2
 6uU3Yvyzv94eV77N8JTvRvIe7f9UZcPUYX+GbAKAwg9lDP4NTGkj4Uws0GX7cY8B8NGsNVd9Xs9
 DgTFpDN1h3W1MrUcaNWoPbSK+kHo1ul1E8EcLYbDQmJxHRKZMW5K2rECSKmMfu/udtHgGHlcPOa
 jCzzUy2FbZuG0Zh3WEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100087
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-39802-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44829738F5B

Linus,

Please pull the following set of Qualcomm pin control fixes for the next RC.

Thanks,
Bartosz

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.2-rc3

for you to fetch changes up to 437a8d2aa1aa442c4a176fdf4700a9b3bb0c8794:

  pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151 (2026-07-01 09:22:45 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.2-rc3

- add missing wakeup entries for GPIO143/151 in pinctrl-sc8280xp
- fix GPIO wakeup interrupt detection in pinctrl-msm

----------------------------------------------------------------
Konrad Dybcio (1):
      pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151

Sneh Mankad (1):
      pinctrl: qcom: Unconditionally mark gpio as wakeup enable

 drivers/pinctrl/qcom/pinctrl-msm.c      |  8 ++++----
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 21 +++++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

