Return-Path: <linux-gpio+bounces-24479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D8B29AC0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 09:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A917718A01FA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 07:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41867279358;
	Mon, 18 Aug 2025 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GjSJmBL2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB95FDA7
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501967; cv=none; b=ubWpsnu6ft8w+Cra+Fikrc5DZcYbmcjAw+nCfuhKgPDCNXKB12yiJuMFqoOavToBbpcfPvmQF9MOXjnmTwO8PytUHQsQpsgnAxG9HFATBQsdYpBIvzJ2Vs97TIIWTFvMs7tq4tBrIWnTd7WX7hTVdWVa3Ps2tiqWqtSdUjWTw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501967; c=relaxed/simple;
	bh=4QIZUnpAhdSUmkmRUGZcXYAa0Xw8iFJPcfyA/Jt+yfs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=hoGw6xu30gujzsA/0htU+05iR10iT3UslvocJO7In7v7+7DFbiOBJc7ckh/2dPDEJOIQYhSm//MENaWefv1B8X5XOdbvZ9k98wx5utUDpp/wEtMFMcndmwKyZFg1S4f8hM2FzyhZgiot2odsuCs5oJfp2W2AoJiZqKueJm+JENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GjSJmBL2; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61a1663be10so2410287a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 00:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755501960; x=1756106760; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0whMy+RNOYsmB6s2chJGQg9NA2cDMYmdgxkhAv7n+SM=;
        b=GjSJmBL2SlLu3R87Ees84vAe6tnJwSWoubve0bb2STKHWN5bqI3rPkLU0nHdTLEOyw
         /1oikL8sxUJ1jYlaSUkWv9N52Eiz0qBCssWpL1Rne/RIZRHa9JMcoYXUedAc/IMA9H1b
         MU8W16hZwCHOriM2m8xXpgpYbSDIZlKfCstdCJ6PyuM1UXMR07OGeKWa2mX0viWQoTXr
         ERA+LtwEmF55nmhd2FByqbgbs0nGFOwZ2m3NKWo4284u5qzZQ446w4SQXpezApZjulo+
         nXUzRem4GlG0P9LNuJdjEZgAZnzYEJ/LFyE7HI+6BgsAE0vpmkI2hJCcrVThwzYJHTvN
         W0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501960; x=1756106760;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0whMy+RNOYsmB6s2chJGQg9NA2cDMYmdgxkhAv7n+SM=;
        b=YTPLB4uzGq+UScubfyeNvDriSTwlgV6AXBI/IIRUzTTl/Sc5Sws7HMT4i4/XadqHBX
         Ob9cxbNX8G4V+oROZ62ATNfT/C4UqGbMl7ivlN/WZfHwGy2fEEmJQ59luTqsFxKPXLNe
         vO5EYfvWWHB5P+lcLNtrobpqtweCi/NuY0TAeBAiKJ0kTCQuDcjUWeBQTskXIRG8Mfef
         yyJqskALDXbAlXxTnXI4Qa4JF/L9cj1rBP3Q2pEwS0W2uGVySeThSXo9EhXq2tPNPYlv
         T8Mtod2e9d5r98wTOeghu366aAeE4E0jgBVLS6uBUpQeKWdvhUmDjw8ZwOZh5QylMj8g
         +IUg==
X-Gm-Message-State: AOJu0Yxv24QwUtYqhIG3tY3BncxQbvmo8Qpqa18dI3PqbJWnbP5SJaZ9
	5b++KLkiq882pkTCCWzMVdEy7Y8Ihpq7Io2U6eW0S7uNPzJZ6Qu5+ocEQVO08TMSyWYvID+aNa/
	B3xfd
X-Gm-Gg: ASbGncsmHjv3WDjt0QLa23+YjPR5mRqUzr2RcnapfXqLTMBz/rNLt2lt1fnjMn0bLHX
	n6luQ6VtUFkInz9x8h0SHmQ4TfnLLBw3oU6jdWSZjxg6ERzBgCarycgUayBuHUaimPr+m+09VI8
	iF6eu97GrfRb/o4FD7r3wRqRPcdeO/Qq5Ktwi4IxUjUeloXiCYBnMnctJ5mCAMXPvB9qVB/TcaW
	9P0iiWhj9tPiyH1832iB3gsGpCFCSWNbFwy+9cDcRCGDEZ+9IQFKjduV+GxuBmsfaikXap/f6SV
	8hzWzUmNiuxTdpyV22qHIM+p3DSphggkmzBC3FkRujNOuWLwO4ygtpGbLV1p8uywFkiQZVdP4Jg
	=
