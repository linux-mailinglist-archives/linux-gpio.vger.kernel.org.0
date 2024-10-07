Return-Path: <linux-gpio+bounces-11001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A99938E3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 23:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACA82B22B76
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF02A1DE2C4;
	Mon,  7 Oct 2024 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K6dhJkHO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIGW3OsJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K6dhJkHO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIGW3OsJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8125C175D44;
	Mon,  7 Oct 2024 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335817; cv=none; b=dYYlHHB8vOt1/KBF0AoW29gQ9WqvS0bebtlAB8v/PuU/YVYOf9TW8Ykr89FPCizVaRUgHLleZ+8K2gZjwqruffiDEq44FmnTao+/Rx1aeN3dX1/dke99ntPbx2rKx62yh0ViDiMC6JaBdgr3QooPLe+7Cfm5WHcAydymvxs6tgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335817; c=relaxed/simple;
	bh=HsHMFZnl73qXPJp3WcFgeBGK5RIe2dlqb5wRxWZf9m4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kliYK+GuK88/EKlUY8RdpU+QAL7Tr4bqSAw3RgIqcdHZVMMuF7IoLDfzVYpcgExDltvf6VDgToceGdBWAV1k2huojKBsgo2AthwCZwruX1AkHGQZywYQ4a9qS1hJvySNN/BIthG4w6AohK/l1lgSMLrtBgqhxsAFP5JBr6erQ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K6dhJkHO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HIGW3OsJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K6dhJkHO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HIGW3OsJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 779191FD7D;
	Mon,  7 Oct 2024 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728335812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAxY0WSthsU5XJUyf0vGpauYU8mriadEugO/Of+e39w=;
	b=K6dhJkHO64ckfET+2DCyV2dLb8XL1SVLVTRoLE26PjTDjlVOaleW7exXb1QWEcopIIw0Bx
	zZ7r2NPP+2OgoQqb1CylZZXsSgUnq70eo5QxFUIXcoZ6s4Pd4tQkp3N2UF7SxP2UjRPjw7
	8FlD9w514denRrF3wPKAmjQi9mxNA1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728335812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAxY0WSthsU5XJUyf0vGpauYU8mriadEugO/Of+e39w=;
	b=HIGW3OsJDSVYX7uGtgHtZSrmtQnMDwvxW+OjtHzKBHwpuciACGD+TyJoJ/+VGYHDzMFRQQ
	iLRfOrCpFdbwuwAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K6dhJkHO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HIGW3OsJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728335812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAxY0WSthsU5XJUyf0vGpauYU8mriadEugO/Of+e39w=;
	b=K6dhJkHO64ckfET+2DCyV2dLb8XL1SVLVTRoLE26PjTDjlVOaleW7exXb1QWEcopIIw0Bx
	zZ7r2NPP+2OgoQqb1CylZZXsSgUnq70eo5QxFUIXcoZ6s4Pd4tQkp3N2UF7SxP2UjRPjw7
	8FlD9w514denRrF3wPKAmjQi9mxNA1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728335812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAxY0WSthsU5XJUyf0vGpauYU8mriadEugO/Of+e39w=;
	b=HIGW3OsJDSVYX7uGtgHtZSrmtQnMDwvxW+OjtHzKBHwpuciACGD+TyJoJ/+VGYHDzMFRQQ
	iLRfOrCpFdbwuwAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30769132BD;
	Mon,  7 Oct 2024 21:16:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ulcMCcRPBGdgcgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 07 Oct 2024 21:16:52 +0000
Message-ID: <ce0ac1bfe2fb54feb10dc06827091caea57b7a19.camel@suse.de>
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
From: Jean Delvare <jdelvare@suse.de>
To: Ian Ray <ian.ray@gehealthcare.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Oct 2024 23:16:51 +0200
In-Reply-To: <20240620042915.2173-1-ian.ray@gehealthcare.com>
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 779191FD7D
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

Hi Ray,

On Thu, 2024-06-20 at 07:29 +0300, Ian Ray wrote:
> Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> pca953x_irq_bus_sync_unlock() in order to avoid races.
> 
> The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> lock is held before calling pca953x_write_regs().
> 
> The problem occurred when a request raced against irq_bus_sync_unlock()
> approximately once per thousand reboots on an i.MX8MP based system.
> 
>  * Normal case
> 
>    0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
>    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
>    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
>    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> 
>  * Race case
> 
>    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
>    0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
>    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
>    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> 

I have more questions on this. Where does the above log come from?
Specifically, at which layer (bus driver, regmap, gpio device drier)?
What do these values represent exactly? Which GPIO chip was used on
your system? Which i2c bus driver is being used on that system? What
are the "requests" you mention in the description above?

I'm asking because I do not understand how writing to the wrong
register can happen, even without holding i2c_lock in
pca953x_irq_bus_sync_unlock(). The i2c layer has a per-i2c_adapter lock
which is taken before any bus transfer, so it isn't possible that two
transfers collide at the bus level. So the lack of locking at the
device driver level could lead to data corruption (for example read-
modify-write cycles overlapping), but not to data being written to the
wrong register.

As a side note, I dug through the history of the gpio-pca953x driver
and found that i2c_lock was introduced before the driver was converted
to regmap by:

commit 6e20fb18054c179d7e64c0af43d855b9310a3394
Author: Roland Stigge
Date:   Thu Feb 10 15:01:23 2011 -0800

    drivers/gpio/pca953x.c: add a mutex to fix race condition

The fix added locking around read-modify-write cycles (which was indeed
needed) and also around simple register reads (which I don't think was
needed).

It turns out that regmap has its own protection around read-modify-
write cycles (see regmap_update_bits_base) so I think several uses of
i2c_lock should have been removed from the gpio-pca953x driver when it
was converted to regmap as they became redundant then. This driver-side
lock is still needed in a number of functions though, where the read-
modify-write is handled outside of regmap (for example in
pca953x_gpio_set_multiple).

Thanks,
-- 
Jean Delvare
SUSE L3 Support

