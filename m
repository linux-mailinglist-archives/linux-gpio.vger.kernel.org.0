Return-Path: <linux-gpio+bounces-11035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E6F99465A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4071BB26449
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 11:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F581C9B77;
	Tue,  8 Oct 2024 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1CCKqMm6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791A18C900
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386176; cv=none; b=pCaf42KpFcx00n+vSXzJrax0lVmEMP/8T6229avAvOSMB2PjxtQQroIk3d5oe9eW2W/JPZFAfdr05E0xvTSoT3gV2cZCrKf+NSCiF0SBR+I3+8F/hjcFmpA+xDs/jPzndyj8Ls+YrlDb8golqxBageUhV864ONiebnZOP4GA71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386176; c=relaxed/simple;
	bh=nEZSzoIrc+5LNzY5EwQNjJIvaBlbpvtr4FdcAE2lhME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDZlZN416wCUQwQ6jydTYSIAAEMMyInzkJpsJsM9lPNlH76aiouIl3PWdJbAz43wBdM4yKwbpjomYAlScFscjdiQCOo1E5ObvR2qPrC/v2deFKzmCOrpG+nOSMHZffixm4H3zQT8RF0a7eEbJ7y7sYd6bO6rp2qerwvGWx3jx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1CCKqMm6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso77030141fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728386173; x=1728990973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEZSzoIrc+5LNzY5EwQNjJIvaBlbpvtr4FdcAE2lhME=;
        b=1CCKqMm68vCRfw9JhoA44pMz3+fytgqbWGFfBY/9U0glZ9+fGI+LFOUML3jgq3ZUkO
         quFc61uInFdV6/jVRH0BdfNiNp8AUigCEz4Q4Vho9H2G08C2z62Hso8XejRG1S1YbThn
         wVyJEnq1TFUCcD0aT3GAebCEAaomKLVpzITXjM4VP4pP4ee1qUjiDF5/dZ2Icz6vXFhw
         xv+BugL65VjIgxNe/f9Xq/17mOx3aztuDIFmT4CPtmkx6EqZ7kNqKblBcuKVFBkt7Cnv
         YAX8vk++IP0YzBPngGzOIBEKJGJQrlTxKqNGvC+ACUzEKk2h3d8ANtWj4g9I/nFLuC4S
         +VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728386173; x=1728990973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEZSzoIrc+5LNzY5EwQNjJIvaBlbpvtr4FdcAE2lhME=;
        b=EjccpGdIEz2CPOLKbPonTBkfc3c59bQNz2jYItODj35MwEZLkvjXmL37sEYdZw6q9B
         yBiG+ezOYQYjrLekYxI5V/A9HaPqG0aHy8JWAJ2phdw29WXiXkdYxdPO63/AXxz0PdPq
         pP2ZBHeN59vfoA5sHEUXm4C3AyS4urMeYyfvwCYTLKeHe2ohxprOnloFBu3y0Cf7pjOz
         1K7OoXWm9qRiNqr3xDS3aFj/nxIg6zClsCAlkXa2R0o+yE0Fap25WRZ5e2fNzv24+YNv
         3ywDJqdVtQF3Svuh9HrPKvHcaIGO1aFHqQup7AkCZWbarvL4Z7CTlYR9vo8m64vedSXN
         HqeA==
X-Gm-Message-State: AOJu0YxNnBqWi93FJIR8tsijY2l4uyF3Lu+89jm6IrBaPDBDNMo8eQ53
	wmmQapvVp1QT96jPLQUUMUeR8+TGDRgDC2yKF3rqxxO8kahd/xkeyNbqsvhn1T5pwehpxeal0Nl
	3wNBhfjGlT5ma5NL4qQqrAAyLIn0+uwjfpVU1Aw==
X-Google-Smtp-Source: AGHT+IFxdQT/DpUAPJ7d/mhNhq4YK/GLrxW1VtCzwp95MSf0Q1snK1IsuY4Ow2cYwttY1+wlfIdJU/li3CXDKTO+fQ0=
X-Received: by 2002:a05:651c:b0b:b0:2fa:f5f9:4194 with SMTP id
 38308e7fff4ca-2faf5f94416mr93984211fa.27.1728386172670; Tue, 08 Oct 2024
 04:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-1-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-1-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 13:16:01 +0200
Message-ID: <CAMRc=MfUnOedJOsrFVBUWxpe23MXVNtk=fv3P1e16B4hLhvNjA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 01/22] bindings: python: clean up imports and exports
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 9:05=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Remove unused imports and sort the remainder following isort rules.
>
> Update submodules to use lists for `__all__` for ease of re-exporting
> public classes from within gpiod.
>
> Also, fix instances where `line` wasn't imported via a relative import.
> The library now consistently uses relative imports for submodules.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

This definitely improves the output of help(gpiod) but I was under the
impression that we discussed re-exporting the definitions from
gpiod.line directly from gpiod and I argued that this isn't really a
good idea as they do fall under the umbrella of "line" definitions and
should be imported from gpiod.line explicitly. I thought it would work
more like:

>>> from gpiod import *
# now we also imported line
>>> line.Direction.OUTPUT
<Direction.OUTPUT: 3>

Is there any reason for not doing it this way?

Bart

