Return-Path: <linux-gpio+bounces-139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9C7EC0EC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 11:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933111F26654
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 10:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E447125D5;
	Wed, 15 Nov 2023 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qq+AUoDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4CD14F8B
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 10:46:49 +0000 (UTC)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2F110F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 02:46:48 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5af6c445e9eso77374457b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 02:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700045207; x=1700650007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROkFb04XM1IxjJN8kBBQDGZACqrnfUK4tYFptKzTTH4=;
        b=Qq+AUoDYOc0a0eZiNSOetS2+1E0nngzjuMOsneF5hIfylZiWdT9ZoP4aLDorF0DzHB
         t871xYM4WDv7BcCnOl/YDghEm9Jeo0nu8QB5bwwfjBvdL2uEQrs8E/WOTw1BYnUNm9dB
         2OpunecgX1tOn6KQ2KZ4POn2jk3yVP9+94Krp2CwjNEXwHHDKovgn3hWTstjuURXYmB0
         vu71QXY6q5RA1BGG0FfLUl3VIHV+DUKl4qii+Iyc0NLNpDDm8XXTebl8ejvdU/rgnZZF
         Y4bl7E22unXcwE68G2wRItJEa97GHfASywOCn1Px/AIXifq22TIC9FwSadMNhNb3Qwhw
         Eajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700045207; x=1700650007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROkFb04XM1IxjJN8kBBQDGZACqrnfUK4tYFptKzTTH4=;
        b=kDj6er8dwLby7+XJZ+tAu4ldCMKAXaBK7SUjvSkXZINDfXiMc4RBvnJ1u0WTUsoU4V
         z63fOFn4qrVNAB/L5fP1VQWGqBvJAtErCkUrsPXcZkSvaMIoERMamRxpTqp+juk4kEj+
         Hz1DJyOr8XpKc8rzg4vrRzknwciGp8tTFVGvm8dl/s8FU7cPb7mLmpfXDEh58JGq/N0P
         BxwkqCbq3WDViwFMW+r8AkarM5c5wCyTPH149h8xgsJGyG53wox5k0P1BIAbEkCPz80o
         wXTK1qd4NxellvRJokVgYGp+SzCLhhIR9nc6UHETEUqdCnVRQUzhM1BZWmSwV+JBQQCt
         zFvg==
X-Gm-Message-State: AOJu0YwjI7MmBdOzwSPHSMzyWCqkfzAw4+IiW9h5UGyqc8L2038HOoDU
	kieQ4sDP4C5GFeLUGm35nr1U6C1LDI+sSlOWgJbi1cKshMx+x+Ay
X-Google-Smtp-Source: AGHT+IEUbLlYafyuhZ0akVgaeOWZ9mraYETNvmBptaD8z/GiGg5l+TzCCQqzVTTRxBQyaw8F28Rsr3OoebuVLy7sAEI=
X-Received: by 2002:a25:6951:0:b0:da3:ab41:2fc8 with SMTP id
 e78-20020a256951000000b00da3ab412fc8mr11210436ybc.16.1700045207354; Wed, 15
 Nov 2023 02:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115102824.23727-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231115102824.23727-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Nov 2023 11:46:36 +0100
Message-ID: <CACRpkdaBWZyoshaOk-PPZ+gwnNj0o05RLyGNmpmhFez_s=A6Lw@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: avoid reload of p state in list iteration
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 11:28=E2=80=AFAM Maria Yu <quic_aiquny@quicinc.com>=
 wrote:

> When in the list_for_each_entry iteration, reload of p->state->settings
> with a local setting from old_state will makes the list iteration in a
> infinite loop.
> The typical issue happened, it will frequently have printk message like:
>   "not freeing pin xx (xxx) as part of deactivating group xxx - it is
> already used for some other setting".
> This is a compiler-dependent problem, one instance was got using Clang
> version 10.0 plus arm64 architecture with linux version 4.19.
>
> Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per=
 device")
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> Cc: stable@vger.kernel.org

Patch applied, I edited the commit message a bit.

Thanks a lot for finding this tricky bug!

Yours,
Linus Walleij

