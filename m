Return-Path: <linux-gpio+bounces-10492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1CF9881CA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 11:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F051F23ACA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 09:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF0D1BAEDB;
	Fri, 27 Sep 2024 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jBo8xqmv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FzgUygNM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jBo8xqmv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FzgUygNM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15218858E;
	Fri, 27 Sep 2024 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430549; cv=none; b=FcA8ZOlCg3ww9l8ZkvhuAbdpCLhrLXWBIEj/S2tdNQ7cfcir3BqS9fOlz4JOYlhVUGDnreoXfA+8SFhcWi4+mGWzkeP1xxbo86/QVYdyooqwAs0KtMcrzLhOuvpvpfMYrL5SAN+h31NrsUtoNZIFPu/XzyROTFBM3dccUtz2iz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430549; c=relaxed/simple;
	bh=58Z+g6y9xJ+DSDcp7JyJkmV4Xr0arz1KMaMFi+ztBmY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=imEx60scF3kxWztFS1HU9l3d2JhhLrh+VlaXu6A50XW5Al7mF1Sh/kM0CfHxBSnio+ID05b5SdSCQtK9BZoaoXEW8DyN1Vzy4GS6FtGSAGZ116iEtroyLb6tT8sc8EZ7xz4EdGv8/YkJg8ggAxZeG3E09R2O2PF08QLOYbD8k6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jBo8xqmv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FzgUygNM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jBo8xqmv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FzgUygNM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E49F21964;
	Fri, 27 Sep 2024 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727430545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XOOGzQAUv2vnB+q34fbZwd8/YgkAJgI2UP5FKqxJOc=;
	b=jBo8xqmveZ8EIHT9Ha4VHGW1hvaxeXNtqWy86mG6cSbDk0YkWBcx0XH67vbfn4w+nzgQt1
	bO+qQKEf8LhwC58r3bnU+s6He2hkFvhh8VZkmHmaTtYd9uXZ+9l4lafnj8RdejFQcwGpjo
	cMMpjEV1xdD8PHbvmeYP+345gYaP/4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727430545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XOOGzQAUv2vnB+q34fbZwd8/YgkAJgI2UP5FKqxJOc=;
	b=FzgUygNMszk1hzAjy7cl3UtwnMBrp1CAqUAbjIjtcVLOa/qdSZKzNyUKkNxnP8KYbDFdef
	l1Z+QzUqZNphu8DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727430545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XOOGzQAUv2vnB+q34fbZwd8/YgkAJgI2UP5FKqxJOc=;
	b=jBo8xqmveZ8EIHT9Ha4VHGW1hvaxeXNtqWy86mG6cSbDk0YkWBcx0XH67vbfn4w+nzgQt1
	bO+qQKEf8LhwC58r3bnU+s6He2hkFvhh8VZkmHmaTtYd9uXZ+9l4lafnj8RdejFQcwGpjo
	cMMpjEV1xdD8PHbvmeYP+345gYaP/4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727430545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XOOGzQAUv2vnB+q34fbZwd8/YgkAJgI2UP5FKqxJOc=;
	b=FzgUygNMszk1hzAjy7cl3UtwnMBrp1CAqUAbjIjtcVLOa/qdSZKzNyUKkNxnP8KYbDFdef
	l1Z+QzUqZNphu8DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C7C513A73;
	Fri, 27 Sep 2024 09:49:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0JgGAZF/9maqTQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 27 Sep 2024 09:49:05 +0000
Message-ID: <8d8462da853b6c147e3cdb790b2e3ea7d4aaf533.camel@suse.de>
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
From: Jean Delvare <jdelvare@suse.de>
To: Ian Ray <ian.ray@gehealthcare.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Sep 2024 11:49:04 +0200
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
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hello Ian,

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
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 77a2812f2974..732a6964748c 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -758,6 +758,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
>         int level;
>  
>         if (chip->driver_data & PCA_PCAL) {
> +               guard(mutex)(&chip->i2c_lock);
> +
>                 /* Enable latch on interrupt-enabled inputs */
>                 pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
>  

I've been asked to backport this fix to SUSE kernels and I have a
concern about it.

You take the i2c_lock mutex inside the (chip->driver_data & PCA_PCAL)
conditional block, where pca953x_write_regs() is being called, and the
commit description implies this is indeed the call you wanted to
protect.

However, immediately after the conditional block, the common code path
includes a call to pca953x_read_regs(). Looking at the rest of the
driver code, I see that the i2c_lock mutex is *also* always held
(except during device probe) when calling this function. Which isn't
really surprising as I seem to understand the device uses a banked
register addressing, and this typically affects both reading from and
writing to registers.

So I suspect the i2c_lock mutex needs to be held for this call to
pca953x_read_regs() as well (unless you are familiar with the register
map and know for sure that the "direction" register is outside of the
banked register range).

I'm not familiar with the gpio-pca953x driver at all so I may be
missing something and maybe everything is actually fine, but I would
appreciate if someone could take a look and give a second opinion.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

