Return-Path: <linux-gpio+bounces-25043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC402B3968A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 10:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434AB467D68
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 08:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7D82E7BDC;
	Thu, 28 Aug 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Br/HcIOR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F03278E75
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756368676; cv=none; b=S/4Qsiappdw9PllU0AuzRskUaKSV7x6wwQTHCSYd6GM6p2ghtAuYDm3RgvJN7FgsLM4pkQM5HKuXOx1HrrvyrEn8+vcXy1XIHCX5U6QRR/2hP3bhh9CT2x7Mli8m3qz3WgouTuv2EYUW49svMeJ8+RfkK+Pd1Ud3ZO9gyCr5Iwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756368676; c=relaxed/simple;
	bh=Nni8K5hRJBfmff2eroQSZcqcMsuVBb1xBpdjTP0ME8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=OELCBpZwlyl2aZOm0tKSUNKpJ8dNiWawHQJMETrkmo+wnQ8VS/eEPWHWh/8e9GaM1gE10F/BLrWtTvZoUFdeuwL93+zbU8YUzVN72GNd2mRnoD1qd4n98zWKquoyybktEVkG17xiGHJeM0iPRYGTNw5Lyp31MHLf2VyTWLGJSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Br/HcIOR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77057c4d88bso629796b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756368673; x=1756973473; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9wfvGPORkjPZz1uvDjeR3qK/HiNXIVC1t+CINBw0yE=;
        b=Br/HcIORHHUMfeDRFBR7pY8z60l1OKhrDnArpgS3hc4lE84DCeB6hgZCQU8A8jRXkS
         PW17RJQg+Dmn7G+69C7iSYDDCjSYdbkgDuPPLOjOL03DqndIcbI5nTbi6owoOWospZoc
         7qPKY8JZeB2A6sfYxFsuUtqlX2k/v5SttPf09rNR+W0eA7Be3rJYF4dskF6KmmYMNc1P
         MBbNirjuLOLQhdPhwQ9mwptD1fjCdgQtwM0iCxpu/CXjjmnHkU9DE2E6JAnXk5IByMGM
         CYARYnpMrr6mAnbz+b/oRWlivFrvsJIlKyxSAY0EreIyxrHpyiOK483+Le9FN+JO7tCP
         tnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756368673; x=1756973473;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y9wfvGPORkjPZz1uvDjeR3qK/HiNXIVC1t+CINBw0yE=;
        b=fxhXMrxYE8rR3THMDAFfhdbIBsfyBvd+TTX2ZSczkEtG93mvOBIVw3F94iKuEBPG2z
         urs+w1HjIVgy5oS8GyLUVQaAkhTHv3IK/r7q8VFt4QsZAjkRU038zJ6j37QyJzeMgd4f
         CCMJgMYkyfUVli3tc3IdBhSuVDky6NIhdNXifcBoh5KFDKpsxLLgELq/kFYblMZ6Zyts
         EO4FCJr6hJSE+TPhke8/8wADrOP8pEooQJI3KCrg47PaOk1m/Mi9wnkh6akJ5h+CLr57
         pxpdJOMMcAm0ZY4nqRcSBMTiH2RJc7CT46tTlYhObBly6CyWo55wCmYkdlwIxifkqbyH
         uRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWajglCWipmgFOMDFqubyVA8vq2ZfxzRuDVwz8vqgLzvWY0GfIZmsOauRDSj5TPdOYcHKk6rjHGkEl4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9B1OEeNVMYrifPEfljd0zZrnC1cG9WYUcHokklkZhSF9ecT7
	fItZWU9oAPBCilhBwjE0ah5OQQOM7lb8rbSZHfuaFiFj2x/98TC8q1/Js04LRDjOGZ8=
