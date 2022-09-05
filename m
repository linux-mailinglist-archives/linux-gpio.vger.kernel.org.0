Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A805AD7E3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 18:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiIEQxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 12:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiIEQxO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 12:53:14 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9509C4F66A
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 09:53:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E332F41E2F;
        Mon,  5 Sep 2022 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662396789; bh=hRXwbXXRiTYQG/osYKxUHpmJOLK8eCmRlp3G1KWkfNo=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=FH6uuVOudFHjruZS/crhJ8sKniG0A0cRm9+eOv9dTqKPLYdtBQNmtssNVVcBYsPyf
         0Srtm2feeNEty1GJ5vivwGJR8GJxr1KOxqkLDZJQBhQsezmfYGcOFVSJ+lU8K0yIuu
         7XZBkEK2pkTtnVZpl4GFwD0dm7MdFTq9q+UqdJt95q8BD6kE/J6fhSXjviRjfJwjqq
         10RvEgZzrj74PYColQndD6nCM66n60vOueq5Ui+JssCNKI4wOtfSObHhYOsWlKNWUs
         q6GAPwanuBxLiyWqiYy+pShqux53tsNV/f3TjjxKRncjeRD8ALv+ereE6NnVbZ6efJ
         6ulM1/ZjelxrA==
Message-ID: <0038ca9c-2634-82f6-750e-a9f5b17c8f5c@marcan.st>
Date:   Tue, 6 Sep 2022 01:53:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Sven Peter <sven@svenpeter.dev>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <1c876ae2-9d8b-4f47-8ca7-797fb484ad03@www.fastmail.com>
 <YxXVuvXZIWBDW0/r@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
In-Reply-To: <YxXVuvXZIWBDW0/r@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/09/2022 19.55, Russell King (Oracle) wrote:
> Delving into this, it seems this code is buggy.
> 
> If apple_smc_rtkit_write_key_atomic() is used from atomic contexts,
> what prevents apple_smc_rtkit_write_key_atomic() being called while
> apple_smc_rtkit_write_key() is executing?

This does:

> +int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
> +{
> +	int ret;
> +
> +	/*
> +	 * Will fail if SMC is busy. This is only used by SMC reboot/poweroff
> +	 * final calls, so it doesn't really matter at that point.
> +	 */
> +	if (!mutex_trylock(&smc->mutex))
> +		return -EBUSY;
> +
> +	ret = smc->be->write_key_atomic(smc->be_cookie, key, buf, size);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_write_atomic);

I tried making this actually work properly while I was considering using
the atomic call in non-shutdown contexts, but gave up - it gets very
hairy, and is probably impossible under the premise that the atomic side
can always block on the non-atomic side and end up deadlocking due to
the nature of things. But right now, since this is only ever used for
final shutdown, there is no contention possible. The mutex_trylock there
is a safety, in case someone tries using this in some other context,
that will just bail if there is contention with non-atomic acesses.
Maybe there should be a warning there, something like "SMC: contention
between atomic accesses and non-atomic accesses is not supported".

> Lastly:
> 
> #define SMC_SHMEM_SIZE                  0x1000
> 
> #define SMC_WSIZE                       GENMASK(31, 24)
> #define SMC_SIZE                        GENMASK(23, 16)
> 
> The size fields are one byte, but we error out if the size is larger
> than the shmem size:
> 
>         if (size > SMC_SHMEM_SIZE || size == 0)
>                 return -EINVAL;
> 
> but we still try to squeeze the size into this byte-wide field:
> 
>                FIELD_PREP(SMC_SIZE, size) |
> 
> which isn't goint to work. If the size is limited by the protocol to
> 255 bytes (or is it 256, where 0 means 256?) then surely we should be
> erroring out if size is above that maximum rather than the shmem size.

Good point, this should be 255 bytes max.

*checks*

Yeah, the longest SMC key we have in practice is 120 bytes, so let's
just #define SMC_MAX_SIZE 255 or something like that.

- Hector
