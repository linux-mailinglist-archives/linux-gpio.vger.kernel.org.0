Return-Path: <linux-gpio+bounces-7517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2690C96C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E524281458
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 11:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3386313D625;
	Tue, 18 Jun 2024 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l8fZoSL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40613A88F
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706462; cv=none; b=FL9fl4k2DG2ZGP0FZCYiG5BLtfXbj2mt35ecpH/AL+2Dqq8Jm5f3M6LENB31zMiLMV8x8ulfQCdiKrZLFvPAZvi00bgkwLt051/nudNhnxjCsqpbLzoWj+HOSDhwVTLmLnLAp4NJLk4wNz3eOvPUsqoWflsRFPoP3aovumPh2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706462; c=relaxed/simple;
	bh=gcmqJVyxQFZ9Dkmxwkmb5RhEc2M0bpgsq53KiHA3mes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWmrqfXNGHCGAbTjhsHpGT2Ax5kk0AhyNQvdj3zvoZcmNBXqh33Jbmy4Gkqdy42bGChqporj8uBpJjrvvqnnI4hwJZDpLTjN4zU8FVDqBQ6ZEv1nhsD5+Gn2aNO/Swf2YYn4WPATpxmnzu7cHLA3l0A9fWFzI2WZmz0a1m9Y3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l8fZoSL/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c819f6146so7076511e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706459; x=1719311259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcmqJVyxQFZ9Dkmxwkmb5RhEc2M0bpgsq53KiHA3mes=;
        b=l8fZoSL/wKygKQbdcxR5oq1ib2hnbgULp6GHDolXn2OlK+uQ5d4cmQkR96ZRKaOUXl
         VbzofnvF6ahjnqb4FYWdSL/1ZPVv4gfwOCx+XwAoGoAkDVsfPeSMBGLVX8/DS/AC0SFj
         XycTdmCBX/WWKwRK8T8xD2Ap2p+LQsBMIA2xoJllAxuZaakLK7omV5K/10wFFu2r7hiP
         pXQIgV6So8mUa8lt2PaQ+fQ/RdpCK/Wpt7FT+p/qkFsh91Fgza86EVh7MgOGebsvUY/T
         TwJ3O0O8cYEKZDBfG/MYkmIH55e5nmFxriBSW8oPw2B/+hOeBWU8c5uE8MxEn8JB4t1J
         1aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706459; x=1719311259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcmqJVyxQFZ9Dkmxwkmb5RhEc2M0bpgsq53KiHA3mes=;
        b=SURnhhpNoV9Kp6Xz/y52ZPCFJdw2bo3O3DgmS+fUaZDgEhE3KNG+D+6zA4ivu3dlDq
         AlWpJr8qVDBovt0YtjvaWlCICJVVN1p+TRah+7Q6ZfJbnUh8Mz9WJrC1vWEXEI6IDqO+
         a8rPAVhcxMMzN5jfeG/MLlrDdoB+F5tV95Xzybi3i+Aome51yWf9HqZkqEPDL6XM4C+Z
         0wZSrjBpJUJwU5PNi2zCi2gsx2dqmg7T+Eqzcogr6QhLiDIXT6yyY3nPOQeptIE03I0H
         kBYOPtRiTE7bnezrj1dEaJ4eg03TJz6hkejMYFXYs5VTZjueVx/Zuv9AnY40NgDLjpsK
         MJsg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6M/9axCThH4vKKc/tb17vnLi0TAN24Px7/7HNKKJr6q5/Nh3oGLiRa+ydHHfW3pNFFoA9ZmoZUX6f2dlKwzkXunZPHto29N0dQ==
X-Gm-Message-State: AOJu0YzsrGdag9MjE9M3XB+zvUV4IKSdDQW07TgclAVMIMZxnPIkuelX
	XQxVs+rNslgGwfdyx5u55fIYyITkVDEkRRVb2VE2EMJ1x6/XUOZbemg4d8VIfposEwwmeMzjD9V
	d1poM3d/CCMVRxTCvEttU2P5gizWGp7zJ8izr33xCSGLBTk3o
X-Google-Smtp-Source: AGHT+IEOosxGF8h4Vi0Vlcp39HocNK1QEe55vxwXSy7GhxniBSbOhgo83470QwNwUe3lGYtYvOUDbWY3ewG09f/RbhY=
X-Received: by 2002:a05:6512:23a0:b0:52c:b45e:9232 with SMTP id
 2adb3069b0e04-52cb45e9398mr6742498e87.11.1718706456637; Tue, 18 Jun 2024
 03:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me> <20240617-ep93xx-v10-4-662e640ed811@maquefel.me>
In-Reply-To: <20240617-ep93xx-v10-4-662e640ed811@maquefel.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:27:25 +0200
Message-ID: <CACRpkda_uMuk4AFOdQSPTWXuibH7nE3R_qSnrecboczddQw+uA@mail.gmail.com>
Subject: Re: [PATCH v10 04/38] pinctrl: add a Cirrus ep93xx SoC pin controller
To: nikita.shubin@maquefel.me
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 11:38=E2=80=AFAM Nikita Shubin via B4 Relay
<devnull+nikita.shubin.maquefel.me@kernel.org> wrote:

> From: Nikita Shubin <nikita.shubin@maquefel.me>
>
> Add a pin control (only multiplexing) driver for ep93xx SoC so
> we can fully convert ep93xx to device tree.
>
> This driver is capable of muxing ep9301/ep9302/ep9307/ep9312/ep9315
> variants, this is chosen based on "compatible" in device tree.
>
> Co-developed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is this patch dependent on the other patches or something I can just apply?

Yours,
Linus Walleij