X-Gm-Gg: ASbGncsyrIGx9p48CsXu1F+bduYvpgMUqMWR6wDRSjDnkaYF60QX0XiI4yMv8Gb4WJT
	MUQvFLJ2lZRH5nI8wVq8KjEf0skkcFs6J49fCbyhPbXQOmRjEranF9VBJLUNCOnYZ22FUO4evjX
	d4+h+xRQiJ9JuSja5X5wxj5ZvqBYwhcH2j5y/bjULnBgMWWbHZYA4sfzCxP1tkXe2skprjOEiL+
	5JA0VoMmxftmLDD5+J9k9mzt0AdmEnrMv2lF6CtRnDMDqxx9PuOz7RjgdQSXSbzVxcqkiqOe2RK
	mIoJDg2u7ZM50XRQS37isVfxcowh8mOOBjHDzaQVdqw0thNFBy9BRyTjCgHuUPUEmMnnuWnql6I
	3PWHGhJ7m
X-Google-Smtp-Source: AGHT+IHdFW9aJ9foQOhxQYbifVGfR8IUWejAg478iNxXoZMdL1QPUmv23vwoHP1HgjmNTYlX1MLwWg==
X-Received: by 2002:a05:6a00:1149:b0:76b:f6ef:9729 with SMTP id d2e1a72fcca58-7702fc1c608mr28442320b3a.21.1756368672521;
        Thu, 28 Aug 2025 01:11:12 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b0:c700::35e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7720f609b67sm2881276b3a.3.2025.08.28.01.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 01:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 10:11:09 +0200
Message-Id: <DCDWQBP06EPH.2XIRXCJPVM7JK@riscstar.com>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod v2 0/9] bindings: rust: prepare v1.0.0 release
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.20.1
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
 <DC5DIAHI710X.1S8GSFCJJKWHS@riscstar.com>
 <CAMRc=Md1z4-bOccz1hQHZpGZQw0+cQ6zK8aOPUkbot+vCiKb9Q@mail.gmail.com>
 <DCD03E16WQCF.3GNFYSET3B9QU@riscstar.com>
 <CAMRc=Mf8ii0AxPnDLJWRKyrbjcMZeBe7YAThowkSR9EpVc8+WQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mf8ii0AxPnDLJWRKyrbjcMZeBe7YAThowkSR9EpVc8+WQ@mail.gmail.com>

