Return-Path: <linux-gpio+bounces-24347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCD1B24442
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 10:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 325101891F51
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79272690D9;
	Wed, 13 Aug 2025 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rimfeXS5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBBE2EE5F0
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073476; cv=none; b=Bfd92BG8KJ9KtVw0Uo5x7zLh6xycazUg0HPA/AjmrS5Na1btzY1SqO2kkIOzacju24jl4YMoBLb6nX9CYShpbZNqazzSI27s4SeJljdftBbdZt4G9gn3KYZrnyjvORS9GcAsIZ2r1K1mMvi0dDuzi5UOj08S10PR586aJcatMnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073476; c=relaxed/simple;
	bh=pG7ROqGZacbpy340klFyrIVoNKWXHd+LVImbkbEWcHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=p6Ys2bA06JSud3u3oXQLw8SjfYSJc/urmWwVWTf7nDAAweqtoELNjLaYNEpqS9uH5hm/LfkiW4vmnBzi7Rv/VoVOc7BESc2R/Q60nWkMmFZt2hs0Ntan9E9FjtPfGkA8ffEdAlIsKzJIx26rGWR2vpsSj3WqgOgnquHzrRcmF1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rimfeXS5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b916fda762so312183f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755073472; x=1755678272; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj6Ps5jAybpxXQcMJOO1CAA3iyWxNk2pNg+Qyshec9g=;
        b=rimfeXS5H92SPLD+KvpILebkm4pxBQAVmHexn3ks4jE55FSl4xvZL7HdyBdixfEFHs
         HFbs3XyZx/DG+fh2PSH/4D/hJO4mTJG54SZ3GcJSSlShp4gtZS6hU1sW1grBcnX+EMd2
         j/VZbSIp3PzIseiRGlbMbN/s860f5rfocSp7qs948V2VvzcaOlW/dDgBR6CM+NnzSvRg
         SOL7lheyqTyU6XThp6tJIMUGwkjb3047kpfcg56GNWzM/g71SEvBryNNdlVj/59U+f3F
         c3tKJoKoVtynz0qrHlO60dNIYha6PQ+90E+VD03ZkDxkdNN/FM+YgkH9AR05mRnT6Y9b
         jYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073472; x=1755678272;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tj6Ps5jAybpxXQcMJOO1CAA3iyWxNk2pNg+Qyshec9g=;
        b=MKouq3tBtEYZdLkc018YDKsg+ynrplhcE2LAFAygSTmE2OQTXXNIAmgt+ZK745aq37
         ioArwkq/M4Faq4LXiCzZZM5Hb2eRK62NFrSMOcThy36iyqZw6PE8Q0IE3lhwFMNCaxnP
         vesu9k2GywVQv4k00f332TqjFmn8KdJru/u4tXK+23bXyhEzPWf3KZFbj0q5yqMBb5cn
         Ad1tf6DaYpNG1k0w9zEbT0dSldiCeJMlEYoIZ+jLcCkckr1nlIuLrrZPlRODSQ/sUpb0
         HNIQUjRH4q7vOnFA2lyJZ8YRRMuYKSXpvwWdnKMTUT7IWoBP+T6Q7T2WyYraFsYeJc7R
         Kmsw==
X-Forwarded-Encrypted: i=1; AJvYcCXr9jYqkrhQYnNCN7fRoA9+9Q68crCrP9ik+bAYl2AhtZCWACBYYTFRNJopw/AnNdTV/p+0jpRwY3hB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+MQ4B9GLaDkEJnp30/+E+7AU/pqdZz4GM24euLQLf8j1K9MTe
	lMVmNooDV1AP+oO8Qm5o1fUC2sCaLhOwl4RL9ZFcQY4k3DJtr4mjHZJry174632+CsU=
X-Gm-Gg: ASbGncsUjqxGkFnAg2ppt2lWMq8Q0bzErxA5fMW0dFe0XFW73shs8WczNL6N5RjSQrF
	KIV/r0wYqFNIRJeVWDmnRcSf5geYEp5lepUVzt+HMyAl/gRSpVXESOIjc23rm0N9D3m5U1gVJ9B
	hz0izaz3Zg2BquX2o3QDm5ibvl1I2cG95bKfaCFZENSxgz/sEu/hZNDaBk1HXBSWawHFUPm3lPr
	8nNYu+0afrsxDGVfXw1zrD4B6hi6MiqThl40/LY7nd62wH6ebqaEscLUWpgdQJNNeJf3DNdwWfX
	vN7jNWb8SNYeqCQl4/R4HKcgmFaQGFWkV9Bc0VcE2Wm0AgnRBnAxcOwLunBQFP7SV3RUn7QuNg=
	=
