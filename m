Return-Path: <linux-gpio+bounces-7075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D38D82B1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D572868BF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E90412C80F;
	Mon,  3 Jun 2024 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVx+sVmM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CD9839EA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418829; cv=none; b=hosiRpgQUO7mzWPbyKN3Rk144FDlL/0+e+xM9u1l2RQNg/TMvxjSTcm3uyPPvhB62hZY4SHdS9sGm/mv2+ve0wxk2fQq1rFCA+8iJVIxZUMr7o8t3p3P4RXShTddDQ4Gl8KrOu4wpvBGzjkZJ1+xC4IKtZ2Jq9SFOIIBlsx6wTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418829; c=relaxed/simple;
	bh=wYQMmWOy6w8GCp6dcvea5enT1jX16jNtskSVIWYXpq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ7fKzkY4yocu6+51j9xYUjl0msQw90mvHX+wwxxFVy+RSJ0xCjKCCoKnJ4WTUzNf7xfG2WPwSheij0ZbADbbKP/9KQhBI+xt1I39TjjsZmM6Nprx9gW3qu+tzRgboWTqkHsfGERuDi8ru6DKCD8TwnYg8F7waRlwRMk4EEtfHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVx+sVmM; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfab2474152so393882276.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717418826; x=1718023626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYQMmWOy6w8GCp6dcvea5enT1jX16jNtskSVIWYXpq4=;
        b=XVx+sVmM1DJdwSWWMfnPks3RUdRt7YezIIc7AYiIEzNqHap7DnIzT254fd1cg0rZKG
         vwtaB6MEfqzgCiC6lGDuviOQy4QXx/FveR9G1ZQdNr/OVlRsVF1cbx/QRPmy1zcPuOu8
         Nl8jG5cFSxdvo5AZFxcNUquA3pxIJ9RTOokDTD/6XwsHxDKxq+YyAqcxIvu3CiYZflO/
         YdG5+twxMQRq/MD0y1FA7dzpgbw1pK04mot8t0qj2V+iSj4BFi9zBJi8tK5vVdvXplRV
         g+zSFQB0UnWtQU8pZaTd6bVa6VOoRmmN7hV/l83KzRNDfYETfD5r8U+861q0Pp2SuHnZ
         VzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717418826; x=1718023626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYQMmWOy6w8GCp6dcvea5enT1jX16jNtskSVIWYXpq4=;
        b=neZO1mOb5nazNKCiNhiyDOb8sQjvfmn7NHn3slV0rhgyuAN/d+VnqPEadnEDwuZCgI
         YFnfi+SsspjihtunR5wlKXMB7MN1mi7V2kbRTeVDiEwsuoyUeeS179QnzOYk2fXmHCFk
         j8ZFGgtPvAYHvyfnVDBESRi3BwRR2bxPQPLKKtx7AKG2jR145lMaMY9g/Inupy6rK9ml
         TZFUfhzuhtaO0RBIGJy/Ylh5m/5Ve45tAwxTrSZQtCNnEy44lGe45/YJd/CIhOtPvaEh
         tvrB5zGFxhW+iiM0B6pqvbGpJ/wb4WfkOrCdGJU3puQnQ5IiRaaZkUq7ZAksJ9HYq5Bi
         Fv+w==
X-Forwarded-Encrypted: i=1; AJvYcCXBy2WcOqjrGcWy+mPLhmDYygll+Ud3ClBXf/HaY4UI4X4O6k2Pgqe+XN1v87mkTYtkGs5dYAhcyxq91LZy3kt1p5UfPUk64oiDCw==
X-Gm-Message-State: AOJu0YxYA/yPeURSLTiBttoXcrmkilHfRCEYivpJLP1wTonTI8WRHAuc
	G24f9ryGBJb+/S+d7hloDbGJ+/OMoglPHnP/VpxjdglbH8Eg5gh3gye6M+JUFQD6JYfmYd40/71
	S9FEUJFhN8d8Mo73Obuk4zLT3SCnC0yy4zp/QOA==
X-Google-Smtp-Source: AGHT+IHaFzPQpNgmM2D+n18FUHEPsJqtQUnZ/rSQyVvamPC/eZ5ClM2Rbxhu2u2jo3SatP//k+/qeeoSeEKXcgd2oU0=
X-Received: by 2002:a25:d60a:0:b0:df7:93d4:61ef with SMTP id
 3f1490d57ef6-dfa73c213c5mr8750179276.26.1717418826243; Mon, 03 Jun 2024
 05:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531184223.3949069-1-raj.khem@gmail.com> <CAMRc=MeLwYPCGrRGgXCaoqQGH0Q_6JKJFizR28jprd5TpqRTmg@mail.gmail.com>
 <20240603122411.GA104620@rigel>
In-Reply-To: <20240603122411.GA104620@rigel>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 3 Jun 2024 14:46:55 +0200
Message-ID: <CACMJSetksaXNmmUXHwq1cyZkVEKABU3sk6jMAELnWsWymwU6AQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: cxx: Migrate C++ tests to use Catch2 v3
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Jun 2024 at 14:24, Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Jun 03, 2024 at 11:34:15AM +0200, Bartosz Golaszewski wrote:
> > On Fri, May 31, 2024 at 8:42=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > Catch2 v3.x has API changes which needs to be addressed
> > > in the tests themselves, hence this changeset is to fix
> > > those.
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> >
> > Thanks for doing this, I recently added it to my TODO. I slightly
> > modified the change - added a version requirement for catch2 to
> > configure.ac (>=3D 3.0).
> >
>
> The only issue I have with the patch is that Debian stable, and all the
> distros based on it, are still on v2, so building for them will now
> require backporting catch2 from Debian testing.
> Probably not a deal-breaker, but another hurdle to be jumped.
>
> Cheers,
> Kent.

That's alright. It's been 4 years since the release of catch2 v3.0.

Bart

