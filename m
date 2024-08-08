Return-Path: <linux-gpio+bounces-8670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6C94BA7C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 12:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86BB4B210B1
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 10:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06F5189F33;
	Thu,  8 Aug 2024 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n4HxHa5y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3CE1482E9
	for <linux-gpio@vger.kernel.org>; Thu,  8 Aug 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111562; cv=none; b=N5qKlA355T4ydFsMhGcg8Y0++hzaqz2M5NIgO8bnekDA7hVKdSxz6EY/Py7j/qF4lIRiFm2VZBCg93+VguR3BIYFHYs35teCkSiGncb6WQFE99mQSZ+1mscREhdwIR3pyAF0LkakQAa9SYMh7SKrKFSZqTxUKaI768Ns+o1IK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111562; c=relaxed/simple;
	bh=6hv5xKMBa4EVOIETsZgjUJj1tDj/hE5EZ3N7WS+BMmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=giAAnYHc9VDobKWwDQjuiVtSWoNl0NnPYokx8ZAZBEY9ASajKTAT0fi4kU2ZaZopnP0BJmFjSyTVcdaK+l/tKIV122Vo6Xp5hTIZMbr0H4jth+hnZY7dVigAAnSTnG99fV7qgexItw95m2O4ys1ks/N4XA9Bn3YXH6Wckcn/Yl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n4HxHa5y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3687fd09251so400799f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2024 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723111558; x=1723716358; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPsQ8QVE2zEks663h1JC5K+bSl/B5g3BfpyLqR4k0g=;
        b=n4HxHa5yTpH9UzfsbLnDthna3m6hI9+Ph9C11hPNDhuFyxyvZWvcquKzyHlfgW+zCm
         rAM1IqSmCWhEpo7d4miB0Lz/P14bOUBykfZCtviX7G5WOp91C5cliuxD/vE2H8lWEYqa
         ELWGQlXHECzDSmzBsGXOlJa6L/5p0Umh7ilLKhbk5+D6OmyieophBIespy/24cRMawGR
         E5V8KopGRrH4aAinUudbK5pTvfi1XKH72VPkGSLvQjzk9mg1qeij79k5Tl2zf7DIXezD
         23IFklpluLBYy9ZVbPNK5Qqz3W8POP2kQ657Vb+WrHiageXZYF0OjeMa32u47Kf2eUWh
         3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111558; x=1723716358;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPsQ8QVE2zEks663h1JC5K+bSl/B5g3BfpyLqR4k0g=;
        b=ihMz2Z7E0xVMLHPPbe/O0dSCnw3kG9wXloVvD47BdyzhhK1lWKkv0rgmd423B+inSR
         KDRCH36odYN8wuX/kz4c/BulgVTbhLDHj8PPOeVcHPNggZyUFUG0lmUim05eeMPFhEpX
         AQgf/jBSNIiDe3aSlHFXmXbd9T+64BEm5mve1TxRCxrQuJGFhZzEmRGGvf0mGECQsVdY
         QIsGOl6Btq0siJU/rbDzJFqC+VWvzGn0CI/UHVauKlNIN7u6u5kVLsYD7HWgFmCaNKU8
         HnAaxo4OyaDEydxrcVaRSGbmNSAxhdqba6JMHeWWrWsrkhrprfbZQlX1vRMu2aiaHrbB
         P2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXZQEC7ZkB6D2/VuoZuMbhvej0y8lIxbP13uqYPJHcwPFqhY8t38KLzE4SN+DeisLgMjijEcoSqZ5aA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tNQNdqTtn0hyeaawN2VM9Jbxmbh0zj5gSfp56I6MXj9ocCe9
	0+2BIwRqHragh79k5NMXY6One3RCBc0wID4VtvNQLxjpZ0tUUuoVsNzyoScNt3c=
X-Google-Smtp-Source: AGHT+IHuYbrCTlKt5TCgiFSu5JCjZWHBFhE44QTQFbwLXgNURs2glTBXxCRbpAs970Ya85dt2iUAZw==
X-Received: by 2002:a05:6000:259:b0:368:4e98:6e9e with SMTP id ffacd0b85a97d-36d275900a9mr806392f8f.63.1723111558368;
        Thu, 08 Aug 2024 03:05:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27209a5esm1390336f8f.80.2024.08.08.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:05:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] pinctrl: meson: Constify some structures
In-Reply-To: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
	(Christophe JAILLET's message of "Wed, 7 Aug 2024 20:05:36 +0200")
References: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 08 Aug 2024 12:05:57 +0200
Message-ID: <1jplqjxray.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 07 Aug 2024 at 20:05, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The following structures are not modified in these drivers.
>   - struct meson_bank
>   - struct meson_pmx_bank
>   - struct meson_pmx_func
>   - struct meson_pmx_group
>   - struct meson_pinctrl_data
>   - struct meson_axg_pmx_data
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On the vim3l:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

