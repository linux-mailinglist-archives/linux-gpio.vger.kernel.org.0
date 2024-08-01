Return-Path: <linux-gpio+bounces-8503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEA94449C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 08:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58778B20B9B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 06:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444D315821E;
	Thu,  1 Aug 2024 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NUpUPlkm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yzg7kJlG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NUpUPlkm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yzg7kJlG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C417156F54;
	Thu,  1 Aug 2024 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494500; cv=none; b=KXwdSMhN52GyXptXXkzLJY+aulAfsS4Bc8RGnKhNylL3wsKLYZA8PrbPCjCINIrhY7EalsbsOmH9WuuBpV/nENnWCehsTxjGaI1CcXOZAkp7MAsyLchjTS7JtMGJqlwjLbn5+AvE9ZWpPeD0Uy++lVu4VccdeBM3ZX+0owp1KgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494500; c=relaxed/simple;
	bh=I1fPKjei+WCSZcYN7b6AUVjhjPHHCdX9hpQGLPsKpeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g00iUYOjg0zgOOCG1gPtIBkwYKDC6W6Dc5uRJA6C/jNnQCH4eYUrkB6hpRTrtD9wzNggcplkHPok/eIUNbWlTjmcZ9uCtSI5w/RkZLiHfFNiwMSHGXXTTS3DYW1qS3dfBeJ7TLOjEi2fxn5TdVLe53RiWcJEg3QwGTN7/iA5lT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NUpUPlkm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yzg7kJlG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NUpUPlkm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yzg7kJlG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D746521A99;
	Thu,  1 Aug 2024 06:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzXvo65mBwn9uOjc7o7t4OFuYEOAQLzaR8jNCt55ngU=;
	b=NUpUPlkm7QVbiGYYHvz/eMKkipWwklSc8isvr7RNnfe2hMyT2hsS5y2oVJ76zFf2HvT7zo
	0x8V8gV39LjU6ymYrruVfu5si0lQlPm5MlhBD/eCt5v7hWWSVsKd9uHiw8hwjwohO/fHus
	84h8kjW7TTuuoOlYWrTDTJVYxBs+OpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzXvo65mBwn9uOjc7o7t4OFuYEOAQLzaR8jNCt55ngU=;
	b=Yzg7kJlGiwhrpdIXyz8xUt/N8HsD7Fp+GEtjjLvp/cCN40bQ/T8wiWk0uBb5osa9/pwwpL
	82ZADi47edKltqAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzXvo65mBwn9uOjc7o7t4OFuYEOAQLzaR8jNCt55ngU=;
	b=NUpUPlkm7QVbiGYYHvz/eMKkipWwklSc8isvr7RNnfe2hMyT2hsS5y2oVJ76zFf2HvT7zo
	0x8V8gV39LjU6ymYrruVfu5si0lQlPm5MlhBD/eCt5v7hWWSVsKd9uHiw8hwjwohO/fHus
	84h8kjW7TTuuoOlYWrTDTJVYxBs+OpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzXvo65mBwn9uOjc7o7t4OFuYEOAQLzaR8jNCt55ngU=;
	b=Yzg7kJlGiwhrpdIXyz8xUt/N8HsD7Fp+GEtjjLvp/cCN40bQ/T8wiWk0uBb5osa9/pwwpL
	82ZADi47edKltqAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0D2F136CF;
	Thu,  1 Aug 2024 06:41:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T/PcKCAuq2blcAAAD6G6ig
	(envelope-from <iivanov@suse.de>); Thu, 01 Aug 2024 06:41:36 +0000
Date: Thu, 1 Aug 2024 09:45:50 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wahrenst@gmx.net, andrea.porta@suse.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/7] arm64: dts: broadcom: Add support for BCM2712
Message-ID: <20240801064550.5zouuvwctt74q3u6@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-4-iivanov@suse.de>
 <171ab489-7d05-4e43-9d5b-34470e33b20b@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171ab489-7d05-4e43-9d5b-34470e33b20b@broadcom.com>
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmx.net,suse.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

Hi,

On 07-31 14:57, Florian Fainelli wrote:
> 
> On 7/30/24 23:28, Ivan T. Ivanov wrote:
> > From: Andrea della Porta <andrea.porta@suse.com>
> > 
> > The BCM2712 SoC family can be found on Raspberry Pi 5.
> > Add minimal SoC and board (Rpi5 specific) dts file to be able to
> > boot from SD card and use console on debug UART.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> I have already applied this one:
> 
> https://github.com/Broadcom/stblinux/commit/faa3381267d01a389b13038504079c85c0bc4392
> 
> should I drop it and take this patch instead?

No. I added this patch here just for completeness.
It is written in cover letter.

Regards,
Ivan


