Return-Path: <linux-gpio+bounces-25301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA4B3DD1B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7FF3189C718
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931CD2FE06D;
	Mon,  1 Sep 2025 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ohFsw+8r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D51DEFDD
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716933; cv=none; b=YgQs/hFXp790LSP+IIaH1aHhSJhK8kampxYWdqX3hE66LJmYd39k57o8DFrhljfdtfpxH6LLY3X9I6nF6KqLTP8QLecI9hTv/oY60jcdVLEcifk8H8oOmueos8FYoiEWZf54FbvkFj7rmtU6exnQGSbBhUhq36s9lKC1eg3DiAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716933; c=relaxed/simple;
	bh=OOAB7G9n/2hsZ0P6Hhao2xBBN7OqCLCO8ZYMEN1skRU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2BgCXMo6FfCCwqwig23huw4l6trpdu8x10gm731ZvRYN8iRf+Gpt8XrC+FH/RhUtJscWpnsB1jIP447z5YJ0N2e/v/0VgR3i86A/D3fdafJRF2F0Rysj5naPxglaMBN2jex6t4utl6ru1VZ6WR6uNt78Gk3Vn02FwYS60PGrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ohFsw+8r; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f74c6d316so1398155e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756716930; x=1757321730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOAB7G9n/2hsZ0P6Hhao2xBBN7OqCLCO8ZYMEN1skRU=;
        b=ohFsw+8rAOKv5sLLPbsUC/tu/hSeKHDiOVkkiWol3CQt6RsjOAHO1VHkoSDbjxy/q8
         EA98K37YXwTa4+KvCBCTCMSXZyf1jCocoZEI6dJl01G/IjwVawcYPkn3WMzee5UBsBrL
         c15TKhfVoq724NSKjCKadmuAuuklIoQ3CeKR4KOoPTp99dY93P8FW9B0GuUIRKz6GLfQ
         ELF8B5ak2ZoBKd82Q+4tZifaOpQQYu4HtVhaEuDk3ThfcUZgrneYWPZoFjksku3I7/A0
         B6sszYC0GDS4aYJUGXC2OJygo9cWoZmbk0BnMWvlFqSoiKEA+2DOn+21gohe5Upkd+5z
         YtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716930; x=1757321730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OOAB7G9n/2hsZ0P6Hhao2xBBN7OqCLCO8ZYMEN1skRU=;
        b=TvQA7nNCxNmA7hj+zGzEy+m9easuPbu5sJ55tX8fFyp9s7N3jRjNldNnQvjV+wTf6+
         Pa4e5rej4u6P+x13jf35ZEBIQMXHpBJS8y/gvVsqkcScHVTLhYOrB3Hws2qzPqs6WWMo
         H1WRsChrX/HLI5rFWGxCAb8qKvN4qbCGBO0a8RfuZseq3iUSoHBC67lDNyeDI4jxRQPT
         p92o9GbJrLU6yJu932cnAaEzCiwiM7YPelV6ZOKA7HjFpQ/kunu0/xmYR5/gC1XCopMK
         B21idwL1FGxp4/ByGZ3QZRtHS29eYaD8mHAfT2DR/fvTE3XdIxroO0LvasWi6SqWlP7i
         XRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8f5K/d/rsaNhbjN4g2LXRT3F7Ga7aT0QIR1Av+O3lGI/hnrMIY/uxifaaPiRI1smuLQO9y86SOkSh@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGr/WgAKinoEKTIBMJF3pmKwkWbKBLWC0H+AoAYOWDjRmgLkL
	/HYW28aFJNdWEDBDzAr/LomcINBG6X0K4Xr42/jQxcJ6Sk/6oj/BeVO0zIX/ViXgHZgQaAi6MR9
	sC3PA0YC8Xa8Cqvz8QxeReOHlMP7ZdkVbg4JVdawX/g==
X-Gm-Gg: ASbGncvuMj6upVeolKBDniSEym8Jmb+soXcXg442akW9xP9Uqll7VkDdX1LuxgiTI4Y
	wX0R/KhGWsIOl/J7Ztme1v1w0EEOf7FTFHdf1eRgtuvfDIK+waxTJdgLZWE3sL0NYa8X+PtSHn7
	aZSMAvtT0I9GQT+785qMWB9cGGFdZd4pZj7o8TxHYtpbF0xX/7IsPIzjAuVq4yA+tLuWRN/7k9O
	XSkZ7Rgv9jmuwOXnuFPLOdJUaUn7eQq0TJpw5XspoR4XhfqYcBXsL3qWJCa
X-Google-Smtp-Source: AGHT+IHJKYSiuNDKUnzQmEIKfpZrhsAJlqPS0fGnhXH5tRx1POy1grVGkgaVCiDVasH9ouBJqfH2P01ocXKVrKkuhnM=
X-Received: by 2002:a05:6512:108d:b0:55f:6a6a:4974 with SMTP id
 2adb3069b0e04-55f708ec7e3mr2047715e87.27.1756716929899; Mon, 01 Sep 2025
 01:55:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Sep 2025 04:55:29 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Sep 2025 04:55:29 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
 <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
 <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com> <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com>
Date: Mon, 1 Sep 2025 04:55:29 -0400
X-Gm-Features: Ac12FXxB7Oi319OBJqAxgLUSgdBpknMsupe_z_UTHBIhDjp6vltsJiEYsceT02s
Message-ID: <CAMRc=MeAHn+r0YHq5KgT2xVUuT1uOodcTLhfF6fc668tgs1saQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Andrea della Porta <andrea.porta@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Sep 2025 10:44:04 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> On Mon, Sep 1, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>> On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
>> >
>> > On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
>> > <andy.shevchenko@gmail.com> wrote:
>> >
>> > > Note mainly for Linus and Bart:
>> > > I agree with the patches 1..11, but starting from 12 needs more
>> > > discussion. That said, I hope Linus can apply the first 11 ones to
>> > > make it easier to continue with the rest.
>> >
>> > I applied patches 1 thru 11 so we get some traction.
>> >
>>
>> Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
>> 100% sure the fix in this iteration actually works.
>
> OK I backed it out for now, let's give it a week.
>
> I'm just a bit jumpy... I really want this to get some cooking
> in Linux-next by now.
>

I mean: pushing something into linux-next and seeing if anyone yells, is a
viable strategy too. :)

Bartosz

