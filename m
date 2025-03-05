Return-Path: <linux-gpio+bounces-17090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F0A4F82D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7337188BDBE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBFC1F5424;
	Wed,  5 Mar 2025 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qm/YEr6p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A111F4172
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160667; cv=none; b=W4Qaf2LumPtKXa/qn4u5BuyltkLo9219Ut0IrMrERrV00PnKi8lT9AackUXu864/BwyVoCuC0BBkzi5xqAOn4YBrzRs7x9zemvUef60zu8a2NwRz8AryytoV2Xny1Nb6c4tYbUa2l7fDcj/4WTxeH3kIGiheGm3pz8UdQOQFDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160667; c=relaxed/simple;
	bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONBrPP+lLVG22v9xHuy4dM65BF91DfhwdL0G931WqMZVukhkR8U0AHIGbkpkDiimxxB3M7ZCoNEtUMUkNaikE27J2kPztyas4y0ciP3A/9Ex8EXjmzye/bSU+BDzzZjZv29q72rAtFavTSXtLF9LisXJL6gM3YwkACFwtD5DgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qm/YEr6p; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5496078888eso3446300e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160664; x=1741765464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
        b=Qm/YEr6pMmGvma0NYVZVWOzQVDBkY8ifEK0jHyUlPji7CCEMe8UZgU1QKC3Nk/gOl/
         Z5Efplxg9rS7zdUTuWeEpiWODOXCYJ8XB9hz0XoHx7UJuuJ3vt4Uf89RJIsACVbCDesK
         njeMB8JtUGC16bBXvi35/Gc5cQRGEq3OaZpp0qdSh8tw5a8sg4dEM5D3EAdz4YPlLbLK
         vLSjv5VpBFyIgZfLQT2AQNpeZWy6f8f1Nps94nlpUqclvx1lWtqAt+Wlnfngx140dcNK
         XvFmPcJKzrMftLflgHldUmoIo/VEi7l2XNqqjbCR01DTNZ28NfViOD0e8oKM3jX/YSx9
         0U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160664; x=1741765464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
        b=IOTKkaj/c4it339EGDOzeP8ZfUQxYzddkka7WXQ2HFbQGeEhN1BppEtY14Q3t6ICDH
         0/lIQrShkE8gDB6D8vHKORmHV7c068vwHGIFIO0/oW/X1rRDzERUuMy9yWwhzRYp0Iqp
         dEzkTzQ6g9gBwWR1y88xOZDFOHOlxgkPN41Fz8KQvL9rYgsqociNitebNNaEEFheMemL
         HqO53tkf5098AQD/kgeowdoTL4hHx+LFX9hI7rEicZcvJx8mW4zIN23XfWC0cidqvi0E
         bAbRSvskJq31K8E2IXpbDZlr48MuXN3L4Lwc9bLcQBZa6Yg1nzP+6dMVlAK59k2NVoyb
         PcVA==
X-Forwarded-Encrypted: i=1; AJvYcCW6PY38Mn8efhLJCbwqPgcvj0V/7EkVeSoXQO7V+JWFiF5+M3s7lTdFoWGU/kJqXtuNc+0ew7gfT8XR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1NJIXOaSlyujyI9OFR+a6LRoG9zKdB7I7OhISwu4KWGzLdi0
	GSn3VGXJ92hj7wCQOLiQVlgGj8Z+zKJPc6q1kGXlSBlkNO8kcwT8dqhAJQCkFR6cM4EzqfcppK2
	B3zmSqBfTWmyETr3u/5CKblu93u7ULotVxg0rGQ==
X-Gm-Gg: ASbGnctFvmFnHOtFKg9oVJUd7Epqe4hyS1QPJJxtvra/ZCSjdx9uoZ4bjAv00qNlIJe
	uP/ysCgX3SMHsH5lzTDdwLZ9urkYspiwpDHCbqF3kUoZhFj9sh/fuXoUdNfVfSHW2+Ze6fX2kos
	451uEgOBgkjIv7fBsIMslPUGlSAw==
X-Google-Smtp-Source: AGHT+IH72H1//brTKp7UPeHSY9eMogpG7qFDF82B9TGbZP/N55c5XfFJ3ZljeOaJZN/Ekrf02VMjpTK3YP2YKnwg58U=
X-Received: by 2002:a05:6512:2308:b0:545:bf4:4bd4 with SMTP id
 2adb3069b0e04-5497d332250mr683605e87.7.1741160663833; Tue, 04 Mar 2025
 23:44:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 08:44:12 +0100
X-Gm-Features: AQ5f1Jr31kdFtNesf13pMh4snaXBkelieuVeF0YyE3rSN-OSc3IL0WrT8xClu-o
Message-ID: <CACRpkda_QjBpfyA1ig2cC+pn8Xf0Rk8Ox+pecQkbcbYY+8N7Cw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: samsung: GPIO descriptor conversion
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 8:39=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> This drops unused includes and converts one Samsung
> codec to use GPIO descriptors.

Oh I see it was already applied (I don't read my mail fast enough
in the mornings), no worries I can send an incremental
fix instead.

Yours,
Linus Walleij

