Return-Path: <linux-gpio+bounces-21037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2AACEBCB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 10:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630C41646D6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 08:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CAD202F8B;
	Thu,  5 Jun 2025 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="aA1xj7j8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D41F582A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112060; cv=none; b=Phx1j/pe15kvbrvEPQqx9J1e0F4XPyoZoIzac1fkKt3VGc3bCk7so8IvWeihxUMAvMjZcbkbZWIMfTJrTm9ykcBI1xKYTtNe1V7TSeEeQs+FHGmCYEUNXWHtpKS5wxSr5u7JJjps3Ecnwzezyve702YCe8D06LN74jZHeDB8p/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112060; c=relaxed/simple;
	bh=2XKy/OeobetrrZ6sR9+Tt9VM6P8Ccjhb/gyQPC2CvzM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=n2tmBTBflBj2TDo7vDp9cnmeN8WlXEdOtsfuYJ+wOKVzy1+9NwzouHvwKB16vmFcGypBCC8Ycv8PGq86ODwLYo8xJiKocf8xjYAKJBErzxrSPDMnmpFeoUE8GpPv7XCN2VWbB4vOda9t1dOA2/ruBoIVx6O0whcTzJ0DIXTjabk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=aA1xj7j8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad52dfe06ceso99562366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749112056; x=1749716856; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bg+ClFHMCfxVzUQXh4vuUGnbARlHIC6FERCHuyLQZ3s=;
        b=aA1xj7j8t7TKaHhesksdP51Pl2/fAF19tDR4HH9cF1ySpgvBhkJoOVT59+Y0lp1PZh
         VGncm4hq6Y6N2GaPfxEEMpdt6D5ZmCBXic+26kldsAfLlSUX1QP8ETIDKC9EuKJcZtef
         Y38X7zUlRiKoq/XZk10ms+I2WTSDH9zd4b9Rf5xYCnrMsMD7VWUflkTLAX84jWlSRs/Q
         8X5BHartY13RkMtTTVxLcUrjBBwTieYTd0cca/q8xDDkweTmcN3Ujx+nNOLUyfD5xQrn
         zDIBE7QtWjrUpmZrqP4DkA7s0WAUeDMrxJPvnUHD0ohbAs3GeTz7e//yVANqrfIXI+tb
         2E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112056; x=1749716856;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bg+ClFHMCfxVzUQXh4vuUGnbARlHIC6FERCHuyLQZ3s=;
        b=HHUJcCbTw9MxFU7zvRkhOefOrH2zb8FWa5dICwX8Ur4khkN2pZDRu32v+2FcdW7Pes
         n8wTwFBi7p8hssZpKiaS5va1kOnPXkycaUJOx2V+n9TrQKABUI5Tvh40JGlRRDraaTwU
         5sjMDDergbyQ3Ur2nbFDuN7MjzfjUGEde/tSzj8XjyDvLSHIWtyVnyyrkGzPbNxtxzeR
         qJvV2dLbf9VZwYSnPDSPsjfr1tTpIpLNFJHEBaOqL0S1EoJC/FUDUypBfQF8WKiSI9PC
         mKGnfvCjFQUX2V8y9sgSeD7WDIyWqcU816ZD3vvIdj07nEZOMCwE+r51rhEvi/LEc7Sg
         iYTQ==
X-Gm-Message-State: AOJu0YwUHzk/baFRNhvYzksyvxCJFTGKOooF9nrTfVhlY3g41exxUIcX
	g7VlhdkSneq/muorrTuFP1SyBED9997w/dZUvNKhsUk52H+jCxqNR8kJC6+aeTFb8g0=
X-Gm-Gg: ASbGncsZOHHyhrNKkpelgoP82/xZFT+3ipma/CT6V6f/xtVkkfEOknsGEz9cfDMkNIv
	kePrVYSFWB71sqZmQEAtWgOpqvW4FolZrzXI3rH4FOPEHgW8iHAQ/cn8J+KcWKQSTeeZ31jD9uB
	KTF+14B4Iu2LJRMxC6PEVyu9IKFLDCxaIyXjS45Z0cm+YF5xlorrVvI7wFepsNdWPYddUpwms8l
	b/Bh6RVwxRE7oRulWMy1A/CVpvGiXIOi2Dycrj+yeQbJmOFRe0wPU1YWoAjDSafzL1Emtm14Fp5
	vdjRXlKf2MItG0y9A8azpN/+aShROJcWAkpFiA==
X-Google-Smtp-Source: AGHT+IED6PTTPhCQcspRyTCbsqjOEFcaLKZ7Z6eUzKGCNDbqziKij6k+T2HVXLVjUttwbcexhJZ+MA==
X-Received: by 2002:a17:907:7ea8:b0:ad5:61fb:265 with SMTP id a640c23a62f3a-addf8f9b1bamr521392366b.47.1749112055146;
        Thu, 05 Jun 2025 01:27:35 -0700 (PDT)
Received: from localhost ([2001:9e8:d5bf:a700::f39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef58sm1224205366b.22.2025.06.05.01.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 10:27:34 +0200
Message-Id: <DAEGH4TAK1AF.W2VHFT6W9EB5@riscstar.com>
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Vincent Fazio"
 <vfazio@xes-inc.com>, "Kent Gibson" <warthog618@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Viresh Kumar" <viresh.kumar@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod v2 0/3] doc: add rust docs
X-Mailer: aerc 0.20.1
References: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
In-Reply-To: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>

On Thu Jun 5, 2025 at 10:13 AM CEST, Bartosz Golaszewski wrote:
> While full integration of Rust docs with sphinx is currently hard, if
> not impossible, we can still follow the pattern we used for GLib
> bindings and generate the docs using cargo, then linking to them from
> the sphinx page.
>
> While at it: fix some minor issues in conf.py.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Pass --package=3Dlibgpiod to cargo doc to limit the scope of the docs t=
o
>   the user-facing API of libgpiod rust bindings
> - Drop LD_LIBRARY_PATH and SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE variables
>   from the environment of cargo doc as they're not needed at build-time
> - Link to v1: https://lore.kernel.org/r/20250604-rust-docs-v1-0-8ff23924a=
917@linaro.org
>
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
> ---
> base-commit: 088c66ef20662b76eebf03e71f11196a5ae14b33
> change-id: 20250604-rust-docs-502d6caf207b
>
> Best regards,
> --=20
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

My config on new setup is still all messed up. This time to the right
set of To: and with the right mail...:

Reviewed-by: Erik Schilling <erik@riscstar.com>

