Return-Path: <linux-gpio+bounces-14774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75990A106B8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 13:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F60E1885B95
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 12:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D9A20F999;
	Tue, 14 Jan 2025 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6clseuj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7D1E2309
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858116; cv=none; b=DXv3IrVWfQaRMNczfE2KPdBSOlmj9aajR4ifPFLQKCAsNN9at69cn9hO2IBfE57hbwAWRWsb9oEXTWQ4jh+/7MjK4onJ/L4VTuE/ntEzt+1+BwnudoNQeRLdbf8A6VECgWEJJtNdHSeVqm36Hut+BTfBdBbw+K0Bzo8JoM9hcY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858116; c=relaxed/simple;
	bh=b8r5o/6qPypo3dcRIWa4OCULGL8dnw22zso7FOHff74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbBP7FWYZo+Asbaw0K2yBj1FeSiQFaxyGKfkqtaGy79xVr/KXloXgUo48Ab2EHZJlSPBZsRXOpNuVMqDWVdPl1nqysiNpBr+B/F44MWBCKo0pYn4NR/f1mdE4PKsLUGe0O6FxaIkTi0cALah1JcRT4v4L8ckVCuoIagdmo+Dub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6clseuj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so47505731fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 04:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736858113; x=1737462913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8r5o/6qPypo3dcRIWa4OCULGL8dnw22zso7FOHff74=;
        b=k6clseujQR6JIc3wClJujON9RR+cJm6c1Go9glmo7A7xZj8/rqIMC2hEUhak9V2aDs
         iQCwMqpdAH3lrLfJaIyOtgEuzezwf5Y2VsIyU4oqbRtlmAeLaQ2okQ7f7Y/UHOrr2i3z
         uUWHdcnPMWQgfwcRPS39OcbHLBKwz5PU626zl/VDH1UQKjFbUz8tSMPRpBfd37wQOxKn
         6NINL+qWJ+PjpkEFZlDoFQwe3m7QlZt/Pvy0tgLTCmzIkzFuskGgJByor5TVL053AOa1
         LFHamw24MlVB5uOmoxibdXAzeANm9N8cn4+P4POyljdTfj+MHzw7nPVxsWAx/lhF35TI
         97TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858113; x=1737462913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8r5o/6qPypo3dcRIWa4OCULGL8dnw22zso7FOHff74=;
        b=YYdhLQyCt5MfrE2WXjk8D8rJ384DXr5SKigDkCnIF5VYKrhK4PQ1l6fHzJL3kgoXw7
         TPIl+IP47bWH8EkYpT9YF/PJ9U99LKTphWH+natKhb+dXzJ6zxi6cbzydYVAvSyOdKZ6
         YAHYflCRpxmXBUwP2F4WY+VwMhzh8Q9NY3/LovFBtuiA621S6vj/AT/4MW3oDsBUO930
         cRrQj87xjKmoN6pW9XFoDa+Xe0us9E8fm4msugOXM5CGEljjFt/nYROvrs0pBRa9gVeL
         BEIKKyP81tjsaKTsN6sneEz5lm8tW6pl7bAlo4Owbj3tNBo7lyYb4Im9Sb/Ugbr9DhOc
         vgkg==
X-Forwarded-Encrypted: i=1; AJvYcCX2jaFNFG+rG56mOtAUUPsCb8tDNW9XIRF+Z5Cp/rjZIDoqJw0myfUz82EVikFThXPMgRli9ojv1nmk@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoTL/Lr1PLMTafnpXI5tlmuSiZMZ/EVNk1B9x3eRMR/C+4tD9
	PHb4WOkW5vxgwxCtYmSR1q0JZNblZJ2zj/+VawksCkrfd1mDsMgDwbdhytiBkTjGN9TFsCV6/Su
	xtWjffo7dknpUfXEumy8h/3MFzpYBcBoYUHjkHQ==
X-Gm-Gg: ASbGncuXnxTcWs+PGbFN3659S5Yh+JEIaDPL3on3/7OCPbyPVQdym2X6MFOKw7g+WEx
	wp3sGMSXw1egKlES0GS+lDNo96MurjszsZf46
X-Google-Smtp-Source: AGHT+IF+sKXluflS4ajBh5S//clfd55dsg1xYEHSNyUmSINXxxg0sgpdoYOyNoF1TGi/HYNhvQfK5i1o+06nM0ga5to=
X-Received: by 2002:a05:6512:281c:b0:542:213f:78fa with SMTP id
 2adb3069b0e04-5428450804bmr6457605e87.7.1736858113276; Tue, 14 Jan 2025
 04:35:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107201621.12467-1-sander@svanheule.net>
In-Reply-To: <20250107201621.12467-1-sander@svanheule.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:35:02 +0100
X-Gm-Features: AbW1kvaYatrEVjQt6S_lYAMQ5hOXZidnkBJzVzwyrmBUR1wY5Yj5XY7X4J02F5M
Message-ID: <CACRpkdaNjok9GAAXtjEtS6r5X+k75SVmtCavKo_ECQWPHqmBPA@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: Use generic request/free ops
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	jonas.gorski@gmail.com, kylehendrydev@gmail.com, 
	florian.fainelli@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 9:17=E2=80=AFPM Sander Vanheule <sander@svanheule.ne=
t> wrote:

> Set the gpiochip request and free ops to the generic implementations.
> This way a user can provide a gpio-ranges property defined for a pinmux,
> easing muxing of gpio functions. Provided that the pin controller
> implementents the pinmux op .gpio_request_enable(), pins will
> automatically be muxed to their GPIO function when requested.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> =C3=81lvaro has submitted a similar patch today. My implementation's impa=
ct
> is more limited, but I hadn't gotten around to submitting it yet.

This is fine, I'll check =C3=81lvaros two patches, if his patch is equivale=
nt
I can apply just the pinctrl patch.

Yours,
Linus Walleij

