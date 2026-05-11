Return-Path: <linux-gpio+bounces-36507-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKj0IWmEAWoFcAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36507-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:25:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A775091DC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C42563012CBA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 07:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A622F38229A;
	Mon, 11 May 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tM/jlhCK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D433815CF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484319; cv=pass; b=ePL3rE+rSQ6+dlSIEJBU1n+CNUqiEWx/r7TvEAYw5MdWLo9Uc8FKxBVTWBp+snZ9Cwf2Xr7anSRuDgMvoe6hWO7Thw6qTtKfbhH8rH715x9eCruyi0g/8dWVOPJi6wwax7D+os1kTC9W9ACRFt+CqguWIoTCdO8yGFU1aVNA1ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484319; c=relaxed/simple;
	bh=WPIR++09QQ0jKO5GREGgLT94QitCwjpX35YmHLkPHWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqykwrC5ShBJT0tlsBkSEkNCBmhFl3E/iLhoedtRL5jMnxTQVsySIqekmSjX5SGTLiEbUUFAuDMiLzjbYT9LDPlY/fy6r+OgYf/vXQcUcroUYeoP0CcS8QeLDGuwjfxc7dNlqsHSgq8UuAvb6Fih7hacoMaZlGC5ngGoHmXIaCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tM/jlhCK; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67c3cb1433cso6844142a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 00:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778484315; cv=none;
        d=google.com; s=arc-20240605;
        b=jAATHq1k2zwe9W/7eKqT/YbhaPv4RYeKm37FtdLU9Fe4bg0Jd/q+5c0NDKe5YrUcgF
         QZY6IieRRUmpFEPqbvS9xq5CRCmAY5Vi5GZR+hqQjedXjx/oReDHKPLfqZmqt4sVtRmL
         Ax6jVChsqI7Ki2hdI4g2/uXj1pd7k2EYhF6fJC42gByAX2THrJuQEyVTxXpLYfsxw/lp
         pRywbkCNV7tAdm2TNZwaqgT+SNGvplV+E1QYB4Uungq5roELEojuMs8kJUZtnsifIKdJ
         6lC13KOhiTYjPr8ijf5FCqtafzv1co1SfBwk33ZbH3m+TOdJqNHIrscHZTvlBjVsGr1H
         YuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPIR++09QQ0jKO5GREGgLT94QitCwjpX35YmHLkPHWU=;
        fh=JANcbeqb58C+j3yllq5TCjtJmOSIJzAAljiNnuBfu5U=;
        b=aJK7f5DRiAvCO+1PbJooSe5Hm4gFTLy8HEjlbDHjWNfzVIiLRXngcjvGAKZjUfVaw9
         BNSWW5acBb+EAwfyhnQjH62b4icHTDG048pLXvPwRRdZ9vnRLFOyoGQ4x/4D9RcUCqVM
         bCmmD58qYBS04TLZgHTVdQ4XoYBV4cLC6RVchjfIXfwrAr72j5T0xwvnKNv8Hut9OVUA
         W665wMHCGWxwgCeZDz60pA63RiTNPLk/hCfXaE14bcj7+LvADaJqyie8HW3npT19u+H0
         0PSg8LzjDxtAXPlBjfNJfw/wVN+aczMPo3aQbAUEAxKV7LRzI52HlEp+PyTPjNzgtw+M
         lo5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778484315; x=1779089115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPIR++09QQ0jKO5GREGgLT94QitCwjpX35YmHLkPHWU=;
        b=tM/jlhCKXKYwxL731D8GE9f7vmJEuvwi+e2oHxufLAqBbLEkkK7yLOxOXZ1HHnh5WG
         f2LRcxueLhB/b0nYRIV+33J+uORE04JH5Gd3GyYjwGkgcWUop5o1XLzhk+VjBYGaIPTv
         Wi1oR4PT1r0bfMgFs6uDKitMOgQUR+ehfvfrBpz7F75+uTtnxVfZIHGgaDOvA93XyOwG
         4PYzpCaCsfcKZ6m6XYRd7w3tv+7FRyk/qzXNF2aamPzC5jAfchvZnzlrdZbvqOMysBIw
         e6hiOxJqD+u/U5tMawnSpSDr9X7jGr8vySW/LyxN3pyV5G3lMpz0U39TMs10u9He3jTF
         7wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484315; x=1779089115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPIR++09QQ0jKO5GREGgLT94QitCwjpX35YmHLkPHWU=;
        b=mciKEV66HV6jstY+raQnFiybqCJr+L/AoAT90ytat1ozcAnHzNl5L503noak3JSL++
         frmBrv4kRj5FU8XFupQB0MrF5Fs2SF38AXDIe1By9iPQ0/VYga2J0HAjTT+tzB/zC+6W
         /i4DTgypWE5Arg3fSkn9R+YeBdbcaXEbmgiILh8YKVVkjapwgmSjLJP6fokWurIquUHN
         HmJhR9ReTU9enHqCvIKxCvqMzGeG4c9TqEZb/3gy/97A3H7jDEgrMPy1FU5Mrd6dhJgp
         lYdlRdN98tbKj2ShepBorFsPkqGpz8vO3UBhkNlMyTlrBmLY53TO26sucAFNjHEeQzDY
         wS/g==
