Return-Path: <linux-gpio+bounces-465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49207F7021
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 805BA281C65
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 09:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E501B154A8;
	Fri, 24 Nov 2023 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEVLiLTr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65191D53
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:39:57 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5c85e8fdd2dso15772577b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700818796; x=1701423596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8H5wgkG7B5BzheZ4ZvCgLtyGDS/xoXFDJfUCvqhL0U=;
        b=uEVLiLTrQQm2ABtQxxbZHX/oaIT1H7v3NBxWp8DymXauXBftnscQqfVGXQxhSomCWB
         E/5cYEiAwxnwL+vY1ECJNOQTTcE8mb8kDH5+2RuJCrqRybpRq3nqk5R8sInwpxrNNqtL
         S9/M/Arl2O2Jr6tz4AQdFzDw8PfSuuY19P2vTUVDVppqR9urVWjiWX8xHdTy626293aj
         Au0CuTiVFtbZVAmmREm9hOTbojET/Ficmor/dfsPfNblSHQqjfKojjJzTWU17XlESjo2
         R2CEGReh44zKpzUkiXYdHzL8it5jGL2JE7Nocr5VsFcwjYoe8vIgB/eBZnL7NgXQeF80
         KbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818796; x=1701423596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8H5wgkG7B5BzheZ4ZvCgLtyGDS/xoXFDJfUCvqhL0U=;
        b=flgYqTV63vavkr/CN85O0kFBtsE9TPftvmCzzxrOMQ9bJZThIC2Fu9i1lvLqqi+3JD
         85jtK9rFVfXUlMv5qLL2uFCHBA5UHCZzwBC69k6rVZXybWuyPg0lZqFjrIbiFYSBmAdk
         b10n4T9s4p5uR3aHi1sQ1+OfQoB5l+C0lyh6N6S4JUTpM1wvCGNovEGyzKsbiPuH2y28
         iXGRaGqSyaWTUqDmLuQN2p/o1HIhtLRVRA/cp7XHgrta6y/bVIqTcRlOEQDBeaV7RP8r
         TjsqB+g3hYVkYAr1mbb0zr2wCvzWE7YRiE53HE3d6J/O5m2zyYHurZ7hxXBh6X7cfogj
         3PUw==
X-Gm-Message-State: AOJu0Ywv31JyACBJRQxQ0YF+IEmwPKNF+GOf2Xri+lItEo44RO+XaRy3
	5pCxrhX8UCZUjT7fwdqF2FRxdSSwZXsDlRAO5pkrgA==
X-Google-Smtp-Source: AGHT+IEs8cx8lksji9t2UQyL1PgEJlFxBFm7HDAYWPcKRjlRLhlZ6tpGb/ezhVwDiSZJ2LIESImZUSsgaTgbJZDjhtI=
X-Received: by 2002:a05:690c:2c0b:b0:5c6:4de5:168f with SMTP id
 eo11-20020a05690c2c0b00b005c64de5168fmr1651678ywb.10.1700818796617; Fri, 24
 Nov 2023 01:39:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121091107.5564-1-tychang@realtek.com>
In-Reply-To: <20231121091107.5564-1-tychang@realtek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:39:45 +0100
Message-ID: <CACRpkdZpie+ccu0AoTOVvV0fA5C2u3hdorFVjbKEPT16RyifXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: realtek: Fix logical error when finding descriptor
To: Tzuyi Chang <tychang@realtek.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 10:11=E2=80=AFAM Tzuyi Chang <tychang@realtek.com> =
wrote:

> The pin descriptor should be returned if the name has been found in the
> descriptor table. Remove the negation in the if statement for accurate
> retrieval.
>
> Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Rea=
ltek DHC RTD SoCs")
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>

Patch applied for fixes!

Yours,
Linus Walleij

