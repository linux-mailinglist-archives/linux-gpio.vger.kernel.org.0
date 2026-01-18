Return-Path: <linux-gpio+bounces-30714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235CD39B6F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 00:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 862B03004B9E
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 23:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C052831A062;
	Sun, 18 Jan 2026 23:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9OTmp3C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F831AA80
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768779317; cv=none; b=JdcN+QOz1oZGLM7k/qKBG7zsi6XB9dzBUrz7hKzP966efj+KlGzNx/e+18AaGB0oAW8knOPO0k7F68CTEABxonkz7sdqkbP7WPZuDwuPRmXaelmgHrvIjPmju+4i3fN7ugxqkH5iwae3Z5zpY2Sco3iPp8yadoOIxK2DECcJ6Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768779317; c=relaxed/simple;
	bh=YkbVqWCMHAA87GdC7Plkmkmk9JVOKKKe7XgNpRGRaqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDC9X/OrnyVGiF8FUCGco3MToso/QEU7pmf7HwDeiym0MrekFpAodwaLwunLnKnWRABaKfH0b/IYlxRMp04UVHMFx6oDa5Kee91+7mIGUZxNk6LV9YmhvkF3o5+/mkBqlHeos9+KX1l/IrpSuJHoreS7B4aGRIGbjU+uvi5M9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9OTmp3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16874C116D0
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768779317;
	bh=YkbVqWCMHAA87GdC7Plkmkmk9JVOKKKe7XgNpRGRaqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P9OTmp3CfSEEn5E6v0xKoM4/h/Tik2iCFZFsRSXwvSojTCRRzY/DGN20edbVEMuK9
	 DLAPC0IjlNqMwwb2GcpZ8bxVpVP375ytr+13YiwsVa+dcf1junkBrJWwaV8WbMtec9
	 Nvo6vteM21TYoAPOZrroq+FafzjRPvm96pVnpzaGZ6WUXHSeD+/OXESyEM8W1fzE5K
	 oeXQ/fjaHNijWElo+DBk2xSB97mNGrc3a96v1M/sqfIBNhGrgoAMprXvlSS2kaR5rN
	 iEwxVZEM3r+NgL8GU8Cm0nH0Lllo5jouZ16oVQ6PKGI+95Pvyswm7ip7u60owYfLcL
	 vGBabfNbe6OIw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-646d9eb45afso3028040d50.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 15:35:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWppmh0l8fSHZFXgA1evA8moV0JXsy166NFImXr+T26jxgQ9e6+KEvOLOLBxx6CRJqZDVQq5Z5ubdkR@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcgTF6v2LbOVfSxBzD4Y0UHpSOOZQd9mk/1Dd1wXjHHFtL3R8
	8MJjRt7jV5AHJRmgqIhucdrMI2XIhFQyDQvevG5rWfYhmDtx8RKJXsUU82jAIrUZsfyvqKaIAOp
	Fj4hpiemHIsrqyxP6pE5C6GndQlU9Y2c=
X-Received: by 2002:a05:690e:4012:b0:63f:9897:f544 with SMTP id
 956f58d0204a3-6491648acb0mr7938587d50.19.1768779316509; Sun, 18 Jan 2026
 15:35:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 00:35:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWRVRwRONmNq450AS0bwfVTHQ_J=MrSbWSg8kh6_A1aw@mail.gmail.com>
X-Gm-Features: AZwV_QhyMEJSWIhAiWMNC6cMsm5DKp9qpyrHDkfmuh578QQ9BpCWbAzGIwv0rT0
Message-ID: <CAD++jLnWRVRwRONmNq450AS0bwfVTHQ_J=MrSbWSg8kh6_A1aw@mail.gmail.com>
Subject: Re: [PATCH] driver core: make pinctrl_bind_pins() private
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 1:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> pinctrl_bind_pins() is only used by driver core (as it should). Move it
> out of the public header into base.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