X-Forwarded-Encrypted: i=1; AFNElJ/BBjFv8VYJZlAom4ixp1UnYPPpkvgoSblp2t+xKoKuTadJfa4GvYLnBbeM013pwo3nvZcortxzOgzT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfu92SWRZk+ESlDqmfCz92eNMrcsUo+j7oC2By2QXxiqACHFss
	NA/Hsg8XlVUIqVy9zei3cTBF3oW8iaHpxTGH7CmsXWCJr0hNbFNTZMpbTOwAr7rn0icudsl+PWE
	r/BvBSiYfIJRORH6e9wLJwwgxLDBhr4Q=
X-Gm-Gg: Acq92OGnY2BzZRUmnD+4xySKwP43w2q9eroy0u44TXUTx8qmdv+Dk0Wa+VIVeK5vb/X
	w/3nMZa8Z3Ph1DPa9fKi+ZJvFCMSNc2e30zmUvw7ix5rYQcqt+akxfQpVs/B3Ci0Zh1Hdlf9YXW
	os1pOdK4ZozoJIhT5L5Uwme51kJp6c1dgoqsqLQx/ODUBcuANZfvY/lqfUFUIFW4ZyzThVLu8AJ
	hbPILywwP6CovQPfzDSGu+oQKXGa6lxAHptsPt7BBFzmV4VYpQH2ZZj036z1s5urS1byCe3VUrZ
	uZdfk7XC
X-Received: by 2002:a05:6402:a58b:10b0:67b:8974:1cf2 with SMTP id
 4fb4d7f45d1cf-67d6489fd27mr9200739a12.26.1778484315242; Mon, 11 May 2026
 00:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afiNrr4Llm0LWw-5@ninjato> <20260509091208.18346-1-jie.i.li@nokia.com>
 <20260509091208.18346-3-jie.i.li@nokia.com> <af8IB46ST70lXVsk@shikoro>
In-Reply-To: <af8IB46ST70lXVsk@shikoro>
From: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>
Date: Mon, 11 May 2026 09:25:03 +0200
X-Gm-Features: AVHnY4JTLQTwre4BDMy5zIVUfyhZspJrBjZiGJN2Wra4LJy-KKsI_b-Tt462w0U
Message-ID: <CAO3NRJg3wPVLgnyd=eD=TkkS5J24ww9WP3nNuiCnCL8=aLEmwQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: core: support recovery for single-ended GPIOs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 41A775091DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36507-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Action: no action

Thanks for the heads-up, Wolfram.

No problem from my side. I can send a v5 rebased on top of
b47bc7c022dd if Linus prefers, or leave it to be resolved when
applying since the conflict should be trivial.

Thanks,
Jie Li

On Sat, May 9, 2026 at 12:10=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Sat, May 09, 2026 at 11:12:08AM +0200, Jie Li wrote:
> > Currently, i2c_init_recovery() only assigns the set_sda/set_scl
> > hooks if gpiod_get_direction() returns GPIO_LINE_DIRECTION_OUT.
> >
> > This logic fails on certain SoC controllers where open-drain lines
> > in a high-impedance state are physically reported as inputs. This
> > leads to a "deadlock" where the I2C core refuses to assign the
> > recovery hooks because it incorrectly assumes the pins are
> > input-only, even though they are fully capable of driving the bus
> > low for recovery.
> >
> > Update the recovery initialization to use the new
> > gpiod_is_single_ended() helper. If a GPIO is configured as
> > open-drain or open-source in the firmware, it is safe to assume
> > it can be used for bus recovery, even if the current hardware
> > direction is reported as input.
> >
> > Signed-off-by: Jie Li <jie.i.li@nokia.com>
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I overlooked that the change with GPIO_LINE_DIRECTION_OUT I suggested
> for this patch is at the same location as commit[1]. I already pushed
> out said commit for -rc3 and it is, thus, already in -next, too. No big
> harm, but there will be a little conflict when applying. Sorry, Linus!
>
> [1] b47bc7c022dd ("i2c: Compare the return value of gpiod_get_direction a=
gainst GPIO_LINE_DIRECTION_OUT")
>

