Return-Path: <linux-gpio+bounces-30016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94932CEBD48
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 11:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3186305DDBB
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187B531578E;
	Wed, 31 Dec 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9GpIy4W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DA313E10
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178630; cv=none; b=l9nmFFPs4pBQez/pJhkrv1YOxY2wpBWEZginyRlEKY1gWjaHKsDFWeG4pwgolRGrh4rR53eexZrHjxlhVhoSbMdYhPKIwPUxltoZwW4cdDNvtvwtY13xTaof67HVinuvR1q2JG5bu/vWaAECNQMmlLwwOcnGu65viGJy8ntfMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178630; c=relaxed/simple;
	bh=mg0/aNw52l1Cozy2Xwh05nH5IxFxkRNDR4aXZTVQz0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l85ayDe1gFmmkmzVNWZ/gRINllJTC/MH+tuByRAOEhaXcjtPcUcWyPuA3wvkoZNUrdf9MYuDUs1nBH1hzA95THwIbt6htxrZUMmmo7Vkq4wulbUITBWcH3ZvL7fjPUBDLzOpFDOF2ZDUdE/YZmJgJ5pu4Ezz1uBrIStENRA/w9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9GpIy4W; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b725ead5800so1511242266b.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767178624; x=1767783424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg0/aNw52l1Cozy2Xwh05nH5IxFxkRNDR4aXZTVQz0Q=;
        b=X9GpIy4Wc0w6L9p9oiuZAVkBVlr0RHHF6K6ymEsJlZKritp2Snc2eW0ST7IwY8nGrt
         5vtQ18nUo0KTYS6yfXu07l7ZQzrL+Kl1anb0z/S76tdg0DxPjJYkEO0W7CuRwLIC3zqF
         EhSvincS+19T63sUfdwEleSTJmOpPqfz10tUS2W3SI4HZT5tclro3iwiRGbZbh7wgUnr
         +NF1jb2uegEcd1rSL3z2X+D9M+ov2vaT3YOmMR5PTk5YElMB/Bn5NOs0DFnr/s7jCAlm
         24NkBsu0lrQJiFhzVcGWzFfXEfgERM7G2fOYlnHqu+qpAn5BZTAlG5BIrX4h51FJlx4C
         fDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178624; x=1767783424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mg0/aNw52l1Cozy2Xwh05nH5IxFxkRNDR4aXZTVQz0Q=;
        b=PqkB6yL75A+clQ1ZT6ePOoNJqWwKKFXY3L9kimB1dC1hsS6/FshlJEe4HUL8cxqJIJ
         SGBwKg6w5iYF3zB+jL2XhZ4z7ZqBoWfU2W4KukD28GkQUT8m6TXT+SVGWLOOzoXpBEOG
         1UZ7OQF1xtij1q+uuIoXxPSm/mJAXDmnI1fI6UTYPVvuB3JQZ2ReqBUtKc3W/DWRMOz3
         VCEHuTrh8nxFZCJc9o/4fN8WeAexg0A9yuF3Z9ymz04186tI7z7vFBVRaPTWSSZu8Zkc
         Q7Gn55MFb3oKb4MbR/ZzZbAq2Wh2oqKjtjmga/5OML89IK9Su1S1yLE9naOINSy24qIl
         SpLw==
X-Forwarded-Encrypted: i=1; AJvYcCUfWERk5qHRW/+n0GR1NOZm80J5lyGULZX56UXp37JH9F07gXHr2y43AQtKndL5auZDK2hEHCPJb7h2@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuySqQ0B40zgcXTLFovEinS0TD1ttHeE8yISC/aHHTP6wPUea
	+bL1GGpuYABl681er1oQDQz0In/TOyctNIWS5GP0u/PJgf/Iyoumi2v1oq9h3c41yVGzPgU/ieJ
	f/VYRZylRes39dJTPBTQFu5O2thjw26Y=
X-Gm-Gg: AY/fxX5sbrI0t4P82WAxg+UKi+JR+rSphrGIoPujhm0weIFi8KNhm6NBd7T40G72V31
	hgSbBeXnCeXimWCs3hrLG9pRxxXuuOvkHEXYUpp+c4OoCjCCl4PHOrSmJ6a0VCfEMaFP6RVp6GA
	HgJrmZ61qP1yOlt2xE+d9JAzxb4c3NTIR3XSR3UQNjtULl803UaBsh+THWkqNLPDbrFATGUzl8c
	IDeYwAAuTmAUsXm6lDsULMb76mxQnKtfJuSRQPMJUW2Gux1M/pmLq7itj6R1Ep4dqLLRMc2+HFO
	rYWRq2q7met4qSqmovVRuRQhxvi+fGa3SlMU942EHY1GRZks6JF/bzulilo5DACaWSBTpVso2gZ
	k7wa+sS8=
X-Google-Smtp-Source: AGHT+IGZBT62a+kRfLEQMi3OF0gdeNcbLjne2J3vjVkmy4LOfMaQtO8VmQlnutRNu/bpvyJumklEJcd6A0xFeAOQCFE=
X-Received: by 2002:a17:907:75fa:b0:b80:3fff:5fe6 with SMTP id
 a640c23a62f3a-b803fff60f3mr2207105266b.9.1767178624346; Wed, 31 Dec 2025
 02:57:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-maintainer-fix-mailmap-v1-1-7da300a275d1@kernel.org>
In-Reply-To: <20251230-maintainer-fix-mailmap-v1-1-7da300a275d1@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 12:56:27 +0200
X-Gm-Features: AQt7F2qbXqaAqticBjQiKCM8TSyjvfZlpsfZazEn3Qny6lpuRuYZdF62o2DLREE
Message-ID: <CAHp75VdnpSk3eWzd1f90-HG1z8Gy5+79LT5V7kBKRUjvQk=jUQ@mail.gmail.com>
Subject: Re: [PATCH] Update .mailmap for Linus Walleij
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 11:10=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Developers run into bouncing emails from my old address,
> so add it to .mailmap. Stuff in the rest of my old mail
> addresses as well while we're at it.

> ---
> I'll just stick this into one of my pin control pulls
> for simplicity.

Sure, thanks!

...

> +Linus Walleij <linusw@kernel.org> <linus.walleij@stericsson.com>

FWIW, I have got bounces on this one.

> +Linus Walleij <linusw@kernel.org> <triad@df.lth.se>

And noticed this one in some files in the comments. But I dunno if you
want to update those.

--=20
With Best Regards,
Andy Shevchenko

