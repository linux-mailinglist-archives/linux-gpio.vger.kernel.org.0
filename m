Return-Path: <linux-gpio+bounces-31533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA0cLIzyiWnGEgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 15:43:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347C110C68
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 15:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72EA301751F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 14:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4912837AA8A;
	Mon,  9 Feb 2026 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="MPb+5w+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6FF36828A;
	Mon,  9 Feb 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648200; cv=none; b=cVwyOBZcr49pN9OgSH/fON0R2PnW+XufyMwC5uwPpJMSRHTY75Km7aQ5Grtb4+8sLJ9uU9h3KOWjWU8sYpGYfh5zjqWzYf5IyoWZL+61wM4B5kyS9IxtirdMxUoEevEw0xY5BQoc7z2CLoO3mGhshI6D5YJ6xYc/WiEeWdFQOU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648200; c=relaxed/simple;
	bh=CsthQDxMaqbHWoPY9LcM4B7QQkY7QXBkgFtYZobMS/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv02xj567F1R7xWporwo1nXepo3kVeYlvbKm4xFWzKal5J76cmfcJwWZkch3tO9xEDE47dR23JO3VusmeB6xw+aIqty0SbhJSphjcHWeEea5X4spfYJiotSju1E8d/chFoosOPe0jc+57P7YGtF2JGeRtHl1n4RbaDwqwr/TpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=MPb+5w+p; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (84-231-236-236.elisa-mobile.fi [84.231.236.236])
	by mail5.25mail.st (Postfix) with ESMTPSA id 653A6617D6;
	Mon,  9 Feb 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1770648191;
	bh=CsthQDxMaqbHWoPY9LcM4B7QQkY7QXBkgFtYZobMS/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPb+5w+p0ov7fKu9479y8r6ViGMAqbmyKP8Rbj+tw9o5rvAe2iWbOiKS12fkEwZVq
	 +14ZwF8sqtMUSWMGGcO0kjXwMyBdpxA7fcS02OA13S7/MFlqneIHJxa5VbZFUcklqk
	 IIRfFwoxI2Jv2Gfe3HTiWK7JxIJ4w0/YutSWgM4Xdxvtq+63MScVDJTT5a5sa/KagL
	 WQmKdDSJIJ+a0Iu3XxP6EnCzcHTFp9zxq0Kf67KjiF3gr8NacMDxFLivNh42+gxkkZ
	 y/vdtETnUeRouLV+JRk0AQBlg5x/K24NLkI+zm3vdYE6bb+btwObM/f11Detz8ziPD
	 /Kg3+acK7mAJw==
Date: Mon, 9 Feb 2026 16:42:50 +0200
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Message-ID: <20260209144250.GC5376@atomide.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com>
 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
 <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[atomide.com:s=25mailst];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[atomide.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31533-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[atomide.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tony@atomide.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspeedtech.com:email]
X-Rspamd-Queue-Id: 4347C110C68
X-Rspamd-Action: no action

* Linus Walleij <linusw@kernel.org> [260209 09:51]:
> On Mon, Feb 9, 2026 at 3:25 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
> > To make sure I align with your expectations:
> > 1) Would you prefer the new driver to be fully standalone (using the
> >    GENERIC_PIN* helpers + syscon/regmap-mmio), rather than trying to
> >    refactor/export helpers from pinctrl-single?
> 
> Yes. Conor improved these helpers so now it should be possible
> to use these to do a very simple and slim driver for what you
> want to do.
> 
> >    Action item: Introduce a new pinctrl-single-bit.c driver and DT
> >    binding, which can also cover the existing bit-per-mux logic currently
> >    in pinctrl-single.c.
> 
> Sounds about right.
> 
> > 2) For the syscon/regmap hookup, is it acceptable to add a syscon phandle
> >    property in DT (e.g. "syscon = <&scu>;") for the new driver to obtain
> >    the regmap, or do you prefer a different binding/property name?
> 
> This works for me.

Great, sounds good to me too!

Thanks,

Tony

