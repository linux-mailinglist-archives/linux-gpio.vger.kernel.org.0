Return-Path: <linux-gpio+bounces-8504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF63944538
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C94283519
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 07:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B7D158521;
	Thu,  1 Aug 2024 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="znZo4/S9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cWHKJqGy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IpSEDMeH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NZh5BwP/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FB3208A0;
	Thu,  1 Aug 2024 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722496498; cv=none; b=dWsCiC9WLjHj/lWyad7Cunv3jEI1KBRcxkO8HtBUsln2r1lBrlbPezpIYfMlztcNkgel7KYmjNfgZiFGA5eoFULFLSQAcoRLqlE7Z2agbqCAti5+ieGjycoJ87CvQCwJCHBy7hOa/yOvN58EqIqDncfP8eGdBHsIY4M8M47/E6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722496498; c=relaxed/simple;
	bh=PKbFlZRPui/itAu9gbMKaJWeD/njLco0wN+xnme6Gjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQRRxBtdprOiH1fVC5UeyE5BHQhIS8/ZudiL7kka9u1tDLtxuWPSOB9lkS9PJ8v16uttfj1MRJjlPmezQv1yEVFK8y71JNjSl57aHo9/8qH9VZMU1VQTzbGbxndXhJQTsGJRyNw5DjSJEy5gcza+zZD3W2PeC8RaBsUrrEQViI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=znZo4/S9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cWHKJqGy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IpSEDMeH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NZh5BwP/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4FB61F8D7;
	Thu,  1 Aug 2024 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722496495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tkguNuk6AJYjWqNxhaNJuYhuO8sw5lUzgEEqXOvRcOU=;
	b=znZo4/S9t936jePDIoh5tfdkA4yT/uHqzAg9cK6MwVWkhcLJDSFpWXYR9VWlKVEKwyjxeR
	+76DiQIHBH1a/5u6eNIA3WP3UkOvF1e75Mod/c1nPwR8YXUqXslD3EM+1mrXfdBFPvPRbu
	Bh7UBHtzhU9qKDe44piGtmArCex3tUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722496495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tkguNuk6AJYjWqNxhaNJuYhuO8sw5lUzgEEqXOvRcOU=;
	b=cWHKJqGyQewgXNiXYyJN3G1Z81l0OAteD7nxv9/11FAy5xLQmsVMdwXkrVFbV/ouyIxBnw
	w02sEKcoHmvB+HDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722496494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tkguNuk6AJYjWqNxhaNJuYhuO8sw5lUzgEEqXOvRcOU=;
	b=IpSEDMeH5t3WV+mA7tHKjUMLRLBk+dyqIrUuyIcAsQVVhOB9Q12THWmVaC2Du8qz2+FvFO
	hXipU2lCh+h403WMzVkCsxBkknxA7hOgkExQSoMNulvgeiKKH/Vbsq4Rxf4za2qigmx3z1
	wD1WNUemREAB5CaNoUbcXvPo4mt+0yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722496494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tkguNuk6AJYjWqNxhaNJuYhuO8sw5lUzgEEqXOvRcOU=;
	b=NZh5BwP/PNlvkaYM98S8jMb3Kvd3E+AAPZfHYbuhl6Nvn0eZsRT6w40Jht+9RYxjyFHKm7
	FxfftGj7GXCCSzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEA19136CF;
	Thu,  1 Aug 2024 07:14:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fuBSKO41q2azegAAD6G6ig
	(envelope-from <iivanov@suse.de>); Thu, 01 Aug 2024 07:14:54 +0000
Date: Thu, 1 Aug 2024 10:19:08 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	wahrenst@gmx.net, andrea.porta@suse.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Message-ID: <20240801071908.ucwxwjiids5lxuox@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-6-iivanov@suse.de>
 <a4fe3edd-07f9-4bfd-8a6e-c96175ddcc8d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4fe3edd-07f9-4bfd-8a6e-c96175ddcc8d@gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,broadcom.com,gmx.net,suse.com,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.60

On 07-31 15:11, Florian Fainelli wrote:
> > +
> > +		gio: gpio@7d508500 {
> > +			compatible = "brcm,brcmstb-gpio";
> > +			reg = <0x7d508500 0x40>;
> > +			interrupt-parent = <&main_irq>;
> > +			interrupts = <0>;
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +			brcm,gpio-bank-widths = <32 22>;
> > +			brcm,gpio-direct;
> 
> Undocumented and unsupported property upstream, what does it do? Other than
> that, LGTM.

Doh. Something used for banging GPIO's from user-space via "/dev/gpiomem".

I will remove it in next patch version.

Thanks,
Ivan


[1]
 "...
    gpio: mmio: Add DIRECT mode for shared access

    The generic MMIO GPIO library uses shadow registers for efficiency,
    but this breaks attempts by raspi-gpio to change other GPIOs in the
    same bank. Add a DIRECT mode that makes fewer assumptions about the
    existing register contents, but note that genuinely simultaneous
    accesses are likely to lose updates.
 ... "

