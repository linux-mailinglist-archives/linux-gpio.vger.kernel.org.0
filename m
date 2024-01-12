Return-Path: <linux-gpio+bounces-2178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4C082C36C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 17:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF100285243
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DA5745D6;
	Fri, 12 Jan 2024 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mp99k9yU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1793745D5
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-555144cd330so8310956a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705076293; x=1705681093; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2dQJfAo1/zdTqvwnOwcC/TXfubjKjKNcSjyJOh2kcI=;
        b=mp99k9yUXScqu2kK0UuvrwXrZ+HIUs7taFtn+9XU82u3dlY/BmOlc2Df5k3gcjlAOD
         jugrKANF0GjOz9VsVMBpRK1htVhU8uN1l0HGRrspE6CbK/DWg/dctnWA9i8Fo201RHdr
         RM7cPSU5QvI4sY90itB46WCGer8ZcOwzvd1yjW1D8Q9KCEQKrpJGH8NHIEZVtfh/jdKZ
         H/YCVqWt6jHJHXnSRbfu4ctYHmjB73nN83Xwlsgo0dE1ZxEIRmdNDSFisbhLnGL4+kxX
         DILzZEHAZHdpYW2Rk+uRoCYcG2jrjOR5UTYR8rLxRoX9Fdwx4V4ax/tgqLKYfqKkwIvT
         Sjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705076293; x=1705681093;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2dQJfAo1/zdTqvwnOwcC/TXfubjKjKNcSjyJOh2kcI=;
        b=ujuH1EnXA/nZEdul51WGsCbUiFy7A47ZrRIK7ghn7lg//0M+NzLHiTU1lriJkKRWoS
         SPWIm5VyCEbojS2ipbSiPjI0ooOYzP7T4CU79ovj4xb2K6mWKWY8Gu4niomeybZnqdt3
         dZkukCfzSOWPc+X6aD0J1YkIIl780p7zBtSHPYYG2JsxxBFkSv9kITE8NFo4/TiSidgQ
         A2sbQJMoNV7hO1bRYAqJqz042YBtFsAwfvFRJQ3sfHrkcF+zFdXc5ULqM9JpJDLYbgOO
         7ycW1wnhIb7uYM0HXsmOpKB1HcV52ZVel85jgHISmmHfMh8E8DCLMPuD05SRLcS8Sl9n
         ldOQ==
X-Gm-Message-State: AOJu0YwjDwGqa0BUbbp9zMDGPAQidn0EM84gjYSsguV0Gopyw/4UHODl
	TyZlilKiJ0j+qYZxFnSsPDLMqDMR80DcSPT1lGqf1yIbHfU=
X-Google-Smtp-Source: AGHT+IHC6pfFtOud2Azcety68CRmVVUmLUDUKFJnmQJPYhbFgRsYGvYr4O9EQMBL9spK9IzpNYDWbw==
X-Received: by 2002:aa7:cd62:0:b0:555:204a:beb3 with SMTP id ca2-20020aa7cd62000000b00555204abeb3mr814181edb.59.1705076293096;
        Fri, 12 Jan 2024 08:18:13 -0800 (PST)
Received: from localhost ([2001:9e8:d586:b800::f39])
        by smtp.gmail.com with ESMTPSA id et6-20020a056402378600b0055410f0d709sm1913753edb.19.2024.01.12.08.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 08:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jan 2024 17:18:12 +0100
Message-Id: <CYCV3N24HKCG.1W9TO82K8QOPD@ablu-work>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Phil Howard"
 <phil@gadgetoid.com>, <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Kent Gibson"
 <warthog618@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240112150546.13891-1-brgl@bgdev.pl>
 <20240112152502.GA92656@rigel> <20240112154030.GA94712@rigel>
 <CAMRc=Mc0dLkjnOrM2QdVkOhnXccHv6hFu0WPEuL31hGLKkJpbw@mail.gmail.com>
In-Reply-To: <CAMRc=Mc0dLkjnOrM2QdVkOhnXccHv6hFu0WPEuL31hGLKkJpbw@mail.gmail.com>

On Fri Jan 12, 2024 at 5:07 PM CET, Bartosz Golaszewski wrote:
> On Fri, Jan 12, 2024 at 4:40=E2=80=AFPM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > On Fri, Jan 12, 2024 at 11:25:02PM +0800, Kent Gibson wrote:
> > > On Fri, Jan 12, 2024 at 04:05:46PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The github page over at https://github.com/brgl/libgpiod has been r=
eopened
> > > > for bug reports and discussions. Add a link and a mention to the RE=
ADME
> > > > file.
> > > >
> > >
> > > No problem with the patch, but the github page itself seems to have
> > > Issues and Discussions disabled.  And the Wiki might be useful too?
> > >
> >
> > The Releases section could use updating - it lists the latest as v0.3
> > from June 2017!
> >
>
> I don't want to do releases on github. The right place to fetch the
> releases from is kernel.org[1] (I should add this link to README too)
> and I don't want to duplicate release tarballs. I'm pretty sure people
> would start fetching releases from github for distros etc.

You might want to delete the old tags from the github remote in that
case. I think it might be a bit confusing to see v0.3 as "most recent"
release otherwise.

- Erik

