Return-Path: <linux-gpio+bounces-321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D617F306F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 15:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0663B21453
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 14:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE9354F9E;
	Tue, 21 Nov 2023 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7+EyuTN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF71310CB
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:12:54 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso12670503a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700575973; x=1701180773; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNmWL/VJvXvLb9LsZ2Rjlx+W8dT1G4I11vE1zQf27XQ=;
        b=Q7+EyuTNk6y8HFEHov6j9xvwiWI3dtWeZ3AWoqZc/bz2jmt0uSVVm4WoASnWbOP0m4
         bE3y0kqbEGB818yodDcJtDSiHHTVQCCGYUFLvqozhibcvYVszQ/qydWl+d20T6z8JuGf
         8uXuCA1P0Rvad3yL5G90qujsIIO4AG+disStJ4Numt7nlEu68rwgkVguWy64TgczLZRn
         bXoILSZKnjkOyih1PHWu+wZ33etWALwq//3zYewmNpLG/osN3kBVywMbbw2VmzaiYcMD
         jR7B10omj8gq4IWusmaMyuEjiB1sQ3JMqjW8rV6DHpIGjIpL7YMXJVhhqDMhLzUamuDc
         WfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575973; x=1701180773;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uNmWL/VJvXvLb9LsZ2Rjlx+W8dT1G4I11vE1zQf27XQ=;
        b=EB03o7N9fnwuxccbCmoF9w53ZVaS/VbXmDRlrx0Sdim4p8PPI8RAbcbwU0D+B2eUSQ
         jz1nTcado8+V7dcIJ6+nflFVnmpY3e4w+7TVcw9k1Xf4PP1kLU0xZL1+e6f0YvQXmybW
         mC3EBGecMBge1/ade0mHNKzwmiKBKofOgy+PaGCRIlqheJKGwsjWnaavVD9XAyc/W9V4
         q//2KXnOyXt9v5alemdYOCE7gAqJm7A+/LlfR8iyHjCL77LkCr4BgP5eyVZqtfOqjP9Q
         D8b461b3yeIhXJsFk0NmDG4/utjmKtI9Y+MdchMyUFm5fVsLcze1577S2UW9kLSNKbjQ
         SOmw==
X-Gm-Message-State: AOJu0YzezQUA6rimT4LybNLOuPaCNdR6q2Fv31i/Hzeoo0J0Hj3AJDDT
	VqeLxdcgt+gXolfzCtyrI60eQg==
X-Google-Smtp-Source: AGHT+IFwLEEzxIfNBFa/VpicKntntNTNfromP+vn1djp1HcJ2QtRpp7Ze45pUXTkJbT+Xga2rBo8/w==
X-Received: by 2002:a17:906:14c:b0:a00:1c10:f94e with SMTP id 12-20020a170906014c00b00a001c10f94emr2073925ejh.3.1700575973136;
        Tue, 21 Nov 2023 06:12:53 -0800 (PST)
Received: from localhost ([2001:9e8:d5b7:1500::f39])
        by smtp.gmail.com with ESMTPSA id i25-20020a1709061cd900b009dd8debf9d8sm5306802ejh.157.2023.11.21.06.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 06:12:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 15:12:52 +0100
Message-Id: <CX4JVCLF63WY.1KWBP904270EQ@ablu-work>
Subject: Re: [PATCH libgpiod] bindings: rust: libgpiod-sys: new release
Cc: "Linux-GPIO" <linux-gpio@vger.kernel.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Manos Pitsidianakis"
 <manos.pitsidianakis@linaro.org>, "Kent Gibson" <warthog618@gmail.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231121-b4-libgpiod-sys-0-1-1-v1-1-87d53dec6252@linaro.org>
 <CAMRc=McwQDy_yXpWzMtcF4_A-MaCisdHs9HJF_eJFVz5NKRSYA@mail.gmail.com>
In-Reply-To: <CAMRc=McwQDy_yXpWzMtcF4_A-MaCisdHs9HJF_eJFVz5NKRSYA@mail.gmail.com>

On Tue Nov 21, 2023 at 3:04 PM CET, Bartosz Golaszewski wrote:
> On Tue, Nov 21, 2023 at 9:43=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > During 86860fb ("bindings: rust: libgpiod: release 0.2.2"), I forgot th=
at
> > we also need a libgpiod-sys release in order to expose the new feature
> > flag to raise the minimum libgpiod version.
> >
> > Changelog:
> >
> > 7552e5d (bindings: rust: expose v2.1 features as flag, 2023-11-06)
> > bc91656 (bindings: rust: add wrapper.h to EXTRA_DIST, 2023-11-03)
> > 2e6ee87 (bindings: rust: mention the libgpiod crate from libgpiod-sys, =
2023-07-03)
> > d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
> > ebfed6c (bindings: rust: document build without install, 2023-06-12)
> > bce8623 (bindings: rust: exclude Makefile.am from package, 2023-06-12)
> > caabf53 (bindings: rust: add missing license and copyright boilerplate,=
 2023-06-13)
> >
> > Most changes only touch the build scripts or modify packaging details.
> > Bumping the MSRV and introducing a new feature does not require a major
> > bump.
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
>
> Applied, thanks!

Thanks!

Published:
* https://crates.io/crates/libgpiod-sys/versions
* https://crates.io/crates/libgpiod/versions

- Erik

