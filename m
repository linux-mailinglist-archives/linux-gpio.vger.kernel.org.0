Return-Path: <linux-gpio+bounces-11750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD29AA0F4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 13:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DA111F2168A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 11:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC328199EA2;
	Tue, 22 Oct 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OxOnpiJc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E9A140E38
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729595792; cv=none; b=g7qY8Mq7uBaAYmOetJVaEMLqNK5j9RTaiALh7VwHxpMyEloZpbXIr9gWfAgz6SLTvsRjLx1VQkuvgE6OCmGpEjYWCB7LjuMqbmYiRm6SWDnA9RP5LLrWvGxbyvUYXFDkcvNFTK+oapYJ3wtcmA6cNrJ+7FPXBhLPVTF/X9Gnttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729595792; c=relaxed/simple;
	bh=C97vOVXgIZVUdertuvDxti28lwShTmqvfP02dyperGY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ueP7Z9c/bySxpQl0bTpGOMbejsvqXJkc81BMTrjTO09i7CW7IJaZlfeFGOg3dfZ3mxRXPGZhplQzBF4Xr0DQOVgkldPxPMh6ZfhR1OtK5AHxb9VScW/shoNpRY+idhGDYinkioPA9+jgbPdb3+FVhAnO9p5+5ENNFsbPq74YuCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OxOnpiJc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a007743e7so6640316e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 04:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729595788; x=1730200588; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C97vOVXgIZVUdertuvDxti28lwShTmqvfP02dyperGY=;
        b=OxOnpiJc+vv3F8ZYIFXw9mfv4QufbO950FTbncuxcwrnG+Zc//bIZaHtNlSJKcL9MM
         K3gqQlqUtyy8VrYEu5mXrQcGWUoaUtnAMSEg4xB/x2+bGadlLwYngq/U6r2JqiuPEDiK
         tXnGBRWln4fjNibUVhELGyzbkrRQtdOKzqEmbw/d/3DhcjPbVtEPJPkjkR07w4W+s3cY
         JaJv8lSA739Ilcak0t0BDkPLzfPn8XGqPGAlTmhR/BsYU1EW5hCCUO/LGwT2qieyAavb
         kX22oSY+Gsn1BHPgJDQSHtG6zPRJAPsHlviR9LBuhBMMdb2xbkMlJy4NaEzVU80XXx9A
         iMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729595788; x=1730200588;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C97vOVXgIZVUdertuvDxti28lwShTmqvfP02dyperGY=;
        b=ZvZXpVFlRy9vKX8Obp4fKrKtyFvPj8HXj9Og2dxf3dLm+GB6++W6y8Zu6ITR1dIzL9
         mVVhGEvv+SnCqCOKQuapTpUbO3mzqOzi/ExzNuVY4WKcR86TjIKAh6sSYQverdD6bPgK
         QQREXv++gdUuk+Ro71RkGru6Rkaj60DUoAtmgHjLlmEp8jSY5wvggmZqyvtm9aC9V3OK
         M+OjGV2eXVsEt9Iaj6H3hh/SDyzBhtH4Xt3lTIS3jj/NuNDeAyBQrgGFDA70yjYoAycn
         /T7QF1q6s83XvzizxsF0/5rjzpFeuXy36g/gjKPoeCWN8yuc8KoHu5JmHCGSkW0zouHQ
         4HbA==
X-Gm-Message-State: AOJu0Yw2GCItN6CXLZcyFKp7nMhQ+bHp4pme+9+Q1bLW+mgBsCiSUej+
	VYxL3yZf/2zfkceXuyGlvmQ9F7xnKYn6hiG6NrVPqo/vf0Quy+uSGY8DGZ28pup6XOl1YGJPk0w
	z+UGj4J0B64ZFwNtwRANE47tL4aI5p2JDebsQL2W2HPudytXquh8=
X-Google-Smtp-Source: AGHT+IEImrxE+HQ2qK+pS8vLfi27EofmDiSjmODcmYAAoXUSlX9NufXEzW8KLcE2pHKOejh9nmuqtpCw9/68eqOz4eU=
X-Received: by 2002:a05:6512:398c:b0:539:fbd4:9c9a with SMTP id
 2adb3069b0e04-53b139f4f26mr1185690e87.35.1729595788298; Tue, 22 Oct 2024
 04:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Oct 2024 13:16:17 +0200
Message-ID: <CAMRc=McbWNANVLGSFe6aXjcjMoekUwjov8vM1dSMy03Vp4nXzg@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.2
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'm announcing the release of libgpiod v2.2.

This is a big update for libgpiod bringing in the D-Bus daemon and its
command-line client, GLib bindings with GObject-introspection and a
slew of other updates and improvements. The detailed changelog can be
found in the NEWS file.

The goal of the D-Bus API is to address the concerns about the lack of
persistence of GPIO state when the process that requested it exits.
Now the state can be stored inside the GPIO manager with which clients
can interact using a well known protocol.

The release tarball and the git tree can be found over at kernel.org[1][2].

Bartosz

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

