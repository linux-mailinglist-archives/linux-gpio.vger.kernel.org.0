Return-Path: <linux-gpio+bounces-38101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OsEcF5/fJmqsmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:28:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBDD6580DD
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:28:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hfz8DPiZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f1hqh2GR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38101-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38101-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0897B30BE04D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124A53C457F;
	Mon,  8 Jun 2026 14:48:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AC33F374
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930099; cv=none; b=AB3cfzA6Aa1jTpXA4kbfB3oikEjyAaDXGToxWM6EuibOjSftkRTaUfdD3CzTWAaG1lSmt1Op7aiQF/233acYgbSjVMkNTlzqD3K7gMcy09VPmWz1KFnYI9OWf09zTEiJ4pnpACnmb9KTcdtSfkkMnnQVTfy74QszXUjMJM+2F7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930099; c=relaxed/simple;
	bh=L96g4YpCBzYsYH4vU3iqK4lz5FmoUdWZ8cGddDcgoAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=adhXGKgHsLcoXOk+wj3GDHRjnPOacyo3LMzYDDmmJdwPZpMf20J57ctSlkzsHx8SaCkTmdyEwJ8WP0gMezEGeegD2O76BOaRUh6tQU1GnUGoeclu36k7ZujvOvGcwT/DcZcHUzAVHja6yMw7zNIMbzkW5Rpvildd9dgL5UkLfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfz8DPiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1hqh2GR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY1HU3909714
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XjzmKWLMgrJx7PWEvjSV8y
	P8MBvOyZrq/I9NKhfUXlM=; b=hfz8DPiZioxnlQUBBF81Jk1wdSqsdyywxE6AZy
	/Cd01m45gpiDeBpOBpuAHQYvBxNLuIn06qyHTk6i5hnXK75H8+q8GrN3/No58S6C
	rjRJY4M3ukvoh7qi1ikt5X4eG5d9uXhYWJ6xiD/cLAlgT31biCRvCfJsAfsZKh/S
	cuD5BbKm0qcTFP4KqQMBNPPSNvhGgqTLqDwpOnN4w7Kd5KYKnJeie8vK8+2k95Nt
	sm0vCGZ33ELBtfW8h/fgCoT5F5+PaI+LJp90uHJPhBhKj3V0OEiej4u0Z7DmfXbz
	dSCfaIDi+F93jnGTgDhukFfDuG34esduCJihwWy4666OAH5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0hj9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:48:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2342470137.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930097; x=1781534897; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjzmKWLMgrJx7PWEvjSV8yP8MBvOyZrq/I9NKhfUXlM=;
        b=f1hqh2GRtD2YmhMDt/0S7VbXk4i5MDVfoQVpQxinkyUbOHEMeiSxxJcB3xzUVVDrpd
         6RlaDK13FPkij3W+Si/vSidI8MUTO3aHhwhICHlQhgtQIPB/GvMqPCdB3/J0tHB3EPYk
         dIexgvjfF1H2fsFfWo+uNeTBn4gVMNnhgrform+ErMbl8b9YeTZ7QKoICrTQ82Ao80pE
         DOnJ81i7GFfk7TwrDySdLeBXEvDwrDSx/eoJXBBeuWF3qvYzOkNqPm5w6ShrbH2Bf7B6
         K0JFHxvry4ZkfbnJ6yWgV15MRXcySvSzEZOSBNeDtzS5sd8c4KvP5WVJAh7O4qzW/9DV
         WzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930097; x=1781534897;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjzmKWLMgrJx7PWEvjSV8yP8MBvOyZrq/I9NKhfUXlM=;
        b=BCml6vD8b/Gg9dV2lDSGcRWF3eJmuYt4TcVziuXCYpPVu4QXSFVRgRirk7CBSevFTb
         Yz4MV4H7bqpo2cJ+DuLhE2EBqg1uY/tsM//O8ev+advjVgId5sEZ4rwJkvKjAL+WiXFn
         Y6/LGFbqt7pcYAMVBSEcBuAe3pYiNBr1be+XYhppdnsNykut/bm+DxfJHKSVQHKH+3GF
         O0E+XnNoSbJL/HlPDUP6c9Bk6kQ7sFri7MFziLezlAGq9+Ne+Y9GtZg8I6sb2a93RUD+
         5mpCoPFWJ+p+R/qtBuTZl1tAAsCTBZFbTYm1gEg4LoNvDBwcdqoO7Amk6O5CiH687nuX
         p9RQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Xp1p/L6Xg36ohLz7yepo2uygYGIPAnEC8nCVRVwkw7++F1bqtoa1Vpi6KF6tYngNs15l+MxMbZi2U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5w901mCuhFW4pn+lxNS7cm2GCjcqrcebqPMjwiuzVz70PZSCZ
	C7muPJiGpvVHxAsDBMkQU/7Fm7X00OqJv3chXfjvbkw0XkGY7cgqR0IdbzhGoxwT6gAduvwskN+
	0lGOq2GvkmNFu+BBTzApOgRGTdy1HjlsfZOrr94/1hNj17AmiIAHWRoo1wPGbxyq4
