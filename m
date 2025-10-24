Return-Path: <linux-gpio+bounces-27581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D08C0540C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 11:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91AD5427ED7
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D312749F1;
	Fri, 24 Oct 2025 09:00:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C3023B616
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296441; cv=none; b=P9Npu78KzXCLe9Et7VSKI6ICsN4lECqWyjRVU6eGzCJ+slBjtP4bI771TQ21gsCn90tHFJbTSNRzDS/4jBADd2JADScF3ckwotmA+C6lU9TTJsoNsKyg6GTrL9rvQECLnoDN3MmWppqW4Wf2esLlD/sq4mCSwru6tnYQ3zd/LXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296441; c=relaxed/simple;
	bh=VTwfEDA9O/4R6v1xPBzrfJocZUu/+v/Lfn5nRGgSQOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8nJGQhh0pVMrAD8/kXQvn1AOmPTf3UZblUTNuav/z6Z/2XW/dERmdauXHuhKsLJh3ui+wlz05KmLL3HOza7UP4lwBSVi8+P+8d1CeQ39+68D7eVKlsSHHStv5Gnzo4GvPXIQN3IRmRucga4b+zSqAlNBk38pWHqKfod3/Frhq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5d5f8e95d5eso1143547137.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 02:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296439; x=1761901239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3v1IEsc7lG0F5yaUsZFsiMjA7EGPtVnzD5XrOqlrERI=;
        b=Swd+v111bd+QoJIITausBKvpYwYRuzucOIvN+lu5ToKhttbcvi6AjPqBUdjjh/Tn4N
         XTSS6sLXASEq+8XUHuHDNil0otOmokRfwFeMzTtbuH8hqzD5d93fo2eoK44EzTb0G13q
         yDfaE6qj026+GG+sXFgItQgqBkMHLU9raOmaJIwCii1MHafUwSrwxyIaiofUW7iZLsGY
         cr4WnQy8m6VWgY5p8AazOlHUyT97jernAb8TV6NbyUkcg7yzV/ifCBjOoMrP41c9UVHR
         OudqJcyBolKPOXjLZm3XEqO8bSO4AFiGRIVVdLTgxlzxKcXze/eaZ4Qyt47/oEjHKn7F
         sqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQFOBXOZNlduXY7n0HmHzw7ybCP0nVW6XVhI1kB53cfPekRgQ9EIHvzYu/C7V1bSi2QzCcZZ2BDXqm@vger.kernel.org
X-Gm-Message-State: AOJu0YwFI5mC7M4KdISwFJ0ZnnqqwoHihT0jJWhz3ZYN+0eWaT8NJRNa
	GvL6tX34WpqfBJp+XeF/e5yJ/rrZC8khGE2U9gXIOOrb7IZvufQXfATdnbOqhThr
X-Gm-Gg: ASbGncvFNq762KxP4fsDtj+jiBSAQ1owhU3t8AHmTYAw4MJJuEzNNDzubc2PxGi++x0
	YO9EG6aM7K3fNbPTYuHvx8XUb2wxMra4ii83YHS27p+A/ZlsIjRSzJAP0MxFfEus1rl2jgRgKar
	PqfD0TqaYcZiMVxW2k2m1IO+DAl4ty8bL5cN44WeO64v5YVKboARrbmvUG4fG+SjjJCPu4m5/iZ
	hHJX19L53lFSP/Nikfh911HJLJzcz82vY1FsJBBWjPGdBYQSjPJuH+dxunCDLj4I0w44ppudbZ3
	Z8jrkNE19EQI3Z2pVQGsAzwfIM6rsRBQDdOFbBTB2wr220+t5StlueUxtQCr2sFXCFA94Cdxz7Z
	H3uwO4xfKw1V9/TEBpJOaKlQVhFiONVKEqctu0+lS6MU1JGh+8XKBr+stkt1Efk9xuFLOFi5P8/
	IJyWwDAeu+X4S066pd5jWXJ5tXVVZrR7KzktARMq5S7ENcTBJn
X-Google-Smtp-Source: AGHT+IG61Cg2EsZ6mFcATGIhpAk4SSk0CRiADEGLsJ27c4EEborB+N7xb14aDwAJYfIJvD9REtBYbw==
X-Received: by 2002:a05:6102:801f:b0:5db:38a1:1f1d with SMTP id ada2fe7eead31-5db38a12d6amr1338209137.35.1761296438849;
        Fri, 24 Oct 2025 02:00:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934abaae96asm1822187241.8.2025.10.24.02.00.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 02:00:38 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso738474241.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 02:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvRXy+h/DHkVSTBoGG4BoEft5GzeA8zYBFYLwlzKBNYj6gyZhpUgJVVBUsMOV/7Wy1LnCv9/ri3wCz@vger.kernel.org
X-Received: by 2002:a05:6102:6a81:b0:5db:341e:94c2 with SMTP id
 ada2fe7eead31-5db341e98c9mr1497710137.4.1761296437697; Fri, 24 Oct 2025
 02:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022074100.1994447-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251022074100.1994447-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 11:00:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaw0DXz7AgdLORDerNqGD=juJvHOAevTODpMiniDyRjw@mail.gmail.com>
X-Gm-Features: AS18NWA1mnJX-CfRjNX5MadNbQ2xKcHaLUi92Y49yOhA0Cb_I7az37noXQXhEEo
Message-ID: <CAMuHMdWaw0DXz7AgdLORDerNqGD=juJvHOAevTODpMiniDyRjw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: remove useless wrappers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 20:27, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzg2l_gpio_irq_set_type() and rzg2l_gpio_irqc_eoi() only call the
> equivalent parent functions, replace their usage with the parent
> functions and remove them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

