Return-Path: <linux-gpio+bounces-10818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25E98FE56
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 10:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 142CDB218DA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 08:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36BB13CFBD;
	Fri,  4 Oct 2024 08:00:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCFD136E01;
	Fri,  4 Oct 2024 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028815; cv=none; b=Nq6VDn1WuZG9DIk/2pyvS4+2gn29zwGS9AQPasxfseq60C8xr/007WtuIxRQfb737PcVKMN1kgeWwxlZQTY5z/Cq9MjId1NTDkJsR/c1biYhfI1ilOu6UeC+QpiPd9Rx3PMSb4xXSTav/bd+27aELI2cbbk+8AMAeOnfb3yaUj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028815; c=relaxed/simple;
	bh=q+nJJduVeOW8nIsmQvl6xN6rq+hkxP58jincevFs5MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR07u5sxkXSnednfPVc7OtuOPMX9P5D3sEA5kGHhKAOOfQ4tKIsvMcUTk4bSP7FMig5Z6s5G0mWQ5COPbymI1TKUQ+Dae+r034q7jU9R06WVxhHejm8xvC7/Gafy72M9yrJmQuO5h5H+D2QxZGj2r6dgp1eamE4IrvsW4qjK2bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6dbb24ee2ebso18546607b3.1;
        Fri, 04 Oct 2024 01:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028813; x=1728633613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+NCfgJE68+n4QCeBFDILdSHFvh5D0kneXnvYpyRe8s=;
        b=Uwei43xyy4c+LAFu8BvhguaCIaPeOcae/We6CTx9i3EtOdlZIBeYWhqVppZYwUzMJP
         czpKNQiKjSg5uq4mpQIDzkk6nkQl78QNHF6Ev60T816ww+l9JxKF78UwyPal20LHlVf2
         ozNMGlasnMyikDisThHnLit5fNuhxnFD9Ed8CUuiAPUlgZq1QFJ48rERj46KEsFAKti4
         +d/9CFy7sVHDjvNHgN3kWqkqIfciE01DGG7St7u6J+uvxhZXxKO5nS5xQC/Kv9JnoJdh
         2TCqEhrlkpUibAdS9AYl7ZixCQe4+Zw8DlXBQcM4aTTrCUv2XTy0mx7BK3uiR4dv+KmF
         aMkA==
X-Forwarded-Encrypted: i=1; AJvYcCUwugviJ6nQsrIvHAy565twJ9xOAVHcYeBxnsOVDjb1RlXH84VARC5hNWee9S7jBxg9xXZBrW9NcJ2oiguBMVIWWhg=@vger.kernel.org, AJvYcCWSdDr1vISeceyjyQcM/sLa/eX4+/wSlMuxE4AUFwol+FMwwFQnruKpYEoNWedohEHPDUg6e0NwrZl+duX1@vger.kernel.org, AJvYcCXIZhRfomBYD8EZNMNciF6qKYWY5FlhoQorYvQE+AY6Obpk7U9cimaJuYNfr2b+LZExq8gP7yZkbk0K@vger.kernel.org, AJvYcCXkY4SnaOtwYU1+8AEu4gdIJOriLVDUnhRA19pgxSDg5HszA5D3sor8WAnvDQTEVk+Cfc5Trev9VWk+5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8G2MFch1FKz6jiuDu0i4UCMiae73u7Mtkgqb9KWGOaLURPOK1
	3u1kVcLtR91YoVToAi1s/A67qwxHISd1ggB89ONv99uJk49txIYhuVzD0mqS
X-Google-Smtp-Source: AGHT+IGF5gi4okHDdqoixauholKf32fPs4r6RiqnTWjXx8ifj1J5yCdJHhz9cN+LGKrY5V77G4bLkQ==
X-Received: by 2002:a05:690c:18:b0:6b9:fd00:95c9 with SMTP id 00721157ae682-6e2c7296839mr16213337b3.28.1728028812820;
        Fri, 04 Oct 2024 01:00:12 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcf96b22sm5414757b3.75.2024.10.04.01.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 01:00:12 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dbb24ee2ebso18546437b3.1;
        Fri, 04 Oct 2024 01:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdcqde4QoZPMNC3VGn+aekzADeKEPODfR8l4olElMUOUk68STO3Dz1h06TEDdvGkknPzyCPXCyGIYV@vger.kernel.org, AJvYcCVhKFF0JKRR6FufLCVgOyDg4v01JtQPmnJlsj4tlXyHrkCqDpotGDDHyG0wm/edhu7hMjEHxWj8Xu1LKXRD@vger.kernel.org, AJvYcCXUaXXD5TcDmfNXLng+wGYsTfSCsWT5w3iNl3Q04A75zo1lXdKjAlhBdvVGlckm8YUORRC5mlFLHSlNzBXs+fEln9Y=@vger.kernel.org, AJvYcCXsmfVFmL9SyOsVT9KVLtlqa5JtL1As/W+3NldKp6I6sR4KKup1rCBcsN2QNrYMIIptT/e4Z63jNbkUyw==@vger.kernel.org
X-Received: by 2002:a05:690c:6610:b0:6e2:a962:d80f with SMTP id
 00721157ae682-6e2c6fcb63emr15450817b3.8.1728028812325; Fri, 04 Oct 2024
 01:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240918120909.284930-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240918120909.284930-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 10:00:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaicJn0zC8VhjuzXTh20sHhSnqVgTaLudsusKEH7B4dg@mail.gmail.com>
Message-ID: <CAMuHMdXaicJn0zC8VhjuzXTh20sHhSnqVgTaLudsusKEH7B4dg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 2:09=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for configuring the multiplexed pins as schmitt-trigger
> inputs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

