Return-Path: <linux-gpio+bounces-8281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7600934B0B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39470B223AC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EAF8004E;
	Thu, 18 Jul 2024 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EH/lWqyA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BBA25634
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721295463; cv=none; b=PfZ2bKHc6Eh//lp5KGpsj8rTu9Jm2kizJ9DfqWLqAxZ4uV98Qp4X5yGGqpqeaU5ZdPl7RoqPvZ+OodAENgZEYbwYAq5wVaN2+PXi6RL4sxgl3fIK5uJpL8xH2LP0EUvFBLI+EudGJRvJm5npqeoqsMftD+ktovTdZ4scFK9EDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721295463; c=relaxed/simple;
	bh=eHXw/LJaa+PbAm0TQ90ncx2rV0gX20tC5ERADlzzE/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCKO7idk6n41tPwo905uqZy1xkkxOA7+Ok5s362P/P2IqjgQpboWT7c8Ezd6YFSWHj9lkDadfdBQXhYxvfQuY064wQ1UacEiZHV4MDdgv8rdx+X9GqdiiSSmxsyv1hMBs52vo3dUxdGp2C1BHsqX0gLmeEQDgjcDfHf4+ZshdQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EH/lWqyA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c98a97d1ccso72339a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721295461; x=1721900261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHXw/LJaa+PbAm0TQ90ncx2rV0gX20tC5ERADlzzE/A=;
        b=EH/lWqyA41CxlyVPy5XVJbTld8fPmmNZ5sBoaoOL61lHLw/oUZO4Da7J3Lx+LdBHac
         X8XEuZwH2XT3BDOv8XqvT/CRThZGjjGuYesX43f7OzrmF3zmIU75NWiC3OnYbPb4LeY0
         yr09HCl1O9GMFEXG13GQHx/0ojqte60U0MbhBaGPnEfjDfkSAReaSWnlM4K8xw889I3N
         XfgT5DaWcK2sk9G4mVKbIRKJInOP9ffkoOOyH8/kYSot5i6r2ma9Jw+sgZ3xeKor/sBa
         KXWvslPr5h9yy2tMi/6m9YRJoDvB0mlKCQ79fuL3dioSZMHzE1SqS1uISSzlHk2YYjZc
         ywEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721295461; x=1721900261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHXw/LJaa+PbAm0TQ90ncx2rV0gX20tC5ERADlzzE/A=;
        b=NAKKXqgE8g7na81j6GD2MNne3d9R9Qwkb+9ihRuGtgfSa/9LbWpSiTQ+I54TS9wGSX
         SdL0DPH722FYUOnOrg46LChUgDhhOgbroDy/fkZAt+3e6NAxk8NVkjesoXPC4T/AqSJs
         fLuYNKQPyGkJ5fE+72veHZ5pjyLDT6JErJK4Zx5Hqd8QNRHLhWc3FsmnCNA2nBcjAH8D
         SE6DBy8YmD5j5k0Bk34CAbgVietFxw/OmYMgFeKNGKS9PQMyj/tGtbTAUY/7BMCAdXcJ
         nLpYGCYZ+c3NgAk9zIE8VKrrmmx768ohdZdpV1zngn/OU7M2QxhScwu5XERD/xPXtYkm
         ECSg==
X-Gm-Message-State: AOJu0Yw+a2/YsN1atf3EOZADapk3VjGlqYgYzAiD18neCt7wlVHhVArq
	KlBaEqE5LBoL/pruvNaJlGoVu1kTWgZEdqqM1lr9voQNX/AabxoFF1J5hxGu2DRwBvJICTWpqMH
	li5jRinSAZ8NRkH1QT+ZRZKFCqnKuOGeoPMqF5w==
X-Google-Smtp-Source: AGHT+IGlAyUtEdbTs8lcrLYCdP4sBawaqjfGLhP8eVqsMoaFMr1O8K79FKdhtCM2MQVw0k79svzWECYSucjChplmgs4=
X-Received: by 2002:a17:90b:46c6:b0:2c9:6d45:8187 with SMTP id
 98e67ed59e1d1-2cb7755baa9mr359956a91.21.1721295461111; Thu, 18 Jul 2024
 02:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:37:28 +0200
Message-ID: <CAMRc=MfKqy6Ggckcp=Z9XgDOZLnEteKdQ8bpmY9ZgkF92qYBXQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod v3 00/18] dbus: add GLib-based D-Bus daemon and
 command-line client
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 11:28=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> This series introduces the D-Bus API definition and its implementation in=
 the
> form of a GPIO manager daemon and a companion command-line client as well=
 as
> GLib bindings to libgpiod which form the base on which the former are bui=
lt.
>

I created a github pull-request[1] as well for those that prefer to
comment on a git forge.

Bartosz

[1] https://github.com/brgl/libgpiod-private/pull/2

