Return-Path: <linux-gpio+bounces-31822-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFUtDgEplmnxbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31822-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 22:02:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D03DE159BDA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 22:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 303DD3004901
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC39348469;
	Wed, 18 Feb 2026 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/zmjEpz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01143242C8
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448573; cv=none; b=lVbqwNiKI1yWfNzWU0rpnwUPmyfizvje4a048o+9OLU6sWolMjiRBiUye/7ykwXtgqF9xnmLKds8BB6cpzDNRlzkpmnFa0DP+UCQdE8dYq6CYzuBh1JxYfT+sHXpH+r7fwVGoL+cOih2ttkn/HHC8MZMZd1pp+SwH4EDPRydyPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448573; c=relaxed/simple;
	bh=MZZPzKZy1Fp+fNvLtQVklivSgxRjmtz/6SJAY6gzE4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtHC6rG5O0VJbvnDxCJQqJiqqz49AYps5vbRS0iMZ7eNI5eyscfcv/sSBmQtHGJPns0AIY3CD9afJsvbbuiZkOqrJRBlnPB/BEqYX1N2y/k2Im0WyBdgUKrTfcWuQAmrLZ4C3aGurUpTvpnTn4m0NdZq1bYOcyL9zPpN+QBf96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/zmjEpz; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-126ea4e9694so507582c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 13:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448571; x=1772053371; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iXwStKZfCkBmMw4vSjlUuygcZKcf6mhO/tsFkerTSTM=;
        b=J/zmjEpztRBSJV5PSZ2uZJpW/mw0ooPlWICndLFQu7bHefT3Hl34uWffN/3xfeZOG6
         kDTjNv4J9Fs0SpQAioerXHQEz0GNarFDw5TaJ4N6Se/dulai/BOIRjMmpjaYa1pi+6hY
         JIl+ZQ+bTopZ4DrwDLmid1jcTQzS5t4dBXVEz75CQDy9hf8hpp/DNF162x62zfGouwVo
         zSj7UI/xDcAll0dXhS+pjgnwq8Ocy+TitCxeLlAMxfoINXB84Fa2urpFqATPMEUZf/mq
         HHTbT9Mvz3aDR71ntH1NWPCqqx8oZEE+YODQPbrI64MUvl47SX/KFX4gCTAJhdpKnMv6
         nIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448571; x=1772053371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXwStKZfCkBmMw4vSjlUuygcZKcf6mhO/tsFkerTSTM=;
        b=WkjhfwXAFZLeIUsqzznAKwRvSluy6ZmQjdvgUwP4ay6l3YSldo44+ug1bzOcL9IEn8
         8d1V4E0dMzVfTd6a0mFEtTkgd5ITaN4BurdLeV3xgy35XeuezHnPRQCHnbCSTl/45xFa
         uk/B6mynIeUGVmypGwD4+JL8lVBEp4e/l8VoLTyJ8UCPtrpl4GbDQoNAOXstYo4xhgan
         CSStrUsokZ3m1Q8d64HaFhvPcyEpp8CH7qHoe11xrrfy5kXb5qteFveZPn2dtM0pEZCk
         B0w12Wwy3yznm+2HN9zW/dc8Pgp2Zzb5zxaZQGVdN/M9SbckK0n2FcCTlK8jFdL4Q2Jg
         k5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWpaHcjkn8tTRfTl8FOp/NXlg7KEY4LfUExUcfYZ9UB57aa0MCm05ZCgHRCTRIs0UhpJPAEZxgMLPbB@vger.kernel.org
X-Gm-Message-State: AOJu0YwDNWEETAgmqTIxhASg9z0tZAVS40VChqAIa5t/5Gw1OCLeUm3X
	kkcTvCyGU4CKm74lGOfj3hSeQCZthfLHoG+3Lf2Ns1ZGBjSVy1QEgUl6
X-Gm-Gg: AZuq6aJFJhDO3TxwxhjypsjIzN9lo2KrHc35onwV1kQ0E6RvNbgoR8GmERbtk7LfYk2
	3ozqkBLJRUF5LI52GZKzOZm/GurU4NOqtpVxanfgLGqrMi28q+iyaN+GuNoGuPE1v2PUOc9lTIF
	0EaJTqGAym5/5muyXHgSNKZxDUGmzMG9TlN88nx04BopV5gGZ3wIgkP6jE3buvO6tXUNMbPu0dR
	TFx0pup3pyDiYK/rcLAVE4fCqsVkeToeX4y+diG+I0p3ZNM1jT5L2ix/35I+lxugabsXEIlL8dp
	7oMh7efkJxIuzsSQX1Q8Jo96dgQWkMUhqezGjrIQ/UGAiPw2qZ2sxdKpuMhe6LQBKs6uAneLwsq
	riStva5RYF37SZa77QggSdLmxe2kGmQ+02ieW1231QRDid8nLuiBI0oio4qnvuo+fExtrbo7mSV
	eBTx7+LN+sNHeUN8TH+1UQ4BXkweV45Dv/44aH7mvrnt9gORlINkeAw9ECP9Jd2AKQ
X-Received: by 2002:a05:7022:6285:b0:11b:9386:825c with SMTP id a92af1059eb24-1273ae66b03mr9158229c88.41.1771448570753;
        Wed, 18 Feb 2026 13:02:50 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb6782e5sm19215556eec.29.2026.02.18.13.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:02:50 -0800 (PST)
Date: Wed, 18 Feb 2026 13:02:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/7] gpio: bd9571mwv: normalize return value of gpio_get
Message-ID: <aZYoZU0-Ttz8b1s4@google.com>
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
 <CAMRc=MeZ9AmM4uMdFf=xkq+XuHxi7ObkZonihZmHnv3w3SdsFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeZ9AmM4uMdFf=xkq+XuHxi7ObkZonihZmHnv3w3SdsFA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bootlin.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31822-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D03DE159BDA
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 09:23:38PM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 8:07 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > The GPIO get callback is expected to return 0 or 1 (or a negative error
> > code). Ensure that the value returned by bd9571mwv_gpio_get() is
> > normalized to the [0, 1] range.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/gpio/gpio-bd9571mwv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
> > index 7c95bb36511e..cc5b1746f2fe 100644
> > --- a/drivers/gpio/gpio-bd9571mwv.c
> > +++ b/drivers/gpio/gpio-bd9571mwv.c
> > @@ -69,7 +69,7 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
> >         if (ret < 0)
> >                 return ret;
> >
> > -       return val & BIT(offset);
> > +       return !!(val & BIT(offset));
> >  }
> >
> >  static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
> > --
> > 2.53.0.335.g19a08e0c02-goog
> >
> 
> Thanks for doing this. I think it would make sense to backport them
> all the way to commit 86ef402d805d ("gpiolib: sanitize the return
> value of gpio_chip::get()")?

I do not think this is workable since the breakages are not limited to
dtivers/gpio/.

I would recommend reverting the patch for stable, but keeping it for 7.0
and working with maintainers outside of drivers/gpio to make sure the
fixes land in this release cycle.

This way you will ensure that new drivers are not adding tech debt while
not punishing existing users who might not be running latest and
greatest kernel.

Thanks.

-- 
Dmitry

