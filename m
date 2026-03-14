Return-Path: <linux-gpio+bounces-33415-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMD0DmIatWlZwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33415-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:20:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB728C17B
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BED473031823
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F3A3019A6;
	Sat, 14 Mar 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMNITgA/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801A6282F0A
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476446; cv=pass; b=AZaHXSrWglHd3B9B73tbMSdjWc+i3DRP/sXLzVuXSbwwHFUHghco+Q140qvxG+GLgj6RJQGXTTleKv5egfSDk4Zl0VfruEfxOHvxO+lYPR0bGZ+szYVUg0PL0/e04Rw8zaBHpLJ9/T/wjfDixRV6W5vZXVWfg1hgVi8B8rl/D18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476446; c=relaxed/simple;
	bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOps/m/Ui8wwx7BzbKVrVVo94mbgqNBPcFDDyLT1QskXehULVCwXz/t8Ay+DqWIGfSMH8vAHkXJCm+g5MwSea36g4D5JzstCQDP8mtdQYoJGkDp2/wTNV8SEbIpMoUBa+WuN8UF4N2e5K6ezZPUOkgmY5FpVEOz9KcVBtVfUTL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMNITgA/; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b96dc65b886so724315666b.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 01:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773476442; cv=none;
        d=google.com; s=arc-20240605;
        b=IINkf6pwk9zjlPHHLmyVCnLKT2uFPkL9PwtwqwUJZs97N6g8fQUIgLUORA7D061BSV
         PzyQ8jJse3EynBiJHwD5x+A0VK3Zc1abVH2IgPEpuZDGcBjsF32QhbUE0Kq+/z4mnnlh
         UfnV8aBr0HrJXMqBWT52xb41Dl6cP+1tLTbUYYv6swCQbqXM/wHBB3qQVd2myBTgK9E9
         ZzFJiKrM028TAzRsYEg6Fe9DVDrUt5+b8dT5+sOxs+pTBBfF106qwIyp7Z7mGjnJDfQO
         VLjSqSL6njNJilmlfIoeo7PaCEN2HJnGE+PvlMbZ4bJBAxDTbLLu7YDaGU/ZqKbqp7pW
         qesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        fh=Q+jO/7PowYYwx/orVi9slbqPDry26A0zJDj/kY4I6kA=;
        b=JPJmC0FcBz/Es5a4M2UDFsH6bbsFB+N0HSo7rzB8SKkFooP4o+lwLA9S0n6bPa3L8o
         F+tRo8IqorltKWt1XsJ/oQOoX4XJJqE8tAfRn5VPNnIV2iNarU98603fsIsen8h92I44
         kZI8uc8awPylZdrXZvAtzN4FIelgcq80RZy10Z4Bq3fsEZxMSlPGousuyQNr7y8PpZCo
         8J0TrmtzpgMrlJBBgtdjm8+BRZ8MKLvk/rEAjpO6fxD3NQvvl3d82CKdLv4gmN80I02e
         phCdxj0Pad5zCSFodeXTf/ypRCbBKxZNdQD5tGJcZLRxPwX/XY2ooJCAQia45azMEyci
         4wiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476442; x=1774081242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        b=YMNITgA/eKYYfWjN+FBHM1EADE5KUoqx2Kx4HVf51vvhGyuzgAqS3uSUnsEZpAq3EO
         r+pgw3dk8fFNHMhpWK8W690RzHrpIgsmLjq44MbFtFB1R5sWlITO+RhM190kb4hwcUur
         s2XorXyDvgccQvlW1kaX3KiobWSDub9uaL6iHrwQSB11NPU13lO/OvgdpUYAC76rZKff
         xlPhEgL2qRaNC3vc+FtKvagU/GqpfAX7RWMngNfoE5hAVBPCfcrClSEWJeHQKOYjV0JH
         2oOwyGmW2YCnWJeY7sFrNEqABtupPzDqW4CjayCMab6VFDQoUqkcaEhIsnIph/VQNhpc
         u72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476442; x=1774081242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        b=lKrWEGgJ+b/pX++QH5RjXN1AM0Tg0EfkMy1Kzo1qIitxAWaewJBteVYNmZQJS1SaMJ
         2C6ILj88mffn/IV0WVYetzKoCLgvYT5akwe7YEnXMG/9bQjGEIpXcvRxeLlxBuMcfbAX
         twVjfyvPGhwa8fwLeRhkOPVN5oz9dhHHwRWooDNSDRq5uxQ+PK4tj+6KPfdVh3FGKAsa
         HvF0CoLKSOcFLrhlS8RbvtRII3Tbc35ZT2t1XL+feu5R5OBJBh1Udx2/Z4Bna7OM0YaK
         pGqcU3ro3GQA61ljamHDkShjf6T2lMG/jlBJ8fAnyipwPLB5P0Jr5pYHYkhw8LPcXiGi
         O6bA==
X-Forwarded-Encrypted: i=1; AJvYcCXo8p3bAEs9L3aj+UXBHvFb3Ymv/MBf0jazLk7TcH4WPoUbNiPUVnmYeGhiZfg6aaM/I7VACxqs2GzI@vger.kernel.org
X-Gm-Message-State: AOJu0YypEpt7Cv6sRqCtO0UFwS0S7OTdBCozwhx3jhBGmzF/vLnWoYWx
	pcLhDrXK9FXk5POOT1XqNOOLvz3UeVyfPgx26pGKKJpUVnav1OoevfCwjAHanNkqCpGYw1hWqxf
	Zz0kNwxF6lGPZq/F3UcxWmiG8fymgYsQ=
X-Gm-Gg: ATEYQzzh2FSW2gs2FSk8J+kMnDijewGWNqasaZ9VnfDmW/lvBP8NiS6VI3F4UVgyA4K
	+PdI4QUr4D++6bxw59LYL4zNRaClz7kuo8AGJVWznExJm/QuzlmSB0rTjC5lxEP8Et03+XfYz8K
	1lRvBZXOngXwMV9kKc3kKDEDKwN8WGkcQ+WHvY7kvEBfed009Xbd2RSNffkAYG1xASJklX6ajt4
	D5F/VAfl6afQ+z2Qw7P6G7AAjX6V84O4/IJKrBY72PcWinsmOARVuCjbnFQt5kfkDdcqg0vuxMS
	1JmkLg==
X-Received: by 2002:a17:906:dc94:b0:b97:80be:c9a0 with SMTP id
 a640c23a62f3a-b9780bf0140mr178652466b.28.1773476441488; Sat, 14 Mar 2026
 01:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 13:50:25 +0530
X-Gm-Features: AaiRm53rSdWgcmbPnwhHtOT4QoH5qCsuKsNqkPJOpNSMw1Ld03rj8Uh5faUWLZI
Message-ID: <CANAwSgSreMvKmWuV-wikoiEQDGEQ4YCo3MN8Ke4s4+Y49OOY2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33415-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,pigmoral.tech:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 96EB728C17B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Junhui,

On Thu, 12 Mar 2026 at 14:14, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
> Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
> configuration parameters. This is more logical and allows the GPIO
> subsystem to gracefully handle unsupported parameters via functions like
> gpio_set_config_with_argument_optional(), which specifically ignores
> -ENOTSUPP but treats others as failure.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