X-Gm-Gg: Acq92OHCLwkr/NfWOTrobKJjyxOUtx2rePuro84RaZhs6gPO200smfrOD55bjgkuBg1
	plwyofmg65gw7mjLoC7Kv4KH/MIl+lBqQwBRQhQo0Zv98WwvbTKchr0G5zQqFEh+9uLyjFP16Bj
	vTFE4ckNCO5HH5envDZY4Y2SbISnb4JlSjPS5ws9H9GjlOQsJVEITGQwktLBHhDvyNpHeDvLjLj
	q5eO2M71Vt/y6DPNPkJ9hRrLuixQiALGugtqQ3nUe9EWGnjfXUpEVHWeGHt5OhHqt1uIBUxZ5J/
	vxGA/UrtoBtKS4X/umzvt3BsmRW6h1t13uy7nLCos+0bVBH6PNY149Qe0iCv015DgKIniBL4Bs7
	L3Fjt656zqAvsQP45x1FxWqy2UJjwzaYkCYxkESzR/rOA0iWk7NkF9CVGOLYw
X-Received: by 2002:a05:6102:38cb:b0:632:73ad:6c4 with SMTP id ada2fe7eead31-6fef92b9867mr7790012137.8.1780930096756;
        Mon, 08 Jun 2026 07:48:16 -0700 (PDT)
X-Received: by 2002:a05:6102:38cb:b0:632:73ad:6c4 with SMTP id ada2fe7eead31-6fef92b9867mr7789985137.8.1780930096274;
        Mon, 08 Jun 2026 07:48:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm462705665e9.1.2026.06.08.07.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:48:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH libgpiod 0/5] treewide: more AI-assisted pre-v2.3 fixes
Date: Mon, 08 Jun 2026 16:47:48 +0200
Message-Id: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTWJmoC/x2LSQqAMAwAvyI5G4gVYvEr4sEl1oBaaUEE8e8GD
 3MYhnkgS1LJ0BYPJLk0azxMqrKAaR2OIKizOThyTEwe95gET8NhjYvekpH9wg2PNAnVYKPVP9j
 XwaZjODXO0L/vB7P9wlluAAAA
