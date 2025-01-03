Return-Path: <linux-gpio+bounces-14467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024BA00AEF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CE39162300
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F661FA8EF;
	Fri,  3 Jan 2025 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4qhcprS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213717FE
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916213; cv=none; b=iFguYoWtYTdqOkp7Kkm47ruymUsakpL/2eI5g/jtuPa6v7oOrl8XwYBXpMHvReXUHsIKOvIdLU3oP3/AWR34Jk419KhjEBngu9FS6krqoAPpcmf9461S9pg7fp4oVSMxPb6Bnvfb4qRQOnUwbEL+iGTkGGNo2sczNc/ZamaEJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916213; c=relaxed/simple;
	bh=DUj7ad/ZJxw+p5OBuhaIZJmONWUMC1qCKTCzenjDOmk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cOdQa+H0Qa1gV+Wapup0UwOB986Ww8Oq2icmL4idzTAirDX8pAFF2UdFlXTfKTUXZzX1E5Cr0ipftGKjS5PokmkYKXD2ZNRJM//Xg2i+BNBAOeVL4D4h8kn06tguQ1MobYHdWWqhomrIEdJDFpfKLSaX+BOuJGpGydL3E+lRl18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4qhcprS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1062246466b.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916210; x=1736521010; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVQQStoCMCh5ZQf2wpqRjRAwYXkNtE4AQnQGQit4eyw=;
        b=b4qhcprSdXFlHXy8BmNqEDfmGk66S94K1YI/1Cfk2KvgGQot+Zd03cYeHyaA3pP8vE
         AbTZK4FhIFqxqH6D9q7rQzIt7NUC+VrOSV1sEwE3Kl+/Nkxma4vW9cdY2d8tlFGus17R
         MQ705Yi5G3p5GCp/UbqAZGukuD1sn6ScfpwZw89sytT8a+SPho+mgGvzDmJDlaR6FuHa
         lgjri/2hRHZv8ISlKu43NmEFjBrlDGPus+IEWnHhN+9C2GGGxlk2QWTJv/3b4SSJVd2d
         tNPVxGKUFpJpiYcqibRgVxD7ZqLXPgvcjBCrTYASOhFmZ56YLwmnne4pmZ/ZFIxOcIDd
         3tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916210; x=1736521010;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVQQStoCMCh5ZQf2wpqRjRAwYXkNtE4AQnQGQit4eyw=;
        b=Oa0BE7VKvXugymuWs+erh+GmmAwjUj52mjr6vNbr3D1C3qqB1D147+GFY1buNacpIE
         CUS3DVo64EmZDSkVdLnr3EkbtEB5jqwXcVPwdvR8WyWB0MIfOR/SO6iQ6NXd8EbYwgCg
         98I+ERv869tnXEp4G1HnmqEf2DRkDUkkYRyYCn4/L58G2GvaSUPCbi5J14ACY9XpjE6A
         +Fker3VxrelY/Ub/pBa8EGW448/SfNBcQqaYCAwBSCW59bWOyU4b1sB2D8MDZBNudhli
         epJDKlcFukzQKcDbevZktnoJGw2fKTegLE0fmETJ75vqxQEwP8CxtlUDby/3D6tTHRQG
         tOSQ==
X-Gm-Message-State: AOJu0YwfkP6/OmeQq5MthW1EP7Q5I0l/1QDcQPS3MfWA4REob8Bxp69O
	NM8ZZNOjG7ethbBmgxhL0I814KTKO9Cf/8cTYztxoFIPx+ZD4PUeWVhsxFU9d9w=
X-Gm-Gg: ASbGncu/dsDo3SdkA2VT9X0T9N5P4g+LeHbrfuv9tPTRAT1OZJlMy7Fjsen3qZY0l0o
	0vX0fNQEbFFreBAxtXdcDDKzQ9P8YrP6c30dYjhclkdJflwv8BezT1DRRtoXI27qC1rmKw/EKci
	rxBEajynahuO+H5hE5XL2eZcxjlFOo3ytVbYjOOdHpDm+lfSr5caW0CFgzz/DtA5ZbWNi89vVZc
	kIe1el2U64bhGI5ZKhw/kG1LJc+73ecvmTRkIqXWBg=
X-Google-Smtp-Source: AGHT+IFUc+RPb3szeIb53OUarVk4Xt3aOAZPruJCvbiyKGZjP79VJWJl4bDywJj1mP7ZQOaOdCIylw==
X-Received: by 2002:a17:906:f5a6:b0:aae:b259:ef6c with SMTP id a640c23a62f3a-aaeb259f285mr3991734866b.0.1735916210132;
        Fri, 03 Jan 2025 06:56:50 -0800 (PST)
Received: from localhost ([2001:9e8:d5a1:be00::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe46a6sm1898472766b.116.2025.01.03.06.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 06:56:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jan 2025 15:56:48 +0100
Message-Id: <D6SIXT7V6N08.2QGPML41DLNRO@linaro.org>
Subject: Re: [PATCH libgpiod 2/3] bindings: rust: libgpiod: turn standalone
 doc comment into normal comment
Cc: "Linux-GPIO" <linux-gpio@vger.kernel.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Kent Gibson" <warthog618@gmail.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.18.2
References: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
 <20250102-lifetime-fix-v1-2-313a6bc806c4@linaro.org>
 <CAMRc=MfjBDbqcPvYMeUk3DBNYJgjmC2SxVQ-s260FB1s8yVROQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfjBDbqcPvYMeUk3DBNYJgjmC2SxVQ-s260FB1s8yVROQ@mail.gmail.com>

On Fri Jan 3, 2025 at 3:32 PM CET, Bartosz Golaszewski wrote:
> On Thu, Jan 2, 2025 at 8:41=E2=80=AFAM Erik Schilling <erik.schilling@lin=
aro.org> wrote:
> >
> > This was complained about by clippy:
> >
> >     warning: empty line after doc comment
> >        --> libgpiod/src/lib.rs:461:1
> >         |
> >     461 | / /// Various libgpiod-related functions.
> >     462 | |
> >         | |_
> >     ...
> >     467 |   pub fn is_gpiochip_device<P: AsRef<Path>>(path: &P) -> bool=
 {
> >         |   -----------------------------------------------------------=
 the comment documents this function
> >         |
> >         =3D help: for further information visit https://rust-lang.githu=
b.io/rust-clippy/master/index.html#empty_line_after_doc_comments
> >         =3D help: if the empty line is unintentional remove it
> >     help: if the documentation should include the empty line include it=
 in the comment
> >         |
> >     462 | ///
> >         |
> >
> > The comment more seems to be of structural matter and should not be tie=
d
> > to the function immediately below it. So lets turn it into a normal
> > non-doc comment.
> > ---
>
> Hey, commits are missing signed-offs.

Arhg. How did that break?... Will send a v2 with them.

Sorry!

- Erik


