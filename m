Return-Path: <linux-gpio+bounces-20987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388DACDE6E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E883A2DA8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 13:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D29E28E61C;
	Wed,  4 Jun 2025 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zc4eyy0l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0726AC3
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042074; cv=none; b=J6Nc63I/STUEmGCikg+N6PfIEu+Hd5sCy3WPbBbSZq+i9DhsEK1/w4g1Rva4IiRKD+ZEGSMESXtkiFSyideqjwjA5alUocCxVCZpouApAx6B0zJ7dqxJur2NcggDgNnSWSLzh8QoLwGkD21CetOKYV2wy/YYDIShC4kEwrx93iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042074; c=relaxed/simple;
	bh=1OroP/RqXIG+Lwj6PavbGlLvgpimTgg5GQJbL3cFaZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PneADx3OxzBQvlH2jHd/WfOMPJnI/GPVlGaswAsSYJ8J3+e6DhNJsqoyJ1IkuZhUdykK8UJ6VqEjLaUHuxWNH0F6GsXXOeo988J7QRTkHJPmtOrPWtzxVGeTuvABt/OkAqb4OcY/2DcNWhqpOQ4jAiJo24fgrpmBT/6YhNoMxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zc4eyy0l; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553246e975fso8063928e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749042070; x=1749646870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abOlLlfrF4V5Jx8xwYhD2XMl83oP4mhrcqglcFWBonw=;
        b=Zc4eyy0lLDCzqqjT4nrIcGcKq3R/yt4qtK7nbXKJTi+zE8ronJtUfdQ8lt/dYeJgNI
         sWj0XhO5NjCjKZjKg5t5JjFt8KBUvtXl0ZICLQYOoC0u4HwbOo5xKkC0QAsRd5ee1S3L
         mKG+7/UnWxfKkW5txTxeVK5/rrYt9odtJogJjjnU2XuEOFO0fjmfbHWpwpiiKlobWxPU
         oaWZLtiLuNWwD7KpVWctaDSM4e1g6MluSRWklJSqXb8yBn5NBwOHTqr43MNK/LwsTAR7
         jBv1TiPKBaUkOuJa82ZnUNTTA2E+HIRVDIf+LHShoXJuU5cIHERmdU5qZDQWlIDcSv55
         7QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042070; x=1749646870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abOlLlfrF4V5Jx8xwYhD2XMl83oP4mhrcqglcFWBonw=;
        b=ERkcO6iVujgm57AxKCcdkowrIckCEUuIFVnhwMmcSi0GxdN+fdg9FDnHdDCweDLRKI
         P7X8ChTbAwLWFAXKrXd6yLnXVYsQR8hI1esS+w8QSxwq8TA7KQM13henhvqs7QzX4zbd
         BfxfaguE2ZZvh7BwTylG6gtlk5EBpataR2ZS4qFJXnjLGgA2KT+xSBWPaxzBRfqe3t0Q
         ubDQ/6SfyZ/eafLrL0Q9HH9rFNB9s801b739OYfifn8B7bQHmT7ytNAfTKMDRYuX/yrH
         1axuGmQyiPYVlkQVZlXmMcDRHVAVs3gS55kJ/o4PWX+Fwl454VPb1O5wqiEZR2jE8jjm
         M3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWWD7fvS3dMyIKDPlxxl5Lk33BjBbDQJPpNsc81VZY0IgHY5EWejoqLXjcxEd1p21ThO1gO5rmETKIv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4TyI1OaUrZ0a5yHWhMkWPaTVJSZI3+3Qydxf850P7LQnuWGE
	RzFbNadKx7XnKI75GEULmM2lmDUzDdZd9avYdjASmfNI3rOuU27r1pTys2vwZwCcakQ35YmNE6E
	+0OWnRgd5C7n3GImczffesHyQfx8FbBA8sx14OMQyxg==
X-Gm-Gg: ASbGncsCYREk//WlUzWTOXVySMZ8c8/foP1G5nO684P3+bBAa3ZH0E7Fghwi3MUDBPH
	GQo8N+eehOSNcbExZxdiKi5WSc0WdAU4Zc3ssVJbiddjBXE69WZBxksOg7Mpq5M4pGf5gCC/nJa
	w3bAn26W09DLuwGW2mbFI8HbUA7L0+xpgQf5LAJ/7VjlTcxHwuG+tUjhQtiFRffxJwgJkbvTLSz
	rA=
