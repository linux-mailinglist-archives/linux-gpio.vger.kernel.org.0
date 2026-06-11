Return-Path: <linux-gpio+bounces-38306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlHNLxNnKmorowMAu9opvQ
	(envelope-from <linux-gpio+bounces-38306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:43:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115C66F7BB
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:43:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fb0wWzRH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z7Kaeyd1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38306-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38306-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 088F63026CAF
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 07:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBB1368947;
	Thu, 11 Jun 2026 07:43:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37F367F22
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 07:43:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163787; cv=none; b=rDo5RSu5PCYIJzPVN2XQphs04yTBhttoTCzwipxGsLSwcDtOf7CQILxz4+4zrKiWvc3oP8Pps99co9IZdS/6lITr8RGDaUS2ebniHBDiT48OiUvt9b+Is7FtXgCNwN/EHWZBq34H+sghXfF55z4wrG5A99EB6EBEGo7qle/R5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163787; c=relaxed/simple;
	bh=IOTM6/ja/nNLrYOml7RQfuRoawhKhsynM7i6gT5F6MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5dZP0MeCgYL6Rb6TmuAzTVA7HZkWoOKfyT06+uJRsSnrRO2g4Yl77OKejQiiXD1jTAhDQsFXsfgavcsCBIJ8RAaSU66HscUOU6d6n4sq5bUcM1v8AVe2NA+tF0Dskk+wJ3+I2go5dpRKxNTsgm2VmYqb5nneRvzjmQ1grohqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fb0wWzRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7Kaeyd1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GEPf3724528
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 07:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=g9y5r3EegwzJ0DbLaHWGr6wmP+IPN7gOTFg
	TIQF05/s=; b=Fb0wWzRHjNS9KCsViCFc/ve/anM3Z1weJuLQjKMf2gqxoJ2/ofF
	7xI0Bucm04McwHt+y1nTX8PvTqv9lTlx862RMO2I+O3bC8zdAlFzvVw+l2f1WSm2
	78dcbo50uIDQEQbNiciSXeFWdKrFMBM7NkgUG0idtLNQ+Ofrg9sucubFfy9T2DSG
	neMS4OHVTaqNpiMADG4qd9hUk73TQUHSOLa5TNDte4ley0pwT8rbMCrXsf1SlclS
	5+54SZRA/PF1Dzd8uZ+XBN4MiKVgIE5M5q6JG7XuJnxCzSae5ZcQK6IVQzcp0cbf
	80Z3IaZrEzOsq5v8wvF4vT+hOsbKWifQXUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6va72c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 07:43:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51776d4355cso16997471cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781163785; x=1781768585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9y5r3EegwzJ0DbLaHWGr6wmP+IPN7gOTFgTIQF05/s=;
        b=Z7Kaeyd1vjC8Xn6CPv2iLJQcMxjJ4JlAkwi0yUfT9K0mXai/LyMINUmhTJ95AoquWo
         6seix9N5+XhawqazguKbHfNxOz16NjadmjWQydU4LxPhmCFvjDy8t9b6GVF4+JyuLwfk
         32z74wq/wIvBGw/s9nDSPTfzgKMTIIGQRmWTl2tAm4tvSWIdDLJuZWT6Bsumx6N11Xri
         kETQObLNQrWS+U+yY6hZTOnKuBTjWSdG9Gyerrr0a+cdOzTB6EJlYedHM9Pl4JdvSWUF
         HNFXcIzJHrDTYHCNWGL7MVLW5CWQ+SWfOiGa+Kfx3XnfuPFnIr+Qt38OrVzy62lRfhkz
         BmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163785; x=1781768585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9y5r3EegwzJ0DbLaHWGr6wmP+IPN7gOTFgTIQF05/s=;
        b=IYrXXcAKxjUFwezriVryEDmFcVcS/UIu3G7+qVUK+efCzFk5APA5PWRYp0HXF3pITJ
         nUEiraSdX6pmQBWZc7Pd02ARtnRUWacePcLy8o4Xh+P1neNfQWyRrpWQlP0GiKU5FTrG
         Lsv+nHJenkJMzAsFQwQxQ0BI2OY6MX5thhkIBd+jZBP++PkprQd1LGjNwkMQszoz/aLM
         RxyuXjsJMA6+dvhMHhoY950NCIGzBGrg+AlnqD12HQg9CdTsV8+wFrIvJfpzVijuhERs
         rlNuHO/aCwVmo4YH+rgWTiPUclh2MWsM5ubk6KGB4eCO9Ei/L/r/jNki+/7Xhi+lbrGv
         6Bcw==
X-Forwarded-Encrypted: i=1; AFNElJ88XHa1jLsuRNhjWR7RpHXpQed5dQM0C1ZgQHZQ5rc7h/epLrdymlZDFo8JK7I24QGmGqqtZ37HWZAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8loiLqOpV+VJHGP9oDfyVt+s0EeBuI9vAfphrJK3vho2y+wOh
	sbiEQieNznUWzQBw/pXWXmGGf4Nhe0/u0ZqWruCQY69cNBTIy1mBYNKiuEZhjBnn9zxiWHWKmte
	M1+aQyFv7BiXoc/Aj9wyqCYWIfLuD7XVQUKD2qwqzfvMBvp+Fe7iXE2pFlUlF5ZZ6
X-Gm-Gg: Acq92OG063SUyxeVsuw9+dvwQXeDwk5by5uF8OBXQjwKqCni+ltaEzWc/XYt4okEI1M
	2L2arVHfx6NaJIqmKMUlVnWua+ETYY4QvrOoeWBz2xwgiUkWcIfUE2J3inWhSIxB9oagzDAK5Rf
	9lZN9Z20WRjIkSmoqCdm1bZ9uTc96m4XlG8sMyuM8TITu5GGRUM0m2J8+Mm9RZJy7PvzFZ/Yplo
	uxPp1g0mDHKKApMCk9JfyoW02X/YUM/Is7UljV5ls8Unp0B2j84tMkvmW4ssz7iHAElZnSubmOm
	QalEZUEbkwKebtcoop3Y4J9/gbnbCwRK3F+xl+zbP4EJXP23+LcDtnq00Hi2Sa29h13n2gtDuM5
	DPxtUkqkfXu3zRrQc/KJGGjfpljbPFOBslEWO6RaBDi/mMvyFKKfs7djI2XRv
X-Received: by 2002:a05:622a:15cc:b0:50f:f030:920d with SMTP id d75a77b69052e-517ef10ebc1mr16101781cf.30.1781163784661;
        Thu, 11 Jun 2026 00:43:04 -0700 (PDT)
X-Received: by 2002:a05:622a:15cc:b0:50f:f030:920d with SMTP id d75a77b69052e-517ef10ebc1mr16101291cf.30.1781163783557;
        Thu, 11 Jun 2026 00:43:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:27a4:5f8b:adef:25f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm78651498f8f.9.2026.06.11.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:43:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.1
Date: Thu, 11 Jun 2026 09:42:57 +0200
Message-ID: <20260611074257.5012-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Lb1eaqPIGNvfo4HVEmT7_Mb6vXBhapZW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NSBTYWx0ZWRfX8W1ZpQ12l1br
 947R7GpRENfzaJ6IJhz3knLVLDnEWtwSgDSBQ79ue9hA6ZYC3nlGoCiMRUr/Ewxvkfu3BF22+KJ
 08dWVoJ/lvzkY4x0GWyQ7CfcRx65psA=
X-Proofpoint-GUID: Lb1eaqPIGNvfo4HVEmT7_Mb6vXBhapZW
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a6709 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=G_6Mr8iXvoiWq5ui09gA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NSBTYWx0ZWRfX37RdhADrGX7M
 TERTsmC9DXHikPHr/t+ldPuy+PQO2ktobPMMwmjSXuklx8uXJDqL+VykTzMvIyampgOWCN0aT/O
 hRE9K58t1P/XZC6Ogz7So6UYOR3iSxquFH85z454UkAaZkW4/x4blhYXO8tKfNDxMsfST0mbngt
 1027Ssnl1wKa9I7GBnt0w6GRzqVyJkP25VkQjKVUsltRFNv0RFd4y15z4scn5VHjO/mJLXXnFNe
 wbS3Xo3RhLpJOg1+ydH5KoNe2tRpcz+a8NQxmHLhlGBfbu6TiwWXOy0nPNqQzpULvCWV3ekbpSj
 ISUS6fe6IYTZW9oAb39VDfzuO8p8s4xuFyK6GzhmuERb5S850qWRVK2GbHEwoKF5A58bNSYj+Ml
 SKlTawKWbmvhGoJBwD4MU+ccyTnYDIHjd+YW8iM0jTt5BCfvOHe45Ss9qFr/6F9GypInXBFKk9j
 QoOoqJeNvfvQ+s7AeGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110075
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-38306-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3115C66F7BB

Linus,

Please pull the final round of GPIO fixes for this release. They come in pretty
late but are all tiny and mostly in individual drivers.

Thanks,
Bartosz

The following changes since commit 4549871118cf616eecdd2d939f78e3b9e1dddc48:

  Linux 7.1-rc7 (2026-06-07 15:37:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1

for you to fetch changes up to a23226b7c1f69eafd9ced4e037fb51c9758c0501:

  gpiolib: handle gpio-hogs only once (2026-06-10 10:12:57 +0200)

----------------------------------------------------------------
gpio fixes for v7.1

- fix NULL pointer dereference in gpio-mvebu
- fix runtime PM leak in remove path in gpio-zynq
- reject invalid module params in gpio-mockup
- fix generic IRQ chip leak in remove parh in gpio-rockchip
- fix resource leaks in GPIO chip cleanup path on hog failure
- fix a regression in how GPIO hogging code handles multiple GPIO chips
  reusing the same OF node

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: fix cleanup path on hog failure

Daniel Drake (1):
      gpiolib: handle gpio-hogs only once

Marco Scardovi (1):
      gpio: rockchip: fix generic IRQ chip leak on remove

Ruoyu Wang (1):
      gpio: zynq: fix runtime PM leak on remove

Samuel Moelius (1):
      gpio: mockup: reject invalid gpio_mockup_ranges widths

Yun Zhou (1):
      gpio: mvebu: fix NULL pointer dereference in suspend/resume

 drivers/gpio/gpio-mockup.c   | 16 ++++++++++++++--
 drivers/gpio/gpio-mvebu.c    |  4 ++--
 drivers/gpio/gpio-rockchip.c |  4 +++-
 drivers/gpio/gpio-zynq.c     |  1 +
 drivers/gpio/gpiolib-of.c    |  5 -----
 drivers/gpio/gpiolib.c       | 10 +++++++++-
 6 files changed, 29 insertions(+), 11 deletions(-)

