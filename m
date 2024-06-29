Return-Path: <linux-gpio+bounces-7834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B591CC94
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 13:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FF81F221DF
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 11:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E91B4D8C2;
	Sat, 29 Jun 2024 11:49:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3603B28F;
	Sat, 29 Jun 2024 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719661762; cv=none; b=DYmuyc6FxvrY+RbUUY8Diop/jZN9GY/0mwC86DtG681ZyTGQNBd2OF6KO9MxfHON5PzZVesxUHqraIAOn1gkV9kr+Y/mU03Jc1YmSrnRhfcI70sFsFnRa+W7Cvdk9k7XXA3N227uBqIgxaWwgdXD8nK9STav+u3VWxQ68/Q+jgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719661762; c=relaxed/simple;
	bh=hesob8jWa7MjuRmXVb/bZU+r9BgU6kf0/ZW5w2ZrP1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAdcX1I5zNiCJWfAwKrKrtiyW/sGAu4+AIPvKXrY80uwprsM5aY82CaDGBhXcQTebg1TqedlzRJwDPLkaO7Eksc2O2Qr9t0H4C3vSfLMtUhuqcUh+D0f5aY9FyeuIKvY90QF6Av8m0+HVAj6p83sDytd0qPYgrZvfb47FvBVj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfde5ae0aaeso1462165276.1;
        Sat, 29 Jun 2024 04:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719661759; x=1720266559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rh5J5TCKS5AbprCe6K4Va0Tf5sJtd88jRIJOwHQxuGo=;
        b=v3gV7XMaPPy8oMmjSOX0Av/1AivKBH33WuzGUqp6oEVzyt2GBhrlCPO0QkMCcTtdK7
         GkfswChRZfzHm6fYtD5cwZgxf9wnHrseNdfeKPVk16ER+RRW8PYI1M0t4jbY+kpMp/NL
         RFT6iH5qRNuRII9vrkEUsd7SiPns0X727+OgYKv9KKDsqXP15O2/4g0QBGPlWDIuNkbU
         C/TQnTre3LM+a7pnIL9atRwfne5zp9lYQvXSmg+vs0bfa82iosI7SFYaprxo+cxEvTa9
         wWenb4/mFyqCIm/kWZpHM3+NRkGEWTzh2fx3srjRP+qybR0dd7H7Zab9Ql8GJ7osReZA
         agGA==
X-Forwarded-Encrypted: i=1; AJvYcCVJWcqtlywelAxLOYrsOEu8MDzpbJHiBpentUzv6SBPaUrbRA/ghsw8AXH/2uISnZxtVTgO4IluV+pfFhHeAsqjzsq9yDxdyn3gOhkb+7OEML0=
X-Gm-Message-State: AOJu0YxqNv8MoZyiX8OqQZEFb+km4Pbd0REUkaVNn/YZKcsQ2A4PLMy1
	wrNGLebAlpTsH5YzZHPRgFENBMqnkLbdCeY+WM7VHMjBEnnCujQQG1YhDpy+
X-Google-Smtp-Source: AGHT+IHaRxJy6vJOCeO+IYhI8NY46CmVsbK5bVHpMIMK0DgrjaSLxH1gOCweAQwsLocGtuQ8CSoDRw==
X-Received: by 2002:a25:8a08:0:b0:e03:61d0:1e68 with SMTP id 3f1490d57ef6-e036e6c61b2mr769484276.0.1719661758939;
        Sat, 29 Jun 2024 04:49:18 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353f6281fsm631281276.63.2024.06.29.04.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:49:18 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-63186c222eeso16202847b3.2;
        Sat, 29 Jun 2024 04:49:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+w1Is8sFThq+eyrU1MbIJs8Lt7tqfuDOUwNrglOU0aaH12vwqnEhFfx4HeW8iCO+60DCyofBRBiU5ooYPZ88d7K84mHWFwXTFG0bwS873PPg=
X-Received: by 2002:a05:690c:804:b0:64a:7d9b:934 with SMTP id
 00721157ae682-64c7277c728mr7587397b3.16.1719661757999; Sat, 29 Jun 2024
 04:49:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719579513.git.geert+renesas@glider.be>
In-Reply-To: <cover.1719579513.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 29 Jun 2024 13:49:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKzWQZnRxFJcano-u-zKMf5aRF1fiJXUb9-noejA9shQ@mail.gmail.com>
Message-ID: <CAMuHMdVKzWQZnRxFJcano-u-zKMf5aRF1fiJXUb9-noejA9shQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.11 (take two)
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Jun 28, 2024 at 3:16=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The following changes since commit 9bd95ac86e700ab8b1a6c225685e0e5afe426b=
4e:
>
>   pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC (2024-06-11 09:50:2=
5 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.11-tag2
>
> for you to fetch changes up to fb0024d1d0742b1a1c97cfb05025913daccfd81f:
>
>   pinctrl: renesas: r8a779h0: Remove unneeded separators (2024-06-27 18:1=
4:02 +0200)
>
> ----------------------------------------------------------------
> pinctrl: renesas: Updates for v6.11 (take two)
>
>   - Add R-Car Gen3 fuse support,
>   - Fix ambiguous and inconsistent pin group names on R-Car V4H,
>   - Add MII Ethernet PHY and external interrupt pin groups on R-Car V4H,
>   - Miscellaneous fixes and improvements.
>
> Note that the new R-Car Fuse DT bindings, and/or driver and platform
> data are shared by multiple driver and DT source files, and thus
> included in multiple pull requests:
>   - "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take two)",
>   - "[GIT PULL 1/3] Renesas driver updates for v6.11" (for soc),
>   - "[GIT PULL 2/3] Renesas DT binding updates for v6.11" (for soc),
>   - "[GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)" (for soc).
>
> Thanks for pulling!

Please hold off merging this.  Arnd pointed out some issues with the
fuse driver.
I will send a new PR this Monday.
Sorry for the trouble.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