X-Google-Smtp-Source: AGHT+IE8ljENn1YCub/p0IwSIQhoQ1kO7GeG2prNRK3gumNHXML7NzNon7tVq3QBb2z1yZqLmX1GWA==
X-Received: by 2002:a05:6000:4212:b0:3b7:910d:8054 with SMTP id ffacd0b85a97d-3b918c756e9mr1289831f8f.11.1755073472122;
        Wed, 13 Aug 2025 01:24:32 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b4:9700::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469319sm45919503f8f.54.2025.08.13.01.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 10:24:30 +0200
Message-Id: <DC15MDR9KTV0.3L7D9LGTQUWKA@riscstar.com>
Subject: Re: [PATCH libgpiod 04/10] bindings: rust: update errno dependency
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-4-372d698f23e8@linaro.org>
 <DC13QYZSZI3M.11FB0H4NH0O9X@riscstar.com>
 <CAMRc=Md7ACESEbp60HtzS-4STev_4Uk8N9EOadXgHdDwivBHHQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md7ACESEbp60HtzS-4STev_4Uk8N9EOadXgHdDwivBHHQ@mail.gmail.com>

On Wed Aug 13, 2025 at 9:18 AM CEST, Bartosz Golaszewski wrote:
> On Wed, Aug 13, 2025 at 8:56=E2=80=AFAM Erik Schilling <erik@riscstar.com=
> wrote:
>>
>> On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > Bump the errno dependency for gpiosim-sys and libgpiod crates to the
>> > most recent version. No code changes required.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > ---
>> >  bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
>> >  bindings/rust/libgpiod/Cargo.toml    | 2 +-
>> >  2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpio=
sim-sys/Cargo.toml
>> > index 7099abe41226236b9cba70a36643b921021952ee..52ed43410ef5154a57a15e=
362344347a2b2cee57 100644
>> > --- a/bindings/rust/gpiosim-sys/Cargo.toml
>> > +++ b/bindings/rust/gpiosim-sys/Cargo.toml
>> > @@ -15,7 +15,7 @@ license =3D "Apache-2.0 OR BSD-3-Clause"
>> >  edition =3D "2021"
>> >
>> >  [dependencies]
>> > -errno =3D "0.2.8"
>> > +errno =3D "0.3.13"
>> >  libgpiod =3D { path =3D "../libgpiod" }
>> >
>> >  [build-dependencies]
>>
>> Hm. Given that we expose types of `errno` as part of our `Error` struct,
>
> Oh, we do? Is this correct? My habit from writing C libraries is to
> hide all symbols coming in from external dependencies.

Apparently we do through:

    #[error("Operation {0} Failed: {1}")]
    OperationFailed(OperationType, errno::Errno),

Not sure if I am a huge fan of it either. I wonder if we could simply
use the std::io::Error::last_os_error() API instead? [1]

[1] https://doc.rust-lang.org/std/io/struct.Error.html#method.last_os_error

>> one could reason that 0.3.13 is setting a bit arbitrary version floor
>> and 0.3 (^0.3.0) would allow uses a little bit more flexibility...
>>
>
> Yeah, that's another thing that I wanted to clarify: shouldn't we in
> general use just the major version for stable crates (example: version
> =3D "1" for a full version 1.2.3) and minor version for unstable crates
> (example: version =3D "0.3" for a full version 0.3.2) and let cargo pick
> up the most recent bugfix release? That assumes that stable crates
> don't break interfaces across minor version and unstable ones don't do
> this across bugfix releases.

Yes, that gives consumers of libgpiod most flexibility.

>
>> But that really only becomes a problem if someone pins this dependency
>> to a specific version, which seems unlikely. So I guess this is fine.
>>
>
> I'm not getting this one, could you give an example?

If someone (for whatever reason) would specify a `errno =3D "=3D0.3.10"` or
a `errno =3D "<0.3.10"`, then our `errno =3D "^0.3.13"` would break their
dependency chain (if they also handle this particular Error enum
variant).

Not a super likely scenario. But I think a wide "0.3" is better if we
do not require any specific patch release.

- Erik


