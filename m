Return-Path: <linux-gpio+bounces-515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6567F8CF4
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 19:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 943CB2814D1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 18:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3312D78A;
	Sat, 25 Nov 2023 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHWs9XD8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D12C1B3
	for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 18:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE82C433CB;
	Sat, 25 Nov 2023 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700935468;
	bh=rf1UeNIRXctn3mVzYQjw1tJtVDq96pT0gvt6sq5/Loo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZHWs9XD836tTt9B0pc1D7TQ12qWVbxRGJQ6ly+ESEvA1jJn87748DqpBdT+qGlXOs
	 co5+1Mc8KqBt06NxwV49RxSsy8GEFxYe+2cTBdmjSWLjx/db7OdgRTAsnxpfTb2Qpp
	 f+4ytmqiPJCfmVgFb2z93hyJ/MVc0ucslxI7UEB3xy/6GTXFKCZm9eGZnb/s7Iuqzp
	 qUeS84Hk5DI6kN7BczcVPPD85keRFfi0601C+w/TXgvpoDAymvTDgGrp7siSbRn9zy
	 CQnrZjnYUtwrqCsrn8NNnxzO7w52BQyRtLX4EF1buLgfUvvm78rpKAjPTOB3MUaD1z
	 v7X3h9FOQk+NQ==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1fa20395185so378778fac.3;
        Sat, 25 Nov 2023 10:04:28 -0800 (PST)
X-Gm-Message-State: AOJu0YzS84PLoV8lJZiwe5hvg0Jh6S73iS1CFpwWCWy/yHGvxcFRHcJQ
	50jpcouW0YT0CXVY6FJTe1eHIKRct8665GqHsqw=
X-Google-Smtp-Source: AGHT+IEfhO5UlyR1TP0k3jBK8w4ux520W3Dc/GbPc0cp/riF8X0b7Y50T0at75iv/Jpp84Fw1SXwePiX2McxiDRIs1k=
X-Received: by 2002:a05:6870:96a1:b0:1f4:d2df:c53c with SMTP id
 o33-20020a05687096a100b001f4d2dfc53cmr8467797oaq.24.1700935467337; Sat, 25
 Nov 2023 10:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120222832.4063882-1-masahiroy@kernel.org>
 <20231120222832.4063882-2-masahiroy@kernel.org> <CAK7LNATK3BVDZ88v7MWjzOk3Kv8CR4Tz_k77yi1OO=zc+71j=g@mail.gmail.com>
 <CACRpkdaMBrWUR8OYLPiQNNJ64mfenFyQa9f4iB+w5kZ44WjSeQ@mail.gmail.com> <ZWCIChQ3TKtxv2b-@smile.fi.intel.com>
In-Reply-To: <ZWCIChQ3TKtxv2b-@smile.fi.intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 26 Nov 2023 03:03:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqguNx3XAXeo866+q3p6v2HF=KYKX__9JDV_dwN1cb=Q@mail.gmail.com>
Message-ID: <CAK7LNAQqguNx3XAXeo866+q3p6v2HF=KYKX__9JDV_dwN1cb=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: pinconf-generic: resize the pin config array directly
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 8:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Nov 24, 2023 at 11:06:50AM +0100, Linus Walleij wrote:
> > On Tue, Nov 21, 2023 at 11:21=E2=80=AFAM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > > On Tue, Nov 21, 2023 at 7:28=E2=80=AFAM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > pinconf_generic_parse_dt_config() allocates memory that is large en=
ough
> > > > to contain all the config parameters. Then, kmemdup() copies the fo=
und
> > > > configs to the memory with the exact size.
> > > >
> > > > There is no need to allocate memory twice; you can directly resize =
the
> > > > initial memory using krealloc_array().
> > > >
> > > > I also changed kcalloc() to kmalloc_array() to keep the consistency=
 with
> > > > krealloc_array(). This change has no impact because you do not need=
 to
> > > > zero out the 'cfg' array.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > >
> > > Sorry, I retract this patch set.
> > >
> > > krealloc() does not save any memory
> > > when the new_size is smaller than the current size.
> >
> > But the first part where you switch to kmalloc_array() is still a nice =
change.
> >
> > The fact that we use kmemdup to be able to also shrink the allocation i=
s a
> > bit of an oddity I guess, but let's run this patch by Andy Shevchenko, =
and
> > ask what he thinks about simply introducing kmemdup_array() or if he
> > has other ideas for this.
>
> https://lore.kernel.org/all/20231017052322.2636-2-kkartik@nvidia.com/


Ok, I will come back when kmemdup_array() is upstreamed.



> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Best Regards
Masahiro Yamada

