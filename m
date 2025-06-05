Return-Path: <linux-gpio+bounces-21028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F043BACEAA5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 09:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC348172C4E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 07:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE24C1C84D9;
	Thu,  5 Jun 2025 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YWaMJpfb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4100C2C3242
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107322; cv=none; b=VufFdvsLU9Fwb07xBxeGJDglyw85GKLNicVBso4wdYNCwSJhTbae5u8iwGUUlrL/DCBCvYbdmbwr9UNJBAKznN1xC6IGunE+cfMrviz9yj7CPyxaE06l8MOcjlNh1Rz3viusC4Ul0Yxr7740k+Uf2oi0HUtB1tyTenumsredhR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107322; c=relaxed/simple;
	bh=2vfNJC/GJ3jOXor6PtajTEZUogAx7XHOljery1QjnfI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=lekfVTYRgNLH/mcqcHdVQqAuyAz+7dRiKrNPcyVIVaZJcYEzn50HoB5Dwd5lzJpLVjIp2xmX0ED75WKLdqMp3wgoO5PLv1BRgMyrekCh4dxLqqHbo6O2U5d0xtBhlPD+LJHUcKUA7mQpWpX6ZfBZVnRuiDYz+uVnEIektjzPiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YWaMJpfb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso946838a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 00:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749107318; x=1749712118; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLllUxAGi8wQLt1+fdEOJ2KFyO3+wZ/4jCa9EHEMlRI=;
        b=YWaMJpfbxDJOryz+9yC1QfzRCwMaU7Ya9ol8b0f/a8LsCrbWDfCWLlyU5R1wn+AX0C
         pakrsCixHK3HJ/fWfkKeOtGjrSObXssZExgK91TTkB66GjOcW4ewV2I9sKn8EBhlR61z
         VNJEGL1dZhxCtQa70NEvvvSv7Bl8HmvbBThyDudBTsX0MP2HSnO/h4nEv8/3yruUWxof
         KhiDpCvyhro7iHe/yWPWHWo1DW8yQccmuMyxXgF1V3zgBMyyMqeo2VXTo+JRwb/20QzY
         qUI1X3TXdfX3hqo04KuUa6v2/b9g0DQRrFBLEJqelMJI7wJtF9PYakqQmcNy64pfBivH
         IuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107318; x=1749712118;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gLllUxAGi8wQLt1+fdEOJ2KFyO3+wZ/4jCa9EHEMlRI=;
        b=ruP5L7GGqhmPPvZCeHrz33aVKUt7gX3zRT5vWNBATnCAp/62HjUarBIVgmlLI67dzo
         ZL0ClOSBDXEiOcLaJZoRGCA0mfj5HU8grYeVcmJTPagOKYdlWK8WDSkA+Xv0hJ2Et4oo
         vKlo5lAb0V0fW2Y35iZbU0MWTVo8s90eAJu+nOexByR3cF2BHswgp8oFZyk48Vei7TQ1
         UmGTbQNgSdIuWsiJpfV+w/XgKpd9S3ajdDu+JeP6JJG/QEbjrlmCZdH0yCouQytmdG2V
         RYMjuQakvdj40KPUEnaiq7Vgoi3SIBUVIT3cvXEvvoiuu74n7f+0ioxxpsoFPVsQuXCc
         fWlg==
X-Forwarded-Encrypted: i=1; AJvYcCVWyOej1ll/6xxwO8XyLxcBNGipKf0v9cX40idwubES0xDOseHbj+muhKUI0CaUyEyAhyecvXG+Ep29@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7I0w3eGBW0uGA91Fxlt+VwlmCWuSm8QQ8IrGUI1QHpHRLDYX+
	yL/mf0DdBCMki2zAE5AfCpe0lRP3aXadJKrFRZlIJgG6fpDw5uxRGVAe6CYD0KX+Bww=
X-Gm-Gg: ASbGncsqJ1rdiuqEvSs/5j+MAuTgJIYvMQFvX4atSiencPpVrz+Gista3YgAbThnJpF
	1a6dUW+O7pD4GueFNa2x7b8uUaZp6byFb2wH0v+DVnL6Esv8EdlmCBEUX+i63RIf7crXBMUWNI7
	CLwsjg9NwsWyih79PCKIxQoANOcJ5lsLBI7JrV21DUTo+bRbnIUBbgospqoS4zzFpaRDTEqQNLQ
	z+Xc6U5svpA5ebB6ou2dCl+blVjmSr+TxkIAdAwsFM6T6NA4FsFLxgdg1/bVCjabQAkwTbw2Eae
	IVOOQJPjg4VoM2LeyAZnlSxtUGc=