On Wed Aug 27, 2025 at 3:57 PM CEST, Bartosz Golaszewski wrote:
> On Wed, Aug 27, 2025 at 8:36=E2=80=AFAM Erik Schilling <erik@riscstar.com=
> wrote:
>>
>> On Tue Aug 26, 2025 at 8:07 PM CEST, Bartosz Golaszewski wrote:
>> > On Mon, Aug 18, 2025 at 9:26=E2=80=AFAM Erik Schilling <erik@riscstar.=
com> wrote:
>> >>
>> >> On Fri Aug 15, 2025 at 10:57 AM CEST, Bartosz Golaszewski wrote:
>> >> > The libgpiod rust bindings interface has stayed quite stable over t=
he
>> >> > last months so it's time for it to stop being a v0.x release and be=
come
>> >> > officially carved in stone. Bump dependencies to the most recent ve=
rsions
>> >> > available, fix some issues and then bump versions of the crates ahe=
ad of
>> >> > the official release.
>> >> >
>> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >> > ---
>> >> > Changes in v2:
>> >> > - drop the patch bumping the minimum required rust version
>> >> > - loosen the requirements on the dependency versions: specify only =
the
>> >> >   major number for stable crates and the major.minor for unstable o=
nes
>> >> > - Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release=
-v1-0-372d698f23e8@linaro.org
>> >> >
>> >> > ---
>> >> > Bartosz Golaszewski (9):
>> >> >       bindings: rust: make Buffer::read_edge_events() lifetimes mor=
e explicit
>> >> >       bindings: rust: add missing unsafe block ahead of rust versio=
n bump
>> >> >       bindings: rust: update bindgen dependency
>> >> >       bindings: rust: update errno dependency
>> >> >       bindings: rust: update cc dependency
>> >> >       bindings: rust: update system-deps dependency
>> >> >       bindings: rust: update thiserror dependency
>> >> >       bindings: rust: update intmap dependency
>> >> >       bindings: rust: update crate versions to v1.0.0
>> >> >
>> >> >  bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
>> >> >  bindings/rust/gpiosim-sys/build.rs         |  2 +-
>> >> >  bindings/rust/libgpiod-sys/Cargo.toml      |  6 +++---
>> >> >  bindings/rust/libgpiod-sys/build.rs        |  6 +++---
>> >> >  bindings/rust/libgpiod/Cargo.toml          | 10 +++++-----
>> >> >  bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
>> >> >  bindings/rust/libgpiod/src/lib.rs          |  4 ++--
>> >> >  bindings/rust/libgpiod/src/line_config.rs  |  2 +-
>> >> >  bindings/rust/libgpiod/src/line_info.rs    |  2 +-
>> >> >  bindings/rust/libgpiod/src/line_request.rs |  4 ++--
>> >> >  10 files changed, 23 insertions(+), 23 deletions(-)
>> >> > ---
>> >> > base-commit: cd32f27dd550753488bff4918aef4e230ce01512
>> >> > change-id: 20250811-rust-1-0-0-release-65342607040e
>> >> >
>> >> > Best regards,
>> >> > --
>> >> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >>
>> >> Trying to build with the 1.60 that we claim as lower floor gives me:
>> >>
>> >>     > cargo +1.60 build
>> >>     [...]
>> >>     error: package `bindgen v0.72.0` cannot be built because it requi=
res rustc 1.70.0 or newer, while the currently active rustc version is 1.60=
.0
>> >>
>> >> With 1.70 I get:
>> >>
>> >>     ~/projects/libgpiod/bindings/rust (master)> cargo +1.70 build
>> >>     [...]
>> >>     error: package `system-deps v7.0.5` cannot be built because it re=
quires rustc 1.78.0 or newer, while the currently active rustc version is 1=
.70.0
>> >>
>> >>
>> >> 1.78 builds fine (when having cfg-expr pinned to a pre-2024-edition
>> >> version).
>> >>
>> >> So we will need to bump the MSRV to at least 1.78. The critical path
>> >> seems to be cfg-expr -> system-deps where cfg-expr seems to be extrem=
ely
>> >> aggressive with updating it's MSRV...
>> >>
>> >> 1.78 with a release in May 2024 looks reasonable to me.
>> >>
>> >> Otherwise this looks good to me!
>> >>
>> >> - Erik
>> >>
>> >
>> > Am I getting this right, should I bump min rust version to 1.78 but
>> > leave the edition at 2021?
>>
>> Yes. The 2024 edition came with 1.85. So neither our libs nor we
>> ourselves require that yet. But we _do_ require 1.78 with these changes
>> now.
>>
>> > And what does "pinned to a pre 2024-edition" even mean?
>>
>> The latest cfg-expr version sets edition =3D "2024". It looks like that
>> fails the Cargo.toml parse and the rust-version in the .toml does not
>> work to restrict the automatic update. To fix that I had to set the
>> version in the Cargo.lock file manually:
>>
>>     cargo +1.78 update -p cfg-expr --precise 0.18.0
>>
>> This was the last version before the bump to 2024 edition and 1.85 MSRV.
>>
>> We - as a library - do not have a .lock file. So cargo will try to use
>> the latest and greatest. But a consumer of libgpiod will have such a
>> .lock file and is still able to build libgpiod with these changes under
>> 1.78.
>>
>
> Will the user-experience be: build fails -> user needs to manually
> downgrade cfg-expr in Cargo.lock -> build now succeeds? That doesn't
> sound very convenient and I'm afraid people will just bounce right
> off. Am I missing something?

Hm. This only impacts people using older Rust versions. It requires the
manual pinning of an old version, but allows them to use their Rust
version. If we bump the MSRV then we lock them out altogether. So a
"manual pinning" of versions seems like an improvement over "not
supported at all". So it mostly makes an already misrable life slightly
less miserable.

Users of newer Rust versions won't be impacted by any of these problems
and experience no down-sides.

Does that make more sense?

Aside: I found a somewhat related ticket on the cargo bug tracker and
left a comment there:
https://github.com/rust-lang/cargo/issues/15305#issuecomment-3232412629

- Erik


