Return-Path: <linux-gpio+bounces-26194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D6B58FEB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 10:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6779526B20
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 08:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E6F2820DB;
	Tue, 16 Sep 2025 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Id8m7Ep+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE527AC2A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758009716; cv=none; b=t67mrPROq34ek0Zf5rFk6um9zn5jC0tcsypQFAET472pg8DVsJKOxwU/X/5W2PKTq9Ccv56T88YNAEaWHA55w2OIVenFFJZdnB7XANJBfMRh7R/SsRK41JTFh8mKV67EahB203ylW7y1PhJa9IJsSX7LmDcTqs0I773YWjs6ZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758009716; c=relaxed/simple;
	bh=wXcMeTe19rcFaQlZikZtXK5WXCE7I285f6t9je4Ie0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAVH4TK4YFAWNPfvTnDK3If3VgjDnzDVNi0lNidW+LJZqYucImsrBiZY5iQzMqMWCuDCloi/NOKO1HkIAeLewssCFKrowQxMJwhILQRlxsIKV+V8Ii6KEMYtt5AMXn0vd5cUjptu9h3ADdOQxoIOI5tJ47S9D9Le+CUt5hL7yvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Id8m7Ep+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b149efbed4eso157855966b.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758009713; x=1758614513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXcMeTe19rcFaQlZikZtXK5WXCE7I285f6t9je4Ie0Y=;
        b=Id8m7Ep+WNhehGIdxo6ciAuzaG+GqYir9vFkzG7ESngDQAC8zNjOPbyK67db8Kh3Rq
         TnmI3JO94OgRff5g3etnHBHbEVlfDBhamFx+St1hZYfGoNoUYGP9aLzjfrqg6R7FFK12
         4hTt4Ex0k3clt8UTXlWgKzj2S0/3gYsvU627g7gAJjpZtaIziIdXU8LCMJ/y9wsOZS9N
         qavi2B94nu3r8p9ce95mPAsyOktEwryiup6PKEVoomV4mXoZZtKepfikgRW4bfiEe06K
         E/pyp7QR1PnNlgx+MyfpLpHW6duEWho6pCNfFyPBwAo2+byZoTCpr7fbBUoT8bOEk9zT
         8/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009713; x=1758614513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXcMeTe19rcFaQlZikZtXK5WXCE7I285f6t9je4Ie0Y=;
        b=d/W974fj+/ynqkHXtVxgLd5GByu6cgHWAqXAIvKWGS8dV3QfAYWdBPRKpM2u45I3wW
         K/fE5xuFYXdl3FWOs7cVAZG02l4lCCgqtcqsK9Vqn5QwS6lSgkaF4B33BVWIKhTGtT7X
         VcVtLfpF5Kf1uL58KrZuXNEiAnNC5fx4+q8jRHe5HGkZP1J1Kgghi/s3oDnVb6vRN7GR
         hIQobiDBdY0bYxXdnwh5MQsYFapOoSjYj0qnOdqfQJFceW/7QmlNVg90RGatL5Ra9zap
         0hrdCnR7HB+yE1p0ldJ9ldTsu+LFu6Ka6RdYWaBNkTxuokkm6dGbaNcQ8r4afOkgt4Al
         bTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDo6ORdZWbnkMS3TgnuxxJkMDFA6DRquDY/i6Cw4ku52oApSC9v7iqTVyvoHAPfzFNZHrSLFuUoHJE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv9rSY+jb0S3vHo9m4sxP6r3jpBOe6nhRgMNFnLwbLzGVVzfef
	7PkzDlL8R3scAIO0Oi5wHnvZuCYbV8TYiS6MjTOWDhMezDIZUWMdg5nWT7isXyCTdnmguhMuMnN
	qi3XCHFK3a6cCXRcaIvggfwsC6XchuAg=
X-Gm-Gg: ASbGncuYOIaNym/HJS7zZPau+iT8eNJLYFKMip9gWIVqIPjTQgKezeAlC0Qy+qJCicF
	HdVSrnqZ0lFdB37s7U+B6rRR2xxOuBJ/9m2Ml+Edy44wL0dbLnnQvTUyOgFfIRtVzoTeAaglf4Q
	0Cd8x0fbibj+5y/YxEbUUXYt7rC6erdUzlPj6aOSXg1Cjf+YeNN4uwP0tcMOhIbd8WZH7xbMt8U
	i3jlr0hN/iOzrJTKQ==
X-Google-Smtp-Source: AGHT+IFBJnX4wqLoE8PDsJt59DsO/b+pSo5wgbWSNCCwyNWOJFBZBgsOigZ1rbEN9IwNq0K5Sw2tmdqpJWEGnpQtTyQ=
X-Received: by 2002:a17:907:d5a2:b0:b07:e207:152a with SMTP id
 a640c23a62f3a-b07e207178bmr1134954566b.19.1758009712799; Tue, 16 Sep 2025
 01:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913184309.81881-1-hansg@kernel.org> <kpoek6bs3rea4fl6b4h55grmsykw2zw2j6kohu3aijlabjngyc@7fbnoon3ilhw>
 <f6c18910-d870-4fa7-8035-abc8700aef2b@kernel.org>
In-Reply-To: <f6c18910-d870-4fa7-8035-abc8700aef2b@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Sep 2025 11:01:16 +0300
X-Gm-Features: AS18NWBczatmQYqD5YQA-lHL-wst3s6ZMOy4hG3tTEv-CQEt1ivXt78DgvRV4F8
Message-ID: <CAHp75Vfp2YZ1Y9-LYmw96ZjS1C_DQ19Zrfs4XLT0Q4Ow8DQr5Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Extend software-node support to support
 secondary software-nodes
To: Hans de Goede <hansg@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 8:49=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 15-Sep-25 3:21 AM, Dmitry Torokhov wrote:
> > On Sat, Sep 13, 2025 at 08:43:09PM +0200, Hans de Goede wrote:

...

> > Thanks for catching this. I think it would be better if we added
> > handling of the secondary node to gpiod_find_and_request(). This way th=
e
> > fallback will work for all kind of combinations, even if secondary node
> > happens to be an OF or ACPI one.
>
> IOW something like this:

> That should work too, but if there is an OF or ACPI node it should always
> be the primary one. So my original patch id fine as is.

I barely remember one discussion with Heikki a few years ago and the
subject of the discussion was the order inversion of the ACPI/OF vs.
SW in the fwnode list. But it might be that it was just for something
that never appeared upstream. In any case, the proposed by Dmitry is
more flexible (we won't need to change this again if needed in the
future).


> Either way works for me. If you prefer the above approach instead of my
> original patch let me know and I'll give it a test-run and then post a v2=
.

+1 for v2.

--=20
With Best Regards,
Andy Shevchenko

