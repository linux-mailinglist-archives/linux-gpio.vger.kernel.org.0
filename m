Return-Path: <linux-gpio+bounces-25183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5249B3B551
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 10:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C29C1C873AD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 08:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A4D29E0FF;
	Fri, 29 Aug 2025 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0GEDY1bS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B029CB24
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454533; cv=none; b=jDHo0SKdeyUtHINyjJE1Z2cCR85Hn8Sg2LyT9obLAg2LVS9U8y27XCwZB6R6mXVhIjc7VlcTI4nXOHfid2grcv252d4IAx3xoVNJZv4j9eHJYmjY4b+UKC5KRDFT97hWkLsyG6DdStaMu+C7JQsOnSfg5hCIxfgEtl6k1zljaks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454533; c=relaxed/simple;
	bh=xPJUfHBnRzixX12C/5z76Z6DAMp6tQqJW/p3kckNnmc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=C2riw4bKtXfptxPQt2X6UKzXkr+GC02OfAVOjWp+QRigO3q9DzVXiixNP3+AliAq3R2Ye6zPNkbcVpQqHPz6vAilGas1SytBjtGaSKDFZo+Glijgvra+GaednwsmF1Tf3PSr0ewATNrw/ZktqfKDbwrkwqIS5ZhA461LCtCswJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0GEDY1bS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-248c7f955a2so16752415ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756454530; x=1757059330; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWgWrDkGSoG7hjgEnCVdCcM05z7JnarpT+P/beuaGVA=;
        b=0GEDY1bSbftSpFrEMEW1PPHu+hR6pidEnpPqpfL3aI/XtRESB+3bdhc7xO6YIXB4+G
         Xe2BJ0HfHAHoM2Z+V457iFSP+7lT4VQ96ZJ7j20Ah/YIHwkuxaMr5e+44yfXysPTBgGo
         yM7Rr3BhNOBCpT4pW+6wosSJ5akwJkNRJi1hodz1NN3/+9HZetiZtN5QXE8W4yuTiTvM
         JF7yvm7BfVwzD2ScHdFvucR2IZO2rvjyStD1Vpk5v3I2w57C/r/c2OBydtHRLtAIERLr
         0ULuGLjIzXmOoh7CUTkVSeGMq/qYDfPHez4FRjp2jZaufy1czAA+vdc2YZJWyP9v81ck
         DdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454530; x=1757059330;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWgWrDkGSoG7hjgEnCVdCcM05z7JnarpT+P/beuaGVA=;
        b=kfPRn7zT/Tl+UzieeakpU8pePIotUrmZpGNfwJryLNcH3oJEOdk37MPK6mxTxAnKMZ
         MVZeDlvp8giCNWol93qNjKZ0fxtLXOSQz7BfgqjkrxtYDzQrVomAH0rzwHBc8/8wsVWC
         SIVWJryOWVREfrzYd2WC0mWomv7fn+0LyOg9AkUKPaPE6uJ6fLR6FE+UWQoGHEGNF7jM
         OclDgAVYWdaHJfNlLopcKesIy3s7tg0DJtvwuiLdLPa7j6WTymzCfS23+EaXQC9jmQWq
         TVwKapI/0ebNLaCF0YRrbUhGWhrhYge9Sjp6/0mXFQ1rjHZq+H4H5b2lkqfwHFKi0t0P
         n/dg==
X-Gm-Message-State: AOJu0YzpqY8UDHPHW89nPbJwLSExTq/4dqYKHhBsHHCzwVrluEKkh3p2
	XUaVU9YUc6/I/OdfRmdxwZ5I4VmLjAv+zGoHYbANtYFZBHJPTzGCPqGcT42JOZVj3/E=
