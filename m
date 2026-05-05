Return-Path: <linux-gpio+bounces-36227-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJMmAMcV+mntJAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36227-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:07:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE74D0E23
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA13230E5B3D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 15:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047B448B381;
	Tue,  5 May 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Bo0T+uYt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7148B366
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996733; cv=none; b=J8E/iyBrMuMZuXYW+9uQsRDEPR+VJsmWANrlrRt0I2CfqK9+X8qQYlECNFlOqqlovmEoADAhRN7zjKIrmj+oLL6lJ0RPciG+m9wQw1MCaTvYK4ov303ZfPSAz6cIwp5v2XTEgkXA37lPX7/1GLQaa3AKRFBmKmNXRAUz7Or+5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996733; c=relaxed/simple;
	bh=J84KpcArs6vG8jkcaA8eqYNE61DrVpr3S1BqehpaogI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQFpJOuN4+wH19tjNG5yRekZlXquKbpb3f+llOi8EDM0uEEnfuxNMi6uMOaIjvIyz401JNRl3Vn+qc79+7Arpf7YLICULFN31ngZQ65SmBppxa1lzjrJgU3fDkretRYHgX3H0fmMgbenuLkZ0K+gXmNfjdDsCv4lUBsz6JymEzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Bo0T+uYt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so44081715e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777996729; x=1778601529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
        b=Bo0T+uYtRK7qzCXjEG3X7Xtxbi0zVegst5mQqt045lBgootaHRNsakmETF2OvOIqRH
         SiERBZDmYy0zmbj7hfj/2yMZMxWd5GEeGXYJ6RNMuMAO0XOLy0tIA/Hj9l0fbiPzuqla
         FpX4JZlutMh3cqH2Rjfo+WYomdT1M8uzLHhtMzvXDu1KYE9r8aMNuXReyCfT2VbVfLX1
         IbYo1QmAQeh1aufH3LfK4WoXWBXcGqARcNIXXOyG84cXbrw4vVqVNqIjiidDrsbmgfDP
         mq00/J2YQDL3W8RVPArxjMrdH2yO7PWsSom2FY3i+xQ6Hpq+Byt6BYdIG6PEOsh2stSK
         G6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996729; x=1778601529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
        b=mQwx7JJuKe2rg2p8l+p6VVU44Pn0Qu8p370ZefjB8ZtYrDMmvREPNA2QUXBuUK8tJ2
         EheQNChpNXqKKKm9Ta7PjB0T53ts654IjGYgkgKRxzPFHVddQ45J4iWlZJEvyQlv6oFT
         +77ihKHsKlqUny8x0Hn0Z4x2TdIsuTPRCaKH+YxFHj9FJ0OtGd0yp5AID+BcRxRD0RPI
         fRrqbTljrD4e7u15RbUrmuKyCu0/5xgSZ7AMPGpgxwnD6mkvTSgdsERiLv0JqGZVgSMs
         JK1Xm2KS5xHe2gBb4FM3h/pFwilPkKxULMH2LU1HKHeyeI0glFlOxhbDt4PPPVJc4u2I
         L7fA==
X-Forwarded-Encrypted: i=1; AFNElJ+lCiUB2dTiC24w3xOgEpt5lPKH+nZDYCUtyy9CFbkX77y3/VXx4bXnn2z33oxAgLwwMHSxilb8nPFf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1u6qIw4aSID8n0x/puTvmeWda/UhvB64bVj7fih2hAaQLxyy0
	MsWSsT7j7EGvQt4HVwCpPpYPIbnHzbqtv3Q4+WQK8n2DfXpesmz4RnRPYX8mgpkUdoQ=
X-Gm-Gg: AeBDiet7tFLMwfkRzwNImKTSM4Klclpaqqzha9JUGiu3xs+m1zddXuBhKv0BgQyVsJg
	bYr/nvbKEdCLetSKzg1JZB9DjaCcsIaJY8szwLi86bHZNsUhnHnVSJhHskiVNZHmiQGbG7imClF
	ZgLTlz5ABz6TR/oMA4Rp9IyNBDeVz2dAQ8AK9x2Mhj6blpP7DvTJ+ZXkflULw7B+ool/7n2IVcV
	JQ6RwL0MeOKPDuHyuHh4wN2wN+5srt2dQzPsGEtfiPD/G0F2J2CTrFh10qv8oO4cP5XIDK0p+l4
	uJIGcMU9IvMFSX2Hu9bQB3HmUkSqU3Mk3Br3sYEDKAtCc6PstcRmr6aL///TlVYuu8/y/voQ8FY
	Ls/8vev4Jxuh1CtdcbikvjlzbbKZo0udA3t1k/3vsUHJt+9SX2PYJlVjXVl+Lrgru9/15Pqrnp6
	nc1qcAwZqD1Z/ZdHtgBgCictLEsf/UG32yqXI5Nyt4CZzCNu++5hp9+AwH8zmHxLEYAnH6l0K+u
	/ucXEqQfvwAXueXFui8HBMX52wH6QH8xvNB7cTk1+4xBPK+2LymikxA3fAyrYiCzQpyBOTbH8Lv
	K/h8SPg3jG5HHdj4U1Y=
X-Received: by 2002:a05:600c:528e:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48d18bde33amr61483785e9.13.1777996729166;
        Tue, 05 May 2026 08:58:49 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm444582355e9.7.2026.05.05.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:58:48 -0700 (PDT)
Date: Tue, 5 May 2026 16:58:45 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode
 for 10G-baseR capable PCS
Message-ID: <afoTtdAO23DhOeZ8@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-3-elder@riscstar.com>
 <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
X-Rspamd-Queue-Id: 86FE74D0E23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36227-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspen.lan:mid,riscstar-com.20251104.gappssmtp.com:dkim]

On Fri, May 01, 2026 at 06:50:45PM +0200, Andrew Lunn wrote:
> > +static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
> > +{
> > +	int mdio_stat2, ret;
> > +
> > +	switch (an_mode) {
> > +	case DW_AN_C37_SGMII:
> > +	case DW_AN_C37_1000BASEX:
> > +	case DW_2500BASEX:
> > +		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
> > +		if (mdio_stat2 < 0)
> > +			return mdio_stat2;
> > +
> > +		/*
> > +		 * If this XPCS supports 10Gbase-R then it will be the default
> > +		 * which prevents 1000base-X and slower from working correctly.
>
> It would be interesting to know if Toshiba messed up the integration
> of the PCS, or there is an errata for the licensed IP.

I'm afraid I don't know, but it looks like the issue is not unique to
Toshiba!

This is a discovery which, rather to my chagrin, I only made after we
posted the patches (thanks to a hint from Sashiko): there is similar
code in txgbe_xpcs_switch_mode(). I cleary overlooked that when I
originally reviewed the existing XPCS code. I suspect I stopped
scanning that code path due to the PMA related conditional branch...

Regardless of how I missed it, txgbe_xpcs_switch_mode() implements
similar logic to this patch. I think it is using MDIO_PCS_CTRL2_10GBX as
the Reserved value but otherwise looks similar. There are comments that
imply 10Gbase-X isn't implemented by their XPCS which would make
MDIO_PCS_CTRL2_10GBX reserved (but are too vague to be 100% sure).

Right now it looks like xpcs_switch_interface_mode() and my
xpcs_config_operating_mode() are more closely related than I realized
so I plan to move my code into xpcs_switch_interface_mode().

I don't think I can unify the Wangxun and Toshiba code (the waits and
resets in the Wangxun code make that too high risk) but I'm not yet
ready to give up and just make the Toshiba changes into another vendor
quirk!


Daniel.

