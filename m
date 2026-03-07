Return-Path: <linux-gpio+bounces-32732-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DghO1JarGkwpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32732-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:03:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 700FE22CCDD
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F306301A400
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 17:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E84E32BF5D;
	Sat,  7 Mar 2026 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gjzd2HMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8F33260F;
	Sat,  7 Mar 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772902991; cv=none; b=da8QvpP3SyXffvXTFdLXQuJfmeC8DpmAX8TSSix/zWMfV19h58TI5nh5JA1quNIGkOnwsnd8Ja7xIlvQE/ivMi7k5fTN2/zQI8k1V2fvQGWCiRveu48EnZVdZcC7cPGQuB34YrO1rVDWc789oX2HtknIWMVmB/QilRB3vwiiXrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772902991; c=relaxed/simple;
	bh=wvkD7PmKVor5qWsXU1Wx/LvlXnzQBgwJVQXNn1GZpwQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTTCtwnY+GxyWyFaxVKQa/F1oKt3s1eLG2TyasQWxq5sqF04LooMAVuF19X5LE3+TeI8XFC8lWoiO0c3bxooE46Vveijuh/HPOE8qByKL6V8XLzQ7pBQv/NS013qc11HpMRfouaAaRF/F7KaWFKnDhhzFhjTae9SqzfnsZtKdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gjzd2HMN; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772902990; x=1804438990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1hUeG+gVwGZ+FlvP7RVlGS1em+6sgkvmyaJZpvZ0smU=;
  b=gjzd2HMNAorf/Yi4LTf+UUTPkg352NLcapAx+XZHvyCB2qEfNjTt8n6m
   9drHubLmDbrmGY7ke48iyke9w7rGjNTOjvI8uMoMHe0ichkCJVwYf+U9n
   TmZNx/e5FftxoPvRiV+ZeEffisy+RiSX4hqWywSA5SiBGbd40M0XMuIWS
   d0ZBKado3mB7IfpQQKza5hUrAyoS/P9U056TnJ0eL5UTpFJu1uHE9+VnA
   +vPeZZenV/Ozwh8RQUxW1y/1FKFzvc00CChMgd61p4jxiqpUrn5+Js4cJ
   E9i7xH8zHndxQ8XoIezTKD4JqU9Jh2klhLsKaH3HFRAFQ/IFlHGN8jCV9
   Q==;
X-CSE-ConnectionGUID: p/xIXsQST364+iGSnRxPdw==
X-CSE-MsgGUID: 1NvykfWVQX+xs2B53pblRg==
X-IronPort-AV: E=Sophos;i="6.23,107,1770595200"; 
   d="scan'208";a="14412486"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 17:03:10 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:14680]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.3:2525] with esmtp (Farcaster)
 id 116db2dc-68d6-4730-9bfa-64f7924d15c4; Sat, 7 Mar 2026 17:03:10 +0000 (UTC)
X-Farcaster-Flow-ID: 116db2dc-68d6-4730-9bfa-64f7924d15c4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 7 Mar 2026 17:03:09 +0000
Received: from localhost (10.119.200.184) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Sat, 7 Mar 2026
 17:03:09 +0000
Date: Sat, 7 Mar 2026 09:03:08 -0800
From: Cory Keitz <ckeitz@amazon.com>
To: <dumitru.ceclan@analog.com>
CC: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Julien Massot
	<julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, Niklas
 =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<mitrutzceclan@gmail.com>, Cosmin Tanislav <demonsingur@gmail.com>, Niklas
 =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH RESEND v8 16/21] media: i2c: maxim-serdes: add MAX96724
 driver
Message-ID: <aaxWATynXaVFglvS@bcd074ae11bb>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-16-7b8d457e2e04@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251208-gmsl2-3_serdes-v8-16-7b8d457e2e04@analog.com>
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Queue-Id: 700FE22CCDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32732-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeitz@amazon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Dec 08, 2025 at 04:13:08PM +0200, Dumitru Ceclan via B4 Relay wrote:
> +static int max96724_init_phy(struct max_des *des, struct max_des_phy *phy)
> +{
> +	struct max96724_priv *priv = des_to_priv(des);
> +	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
> +	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
> +	unsigned int dpll_freq = phy->link_frequency * 2;

This unconditionally doubles the link frequency for the DPLL, which is
correct for D-PHY (DDR clocking) but incorrect for C-PHY. Per the
MAX96724 User Guide:

  D-PHY: "Clock freq is half; Data rate is equivalent bps/lane."
         e.g. 00010 = 200MHz DPLL, 200Mbps/lane data rate.

  C-PHY: "2.28bits/symbol."
         e.g. 00010 = 200MHz DPLL, 456Mbps/lane data rate.

For C-PHY the DPLL value equals the symbol rate, which is the link
frequency directly. Should be:

        unsigned int dpll_freq = is_cphy ? phy->link_frequency
                                       : phy->link_frequency * 2;

The same pattern exists in max9296a_init_phy() in patch 17.

I've tested the full series (backported to 6.6) with the above fix on
SA8775P + MAX96724 + MAX96717 with C-PHY 3-trio @ 700MHz.

Tested-by: Cory Keitz <ckeitz@amazon.com>

