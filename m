Return-Path: <linux-gpio+bounces-27143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84219BDCBC5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 08:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4FE5192129A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 06:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1DE3126BE;
	Wed, 15 Oct 2025 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAANDeCJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153F311C3C
	for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760509829; cv=none; b=NZHLtcaeynvoyGYwmgKSK+Gsf70tOAFuHW1c+WfV7+vngGLJHRYKJf1G79SndQmdzrtzseaR+QVe64hnf5oIpTRMyFfQTFEhzdPmq1ubrh2ObL0JieNlBKO7PmlRNwGDPCgOOgCGm2DJZCQeObwkT9ZpXJFhwCJe/METBmvt9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760509829; c=relaxed/simple;
	bh=U+QJpInAQJD/UO7rXl6XPQY0ZAlove8LjuD2791XvXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/V0VghDs47aOopSlYYeEKJ7SYBc9LMPSA4CJhSrUQmCYHlmMkSK41JEt15dJR0lRf/aIQP5KuYhVBj8yWn2c1dQSuNEImCY9NVYyOCXUwfWneubAWFbRTRQn7h6z68Uuy/xjOMLHHWpm/3OBZDYdpAXwyq/+W6PiTWVYEdBq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAANDeCJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3737d09d123so47677241fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760509825; x=1761114625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+QJpInAQJD/UO7rXl6XPQY0ZAlove8LjuD2791XvXw=;
        b=nAANDeCJQmapJM4yQy1/KPiB3mk3XqoNeCV8WlFFqb6MowF4ixgB/z5JXPfpNsooke
         XnL+g6aBlj3aixjQga6x7w7287CwMjp6jffyK3MXTAMrnlMgS9cR1rwQT0vHWdqdCmNo
         4DrNor8mkAIq5MJ2X5gjKj6tMcWta9qrDJAZnBAnZn6dO+JVEQOWUocalA5usOVnsPF9
         B7kElg4sZriJ7AitutCLZfxA+UKMGK/5C90hGCKhb5ePSpp9FC680yixxCEV5kjgQEQ0
         2ycg9egUPeMHz+8gln/LpOdd3WexEsz8JDltWl+vif8ESv1D2HEKXkQd+cXrh+PteE3A
         l2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760509825; x=1761114625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+QJpInAQJD/UO7rXl6XPQY0ZAlove8LjuD2791XvXw=;
        b=enRt6j8rAUnVNHRg6kf3Xj83h5vms8loFxum8OG8WxXEEumPaW2BfPQYNVHfbVdNzb
         GQvE7UVsHvKiN/SQx0lbyzA+X01bAUfmNGQ7jRzgmMWeJTXW47/0i3l9CZhepeAQ24KF
         KnJcYahd8E7kCCCywe1L5OPtVG7gzcDOuD2LLGfvR00DsMVnqD593vaHLfnyiZ7AgVqI
         fuufnnpDOCTMvF+h+V8mqkp2lWeYiAoUj0zD5ELqpYqiigNUc9BBQ02OyC1Hv3G1s9A3
         3Kcwzp+JZsU7EF95uBrs8CJEKxoCd8TMLNB80EDGBI8lOT+cEIEso0lJwnneAp8x1cq7
         OmOw==
X-Forwarded-Encrypted: i=1; AJvYcCWUOFciB+Hs1XjOskmANsrlcyrO4Z3IuA/bD2gXWrLPtLwyilwBvBr2K65E/Za9r7B/MjTu0veg/qWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMcFaJaWlDbjp92YfaawVfOciCWkEnOl4o4MKbC7atGIBzdl7
	KycIOhaf8xHinBnJmT75AgPInhfExRNLx7NVPdT5mjxojnVJsvFeHkTgQOlGln+gTPIcHEf9N0v
	vjo468o/7BJjqDpeoCCVU9/vGeiyUUjgyEGfjySWDMw==
X-Gm-Gg: ASbGncvUSdcOU1K4MHjP5nFhTOVKAb+KBTTNu49FY4HbLTztlmks/Zik2T5SyhnLQwB
	Bfb+E0pQpHqr8AI+/jWtIQOyg/V04sayqVxHGA+86c5s74Y8/BGLUJw38XgQTnccuzhFS+eiGo4
	OAutt6uF0oIVKnrK1t0CMrpe5wqB9Dyj1vUkkUKMjSpKtzDGm4F9VVgFV3LwoyzZWKCrUfk7fT2
	yJctDhLsgESuR6p3o40lK1TPYBh56y5QKOy+XL3rZjvuhR8kGg=
X-Google-Smtp-Source: AGHT+IGUsgryfaHD0rnj3LtJX0svvEnMtTCvHCuJxwMxVB7v78te9kwRaSVyuTsq1gSb0ZAbdHX3z/ggHAOfux8GoC4=
X-Received: by 2002:a2e:b88e:0:b0:36d:a459:f0c6 with SMTP id
 38308e7fff4ca-37609cf2a61mr74137741fa.12.1760509824851; Tue, 14 Oct 2025
 23:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015060714.67558-1-michael@allwinnertech.com>
In-Reply-To: <20251015060714.67558-1-michael@allwinnertech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Oct 2025 08:30:13 +0200
X-Gm-Features: AS18NWAUhU_Vsd9dzfVXxTibpqYvM8QTjr1kGOPoZF-KY0GMkTVsXhlFFcZV4bU
Message-ID: <CACRpkdbQH2+AoCVAZf_apQ=uhkbinkHtk60ssB0ODpBZY-gATw@mail.gmail.com>
Subject: Re: [RESEND] mmc: core: Fix system shutdown hang in mmc_bus_shutdown
To: Michael Wu <michael@allwinnertech.com>
Cc: ulf.hansson@linaro.org, brgl@bgdev.pl, adrian.hunter@intel.com, 
	avri.altman@wdc.com, wsa+renesas@sang-engineering.com, 
	victor.shih@genesyslogic.com.tw, andy-ld.lu@mediatek.com, 
	jason.lai@genesyslogic.com.tw, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

thanks for your patch!

On Wed, Oct 15, 2025 at 8:07=E2=80=AFAM Michael Wu <michael@allwinnertech.c=
om> wrote:

> During system shutdown, mmc_bus_shutdown() calls __mmc_stop_host() which
> uses cancel_delayed_work_sync(). This can block indefinitely if the work
> queue is stuck, causing the system to hang during shutdown.
>
> This patch introduces a new function __mmc_stop_host_no_sync() that skips
> the synchronous work cancellation, preventing potential shutdown hangs.
> The function is used in mmc_bus_shutdown() where blocking is not
> acceptable during system shutdown.
>
> Changes:
> - Add __mmc_stop_host_no_sync() function that avoids cancel_delayed_work_=
sync()

Why is this function prefixed with __two underscores? The
__mmc_stop_host is named like that because there is another
function with the same name, but here is no mmc_stop_host_no_sync()
so just name it without underscores.

Yours,
Linus Walleij