X-Gm-Gg: ASbGncvDPRqBHC0ujXNNO3+aAPZC6aPPfhz3y+we8nbjrP0glF0N83SPrJPa5CcIInG
	5yeQ4byP8oJJNKGvGjvMf78Jl/wbwUoiigAUdPtlHH91k2cte4AV/Oeyw8A4pYDo+RuY1DyOMn4
	/6pz9VbFLA0S3/t3iu62b6TotYU56Q/ZO7ygjkaZpDscY8SNGjshw2GZ3BW+df/XsLlBMniFlWu
	bNp2Sz6pizhW2w+BavI0iTdhY/BNQTTpwX3hfcEXkOoqKgV6HLLK8Y5FBZCV4+TZZE8/krTRZ+3
	YfUUlyxqptXRyZW7JdMz5W3t9N6B6koFg6hExykX4fIpplB6DYaEcWqfYLeQJ74mZqD5/gba8Q=
	=
X-Google-Smtp-Source: AGHT+IEIgLJr7hm75c9rfH5joV4XhtToA/MUF6HC3jIVuz5t8xrV85XWnJPoUTetK/Z0KTygURgLRQ==
X-Received: by 2002:a17:903:8c6:b0:240:3eb9:5363 with SMTP id d9443c01a7336-2462ee7390emr335026975ad.27.1756454529860;
        Fri, 29 Aug 2025 01:02:09 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b9:ee00::35e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bd2aesm1553938b3a.48.2025.08.29.01.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 01:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 10:02:06 +0200
Message-Id: <DCER5Y8A9N2U.1WCYUZFMFSVPK@riscstar.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod v3 00/10] bindings: rust: prepare v1.0.0
 release
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.20.1
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>

On Thu Aug 28, 2025 at 7:43 PM CEST, Bartosz Golaszewski wrote:
> The libgpiod rust bindings interface has stayed quite stable over the
> last months so it's time for it to stop being a v0.x release and become
> officially carved in stone. Bump dependencies to the most recent versions
> available, fix some issues and then bump versions of the crates ahead of
> the official release.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v3:
> - Bump the minimum required rustc version to v1.78 after all to satisfy
>   more recent versions of bindgen and system-deps
> - Link to v2: https://lore.kernel.org/r/20250815-rust-1-0-0-release-v2-0-=
b1794cb4b9be@linaro.org
>
> Changes in v2:
> - drop the patch bumping the minimum required rust version
> - loosen the requirements on the dependency versions: specify only the
>   major number for stable crates and the major.minor for unstable ones
> - Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-v1-0-=
372d698f23e8@linaro.org
>
> ---
> Bartosz Golaszewski (10):
>       bindings: rust: make Buffer::read_edge_events() lifetimes more expl=
icit
>       bindings: rust: add missing unsafe block ahead of rust version bump
>       bindings: rust: bump the minimum required rustc version
>       bindings: rust: update bindgen dependency
>       bindings: rust: update errno dependency
>       bindings: rust: update cc dependency
>       bindings: rust: update system-deps dependency
>       bindings: rust: update thiserror dependency
>       bindings: rust: update intmap dependency
>       bindings: rust: update crate versions to v1.0.0
>
>  bindings/rust/gpiosim-sys/Cargo.toml       | 10 +++++-----
>  bindings/rust/gpiosim-sys/build.rs         |  2 +-
>  bindings/rust/libgpiod-sys/Cargo.toml      |  8 ++++----
>  bindings/rust/libgpiod-sys/build.rs        |  6 +++---
>  bindings/rust/libgpiod/Cargo.toml          | 12 ++++++------
>  bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
>  bindings/rust/libgpiod/src/lib.rs          |  4 ++--
>  bindings/rust/libgpiod/src/line_config.rs  |  2 +-
>  bindings/rust/libgpiod/src/line_info.rs    |  2 +-
>  bindings/rust/libgpiod/src/line_request.rs |  4 ++--
>  10 files changed, 26 insertions(+), 26 deletions(-)
> ---
> base-commit: cd32f27dd550753488bff4918aef4e230ce01512
> change-id: 20250811-rust-1-0-0-release-65342607040e
>
> Best regards,
> --=20
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Erik Wierich <erik@riscstar.com>

