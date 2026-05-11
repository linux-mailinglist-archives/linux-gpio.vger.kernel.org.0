Return-Path: <linux-gpio+bounces-36527-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LxXAFW3AWr2igEAu9opvQ
	(envelope-from <linux-gpio+bounces-36527-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:02:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E006F50C6E5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11EE33007215
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1542936404E;
	Mon, 11 May 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvffCpGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecIivv33"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2F33B969
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497344; cv=none; b=WBXrGXKMdurjudvWZXmoieP21F2MVEf8zNjpYRyOt4G1iEouDahD3SG29luV0bsRCJWP1C56FKRyo082GUb+sA0r9BB+IRXHH8b/pfoeBxQM0aigf1XXmPI+Q+GDtVeInGhBVZ76tTKlEgt38UKgGMFjuAq8V722cNTtQKqh0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497344; c=relaxed/simple;
	bh=tTNXMZH6Ae+7u/TjfyIMvdzqq0hdS/+lhtAgJD0DOPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRHsNzYWNbf0lZzMeaOUA1sxBqgdpYQpZnPC53ELc5rh06i6MbaSaj9JcWUM3G5MFLNalAcUslkEAJLPYplObJly0+DSWDUMXANLPOa1IVkzOBxlYmt7w+aDYPD9cbQM1Anc+VPSiP6mNjeqPLwXkyjP8KHdcGBGjyI6LC6YNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvffCpGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecIivv33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FIOA3332665
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+g
	ykgxHWXQ=; b=AvffCpGgIyC4GPNB+NsO/7GqsYPjpKtpaDnvWyzJsXXHU2V8MVj
	u6NJiopbN8d3rn3Pb6mZpErVt4hulbzaPob2+Ymgc8YGqXgJEqcLkbee1Q0N5nVB
	sC30wU8p5ypVBbJYDhfJgcsR1x5VBgpcBiQzHdSHJdVymSXEUcaxfWKiAs69oHD1
	uX9NcKp5YleHe2O1D4Z+SelyRvlYkQomvH7elqgnbYR/f9QysOUF0yLK/1qpU0B8
	OyO+dgirOSmkA2rJEyWMZlKcUs84puxBy/zHCWYSBjiLNWTxnjGAJA1zEFiyOsgm
	ZqBquMHFEUKk4AWBf7zjTG1ugAxSibri8aQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgrufu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:02:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6967b799acdso8036135eaf.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497341; x=1779102141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+gykgxHWXQ=;
        b=ecIivv33XunAofNSIxlBPAvQfTP4eukYK7c0Ai99cmduzWuqtU4tSqMqoJ7De6lae3
         2lzHVHgwLDgvcbFLtGfbXnBuaoB5GojP0OU3nzIM5uWu/cPrcrsdBqyQCCjTAoKnPLxw
         1HXWxKJIjKgfdHswfTYrS5lXzFZt6EZEXxAsjdm3jucjp2rvbvIzytsXwQlz11Ron39A
         8DT6+UO0m3wkAljBNSJtGvpaHnbqbV5qo4WZ+TTSDRHBJW4s/HpoFj0rYWsl8KMfQQZm
         RhIp1KK7Zi3adUhqxBRQgaAq1aiQlz0/Ie+Il4aPP4zFZ0IAtBs+cvgS5O/CjfWzF7BD
         WxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497341; x=1779102141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+gykgxHWXQ=;
        b=Cd/9kS8JYP9RnYOcEi/6MuJfRcKw0z43uIGMYEUQAzFey/WXUGeomO+HAs4N86770Y
         nDEkrAX+2n1bYqSkjUPdneOjArAD7D0asJgm4zkkhkba7RRrrQcH3VuA/RSCShCvc7Ob
         wABfAKIFJ45w1bGeexXRvYxn4Kd7Zv4swlcsTenzg5IQyJAm/zdvMExfmChmaqrFoVtc
         0EMjNwDmQGR3A8HrbIuYqYQQbdY3x2dVqCTCH6ExzPE15hDJbu7ZiK9Or7XWOFBA1ruZ
         2x8vij2D0+dTd2qtfTWR3I54vk4oju17sRDMFDBKCj4XcuiPlgbAE4QpiJVw1v+NDluT
         yDXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+2BtOOwnwHNlzlvoyHT9TRacyo1WWgn8foIg6pEpZBOLJKew/w5LtkENo75ub1mBNMFWkRkxjWzZE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkh7ot3uaZ/UKuc8IUeaNzkdowQBpYCXX9mwTLDVwpywvmxaOV
	6uJnBFzxyGkrFA7uckZyhWdwWxoO0CBUeYCYR4CQyRRbb4DpEFwqDvH0AIuL5hWgihaV3HNA/G+
	Rt2qhqrH9iobSMDgP9GxySonPk1c8wGRavUFWH9OJkfDh1C8h4lxMqBP7p3qzUOPq
X-Gm-Gg: Acq92OFMXdb3qLPK7qM/5iX6jhG2WSLgnBTJDFjrIP5pvYRM2MLVvzM0E42ySKJJ81N
	e+8aLMTDbCxqd2aPf5z4P6GC/iCXIr+M8vJtVGCC3E+QrQz6XvRCAYFiH9KWdZqv9X0tAHHhhx8
	slQk+QhHUtWXVWlJzpwnckkJyF/a7cTpeWSXWkiWve7UbxnNIi1No9tWTC2PFocLWmezUnuc+AG
	NYicAmP/6yoL1RuWgqwaXZ9gggB5/jQGGQi+hCe+cw3rxIQZvWMZrlfaP4eGG2b+hH+dmFFODqQ
	THBhuaJBQlcL01pMNzLrtPKN2KPnfqNH8DuGDVk7BFmIPJBpL/J4wCQsq7PXeGjXm7WT4j9RpfN
	8qm60YZtfftu1VUBmucSTGAOxCHwR58M5HBOf0l6hHJ+Bkt/p/hz4BbSLCVgu
X-Received: by 2002:a05:6820:160b:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69998c8fed0mr12284330eaf.8.1778497340844;
        Mon, 11 May 2026 04:02:20 -0700 (PDT)
X-Received: by 2002:a05:6820:160b:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69998c8fed0mr12284298eaf.8.1778497340436;
        Mon, 11 May 2026 04:02:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm109967955e9.0.2026.05.11.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:02:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org
Subject: [GIT PULL] Immutable branch between the GPIO and PCI trees for v7.2-rc1
Date: Mon, 11 May 2026 13:02:09 +0200
Message-ID: <20260511110210.46711-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01b73d cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=OnGjS8KU5By8L4kgiv0A:9
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: uWOGVuSHNLBYF_cPNp67MUEXGJm3TFz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMiBTYWx0ZWRfX3SSKhg37RMjy
 zxtlGZ6Vt5BmktN6cwWrwFbyVADPgr6Pmn9klFLweaEGLVkAwU9xOQFZ6ZGbND7MRCDQ3LCXozs
 06qb6j8GCaMcW6cJxvYvUwCQ7GEx3zt2JhuvZ2KErEwyH8+ay/slQtlT4rs4TmDIGxHaEuTnih5
 RDhF9ao7nT6vWXuQ/+BnaHXqcG731ul1OB/5MmAocCGxNYDu/fOI1BOJXUj8wzSgxlOFyUf5R8J
 FYdAN+YEC5gNs+7hqhdNPDlGFms3J8a0vK4rULGBvI59AaBC40/POPCXJgc1oVXyGxffnxnMlWt
 0ufejKm0NH9KlP4jadMP/wHGo2zUSUiywEpd2qdm95Fgq8e+00YmBppCjjLM6cO8bMv48wlsCNj
 fqIq/sY63aojMcxRZaq2W0t61LtXWaOR7e/egcFPaZDxNOMMOgUoyGqbljvgTCu2//GYy96SUAl
 PP9vKUT1JA7PSGaeEyg==
X-Proofpoint-ORIG-GUID: uWOGVuSHNLBYF_cPNp67MUEXGJm3TFz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110122
X-Rspamd-Queue-Id: E006F50C6E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36527-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: 

Bjorn,

Please pull the following changeset adding a new helper to the GPIO
consumer API.

Thanks,
Bartosz

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/ib-gpio-add-fwnode-gpiod-get-for-v7.2

for you to fetch changes up to 8a46bd2638f1ad6d1ed73dc3ab10919e67274738:

  gpio: Add fwnode_gpiod_get() helper (2026-05-11 12:57:48 +0200)

----------------------------------------------------------------
Immutable branch between the GPIO and PCI trees for v7.2

- add fwnode_gpiod_get() helper to GPIOLIB

----------------------------------------------------------------
Krishna Chaitanya Chundru (1):
      gpio: Add fwnode_gpiod_get() helper

 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

