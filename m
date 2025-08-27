Return-Path: <linux-gpio+bounces-25017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F267B37A7E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 08:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BB01B26EDA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 06:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D15253355;
	Wed, 27 Aug 2025 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dt0GQrpt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F333D18FDDB
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756276603; cv=none; b=Dteg+w0KxVgG/Vcmgm5DgaNJ8XcrezIzK8pVDh8mHcL8PdJIC+D6tPFsv6Yoo5DA0QiS4V8H1rZsak5Nc+lKXm83aVe3D4zA+fxqBo43cCbHD83VSU7pqJDIcwQgGEtXSCTSgy1oF47/RphX8zt8tLQuvAt1oYDPfus0RFQ0NA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756276603; c=relaxed/simple;
	bh=vC842GtdPoh6DoMKJQUAtCboUXyHfcqUaogFER3dXsc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lrE1ryxxspsYBpBFyON+SPwA4c/qB33myPIdUXIfq3TtiUPk72cxflGjBtME08b7tTjs2Givh0sLLWdwjhWNirVsOf5rwiOpQ7G8KOEKF/rBJ0jXwL8OtF0XsUiJ61MyLbkotka+w02SR2PFgkTtYH/H9iebneXX0JVmvGbV/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dt0GQrpt; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-771facea122so883537b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756276599; x=1756881399; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO367BGm3Xno2BrZv26cBNWvw9LvOzhxGRxgaEfYsWg=;
        b=dt0GQrpto0g9+w4uINI129vP5yxF/CXja5B1cHLLP2MCPAiT8AmnZE2AXxxjBEgIX9
         +7VEKwvjQCODLnfZ/z86vbT+jYUZcGNze8/Qpswsw+UZiyTpUN+EVbuvcGh/08dfMnEk
         hm+RAnkYUVm46NBl4zrDTaCMS1YOp8TbGWEQpKuvPJx2Etn4EZgmFSZV5HU/Jzv4029O
         CLVmH7xZhsC+8s+JuaSZ97ECc44hMmgIyejo01MdgffEBoudzzaXaF2cv2VI07g4Q+mq
         PWN6SJF7Q8PbkqA/Y1lSlvGscGfMo/yt2jQ+fEBGjUfqnGUb5rWtIRDPZgzGdJW4cdRg
         mPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756276599; x=1756881399;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FO367BGm3Xno2BrZv26cBNWvw9LvOzhxGRxgaEfYsWg=;
        b=efwpa6hnm150Q6CNyjaYCcvhQzV0Sw605IMuhyN0I5Syg9b3Q6HgX07sE12Di6Rxi/
         7ht1+xyNNnFnKcmixHf7aSNwR6p8CznwqBSp73Tp47nD1o1r27fwsxyTkIHYVwJw07B+
         z6obkiAlgRnlEkZwBQMlprxeqM8l24lX4bOkclJuIfk7SYjOCtIgCNxpgOrRk0WPY380
         SM12hiHFbCmdr1u9bpooz73exAzmKXofTOxRYgmCFQ19v+PmhYppaIhsqPm2CxQGUkiz
         FykwGYwr42aYH4coDNu5//imsXkCxkVDOx5RykH4mSA+nl1ugp2EOEStzt20zrBAS5iw
         kfgg==
X-Forwarded-Encrypted: i=1; AJvYcCV/DuCrO20BG9Ei3f0QQgLViIQSjyofw/k35jfP8b14ieDls4d2Q1EZ4Y/lpPR5S0vHCZgMUAFSCqhz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41NiCGVTF8mS25E4ewDkvygklmk3fB/B9x4tX49s20EtVzEqr
	1zT0UpnEPfReFALBItXzkX4ooxtYTfk9vf56mh3+Iv9RHDa8qjTtUXivEhs0DE9nKoM=
X-Gm-Gg: ASbGncsI9Xbj+OQwcuG2t2kPYHa0Ys+4uJ+pgrriwX2Lmd90+bZUXEqAe6OTBsfLCAZ
	9EONiJ34+SyOtotxUInKqMlNZRD/RFJCw4XXWQNyovGLGSvG9RE11RR8/8ossCr8Fm9CxEn8sJQ
	ZFISXgxmlqPsPrQsKOG3hdUtXjJFJkp2GaJ93aj4bNcXwZgLjxC9VL55OBa8YDcJvTaHfQ+JL4j
	mmys6/CVdn5Qouz0bIvgrHgIvH4FX/Uow6/atVLzLd4wq9zT/elhB8D0cR1eiqWKn09LWbYmiw4
	HpUFF6akao7kAB7LubFfVqf8A60GTn7yMtwt0PcVUFMny6txiqTS6kSHA1FUYwWLOOA1TINL1SI
	=
X-Google-Smtp-Source: AGHT+IGJn8Cajk+chlKQx7oTxhgLZx7Aa4VyWR6ocu1rk+obd12xXR68uYduZy1uBAHEStlu3MzdXA==
X-Received: by 2002:a05:6a00:400a:b0:771:e908:b573 with SMTP id d2e1a72fcca58-771e908b67cmr10903713b3a.31.1756276599193;
        Tue, 26 Aug 2025 23:36:39 -0700 (PDT)
