Return-Path: <linux-gpio+bounces-27284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD0BEFCBA
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6F03E02D8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC5B17597;
	Mon, 20 Oct 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ChvmfHxP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087351E0DD8
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947618; cv=none; b=kPZoD+Cn7skZHiaNAkVQEBJh5SZdoELUiuNkER+Si5VDAOP1SrWnQ4U6hr7bBeqE+3vr1uCrz/9S3kQrbq4oyE3HScBRQtitBn0+2pSeYCwi+haKrqjoz9DI2XGfvEZty+IlGpUv58CQXJiIRSjPlNH54yNcSZyxOxmFzEXsQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947618; c=relaxed/simple;
	bh=2N4OGTa3rtpVqsCUmLw1+yGLYM1aVUWodNNb5rGn3LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlwo8PuB/sf35OUnppP+RNDLR8MkD9Iy9qqB1OfEjQr5Y74EattR4HlVJ9Xa92nc+dqyCN2ghdtmyaE5doMV4jV+hha4UBtbpKIKKEHq751XeBHVDLOLAAPlJS8cfbECbj4Pc3IfaPXB5drVinOTbWnBnIYYvUzziaHbo2F56i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ChvmfHxP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57e03279bfeso4633475e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 01:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760947615; x=1761552415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mkm6279T3HUfgpQGhHQv/L3gfBoclYPQErPb1Lc1rZ0=;
        b=ChvmfHxPcsr5oqTyaxzEOErFjKsRbpf09iwv6M+YbNAHO4edqM0U6qkbAkUwnZZjKU
         8cQvj2pILIh2k9xopW6vPOWlItutE2bletpShfdMLoFofqlREKbTn/p5Apd5gyAwQgPd
         yDl0EKvnZ92QivHTJATl0ay1X+UQclLSgTEQv8FWL7IKjQsUAukDS63ZjXQQ3Q+xxbOQ
         c3lYSMi4BPMQO8+omYkoJ0VV1hdAyPwnBIZpD3p4zP2upW1QT+mxomFglSFH1oCLdAB2
         xIlW8AauyZvUQ9+HZ/9RlRIE/UXoPUyj7h3t5UEOzK2V383s1k9U1KQD5/LrdEpisnd9
         bQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760947615; x=1761552415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mkm6279T3HUfgpQGhHQv/L3gfBoclYPQErPb1Lc1rZ0=;
        b=azSy2JNs6DtpVsu5VvpoF6RNllCiKTjEBmL4OpbfqHMQC2MelQIV92iP3T58av82AE
         ZYReE+fEugVf8lBcyuc0ngTG8o1Ov62luaoZd3yfZXApUPk1/Iqnt/8Sj25GNLY1FrM3
         /hcJrgCzofVD5FAHOTAbSCDigRDLmeph2/DkAPt7sqOIZuJfwlhACnhk7qJhSzg5DFoG
         nlfWTkcIwQNJp4pbElnAfoVC+ZFeXz9O01tK0D6zLcM3uC1Npy8g24Vml6yYmfjygddj
         aULJOu2Vu9xtaNO6B28qIz+PW2+e955M6essRlM+K5LIrOpeQzYsNYqDZC/0Xp9i5fBH
         JovQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO8Jziai70Xzfty8xYCX+q0YyBQi0yhjzHF54kBWLKl1AtlULKtiYxeC9PC+uKTkZtrV+3YNgnQZRV@vger.kernel.org
X-Gm-Message-State: AOJu0YzPT27isZmWksAt/mRY3Kdub2rUisFE+FnXz0RrQBrVX3oXCq9R
	oFrXWZ3YDmGjQ8wnSZBgJYuxnU3z3jJMm3bTOnXM4WimvwuBZaHwyVPIx4yMxQeITH6yrtUDLIy
	TqT8y5aoyazqKOZjdV9mj0yJho7cZKaFDp3wYxdX/mw==