X-Google-Smtp-Source: AGHT+IGFsAEgEqVgRgVB+0dsb624p7fdDMQO3QpTRLo8QhH2rc2qqtL6FrGeG5YJK4EfH6oBSP8PZg==
X-Received: by 2002:a05:6402:26cf:b0:618:229d:707a with SMTP id 4fb4d7f45d1cf-618b050c363mr8725159a12.6.1755501960085;
        Mon, 18 Aug 2025 00:26:00 -0700 (PDT)
Received: from localhost ([2001:9e8:d5a0:7e00::35e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a166452a2sm4405764a12.51.2025.08.18.00.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 00:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 09:25:58 +0200
Message-Id: <DC5DIAHI710X.1S8GSFCJJKWHS@riscstar.com>
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod v2 0/9] bindings: rust: prepare v1.0.0 release
X-Mailer: aerc 0.20.1
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>

On Fri Aug 15, 2025 at 10:57 AM CEST, Bartosz Golaszewski wrote:
> The libgpiod rust bindings interface has stayed quite stable over the
> last months so it's time for it to stop being a v0.x release and become
> officially carved in stone. Bump dependencies to the most recent versions
> available, fix some issues and then bump versions of the crates ahead of
> the official release.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - drop the patch bumping the minimum required rust version
> - loosen the requirements on the dependency versions: specify only the
>   major number for stable crates and the major.minor for unstable ones
> - Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-v1-0-=
372d698f23e8@linaro.org
>
> ---
> Bartosz Golaszewski (9):
>       bindings: rust: make Buffer::read_edge_events() lifetimes more expl=
icit
>       bindings: rust: add missing unsafe block ahead of rust version bump
>       bindings: rust: update bindgen dependency
>       bindings: rust: update errno dependency
>       bindings: rust: update cc dependency
>       bindings: rust: update system-deps dependency
>       bindings: rust: update thiserror dependency
>       bindings: rust: update intmap dependency
>       bindings: rust: update crate versions to v1.0.0
>
>  bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
>  bindings/rust/gpiosim-sys/build.rs         |  2 +-
>  bindings/rust/libgpiod-sys/Cargo.toml      |  6 +++---
>  bindings/rust/libgpiod-sys/build.rs        |  6 +++---
>  bindings/rust/libgpiod/Cargo.toml          | 10 +++++-----
>  bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
>  bindings/rust/libgpiod/src/lib.rs          |  4 ++--
>  bindings/rust/libgpiod/src/line_config.rs  |  2 +-
>  bindings/rust/libgpiod/src/line_info.rs    |  2 +-
>  bindings/rust/libgpiod/src/line_request.rs |  4 ++--
>  10 files changed, 23 insertions(+), 23 deletions(-)
> ---
> base-commit: cd32f27dd550753488bff4918aef4e230ce01512
> change-id: 20250811-rust-1-0-0-release-65342607040e
>
> Best regards,
> --=20
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Trying to build with the 1.60 that we claim as lower floor gives me:

    > cargo +1.60 build
    [...]
    error: package `bindgen v0.72.0` cannot be built because it requires ru=
stc 1.70.0 or newer, while the currently active rustc version is 1.60.0

With 1.70 I get:

    ~/projects/libgpiod/bindings/rust (master)> cargo +1.70 build
    [...]
    error: package `system-deps v7.0.5` cannot be built because it requires=
 rustc 1.78.0 or newer, while the currently active rustc version is 1.70.0


1.78 builds fine (when having cfg-expr pinned to a pre-2024-edition
version).

So we will need to bump the MSRV to at least 1.78. The critical path
seems to be cfg-expr -> system-deps where cfg-expr seems to be extremely
aggressive with updating it's MSRV...

1.78 with a release in May 2024 looks reasonable to me.

Otherwise this looks good to me!

- Erik