Received: from localhost ([2001:9e8:d5a6:1000::35e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7704821293asm11075817b3a.15.2025.08.26.23.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 23:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Aug 2025 08:36:36 +0200
Message-Id: <DCD03E16WQCF.3GNFYSET3B9QU@riscstar.com>
Subject: Re: [PATCH libgpiod v2 0/9] bindings: rust: prepare v1.0.0 release
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
 <DC5DIAHI710X.1S8GSFCJJKWHS@riscstar.com>
 <CAMRc=Md1z4-bOccz1hQHZpGZQw0+cQ6zK8aOPUkbot+vCiKb9Q@mail.gmail.com>
In-Reply-To: <CAMRc=Md1z4-bOccz1hQHZpGZQw0+cQ6zK8aOPUkbot+vCiKb9Q@mail.gmail.com>

On Tue Aug 26, 2025 at 8:07 PM CEST, Bartosz Golaszewski wrote:
> On Mon, Aug 18, 2025 at 9:26=E2=80=AFAM Erik Schilling <erik@riscstar.com=
> wrote:
>>
>> On Fri Aug 15, 2025 at 10:57 AM CEST, Bartosz Golaszewski wrote:
>> > The libgpiod rust bindings interface has stayed quite stable over the
>> > last months so it's time for it to stop being a v0.x release and becom=
e
>> > officially carved in stone. Bump dependencies to the most recent versi=
ons
>> > available, fix some issues and then bump versions of the crates ahead =
of
>> > the official release.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> > ---
>> > Changes in v2:
>> > - drop the patch bumping the minimum required rust version
>> > - loosen the requirements on the dependency versions: specify only the
>> >   major number for stable crates and the major.minor for unstable ones
>> > - Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-v1=
-0-372d698f23e8@linaro.org
>> >
>> > ---
>> > Bartosz Golaszewski (9):
>> >       bindings: rust: make Buffer::read_edge_events() lifetimes more e=
xplicit
>> >       bindings: rust: add missing unsafe block ahead of rust version b=
ump
>> >       bindings: rust: update bindgen dependency
>> >       bindings: rust: update errno dependency
>> >       bindings: rust: update cc dependency
>> >       bindings: rust: update system-deps dependency
>> >       bindings: rust: update thiserror dependency
>> >       bindings: rust: update intmap dependency
>> >       bindings: rust: update crate versions to v1.0.0
>> >
>> >  bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
>> >  bindings/rust/gpiosim-sys/build.rs         |  2 +-
>> >  bindings/rust/libgpiod-sys/Cargo.toml      |  6 +++---
>> >  bindings/rust/libgpiod-sys/build.rs        |  6 +++---
>> >  bindings/rust/libgpiod/Cargo.toml          | 10 +++++-----
>> >  bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
>> >  bindings/rust/libgpiod/src/lib.rs          |  4 ++--
>> >  bindings/rust/libgpiod/src/line_config.rs  |  2 +-
>> >  bindings/rust/libgpiod/src/line_info.rs    |  2 +-
>> >  bindings/rust/libgpiod/src/line_request.rs |  4 ++--
>> >  10 files changed, 23 insertions(+), 23 deletions(-)
>> > ---
>> > base-commit: cd32f27dd550753488bff4918aef4e230ce01512
>> > change-id: 20250811-rust-1-0-0-release-65342607040e
>> >
>> > Best regards,
>> > --
>> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> Trying to build with the 1.60 that we claim as lower floor gives me:
>>
>>     > cargo +1.60 build
>>     [...]
>>     error: package `bindgen v0.72.0` cannot be built because it requires=
 rustc 1.70.0 or newer, while the currently active rustc version is 1.60.0
>>
>> With 1.70 I get:
>>
>>     ~/projects/libgpiod/bindings/rust (master)> cargo +1.70 build
>>     [...]
>>     error: package `system-deps v7.0.5` cannot be built because it requi=
res rustc 1.78.0 or newer, while the currently active rustc version is 1.70=
.0
>>
>>
>> 1.78 builds fine (when having cfg-expr pinned to a pre-2024-edition
>> version).
>>
>> So we will need to bump the MSRV to at least 1.78. The critical path
>> seems to be cfg-expr -> system-deps where cfg-expr seems to be extremely
>> aggressive with updating it's MSRV...
>>
>> 1.78 with a release in May 2024 looks reasonable to me.
>>
>> Otherwise this looks good to me!
>>
>> - Erik
>>
>
> Am I getting this right, should I bump min rust version to 1.78 but
> leave the edition at 2021?

Yes. The 2024 edition came with 1.85. So neither our libs nor we
ourselves require that yet. But we _do_ require 1.78 with these changes
now.

> And what does "pinned to a pre 2024-edition" even mean?

The latest cfg-expr version sets edition =3D "2024". It looks like that
fails the Cargo.toml parse and the rust-version in the .toml does not
work to restrict the automatic update. To fix that I had to set the
version in the Cargo.lock file manually:

    cargo +1.78 update -p cfg-expr --precise 0.18.0

This was the last version before the bump to 2024 edition and 1.85 MSRV.

We - as a library - do not have a .lock file. So cargo will try to use
the latest and greatest. But a consumer of libgpiod will have such a
.lock file and is still able to build libgpiod with these changes under
1.78.

- Erik

