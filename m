Return-Path: <linux-gpio+bounces-1525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC68814410
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 09:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147E828439F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B1617981;
	Fri, 15 Dec 2023 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FLVESKNn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DA24B3C
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4b314f78326so139556e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 00:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702630692; x=1703235492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA8tdY56WXPma2E8fRkNF6wXWjBz9dLRwKCYNxkT2eE=;
        b=FLVESKNniG1Xth4AiJrn1+iwkfQCfFg/fwd4XTsCRB5vPUvozp4UB0UU7gU/7Wg3lP
         20TLHcg4Bdhpas5qYAfwLjYKPgac4pXlGh9fISqtBQ14rr+1NZCXyVI3Cyx9UHgr9BU+
         zmFUDbC3I7v6W566mOnrlO195Cwwh1SduMT865WCVEPur2rrTkbaDwQHv+z7p3yXxg8i
         SRYJ9mu8scRSvCc2Gf7aUsBtSelNGHpEdU0Lk5p45MmiIjuOOCKlKG6OCZlia++SZ9As
         CfCoqpdFNDNQkbzSJw7rPZOZjxhfXDWjqd6MluH75g3QK7ECWp8AOrLMjIWSQHzYEmD6
         he6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702630692; x=1703235492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA8tdY56WXPma2E8fRkNF6wXWjBz9dLRwKCYNxkT2eE=;
        b=NlaR7mZLmJDzsxU24q3rqW6oalkxc99I0Z37RNr5L0JUq9Z/5h22bIgH25IAKgak/K
         MOWyvedGiayMyfZzZrccBkVf38sQWZZLwDOCkETKcloyzGnbv66miSAzqJ99wi411xlP
         DAUagJma0H4UKFidhmV6eVlDfeAJ8KXkqrkLb2+yU/UXyaiUZvGhJtWJnIHz9HFWDzZY
         6NHXRY5IzpLF+cFcCeBAu57li4Pv5RVJ8VEi9NENsZxwZ6V+2aruHNIHenCmRdFQT79a
         lu2Hp50Hb/+WGIzctZeJq6e+Tb9JjYpL7i3HMKiX6DBM5EpEDmIbrShR6NYdqNUBixrO
         fopw==
X-Gm-Message-State: AOJu0Yw3NMkTA06ZNLJHfFbZS8Gf0cDvmQpFxmsw57c0MabZ9eYbmjoQ
	XBkxWPaKKLTB2oFTlNUgbtPf0hvOdaeeY6CDLSHOQGTAwL8RKDzzTEU=
X-Google-Smtp-Source: AGHT+IGmee5VNc//iWfW0bp8ZaeSvJOR9rKGTVTRdW771gbUenXoMLiM2KqyZaniue4Q/QklNvwzZeV7anAPRKh5uR4=
X-Received: by 2002:a05:6122:369b:b0:4b2:c555:15a4 with SMTP id
 ec27-20020a056122369b00b004b2c55515a4mr11062486vkb.31.1702630691799; Fri, 15
 Dec 2023 00:58:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM6PR08MB5322659E14BB25DBAF6CD3CCC48DA@DM6PR08MB5322.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5322659E14BB25DBAF6CD3CCC48DA@DM6PR08MB5322.namprd08.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Dec 2023 09:58:00 +0100
Message-ID: <CAMRc=Mf9tPSGB+rSL2UZD9Mx5x1X8osP0_j4h0J=bH6XAwbYTA@mail.gmail.com>
Subject: Re: [libgpiod] Simplify GPIO monitoring
To: Kyle Nieman <Kyle.Nieman@fii-na.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 5:50=E2=80=AFPM Kyle Nieman <Kyle.Nieman@fii-na.com=
> wrote:
>
> Hello,
>
> In embedded linux systems, GPIO monitoring for edge-events is common.
> For example, OpenBMC has several applications/packages that monitor GPIOs=
 for an
> extended period of time.
>
> phosphor-gpio-monitor:
>         1. Starts a systemd service on GPIO events
>         2. Sets a dbus property based upon initial state and on GPIO even=
ts
> https://github.com/openbmc/phosphor-gpio-monitor
>
> x86-power-control:
>         1. Controls system power based on different button presses
> https://github.com/openbmc/x86-power-control
>
> However, there seems to be a lot of duplicate code between these applicat=
ions
> related to monitoring in general that looks like it could be reduced.
>
> GPIO monitoring tends to have the following steps:
> 1. Configure/set up the GPIO line for monitoring
> 2. Read the initial value of GPIO line
> 3. Take action based upon initial value
> 4. Wait for event by monitoring fd
> 5. Take action on event, then continue monitoring or cleanup
>
> A function could internally complete the common steps regardless of what =
GPIO
> line is being monitored such as steps 1, 2, and 4. The other steps unique=
 to the
> GPIO being monitored could be handled by callbacks. The
> gpiod_ctxless_event_monitor functions seemed to do this partially, but we=
re
> removed along with the rest of the ctxless functions in commit
> 9b6e6d268671ef2dd00d9a9abe7ba43d14e7a84b
> (ctxless: drop all context-less interfaces).
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D9b=
6e6d268671ef2dd00d9a9abe7ba43d14e7a84b
>
> Would there be an issue with adding a higher level abstraction to simplif=
y GPIO
> monitoring?
>

I have decided for libgpiod v2 to remain as low-level and simple as
possible and to only implement the bare minimum of functionality that
at the same time covers all uAPI features.

I'm working on DBus bindings for libgpiod v2 a part of which is a GLib
abstraction layer that is a higher-level C interface. Could you give
it a try and see if it works for your use-case?

    https://github.com/brgl/libgpiod-private/tree/topic/dbus

You can build it using --enable-bindings-glib with configure.

If that's something useful, I could possibly release it separately
from the DBus daemon.

Bart

> Thanks,
> Kyle
>

