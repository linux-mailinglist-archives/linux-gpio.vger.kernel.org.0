Return-Path: <linux-gpio+bounces-28645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C2C68BFF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F3D94EFD14
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 10:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787B0336EF5;
	Tue, 18 Nov 2025 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9cmm8Bs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83233120B
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460830; cv=none; b=nhxvKqgEV60S3TGrwmio1CQQbUp3E17wc+LatcVPKb/kjo9fLQj2CV6N/tC27dArjLrp6ovfnjks8JfvelgLiOLgVcNiu45lu77Qd2aiyqxEtLNNKWQhx6ecHI+pFkmTQQLxPdPGoHRPVBQxHMamDC11GuIDRauEjhEnKcYgiBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460830; c=relaxed/simple;
	bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koVR6ikp2b2u45HxkWupm4ZJjarmrKAUXw++vM7S8BSGs3pQmqs05IAUfi8A/xxXO5jUQ6srYGIFaHvA/VMYNn3K+CRdR09dUxm4Cpc8dc2TvpokBVyFN7Ik7u6Ihd8cCuklQ2A62jJQweSne163Tstv37iq9CK2fPricY0PcmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9cmm8Bs; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b728a43e410so858442966b.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460821; x=1764065621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
        b=Y9cmm8BsFk0UIt9LTXQ4X+ZBSdO7Sg/SdvUL5WStCnKBy5XT5JLPAJW2pFO6eg7IId
         6qL0vWAxmIrRfZkeTk9T3W9biEwYiblf0dVNhfSwC57/mdnA5K9koyWzkUP+ObNjC+Bj
         yXQbgknBo0KtnEUrd2bivKnK9byPVlZq3Y0bgByvdlIrjnBjRQdrVoqMkAAO+PxPajqo
         ASDohyxFrvYfJoIbMfN+l+/UniVTUb/wDv+E64ZnCc73iuxldKr5Gormu3lw30+u9TDD
         UxB+ng3pH6Ezf4ctVPDn8BftG+JQ398dgi3DLtm7wizmpBniiNzAajR6HhpRevJfcfD7
         h75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460821; x=1764065621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
        b=BYh4BXsFkU5DytNzsY+2LTziCb2VoUd+nV269fQMKcyjpKAEToGlN7lqSikFgBbbbl
         Kpj6BTnfkgzm3hlKinLGjZiTaxx9r/vv7jVI08j+8v0wLPD2EODikX9ZWqJUAWofITo3
         Qkj981R8nGFKhUzF1bzScnkNcEn/M1Ge4eohwqbDLmaSzJH2gU4ywj/r/nUe6X+/kVkQ
         cnTz5JwhI5cnt1vPf78PYkqCDiMwhD9f/w14pYyPVg1sAU/hWUoQV6lUF5v/9KiM3G0Z
         jpja0eaCbQboIPC6ppYSpQ1lffMjz7wl5THyfsQWLCFNkgwaFUkLmp5x4s50CeUdhIJS
         3zzg==
X-Forwarded-Encrypted: i=1; AJvYcCW7WsxEcyuPDJOkShgEatGuLvYAYD+GtB/JjZIFtZnKbA/3E224Ls+gRq7UU+CUmwBdjW4fm6ocSumS@vger.kernel.org
X-Gm-Message-State: AOJu0YyJL2Cu3tfim4dpd86xUJ3LrfgtLemRZwOmO323hA7safRKj9Z+
	A0GVBC/TzFXyZJAFrjq2BEltnKQxWKUfNKJJZyzQuvLgJZTxovHnwhWqBdPMORuuYpYwXMjprqa
	kxbDIXwiiAB/76Utx9DCIMHM8JbFWN00=
X-Gm-Gg: ASbGncsi9W8nJEK3Dew4rUF8zdhiuUdItP9mbRvrC1gl+40lj1dfL6lE3uODcoKnW+J
	u++uPkBlBW0kpUdsCy3WB8TqEcQyBtpyhW4vKh2zNEdB+ZEIo76TrMeHJHQW3ruYC5kqY9Qh46r
	eC2PkQw7GnOqGpm9pXOBVbNEwICeDe6FgMJ41tIQFRbIMX7vZWiE8ZO3m6GwVSp4BhBQTC/C44W
	3xySty93UVPW8HBhS8wxxcR8PniTrFHHrJ0Fb1wtcU9B5q03gXxFGrJ8OKxxx/de2ksX8SMzc0r
	5XTt7D4bn8qtVBa083gVgv9P+OiHbG1gXKg3Q+By6wcSK4kYELMcZGJnaUrQ
X-Google-Smtp-Source: AGHT+IEJTl+Y0nxnsqFxRaoeNJlW33h1PhyfMHfP+H08fkNstExAh/KMDUENdNIJwaldyRxp9vjkOUQWvebpfsJzkrQ=
X-Received: by 2002:a17:907:961a:b0:b73:1baa:6424 with SMTP id
 a640c23a62f3a-b7367bfbedemr1652125566b.55.1763460820308; Tue, 18 Nov 2025
 02:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
 <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:13:03 +0200
X-Gm-Features: AWmQ_blpLOjcJSfageDQJ0p1yverbXLRzjhug3ph18HdqFCZGe_i141QG5p4Fcg
Message-ID: <CAHp75VeqaZ9BOYaEDdrShtZ=5o75HmeKBHv9dpiYpQLudCr2Ow@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> > On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:

...

> > > + * True if @str ends with @suffix. False in all other cases.
> >
> > Maybe added "empty strings never match"?
>
> But they do, please see the test.

I also think that "" =3D=3D "" (on the same page as Bart). Why should we
make it different?

--=20
With Best Regards,
Andy Shevchenko

