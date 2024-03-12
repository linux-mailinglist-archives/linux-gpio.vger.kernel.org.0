Return-Path: <linux-gpio+bounces-4259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE88793E6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 13:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B8A1F2247A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 12:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D367A155;
	Tue, 12 Mar 2024 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nuQU3m+A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC767A146
	for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710245687; cv=none; b=EEL8tezGIOrQjiBgpwXmRjiMC1OA+gmDYwxD+ur20tNMfClELiK02aiJjuyxc/d4YEca9tEnCqYkk1wAqv//TcocqEBred118X63yZiZztQGWViZw+m0TSCitnq76cNxvolyIIhsLhibaVKCBPstZByA7HbsaYQn2OSOJVYUBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710245687; c=relaxed/simple;
	bh=duOeKCS6bveowPG54FKvXNovbWkIKFNUj3Vc2HDZcO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQCzvyRL5I84MvcAv8QG8gMnfsc/t32kVKYvRRh7eQlXHSWt4vRjPw+ODkBpq6NqvOXMStXe2soIpw9MmfxRXd7yLmNIKAiIWHGuqpCkwH0i+7VhKT1MjKpFs+Bd6tv9ZLXI7/uwQT4iQ3IbJ6YNDmX7Cx5gDqBINq6f1DUSzGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nuQU3m+A; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4739b6ddc94so88598137.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710245684; x=1710850484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZC0o0r2wFDW28FPKH9Tb5iKiJa9D3c2T5RaNX1TwfI=;
        b=nuQU3m+AQmfF4KSfY2hHxbJ0RugcJEwPmyY4stpNsvgAkKRw/EGRk/6P0iVrzdQwXm
         zPm/Z5as16PYXpuIVzM0jT4WueGxMunEAJNqLXroV9VKovIHiYLX53yth+fqZfbcaRq+
         DWenlwJl+x5Wh7p8+foQVNzU8zkFcB8a471UDbqVZl64SUKUBW1fcgVXkjX6LE9ICRp3
         BS2MOOzGpNCdvIM0ChddM1D7Zrx3H/acYKsxTfpv7wMXARoyYTd+cq22PPCyJ3Jrg8jq
         CtIfAKZRTft2TMmhUodPs7NYwLjYnSC30ppJyjBuffNiTbHHEWtBQTxAYdVhh0CO8lif
         UATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710245684; x=1710850484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZC0o0r2wFDW28FPKH9Tb5iKiJa9D3c2T5RaNX1TwfI=;
        b=EoArCexWV0gcXU/I00L0Rp5pPd/xYLnk10/+6fZERDz9XMet/nCMpb8pbYb4jiE7Au
         i2GBhAC+unEikofFE9/2BUKyRwe0C7mpnjZp2bfthnLxLEmzL44ZQJWET4EPWTbMvkAY
         FyNOG3IRtTE3lRD+A/yW8oRF0x2j7AS8bfqbmJXNsyOHAn39Gl0G4UXNBv9p4pElDQfR
         61YwDDQQ+t8A5E0R0seah7EOF0p6F2k/1b6/UJD9qqLjexOQOlfj9WDm3GxlO44BUPLu
         gy/DR4W22K+U+cadkZSLAPoxjA7nJF1IR8KHgqzD40ufPGvaFBOLiW5Q/tZnnIdHscWU
         omkw==
X-Forwarded-Encrypted: i=1; AJvYcCXWMpGxtFPcnqFzhWwEwAb/SWy2SxWsym+aeaI0w7ksnyJZeGyjxilnQOwESfRZelcSA9dUHkYnrowBzjCUTaOjbOudTW5Jq7X+Qw==
X-Gm-Message-State: AOJu0YzrLcUTON1MSQJk12OFqzKIEGgIsU+Z3CSvHc7wxBcr0nItCcyR
	GwF4bSFJvMXsGvDpGfc/nb1P2NUZHprRipOI9Ncxk/WfckxXJgQDW2TUbv4q3/NPRSZJrjXVrvq
	srSqemh0Yb1NN+d5lTmV/pWZxuIIHNaxSOKry1Q==
X-Google-Smtp-Source: AGHT+IGC6GWeZ2uR1cZhuSX5z92E2OTDgg+XTAjGxI/njmH7eNlkIR7bUmLNMi0nRjdzhJz6htsK6DVHtdg4w43ul40=
X-Received: by 2002:a67:f492:0:b0:474:c602:f4d3 with SMTP id
 o18-20020a67f492000000b00474c602f4d3mr380845vsn.21.1710245683902; Tue, 12 Mar
 2024 05:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain> <CACRpkdYtiyHgvtPJYxq2BNb9UxthwPQPHyUddQ5Q1eat1NY4XQ@mail.gmail.com>
In-Reply-To: <CACRpkdYtiyHgvtPJYxq2BNb9UxthwPQPHyUddQ5Q1eat1NY4XQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Mar 2024 13:14:32 +0100
Message-ID: <CAMRc=MfvKy=0d3mrE5NaZMdVoG1P5s8AakrrQy+D+9a5Ua3Uqw@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: remove BUG_ON() in nmk_gpio_populate_chip()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 12:52=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Mon, Mar 11, 2024 at 12:00=E2=80=AFPM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
>
> > Using BUG_ON() is discouraged and also the check wasn't done early
> > enough to prevent an out of bounds access.  Check earlier and return
> > an error instead of calling BUG().
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Thanks Dan, I applied the patch to the pin control tree since the
> rest of the stuff is resting there and Bartosz already sent his pull
> request.
>

Yes I did. There were no conflicts in next with nomadik updates so I
figured you'll just send it yourself. Let me know if you need anything
from my side.

Bart