X-Google-Smtp-Source: AGHT+IHmooNsoH8rXQbbI0CGCmDab3dIz75mPbY3165xSG8RjgAW2XI5oIO3NTRuB4ST3jWMlN+0jg==
X-Received: by 2002:a05:6402:35d2:b0:602:10b6:c97d with SMTP id 4fb4d7f45d1cf-606e9462923mr5504054a12.15.1749107318275;
        Thu, 05 Jun 2025 00:08:38 -0700 (PDT)
Received: from localhost ([2001:9e8:d5bf:a700::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6071b7a7fbdsm1056985a12.59.2025.06.05.00.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 09:08:37 +0200
Message-Id: <DAEESOMY1IU5.1OH2DE3P3N56H@riscstar.com>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 0/3] doc: add rust docs
Cc: "Vincent Fazio" <vfazio@xes-inc.com>, "Kent Gibson"
 <warthog618@gmail.com>, "Linus Walleij" <linus.walleij@linaro.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.20.1
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
 <DADRJYAZCMHQ.3CN96VZQJL1SG@riscstar.com>
 <CAMRc=MdfOOiQcT-izDiR2focb71cPQNT7fqaBrbUc28fZiSJYg@mail.gmail.com>
In-Reply-To: <CAMRc=MdfOOiQcT-izDiR2focb71cPQNT7fqaBrbUc28fZiSJYg@mail.gmail.com>

On Wed Jun 4, 2025 at 3:00 PM CEST, Bartosz Golaszewski wrote:
> On Wed, Jun 4, 2025 at 2:55=E2=80=AFPM Erik Schilling <erik@riscstar.com>=
 wrote:
>>
>> On Wed Jun 4, 2025 at 11:53 AM CEST, Bartosz Golaszewski wrote:
>> > While full integration of Rust docs with sphinx is currently hard, if
>> > not impossible, we can still follow the pattern we used for GLib
>> > bindings and generate the docs using cargo, then linking to them from
>> > the sphinx page.
>> >
>> > While at it: fix some minor issues in conf.py.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > ---
>> > Bartosz Golaszewski (3):
>> >       doc: reformat conf.py with black
>> >       doc: improve the readability of the prefix variable
>> >       doc: integrate rust docs into the sphinx build
>> >
>> >  .readthedocs.yaml |  3 +++
>> >  docs/conf.py      | 43 ++++++++++++++++++++++++++++++++++---------
>> >  docs/rust_api.rst | 22 ++++++++++++++--------
>> >  3 files changed, 51 insertions(+), 17 deletions(-)
>>
>> I tried to do a build of it to look at how it looks, but I run into:
>>
>>     > make docs
>>     [...]
>>     usage: gi-docgen generate [-h] [-q] [--fatal-warnings] [--add-includ=
e-path INCLUDE_PATHS] [-C FILE] [--dry-run] [--templates-dir TEMPLATES_DIR]=
 [--content-dir CONTENT_DIRS] [--theme-name THEME_NAME] [--output-dir OUTPU=
T_DIR] [--no-namespace-dir]
>>                               [--section SECTIONS]
>>                               GIRFILE
>>     gi-docgen generate: error: argument GIRFILE: can't open './/bindings=
/glib/Gpiodglib-1.0.gir': [Errno 2] No such file or directory: './/bindings=
/glib/Gpiodglib-1.0.gir'
>>
>>     Extension error:
>>     Handler <function make_glib_docs at 0x7f186e7b5ee0> for event 'build=
er-inited' threw an exception (exception: Command '['gi-docgen', 'generate'=
, '--config', './/bindings/glib/gi-docgen.toml', './/bindings/glib/Gpiodgli=
b-1.0.gir', '--output-dir', '/home/ablu/projects/libgpiod/docs/sphinx-outpu=
t']' returned non-zero exit status 2.)
>>     ~/projects/libgpiod/docs
>>     make[1]: Leaving directory '/home/ablu/projects/libgpiod/docs'
>>
>> Not entirely sure what should create that .gir file. I have a build with
>> bindings enabled, but my bindings/glib/ does not have that file.
>>
>> Am I missing something?
>>
>> - Erik
>
> I ran the build both locally and over at RTD[1] so it works fine. You
> probably just need to install the following GLib packages: gi-docgen,
> gir1.2-glib-2.0-dev and gobject-introspection. In general: make sure
> you have all the packages listed in .readthedocs.yaml in the libgpiod
> git tree.

Was missing: gobject-introspection-devel on Fedora =E2=9C=85


