Return-Path: <linux-gpio+bounces-37641-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG/nDC5FGGr5iAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37641-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 15:37:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D535F2D7B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 15:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDE4C30DEB25
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8163F44E7;
	Thu, 28 May 2026 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZPLec0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkEcl6Ei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBD3F44E6
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975058; cv=none; b=LcmLTywcMBZVNXr4f7yCjewAI7+JLiScPnyg4hrED2zWWNS8dxcsxec0bx94duVpvJazaK/EIvRVS/WUnvKZ2vFM+5k94gb+AQ5RWCyvcjH9dpKTV3FG/9ZCaZKhtbf2p+VuKuwgcQNcUaKiktwLB/aKT5AJF7Fsd5mB/Vf0kMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975058; c=relaxed/simple;
	bh=mV0SGWypC+3M44rDfbp+96vOLTCRoG8woP5X5/Q9xOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkj6JAd/eGb82EwE8wpTise+4UvPOlHl9fF5p3PuyuWt2n75NE/3g8VYSa0QaF0mjFiiejzPzkAFdCEqolPxyiLhlsMSqf6hktfVB0GhkkaQ8mlO9rqhwJPqvna5eNpkbtDBTaCDvX2Jx2PEtI+Meu8VID4J9XBVXpTj66J4iMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZPLec0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkEcl6Ei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vO8t3545351
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 13:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0JNDS119sEO/fIWtD3mBnFcGFEkR+cunErK
	llBGgA+0=; b=lZPLec0d5+TquqxnndKHv5wwlRrV/rW5H/f4xIS67/A8gLK1q3D
	PloTfT3t1JD6BGBhRF5wptjZ6/E/HxTUX7HBAXRAy7mR7lTcaKILQl8bFr3cO5cv
	YJPC0b0zMGgs6oeA8IXaHSUavUKKj1sT506QlDewfeHDYDKFgwKsAEg9c1km4unD
	pLxCHdTYIIUruEE4B7py0ShbknSFYXo+5Mqi6nlG1DW7fF+t40lUJt2uFIV1EbwG
	knFOet7rOf7ha8LOkx+b9bv8sXOzPHwbQCt7IRlBJEMHjf8+OnE07l+lRFbsz5zr
	00ggQLhKVmj+o5G96Vg85jc82sw5dEJW7GA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tvf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 13:30:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6618ab427ccso13841732137.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975056; x=1780579856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JNDS119sEO/fIWtD3mBnFcGFEkR+cunErKllBGgA+0=;
        b=bkEcl6EimzJ5LNm8CI3ZwLtIWN682Qpe7N0x8yQUhnF8ZAcG2f8tIlPJ7E5ke1oGXy
         77O7xX7T/d0BG4l6Oq81VpJLXZz/uv+iOTQerpARITSeo5tXphJgZJhvJ/CPI8VKF1Mm
         WIkB44yliqXsgtw/Rpgo2FRy/RNJcsQNMBSPFWfw6oRoFa6rOYA3amIxiyFiDCceqqaI
         55sUQE477tuC/pJ0hRiKU6iZ/vFY7CIDGJJOOyydzrrplmTW9bTdyahlhIu0oTJz8u5w
         qBLHSLcoNd2WD70uePiB6EWSKvRZDP0t30YfR6VS/BRFzgfTYcL3hrI/OuVxvf2pUD61
         LXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975056; x=1780579856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JNDS119sEO/fIWtD3mBnFcGFEkR+cunErKllBGgA+0=;
        b=qbN0TBwYmVU+S4Fnw/FVqlxBO3qJwYKwyZ1+LhfPRT/CHV4GiN7wBZ0w+G0qRfMs8n
         KFxE9lC9nY5qxIUDZJtvEjs9Nexq3gx+7/A6ursJu00hk2IJKben7r/Mg0jcbtmzFm2w
         UQ6ILABeCm0qbLb9+QUjKSh6M5hDBLYQwkoajgsxz7GnzYbfc26EE8d11YREnZBQpVzt
         n+Di4Migwqg5mZOHbLLxbkk9ViTVh1vHqzjf2ck7PBqwKAray1DaqaaBjr9lYjvLxKeL
         4P/oOX6khj7cy1roJ5+I0/Y47B9Djg4xzw4QKf4mmalzSHewoDPFKSmpsWdvpYz7kZPw
         Zceg==
X-Forwarded-Encrypted: i=1; AFNElJ+IC9ucCkR9M3iVKVLfGFD2aCwa39GifcvUXoSug+PBH28V78h4kzZBws0P5dbEKIEbpn43NalKThbc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VHyRTQQh5HLzsrcmDJTprNDoFl542mAKvfgiSQruOFnvnI3g
	M1jEoAnkXDO+PASpdwPC+bj5x2NhQ868uaslHt0+UUSWgYInxDzbCOAfO4CBfxbPCe3je3xzju2
	jR+rfj4NjKSibtW1ANxuMmWq2OjqiRxBKA5yYO3L0G2PW2XlrrIyOg8icyDt7b2I4
