Return-Path: <linux-gpio+bounces-35497-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGOSGUJf62lGLwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35497-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 14:17:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8C045E494
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 14:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96AA8300C92D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 12:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067BF3C4579;
	Fri, 24 Apr 2026 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sM5YdEhX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF003C4577
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033002; cv=none; b=O27xDXLaF1vXqIoEqeKH4waGxlB0OCzI2yJR4fsNLsXX2XU/Yqfzy8n5JlYpDDeNCrsBd9qqM23+XF39u+czKRsgBUx7B7e+/LlKCHztAqYhbKIvpKmHV5cKKRQ9Bvy/bXjNp/a/Gp0YgYHXauI9sP1AFnH99Ct3PHoCSSG6h5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033002; c=relaxed/simple;
	bh=e3VUOZkpmOzJfPO29avHRnQfVhDeAef8+TpZKjS0W1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAPF8ViFXYIVTg0EHnWrE7xk7zYangpJFiZQy6ANzIk3IgpXk4qKxsF9NC8izvsItUSx2TliWF3DubMeErifyG7BicEPRTm+16uU7hCbL2ohCKi1p6V6xcQmYzP9ODEtEMUcBNkMtA9l7TbrztboDQGpC1VUD5h23QrEuQDkWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sM5YdEhX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FD6C19425
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777033002;
	bh=e3VUOZkpmOzJfPO29avHRnQfVhDeAef8+TpZKjS0W1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sM5YdEhXRLlP77SNU8IXGPQpEt0WhRBLCed0A5qPLJce8yMpc8GdglefXxQRlDQAA
	 uw6s8kamBUfCA01XVXwC5ATX3wAXe6jZ9wpIMFsKVlqEnk59m1V2pt7INaGTnAo2Jb
	 mG74NjOaUW39imPj26sCcG+Kq9FEG/PIa1BNKJIfAsY/KUyTtr2ruId3+TB3r3Iyfw
	 1tyd1GBHH6GIO3A+wYhMoPapEeqWwPMb3zMUW8yvMysaaU25AtXWOnCuIon8dgcGQT
	 uymcoK5bZwvAlzKWoF8U4FxUCt2XThuhPLqXh8+NfvLBAHZU8IFyzdLirfnHbUKE9n
	 RcoNg5UB5KsGg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e68e4389cso82060111fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 05:16:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RpiSYQG+oGJDYZaCfiSw/fDtmjjf94IFJobNaMfggynGTjgTHBubTDKkxMkhU80IYSch5Psvv+96l@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXHDh3nWwZ3RfAd9YkgMFk52eTiabWUNSKYPEUdNu3wr/ZSge
	twW0BM7rXaZC+hACpG+n8nMxIK8ksT5S16XbSsMCN6Qb6S+o15W0MsGHjkJs4Gl/NYXqXdoyKXw
	320B4TfpN0dnc8DUYSeGcLumUcZdFodUPHAHn3S+ydw==
X-Received: by 2002:a05:6512:3e05:b0:5a2:b379:22db with SMTP id
 2adb3069b0e04-5a4172cf2c7mr11002027e87.18.1777033001101; Fri, 24 Apr 2026
 05:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com> <DI0CSOLOJQQ6.2CDH5XKJLN76K@riscstar.com>
In-Reply-To: <DI0CSOLOJQQ6.2CDH5XKJLN76K@riscstar.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 14:16:29 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mep=LVpbY9LEC85sbrZCEU0UaCN_xp1yux30dLpEprmsQ@mail.gmail.com>
X-Gm-Features: AQROBzCoGdoc0CjFlb1XmvlnKr83K0UBqOHYuI1znXIUhbUZQCTgP1Dt0zBQk34
Message-ID: <CAMRc=Mep=LVpbY9LEC85sbrZCEU0UaCN_xp1yux30dLpEprmsQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod] build: replace autotools with meson & ninja
To: Erik Schilling <erik@riscstar.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BB8C045E494
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,xes-inc.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35497-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:email,mail.gmail.com:mid,qualcomm.com:email]

