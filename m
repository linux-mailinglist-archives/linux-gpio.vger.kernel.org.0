Return-Path: <linux-gpio+bounces-12559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7C9BC99D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 10:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B6F1F22E36
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8151D1500;
	Tue,  5 Nov 2024 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXZ94Ahh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8D1D0F5F
	for <linux-gpio@vger.kernel.org>; Tue,  5 Nov 2024 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800301; cv=none; b=oD3Nk46wWEeuUDCdDYk1k4gTe3t0O3DUElsnNpxYUWEVB+fxaVlOf8D4jXxZRuEPajoSdorBYZFF2zmYnRMI8TaHW6QoXT/I4xn5UflDwd1pT7nHuoE27Gquqijxrvptqv6lm7DRQAg58IX9UqkMpk+sYPCdDMo/WOlszLpfoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800301; c=relaxed/simple;
	bh=VcfevScir1ded6+EyZ/KSn3zGVHyhYtpgAA7MtzAIy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMYDjOlsNcBCWEhnMyKiYOO4ZITxMb+5FuZdDek3IODdXyIja9oM6il+XKZC4ZZewSpzR/ddhx8vyAtNbrdAVh573NerKhYuxgPz84VRD//Sk1i5u39js7wf4WLFDikisjG3FDBfwxA1RqhHf7KZTUoK5hdarNAdBlmSSIs53LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXZ94Ahh; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb518014b9so43963731fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2024 01:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800296; x=1731405096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV1vO0gWyxANVgu/3dOUhT318ropJltP5B8W/VjUkQw=;
        b=QXZ94AhhTU0MlvfeWf2r6DReHet+ubdhiGGJMrge3zT+3eCV/mHdztNbwvTgIHJSgB
         cY3Bha0Uvj/hvYopvraQ/oZLknQmEtrxrBgFq6VH56KiCsyy7U7UnwFsoKq3Z4dPXNZS
         vEfDeh3KO4pTx5mK8bUZZGhqxzJNQGH5tZH2AfESb6s62V11+Sg9l/v9HFKGHdhbM4+o
         hroZeEFxUEXsEAdT6A1BBaeEN+ZONFpNgBOx1bZFgECeOhOwy8gZZazEVhBVwsjLg51V
         XUh7S9ubGeR7XaD5ZgX+SY2mzJvooHhDwq2IQvNhiMqNYxuOAhjT0StUyO/Iy4AxM72W
         T4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800296; x=1731405096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV1vO0gWyxANVgu/3dOUhT318ropJltP5B8W/VjUkQw=;
        b=mDEsibp67fwq+iJ2FHVp75MqQ1Bb3IvBUJ/IV0E1VDxY2Ly+ljqbbPcOjmwoBcxmsO
         XcgUg6HejYHy/WOlDY0PnKqzpwhZOADA+PWEBNHWlwhm7nL1yyKBnFccAwucMRnxOz0F
         E904gSQPlp/5EzNQ1fLsK9kO46MKIQ6TGx6dQCmEzUvfqCHOC+4As7TwcDHLHxCtdpQX
         9dW70EmA791bSRzSYLhw7dA7ys97Yvvi42SGb4H+DDb5TfXkYRi8B9r+hX3hFNqhDdq4
         yItl/dQgC9mfGyru7ZzYxjQ1ZCic9QEUIPSiqKJ3cBxGFjLt6Pkh1HmdIvMHdmpHjHcz
         I4GQ==
X-Gm-Message-State: AOJu0YyoA0D3LoN11luSSdymJZExMnbJqL+OeZf3eU3mgJb9NV/duG5G
	jAXoLK4uyVVN36vC6G9xfOFqW0g5crhlqgR0X1QkanR47FI50C8n64OzcqINr2uZbpzYaxx5zbR
	of3+mYo9RpHHca9eV3xbLxYKr3EDKCOZymI3amQ==
X-Google-Smtp-Source: AGHT+IGfvxVN6kMuLf61m637YEqs/KbHJqnF5qOgJvfMdJBouqUbqVFlMihUbq7dQPNYw3uNjsedGxnkWjbr0kkq2Cc=
X-Received: by 2002:a05:651c:1545:b0:2fb:4ddd:a8f0 with SMTP id
 38308e7fff4ca-2fcbdf728d4mr181151701fa.15.1730800296060; Tue, 05 Nov 2024
 01:51:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730726328.git.geert+renesas@glider.be>
In-Reply-To: <cover.1730726328.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2024 10:51:24 +0100
Message-ID: <CACRpkdYsWaX4nFC2uA+MsXa8vx1gbaTs7VYhs01qm0sMWbF2CQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.13 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5dcde519a067ac5c85c273e550dde1873e2199=
bf:
>
>   pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC (2024-10-14 10=
:02:13 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.13-tag2
>
> for you to fetch changes up to f407af78c8d3b6035f81152b15ad67063f42514e:
>
>   pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell he=
lper (2024-10-25 10:43:18 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

