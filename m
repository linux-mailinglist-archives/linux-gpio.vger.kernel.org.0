Return-Path: <linux-gpio+bounces-211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08C7EE808
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 21:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A285C1C20A01
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 20:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1BA3158D;
	Thu, 16 Nov 2023 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxTSa0Kw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C251A7
	for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 12:00:55 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-da041ffef81so1283085276.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 12:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700164854; x=1700769654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok5oEYyXACKtRAnxSj7shUh1fHjt6/BETulwYHET3J8=;
        b=rxTSa0Kw3So/e2V0ZSuwxBN+YlltRjnq0Mp353ju2pJq7THy8PU6SqEVg/Zuvj1qor
         cC3ae9ZbsqgdyI0FYZ0mnedug+F3a0FclZXhQFaa2y4KKPGJFdPCBrDcBk1P9lRMUxG0
         a7b7jEjKjJ1kK4neYsh8sktM432093AHhJFSadE7MHkThoGtmDlg6i67urlpXHr138uZ
         cv77MDy04r87QugjD6Mtezu2JMUAehk4f8xZ1p6QlnS+uBbzMckLkhGOyaTplwxU3Zdg
         j07RHPpe1Vdcv++U0LUbQ1qCv/8+i8qPtYBERxpsZaEnWukErLPZ+HnVls2u7A5ovsTW
         +Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700164854; x=1700769654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok5oEYyXACKtRAnxSj7shUh1fHjt6/BETulwYHET3J8=;
        b=vbJnW+2LdGj9653lFBVtOzWvS9T05nS+ZXo/+wb+BMKGiiECCBL+JfU996Djgr15pG
         f0ZfwLvExO28M7CXexirXqLu6zyKc+xLRRqA/CufPEDFb84q7WQIH3+ywaO6IXga0zJU
         6ohrfdXdVyH37F7ujf4OieQRe5eZQtYfGQHFjCikh4GMHqTGVepmrXz3r5UqT8Xy0LVm
         Nh1EtzpGpD10/hf+Mrnq0MYNmUhMnScmx+I6sWInoQ9cO5WZRoQIxftfYMocb64lNt6D
         isdR++g4yZhKvP7bUB4mllToSBZTO3qzLZFPH7FzqVZxC+LYSdHTyBiug4RBMWq5Lu/O
         XURA==
X-Gm-Message-State: AOJu0YzaEyF6qbL/uRHq8Cut57mUiXtSHOay1VdmuEc3wyqsIX/0IRc4
	Yh4+AQvb5dYrSnDmbd3by8slRdSqIXlqJceNyIzP/A==
X-Google-Smtp-Source: AGHT+IHXHEiD1fCPxnFB64Qcn9k09uG7DTWs3UXXMo27GUdTxTDJptHZQ7snis+dTMetBqRJxQMLPrFWWq/2jADCkZk=
X-Received: by 2002:a25:48a:0:b0:da0:46fa:cabe with SMTP id
 132-20020a25048a000000b00da046facabemr15582651ybe.7.1700164854238; Thu, 16
 Nov 2023 12:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110102054.1393570-1-joychakr@google.com> <CACRpkdZ9RHcHh4o5g62ywK0eQHpLZuGUF0Ud6jogk9Sfqe4krA@mail.gmail.com>
 <ZVQkLqDB3KtOlIpK@surfacebook.localdomain> <CAOSNQF3QeFd857RCJE8wfJ=__-K7Bi4vfMeTVP-+O+LJ7y9SmQ@mail.gmail.com>
In-Reply-To: <CAOSNQF3QeFd857RCJE8wfJ=__-K7Bi4vfMeTVP-+O+LJ7y9SmQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Nov 2023 21:00:42 +0100
Message-ID: <CACRpkdZ+UMOqatH4oOusdaX1ieeH2TtpC7VbX1wf+tzGDSfR3A@mail.gmail.com>
Subject: Re: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
To: Joy Chakraborty <joychakr@google.com>
Cc: andy.shevchenko@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, manugautam@google.com, aniketmaurya@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 4:34=E2=80=AFPM Joy Chakraborty <joychakr@google.co=
m> wrote:

> I tried to place the calls to set the pinctrl states after driver/user
> callback  based on my understanding of runtime code so that existing
> users do get a chance to set the state with any special sequence that
> needs to be performed post which doing another call to set the state
> would be ignored in the pinctrl framework.

This makes sense. (And also is in the original commit.)

I think you should actually over-document this by also mentioning
this in the kerneldoc above each of the *_try_* callbacks so
users simply can't miss this point.

> But this only would be possible with the assumption that even in any
> special sequences executed by users they set nothing but "default"
> state in runtime_resume, "idle" state in runtime_idle and "'sleep"
> state in their runtime suspend callbacks.
> And like Andy mentions about "->prepare callback", if there are
> drivers that are setting pinctrl state "default", "sleep" or "idle"
> from any callback but
> ...
> int (*runtime_suspend)(struct device *dev);
> int (*runtime_resume)(struct device *dev);
> int (*runtime_idle)(struct device *dev);
> ...
> it could indeed be a problem.
> I'll dig into users of pinctrl_select_sleep/default/idle and see if
> there are such cases or if it could be done in some other way.

It's worth a check but I doubt much will turn up. The "idle" and
"sleep" states are simply not used much in the kernel.

Your users will likely be the first.

So which hardware target will use this?
It's immensely useful to have a good example to point at:
that device use "defaul", "sleep", "idle" the idiomatic way.

Yours,
Linus Walleij

