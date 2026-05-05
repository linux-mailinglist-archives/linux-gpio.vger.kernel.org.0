Return-Path: <linux-gpio+bounces-36217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEwvHQj9+WkqFwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 16:22:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D784CF4DC
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 16:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AD6B3004909
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F4C31F99E;
	Tue,  5 May 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUGvJSiL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FD47F2C4;
	Tue,  5 May 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990915; cv=none; b=qW8yg7dCyv5Lop8DRM4dye7Ug80gl6ND31MiB5a/c5BpgHmHzUBr6w6kr7zZDau2pApuOUEgQk8O0YHump4KiC8NtS7OW8wFZ6acB0gY7W714S4UvfDU8AvU6nmSxMCKnIwDeLMXQOvsYPFOnltfaZsKBdhfrcsMDzhpqij8GuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990915; c=relaxed/simple;
	bh=CgVFwSW21weIdSv7s4FdKSWEJKXyKFOpo7zBPr9xnDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aQXy2YtmxFh4p5tdatTAWLdI3rYtb7iHVb4wirnFnLZl+Ko+DBNehliNChedDwzezR4srSLX4RTTO09AfbmLrOYARoX+PYiUorqaR2PZG0qsmfT96BbdPRYq9Ldssh1iFrbNTqqTihC9ZPSUNK18uSt5pEsR3yNsbHgWuy9AebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUGvJSiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F876C2BCB4;
	Tue,  5 May 2026 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990915;
	bh=CgVFwSW21weIdSv7s4FdKSWEJKXyKFOpo7zBPr9xnDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iUGvJSiLlCU0HvNpUdVW1UH6YTyA7HkOJDtEGgzKKD0YaifM+gjOth33dMqWgioiS
	 6nCGapMyAMCf4Q9zhhHlPuycA20hVIgpaVpgC+2jLXHIb5dfIW6OQtwpy3eMlLK3UP
	 gy4rYsMRREi5IlxByqfK5SPSGogzdZ9P8GLiZXgAmfbr0XSajypSVp5fnzubSuLPLF
	 LIqh0LzppHuOjsLg9QOqFD65QGzyxvPc3JQ6O/ZIyqlJw03ntE6Roy51L9hPpNmjsn
	 v2JxDdfwtkD5aDjRQBA2+v6Inx01Hc8Dkv6pTWoySMPR/t/zNXpAlc3OidNiCP+AKZ
	 m50ia8UgHxjYQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
In-Reply-To: <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
Date: Tue, 05 May 2026 16:21:51 +0200
Message-ID: <87lddyx7gg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 28D784CF4DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36217-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,secretlab.ca,linutronix.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@gmail.com=
> wrote:
>> As a way to prove that this is indeed the problem,
>> the following workaround makes it work.
>> It just inverts the sorting order of all matches,
>> so it picks Bank0 instead of Bank2.
>
> That's a tricksy bug, I can't exactly see where the issue
> is.
>
> I think to solve this you might need to allocate an external
> irqdomain that deal with the three different gpiochip
> instances when translating the irqs.

struct gpio_chip has this:

        /**
         * @of_node_instance_match:
         *
         * Determine if a chip is the right instance. Must be implemented by
         * any driver using more than one gpio_chip per device tree node.
         * Returns true if gc is the instance indicated by i (which is the
         * first cell in the phandles for GPIO lines and gpio-ranges).
         */
        bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned int i=
);

That driver falls in the category and lacks that callback, no?

Thanks,

        tglx

