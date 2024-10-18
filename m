Return-Path: <linux-gpio+bounces-11616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A69AB9A39F4
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299411F24ECB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FAE1EF0B2;
	Fri, 18 Oct 2024 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n1oPafcG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C1dhIlKz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p6tcA5o6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j81yMhi9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE69188A3A;
	Fri, 18 Oct 2024 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729243619; cv=none; b=AJ6mUANeattQ/8hpbhjm7v2GaBezBdm0uJm/ue6UE8uolTOjcj7VUnlb5iBN/Sntr7a6Rv3GxY5XDyb1/WR1zXSdw9RlDwnTue2IIngPOu+njwrIjBD7MnbRniE/U57Jt0iNIeCkZIw9VGN3TeLYVq6mQG1i1TUkVmiWTBsq/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729243619; c=relaxed/simple;
	bh=a+l7LqTjNStCYRU1Ke2SlxyitvjH+BQFbbtr4rTOhh0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZlV9J25badklmkmEWs5mEJE0o6rNnJnM4AzC9cAPArEkA4kDG/5tGOzRQV8k86FKkcpBEovMMqcFuEsv5ZJi02KMcJbxpS4NAXreIu9h4gyXxMg9HmYhJzIDZN0Doz3hmZ+kG0r49YScECbPFMWuIlaE5SY0bpFLiuaxK2pFk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n1oPafcG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C1dhIlKz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p6tcA5o6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j81yMhi9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E796921B86;
	Fri, 18 Oct 2024 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729243616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gn4T7Q3MYCDcGqsQPBuUlct/sQ506bt+TTnlOzbfbHk=;
	b=n1oPafcGamgIC2tDVZftjzKbR2+YPK0U0fYnL7SKgpBjxkNshYll4ca1X8kAV4PUMu5uce
	8Cc0zqoFZXHlkdoasbjRxwLJwF9hNt19kfnLHPPwN0k6ssOE7GUy+r0Rnjbd9Ymhco8Dz9
	YN510rdgr14+a6qcEmZgz9F2hK01RM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729243616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gn4T7Q3MYCDcGqsQPBuUlct/sQ506bt+TTnlOzbfbHk=;
	b=C1dhIlKzjVIlDj/lcomFQ/zVBN7qLAulHHrDkgPFfF7oICH6cd5u4LVgQ0/Bh/0KXf7kz2
	cLcq9RL2mJycpeBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=p6tcA5o6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=j81yMhi9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729243615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gn4T7Q3MYCDcGqsQPBuUlct/sQ506bt+TTnlOzbfbHk=;
	b=p6tcA5o6b/Gqim0G6+51hK4hO+QHnAmjnz14+Ye5EDzrWWMliZ9X/4eLWxbpCkF3ByexU4
	K9A+gmMbOjmAA8PrKwisL0P5AmrFXjS8GH8P4qxCZUeUbQO0786vb2dWOsM36icRT4VFxW
	KWpsvtBr68YaxIDpCCarfMkhSO15pFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729243615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gn4T7Q3MYCDcGqsQPBuUlct/sQ506bt+TTnlOzbfbHk=;
	b=j81yMhi9cBWW4C30TbB0Fb6eMNVFGyHdJPb2QMah3ke60bwp3yrLi0oJs1R0CujroO7jog
	6HoKT2YuXCTEYaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A26EF13680;
	Fri, 18 Oct 2024 09:26:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iraRJd8pEmeGWgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 18 Oct 2024 09:26:55 +0000
Message-ID: <4f8b6f2d57abc5ea4ba1e755bac31d3fa3dc2e55.camel@suse.de>
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
From: Jean Delvare <jdelvare@suse.de>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 11:26:54 +0200
In-Reply-To: <ZwTK5Jip2YJrSd8L@f642ec5a18a7>
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
	 <ce0ac1bfe2fb54feb10dc06827091caea57b7a19.camel@suse.de>
	 <ZwTK5Jip2YJrSd8L@f642ec5a18a7>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E796921B86
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

Hi Ray,

Sorry for the delay.

On Tue, 2024-10-08 at 09:02 +0300, Ian Ray wrote:
> On Mon, Oct 07, 2024 at 11:16:51PM +0200, Jean Delvare wrote:
> > On Thu, 2024-06-20 at 07:29 +0300, Ian Ray wrote:
> > > Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> > > pca953x_irq_bus_sync_unlock() in order to avoid races.
> > > 
> > > The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> > > lock is held before calling pca953x_write_regs().
> > > 
> > > The problem occurred when a request raced against irq_bus_sync_unlock()
> > > approximately once per thousand reboots on an i.MX8MP based system.
> > > 
> > >  * Normal case
> > > 
> > >    0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
> > >    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> > >    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
> > >    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> > > 
> > >  * Race case
> > > 
> > >    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
> > >    0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
> > >    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> > >    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> > > 
> > 
> > I have more questions on this. Where does the above log come from?
> > Specifically, at which layer (bus driver, regmap, gpio device drier)?
> 
> Additional debug, with manually added commentary (sorry for not being
> clearer).  The debug was added to drivers/base/regmap/regmap-i2c.c while
> investigating the issue.

FWIW, I think regmap includes a tracing facility which may have served
you. Specifically, I see calls to trace_regmap_hw_write_start() and
trace_regmap_hw_write_done() in _regmap_raw_write_impl(). But I must
confess I couldn't find where these functions are defined nor how to
enable tracing...

> > What do these values represent exactly? Which GPIO chip was used on
> > your system? Which i2c bus driver is being used on that system? What
> > are the "requests" you mention in the description above?
> 
> GPIO expander pi4ioe5v6534q at I2C address 0-0022.