X-Gm-Gg: ASbGncvavO4/IVGqvJYqedl3cViK3nsLQYG8t2domkiM9v6zLMcAILKk1R4OUFvmjSr
	KLIb0yJmpL4xbpxra1VK+UcvfXCX7y/1WX3OavHyqmuoNS+M0K7fb19Vy9gmxdLNJ3yur1CO0K5
	DI7RDC9P4d5i9/dAoV0qM+FrZtGto7bnLbAJ5XhaNbbawa/rqVO1hK0GhJpDboe81p/Icg1hrKu
	0SwfKlhj+8jou7fz9ZbYhoJ0m1dSy5tG0QTEGzJYruAbDqdlDs129b0HVlh9X7Jlgzu8NQL18iL
	m7NfSKtKAsrZ9G/fpoTav64MHIM=
X-Google-Smtp-Source: AGHT+IEnXnRGs3SMCxArSB4fSMudVmkeEhYn3XsDaW2U3rT4w958z2/aG9YTzEXKt0OOPBNno6cCif5OzOylxpizFcw=
X-Received: by 2002:a05:6512:10cf:b0:57d:cdb4:5b94 with SMTP id
 2adb3069b0e04-591d0b42497mr5006809e87.11.1760947614999; Mon, 20 Oct 2025
 01:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-3-6d3325b9af42@linaro.org> <aO1dBgPZfDJTsPfE@smile.fi.intel.com>
In-Reply-To: <aO1dBgPZfDJTsPfE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Oct 2025 10:06:43 +0200
X-Gm-Features: AS18NWAY7ksNch0utlYlmtfhIIguLjMNDdOQUCfuHVJCcKTUxj14rMyFhjwQYVM
Message-ID: <CAMRc=MfOoHn+mLRpQBEsC3g5sM=VZBgVffsm68CAXJBHffPxdA@mail.gmail.com>
Subject: Re: [PATCH 3/9] software node: allow referencing firmware nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 7:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 06, 2025 at 03:00:18PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > At the moment software nodes can only reference other software nodes.
> > This is a limitation for devices created, for instance, on the auxiliar=
y
> > bus with a dynamic software node attached which cannot reference device=
s
> > the firmware node of which is "real" (as an OF node or otherwise).
> >
> > Make it possible for a software node to reference all firmware nodes in
> > addition to static software nodes. To that end: use a union of differen=
t
> > pointers in struct software_node_ref_args and add an enum indicating
> > what kind of reference given instance of it is. Rework the helper macro=
s
> > and deprecate the existing ones whose names don't indicate the referenc=
e
> > type.
> >
> > Software node graphs remain the same, as in: the remote endpoints still
> > have to be software nodes.
>
> ...
>
> > +enum software_node_ref_type {
> > +     /* References a software node. */
> > +     SOFTWARE_NODE_REF_SWNODE =3D 0,
>
>
> I don't see why we need an explicit value here.
>

It was to make it clear, this is the default value and it's the one
used in older code with the legacy macros. I can drop it, it's no big
deal.

> > +     /* References a firmware node. */
> > +     SOFTWARE_NODE_REF_FWNODE,
> > +};
>
> ...
>
> >  /**
> >   * struct software_node_ref_args - Reference property with additional =
arguments
> > - * @node: Reference to a software node
> > + * @swnode: Reference to a software node
> > + * @fwnode: Alternative reference to a firmware node handle
> >   * @nargs: Number of elements in @args array
> >   * @args: Integer arguments
> >   */
> >  struct software_node_ref_args {
> > -     const struct software_node *node;
> > +     enum software_node_ref_type type;
> > +     union {
> > +             const struct software_node *swnode;
> > +             struct fwnode_handle *fwnode;
> > +     };
>
> Can't we always have an fwnode reference?
>

Unfortunately no. A const struct software_node is not yet a full
fwnode, it's just a template that becomes an actual firmware node when
it's registered with the swnode framework. However in order to allow
creating a graph of software nodes before we register them, we need a
way to reference those templates and then look them up internally in
swnode code.

Bart

> >       unsigned int nargs;
> >       u64 args[NR_FWNODE_REFERENCE_ARGS];
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