On Thu, Apr 23, 2026 at 9:25=E2=80=AFAM Erik Schilling <erik@riscstar.com> =
wrote:
>
> On Wed Apr 22, 2026 at 12:27 PM CEST, Bartosz Golaszewski wrote:
> > Port the project from autotools to meson. All build options are
> > preserved with the same semantics.
> >
> > The goal of this change is to produce the same set of files as the
> > current autotools approach: libraries with correct SONAME/version,
> > headers, pkg-config files, GObject introspection data, Python extension
> > modules, D-Bus interface and configuration files. This is done to enabl=
e
> > a one-liner test command running all available test suites.
> >
> > The only thing we drop is the `make docs` target as it's rarely used an=
d
> > docs can be generated easily with sphinx directly. They are also not
> > required for testing.
> >
> > The Rust workspace is built via a custom target that invokes cargo and
> > uses SYSTEM_DEPS_* environment variables to point the libgpiod-sys and
> > gpiosim-sys crates at the locally built C libraries.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---

> > +
> > +if opt_bindings_cxx.allowed() and opt_tests.allowed()
> > +  catch2_test_dep =3D dependency('catch2-with-main', version: '>=3D 3.=
0', required: false)
> > +  if not catch2_test_dep.found()
> > +    cxx =3D meson.get_compiler('cpp')
> > +    if cxx.has_header('catch2/catch_all.hpp')
> > +      catch2_test_dep =3D declare_dependency()
> > +    endif
> > +  endif
> > +endif
>
> This effectively leaves catch2 optional even if cxx && tests is mandated
> (if catch2-with-main fails to yield a result and catch_all.hpp does
> not exist).
>
> I think either this lookup should mandate it to exist if cxx && tests
> are chosen OR the executable() in bindings/cxx/tests/meson.build has to
> be made conditional on the catch2_test_dep?
>
> As it stands, it does not compile on Fedora (which only ships an old
> catch2 version that does not have catch_all.hpp).
>

Thanks, I fixed it.

> > +
> > +option('tools', type: 'feature', value: 'disabled',
> > +  description: 'Build libgpiod command-line tools')
> > +
> > +option('gpioset-interactive', type: 'feature', value: 'disabled',
> > +  description: 'Enable gpioset interactive mode (requires libedit >=3D=
 3.1)')
> > +
> > +option('tests', type: 'feature', value: 'disabled',
> > +  description: 'Build the test suite')
> > +
> > +option('examples', type: 'feature', value: 'disabled',
> > +  description: 'Build code examples')
> > +
> > +option('bindings-cxx', type: 'feature', value: 'disabled',
> > +  description: 'Build C++ bindings')
> > +
> > +option('bindings-python', type: 'feature', value: 'disabled',
> > +  description: 'Build Python 3 bindings (requires Python >=3D 3.10)')
> > +
> > +option('bindings-rust', type: 'feature', value: 'disabled',
> > +  description: 'Build Rust bindings (requires cargo)')
> > +
> > +option('bindings-glib', type: 'feature', value: 'disabled',
> > +  description: 'Build GLib 2.0 / GObject bindings')
> > +
> > +option('dbus', type: 'feature', value: 'disabled',
> > +  description: 'Build the D-Bus daemon and client (implies bindings-gl=
ib)')
> > +
> > +option('introspection', type: 'feature', value: 'disabled',
> > +  description: 'Generate GObject introspection data (requires bindings=
-glib)')
>
> Setting value: 'disabled' on all these options keeps them disabled even
> when running with meson setup --auto-features=3Denabled (which is what
> distros like Fedora do to ensure they catch new options).
>
> So I am not sure if all of these should have presets? I think they could
> just be left out and be automatically be negotiated by their dependencies
> being discovered?
>
> Otherwise people risk bumping libgpiod but forgetting to package up new
> tools like the dbus daemon.
>

I'll keep the disabled value where it makes sense: for python and rust
bindings as they should typically be built with the dedicated tools.

Bart

