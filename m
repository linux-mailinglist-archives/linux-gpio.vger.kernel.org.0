Return-Path: <linux-gpio+bounces-23172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA04B02357
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B25AA4059C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6D22F1FED;
	Fri, 11 Jul 2025 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BExMbpdx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F962EAB92
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257452; cv=none; b=eCFzrAJBVep9UXhde44nZx+4WTKoQcvvzVJtfgIGNcYMOWJmZ+BjITSTtb9EI3VDq2wMajRGUCxm1g8Sn5vrzAXh0SGrBEtxlMB6cPq+BfEyCOXcv6sHb5jl8/r7ePD2ARSCIDIedtih8mJ+m4vu4uHwbvbtznkdwNBxi73XICE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257452; c=relaxed/simple;
	bh=Y8lKCTsdmMcsbQ5KqJC2bzKvDDr0kMdS+WRZLZHAKrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJT8yA0hXal4uuDJzhDJmMYMmWGre/aFFpqcaw3LrErFkCSc8m3Xj10nCElCToE53wKVC5zRanG43v/e0K8ekiNPPSlwzLXLjb+6pU5sBi2pI8DNqcdMpfNgDsaDUzlU8/4ulPMFOk1dQaxmCKc2lzV1/qcps7f9PHJKPA925AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BExMbpdx; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so22035761fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257448; x=1752862248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8lKCTsdmMcsbQ5KqJC2bzKvDDr0kMdS+WRZLZHAKrE=;
        b=BExMbpdx9LJax9JZbb7A+FOPqVt7plgRTbftYBVx9C1tI0QCQ8w6gkrFqGGDp9Suee
         ac/KsUD+Q9bmoLJTk3DpF+94jEQWVKwwysnIZ2ZRIiD8GCdPaFQqVQuNXnaqeHzmIOwe
         CC1vDjMj7wuy3c3bhh+RGycbFIgnOnPgK/hAzCeEtnF5i9Ap5LdlgtY+ZMk1cDo77VzT
         tqb8Bu/6CE/S9DCN6Lo5RKNV0vRsQarqt1YiflY8mymELChIfMH/6YsdqouLSf5TEM+0
         SKCBKcTCyrcpD6BX7t7ELSyyJETDXRfL+miaoL73w2RwNWoupTdpCgn4mYP6i2Of5JaB
         o7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257448; x=1752862248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8lKCTsdmMcsbQ5KqJC2bzKvDDr0kMdS+WRZLZHAKrE=;
        b=GHzkkvXL2rI7OdOLl2CfWjIXio1oMndQDleYgCE8pTgfPiO7EwY9a/DDjr84RPNGBs
         MSdeAWMFVGB2NxJ2nzVYtP4gzVd2+tx16zvLFdlcAczVKtyKdtacJYB87p75t893GZyV
         IPSXqKHCZ3KSdNAwIvs0R4C+1csl8Ku0wxrusx9Ls2inUzDlwOenX8rF5xGJSyUtEixi
         Q9lz3Ou0xaW87jgrPta8QzNWtQpV2Bej7OcapAFMpYjBQAeegYX+A5wc5DFrXHm7iG2I
         rhiNCLKpm9wgL78gpLXR60od/NwqPMN5eIQo2DFRC/mL+byO3myGYHXRA+g9xFpkedPW
         OtEg==
X-Gm-Message-State: AOJu0Yynel5IApvrIJnAgAbEGCIyqm3W1pkh4ppWZcwE+PpVbb1umlYl
	t9d346+Cc8145XZsTYALU7GWgXh/fsdJAoSIzkRzhLWUJcOgoGtGFokTHN60o919ZZgmEPa7qII
	8/HT5m8PtMe6wdet9KBlXbcq27Z59cwKdf5QtL+YKlCccugbGOEOV
X-Gm-Gg: ASbGnctAmgNAggrKUjWj7vcssAu4D5YmAaIHEt5S7dUYKlGU64noCxmvMrTMDYG1ak5
	+lQ9OWOa+C1UNBh3XnEpwOjOpxy42m+t1xNHrtb4KMX2OaBPkm6ZcjEwd/WjVfueroXTf60xdFc
	n9/tYoh4MGpQKzWrjz2JkfuZqew9CRkeh7qZ9VkaUusAI4EFu0MpHMW+k6r4T/9aeNBkM+xES/h
	LURtX0=
X-Google-Smtp-Source: AGHT+IEVqrHZJLE1/F9OpcrUYWiIuDfn/vgx+mA/zV5YNTzBbNYfBxup4N2mlr5XNgR7YzYyLdLpTrBGk0Jqsdo+rQc=
X-Received: by 2002:a05:651c:b28:b0:32b:70c9:5d2c with SMTP id
 38308e7fff4ca-3305345d70dmr13793141fa.32.1752257448305; Fri, 11 Jul 2025
 11:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707141313.73169-1-brgl@bgdev.pl>
In-Reply-To: <20250707141313.73169-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:10:36 +0200
X-Gm-Features: Ac12FXxyutF9lvP8d8DmKuDDIfVDjdNrAQLUHXwpimZxgqoAbM3VY2wAwoPhpS4
Message-ID: <CACRpkdYQ8AhZOiBV0L66p2gh23GQHoK+y98nuXOjM9bf3xK6Tg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't use GPIO global numbers in debugfs output
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 4:13=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> One of the users of global GPIO numbers in the kernel are the debugfs
> callbacks in GPIO drivers. Before converting any custom .dbg_show()
> callbacks in individual modules, let's first make GPIO core stop using
> GPIO base in debugfs output. Use hardware offsets instead.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

