Return-Path: <linux-gpio+bounces-39620-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZgdOG+XTWqP2gEAu9opvQ
	(envelope-from <linux-gpio+bounces-39620-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 02:18:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A71267209C9
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 02:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GNO9n+Xa;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39620-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39620-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1465301BBAD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 00:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21CF1DDC1D;
	Wed,  8 Jul 2026 00:18:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644231A5B8A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 00:18:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469932; cv=pass; b=kYIf/hK1bAeYVqgyLzaAsdv5xC49jgKxIl9S7SjU+hZr4+4F3iZkZWtql/yxZFcoAMS6qm7Vi5c+ybwKwwJKaw1EYg2mPFFdjJGtc1qrOf4pVKHRwBkguEXD2xmlnyJ7qQFgKeYXsVhWesO6J91nBlUHDaRsr8pzQU57uckXfbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469932; c=relaxed/simple;
	bh=h0kEDvJmvrIwjVeRvKLvkt5p3k0dgNwG24okDayHckM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YS9F6NLlIcOLIpp1/20vamejDntZn2sTVCXIZglh1lCnL8ELxQfdAAGFUi0IuYZ7mC9+LN4EMyoscBnvJz1iUcsc+pe2aUwrxo1HpJcjH3PaVIQG+VGsbzBRxT8PXsbd6gRMwB3sh1F5Iu/JyW1jaKQyTk0e66B8+0VG+HRYcW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNO9n+Xa; arc=pass smtp.client-ip=209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so167570a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 17:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783469930; cv=none;
        d=google.com; s=arc-20260327;
        b=cjqXg2PMXdeOrmq5II/fPDgz0EDFGciW0QdOH/8Rv8v33cCspeUyMhNgBP3s5gkUrW
         m0xXVgAoYvK6lrraa7iG2weiBlMaw2rQfFGIYSCzllAepjbdcYA+V0J2mHNmXXYD833I
         SCwa5iUvOKVyBV2ArXznx7KQ77NTeLoBjgEkoqwkNUcECqlbA9ACQAbbrkJVYH21HTb8
         9WklvUPdF5BcA210JGgiNISDSlKLSrRwhkfIOofaYT7m7DkY5YPsRCV5CNRQctXgYWa9
         X9ihOl7qHEuTY6rILmdJnnx2eN+OoeKl9cnIzBL9zbWtgE0aciBTBWqUGbE370nehtzC
         xe5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0kEDvJmvrIwjVeRvKLvkt5p3k0dgNwG24okDayHckM=;
        fh=9bl8MKoWhTSP0GAJkyoHpC4X8Fd7lZ/gHfVa5xEztRY=;
        b=EY662rIUqd6G0baDS/ipPnsMwaPlABmzOR39ZiVPvrsby7cJuzrpgcgN4tsPsUZwrU
         aAJ9gyoUKimwujLceY/HxWKB+bCXtVOy5IhU0WxO08X5orb9z4mFmcscDy8hR+AJspVo
         sQAc7jQ+aG9CqMQFKi+POomzDW4RW/RLkdNqkFgqnH843sizmgmMwzZfuYaDnrAQ1oip
         +YUxJjnIF/rVoCxjwIJN0BI+cjUXsB0Hx6KQx75n47G6BuzRyEezA70EYYWcaAGpZf46
         qNlox6zr01zhkzpD5sk9IrBaMDnGaSlK7g6k33/QofCAMRtGQkh31k7WyxnltTDqEyVM
         h+iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783469930; x=1784074730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0kEDvJmvrIwjVeRvKLvkt5p3k0dgNwG24okDayHckM=;
        b=GNO9n+XaJQFhxfdBOU/KmmdxJIWsuPCL0NS8aet+efJYy4v0HFNEM9fFf0CGgpMp3G
         a1c+RsziGkSMe54W5MgI3ejrKtgU4Y3pylejRwj/Lnnmkp0vQ2LEnPm6eAbY1H0ia9Of
         wW5W9A4D8yLek1MuyjtcX2gGEkksb/SAbsWjbpHY69yTBntgYrwBhohDCrY2wzPXmueo
         ttogJRCY2TOmkOW2+kynTpNX0QorUzq8PJCtC0hh5IdN2dCBbRP8ZYQlh2lb2GkthsC6
         2DbSoNtlw2JPewgszeFBXiGFkC8dAsN1FozWCqaLoyTWowEDfp+ESBVMTVbyXoTSvbQH
         k1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469930; x=1784074730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0kEDvJmvrIwjVeRvKLvkt5p3k0dgNwG24okDayHckM=;
        b=GaSVHG33y95Lt8QTqmxiDm7RBRW+afIERz71UZG2HccFzsm/baMY4oHYBMkFZ2svp4
         6YWcVblYDK8kkxY+AWslAbW1qT2VlqS4f7/Mw5tFSt35aeTPbUOfCwIamIIAFyF8EviC
         RbzBzBvoBGZBj+GnntMIwX+SYiVnriwCvdBMSCmVCTOiOBKT43Ib0hL61usXxICccXlr
         RUgb+E6AHd1AaFtC/F2yejRoNfZqxMfQKsuwF/xfPlIhOXRWlDt4n/YRzZ1HZ62F9CQ9
         eVXvDTBk0lwhsKOjeOLiG50fRDAiUfAUvpwY7hoaEqNzbR/tcJFFYYOa/A8dFEW5Rf5E
         Mvug==
X-Gm-Message-State: AOJu0YyUGYR8wUoCK7Z161oSJRXXx2mBE1pTOrFAaF2pvO0b6RrtkG80
	arxHhKCQmU3b8yYtutcIH5+pywb4GFgSnsccEcsS6+H2Pmzxlzrwd4BU1gAMTwPq7wqCkIs/CcH
	Euxv3t+GOiKwUHotHNQm44dAS6saf3VU=
X-Gm-Gg: AfdE7cmHZMoJmI2yzcGhM0sXla2HwDCkpSMLfHqqBYsqsEBYh1x5OAnX8dIV0OCvqis
	mbbhCQAtS9wTUNB3FYe1VV4/PLX8yr0S4Gv4ah2GYjct1XlXlLHdHXciCrEN/qjP/+U+NWYq3x4
	n7EZPe31xfOc0MW0uln8d371ZdMVwZuI8QjWrTG+nFZhGvOTtJUrpIvNDLWH8R6Z43uAruvqjYf
	IOzTx3Fdg0qrWdBJIJGHN0qZz+uonP6AAUKiUl/lbGK9PZx1J8pjMsy1WZz6IClhZ6BuJSr06jG
	TDn0CT7xq7vCQEvuy1eKOw9SjyRjuXNN6c8HkkkShIJ3QLy5xJWqcITdJFCzcgR0LM9cGlSYlrt
	ZQnhWuvbRFjf9g5CXAqprJEsHw6RGs3NzlaMcX3muM6bW/I6hLYOZxfbOwR7H49MHL3oO+2qZWT
	XNoBeYdHM=
X-Received: by 2002:a05:6402:5d1:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69ab4497e97mr11740a12.21.1783469929463; Tue, 07 Jul 2026
 17:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706232223.774895-1-rosenp@gmail.com> <akykuME0Y3eLOA2q@monoceros>
In-Reply-To: <akykuME0Y3eLOA2q@monoceros>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 7 Jul 2026 17:18:38 -0700
X-Gm-Features: AVVi8Cf_ouAmT7cXa_N1zMDYiLzFQClVJ7CTsObXQSHkE2rizAqIrqj7qRLUtQ4
Message-ID: <CAKxU2N9dHfS_tRypZmHNSK6+AU+BDaB9=P7Y4xtq_++QDaD+cQ@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39620-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:andy.shevchenko@gmail.com,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A71267209C9

On Tue, Jul 7, 2026 at 12:13=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> On Mon, Jul 06, 2026 at 04:22:23PM -0700, Rosen Penev wrote:
> > During driver removal, devres cleans up in LIFO order. The IRQ domain
> > was created and its devm cleanup action registered after
> > devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> > chip was deregistered. If gpiod_to_irq() is called on a pin during
> > this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> > irq_create_mapping().
>
> Without having looked at your patch, I would expect that there is a
> similar window during probe where calling gpiod_to_irq() between
> devm_gpiochip_add_data() and IRQ domain creation results in an invalid
> mvchip->domain being passed to irq_create_mapping(), right?
This patch fixes that.
>
> > Fix by moving the IRQ domain creation, devm cleanup action registration=
,
> > generic chip allocation, and chip type setup before
> > devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> > first (preventing new IRQ mappings), then the IRQ domain is removed,
> > and finally mvchip is freed.
> >
> > Fixes: 644ee70267a9 ("gpio: mvebu: fix irq domain leak")
>
> If the above is right, the referenced commit only creates the issue at
> driver detach. The issue at probe time exists since
> fefe7b092345 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
> which has `gpiochip_add(&mvchip->chip);` before coping for irqs.
Will fix.
>
> Best regards
> Uwe

