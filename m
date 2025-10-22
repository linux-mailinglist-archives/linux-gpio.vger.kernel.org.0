Return-Path: <linux-gpio+bounces-27420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC99BFAB05
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46B5819C3F26
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81512FD1D9;
	Wed, 22 Oct 2025 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yjWbfvaj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B42FD1BE
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119520; cv=none; b=SX5ajkLAe1GLtiEe2gpPjzCDTXRaEmqDRMjE+HO8mDHE+gR24J31OPBeZ1/lnzBDhX5nNlV/1So+3pS46M1DFJXXgqSCijUGPuawM8GqednDslNdg1JSHFxynhYXONSjeGn4oLF9zFdKJPxra95SN7SGXrEE4tdScL9493uBFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119520; c=relaxed/simple;
	bh=jwgDGkmgLQAiIFCHURTu7rDtJYWYbIsEW6+BIX2eiRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUUim55EXPUM1+NvVSMcMDA3UVlKdEZm4bZeURth6hBPf+bIJKC6sytyJ/NrnbqoiovBXq/MF0ua6ONy9H5dEfTmNCiE3Ls/uXXZ9r8aJVDSkXPmMwoalR2PThcsRttBpK0SAb6/ODTP52BFs3T1JgjIE/mclTwglaxBdIHgIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yjWbfvaj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6ceba7c97eso40661a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761119518; x=1761724318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwgDGkmgLQAiIFCHURTu7rDtJYWYbIsEW6+BIX2eiRE=;
        b=yjWbfvajw+hA9aow1wD23NpHUk5dI37pFdAvivig09R1y7pfB+HLCO49zxw4OjjGaQ
         Zv+sj8PjmDwLVLTWL9MDiytkaPIfCQc041Naa1iFf3wWLdC24yiyQGl9d8khyd4ir31M
         tHuZxlYxBJh8PXRAUv22IQMwlxwQW6jNIF00Dn0jsb/twHx07c8PLedazrTGmbrO4a/2
         arGmvTU8DQWJhrCpiMk8oAnwb9I48EcGdSakm8pWNg3DrPYqVFzb1hzu5dq9FtQJpVl2
         KbQ9feIE07+Gomw1oLQkBbVfKj8G+rygSgF7XZ+Tec59VwxKIl40D721DkUBpiLaARxU
         99fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761119518; x=1761724318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwgDGkmgLQAiIFCHURTu7rDtJYWYbIsEW6+BIX2eiRE=;
        b=jyfn9xGBzOwITW8cWgn8xyex/bXLYCYE+tylRJurDHNaw0NZSbnbdcZE8K15oUT/JK
         9LWXCOCHgxbBIteGRBdpqxoqGl2gy4Cptlw5e1MFlj7M3kqsCtJhy1IfUmgVObvlMwDv
         96QV9XYHiZPmvRrSPBbMR/7sLAnMA+ERaCBPzXmFEmEbQ9HvTm2tHw8cYiRE8/SnoeIa
         dJRhBHr0IsNZrsSANDdwkKcNwz0eZF2BYv3J3eyRUHGsWU5Xf6tmW8paOMuniLu4c47X
         nZSRBG9Tc/6JTemCmOsbBuI/M4XK+o8XxSQixMkbuq02MVxqp797iwHEoo0y21k1KOQr
         AU9g==
X-Forwarded-Encrypted: i=1; AJvYcCX0EYil6GbfI+uUZZhkvwFwqwFDTYKyWE3m35atsGLbiJI6UhNNKPIB2VT/r5OsI4MqrOUUqGpyr5N2@vger.kernel.org
X-Gm-Message-State: AOJu0YxtR3mzCduTSP1GJaZ6Xh8MtLxq2H+iYjBWo4NIjku8imXfYZvi
	9F+YgBgVQC2gSyY+NL1v/2caU41CgZziNshLbk14DcdT93WLNWRkXfZYDTAu/u8Zh/v+mcEgvvx
	Uxjhsh055gmyOG3s7DpQz8r+ELeeBXi3qjwHG1ZwX8mCY38o5YLmxOWA=
X-Gm-Gg: ASbGncsjWffnZqxGm3NLM7E3oYhpQm0Cc6EGEveD70Gn6dwFp+c6LbmUAZSeqHK/sa1
	Am3qgHlgkbuKitqrUi7EJ1j+GVLEVBUVrZIXJTriWEjL453Di1yFHNxMnwVxjeM6GUgCfaGM8mD
	hAsWArtAkgSP/V/30f91aofqT5eawI7j1HHfeieQpZ69IUww33KlwsyKiyK1xEwTo21y9lTn49T
	3fPSlXSTCZ/rXmzLhdM91Hz20pg7HcdzmIIFcHcrTsLcxPo0RqJio2GdpovhUAptCTBP/qXNLT5
	3bQySNXL8LUriwHp
X-Google-Smtp-Source: AGHT+IGg/bOFoiaG13MoDLh0wQPdpvQnjVjhF+kcamSsNZoWBjRpsyoZ2RCg+wNCw4VMdWeYvSdn0noK4cFimUz6as4=
X-Received: by 2002:a17:90b:2e04:b0:32b:94a2:b0d5 with SMTP id
 98e67ed59e1d1-33bcf923730mr24000792a91.37.1761119518374; Wed, 22 Oct 2025
 00:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-1-6d3325b9af42@linaro.org> <aO1bkraNrvHeTQxE@smile.fi.intel.com>
In-Reply-To: <aO1bkraNrvHeTQxE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 09:51:44 +0200
X-Gm-Features: AS18NWAQSvR-Wj30Uglkmq34ZykFQDBTW9oa-LbZ-o-h0Yn2Kyd_r6Aqydksz8c
Message-ID: <CAMRc=Mc0E33JTettxsCEPf+K5FZ4-JOUX6tF1xq2QGr2gD0vLw@mail.gmail.com>
Subject: Re: [PATCH 1/9] software node: read the reference args via the fwnode API
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

On Sat, Oct 18, 2025 at 7:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 06, 2025 at 03:00:16PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Once we allow software nodes to reference all kinds of firmware nodes,
> > the refnode here will no longer necessarily be a software node so read
> > its proprties going through its fwnode implementation.
>
> This needs a comment in the code.
>

Honestly after a second glance, I disagree. Literally a few lines before we=
 do:

refnode =3D software_node_fwnode(ref->node);

We know very well what refnode is here and why we should use fwnode
API. If anything, the previous use of direct property routines was
unusual. A comment would be redundant as the code is self-describing,
what do you even want me to write there?

Bartosz

