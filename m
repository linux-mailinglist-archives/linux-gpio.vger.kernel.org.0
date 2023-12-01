Return-Path: <linux-gpio+bounces-808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6A80038B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 07:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9821B20F1B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 06:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8BBC120;
	Fri,  1 Dec 2023 06:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hw3a/Iiu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D186D7D
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 22:08:50 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a18f732dc83so217446166b.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 22:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701410929; x=1702015729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLKk6oTrF6fAB77fJv+EXNaWWOWxqJcPWfPyun45kVU=;
        b=hw3a/IiuNAnC+jktLUMQwxMJJxSsuhtheUQy/QDLOtazclZckiUTw+X2XAr1zNv8Vz
         +PwbJ+MZGlWvjF3KJCVA/pL9fF97vLJX3ZbCNxFT1IrjrKcSIBN+1VUvbxI2+j/FFI9e
         y7HGsjc/Rv8YcPEeOfKY5S7RrEt7KT5JJQZ4wXDfOGWCuKkt56aJ861wxNgKsjMGjw8U
         MhNIA5v70TMLViCmFKoId+Exmp5FyIosp2jIeCBf/VlLzV0gJKUCG7vOx8mihueVVGqr
         Q2g+Y+/VJ53geb3c1dJBuUas63dqCzDi2j2/QFTlA1azWEIE/cH4j2Kv7rjmGrupvfaL
         40Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701410929; x=1702015729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLKk6oTrF6fAB77fJv+EXNaWWOWxqJcPWfPyun45kVU=;
        b=fU3KG7fzGNRhHvrCmc+Pz9v1VMirdAwr+3guPIcmIo8aWnyTT7zS3A6QHtsIWq54tZ
         6XD8neL9v0nWy9RFUdq13i5yOw975IdKpiXToHoOf0zdbz7dAOpLuX6dmdppfs4jZNQG
         yTWBJi94eIzzNFgltVJhS54fofdOh2xliOSXfb1E0XsA6as1YJmp1Xym8yaV+ZPzUQ1O
         vSt0Er4bqapuzy2DY+uCphiGckjnJJJBcJqOMatf9pFbJ2CYAIl1HL7jr5biX5SUmxNI
         Kb1ZlTYmOlFCes8Zu098aJMEjxkRrEceJbxfUMuTWNUhCvs8duBFtOnVGXgntwTUvzDy
         BSwg==
X-Gm-Message-State: AOJu0YywrHmj3w+GrkRiGmpOis4GYMAJUWlSSL1P1xrVE84dOXARry/V
	ZiSTlsr2i8XlSbwzoA627lj5J/OiGIBvGZ9xZFDiTA==
X-Google-Smtp-Source: AGHT+IEzyszR763EpzzyaSNEQ3HbEzdWwIzjFHJIxSWdGQpefK5Y/sMDWH53RjR7RUG4YRs1uqkUSBiJJIziU8PqkuU=
X-Received: by 2002:a17:906:738f:b0:a18:5ec7:b8af with SMTP id
 f15-20020a170906738f00b00a185ec7b8afmr702085ejl.29.1701410928802; Thu, 30 Nov
 2023 22:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110102054.1393570-1-joychakr@google.com> <CACRpkdZ9RHcHh4o5g62ywK0eQHpLZuGUF0Ud6jogk9Sfqe4krA@mail.gmail.com>
 <ZVQkLqDB3KtOlIpK@surfacebook.localdomain> <CAOSNQF3QeFd857RCJE8wfJ=__-K7Bi4vfMeTVP-+O+LJ7y9SmQ@mail.gmail.com>
 <CACRpkdZ+UMOqatH4oOusdaX1ieeH2TtpC7VbX1wf+tzGDSfR3A@mail.gmail.com>
In-Reply-To: <CACRpkdZ+UMOqatH4oOusdaX1ieeH2TtpC7VbX1wf+tzGDSfR3A@mail.gmail.com>
From: Joy Chakraborty <joychakr@google.com>
Date: Fri, 1 Dec 2023 11:38:36 +0530
Message-ID: <CAOSNQF1cwCa9hPNQjN3g5b+nMs2qx+H8057aypH+GHaVn29NQw@mail.gmail.com>
Subject: Re: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
To: Linus Walleij <linus.walleij@linaro.org>
Cc: andy.shevchenko@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, manugautam@google.com, aniketmaurya@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 1:30=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Nov 16, 2023 at 4:34=E2=80=AFPM Joy Chakraborty <joychakr@google.=
com> wrote:
>
> > I tried to place the calls to set the pinctrl states after driver/user
> > callback  based on my understanding of runtime code so that existing
> > users do get a chance to set the state with any special sequence that
> > needs to be performed post which doing another call to set the state
> > would be ignored in the pinctrl framework.
>
> This makes sense. (And also is in the original commit.)
>
> I think you should actually over-document this by also mentioning
> this in the kerneldoc above each of the *_try_* callbacks so
> users simply can't miss this point.
>
> > But this only would be possible with the assumption that even in any
> > special sequences executed by users they set nothing but "default"
> > state in runtime_resume, "idle" state in runtime_idle and "'sleep"
> > state in their runtime suspend callbacks.
> > And like Andy mentions about "->prepare callback", if there are
> > drivers that are setting pinctrl state "default", "sleep" or "idle"
> > from any callback but
> > ...
> > int (*runtime_suspend)(struct device *dev);
> > int (*runtime_resume)(struct device *dev);
> > int (*runtime_idle)(struct device *dev);
> > ...
> > it could indeed be a problem.
> > I'll dig into users of pinctrl_select_sleep/default/idle and see if
> > there are such cases or if it could be done in some other way.
>
> It's worth a check but I doubt much will turn up. The "idle" and
> "sleep" states are simply not used much in the kernel.
>

Right, I will look into this.

> Your users will likely be the first.
>
> So which hardware target will use this?
> It's immensely useful to have a good example to point at:
> that device use "defaul", "sleep", "idle" the idiomatic way.

I see some upstreaming activity on gs101 SOC.
I think gs101 and follow on SOCs could use this, I will find that out
and get back.

>
> Yours,
> Linus Walleij

Thanks a lot for your feedback
Joy




Joy

