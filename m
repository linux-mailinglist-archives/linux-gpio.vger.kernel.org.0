Return-Path: <linux-gpio+bounces-626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57E7FC810
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 22:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98968B2164F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 21:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FB644C83;
	Tue, 28 Nov 2023 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuDwZIAS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7C72D66
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 13:36:05 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c21e185df5so4335633a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 13:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701207365; x=1701812165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTVlLTZZmikOeFqoqYLREHBTF55+gG2wuAmC6HPrHN4=;
        b=kuDwZIASyagCsGZh2bDS2mH2gp0JyH33VXzAd9Rm35vw2Ra5iIGviyl+nJZvg7oHVg
         kN2ccJKravFu28T/akIlvY2W9+Ag1AETWWBSP6gg3B7HC8JRt4/THHUXANXZJYedS53R
         cx4MBxmEpR821F4t1/DmZzOyVAYbxxBQvKGwbwPI6B+YJQiShzoffkyHskkRlSSmp5PK
         alIirvakrTNByJ0sLqMwC5WOq2TmE27QQYpizSznyZ8+CKLvHRzWWoX3msnQWZR02JOZ
         0NlA+jrfoCTW6Y3ULy0bxebdmJYzOlxP+cCYWvPiGSUer2QtB9N2vCRqNSp2HvfHg+Gu
         bkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207365; x=1701812165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTVlLTZZmikOeFqoqYLREHBTF55+gG2wuAmC6HPrHN4=;
        b=KblwFFwXUXqRqyer+TVh6eA4Ihq71cd1DLfhr7ATgc1NcwRw7OuJPK66A5QrvBTFc+
         wlYZai7bVanT0A0JauuWcfjTAbykfbhQ19H6Hh3vK3ldPyB1y2Nm85Cijn1+7o8GnVQ3
         eK4+I0gXxejXwOZUu28EnQBUGihYHOhU7kpjEW70V2N+FMCbUM9t44dxF8PxhrzS9YVi
         FLi4UU8uTlu3P/w2D8fkPFk5NhelFcKUFCY2ycW8urQgaAh0/6FL5TkYYmhysWiNYmIZ
         4Hha9bhrGIBf4Q1j6JY3XzYZxPThoMrO1s5UijQ4WUxi2E69D7VyBNVnmlBtxDFtBxz+
         j+Zw==
X-Gm-Message-State: AOJu0YzJHIADJGNyhk6fg+qZOAg/8RDKZN1xRamPnUXQusY0Oxed3b4h
	QcMSrIMyiPhtRNlS4/iPtxWfiShrZ9zJgr32Csh22Q==
X-Google-Smtp-Source: AGHT+IHnu+R39CMW8bY/8u262kP5zKg3VQ/mjN6LJEe4dATUMhYEKF46M96JeCHr013bip0jw7vCgK8zjEoEnqa15VE=
X-Received: by 2002:a17:90b:390d:b0:285:da91:69a2 with SMTP id
 ob13-20020a17090b390d00b00285da9169a2mr7861663pjb.31.1701207364753; Tue, 28
 Nov 2023 13:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38@epcas2p4.samsung.com>
 <20231126094618.2545116-1-youngmin.nam@samsung.com> <bb738a6b-815d-4fad-b73f-559f1ba8cd68@linaro.org>
 <ZWU75VtJ/mXpMyQr@perf> <1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
In-Reply-To: <1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 28 Nov 2023 15:35:53 -0600
Message-ID: <CAPLW+4n0SAOTb6wocY-WjkxgSFMbx+nVuqdaPcNYVDsbfg+EfA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: samsung: add irq_set_affinity() for non wake
 up external gpio interrupt
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 1:29=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2023 02:01, Youngmin Nam wrote:
> > On Mon, Nov 27, 2023 at 10:54:56AM +0100, Krzysztof Kozlowski wrote:
> >> On 26/11/2023 10:46, Youngmin Nam wrote:
> >>> To support affinity setting for non wake up external gpio interrupt,
> >>> add irq_set_affinity callback using irq number from pinctrl driver da=
ta.
> >>>
> >>> Before this patch, changing the irq affinity of gpio interrupt is not=
 possible:
> >>>
> >>>     # cat /proc/irq/418/smp_affinity
> >>>     3ff
> >>>     # echo 00f > /proc/irq/418/smp_affinity
> >>
> >> Does this command succeed on your board?
> >>
> > Yes.
>
> Hm, fails all the time one mine.
>

I tried to test this patch on E850-96, and an attempt to write into
smp_affinity (for some GPIO irq) also fails for me:

    # echo f0 > smp_affinity
    -bash: echo: write error: Input/output error

When I add some pr_err() to exynos_irq_set_affinity(), I can't see
those printed in dmesg. So I guess exynos_irq_set_affinity() doesn't
get called at all. So the error probably happens before
.irq_set_affinity callback gets called.

Youngmin, can you please try and test this patch on E850-96? This
board is already supported in upstream kernel. For example you can use
"Volume Up" interrupt for the test, which is GPIO irq.

> >
> >>>     # cat /proc/irq/418/smp_affinity
> >>>     3ff
> >>>     # cat /proc/interrupts
> >>>                CPU0       CPU1       CPU2       CPU3    ...
> >>>     418:       3631          0          0          0    ...
> >>>
> >>> With this patch applied, it's possible to change irq affinity of gpio=
 interrupt:
> >>
> >> ...
> >>
> >> On which board did you test it?
> >>
> >>
> > I tested on S5E9945 ERD(Exynos Reference Development) board.
>
> There is no such board upstream. How can we reproduce this issue? I am
> afraid we cannot test neither the bug nor the fix.
>
> >
> >>> +   if (parent)
> >>> +           return parent->chip->irq_set_affinity(parent, dest, force=
);
> >>> +
> >>
> >> I think there is a  helper for it: irq_chip_set_affinity_parent().
> >>
> >>
> >
> > The irq_chip_set_affinity_parent() requires parent_data of irq_data.
>
> Hm, so now I wonder why do we not have parent_data...
>
> > But when I tested as below, exynos's irqd->parent_data was null.
> > So we should use irqchip's affinity function instead of the helper func=
tion.
> >
>
>
>
> Best regards,
> Krzysztof
>

