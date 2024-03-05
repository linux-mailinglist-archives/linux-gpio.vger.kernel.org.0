Return-Path: <linux-gpio+bounces-4128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C3871787
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48547B21C12
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 08:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59E17EEE5;
	Tue,  5 Mar 2024 08:00:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2F7E112
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709625625; cv=none; b=aQhMNJw2AbHQJhKw6avjm2p4tyCT1s0ReEPVLenjKEvnunrK1kmkfpLn9JPxciPEVxLfQ+YXFwdS4bjKmUgGsoB5ltoRK1n+sbdyLgptVP5qhScejQFrQwSQz9PCwJBccqwp1dbIULIIa7cAPhflDuIcDWkjQaletaiJgFdYOzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709625625; c=relaxed/simple;
	bh=/0K1CY3lb7sbujb1GZ2TdfSMVmOefFEbKgjzHn7vdyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlSvrItrELkmwqNwGL4MaiHciFNZpU8CRT2ZYYwoFTaddUvZ3ly4e9YYnfHQYg6NBMkhQEpV40/BiphJ1QPVp4IWEztbr6I4K13NpRCiiz9Coqxjo/FKCkc0XHjs6GixYqW1p0Ysr2WGmJ1KKb8A4ZUAqde0B1Iy4uR7uMUl/z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-608959cfcbfso4387307b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 00:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709625622; x=1710230422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNTlxi57IWgeqCwe22WKlXo2YU5Nri7Z6P7ti39+O58=;
        b=WmSJJM4BVZfO82LuJRCynJCedpmLZFUxcVDXvw53bwKXxftdXUAVSf5M+RlfxRcmo/
         S6shrP0V0NfEyol+qrtMpJR38WY8qIA6CxX4FgcUMG2+GJDGV0iMpfBPaGc2VNggC1ZZ
         Et9kA1di53vpoOPRsrVGui+mkr6Ec8Em/5vhqInLM+RWf1R7BRZmXIEnNy9+25jhAxvn
         C0c+7GyhqFWoeaaFJAutFrrlHS8vZL7jZ/LuC9+cJHKs/+XIfiExteU01nzYC/8owbbx
         P6vj2NtKekSNv1dzyQfXE4eliLbVtyEFHd6lWjhLnRFZ3E+SCIdxAVoFt1t46mXb4aHs
         7jdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlOcA221zhUmxZKI60276j4OomZK5CoNWUGbve29vA7zyUD8Gab9tJyM7sp7v+psF1b05bLamrNZrSKsa3nG6yv1gCO9mbLrVfVg==
X-Gm-Message-State: AOJu0Yxinum3zwWY3lBxTm1I7hETV0oEnvuQYoSn+9pRkX8gtmpslnDd
	SzXa4A7airMgV3mXTjd8oIvxPBJCi/GRORtnrISN3YDGQlAHlgHoB9wuAC2nrh8=
X-Google-Smtp-Source: AGHT+IF8xk1Icu1THRVDm3teMsQmZkaAHawT1MSqkYVV7ZCN683beOLxzpVuY4JUjA0D3L14hNxqXw==
X-Received: by 2002:a81:6d03:0:b0:609:acc8:faaf with SMTP id i3-20020a816d03000000b00609acc8faafmr5302993ywc.27.1709625621780;
        Tue, 05 Mar 2024 00:00:21 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id n203-20020a8172d4000000b00607fc6858c3sm3079097ywc.82.2024.03.05.00.00.21
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 00:00:21 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dd045349d42so388080276.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 00:00:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzyXD4V3Bs8kfna+payd0QRFUKgrJLRL8nbvZ5zkQT17pADbQv9WpoABZ5MjBB3F/qxhqoyy3ZktOq6O7LmxxRHA1uM+boyw2EYQ==
X-Received: by 2002:a05:6902:1890:b0:dcd:49d0:eece with SMTP id
 cj16-20020a056902189000b00dcd49d0eecemr11070818ybb.60.1709625621099; Tue, 05
 Mar 2024 00:00:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-awinic-aw9523-v8-1-7ec572f5dfb4@linaro.org>
In-Reply-To: <20240301-awinic-aw9523-v8-1-7ec572f5dfb4@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 09:00:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3yUAxMgN-xo5BU2O8x0sn92myz6ZH68DB6JnMfgh7rg@mail.gmail.com>
Message-ID: <CAMuHMdU3yUAxMgN-xo5BU2O8x0sn92myz6ZH68DB6JnMfgh7rg@mail.gmail.com>
Subject: Re: [PATCH v8] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Bauer <mail@david-bauer.net>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Mar 1, 2024 at 2:30=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.or=
g>
>
> The Awinic AW9523(B) is a multi-function I2C gpio expander in a
> TQFN-24L package, featuring PWM (max 37mA per pin, or total max
> power 3.2Watts) for LED driving capability.
>
> It has two ports with 8 pins per port (for a total of 16 pins),
> configurable as either PWM with 1/256 stepping or GPIO input/output,
> 1.8V logic input; each GPIO can be configured as input or output
> independently from each other.
>
> This IC also has an internal interrupt controller, which is capable
> of generating an interrupt for each GPIO, depending on the
> configuration, and will raise an interrupt on the INTN pin to
> advertise this to an external interrupt controller.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Reported-by: kernel test robot <lkp@intel.com>

This "Reported-by" should not be here, especially since the issue
reported[1] was not fixed, and is now in next[2].

[1] https://lore.kernel.org/all/202106251415.3UY7htNp-lkp@intel.com/
[2] http://kisskb.ellerman.id.au/kisskb/buildresult/15135594/

> Link: https://lore.kernel.org/r/20210624214458.68716-2-mail@david-bauer.n=
et
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

