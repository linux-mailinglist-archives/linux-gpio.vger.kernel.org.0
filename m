Return-Path: <linux-gpio+bounces-34443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG4SClKyymkX/QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 19:26:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A535F49A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 19:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70A730480AC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 17:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EA93DCDA4;
	Mon, 30 Mar 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V76BZqIs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC63DC4DB
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891489; cv=pass; b=UgVht3S9NeKktnKRnhOoRm7U+9gD9N8gmRsqAFpGlzkYfF2G1YyOCCnXQr1Jw8PmIv3dFzbfEScWej8+t9Mqi5A9npQcejyqDkhM+8LrUrOd3rE3SOQ6zA3Ryc32qIpUZ3SDEWiWxCf4MUjwv16m25BuCLouKLAM3w+pN73AqaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891489; c=relaxed/simple;
	bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoyIabx1S/+Closu2Yhd2YB+xK1vhJh3PPdYLw+EYY36oj5mggOviL7dX6xuFZPbGIrM+yq0pZwzIRWUJoRucliPt1Y+posZyscrYasuuOtiHNVTlITDJKzj4aPtrvSRmo05JmmEkUFLDtWRSZkRu2Byqtf2nU6ACyLBcZmY1AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V76BZqIs; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97bca3797dso730009866b.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 10:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774891486; cv=none;
        d=google.com; s=arc-20240605;
        b=PFVKdt+NO9Ze3uZbLZEIkO7JMQk4YIGAo6i1GtKNTJGQjCqBfGELfnLiE7V8GUk9dT
         G+rkvEWwjtWVAOSLGwMNj+vPR9vHYSywrH/nYnPtIjZ9HVEDtKVl+JEQjicWmFjPFC42
         xRXxdDp5t0xBdxV0nhhRK/zZIcoGfc2ef0IDpsTslO5RJmEamnEkS4+e+aft0IxOh1AD
         2DPKFdc5A8apSSEVnCrcYt+B5Bg4zgRhzoPLL3U8l6uV/eDJ5u4fuEzCLwonBuD4lKxj
         AUdmjqwpPLN5FFzHlYaTT7TFxhWNAb1iuCgSJLY2HRQLA9cpZDNJhzPCzAG/Q2TYxdYE
         QoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        fh=MNu6nSsH7ZH/pROHMsIn+wvvuW4WuDo/jn47qmWBZeM=;
        b=N6M1ggdRtErUEmmf2Fy7idkvVsvACAtVy/RAcW2sdNDJDzNJIqRrECufcX4miGTeVV
         noFK3jLwT5MmV2Cq/wv40LpMdpaAybiTsW62CFlkesLN4Qow3jImd+8kSdthwf+REz3i
         zlY8QDDxsxGR9BS30SOOTxUJFk69OJj44f3wWiFL9vHLROpZmXNWDJ9nGpPoEvDIlTml
         QaFfoqoslZQxwOTfA4hTJ5eOJnxD5s798ZKEUf0wMH/cz6ubj3uGgZVL6sna+mZSrmXt
         e/tzxi6duTxL7Suz3AVH6tM1p+Si5+iTk/IJW4kToQ3gfPZqLhSv+5UfFcpejgUNOMyI
         hv/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774891486; x=1775496286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        b=V76BZqIsg6SY28n+CDDu+IH++PLSb8MJSlRIvY02cnLUWXpaxB91LN/qlH3xzlIxCx
         OJpm0KiBuf6pIWl4hS1tBcqhmkha9q0QN7jpVlN/RWZSajGpxmqtZstQppDr8zTLHfCl
         7/3yLIORDyGDv/FwB7cjm/RynB6KgTd3CbCbcKooE15JDQcnwXYC3TG/cD+TSmFNry9y
         qase5dwhuuHQDJ75vNqql1kmgBxzGIcszCChHk74hP53Qdi5sFznMywjfIRhJmz89xoa
         FPIC0Py+qZ9XjashK4KXSbxEdCIEca9UEaypsvN6Gb+8PtPdnCYX4WzuDT0B1re+KOEK
         PpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891486; x=1775496286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        b=jef17MUI6EDQfK5KeUDhLZldUWAWCKoLRTesLot21JWw8Vfd2d7CNFOo7HTuChmnMQ
         8wVvx4blGXLAB0mqygZgadvVo5Wr0OkCKECF+PbIC/s5apL2K8f1n0mzoBPnCApXFptp
         kY5pb4IUMkqvz2H4AYQUuJV+wqflVSDSK/U1B/EZHrcSTODCy5MSfioV6SjIzGv5fCtZ
         YKqtIMJFwpyXKAORbFvQFAMsxUyzo6r3WSi14HVJyFBjoyszim/fK7tV8DoTsb2gBSuw
         1LTxla7rc/I4+rMmbV1sBNYOFIDFuMidcurHj86YunCa0R4/rrHKIMsPrFOT+TOwATNO
         SSiA==