X-Gm-Gg: Acq92OHC/xMyEskTlYPczU8sPORPaxkEhOI1Jh1B0q1+hYKrjXiZnbWNndfxOovtdjl
	exunmQI+bKB74Itqu183ho6wsVQRwzqHzYmK5H5VyA/Ji91uHXbQbI2wcrJkUG79y/fNqcWJbn9
	cb4wm4s6dFhQIxn6+5Oc3u53e7yIDtBvRTvSxB7fTA04KGF6bZwi4lmRv57ZiBd3HhxLNDqHU/5
	5+p3k3H8onl/O1Y2eSYJ9ZXLGTPdJcsxWbnY/dXOhqOKbmWe9oGzcIN08VR6KwmOjsxUz+tvMnd
	sEqJcJKKAbq8VeYUA9GxLr7D9cSTkHB48fz8vhEKanlhoE4A71lixA7ml1HfECwge50E4ScT+FB
	T1R868UuGNOaEaTuMNCBjzJax4HIXZqMTcIhZQj9b+7FqP+Mwgu4uNtBIj8jfILmPD7LK2Pm3Jq
	HP0M1y4T2ja2UYfxP+e0ZC6iQGlg==
X-Received: by 2002:a67:cd8a:0:b0:6b1:c09:4202 with SMTP id ada2fe7eead31-6b8a36101bemr361081137.5.1779975055805;
        Thu, 28 May 2026 06:30:55 -0700 (PDT)
X-Received: by 2002:a67:cd8a:0:b0:6b1:c09:4202 with SMTP id ada2fe7eead31-6b8a36101bemr361036137.5.1779975055390;
        Thu, 28 May 2026 06:30:55 -0700 (PDT)
Received: from brgl-qcom.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f08e78asm14862425e9.27.2026.05.28.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:30:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.1-rc6
Date: Thu, 28 May 2026 15:30:30 +0200
Message-ID: <20260528133030.49788-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DaxfPdigOg7Ie-GSb8-ULSQ_wyl5zSeY
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a184390 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=IAxtovtg3JPSEswSOVoA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: DaxfPdigOg7Ie-GSb8-ULSQ_wyl5zSeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNiBTYWx0ZWRfX9rOabIhCb2Wx
 jk7r4mRb6QIklAkJuwecbnTXgsfuycrZo30msn/hZDsM4964H4aMujcpNzqdr16ORCdwp6VK/2S
 /52S2u0K38ppt/abfrEbYiOQWnEN9Xd2cE/7B/lVRbzq+vTpYKIoH+V2TYF6FkBkCxMpDXRvE8i
 HNcdO81vRjGnsY4gmfxnS5QsCj8TNV0TcJlnvP9l5OW2b4/hDTlB/TJvBdvwb+ALtztdvMB65Jr
 Gsd28tTAaYs4VTsjC17IhgBOZb/i40gy7t9v07lY45Hbxj9gpDvN0WNATDbmmXs039U0nxQcV/b
 SbD8oPpoDngz2kmhS9FPYhmgH9TuRArOKwuIbOKIMhnWHFTVgPhnPt5x1bIP7/xcWJDKLeXCray
 f3XAP3WJRZLpCzsv6Crm3J52EK/zA8JX174l3a8NiY5MRZCqMmBT2OeXbdGxMKVZ5LJBDST4wHE
 g+14WGMZjcAU4wDlwiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280136
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37641-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99D535F2D7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

Please pull the following set of GPIO fixes for the upcoming RC.

Please note that the fixes have been in next already but I needed to do
a force push today after removing one of the commits from the queue.

Thanks,
Bartosz

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc6

for you to fetch changes up to 9500077678230e36d22bf16d2b9539c13e59a801:

  gpio: rockchip: teardown bugs and resource leaks (2026-05-28 15:23:40 +0200)

----------------------------------------------------------------
gpio fixes for v7.1-rc6

- fix interrupt handling in gpio-mxc
- fix scoped_guard() usage in gpio-adnp
- don't accept partial writes in gpio-virtuser debugfs interface as they
  can't really work correctly
- fix resource leaks in gpio-rockchip
- fix locking issues in remove path in shared GPIO management
- undo the vote of a GPIO shared proxy virtual device on GPIO release

----------------------------------------------------------------
Alexander Stein (1):
      gpio: mxc: fix irq_high handling

Bartosz Golaszewski (4):
      gpio: shared: undo the vote of the proxy on GPIO free
      gpio: adnp: fix flow control regression caused by scoped_guard()
      gpio: shared: fix deadlock on shared proxy's parent removal
      gpio: shared: fix lockdep false positive by removing unneeded lock

Dan Carpenter (1):
      gpio: virtuser: Fix uninitialized data bug in gpio_virtuser_direction_do_write()

Marco Scardovi (2):
      gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
      gpio: rockchip: teardown bugs and resource leaks

 drivers/gpio/gpio-adnp.c         |  4 +++-
 drivers/gpio/gpio-mxc.c          |  2 +-
 drivers/gpio/gpio-rockchip.c     | 23 +++++++++++++++++------
 drivers/gpio/gpio-shared-proxy.c |  9 +++++++++
 drivers/gpio/gpio-virtuser.c     |  4 ++--
 drivers/gpio/gpiolib-shared.c    |  9 +++------
 6 files changed, 35 insertions(+), 16 deletions(-)

