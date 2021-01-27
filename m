Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E6D305AD1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 13:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237539AbhA0MGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 07:06:37 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:55940 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbhA0MEa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 07:04:30 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611749027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=60DlocLh3R/JAb1KNLhb+H3bpgfRLVI+G5SZHUtePuk=;
        b=i5ghaZB5AF7HFjkEmiWc4OvCKIYXSaZ8cv62rAERZYpHkUspD5nhhDROkzUGVJFYnQt6BW
        W/lvhipoxp8ZpgUzfY0fFEnd0O+PeRDw1mjZs8oJVQ1BtGTfBRVCwyimXjvdOydo+JAYj+
        aq5QskS5QG/cShkk9o78zuNirA+PFABfkvHR9qwSuFjRrTTDy4nVQpRgHiMPN6CElFT5Yl
        vuT0GdjI2EH3d2LrfCBjKtYYXi6RE12Ah8VNuZ/GnJEVzDne7rcGXyyxMmfWtkd009BxKO
        1WlH9K+BnRPrG54vpSbQ8wTpzJaQPADib3ZM+Iz+A8UyjSFePsQXoICM9qwsag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611749027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=60DlocLh3R/JAb1KNLhb+H3bpgfRLVI+G5SZHUtePuk=;
        b=6wfla+p6f2NeTQiyZ8pSbK9b+PyvPJ2w0SVvBJOBuu1cM5wi5UHY5ADoNsvcrJes1fUOjQ
        tzQKzxXZwhgcyuDg==
To:     Adam Lackorzynski <adam@l4re.org>, maz@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: [PATCH 6/6] x86/ioapic: Fix return check of __irq_domain_alloc_irqs
In-Reply-To: <20210102175859.335447-6-adam@l4re.org>
References: <20210102175859.335447-1-adam@l4re.org> <20210102175859.335447-6-adam@l4re.org>
Date:   Wed, 27 Jan 2021 13:03:46 +0100
Message-ID: <87k0ryfuxp.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 02 2021 at 18:58, Adam Lackorzynski wrote:
> 0 is not a proper IRQ number and also indicates failure.
> Also check for this case in upwards functions.

0 is a valid irq number for historical reasons on x86. So no.

Thanks,

        tglx

