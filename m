Return-Path: <linux-gpio+bounces-26444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA0B90770
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 13:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B463B1B9C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 11:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2F6303A22;
	Mon, 22 Sep 2025 11:44:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90776026
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541473; cv=none; b=ZPcHS514jBJCCcDEwHrCpo3B2slZg6Yy5M93XH9M7zPRjwGVCV0XJ+PCEhfyRkP4QMvnn+okCy5TNYGQYIR7LNj4kyxAfOcqulY9Wcam4yoM2bVI/8J6eEVhyKJk43ODJe+dP1KY0XZOlYK+tS15ZtdygboRAM6XNaVYryARMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541473; c=relaxed/simple;
	bh=mEWclQOnLh8wG0OpIAmPeQffuxDxP77/P84ROBKBguc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ruxde/4fkNRFkruFG3FvHP7GPoR24UGUP5FPHSWSB/XT+EJr0yvgypxJZYsUiZMlUEsItOncLagKjA/K7lF6OfMjaE4cLSrVMrE2n3xijP+6i7UZ0GeJChhidiQ0wgcbG9iEKSJwZYH/XbRFJlrXXNWnJfejzE7gSgX5c1YxYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso616105137.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 04:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541471; x=1759146271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OI2Mb5YSlGneegkZfRI1AezQr0Bceg+Ogs08hlYWuUQ=;
        b=DIsOhRJ6zbzSPQYKkvkkWUCFjAD8yr3+kXYKsZ5Ib6DsJzEoN3Lj3XA54/N7rChQ6J
         LxEUPqFTzVwSLSy8HUN3EDxFkz9idt1lXDd6ZmYfm+7h4D46tnHJfPqOHzfQqdn4/NOt
         JhH2AjbDLfRKjj5Qz+11jN43MjBPKlKqgb4RYc4DbjUr4Q2idZMnh2v1erHh3Ntn9tqW
         qzpPY5qbPngJQd6EKe9ZX8RKh9s9LOxoK4pygiaI5kNFtgMBDYnX0vjzzDPp/NnO2+AY
         PHyY5bCcxsxYgPNet7TUw6XZ8AVne8aWMocegdcDEplEKiQggFhy0Pbr6Ofaml+Vgfoe
         M9mw==
X-Gm-Message-State: AOJu0YyZuu5wEhtx3nkKzVSl+g9r3/aHlPn6oCYk5N91qPw33GJ00QeP
	qpYpSI8XWnCHjwhPIdHCmsdhlnukLOK46RIJG3n0DJ49DoszwkyOu+P01rpByWiS
X-Gm-Gg: ASbGncuFCD4ejz8qqIMmICbM6W3mpmkJZOtHpa0gXT18lVAEEkHF3LetzEs9BPpTk3m
	Mattf+0Y1+tt87ckRT7iyCNnnNm7zdFC2M/U3VfFEm/oDIHR92QAdBMnEUaDtwWGdWsMpGvqc/6
	NQogNPSnwAQnOgNhOpwwF6fInR4CBh/vBjrhplBIIVWidGBD0W5S9Lb4nFvfFEMcBBVonNoAwdy
	FT89r7T1qYxtqiF6bmryYh8rLUDYs7We/5LCZCXGsSW6cdVB4IHDOijxAmIN9GEPA4NVgabykDr
	sblX0iiObtIsobJ02jRWIk1T7KeSs3iB3U39V97NaPlOBT3UWPutaKBF7DXQDD8IggRDrPX/gBJ
	yufCWCEjaIcOREmsxEyXp5CqnAzpH575byud8M7C7jk04o09h7ml5IeLskb8S/aI6k2fu958=
X-Google-Smtp-Source: AGHT+IGWQviZagPtU4V3EeuVjDfTeyezLY9SyxuNG51T99FykmuWs1LbOZ6/2lwSWmI+nq/L9XXwOQ==
X-Received: by 2002:a05:6102:560b:b0:553:542d:d96b with SMTP id ada2fe7eead31-588f139116amr3247703137.35.1758541470931;
        Mon, 22 Sep 2025 04:44:30 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a1b3d226csm3255450137.16.2025.09.22.04.44.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:44:30 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso616094137.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:6102:c0b:b0:57d:9305:63db with SMTP id
 ada2fe7eead31-588dada3a4fmr3176649137.15.1758541470493; Mon, 22 Sep 2025
 04:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918200409.37284-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918200409.37284-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:44:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiz1=TzOUgSwxTOP__rJEHsADDwzQmkvFYq7T8WzR5og@mail.gmail.com>
X-Gm-Features: AS18NWBa53IKi-WhxYHxbxmTIi82Kncl83cZ6WOELioWigxIPDxeDI4bC4T4Zk0
Message-ID: <CAMuHMdUiz1=TzOUgSwxTOP__rJEHsADDwzQmkvFYq7T8WzR5og@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Drop duplicate newlines
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Remove duplicate newlines. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Yeah, why not?
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

