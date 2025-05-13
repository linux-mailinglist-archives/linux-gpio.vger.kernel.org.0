Return-Path: <linux-gpio+bounces-20108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7EAB5F2A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 00:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58E83A2EC9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 22:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DB820B1F7;
	Tue, 13 May 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chXfOkEM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638DE202961
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174475; cv=none; b=Owi/3bXB07FXTwpTz0c/EzdtIwO1urr5ySKgyrsY0dIGU4kdmTBRt+/w2wRsBoznDHPVa6F4PMqMcHViOzLQaxuZ4HZluRIz+xaKVFq4A+heaPn4tajKwD0j4NDuIFPQdiNoxeQ66xtxMMDNEha4WceRU5yMa2dl4ms2P/fDGqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174475; c=relaxed/simple;
	bh=vhrkQkIyemUKp8fVxGYyNtHLYIR+hrU6/oUo8F80CPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pv17VplGbALRwZC38M+A8C6G7ACSvDST12KbORv6Ynrdcw5cHT0hyAyhihmtRs0ldcDK0byipxlfXjbm/T54NGfZN32/K897aAseKwxX0iYMZUpbcDRpCz19yxAr90F7BctZmhZeCsZSl9bynk3L1Du9vnMdlC/hlhHhrRj2mP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chXfOkEM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d98aa5981so9822814e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 15:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747174471; x=1747779271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqRbrvay4EnmVnivzBlX8Lw52BNBODi2l2MrzYeUfbs=;
        b=chXfOkEMELL+idf2V028b8JwFQWEj4Zhk6bzKybKjK7k+ph89tCH22nDQSiN2j5hr4
         L3qykDd+x19bV5bv8+ArvVV/aWGwMK8AFNMwoC28/0Oh6BEBsrpJhaBsCzSFvLyYTsUD
         WjSO5PsLPXImJZ9ZvfybV0qpB3jUgR16Ex1mPlNZ00aq+NZUsJOhQQrCZLXqixNqGSrk
         R46o8o/TNEqqbBnhvjSFL4uVKY9YGzKEZFnhBGvaOsdV11G6RiWzc90QP14hFfgG2Ze5
         AUmav4F1R7KE/8IBCdEz+cDhxmvk4BBuIMnST6czVtKaKz+1JZHhSCO41WtmR11n05mM
         qyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174471; x=1747779271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqRbrvay4EnmVnivzBlX8Lw52BNBODi2l2MrzYeUfbs=;
        b=GYvviQiDr1EmwoUIwwV0k3meh3HF9J2ewARXtDi2vYg/CE4nlaUb7dYBYM+RWzwEYW
         ijn3+pL0cDkDEZF60rDAaHzCgcYraBgsQJmRGAlKdmi6BQ2VO/SJU5ZkfZjGf/fTTDZR
         7x0W3l5rvuhjZmOay3oJbt6EJ5cpI7SiSMdJHFSBDKQyYaYF7G+NUhGGyhqVWZ6sKPBd
         FxCxivcjBF+oIywoB/qwROtD+49YE4u2TE5ekCzDu42IDh0vOEG/TxI5BcKeJMX75xlH
         MacOIgFBQQ7n/92uO9aRX/HBkVZJX2WwQLOK7zWoBEVBMpHQNHrU2JrlfikE86eCLhvy
         ZShA==
X-Forwarded-Encrypted: i=1; AJvYcCWQtPyZqt5PyXkn0b+WDiP4v7JhxVMzOc+3dS6tOme16WVQNe1TPXTkYt/2NWWg0mMmoIutm77eCsK5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1bfL9SRa4IywKPuS/oS80YZZbfulfCkGNukCFreOV0nVaOND6
	+Lkkovq8e/C5Ut1/UgNdenJm8yvosRMmX2YH22fhetokl+vUUsea1OdDeAh41Zdp66M8EaGi8uw
	aM58ewzwhsnEH2ikvcVrkEPAi9g5KMefB5RzYBRtWmJ52RScb
X-Gm-Gg: ASbGncvXv4ZhWv+qyouyWnvl0i66ZFwDjf1izWyTdfNml/g2YkGviStYjfdyBsF4Pg8
	65HShuByGqVQxWH0+HfNT9MPGo/+PWRcRBdOvUEtLngEG94hHTAQSR7gEOYh35yNydyxQEs6wd0
	DKMwpulVQh4jCPwXstxHEKYzopg7tCq7H+
X-Google-Smtp-Source: AGHT+IEI/A53XKPhHlqbguLvNcAKp8W6Ajoh+iCoRNvpdC948ccI/NdQGUU5EzWJOfpFednMMrqlFQs4TL82VUi3Fgo=
X-Received: by 2002:a05:6512:660b:b0:549:4a2d:30af with SMTP id
 2adb3069b0e04-550d5fadfd0mr272022e87.25.1747174471470; Tue, 13 May 2025
 15:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
 <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com> <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
In-Reply-To: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:14:20 +0200
X-Gm-Features: AX0GCFuWZfUikEIaDZtRnObf0sfQM_9zpw_U81pI7XLMffgTeVp1Ek5AnjAJnSs
Message-ID: <CACRpkdZ_GP3hz1yM+cJk_6U5-tshgnRau1WKdx8PNgoMOZmcHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Doug Anderson <dianders@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 5:08=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Tue, May 13, 2025 at 2:27=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > Hi Dmitry,
> >
> > thanks for your patch!
> >
> > On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org> wrote:
> > > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > > > +       /*
> > > > +        * hog pins are requested before registering GPIO chip, don=
't crash in
> > > > +        * gpiochip_line_is_valid().
> > > > +        */
> > > > +       if (!chip->gpiodev)
> > > > +               return 0;
> > > > +
> > >
> > > I really dislike you dereferencing gpiodev here which is (implicitly,
> > > I know...) very much a private structure for GPIOLIB. Can we move thi=
s
> > > into gpiochip_line_is_valid() itself?
> >
> > I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
> > can benefit from the extended check.
>
> Any chance we can get a solution landed sooner rather than later?
> Every time I test mainline I have to account for this bug or my device
> crashes at bootup. ;-)

Normally at this point in the development cycle only super-crititcal
patches go to the -rc (v6.15) but I trust you more than most so I take
it this is one of those, so we will need to funnel this to Torvalds as
soon as there is an acceptable patch.

Yours,
Linus Walleij