This device model doesn't seem to be explicitly supported by driver
gpio-pca953x. I see it listed as compatible in
Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml but not in the
driver's pca953x_dt_ids. Out of curiosity, did you have to add it
manually? I admit I'm not familiar with these device tree node
declarations.

> # grep . {name,uevent}
> name:30a20000.i2c
> uevent:OF_NAME=i2c
> uevent:OF_FULLNAME=/soc@0/bus@30800000/i2c@30a20000
> uevent:OF_COMPATIBLE_0=fsl,imx8mp-i2c
> uevent:OF_COMPATIBLE_1=fsl,imx21-i2c
> uevent:OF_COMPATIBLE_N=2
> uevent:OF_ALIAS_0=i2c0

OK, so the underlying I2C master is capable of writing to multiple
registers at once. This helped me follow the code flow while trying to
figure out where the race was.

> > I'm asking because I do not understand how writing to the wrong
> > register can happen, even without holding i2c_lock in
> > pca953x_irq_bus_sync_unlock(). The i2c layer has a per-i2c_adapter lock
> 
> Given that pca953x_irq_bus_sync_unlock is part of an interrupt handler,
> IMHO this explains very well why locking is needed (but I did not dig
> deeper than that).

I took the time to dig deeper, my conclusions are below.

> > which is taken before any bus transfer, so it isn't possible that two
> > transfers collide at the bus level. So the lack of locking at the
> > device driver level could lead to data corruption (for example read-
> > modify-write cycles overlapping), but not to data being written to the
> > wrong register.
> 
> Based on the observed data, the hypothesis was that pca953x_write_regs
> (called via pca953x_gpio_set_multiple) and pca953x_irq_bus_sync_unlock
> can race.
> 
> The missing guard neatly explained and fixed the issue (disclaimer: on
> my hardware for my scenario).
> 
> > As a side note, I dug through the history of the gpio-pca953x driver
> > and found that i2c_lock was introduced before the driver was converted
> > to regmap by:
> > 
> > commit 6e20fb18054c179d7e64c0af43d855b9310a3394
> > Author: Roland Stigge
> > Date:   Thu Feb 10 15:01:23 2011 -0800
> > 
> >     drivers/gpio/pca953x.c: add a mutex to fix race condition
> > 
> > The fix added locking around read-modify-write cycles (which was indeed
> > needed) and also around simple register reads (which I don't think was
> > needed).
> > 
> > It turns out that regmap has its own protection around read-modify-
> > write cycles (see regmap_update_bits_base) so I think several uses of
> > i2c_lock should have been removed from the gpio-pca953x driver when it
> > was converted to regmap as they became redundant then.

I have to correct myself here. The regmap layer implements its own,
configurable and *optional* protection lock. It turns out that the
gpio-pca953x driver has it disabled:

static const struct regmap_config pca953x_i2c_regmap = {
	(...)
	.disable_locking = true,
	(...)
};

So it is expected and very needed that the gpio-pca953x driver
implements its own lock to protect against races whenever the hardware
is accessed.

> > This driver-side
> > lock is still needed in a number of functions though, where the read-
> > modify-write is handled outside of regmap (for example in
> > pca953x_gpio_set_multiple).

After reading the regmap code (which took me some time as I wasn't
familiar at all with it, I didn't know what I was looking for exactly
and I wanted to make sure I wasn't missing something along the way), I
think I understand what was racing exactly.

The gpio-pca953x driver uses regmap_bulk_write() which is implemented
by _regmap_raw_write_impl(). The register map uses an internal buffer
to prepare the actual hardware transfers:

struct regmap *__regmap_init(...) {
	(...)
	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
	(...)
}

This work buffer has space for both the register address and the values
to be written to or read from the device:

	map->format.buf_size = DIV_ROUND_UP(config->reg_bits +
			config->val_bits + config->pad_bits, 8);

During a regmap raw write, the register address is written to the first
byte of the work buffer:

	map->format.format_reg(map->work_buf, reg, map->reg_shift);

where map->format.format_reg() is regmap_format_8() for the gpio-
pca953x driver:

static void regmap_format_8(void *buf, unsigned int val, unsigned int shift)
{
	u8 *b = buf;

	b[0] = val << shift;
}

If _regmap_raw_write_impl() is called concurrently without proper
locking then the contents of the work buffer may be overwritten by the
second caller before the first caller had a chance to use it. I think
this matches your debug log of the race case pretty well.

I checked the regmap implementation for other use cases of map-
>format.format_reg(map->work_buf, ...) and found it is being used in
_regmap_raw_read(), so I had to investigate further, because
pca953x_irq_bus_sync_unlock() also calls pca953x_read_regs(..., chip-
>regs->direction, ...) which in turn calls regmap_bulk_read().

For volatile registers, this function will call regmap_raw_read() which
reads the values from the hardware most of the time. However, for non-
volatile registers, _regmap_bulk_read() is being called instead, which
is implemented by _regmap_read() which reads from the regmap cache. As
it turns out that the direction registers are not volatile and are read
first as part of pca953x_irq_setup(), the values will always be
available from the cache when read from pca953x_irq_bus_sync_unlock(),
so no hardware access will happen and the internal work buffer won't be
used.

Therefore my conclusion is that your fix was needed, is correct and is
sufficient. My initial concern about the unprotected
pca953x_read_regs() call in pca953x_irq_bus_sync_unlock() was
incorrect. Sorry for the noise.

-- 
Jean Delvare
SUSE L3 Support