X-Forwarded-Encrypted: i=1; AJvYcCXV1c0z9HP0e53Np6WNdqkMRYtiRGsRGDxw4rqVC1/7TohmvHTKSP/OE5ykcMJ8WWELOWcnzpfSrdZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YwgFJEwP4XyiG+6BjUr7234JwyfLYVhcmsQimuIfHGhIQXVS9Ca
	52fB26NLpeknVahXqP9xk22exWZzoSXkWqa2xeATH0zc7mZbkkJJRLwecxSFVrWUJz2w1tGZChU
	xUuGVlW05Ya6/Y6JpOHiGY9kjkTd9BQs=
X-Gm-Gg: ATEYQzx7V5b/Up1shoLM5vVSNtT/XULlf3GNkC8iuIO+2wdOUsNnWUp3iKEPXjSLviE
	dIluPwkZooNpJmrpVcECWddmshRH9LZayxDE18tseyhw5qPXn0bnS1xhf+6fBD+ebrQvum7ydss
	dDPGsnPY6hJjfdGuNKW5U+Fb22yBwCu7NE7a2B6krvxTDvmDX1Nl9aAbOWJTYR9OU/i2hc7guuk
	o0apYWmYf7JvTHeeQuoeUq5PsFroiPcaK1DzCHBMm6a7KoBhPfKoX9wcmrcp+a+7ZFOeSGAyUD5
	i0lVb8xFB+PYVUZSjjoqvHOSxES7BqABcYMk7pRwlrmUBMQa7GNOi3GlwbnHgojrEFKXUz0Wguv
	1kFK7Rq4=
X-Received: by 2002:a17:907:9626:b0:b97:554:f12e with SMTP id
 a640c23a62f3a-b9b50350860mr690721166b.14.1774891485468; Mon, 30 Mar 2026
 10:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-ad4692-multichannel-sar-adc-driver-v5-0-11f789de47b8@analog.com>
 <20260327-ad4692-multichannel-sar-adc-driver-v5-2-11f789de47b8@analog.com>
 <acZrthJYQX-h_9p5@ashevche-desk.local> <LV9PR03MB84143540CE505514E1CD84B4F752A@LV9PR03MB8414.namprd03.prod.outlook.com>
In-Reply-To: <LV9PR03MB84143540CE505514E1CD84B4F752A@LV9PR03MB8414.namprd03.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 20:24:09 +0300
X-Gm-Features: AQROBzDi52qTqIm1Vf3lVJqwmlc9iA41VGN7nD3k385cLEOQCXsLlg-VEZ4M7zs
Message-ID: <CAHp75VcUCM8aeUpNaFEXnS+Cm08Mq5j+Qp2gYqWP9vCO+9CtQA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] iio: adc: ad4691: add initial driver for AD4691 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	"Hennerich, Michael" <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, "Sa, Nuno" <Nuno.Sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34443-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,metafoo.de,analog.com,kernel.org,baylibre.com,gmail.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 935A535F49A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 5:20=E2=80=AFPM Sabau, Radu bogdan
<Radu.Sabau@analog.com> wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: Friday, March 27, 2026 1:36 PM
> > To: Sabau, Radu bogdan <Radu.Sabau@analog.com>

...

> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> >
> > Hmm... Is it used? Or perhaps you need only
> > dev_printk.h
> > device/devres.h
> > ?

> I have checked this out and it seems device.h doesn't actually need
> to be included anyway since spi.h directly includes device.h, and since
> this is a SPI driver that's never going away, it's covered. Will drop it!

No, this is the wrong justification. IWYU principle is about exact
match between what is used and included in a file (module). spi.h is
not dev_*() provider and may not be considered for that.

--=20
With Best Regards,
Andy Shevchenko

