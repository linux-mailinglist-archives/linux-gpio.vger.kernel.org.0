Return-Path: <linux-gpio+bounces-7542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACC90CFC5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 15:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9C31F20F0C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B1815FCFE;
	Tue, 18 Jun 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sSiIw4OK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE615FD03
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718715070; cv=none; b=rbHqGUFu07wu8mQBVMQRq7CHOmQHE0bdmX4c8vNaVLMwvQXDrI9Gdqz+/PA7WpHAHmaxBuLGrLE2Z8cAOl3mQIh4FUq0+UQYAD/1m6XeQ6Xw5dRYtiqSwtcyldJbhMCxgw83kw+SBFlsYWHuccv0RzBwpEvEfjQ2Nv0RAsfFLcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718715070; c=relaxed/simple;
	bh=uF5ZFn1MuaQXkgdPUExdYFF3srBleOHLlC/tZBYzGmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=sBSVGhozaJFppa45mRiXxxCEOFRez5Q524FsojR5IqU5DrCY3cXm5E+cKtHfxId4wRCNM3hf3bkJlFrGld3FAUTbL5fkocZuCXspa77GYZ/7ItfoV/Ev3O175A+We7zeOgkaIq3ojaA3I2NG8V8FVVRubQNL0qjC4nurul9QCD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sSiIw4OK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c32d934c2so5799160e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718715067; x=1719319867; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54+Eo/LVJRF3kfpmwpcFaWiseOLh0OIeZ4ykbGjRcKM=;
        b=sSiIw4OK6sz7xlKMy+dcz7vHWPSEHFWwee3S2ULKY+239pWD6qstEHEw4CfdwiVPou
         +J9fbn0fCLYDXSGrUHv3bnGy3jf/jtIkHM5y2B1h7CPblFIVSuzcBVKxp6EKOH7ZIsWj
         VTLSEjpM2cII18YEfHbbU1V4N0XKLUZ0+dgUUssuBQoXQ7CHFUl0P1wulh0DyPpoV9Bf
         2te7hvOJHeYM1H30Enw1H6b7lVv4IJ6Yq1582qVkHOWZTHybpP7nQh92xKqygzHDV1DE
         mhNZ3pSz/16gy2u87QUujsIO1/V6BGVEnkjk3Nk0MqPVQxpm0qJf5QRCX+TIxznGd2xW
         nxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718715067; x=1719319867;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54+Eo/LVJRF3kfpmwpcFaWiseOLh0OIeZ4ykbGjRcKM=;
        b=e0/71W2wpxSZPcc0X7l26D5uMHHqZbwaMiiQlBXr3VtIoeSI91LunPEMRzmcfF30lF
         gthEYA6gOaH+cLciNLzYGApVml/BWAhU8UUqG18E/YWUF8kVQg5gqAWtcJudGjfhl2f7
         GBjYtbxX7pv2/00toyjLvjHBY2F44oEzlYCjVouKW5T7EmflOaJbk1A7obXCb7JEvRbN
         JPRYgJc5TvzoaABRGVK/JLjhcd3m/J+WoooXKKWpHDFNcRQC8AU0Hrt2trfNT6uWpaiX
         JkAQxe6zOTpwWKr/lBRQeJPUJx8TXAPEGLt0l7y3ZwAZTuIqInWCHMxrn5flqlTRSiRA
         2ESg==
X-Forwarded-Encrypted: i=1; AJvYcCV/LpEyu34ziTW5VZx2oh9ZUPzFJGezuiJaMRSMckIrtRs1tze3vSoL6sFH1YHLmDPlltCR5d7kWygEgPuKXdng0QIOmCvEX0zrfw==
X-Gm-Message-State: AOJu0YyMqVTMqTo3pD8ItjJZh74qajnMLnaqhVR80eXLkQoXvgdCw3Iq
	HYsQKwyI9L+CQlunPzvKJHpW1j8Jf0IK/zWE/CciHbjHJOTFQ7H8KZM315Amqs+brzPGonzwEtI
	0Wuk6pUNRbu+gBbIoSKfZwXigScuIoZ+Pcr4NMLg74+xrZ0OZEag=
X-Google-Smtp-Source: AGHT+IGGpskF6WxgH5a2LFZlhA8ClFYD/WRffkI42oeSbQsIHgrks0hi8KL6Kb06PDgQHBC6H90LZisqtHNXYzFlrVQ=
X-Received: by 2002:a19:5e49:0:b0:52c:83c2:9676 with SMTP id
 2adb3069b0e04-52ca6e65414mr6747554e87.20.1718715066987; Tue, 18 Jun 2024
 05:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com> <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <3h63msxchuuxqa5liufoivss4raqtzjlusjn7ufti5nyjkshcb@pqevlpuvrm5q>
In-Reply-To: <3h63msxchuuxqa5liufoivss4raqtzjlusjn7ufti5nyjkshcb@pqevlpuvrm5q>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Jun 2024 14:50:55 +0200
Message-ID: <CAMRc=Mff2L_M=zkxQTqoFjMxbi4ZXBHPxm48UGnYFEnwfDWFHQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 11:23=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > I could see it using configfs instead of DT for configuration and iio
> > for presenting the output but - from what Wolfram said - insisting on
> > this will simply result in this development being dropped entirely.
>
> How do you assign a GPIO via debugfs? I only found the out-of-tree
> pwm-gpio driver[1] which uses a GPIO number. But those are deprecated
> these days, or? Any other driver doing this you can point me to?
>

You mean configfs? Please take a look at my proposed gpio-virtuser
module, it should do what you want:
https://lore.kernel.org/linux-gpio/20240613092830.15761-1-brgl@bgdev.pl/

Bart

> Thanks and happy hacking,
>
>    Wolfram
>
> [1] https://lore.kernel.org/lkml/1301630392-20793-3-git-send-email-bgat@b=
illgatliff.com/raw

