Return-Path: <linux-gpio+bounces-26803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B16BBD3C6
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 09:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C623B78EF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9174A2580F9;
	Mon,  6 Oct 2025 07:43:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E5F24A06D
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759736588; cv=none; b=M/5JeQn41/A4/j+z0EV51j2LyHlKs238GovouDRLBLgdh97TXG7KboJzoxSxGSB5ls/D1FxZ9OxUstYrf4Vlszzjy714zOMNqL82CXtvIBTzvMXvkRChGVbTLeuQeuv0mJZ8pIme9NpSsqQtR5TxuDY9gsPqmzg8B3JW+xxTKr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759736588; c=relaxed/simple;
	bh=pVKMTpF6+U+ZoP/Y81+0qoZ+8X6E/LpIbihs4F6b4IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fm/o0hnbQIxWKEgBpEOFTCXGzfJUOcyd0207FfMdgkKk6A7221/Jd5gZgsg6aW+FvQ1yK+SfAxjT21SnbxSwq8/QR8YdOsSivw1Py0r1ahjnD1zC/ksF12p48IyPbbK1D6ZMptWsKshMdkZM/T3xTXmfznLiApxsupx6veEQXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso3522473e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 00:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759736585; x=1760341385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJD5WTfC4zHtLBL0+xlBq7/WOc1dhepTNHh9UIDDvZM=;
        b=F94gCdGqudHEXZcqnnpoFYxqYU5UqSE4rWo9lZSwWsDQCxB1bg5Kd5Y0llbEQC8GNp
         y9Wju4tKd+q0m6D8hVDfWYKgBiZ7UbPQDC1k/4+Jv9sf5gXKvyHMYrnjfe1zMTcUNHGC
         CgmznIDKVi7QJcUw+dzW26Xmc8HuZbRql/0ZmBNkg78yNTtcbwPE8199sAc+W2b4vIGv
         oTwlOZdsWTuEBXuBwZcxXLoqLM2uYkK5Q63MLKPF87WFM2rEAa31QkDx7bh7z95uU9Yt
         f1ONmxx2Z1TWFFWL/d/bg7F10eGnooCE7TOwp+ipG+GUOfIArFrId3HRNqEzuJX5J3A6
         iy2g==
X-Forwarded-Encrypted: i=1; AJvYcCWaXQXe1tu0FU8tzIaTUA0rB+vqPZBbwP56a7fwhqp49zEag9uOFTSjke5vhOgB51aFj+yqOFjQCrHN@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3YTGabUeBrRd7Ba35OvEvQIibVwz9KGCgQuhc3EIkBZBSmp5
	U5CtXQhtLAQ16XriiL6KC23+zOnhYclbSL9vg1f1vneZBcMqYMCyq3D7pr8Q156V
X-Gm-Gg: ASbGncsmCx4KFGCvmQDpUeS/9bx9x8GcI+zO3ArERvfy+BKyMfMy9N/RrGET1kFU4t9
	S9VVRYbjjEMim5xNKZnCc8Vi6c5a8xT3Vnne3BArEJCLl3EIO8M8crd9JVJmFVthF6wV9ibgijT
	I4jAL0j/NFWJQnUZ713jMb0Rwf2RIvjPX7SzcaaF9IerOE5PTJ+lI8TgFECFZx/y+tprV4qLg18
	sYL4EGeBmoSYfcTM0izom0TroN6lU5P/3qAZ86/xpJTobKvi78t7MWwKAX9Do0+Tuf7xGlEZhj/
	Pfx9HIkSeIOqHA9S5+9ATY75b5lp2pYrOyfgp5ONc+xZFpxVUsMxQKUY5JMB0AOsFxxC2PbohLG
	oXA1qtsPBa3jTlqoQ/h1khHSP8TaTSSJIbdDarVWF70PCQjarCBsto4dWbTx4GAcjeOOF8QJA22
	hWO8nYuaF1
X-Google-Smtp-Source: AGHT+IGI+CD9Qdxi0y1CE1KjyBzsIAXKvvj0l+EgIJeddDQJLOLF7u+OnK8whdYGuun7oMS47OrlPQ==
X-Received: by 2002:a05:6122:8c5:b0:54a:c54a:6d96 with SMTP id 71dfb90a1353d-5524e896f73mr4707845e0c.4.1759736585107;
        Mon, 06 Oct 2025 00:43:05 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55497ee3001sm571478e0c.6.2025.10.06.00.43.04
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 00:43:04 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d42137abc2so2592785137.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 00:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFHpE2w+DQ7ReaHT55mqdtioCaCOq3WCH9kc/Rwg9o9sqttH6pdLvuYxptqCyNzwedImVQzSIM69Rh@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:53a:fb09:5eb1 with SMTP id
 ada2fe7eead31-5d41cfddfe2mr4109690137.13.1759736583985; Mon, 06 Oct 2025
 00:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
 <CAMuHMdX5HXx2HSAHP-H1EEKO-csBku_cMm-OaacE7GZLXwBxOg@mail.gmail.com>
 <4db46e2b-47c4-4c81-a36f-8b195b090d2f@bootlin.com> <7a35f0b5-5cb3-4ab1-81b5-394d2b794f77@bootlin.com>
In-Reply-To: <7a35f0b5-5cb3-4ab1-81b5-394d2b794f77@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 09:42:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_3Wfzq_qc9odGYtSAsMMOgww90qyH+GN4eQ7cxJMG+g@mail.gmail.com>
X-Gm-Features: AS18NWCUwanWut82t7whepCrvS8LVETXS3TYLFcSdnH-4b6DqTdpBWXabuN-KkM
Message-ID: <CAMuHMdU_3Wfzq_qc9odGYtSAsMMOgww90qyH+GN4eQ7cxJMG+g@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 3 Oct 2025 at 16:30, Thomas Richard <thomas.richard@bootlin.com> wrote:
> On 10/3/25 3:59 PM, Thomas Richard wrote:
> >> Is there any specific reason why you are doing this unconditionally,
> >> instead of only when any of its parents support .set_config(), like
> >> was done before?
> >>
> > My idea was: it will be handled by the core, so the if statement is not
> > needed. But if we conditionally add the operation we can save some time
> > in case there is no chip supporting set_config().
>
> I just remembered the true reason why I'm doing this unconditionally.
>
> The user of the forwarder can override GPIO operations like I do in the
> pinctrl-upboard driver [1].
> And now we can add/remove GPIO desc at runtime, if set_config() is set
> conditionally in gpiochip_fwd_desc_add() it will override the custom
> set_config() operation.
> So the only solution is to set the set_config() operation
> unconditionally in devm_gpiochip_fwd_alloc().

OK, that makes sense, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I do find this overriding a bit fragile.
And in theory, such a driver could override chip->can_sleep to false,
which might be overwritten again by gpiochip_fwd_desc_add()...

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-upboard.c#n1044

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

