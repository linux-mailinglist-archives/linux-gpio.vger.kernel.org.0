Return-Path: <linux-gpio+bounces-29040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3DC81E0C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 18:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 069B8348570
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 17:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CBE2343C0;
	Mon, 24 Nov 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1kYCZWU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E8339A8
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005058; cv=none; b=Pz3+HdvUu2N2bOJoz5USoUEYXqZjfYYiT9aZBOT8sUeGb6EAYzHLfyxTCfJLcSWp7XKaWjyELZE84v/HA3jmPfZfq5pKxDgu3ZiwjM+dWKy5ePFV33tAO4KJnxjPgvsRHgyIteWTgvEhsoHrxSY2ob6zDAiqUTbzSV91cYTAChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005058; c=relaxed/simple;
	bh=RYQLGxxiC287sxK1jBPaeJUKtK0g7/ftRatFNFZN57s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWL8lBq5QUDSyLZbpJ8L15njYbLjt0NJomtSvdQ1DlDZlSUrJU5i0vgwB0BKCdQq02i0k2Nt8+SYMNwNir/+jTb1ZAAZotDbyZawJoZlWK6y2SCZ5LzNj2ZNyxyVggZQ3Tn6y3aGGyQ7j33ra5r0LGdeNtn/5loFyzbBogYfeBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1kYCZWU; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8823dfa84c5so52463776d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 09:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764005056; x=1764609856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=;
        b=P1kYCZWUGmqNX3MXHrgiQbTEja7zK12xtqAQM2Rx46gjOX8qY3f2BIkgb4zjVRY/eo
         AT1cxFvjCA7JEfZ60T8k9748faU6qwhISAUuwzDqUltwE6bHbgJYGqLyz/8Q0x2B2CDK
         QzfW011Lkal8vwV1myI/sHZSHkpb7mp1vfz+2l3cRdCKovtbI+FoSD0E5Jt3Mc8nPWd2
         r2Z6rX1QMw/MdC3KNHU8wOWiwAHT1W71/TjJn1N4qquk96s/m/OMDQbZr4f1mLCoXlqt
         OLuQCx7iespNMinBlpCrLb688JBQiyvfpLzmtxl8Lf69oVggPbS1IXfirqPsMVbuwSpc
         KY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764005056; x=1764609856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=;
        b=R7WnuxRXVoKmPeYurxPHlmrnVd9yqKPD1MTiB+2ls7NECpksiRLtt5GoU3jaPR+SE0
         5fDd3sclTL6attdeSBrn3sdB2Zqo5CatX2KlKUek5WBYAnDctaIxaMKPzhkW0bqe5jhF
         LBHjzx9vcpi4aXm1idO/jU8xubtdveaag791OLt0obA1NNYIganGuXvUHnTH5+cYyZyT
         gRyMAphEE2kkY9+VU8qeD8CorPKVR3kxyv+CwNRXijYtyt5emNgBhNRFszDAELRb1//j
         DUX3PWjvjLq0g5QKEsbIJBtxQM9kCt4oNhLz120ZEMCFo9nzgjKmKXVoTRNRGvW/h63J
         x2dg==
X-Forwarded-Encrypted: i=1; AJvYcCVrvNTiY08X/Q/NGeALEL1HO7C5EtyYfFVnvgYekxctTR9GJC/VdYsBV21mHDiTBTzrgy/AhYoSCNKX@vger.kernel.org
X-Gm-Message-State: AOJu0Yysgm7/5WLDx5uUWl0YT5P7SzA5W0G+mSvfIZuGh5JqEyXlarLM
	UeYgPIAbkzVflHTlLREkdm9b5KXr0FN9nPUGpCxUyjyPwByqHz/fuKiKk4PZ0bpe6urMqjXR0MJ
	M2LUr2XIIn/XXT+sG6b95/zbUmLJx7gvZ/U0sfAlKiA==
X-Gm-Gg: ASbGncs+KmxGzSdJu6KV6kdAdZNshR7f7Tnv54B5SCXZw5stmyzs8rZLmK9ntWuEx34
	AoYQyvwG5ARttJSxncF3xCe4JC6q9+NNarreDifAcaEnmofvhab5se2N5rnzZ6KqAf0SmYoekgK
	dBxP9ckHalMslQw+VHcQHafF2KdBQlmyznIdRJQ2mccHS1kLHivi1rs9XWP9H/MTo9KukST0xFR
	Qm5aGobHlYKmIt/q+Ug4PJBQXzpH1u5P59vF2CkmrZlU/Lf8eRU23mtBCxVkghTVeu5tkQ=
X-Google-Smtp-Source: AGHT+IFnvdWmjJCRzYLrbPvZGNPiEJ5Q839vHfC1gV/jBx6hNY1xoYFkx0yUuNsyMUDPM1RLCsF8HVzcVzBbZ0/NXV8=
X-Received: by 2002:a05:6214:3286:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8847c52771emr181588346d6.49.1764005056039; Mon, 24 Nov 2025
 09:24:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802@epcas2p1.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com> <20251117074140.4090939-6-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-6-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:24:04 +0000
X-Gm-Features: AWmQ_bkGzF2wniRoBjZTDbuGXNp0h_ztTCTVOwPYyYiq_8xUg5WYRfFqZfMc01Y
Message-ID: <CADrjBPo79HCUVsX_pv6EZ2_C5qB=pFMS=KMkMz8xkageuFvmAA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 5/5] pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin,

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
> GS101-specific. They implement the generic save/restore sequence used by
> Exynos9-style controllers that have EINT filter configuration
> (eint_fltcon) to preserve.
>
> Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>     exynosautov9, fsd, and gs101 controller tables
>   - prototypes in pinctrl-exynos.h
>   - definitions in pinctrl-exynos.c
>
> This aligns naming with the earlier macro/doc cleanups (e.g. using
> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
> makes the helpers clearly reusable by other Exynos9-like SoCs.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by:  Peter Griffin <peter.griffin@linaro.org> (tested on Pixel 6 / gs101)

