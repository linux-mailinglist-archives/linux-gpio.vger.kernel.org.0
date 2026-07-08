Return-Path: <linux-gpio+bounces-39681-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lbiLC5miTmqYRAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39681-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 21:18:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFB729D54
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 21:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LyfNfdEC;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39681-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39681-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A14A303B4C6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 19:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DE437B036;
	Wed,  8 Jul 2026 19:18:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818DC348C6F
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 19:18:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538322; cv=pass; b=QQU1xLT+/417LN+IcIr3JeftR+jC06+ZZFZ9g8KS6nbZzns2SFBE0BonqRFsZkOQEaAJFIsetP4BZAsY5RgBMyKeOjaRt3AXeJQ3AD7XT1fGfn1ZCjYyt3I2/NQwnk6W5XIliAS/lipMXMIIFZ0RYfbefgGs+aZjpom3kykxp6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538322; c=relaxed/simple;
	bh=lw0BaMkBszsISMHobaKVhbZ4UpV0GZhUaZU31XXEX0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s79VXzB2IjFwyYBPYj46kmNCcCT2Bm7ofPmylK6D258mmYlvgM6UvWPdrPdv1kfu1SFmV9C4Pt0gNyFllbFE+LVx90BnFSlHu5FilO1FB4XgX3SY5/n471JDXQnhKRByIYW/Mnh1JJgkon/0mbCcMzuBSuS/tG42i29OqhwoJ9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyfNfdEC; arc=pass smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso165427a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 12:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783538319; cv=none;
        d=google.com; s=arc-20260327;
        b=nYv3fOxcRvqMSyCDRenuLVk2AaSY/GfMKlIBEUUI/ol+7cYFfZyCwbfQxXs7XUuUrR
         b1rhw0UYKya33lFfAA9cAiyd5grC8ueRE5KtStBdWBcduRo4livIgaCPMveJNbjpE9GT
         8ut+bzp9f1NT0s7wJQAg1m7QOaaoEFE2EvhDMmKS8oIlEtYd1uotWwYbhzh7LpkYv4Ke
         31imJqN0Baomdq5bXEFdDrHE0H3icxIoNaVD9C6c7SpuI0sf+FPbje+sEniiNG5bv5kM
         hlRVKXBnOfKmAmlLbWVyH5zhy+KgAzjGyUunk0oRz6j30bvGSzZPLIaPbA4w0UAkbGCt
         5CCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONw55lys4+ZjAvcn0MG18gLsihfyl5/LebG2s8wZ4Ic=;
        fh=haYkSm+T/0UzaaaoLOYqCXrCn29P2hQmN8kDojPNLt0=;
        b=SZbBjQ0PdiPWxDSSv0wwTLL6OyK1rFnPOmi0OTuttaR8YpgfFJv5Sm+yaU3e+9ZiCE
         3ukhoSxkRmyP+/9ESY7CEv1SJHOE5aW7/0e4UtyUuFsIx2bS6AH0u3dvwM5zqOupRz5P
         kqur2/lMOzpPHZzhfWvf0mVfGJK/uH/RSDaYnFiX/7nwhbZjdVcai7E8YaP9BFkNYE0W
         2H5v7LFmPf05IiHfcffYi+iK/qWvUWnECanjygVG/Om3YZLLcN978bUNFzGJWdopVp6F
         IaNTpIdYv5yFgA1woYkNmUd9gAxRY+DSRtpSuZ1WhlFj5KOz420UchRROCCbPBGAlbbS
         da2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783538319; x=1784143119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONw55lys4+ZjAvcn0MG18gLsihfyl5/LebG2s8wZ4Ic=;
        b=LyfNfdECgcbynEJ5vs8nlAGFzHv/Is/0VBlQskQ2HSTe237sR27sjQ2KTzgXghzo6i
         Rcr9+UoeFY65C9+7XHsRNcrK5zv5IHneEP4SqpMqluS2IdNnuL/UIovdaUfADODAByTm
         jz2yBrEUqth7OtedzmseT7h9b3/RAJS24aNt/wDbuQwcf4L7Xbtg7vXMiRb1FyRM6oED
         FnHKxI1ckwn7v38zQr+eiju9zRrh5s1NXaN1wQX8qhZyGnQZosdByPD/HGqSCeE9qqkV
         ikBUo8/h1y7dX7og/7IHX+6pGucKn7Xb9UdUvvAL0w1YDRd/IP6QwC0JrhZJznZUKpme
         uMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783538319; x=1784143119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONw55lys4+ZjAvcn0MG18gLsihfyl5/LebG2s8wZ4Ic=;
        b=I2zUlP97RMhtSt160ZTUnEWpwt9zqtrmfeocLRTNjOZlT47UHf/4iXxzeSJw6E8lfE
         iFUkqXvEZL5FSzkHTZ692UK7zon+Qx/ASMyf8KhHS3ftTtTaCuYInDpDFkb703dccZPw
         mBYLm8FuA2lOV/x10r72tunV4ofJncPgAFL8XLs2K9O6uOwdGn87WhUvZcV91NCqYv3x
         kXmyNIhywRFP5kZ86g8OvohJDZply6epgTalUy3UlBywuumAVQiU7YWiqBvlDAETvcmD
         pTjmL3NeXl9JyI4rugdwRfI3lXWJDVK4OlsnC5+CwwGWeJx8xS0PwONMZ6/Krbf2ngCS
         HAzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqyDqOz/6R3GR9Dvs694mFwo339Vts/+uZMkEwDIYpbl+HlKG93n7pJpqpQpw00UpieIQg05oWV1Kw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7DMdjpC+2DwNo0Hja3pcjKs90T3ikV1CU+V1HmxKUn3O7gYa
	OqZlmWaImFa6qQ8JQ9CUFawS860G91TCX1qx3QzZrFX1JZxUzWPqwFMbo6gPtJsU7no4EWZxItk
	HBUkF98u6MfSGngERl6VxHbcljLZyq8nV9w==
