Return-Path: <linux-gpio+bounces-27035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F1BD3245
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF2F6189D4B4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202C72EC0BF;
	Mon, 13 Oct 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hysCUdZn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C32E267D
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361055; cv=none; b=q45dGCN9uPMiri4qoIFFinaMoWzEosLIrQ5WhM64h6kava/hInx5GWOxR+LQbsdISARTx4dLoF0XB0OAtWzpGbDxyUhF9XOp6EZyHCK0Rr8ciBEkUTrW282RqMvbwee034nWit/7fHdqhzrSE+B0AyEtEcTFoGJZhCBmnKjTj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361055; c=relaxed/simple;
	bh=6PQLnSSGAkRkKVpnNFnjlQ7pqzYi6bHY7zbvd/j9x5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jLrLauwyqXcA84TRLt47+6RnHJc+TOUyf+xEqt93cAOOxYaa+ddrEfE8V0B7s6Mmvr1OdR+tc5sWLNIb8x2y5XA196QyGS2MKUgeMsVChshfTXa7zADmdShZoMeU5olZBWuHuUKFQEFrwobUVWnLSoy6OkDDDOCHAAtENUuzwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hysCUdZn; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36d77de259bso31335281fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760361052; x=1760965852; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PQLnSSGAkRkKVpnNFnjlQ7pqzYi6bHY7zbvd/j9x5M=;
        b=hysCUdZnyx4FNeY1IpSy49i1sgyx7ccFxB809SFCP30ouDQ0l5hK5dKiecJpRvTn7I
         XdRmbyQzDMwXtwoGj1nKLn40QVLH0i+4ds6z9F5E83BXLJAMczCoBqbQDXcGpenEHPQd
         GqsnTQPUn6lukzs7y9hiavdL2KuzMMV56dH7/jf6VBS5gflA3jik5hNCbVBERJPsGKW2
         f73M/RLZbYgrEpYn2GvcybAmdHOdHIQHaT33PpeLNsnrhAzv34iK/9KInuOafv5jkv8r
         rFCqI0Czv7vgd4ez0XVmO7oqyn4qKyaQTbE5pzB4DHip4ElCvJVy6e+Y5LRg6dMna6i2
         fK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361052; x=1760965852;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PQLnSSGAkRkKVpnNFnjlQ7pqzYi6bHY7zbvd/j9x5M=;
        b=AIPyltPJqI8lhck+vP+13mvRQhJtVWhr+OKpmmCrsVMf9Ll34y6Xe3mCD7y4u72wzb
         JHnM5uttqg/CFXlp/XE6axwgf2OF5dZ3QDxYO33hEgYqmMC6Zkbohq90UJVQdA2NnChv
         k+maSI0PN2TWNr9fpSmO1bagvB4KvziLEyP5wheVjyawVTqzBV+EC3VS5UcQ/nMbxJ5b
         i3GIma+prrKTa1DNGsEygCKNcpzuqu0yT0s6tklTLS47t5xc3QtjyLCqFPxyc6Ymia1J
         0leT9vaT6etgpM/2gCs+eVctaHpo/1lLzBqD/c3SlADTr3qZdeFUDcQvW6H4hwf5Fm0A
         6qLw==
X-Gm-Message-State: AOJu0YzvbiSmthbjFVzaRBvhaXtmxaqRaK+4E4WDnllcp9uQeD4YQfxq
	Hz+N5Lsalr3km/O8zmTyOej1ziUKH//ni4ngIADSVrz51rqaRt68zceslLw7aZmaReriB8NBVUJ
	ASP5114yJQlYa9FilDvnxKWZ3A82IidWWOM9D9un2KULIEWeykWbs
X-Gm-Gg: ASbGncuU5nEvEbqOuLFW+eKa8AlH5Dg9FvJAPD7TIkxfPKtetITnGpwbXPzWPgNj0Dv
	OfBWsSlsqCIRaocLMzp4hJpVVqaryFBVTPbbY8xtaADA2LtOF9UL+X6UvBoALK6RNpmULjxh4NU
	zneQVP15+dQim0Rbg5tXXm66iKMdNphOqY8rIQhSyeB3qECBV7m6JioXbKJ1YUkDIRjjOMHqVGU
	O8L0idKrNuIOiv4d/dxynmGDN9iUA==
X-Google-Smtp-Source: AGHT+IGbo4BMMGUKCdFUCwj2jkVxEsoMKwOn9jKjvcy5sJsII24Qf0yYXqLHmJNkUW2GMCchtirwu8qwmTvAOO5yO+o=
X-Received: by 2002:a05:651c:546:b0:372:628b:5cbe with SMTP id
 38308e7fff4ca-37609ef5cc8mr53550901fa.42.1760361051873; Mon, 13 Oct 2025
 06:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-pinctrl-drop-advert-v1-1-df16410680af@linaro.org>
In-Reply-To: <20251007-pinctrl-drop-advert-v1-1-df16410680af@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:10:40 +0200
X-Gm-Features: AS18NWA-BZeDDz0UxckZs0Pv5Vi49CF3-yUcAh08ZXcZ3B6SePiC51zOjHIl4lM
Message-ID: <CACRpkdYiObPoit1cTXY_1EsHKzA+bEhwsgYtVaB-T4RoaXvbVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Demote subsystem banner message
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 3:18=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> There is no reason to print any "hello world" from pin control
> unless (maybe) if we are debugging.
>
> Drop the banner.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied!

Yours,
Linus Walleij

