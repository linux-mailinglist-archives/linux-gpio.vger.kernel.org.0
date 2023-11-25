Return-Path: <linux-gpio+bounces-520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226837F903E
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Nov 2023 00:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62A661C20AD8
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 23:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2486730FAC;
	Sat, 25 Nov 2023 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnaPy226"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854BD129
	for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 15:05:20 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so2648142276.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 15:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700953519; x=1701558319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5t0Y/VnICe+ERJNkW/1rkcBwpPmZhdYUYmi9BmnfaA=;
        b=JnaPy2260sNyY9Wf8olvqHLbnZ2VisJzyzxJIRG8BJmCpXLo6XQPn/uzXqDTG7Bmsu
         D7a/FoZqMqbc0qHOzXf7Hn4Vx+V/Xdnsq0eZbvXj1Mt++HQXv74Qx0yIpRcaIMlKioXm
         awCkYjjEWgzBfRol3+sLlUfslNS4xDI4qVqsH31PpDnoi/BbUSKi4h88NXUXkenyFEoK
         we0n8+KSB35JonWnbfAA0sTus4PcpqRZhOs9+PtMUCrlaTYc3T6UIDSjf3xS2AAHYSg6
         rFDRhTFWAeihGvJDMp8TVIXw3c495ayNc9lw/gIf0GKrHoj8216XR+gSS7wrtsMumVdM
         YOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700953519; x=1701558319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5t0Y/VnICe+ERJNkW/1rkcBwpPmZhdYUYmi9BmnfaA=;
        b=EpaltBljkBJOo6aq7JlIFTASiUB1wv88d9iMpMlluvTEH2qjxq0bwE0QAnKFgQSXOb
         X1HjSff4IcEtauvaZtN5AiB9DjvRDofTkeDERegyujPp99EDJFE+kirK7ALlEwZZXB3R
         GdEKDycAozvjAuCSgUjDl+S44c/IOKk4nAl76OGBEtyz48zoczBtJDKjzUBb28r4fK+o
         266y0p8X0hNqAplQ8AMEol3oESXhz2iJrkI0rbYuGZG5nMxPagQJjc2dfpb+M9BHjiK3
         L14xr1cOCp8JA2ZObPInHorjaSGv7tsi8IpUUnIs7o8JtxvPeqwtqU7I+gYsX7oqY847
         0bZg==
X-Gm-Message-State: AOJu0Yy0/SJHfIeLA1KX0dZihTTUmnwk7Zu6hSAIc/z/c0ng5s4zLVRo
	fgGcUBqyLnHAGZj2FXv0NCnbrS6gOlo2gWfORWMt7+/5k7oTW8Zv
X-Google-Smtp-Source: AGHT+IHQdFfZH4UJ8HNqgw4c532iHTxW1BWuqc5WPvk5v0u68UcrrD7/uoRsgyVS6Pwx5ZL6hxlrDv/Mr4uKiQUO7+E=
X-Received: by 2002:a81:a195:0:b0:5ca:e0b1:45d5 with SMTP id
 y143-20020a81a195000000b005cae0b145d5mr2342082ywg.23.1700953519713; Sat, 25
 Nov 2023 15:05:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125-dropcomment-v1-1-15800415aae0@linaro.org> <ZWFepm7ufLdl115j@rigel>
In-Reply-To: <ZWFepm7ufLdl115j@rigel>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Nov 2023 00:05:08 +0100
Message-ID: <CACRpkdZvwePEaRVQLafD8KmiOENgEGFFDBXGPqS5_WLzNi2_yA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Drop cargo-culted comment
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 3:40=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
> On Sat, Nov 25, 2023 at 12:25:47AM +0100, Linus Walleij wrote:

> > -/* gpio_lock prevents conflicts during gpio_desc[] table updates.
> > - * While any GPIO is requested, its gpio_chip is not removable;
> > - * each GPIO's "requested" flag serves as a lock and refcount.
> > - */
>
> Perhaps provide a comment as to what the gpio_lock DOES cover?

Normally yes, but Bartosz just said he is going to replace this spinlock
with a mutex so it's better if he adds it then.

Yours,
Linus Walleij

