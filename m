Return-Path: <linux-gpio+bounces-20986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62BACDE5A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 14:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF3B23A67A0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 12:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6B51D5CC4;
	Wed,  4 Jun 2025 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vwE845X/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0167733DF
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041753; cv=none; b=Ys69tv4thfwFwTaD5Z4k1ec+YGaiWSCUJrnAUpfuXMCJcL4ro1t0gfczHewmW1XpVUnpMVIcfQzImjkItxGwFOZg43s6UsQmva8gpxr86kI4nDKmDA2P0q0Nj3ereUrhThNWv76ebbBPx2vN1Q2npum4HPg+UfKb1kyYVcXy3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041753; c=relaxed/simple;
	bh=KSsgTYnh/FHQQyVXTF3QAYY04UpFGcN6kyP/vksMXiA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=loS2DgpzhXt9PQ4lZkAJA46po3fRISoH+uRRxY/1CPu2ImQrS/Mb86UXNhlkx8a95NASvvwkk2BqgOQXREClPVd5zm1uE6ZWtyWHNgDQKLnE36MKWFVeYoy2ZRyXOfDG7Ogb+gM4Tq6kSc0hXtZ9a/RyefF+wRoGYvZGz3jUuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vwE845X/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb2e9fd208so1167362666b.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749041749; x=1749646549; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+NTkHnLPR9AbTfm+nqgqvpXIhZIDcEWl1IT2BHVTyI=;
        b=vwE845X/s/xijU5y/qRNwlO85C0DDMWVGSCu0EWUaeN2DQeMYVle/+pP90RRGz4n6Y
         0QWOzLCcQISJJSsEQZdhdmJs6yURdUc93GpgLIOyD8yAE3jyIURj5Jz9mvhECEQcFD6h
         GTYpEglzdqjay/1uyloa34iiBlWHs/BkYnqEKnJ+bLduYniFfJFH9urMTprI9FBMFHM7
         jQlhAA8/8+C+IBwuHjPYJjvKVTUaT4YrNZuNz/8VLB6vKlvDP30ZLJn5dfBKPb5VIIPw
         kpE/BzSPBQXsxmQUwTC+42wqD3N3tX/2ugKfaWEGYGG25TpXRSFMO49BeyCitzkLZ+6f
         PkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041749; x=1749646549;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+NTkHnLPR9AbTfm+nqgqvpXIhZIDcEWl1IT2BHVTyI=;
        b=Ikz4GvxuI2DUuwmqqmd3d3L7NQabpeRi2cUHf2bPqmhDxIbT73+4l7yIKpgl1Jflt8
         gqwGXoFoUEpckVQtOn04ozlWfyMzcwRYXTVGK95/qDVCK/8Fjz08/rpLQZgT0NwVIJ90
         t7mYM6P8VrVTTRUPd4VflwTInXOwwUt+jC6poZ5w8lvDbuYSW05Vc3EMIR3etSwjLBWA
         nn7e060F4iyDTdfd/Puq4W0vVWlIwLpwCfNneTYp8NFw1Qt3uv9Qn/SdYzVYEV+qP1IP
         HDzcPDORuC9LZK7ld7RAiH1oemPUlwAAZU5qmqo8GuY81dijQ6hkReUfAYaq4uXVtx/H
         jIeA==
X-Gm-Message-State: AOJu0Yz3FzEzX+EPv17HL/K5QjuzKrfxdnd2HTsHHXkFdZA/gX5OoQ5o
	v0LvC4iT/jU9CLIy/grR3p7eks7wMn1skb1IIVqNq/2rcrp7tTINAYDzxVoQQ8jjXIM=
X-Gm-Gg: ASbGncsVUkVe98O63KLn5btquUUik4BXmR8wGQsqk/FIOHUuZ1nV5Sc1nXOYpP13NoX
	0iUaek4SEWGkBV/w+Y53CfbhlE4nzsRrABn/SerrXLgGjHtn2Os3pjEl4TZ2X6CsvbCxtL/Kwsd
	1oaMMqwzxk6D+mZS+2gPWxcHFjnv2EMyffcvUHEPiP9HmECj+W0nEGSeLthGLm33JkjzvHMkOnn
	8ap6H4zWv862unvA1317E4+mOOwPtKTeasbz6xukH4axBbkTUyCwMOXwUWT+Zl+CDkkvZ+Za+vu
	tjfkJqAcjLvANIJn5ypHCFYjMy9Xz7OZsXj7vTEcutC2kF2wrVV/CO0=
X-Google-Smtp-Source: AGHT+IFntzGtPpXKwaQPTVWTTCUdtGwViiiOjEEvjf6j3ToLd9PSnfNziBBcm9XGYumPrDcARzpuMw==
X-Received: by 2002:a17:907:7289:b0:adb:4523:90b1 with SMTP id a640c23a62f3a-addf8cca157mr227834566b.23.1749041748978;
        Wed, 04 Jun 2025 05:55:48 -0700 (PDT)
Received: from localhost ([87.122.116.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2efaacfasm953726766b.116.2025.06.04.05.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 14:55:47 +0200
Message-Id: <DADRJYAZCMHQ.3CN96VZQJL1SG@riscstar.com>
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Vincent Fazio"
 <vfazio@xes-inc.com>, "Kent Gibson" <warthog618@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Erik Schilling" <erik.schilling@linaro.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 0/3] doc: add rust docs
X-Mailer: aerc 0.20.1
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
In-Reply-To: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>

On Wed Jun 4, 2025 at 11:53 AM CEST, Bartosz Golaszewski wrote:
> While full integration of Rust docs with sphinx is currently hard, if
> not impossible, we can still follow the pattern we used for GLib
> bindings and generate the docs using cargo, then linking to them from
> the sphinx page.
>
> While at it: fix some minor issues in conf.py.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       doc: reformat conf.py with black
>       doc: improve the readability of the prefix variable
>       doc: integrate rust docs into the sphinx build
>
>  .readthedocs.yaml |  3 +++
>  docs/conf.py      | 43 ++++++++++++++++++++++++++++++++++---------
>  docs/rust_api.rst | 22 ++++++++++++++--------
>  3 files changed, 51 insertions(+), 17 deletions(-)

I tried to do a build of it to look at how it looks, but I run into:

    > make docs
    [...]
    usage: gi-docgen generate [-h] [-q] [--fatal-warnings] [--add-include-p=
ath INCLUDE_PATHS] [-C FILE] [--dry-run] [--templates-dir TEMPLATES_DIR] [-=
-content-dir CONTENT_DIRS] [--theme-name THEME_NAME] [--output-dir OUTPUT_D=
IR] [--no-namespace-dir]
                              [--section SECTIONS]
                              GIRFILE
    gi-docgen generate: error: argument GIRFILE: can't open './/bindings/gl=
ib/Gpiodglib-1.0.gir': [Errno 2] No such file or directory: './/bindings/gl=
ib/Gpiodglib-1.0.gir'

    Extension error:
    Handler <function make_glib_docs at 0x7f186e7b5ee0> for event 'builder-=
inited' threw an exception (exception: Command '['gi-docgen', 'generate', '=
--config', './/bindings/glib/gi-docgen.toml', './/bindings/glib/Gpiodglib-1=
.0.gir', '--output-dir', '/home/ablu/projects/libgpiod/docs/sphinx-output']=
' returned non-zero exit status 2.)
    ~/projects/libgpiod/docs
    make[1]: Leaving directory '/home/ablu/projects/libgpiod/docs'

Not entirely sure what should create that .gir file. I have a build with
bindings enabled, but my bindings/glib/ does not have that file.

Am I missing something?

- Erik