X-Google-Smtp-Source: AGHT+IFL1P1/DIrdf2zH3+jSmUsnBcm9Kopqxht06xEMjaFy/5Idfjyqeq0RMgdRuNyEcawHSpwT8AdiT3cgkXQP/+4=
X-Received: by 2002:a05:6512:4013:b0:553:399d:58eb with SMTP id
 2adb3069b0e04-55356af0680mr978219e87.24.1749042070273; Wed, 04 Jun 2025
 06:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org> <DADRJYAZCMHQ.3CN96VZQJL1SG@riscstar.com>
In-Reply-To: <DADRJYAZCMHQ.3CN96VZQJL1SG@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Jun 2025 15:00:59 +0200
X-Gm-Features: AX0GCFsSsf0DOLbR1pap2Hv1_njjqkfDdYSvTO0duDi0PlOXFtVVtDlmBTOb8hg
Message-ID: <CAMRc=MdfOOiQcT-izDiR2focb71cPQNT7fqaBrbUc28fZiSJYg@mail.gmail.com>
Subject: Re: [PATCH libgpiod 0/3] doc: add rust docs
To: Erik Schilling <erik@riscstar.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 2:55=E2=80=AFPM Erik Schilling <erik@riscstar.com> w=
rote:
>
> On Wed Jun 4, 2025 at 11:53 AM CEST, Bartosz Golaszewski wrote:
> > While full integration of Rust docs with sphinx is currently hard, if
> > not impossible, we can still follow the pattern we used for GLib
> > bindings and generate the docs using cargo, then linking to them from
> > the sphinx page.
> >
> > While at it: fix some minor issues in conf.py.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Bartosz Golaszewski (3):
> >       doc: reformat conf.py with black
> >       doc: improve the readability of the prefix variable
> >       doc: integrate rust docs into the sphinx build
> >
> >  .readthedocs.yaml |  3 +++
> >  docs/conf.py      | 43 ++++++++++++++++++++++++++++++++++---------
> >  docs/rust_api.rst | 22 ++++++++++++++--------
> >  3 files changed, 51 insertions(+), 17 deletions(-)
>
> I tried to do a build of it to look at how it looks, but I run into:
>
>     > make docs
>     [...]
>     usage: gi-docgen generate [-h] [-q] [--fatal-warnings] [--add-include=
-path INCLUDE_PATHS] [-C FILE] [--dry-run] [--templates-dir TEMPLATES_DIR] =
[--content-dir CONTENT_DIRS] [--theme-name THEME_NAME] [--output-dir OUTPUT=
_DIR] [--no-namespace-dir]
>                               [--section SECTIONS]
>                               GIRFILE
>     gi-docgen generate: error: argument GIRFILE: can't open './/bindings/=
glib/Gpiodglib-1.0.gir': [Errno 2] No such file or directory: './/bindings/=
glib/Gpiodglib-1.0.gir'
>
>     Extension error:
>     Handler <function make_glib_docs at 0x7f186e7b5ee0> for event 'builde=
r-inited' threw an exception (exception: Command '['gi-docgen', 'generate',=
 '--config', './/bindings/glib/gi-docgen.toml', './/bindings/glib/Gpiodglib=
-1.0.gir', '--output-dir', '/home/ablu/projects/libgpiod/docs/sphinx-output=
']' returned non-zero exit status 2.)
>     ~/projects/libgpiod/docs
>     make[1]: Leaving directory '/home/ablu/projects/libgpiod/docs'
>
> Not entirely sure what should create that .gir file. I have a build with
> bindings enabled, but my bindings/glib/ does not have that file.
>
> Am I missing something?
>
> - Erik

I ran the build both locally and over at RTD[1] so it works fine. You
probably just need to install the following GLib packages: gi-docgen,
gir1.2-glib-2.0-dev and gobject-introspection. In general: make sure
you have all the packages listed in .readthedocs.yaml in the libgpiod
git tree.

Bart

[1] https://libgpiod.readthedocs.io/en/b4-rust-docs/

