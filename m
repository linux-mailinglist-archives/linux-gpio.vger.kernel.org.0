Return-Path: <linux-gpio+bounces-8582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C794785D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 11:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6912829C4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3943155312;
	Mon,  5 Aug 2024 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nkc42Veg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wl5bohqN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nkc42Veg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wl5bohqN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915114F9D4;
	Mon,  5 Aug 2024 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722850416; cv=none; b=uRoVPiwR+OQxCe9NirBmIPQsnlslKJkRVjNSqctTjGoQOhjOy8uKBK+Psk8JuZgGYDB49MhumNTKWsEkvPMUGYgvvPNg8UkKixH5poxXdJTN9hxq5ett5jQKVUggMV1bRZ/OXGdac4HGZ7Vv87i7viciBbtEDzIa8ZU4+Pp6px0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722850416; c=relaxed/simple;
	bh=AQibF+CLPRkz0NP91Hp186A2AHuYefdktbYVec0CKE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maP1oSwBKpFCQc4tVWAr7pHkdXMFhaM1qM0pDJv3ymcWIlPv+w6g8puoUAqyfOpLpBqskeg+I35NHVRS7Us9o0Tx6ayKJW25O0HR+ICfLSAQn4f31NxzrYvBJW7aLjejhuNXdfFCiA/dUfUmXrLs2iDzCumxfRtMrElK8aysCII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nkc42Veg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wl5bohqN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nkc42Veg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wl5bohqN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 178FE21281;
	Mon,  5 Aug 2024 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722850413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/dlWHSYQl53c9akZht51bkEjZyUneU0/9rgngPN3OI=;
	b=Nkc42VegeBaySKIz5h/XuXDvWvtC4XYEZb/rRz+TewMWvHkQYBj3HOo7Tsg+qZ0bST4rm5
	yOKhsqoGkOsEHX1pjylEMHui/YWGPm8Pg+wCta1UqotbNb2K2vu7FepsI7k4P0pZ1a6i8d
	hFanqqgNEEF1HsD5o12pLnFWHsFyF/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722850413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/dlWHSYQl53c9akZht51bkEjZyUneU0/9rgngPN3OI=;
	b=wl5bohqNZ3t6PdUA75oInpo/aor8FHDdBDfv4pNSNAaKD6vAv68Q8nJgCs8dVdyUtQPhqe
	wDVFStmRL3qjwJCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Nkc42Veg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wl5bohqN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722850413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/dlWHSYQl53c9akZht51bkEjZyUneU0/9rgngPN3OI=;
	b=Nkc42VegeBaySKIz5h/XuXDvWvtC4XYEZb/rRz+TewMWvHkQYBj3HOo7Tsg+qZ0bST4rm5
	yOKhsqoGkOsEHX1pjylEMHui/YWGPm8Pg+wCta1UqotbNb2K2vu7FepsI7k4P0pZ1a6i8d
	hFanqqgNEEF1HsD5o12pLnFWHsFyF/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722850413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/dlWHSYQl53c9akZht51bkEjZyUneU0/9rgngPN3OI=;
	b=wl5bohqNZ3t6PdUA75oInpo/aor8FHDdBDfv4pNSNAaKD6vAv68Q8nJgCs8dVdyUtQPhqe
	wDVFStmRL3qjwJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3B7713254;
	Mon,  5 Aug 2024 09:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nvjHNGycsGb0bwAAD6G6ig
	(envelope-from <iivanov@suse.de>); Mon, 05 Aug 2024 09:33:32 +0000
Date: Mon, 5 Aug 2024 12:37:48 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	andrea.porta@suse.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Message-ID: <20240805093748.zd4pkmtaepobwale@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-6-iivanov@suse.de>
 <12fd21d4-8061-41d0-b60f-d02102eca1c6@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12fd21d4-8061-41d0-b60f-d02102eca1c6@gmx.net>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 178FE21281
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmx.net];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Hi,

On 08-02 21:08, Stefan Wahren wrote:
> 
> Hi Ivan,
> 
> Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> > Add GPIO and related interrupt controller nodes and wire one
> > of the lines to power button.
> > 
> Since we enable the GPIO controller here, i think we should provide the
> relevant gpio-line-names for the Raspberry Pi 5 board. So gpioinfo works
> from the beginning. Doesn't need to be in this patch directly.
> 

Sure, I was planning to send this later to not make this patchest too large.

Regards,
Ivan


