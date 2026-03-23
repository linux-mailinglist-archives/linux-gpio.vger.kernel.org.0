Return-Path: <linux-gpio+bounces-34038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAjrEl1nwWliSwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:16:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200E2F7D74
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D936C30E092E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 15:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA163B6BF9;
	Mon, 23 Mar 2026 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mgU9aFrC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAB3B531A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280290; cv=none; b=lTM4+O/ku9bcXYahkG1E+b7oyKe7EyvxpqYBL0dAxr+zSgPCCEXNW/MXVoi0UO2dh1Rp3D14efb+BDhg0FBBvLQuW/QFJGSM4od6BY+QYmFfwEz4fnfBwlaM2appmJrJ3pymbk/CgrkZ2sHtNC2Df4Ruym1oWDeolhe7GovFql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280290; c=relaxed/simple;
	bh=vToF1UbNvL4l1OkVwlOI7+XcnxHkjKZMzjHswh/EJ+k=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=MzUK1iiTsUvks1hhL4oMgGyXFFRX5A1eZ5vkVBUS5hWLP/BCIXfOmlAFSO4wQN3gk0lEe+M8CVje6Zeg/qnrXbb+80//pzvi/m5pcEXA1hOgYvBbvMKRY9AWMTP+7v5xlTgC3HtXjpmMpADUwIbuYwA0EjG94f0PCO17k/FAa9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mgU9aFrC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260323153802epoutp039f4195fc5430d2236bded3036116a350~fgoQ_fAhS2213022130epoutp03Q
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:38:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260323153802epoutp039f4195fc5430d2236bded3036116a350~fgoQ_fAhS2213022130epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774280282;
	bh=MYU9K1BczlLtBMfJPDu28QIk9pzoA+hXl3yf17nC2HI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mgU9aFrC+5Kx+21CCBQ48vtUtevP0XGV5aHjupTGFTw7s0wbx2FYZ7piHu2gEGNx9
	 7FiJ9iRzTsn7N6OtZVcQFwqx9+/yRy1FbPgDJReQh76dJWCUi3xQdbS9llr9OgF8ia
	 3KFTDuksHm5/ZDwJUU6SICm8wW+RY1yai4quNiMM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260323153802epcas5p1bb1e979594c5257c037cdf6411e7a177~fgoQZrLX82373723737epcas5p1t;
	Mon, 23 Mar 2026 15:38:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ffckf0KMvz3hhT4; Mon, 23 Mar
	2026 15:38:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260323123542epcas5p349d0e7c45d02ccaa06c84dbdf1777126~feJElRtj12139221392epcas5p34;
	Mon, 23 Mar 2026 12:35:42 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260323123538epsmtip2099c850de3b514ee4ac3f5a0092dd02a~feJAkDKG92361023610epsmtip2P;
	Mon, 23 Mar 2026 12:35:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Vladimir Oltean'" <vladimir.oltean@nxp.com>, "'Martin K. Petersen'"
	<martin.petersen@oracle.com>
Cc: <linux-phy@lists.infradead.org>, "'Vinod Koul'" <vkoul@kernel.org>,
	"'Neil	Armstrong'" <neil.armstrong@linaro.org>,
	<dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-can@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<netdev@vger.kernel.org>, <spacemit@lists.linux.dev>,
	<UNGLinuxDriver@microchip.com>, "'Bart Van Assche'" <bvanassche@acm.org>,
	"'Peter Griffin'" <peter.griffin@linaro.org>, "'James E.J. Bottomley'"
	<James.Bottomley@HansenPartnership.com>, "'Krzysztof	Kozlowski'"
	<krzk@kernel.org>, "'Chanho Park'" <chanho61.park@samsung.com>
In-Reply-To: <20260323115848.ghdu4sbk75tvggfb@skbuf>
Subject: RE: [PATCH v5 phy-next 09/27] scsi: ufs: exynos: stop poking into
 struct phy guts
Date: Mon, 23 Mar 2026 18:05:36 +0530
Message-ID: <1891546521.01774280282025.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJoz1sM+EbPjkyDopxrfJVWkMJWdwI9AyWpAaSC6pgB9ZOp/gJXIgBltGJxFXA=
Content-Language: en-us
X-CMS-MailID: 20260323123542epcas5p349d0e7c45d02ccaa06c84dbdf1777126
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260323115859epcas5p10177db12a2e8aee9578271ff1411137b
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
	<20260319223241.1351137-10-vladimir.oltean@nxp.com>
	<yq1a4w3l04g.fsf@ca-mkp.ca.oracle.com>
	<CGME20260323115859epcas5p10177db12a2e8aee9578271ff1411137b@epcas5p1.samsung.com>
	<20260323115848.ghdu4sbk75tvggfb@skbuf>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34038-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0200E2F7D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vladimir

> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Sent: Monday, March 23, 2026 5:29 PM
> To: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: linux-phy@lists.infradead.org; Vinod Koul <vkoul@kernel.org>; Neil
> Armstrong <neil.armstrong@linaro.org>; dri-devel@lists.freedesktop.org;
> freedreno@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-can@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-ide@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-
> pci@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-rockchip@lists.infradead.org;
linux-samsung-
> soc@vger.kernel.org; linux-scsi@vger.kernel.org;
linux-sunxi@lists.linux.dev;
> linux-tegra@vger.kernel.org; linux-usb@vger.kernel.org;
> netdev@vger.kernel.org; spacemit@lists.linux.dev;
> UNGLinuxDriver@microchip.com; Bart Van Assche <bvanassche@acm.org>;
> Alim Akhtar <alim.akhtar@samsung.com>; Peter Griffin
> <peter.griffin@linaro.org>; James E.J. Bottomley
> <James.Bottomley@HansenPartnership.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Chanho Park <chanho61.park@samsung.com>
> Subject: Re: [PATCH v5 phy-next 09/27] scsi: ufs: exynos: stop poking into
> struct phy guts
> 
> On Thu, Mar 19, 2026 at 10:15:17PM -0400, Martin K. Petersen wrote:
> > Vladimir,
> >
> > > The Exynos host controller driver is clearly a PHY consumer (gets
> > > the
> > > ufs->phy using devm_phy_get()), but pokes into the guts of struct
> > > ufs->phy
> > > to get the generic_phy->power_count.
> >
> > Ah, newer version. Would still like an ack from Samsung.
> >
> > And I hit the wrong key, I did not actually apply this...
> 
> I will have to resend v6 because of an armv7 build error I've caused for
ufs-
> qcom.c (which doesn't #include <linux/interrupt.h>, and relies on a
transitive
> inclusion from <linux/phy/phy.h>). It would be nice to get the ack from
> Samsung, but I'll send the next version in the upcoming hours regardless.
Will review and possibly test on one of the board later tonight




