Return-Path: <linux-gpio+bounces-4643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2E88C523
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 15:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8883A2E065F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 14:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A1012D77C;
	Tue, 26 Mar 2024 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A/WdkJ5m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D612D776
	for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711463340; cv=none; b=R7zbsRbBKVdN3YLHJx6TNDIkKRIAFCkF3MNKl3HZ70HCau4+O6ibH9HdJ8lfUNuYXSymn27Ko+9JM96zc84sSMuEShZQDxLPc6VqPWvcSV13BvtRIuQf7iZqhFms/lMbISBkekOASc0G4D7taYVgf+C/D0/Yrh2ep9AzNRLjGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711463340; c=relaxed/simple;
	bh=VDm5OqUK2VCUOIeEHhLOtzzoStp5jjzj5YY1ln0iJGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIGuMeunylRHvtCcjSCk2nb2Pd0J5z8f1uJlC6lf3y2MMDvN1oaMOkZRDoBdUUeOkoY9YNnmp7h4GBK31MACjnDTZEDjUjm4YgEuTG8rtNuvSojYTiJEyMM8W3q/fWWnN4JM9NeM5FzpjMBa31VAmP+pJ+HJKTBmrjUMCTfuEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A/WdkJ5m; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d6ee81bc87so5621101fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711463337; x=1712068137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDm5OqUK2VCUOIeEHhLOtzzoStp5jjzj5YY1ln0iJGc=;
        b=A/WdkJ5mjKzJHQx9O2PJPzQp974JLD6gyIUyzXLQ/nNccT6uaJtC8X0ErAfsupNviH
         KFyWrNXsLsoZRZibyhGHAPRh8gAQZS/2afEiMZEXcLqE8cRnX1cU2Z7XVSMXnPXHE1gq
         E07LY+swjysgLgbtarVZ7e39wKkniRV8J9gg/LxOaT8dARVUFT6F7zKqFlhtQHWKIad0
         80uRHIKDkpre+xqhj3s5/Z5FmMCAk0PRfthyBdg2Mn/d32PP6WvS+7kmIYjOkWFdmh+j
         pmzEIrU+oZ/SBOqjsWydIlLTAnlQwNyw6Mt9ratxVGTlEjjR7KyQ9W9IrpynagUH6hwH
         o3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711463337; x=1712068137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDm5OqUK2VCUOIeEHhLOtzzoStp5jjzj5YY1ln0iJGc=;
        b=ZoA+uQh1BO5eu2iNSA9BdJuMjRozruuR/7p/5YdSjfuoFIFe5YDWuDK3eItfDZ96aO
         Rb1WrszybGRzRrKGXReXTxBDVr6cztNXxLtKu9lxH8n6Dp7gtPO3GB5iX/DTa/pLj6BZ
         Spno9VW05zeYyaEzLLvo26pMP68WNI/FSHcbO1Gm/HkxEWUr1JJwgyTHYP8bPoQM4X0S
         hSCfVwdo9CppDS74fJZP5FZ819w4Xj0v3kOViIgr4uk25Egs5Qr4lZiKbnvyKW2n3kr1
         UYVQ+xOxH1uFMIaoHtfRyPGLQOqzyxTGzPk5vsp3gN6n/1XwbMxUg273nJCFkazdT8JX
         ZnMg==
X-Forwarded-Encrypted: i=1; AJvYcCVDwbOVhs7oyGpUQQLuDRAn6DcK+S7IuqcvFVojCLePXNAzubIEwve8Z3iuy0bqKtnOkbYznfcTYrZvzyCoe8Vw77sJyUGikYnTIA==
X-Gm-Message-State: AOJu0Yz/urOE4OyotEuGmmHUoO2OTAW6Ip5jykopMIdyc/hzNfHFARTX
	6tnb0otAI+0XsiNiJcFFLeMQSWNlrkkPZDzF5CGpLxFmdu3chBeZAU8CMOPuVkyQZqDkNGo7mYb
	VwJDTn9qOyTdzS9zRYeTRoOfEnXC9JgzYjWNzmA==
X-Google-Smtp-Source: AGHT+IGkQlpttgK0hyhjxr7z0eNqaaRTVNzdKS+ejS5IsvWvAvGZq++m2w931zwUmnkhibDy6uSvR6eE/Oni6hKEL6A=
X-Received: by 2002:a2e:b0f8:0:b0:2d3:1dcc:3b25 with SMTP id
 h24-20020a2eb0f8000000b002d31dcc3b25mr6755539ljl.10.1711463336768; Tue, 26
 Mar 2024 07:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325171804.3375280-1-andriy.shevchenko@linux.intel.com>
 <20240325171804.3375280-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mcf0b0HwAcT=ZQ31rdsuWSDJkg=r9Z6Ni1Tcrg-KCsXsQ@mail.gmail.com> <ZgLa_ElceniDrlCW@smile.fi.intel.com>
In-Reply-To: <ZgLa_ElceniDrlCW@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 15:28:45 +0100
Message-ID: <CAMRc=Me+6f83QPdsBtP_9OnxVr_RA6zT2aQa3=VhR_Lcv-Y7qw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpiolib: Fix debug messaging in gpiod_find_and_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Ferry Toth <ftoth@exalondelft.nl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 3:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Mar 26, 2024 at 12:58:40PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Mar 25, 2024 at 6:18=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > I queued this one for fixes. I will take patch 2/2 through the
> > for-next tree as it's not really a fix.
>
> But you asked me to sent them both at once... Whatever, thank you!
>

And then I realized after a second look that it makes more sense to
send them separately.

Bart

