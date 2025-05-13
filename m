Return-Path: <linux-gpio+bounces-20062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7D8AB5606
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F97189FB9F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C6928EA67;
	Tue, 13 May 2025 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5l6CBH7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA431EB5F0
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142886; cv=none; b=edDiSnhXapdg5Av2OPGKN2Kv5jndZQP+j3xWFw1X40oQPF3iIFMbhOYySy6sNP7IMiaYItVGbog3H82jgYTl5PDHOaupr1qi64ceXcHFcJja36wf5PUHu3C9z+yhfsBZxOt5ukBwIGonuKKmRRdVWTitIccwFiGrXj4vsNXAjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142886; c=relaxed/simple;
	bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofRNc7ClBiAZvtt6OrdtGduwQUZsar7eIUdGzH895aS85IYBL8vAy9yEMee+8UQx/uiyBhK50oXhQMRHFZO2hs1Ga+vKV8EOeIkm/TS1xorRhgYoidAZ03oolnTnkszudInU3u2gS7tAs5hcYuCzoWUZrHRCon3H4JsFp3xXz9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5l6CBH7; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e78e53cc349so5115335276.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142883; x=1747747683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
        b=f5l6CBH7VO5T6SUFiRN1N7dgor6Hr14LOSpvh2EkLMkAzCYSS+8atxDCG9KGHwRUyl
         4z7GW4ctxSPrAUv/Kfl4bVVZoNXmZMc7ueuyUC5gZ+32OKWnA28i0F+EWaUDnXiZsvXP
         4wfY0rsmJsvgHQQp0J5UiBrspjXVF7NwD+Gbv6QqsV7sJ3KXTACeNfbIYfmBGOubumhe
         QiGk0mZvUoGG/Anov3ZqKH9eSQn35jxz8dQi4KcbVtg0f697nUHsUewc6gQTJO9seONr
         spQAzY9m3LcVtafjL6KZHfKK4gTfh0+KGx0zeCk2agoLGxSh+5PebNnfuPuLbsLQv56L
         THgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142883; x=1747747683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
        b=wlPcfQMIqEIB/j8jVzz1s+ukkYRUZme2udoSkvD2tiqmEq2Nc9DWAwyyNYT6hw4mVs
         Jr27Rrd0mqILifa2nmx/tXBnuywah63f2RNKjqlgyV1JIZLumLZaTPPY6LA/cDhdh4Gq
         JCaY7LjKJ5ebIKyWVcST5HZm7x8dKoYhm6kCtq/1Jh2n9heZDzElXXL6+Wg3wK8CEcE/
         29BrOXbfQD/h0HRnfqyz1HIVw4dF0ujXCEhOqgZwjo7hU+iqiiR7cyPPf9W11m23e0S2
         mo70hwjp/+YwSjJNN96TkHtMhENcx8yxFez//aYHpjHbBl7uveliNcW4J3/poLc9b0zk
         PhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0vGxyJPVyYuC4V7g/im7scFjaU2tC8sgA+mj28hNK+iFDy/07jGn41n5g6L9WDseH606xVnoOd4Qd@vger.kernel.org
X-Gm-Message-State: AOJu0YxckIECeR60Tb12Na9+DWXyG6snNo+/XwTyQo3gDrEypZnz9MrU
	9dZCH8PstXnLW20QgifZFQp9KtwK7Pr50rKyJxnx4XYUs3kff9pOVKhc1N1spjT+gKvgZRZCzqe
	AphKY4tkCjDFUU0zmQIuBtVi0sTVyrT8m8BAvh6GAPeDS8wo4
X-Gm-Gg: ASbGncsZy7BZ8gtfW6doHm+DdqV78E9HLjca1/vw6paBwO9ikcT7pRpEqo28QIG6pJA
	jmf4ilvkS4YSralq0yDGMIjF0kxToFYPE83WHgvZagO453mrMWAhhydh62cvKANG8akFsZzk8vD
	ztqgrr5qVeTUMTdIaaDIPgQlawS3LaoBaO
X-Google-Smtp-Source: AGHT+IGwA9BFxyqwYNEBt7U5MGtywFT6puWcYgnlhrrQ514BRD+zuSEIuyxmPn0OaxGK/ficXJk/LrcOoaZiYWm0Zsg=
X-Received: by 2002:a05:6902:1893:b0:e78:f395:7d01 with SMTP id
 3f1490d57ef6-e78fdcd1532mr23000451276.28.1747142883341; Tue, 13 May 2025
 06:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:27:47 +0200
X-Gm-Features: AX0GCFtjRegm5A3xop934setnF5I9P9pPbOKoUABWT9UO5DUuWgk9ya_2vMnsdg
Message-ID: <CACRpkda+ouxrpUSbhk0OD5CRjorbQqg_1aGx0WgYw0X78eUutg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 10:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> at91_gpio_probe() doesn't check that given OF alias is not available or
> something went wrong when trying to get it. This might have consequences
> when accessing gpio_chips array with that value as an index. Note, that
> BUG() can be compiled out and hence won't actually perform the required
> checks.
>
> Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied and hey, b4 just picked up all the extra tags for me!
Love this tool.

Yours,
Linus Walleij