X-Change-ID: 20260608-more-pre-2-3-fixes-68f676b0ce03
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L96g4YpCBzYsYH4vU3iqK4lz5FmoUdWZ8cGddDcgoAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqJtYkEB9nVbakKq/3xOobC5tF7tEpM00gN1yYa
 VoHCVc2V8mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaibWJAAKCRAFnS7L/zaE
 wzueEACdhIXwmCtVQ4PNhsFpRbLyDwaI8TjHhF17j9ZkfqYc54CmG6MA2mYf/MMGS0aSAWnI0RD
 VBCRL6qeEkukD/4vWGAJdakF/e2Y79EL7QtSYvO668177sVOL/ylOzIzp1NM4/NSR3LgMsLlRmt
 A4ooFsH6SWXxNYt3TcHV+nyJGWefaTyxWNTjVd1Loy4L2yvqh9DJFIH9CVoLcCoJfr6zqeNrJ0x
 2vHKUh72K8gzzdM9iHuI22yn/IB5dJ291hD3vXywzPHmwEEjNUv4a528P8MuXAnipq6bTBeUhKu
 vk8Rc1m+S43PkDnNlQmA2BjGy5CvCOiJhkBLgC365lync/w4DvQ/6B9f6Puhz0Srd+iovOVhH5U
 cAtWV2RBfWHHuslz1mmdnkvMAN+yMv9dj9fXrj+YUsooocXdifYDFm5FRHhqK8VJ2RZ6L+YU0Ig
 vSxG561DMeyD7IK874zgIj2KqWAB4yE2gxCVF98ioNbxAMAWWHZdaSSs07bVZdugzD7MQzd1828
 BLStTzWYaq0iSqkOABU9ntMs0ikEnHoHh9V+aikkicQM8W92dTs6aVW8r4pIC8BtcmZ2GhzFSHq
 2BG+LVTtPia25Odo2G42jntqNzijSIUuufQTHHUCiRWGp3NNjb+Yf+BBtXB9WCn9rIRyUyvwfvS
 9U+/TzsuPf28ESw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MCBTYWx0ZWRfX/Go06aZevRnG
 p9UL8oCqZkEDeZmBFJW6ENReK/g0Jaw654H1/IVFfWkk2bhk4aLGYd2fuilbXyzwKk/nh3fBUT6
 buOxz+W/8mC8eBFHIBM8us66tnfUZeU4tPrnhNZ9KEN/eCvFKZj4YZawajtTuPu6Uz2VmDtW/bT
 fHDrZOGrU0mpHOH+ZyUULShbrgBwOg0N84l44wPjIg82fB3q32vxM4QsbG6cjDgwBlj+jUlQJIo
 iVRjSOTWCXDwdzig6bU2GI+88wDVOV7xd32OEhCWd8qJyvYS9apP0jyA4sNNxZrXF1JnQcLModQ
 Kd10SvtwFvHw2CQq4mhwf6+LQqe61Z3c2voDqsydkocEIf8UAyZVuu0hGsyN6lYq4k/Qf6pFfoI
 qow+10POdYtFRHEP13pvcoJLbOTuzGLe1rcaTiw+Lo/GmNJRI+6t9fRBea1Tsqw+slWV3MgTGM6
 hucOrUGRaRasiYgCIig==
X-Proofpoint-ORIG-GUID: Z0V34QtWhbB5Nk_2GwDRK85ItvDTamBs
X-Proofpoint-GUID: Z0V34QtWhbB5Nk_2GwDRK85ItvDTamBs
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26d631 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=th0yqdjwuJOaDMnplVgA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38101-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: ECBDD6580DD

I got access to the more recent Claude Opus v4.8 model and it found even
more issues so here's another round of fixes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (5):
      core: line-config: use gpiod_line_settings_free() to release settings
      core: edge-event: return 0 when zero events are requested
      tools: gpionotify: don't watch lines on the wrong chip
      tools: reject trailing garbage in parse_period()
      tools: gpioset: store interactive sleep period in a long long

 lib/edge-event.c           |  5 +++++
 lib/line-config.c          |  2 +-
 tests/tests-edge-event.c   | 35 +++++++++++++++++++++++++++++
 tools/gpio-tools-test.bash | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/gpionotify.c         |  5 ++++-
 tools/gpioset.c            |  3 ++-
 tools/tools-common.c       |  3 +++
 7 files changed, 105 insertions(+), 3 deletions(-)
---
base-commit: 84700a6d5fe7f4499d6117b55e670bbda72b95d7
change-id: 20260608-more-pre-2-3-fixes-68f676b0ce03

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


