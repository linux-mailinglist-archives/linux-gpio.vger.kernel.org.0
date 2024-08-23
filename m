Return-Path: <linux-gpio+bounces-9054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110995CD98
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475351F23C69
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3B5186616;
	Fri, 23 Aug 2024 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcJjW2kQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497CC18660D;
	Fri, 23 Aug 2024 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724419080; cv=none; b=XWVOqWY9cjLGMHkQo4U/QZxtwglapmIZfJWk9IH/MFXNzebatyDqYpjh4IkCYUfXKv1Yp0ZmlWiGnD0oV333SHSdl+sUSt6xd1E8f4dtv7JcrFmQNKLtV98Pm7brNikG3eArQHJqoIdIdh7rHjgj1frid9o5NaCViuDPvxEyDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724419080; c=relaxed/simple;
	bh=pfyQOkmQAU8XkzyXRFVQA9QDvSE5Ui00cEDJmg8NJ6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEVgYLThgexDl9Damh9XFEcEi4tJ3K69c9wQA3MDU+Fjd7FAxg2WjpjPWk7EmxbW0DatyN/HdGjlYP9D7ABeIIFJrIrLfTpR9F4A4K8lmSu38YMrb18jodGQ0VfCwePdDHpo8MQV+glG0HRr8b51qmkMjedWAwKn+5n409Wm4hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcJjW2kQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8679f534c3so239090766b.0;
        Fri, 23 Aug 2024 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724419076; x=1725023876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYZqtNKbUf46Y9j/NKPxky9EWjGfSIe8fIFl5OJVMWI=;
        b=mcJjW2kQ8KXfNQQeYsqUczsn082zwZRaNkrq1r9EyThz8fVghZ2McJrmfbdQjzcG13
         OPOa0yyIN1uHKYmqaoPg2l8KBkZhBSgw0R3xpBxEy3JyD1yDZTIS+oMAJ0fozXcFvBbS
         61xbQEjpjXrE+Gl7Eb6FlSu1KmLsuooIAgvefU1Ff8ZYNeV++mK0sD3ufObwCxJOX+ZB
         4OW6P+3knxgq/5YkfxJ2DleioRnIoGRrF0pto0BDRoWk9MyLZo/7fShOQB6AwOrHB9K0
         maF3JNMXTxOfL202Gh0v2sJgSqiRJOm39m/30Nk9LHcjP4CvmV0ykFlSgKaZxJuztPb9
         /Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724419076; x=1725023876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYZqtNKbUf46Y9j/NKPxky9EWjGfSIe8fIFl5OJVMWI=;
        b=tBf4W3gGicQf9f4i0OZD9E8ibcDtxTYuf9WfoVw6H1J9Q14LDVoj2F7mhQja8ymmDv
         Txlf71Nu2MS03Y6UBHHzSM6CoNGmy0MnWDnVTt3VAwpyLR+vPWMyc+j647xTiy1FxiGg
         yW4MoTWg/c531nrgw6/hNRl19VINWXcSoUv0PDTNgw/6KjNn12tqMBU8TnfUlbyhvTiP
         MIBgval8D/fABGK/pMRfgQbId6eNnfpYRVAgESTZ02QU3dvLqSe/k011m/vTw5MyajWd
         Jt9vmsx1NCI6LELloUgVvu9EZyry8orhty6eE/dl0jUHMiiZ6n+UgtrPg281TEduIYuR
         4+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAtFbbUW9aGj3igokC1fvqwkFWFvezufiIuOnzByQ1k+DEcfrQfHetXyf2EdTPFG16OTTw9NJiyW2p@vger.kernel.org, AJvYcCXSr1Tx3bHFe3/SN3BIS5tql5pbNRyx11HESafMHL+LeiDBX0tz9VuwbxaMau3VvsUr3Su97vbHCBA01KrO@vger.kernel.org
X-Gm-Message-State: AOJu0YydJpxR4C1y2gGQ/mQ3v2ijoPWSs6JAPFovRnV2bDczcjBBeDGu
	kBwZnep3SPXfQHO1lTTrNqjCW/Z9x11icVOJVnmXdBbnoAmGoGwGEQ3Ax7dmhveSKsm8EMeoKSk
	vJsmpg48rTZtuwoKaZueukH5WFaY=
X-Google-Smtp-Source: AGHT+IFb9dM2hTGAgF+mE+zRRyN4RLOmdCTv+xltJOXiNxFfV14R5W5jlIb2uXglMgqXP+bnxHgjptGQ9l74MQxF7/Y=
X-Received: by 2002:a17:907:6088:b0:a86:7a84:abb7 with SMTP id
 a640c23a62f3a-a86a51b4cc7mr182232366b.20.1724419076196; Fri, 23 Aug 2024
 06:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822230104.707812-1-andy.shevchenko@gmail.com> <CAMuHMdW2W+RsnBWdvxJJ7wOKCyM_162Hb1Xkd6id4h_74fzQrw@mail.gmail.com>
In-Reply-To: <CAMuHMdW2W+RsnBWdvxJJ7wOKCyM_162Hb1Xkd6id4h_74fzQrw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 23 Aug 2024 16:17:19 +0300
Message-ID: <CAHp75VfyPQGXT9ypp+SducvHwOgMpCm-rCXSrQ=9-MCH8b+ZLw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: renesas: rzg2l: Replace
 of_node_to_fwnode() with more suitable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Aug 23, 2024 at 1:01=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > of_node_to_fwnode() is a IRQ domain specific implementation of
> > of_fwnode_handle(). Replace the former with more suitable API.

...

> > -       girq->fwnode =3D of_node_to_fwnode(np);
> > +       girq->fwnode =3D dev_fwnode(pctrl->dev);
>
> While this looks correct, the new call goes through many more hoops, and
> is not a simple inline function.

Maybe, but it's not a hot path anyway.

> Perhaps just &np->fwnode? ;-)

Definitely not for a couple of reasons:
- the explicit dereferencing may prevent from easier cleaning up and
moving the fwnode members around in the driver core
- the GPIO library internally doesn't use OF node directly, so the
code that call GPIO library would be better to follow that

Additionally one can call of_fwnode_handle(), but going here and there
with it makes no sense as it much cleaner to see that this fwnode
comes directly from the device. This is not obvious from the original
or any code that uses np.

After all the idea at minimum to isolate of_node_to_fwnode() from all,
but native IRQ chips (basically there are two big users: native IRQ
chips and PCI MSI).

P.S. Also note, it's _the only_ pin control driver that uses that API.

--=20
With Best Regards,
Andy Shevchenko

