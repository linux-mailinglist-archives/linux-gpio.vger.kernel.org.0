Return-Path: <linux-gpio+bounces-18478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECADA7FB13
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 12:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F343BCE12
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3611266EF6;
	Tue,  8 Apr 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hmc4Gurq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86020266585
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106293; cv=none; b=ucN9Jk7EtsjlLAXAsZ3yr7aWzwEvPX5DrSR6hYqwq5eLLf5bFBDsTUZj51WjyUueivwoSs7+ybelsPGxq7VHXszn3wuHyZ9vR6ihE85sVA5uXAUkwO6HzDBAAaV1FOXk7WoiWMgY4nablx6rLyEr/WXH8zChtBXveW26zu7LpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106293; c=relaxed/simple;
	bh=E2QgDpoxCcKb2INHDykh1htW9Vy2w5OaINdf2ihN35M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJoqOc20jGpw8JTkUuD6JO84wNf8v1fb0eF9SsIgbqkqSudCZQi4B+Oh4XiTbowUY8nZGVqWgDZK+igfIUM9JHTeidLJ8mNyi/gnGCJbUec9ArgO2TLpIr/x+2UtbYKw0wYl+ReYH09+wYSjMRz+jwgzxCtRTzXJ24xXzev33W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hmc4Gurq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499bd3084aso5068421e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744106289; x=1744711089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2QgDpoxCcKb2INHDykh1htW9Vy2w5OaINdf2ihN35M=;
        b=hmc4Gurqp3AlHDlmaghMLd9g0yqXWJoCAsTiCjE+bbqPO9JI9UjVskvF/fU1f241yQ
         wEI/EYNV+yKIV/wG8qQVh3ND4x1CBZPNEO3JDzaMz1gKPyHvjzGlnhRYNN5sVClYDnRx
         oRmupejSjqgbJnqLHIVBOZTowlkFrhwyG9PfdCKBUGgMA0yC12l4SvJuzDXDxaVN8N+6
         y1/Dbql9I73x0D47iy6YhSu3wYjqluLrZ5V/SfgpMub0bZpR3JmoI954DtX53Yw7HGRV
         xawCUqp4dUYPR8pZ3s5EEwHdCQt5txKMbIBk7/O5g8E29zdJk8c61BvAsqfqbeHS0fY1
         up6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744106289; x=1744711089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2QgDpoxCcKb2INHDykh1htW9Vy2w5OaINdf2ihN35M=;
        b=vHgWyES+JNca5orU2gCW5rFhLZYAvPkuVdugbg0RtrRRGl3vWcQUYEUITw4doATr0U
         uRxOI83NetgwjrpuwsC/1z8uCCGPVZ1Btns/0g7qWvXoZJWWICs7y9015pvb5U2RlOHp
         NxOvFPBs0c+IJwe+dlM7Mwq5Vzloeb8ahfzfu9GVJx0oJV8vms9ZFDfRd5bGM1RHIoxi
         SlSPkNoDI4C9q50eiusfrQApozyppEHzaffJooT59rnGD9ctn8tk+Rth+HI7u1ED8ey/
         PR9jxzCktLA1qu6AWyvJS0pgLtXFmPHs7cPa/6IuvXIdMpvWLk9q5BnIR4NpemvXx/SV
         tG1A==
X-Forwarded-Encrypted: i=1; AJvYcCWwUGrHA3YgMUX9alD+kPhsrDIeQy9jO10/tOPdoUHzY/PcuBPrPf7z53k/BrG/K6Zd1r0XANqhPx55@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pDIvB2Q0bjPIc6NqiJH7tmxb72BbDcE6JTM4vU9zONXhXz3r
	s1ohXZ2AygsA68wcEqzxtPvmyOls156Ldh4CR5yBHdyvGdREexJmw0joCZ4bmH6Y/SGwQFq6cwZ
	zYbwucrtmhahD25k8n3RSYXFm8uryekw5Kuwyew==
X-Gm-Gg: ASbGncuUu3pEcJvqGdFozkH+ywE0BrGFJcAJB8htgdO5PHNGChhR6l5HtK/lTgy5kpX
	ELgfvsYyshjZWJpJWgMiKIG1nE1jxBgPNycnNDhHTu9JULlrc000a2jsV0s46DYSSSlYfwRmpaF
	ZQ8etALVysCjr2o8/mEJN9uV48r9GENzbhQW6FeqIOEaLWD61RsFrBG6cIKw==
X-Google-Smtp-Source: AGHT+IFx+bvhcS/ETnVr1Np3Ug4zUmPWJ6VvMwny/VNMHDECNGK0JObtu05hxR2rh6XM/f3a9h/6JQOpVobQ4HLmOU8=
X-Received: by 2002:a05:6512:39d2:b0:549:b0f3:43a2 with SMTP id
 2adb3069b0e04-54c227dc8cbmr3950486e87.40.1744106289554; Tue, 08 Apr 2025
 02:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408082031.582461-1-jindong.yue@nxp.com> <CAMRc=MfuHs=7vda2CaMzHfVDXe41TV3u3ezPmt38xJ9=8JD1sA@mail.gmail.com>
 <GV1PR04MB91836DE75CB528C1B9CFB8ADFBB52@GV1PR04MB9183.eurprd04.prod.outlook.com>
In-Reply-To: <GV1PR04MB91836DE75CB528C1B9CFB8ADFBB52@GV1PR04MB9183.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:57:58 +0200
X-Gm-Features: ATxdqUEGEOr0dw204y3YmGV2yan7VL_T-GvaZ7q3qyHQO0_mJqqeqTSNoCQpObg
Message-ID: <CAMRc=MfakE0aKwD_udfP23UQ2nVL29GLiquzyv1b9qYGp+fgSQ@mail.gmail.com>
Subject: Re: Re: [PATCH] gpio: vf610: Allow building as a module
To: Jindong Yue <jindong.yue@nxp.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:46=E2=80=AFAM Jindong Yue <jindong.yue@nxp.com> w=
rote:
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Tuesday, April 8, 2025 5:06 PM
> > To: Jindong Yue <jindong.yue@nxp.com>
> > Cc: linus.walleij@linaro.org; linux-gpio@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH] gpio: vf610: Allow building as a module
> >
> >
> > On Tue, Apr 8, 2025 at 10:20=E2=80=AFAM Jindong Yue <jindong.yue@nxp.co=
m> wrote:
> > >
> > > Change the config to a tristate type and add a module license to
> > > support building it as a module.
> > >
> >
> > I can tell what the patch is doing from the diff. I'm much more interes=
ted in why
> > this change is needed.
> I am building the vf610 driver as a module for use on the Android platfor=
m because the Android kernel (GKI) doesn't
> contain board-specific drivers, it requires that these drivers be built a=
s a module and loaded into the system.
>

That's fine, just put it into the commit message.

Bartosz

