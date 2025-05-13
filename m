Return-Path: <linux-gpio+bounces-20075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C947AB580F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 17:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F7E161EC6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F0D1CBEAA;
	Tue, 13 May 2025 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EKztga63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2DC1D555
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148889; cv=none; b=I0OUxvXdTkA3Ubn1jol3RVO6u59XyzZTSH3nW86olLfgudTCtXkueFDpFjrRyBqhqtlUDGDZMFlmsdkNI74meyKj4AVP445YIIBSeE0VRe6d+9mlm4wIFmRq8WWfTf/xHUIjPqSJ3P9iEOFtvTGOsW8BUsTbT17jqVokbU9LASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148889; c=relaxed/simple;
	bh=cyC24FKRZ7v1DWNmkTR+FPbI5tSVDOpMoBY0cH2e8cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUF0OftB5aHxsuVYd0h2ekLRt4Kb+RKhXdz9kJasYSpCnl6CJA67W7fJg1VRC2mABLA6jrJeQgAzmwC0ctfb6FGwdEiRZhDujtnyTqxiHzpj5JUaf0wgmrdR34gk3sQ4E816ROUAr0GA+W/fOI4wlsaM80SYVGMOGr/iaMPkokU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EKztga63; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso4710719b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747148886; x=1747753686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XC0wSA5fBRbT0vh1GnpF7biy8ZuXb9lHcS4DgbOrdhY=;
        b=EKztga63EyiJTYKfFnRqAHuN0E+W1hXyYovQ3tBGpH58H8bmatHUBtPdtjrI1Fopy9
         r3BD8GD3o+aSPV4rsnVSaxk6vAentHGdT5tzD5W+a06UrBAVvnrGLh4Hb4bOiC0wAwPn
         7bu+ptQH3+y5ur9x+xE/3A++ZE7LbUiYibZ+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148886; x=1747753686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XC0wSA5fBRbT0vh1GnpF7biy8ZuXb9lHcS4DgbOrdhY=;
        b=OmrgtzLBK01fuPLhvyot29TNygymbZLXEEaLeJzvmSmkr7axSug8vPge77Z+O1nohw
         s8MSC0IxI2U4N96CuSxx1YR7aVlR/xS+YjL0/zSbT0UtDXXltnGh7trAStR7W4Zbb2gG
         Jxgx6vG9ZbigL37IMrg1CegeIz9eKOWBxv5orkJKUsbYMUR2vpnvFJGfwQy9MKgypD2S
         vSxwKfXzkV55VpM6SalnoAabYL8zph0EDqsou7KWvGIAH9X79eBozu+EuLymi+EcmGrJ
         u0dxIoUgZppW52p72XnNAfh1ZVZFDUnzGxJxe57lPFHyqv1JAYTmGDQYyhi+wJiRc8p7
         +ROw==
X-Forwarded-Encrypted: i=1; AJvYcCU5RCJ6QVlXwHKe+X3TgMjllPKgj92o4Y/Cvc+Fl76rmkXSqKz+w0wK5Kq75Sr5t9XFd8IKtHAj/NJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZgNYevONgX1VsWK1MFIJ4l+T4FYqzGSCpHaBe2rDFo9gS1yN
	s3cDtdamHMKESvW2uE+3agAXXUncH0Q1aNy6fJoY/13yWyKEWc2et83Ub571wJUWkP/oTZtogDo
	=
X-Gm-Gg: ASbGncs12V6DmLqPT4+5QmV3wbyMb1/++zKOjo+XuGm72T8VFkSisq+oU0Fr+0BtH1L
	nGqtmBHdPt4sPJKkXFN9n6NJYm0ALu2gsY3WMpxSubIkmFgBNW/XK6hEjz3g0dQJfkJEDE7smXU
	VMfqAWRlZ2YTIzZx0xHc0l3USShzA7VEK3XoG3a5g3SF2JEgYnoLnG1AQWvblukkMgqeN/2Ekxt
	mqHq9dM7YNx1xgVjlH0i2qIV9/v7KS0ft7sPyi4o1m/kBmHeGDnhqnbETkMqD7Pr/T68CoqhdIn
	p6vIoeGBSGisFqMPpAmYImOzPMTz6W4kVjNdIGVAtqZCU+sduxwNeUQAEuYDZ2nJ5E5IWSjwEe2
	Hy5ugb9Z/gUS8w68Tb9U=
X-Google-Smtp-Source: AGHT+IFVA/Vxrw4UnkqS+PYSyEOU4K9389S8ZOHU6xSNqVcNtZ2HS1hzTFesiM13D1bIr0oIvzIKJw==
X-Received: by 2002:a05:6300:6141:b0:215:f505:b49f with SMTP id adf61e73a8af0-215f505d88cmr2632692637.14.1747148886183;
        Tue, 13 May 2025 08:08:06 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349dd1fd8sm7398867a12.26.2025.05.13.08.08.04
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:08:05 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so3658271a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 08:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMRgkML8fIsolBbCwVvEaTAJhg5rGLP8XispMT3wtllf/4HdZoHlXp4fjiN4h8XU85+gmKYtOjt5GL@vger.kernel.org
X-Received: by 2002:a17:903:2344:b0:22f:b327:a720 with SMTP id
 d9443c01a7336-22fc918fe81mr229546365ad.39.1747148884248; Tue, 13 May 2025
 08:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com> <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
In-Reply-To: <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 May 2025 08:07:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
X-Gm-Features: AX0GCFs4uZMLXjCSAO0m1e3AtYaXg0I7KL7nfpg18FrQ59BKSujflfXbgJMJkH8
Message-ID: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 2:27=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Dmitry,
>
> thanks for your patch!
>
> On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > +       /*
> > > +        * hog pins are requested before registering GPIO chip, don't=
 crash in
> > > +        * gpiochip_line_is_valid().
> > > +        */
> > > +       if (!chip->gpiodev)
> > > +               return 0;
> > > +
> >
> > I really dislike you dereferencing gpiodev here which is (implicitly,
> > I know...) very much a private structure for GPIOLIB. Can we move this
> > into gpiochip_line_is_valid() itself?
>
> I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
> can benefit from the extended check.

Any chance we can get a solution landed sooner rather than later?
Every time I test mainline I have to account for this bug or my device
crashes at bootup. ;-)

-Doug

