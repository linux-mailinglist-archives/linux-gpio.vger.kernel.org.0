Return-Path: <linux-gpio+bounces-12867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06A9C5918
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4163CB24062
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D017D70817;
	Tue, 12 Nov 2024 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXRyzzc2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFCB70802
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416033; cv=none; b=OreXjrc1bgsMgJjRGR2jEomfQstp5guSfgxM94zhACNarJCRsHr3U7zSWujepABBTjaapWYl2buG9kCSRXd6eHdfWO7QzEc2kVFMpz2wiJ/Z3kFOawnFy8ykUI2mJ5HRRxdrG9VgTdwQONiADbIzqyKqxz9EEEyO8wWiu7Vgv+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416033; c=relaxed/simple;
	bh=P1xR7xGhlLTGXpyL+mLl/17uDmbeFPlnXFQ3fCjlbYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNRH2xrcvpaZaayFPwns+wYYT0grtykpJsf5UUjYUWMtRRoBsTghvuU4F5/XfUEUfwzJw+qcm/d3lSz87JnEG3CgYhFnRZYj3IsZZHZPdaJXAMk/++U3bkDhvOhm1zw5YuebZQJy0UXmEnvZGrDDy7KECTW4HedMrPZciuJ/YTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXRyzzc2; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50de14e7d8cso2226666e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731416031; x=1732020831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1xR7xGhlLTGXpyL+mLl/17uDmbeFPlnXFQ3fCjlbYU=;
        b=WXRyzzc2lkTsiGm9BbnMBPJ9a+s6/4nbIkIrUcDRFe6k3L2IuTGD3a1GvlhBfTbKhG
         gqvHzroogvMuqMKSZ12lYFDjNgbmgLtnMn1oDax+TVBeIuWqim+g3+CPOE1iL7Su/WTO
         28rcU/vkzGPCvgm2tO/9BYMjPlaYuHFm78cixTXl34ry02fnlqgSPn/UBhWGDQQADgzx
         yhi7FFY7+nw0g53gTufnlQE/x5UD4E2TKxrPAaPjtK7ywTvzfusORT7IyL9FrNMPHL4s
         dNMNzf8IfLkVDWhkROHO/KIjgo7plRAl4G7J4yZLP3kN7/PLYiPZkWXUyk+2LoPGFVST
         y3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416031; x=1732020831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1xR7xGhlLTGXpyL+mLl/17uDmbeFPlnXFQ3fCjlbYU=;
        b=lIHqS4MWTOVYZKdyOUq/f7iJc0Zf9ABZf8MJuCLw7BclCgbQuWpzxwU9HaxijH+aRB
         aM0y/HXbjWeRugadNIVbn3qU2QrkcEkgGFxmvSlh46hT/cysOHPcNl5p2KQ9MJjQw5Y2
         Uo4Y8I0+33B6VRrxIxf5j8UVsJvMeMi3T+h++Z+b2BkZP3tRZnR/9FYefy8JiwDax7Zj
         dvv1vLcDvVgh6uN2nYlBvixxEj/xhEIW5JqlUb5mOGw7yeA3rO/D2rnCMGPBFD4z7VkK
         Fz6MtDboGVae6tpSGZFiVJeZBx4ORyYHHTLrWwp5BJh6RCRe3pFKuCdXDxvdIifhhIFw
         dj1A==
X-Forwarded-Encrypted: i=1; AJvYcCX1JI7l/uAQwM6NfC8NaC+4jfiliSkXtjhftJjlkXK35Q43eRjS6ODtWwU8QLN8rEhWGRCa6lnVUpbw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61PAqtRqkiHthoBL7x56JqkA54e5vFvbCvfc1CBUlO6sPPzZo
	88LIavDWcpWqg8DBnDqQoeK8kPJNxwIWHdnhIxKHcGd1lZcA1vbpv6rYfzpN/0jpMf23339BklX
	g1MAeqxjV9e4iJuAxsSt0t+6Qa2M=
X-Google-Smtp-Source: AGHT+IHJz+tuRpawZ9yBcxFf0yh8UN/9pwcs9eAulAaLDP5VZQRaM37ssQdWdVBv2qK1R6cPa/2UrM0Qeh4AKx4MnA8=
X-Received: by 2002:a05:6102:441e:b0:4a4:8f4f:136e with SMTP id
 ada2fe7eead31-4ac297d87f1mr2223337137.15.1731416031049; Tue, 12 Nov 2024
 04:53:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106142248.305219-1-vfazio@xes-inc.com> <CAMRc=Mfm68m52UicB8ZvTuc_Djs-4jzUo=-6YmQzGtfq0BDOmA@mail.gmail.com>
In-Reply-To: <CAMRc=Mfm68m52UicB8ZvTuc_Djs-4jzUo=-6YmQzGtfq0BDOmA@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 12 Nov 2024 06:53:40 -0600
Message-ID: <CAOrEah6U=c-JJqcoHqH7PpBQ+T-MuAm-Qk++QGpqx1QTnG=Ggg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: generate CPython 3.13 wheels
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 6:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Did I get that right on github - this should wait until the typing and
> other reworks are in place?

I think we can wait to _generate_ wheels after the typing rework is done, b=
ut I
don't think there's any real reason to delay accepting this patch if the
content looks ok to you

-Vincent

