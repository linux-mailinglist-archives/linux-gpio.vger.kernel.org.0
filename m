Return-Path: <linux-gpio+bounces-31530-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGtMLbXhiWnGCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31530-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:31:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194210FBAE
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1385302336A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B539378D86;
	Mon,  9 Feb 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fGgrvZoT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1D36EAB0;
	Mon,  9 Feb 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643702; cv=none; b=KD8mANSL0rNvxZVCHGMVHs/stAY2hv0+1ICt9rroaiK5vpByLGBcDAPeitkO87tACE0l20ZOfP0TzUJmglyEVNLNZ71gD1YP9k8LEv2CQrrxf7yJBrCE80wOhCqjDHHrmYIBuRV86YRA7Ji3glFAeCO5FVoKSxwGQ/azkZPeDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643702; c=relaxed/simple;
	bh=TyHXhjhKIZ4jF+IssHH0ukgke8PH/IJg9cisxhd+Myo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPKyRn+qDa/HCKOzhZJ/irlQ/MFIyrSal1V0VuNtUvJPlWItQuPJPdl/8bxsB1OYi2pAyt1Ker+0WvbYKMRaAUId+WGkdCisSuUVTwqMeIcqWjHnYr/4taJW1v08RZ7Il2+m1i6kmmDt16cjAzXX+GCRQdZxL6ehNHEX9owEe7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fGgrvZoT; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770643703; x=1802179703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TyHXhjhKIZ4jF+IssHH0ukgke8PH/IJg9cisxhd+Myo=;
  b=fGgrvZoTluMcgUv2X45QHQx2IsrjN2GtTQ1ozt3AC5vzn/A30GVPCYbi
   6006Z38ANka7FXbenwIK09reSCX4ZHPeFw9Y8lnf8vo8+LvvOADi9Pjr4
   DaJwtYYjl2iJGFMtpbJnZl3OLolI1Y7f4bic4VLjRx+TYYaNwGBbSPG0Z
   dEm8mBfE2sYF99XT+VOpBzOkOuVYDt18Mw1o/wJ0x2TCJn8LC5b9iFqo4
   sKXYOADDRaUgcJVtxoeHdjo9UO/EUSPAsZeZ5UIfHj05bDqHcFAeLko19
   5JGzGdDqZvuOSox3ZwnraXUWdLnYo4mQTmpSSK5ctSz5r+MP3kBOPnReq
   g==;
X-CSE-ConnectionGUID: 62xkbNDBQQ69o78CWVJMmA==
X-CSE-MsgGUID: hsKOhGa8SmOnAx65M7ZSKw==
X-IronPort-AV: E=Sophos;i="6.21,282,1763449200"; 
   d="scan'208";a="53132515"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Feb 2026 06:28:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Feb 2026 06:27:41 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 9 Feb 2026 06:27:35 -0700
Date: Mon, 9 Feb 2026 14:27:34 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <lee@kernel.org>, <andrew+netdev@lunn.ch>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<linusw@kernel.org>, <olivia@selenic.com>, <richard.genoud@bootlin.com>,
	<radu_nicolae.pirea@upb.ro>, <gregkh@linuxfoundation.org>,
	<richardcochran@gmail.com>, <horatiu.vultur@microchip.com>,
	<Ryan.Wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<kavyasree.kotagiri@microchip.com>, <lars.povlsen@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<luka.perkov@sartura.hr>
Subject: Re: [PATCH v5 11/11] arm64: dts: microchip: add EV23X71A board
Message-ID: <20260209132734.i2yx3b3qjbeqd43t@DEN-DL-M70577>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-12-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260115114021.111324-12-robert.marko@sartura.hr>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31530-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,gondor.apana.org.au,davemloft.net,lunn.ch,google.com,redhat.com,selenic.com,upb.ro,linuxfoundation.org,gmail.com,linaro.org,vger.kernel.org,lists.infradead.org,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.machon@microchip.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1194210FBAE
X-Rspamd-Action: no action

Hi Robert,

Tested on EV23X71A.

Thanks!

> Microchip EV23X71A is an LAN9696 based evaluation board.

Acked-by: Daniel Machon <daniel.machon@microchip.com>
Tested-by: Daniel Machon <daniel.machon@microchip.com>