X-Gm-Gg: AfdE7clQu9gd909XzeexfK0bToEMF8BWImEcqEZ0Q+zvbPYebrmJdZZCAw9vYjZSJSA
	MN1N/EjUBje6Zm3D4fsdzzJOymz4TjyCzLnEMrsoHNYHvH8wHO1uztn0RDhgNglV1YsOGptGiAM
	zbolB9K1GnHpAso8mBcnOvI/oehQ16l984V51bQhYGxllfWeQtOOmiEXn1cgnag/AJ5sS5P+oqh
	fHY7RVRGaKS/O0qkB1jDgDFh6BLHbGFqxIw3lm4Vv4Bste4yzssraVvgok6uill5XFU0Q3M2cJX
	+bqRpscdfIYiNhc1ZjUyzGbbraJg77kzHV+AQBXxRsEgR4gwVLepmS0i/6aDR9FGAu28hiqRWTW
	VTxcAN0ghjk8cizSatKImgr9hbF1FxyE6KJPxSMTJki7+F3aZLc5LgryqfeTMIaFDmC9qv4T6nM
	vICT9G/X4=
X-Received: by 2002:a05:6402:40cd:b0:699:f204:1953 with SMTP id
 4fb4d7f45d1cf-69ab4497e20mr1713818a12.24.1783538318609; Wed, 08 Jul 2026
 12:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707232742.1235008-1-rosenp@gmail.com> <CAMRc=MdKfO=v99DohN=64xc2PT6mxL3VNhnx7vRp+iNuKROYQQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdKfO=v99DohN=64xc2PT6mxL3VNhnx7vRp+iNuKROYQQ@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 12:18:25 -0700
X-Gm-Features: AVVi8Cd41TlOLVbqtfrndELDAL7sUZtXdAgoacK6Km6o_in-Fwo8Z4NQ3oqlG-A
Message-ID: <CAKxU2N_FN_O1g82NVUO=0HFudnAxNGybOc55BnNhO=iyzrC5_A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: validate ngpios before use
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jason Cooper <jason@lakedaemon.net>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39681-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:jason@lakedaemon.net,m:thomas.petazzoni@free-electrons.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AFFB729D54

On Wed, Jul 8, 2026 at 5:06=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Wed, 8 Jul 2026 01:27:42 +0200, Rosen Penev <rosenp@gmail.com> said:
> > If ngpios is read as 0 from device tree, it is passed via
> > irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
> > division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
> > Reject ngpios =3D=3D 0 early.
> >
> > Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell So=
Cs")
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-mvebu.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> > index 39c1a13e1b65..c7cbfbfb4800 100644
> > --- a/drivers/gpio/gpio-mvebu.c
> > +++ b/drivers/gpio/gpio-mvebu.c
> > @@ -1175,6 +1175,11 @@ static int mvebu_gpio_probe(struct platform_devi=
ce *pdev)
> >               return -ENODEV;
> >       }
> >
> > +     if (!ngpios) {
> > +             dev_err(&pdev->dev, "ngpios must be greater than 0\n");
Sashiko suggests upper limit bound as well.
>
> return dev_err_probe()?
surrounding code doesn't use it. dev_err_probe is mostly useful with
variable error codes anyway.
>
> > +             return -EINVAL;
> > +     }
> > +
> >       id =3D of_alias_get_id(pdev->dev.of_node, "gpio");
> >       if (id < 0) {
> >               dev_err(&pdev->dev, "Couldn't get OF id\n");
> > --
> > 2.55.0
> >
> >

