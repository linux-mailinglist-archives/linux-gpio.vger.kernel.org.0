Return-Path: <linux-gpio+bounces-12451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFD89B90AF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DC421C219F8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEFF2A1B2;
	Fri,  1 Nov 2024 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+W+OcGk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA819C549
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462022; cv=none; b=lTJ+cm3ZmhTXZ5ps3L0hgOtk8aouMLmNeg8dxWC/yFIvcpX6CDYuLhYroQmDdV65FXCeysMuoyMXyB1v1V1Wf/O1gGhnpwKcC8QIB6wAnaY6iZ4WKhtvQfSHm15Bf7Y0l/Bm0yhMryqS3r4/U9y/aI4ROAMJhHv0nR2AyUDkAes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462022; c=relaxed/simple;
	bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbVLuBNav/M316SxNIAE52aoCIZqVSHGMLPj4K307Wsfjk9ABMJae4g5P+Lcg7supyFPYOEqbbKKDsvyxVl++Li0E9HJIOn+LiRIdFbP/MW/DkVZnQeIEJ2fl/BuK6UX3MsL/1cScTruFOvt9d68SwM3zTVNChdrRahyHBg9SqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+W+OcGk; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so28402831fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462018; x=1731066818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
        b=Z+W+OcGkr8IH8R40cqPpWLnOAwnQMnC1xkV18DPCAje2VpNxaPV2SmS87Lvnjv0pHJ
         r/BpXuwHqdZObCQXOPbRyi9/XmQC7FDJSYliPAtpea5buwGK0a9Y+pybQ0yEHBdl3FpU
         52ssejNUPy9LIgko7dmRei4E7689oV0pt/iKIePqZrNoTRMurOgQyUvNQpL1JGVi594O
         rR0yVqhxEiZLvbEamqMed3SAZUmfP/iXQYxcujjctOxmSpy/8m1rrbSN2aRTM6S1/EXd
         E7Cz2aSxv1StPbUaCouU5Yx7T8/Mr1L3ilz8HCtt5TzteWbeP9z6/XzYGC5zNRq14IEp
         5VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462018; x=1731066818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
        b=LTKgkSC3Sq/uKmFBo27SLazP6nZXpYb6gesisJhdD+pR+zpbgbxsU446g3gufFuga2
         q/HovCjd1HGdK7cpbn5oQn5gfuKqlqSp8Ne4vGpCuib46Sd9sxXiJKiY7DphBNuY4qum
         7M+EdOtwdD3AEmM0Y8ZjdzdNMAmgi+C1z+Yd5cuZJGEXaweVGHcCKD2njmr8JYhks9WS
         Yssg6W56nfwcv5JOsArWQYQVNOaSY0QoyPUyBPhR659SRJdN/XyApTHqriIBGij+NHpc
         /8r0rgmAdusCI0hptBPlOYvPKjuRzsNmZzr/Q218hywUwiy+xEn5TGxmkVJ+ygFhqu5d
         Pczg==
X-Forwarded-Encrypted: i=1; AJvYcCWZrzjoovbaluixS4bwPZJiGwAnZVImMVJoyjdlXsfXj4Lx6BwSyxOG7jfoRgdOWin2gyS00sjwJJEy@vger.kernel.org
X-Gm-Message-State: AOJu0YyxfwYSwtK5v9vbJUOglRBBHjVb6Bm0uIIe6Hw5YdSESIpZYffO
	QME51ZnZ2+rsbA5+Rx0r9SY0+IJOuTNO5Yl/U52wl+SDceo8sqKTNtoIudfo4vawDzipk3ZLfEf
	PKhG/FcGPlqUS0nacVYpzPkcTwLW0p1cysVVVJw==
X-Google-Smtp-Source: AGHT+IGIi5ao43k/vIAO/lA0KVUBT2iz7DHq1Gqz+0/lE6XQd/R5X3Fft6qTZ9ZmTNYTYQonru0QZ16ntriXjkPbnU0=
X-Received: by 2002:a2e:a595:0:b0:2fb:4fd4:668a with SMTP id
 38308e7fff4ca-2fedb49929amr11134431fa.22.1730462017840; Fri, 01 Nov 2024
 04:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com> <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:53:26 +0100
Message-ID: <CACRpkdaFqtMxE26jA6gWDAps6L58zL3KD6CisxTcVJj-DAR+pw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> The SIUL2 module is now represented as an mfd device. The pinctrl driver
> is now an mfd_cell. Therefore, remove its compatible and adjust its
> probing in order to get the necessary information from its mfd parent.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I assume this needs to go in with the rest of the patches.

Yours,
Linus Walleij

