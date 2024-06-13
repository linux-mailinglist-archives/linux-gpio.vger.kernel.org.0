Return-Path: <linux-gpio+bounces-7432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE790757B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 16:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FB71F228B4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 14:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDBD146A71;
	Thu, 13 Jun 2024 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fW+vjq1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F5145A12
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289684; cv=none; b=dPlqwg1ApJ2hRbScdOozllwyABSdV52G9PEvty0ZmJ+fKJZkW0phbXjbi5m9zBbW1Y1suTmClxz20lzCv+VAFvRRZFcssPwWi1rIUtksKxLL1DNd/XVIgT1rCEy2Lejn7fnxt6WHUqz8uaD8vZtJc/vqvbJjBhmzd2pXzF1FWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289684; c=relaxed/simple;
	bh=g11pcLxgZ001gRc9Ns7wzkxxDb3zbQnKC2nhd62Xzwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3YwDCjO6Pf/GVUPdz3/G7ypXFv4lCt3RcC271VEF9nZBEGcVqkbWd1p9XZ5uk8YTgt0wSgT4dil6zAQ+ljgH51AtVx75TMQ8eoAspXVrS+tuLrFOZihgt1dVDZ/xjzbQAqjA9dgXYesAlbSeU1UbxhOZISA3+3nwIy6CXAKabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fW+vjq1R; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso16797971fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718289680; x=1718894480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g11pcLxgZ001gRc9Ns7wzkxxDb3zbQnKC2nhd62Xzwo=;
        b=fW+vjq1RMGRIjDzg6z2/6MqWPS2wYSYWSEp82+jIBAv3+f0jYC3fjTFjdlyUbO8kwW
         5LCTXxuGEZ71VncMpaQi7kFpzdZUMdWxSQKSOEjLqp3NnQa3DYiTY1pKlHX74YScYzGa
         yV+K+K5viopOWH3A2xflDfBywoZM1fHFsHdnRP31SrFUtdjXF+TBlXtITJYrHJZJlgcy
         sb6z9OcYHwESUHm0roGjtX5fr713tKwLC6VgvS+lk52B2mupvQGrFB+QnsumdZhykAN1
         fkZqerglznaiXruf3AeFw7ypWcfMaZjgjtAAYj1t2LH1eh4ANWQp1PkrJ5MO/R13SE/0
         yITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289680; x=1718894480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g11pcLxgZ001gRc9Ns7wzkxxDb3zbQnKC2nhd62Xzwo=;
        b=SEFi63Jprlldz7+aLwzlLD5Fa9N1xGIHWvUdmDMMcIuEsVPkR2+hEzq4NZR0MhBM4+
         CQ/uI9y+5H1B+JrMdndO1KER+EJ+nkcI5S4hSfeQh7vKn7AxZu51FN5O2vbF9JmgDztQ
         qgGyJn8GxLOmaGRiQ7TMkfg7huc194akHjg872DcwZJff+Zr4H2Gf7jfaQ+nNJhFbF3G
         MZWwsJch3ZhtLFUsKMS+tX53FdqtD8/ieuM782vl+EJvEoLmOmK4i6l+3M52imKbuNrY
         2tsq4PW/ZVvNiCU//P2Ow+0EQQg3v+V8R9tOsmJi4PTIuM/lBhUULM67tuLXrvOeySEP
         JNLA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSqHHV5PNCWGy5N9voFGL45AgYzIkUVhecDLI3jAgXAb7EPZH0yMtJAhH+K7w3PidQHNks4PUf8TvYUs932IR/03sznXY6Dq8kQ==
X-Gm-Message-State: AOJu0Yxj129hsstA6q0OF5Iayh96qQ/DMTIQVlZMXn0xXKZY3R02sDTt
	q7KYWEXVvsvpwLE0XovuG5NpaIWf+G4h+MRooGG0eJKNeirY2ZZDMtujEOQtiIolH0+pwOBkagu
	PEuyamZosLaLsj8rJFSJpET6e5K+QpJfhi9BiFk1uKgdxY8Mn
X-Google-Smtp-Source: AGHT+IHeFemmleKFvmjMNVeGhwFtXdeILK2kQZIRqiPsY5CmSA+A9Qr1x8i40SOQtcObPCYtrL2uDDWa1UUgOBkYJ0c=
X-Received: by 2002:a2e:7c19:0:b0:2ea:e1fe:2059 with SMTP id
 38308e7fff4ca-2ec0e490f5fmr205451fa.27.1718289680612; Thu, 13 Jun 2024
 07:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613140117.39048-1-brgl@bgdev.pl> <CAOrEah5=3vrE6ZWBSqFYQ4_ow+KuqJHDfowqAh34Cm+muj5Pfg@mail.gmail.com>
In-Reply-To: <CAOrEah5=3vrE6ZWBSqFYQ4_ow+KuqJHDfowqAh34Cm+muj5Pfg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 16:41:09 +0200
Message-ID: <CAMRc=Mezd0RGgBO27R5wwAA_yG=V=SFyE-vgHBrrTB1yafLwRg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: add mentions on shellcheck and reuse
To: Vincent Fazio <vfazio@gmail.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 4:26=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> Bartosz,
>
> On Thu, Jun 13, 2024 at 9:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Extend the "Contributing" section of the README to include mentions of
>
> I think the content is good and will help clear up some confusion for fut=
ure
> contributors. However, it's a little confusing to have contribution guide=
lines
> in the README and then have it point to CONTRIBUTING.md which duplicates =
some
> information but doesn't actually have much more information.
>
> If I had a vote, it'd be to consolidate the information into one spot, bu=
t
> maybe that should be done in a subsequent patch?
>

Ok, I can send a follow up that moves most of this section to the separate =
file.

Bart

