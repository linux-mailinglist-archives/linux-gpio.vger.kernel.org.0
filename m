Return-Path: <linux-gpio+bounces-35392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN/LLu/K6WnSkQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 09:31:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473244DFE8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 09:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20B1630103A1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 07:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1C62E7F2C;
	Thu, 23 Apr 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="atJKbO63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6182ECD32
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929111; cv=none; b=QrZ8KEW86L2AVOyJzEsf9NYbWHdKpBL5w/Kq4Z3UmgruYdgjKtcq5MmkepmmunkX2rnPsxzpdI+9Cut06jwwpGdaARmbX4bbm4lYO67T7en4jUt+cu1PhG/QujEfBYVYh84Xe8WRjbaGEf2RBMHvAY82KRT0OW73w0N55bWiMxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929111; c=relaxed/simple;
	bh=1XiPq2tDr79pKsaL45rGRS0GyVBBe8vgsm4E2Q6KckA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HpJrNUtzOFmFct3M2fw6UBs17Oh3pkJFjymyNIs2UoaEjXT+FfrnXC7aU4IsEW8DRBQWS2GGn3a73Oc+2YBeKfe1arV2JwRej+iZZWOHREEJAGp3OhspcjyZRMvAhHvgjzSTN8I6LN/Ba2BTV/wuzfGfTAB3h7dQ0ky4aqegd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=atJKbO63; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48909558b3aso55604085e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1776929105; x=1777533905; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7JLdpcGdX8lw7b9tD+r6Kn54/yPZFlOc239cp+QIJY=;
        b=atJKbO63VybRd8crZlK5hYfU7L1Kx3jBA0zuSkzlOBqylA1Z0UoDbKMHWE9tzrwP9+
         0L0hL0oCK+6eIIo+8Rv979cNnn2onwocJongf/YOp+trnv9vGxBKFoagIgYjrJffbEMk
         /q6ZurQvTNRdYQqsGlNXFg1avo47GTG5Od2SdlZCUtVqaynuQJakIQPuOF4ftl+ufm2x
         iI/jve+ku57jWQw6hKWxhB64L+Qyj4gLeAZ2KCrsERgAVRHWXVZMZxLb/dPHK2DUrjzv
         k9ni4EIPRNB+GwwlfU7A5Hd2QNYYy0Hd2YmprMBS/M3w9/lK6bitp7fIfcnfR9+RNm5Z
         gAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776929105; x=1777533905;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7JLdpcGdX8lw7b9tD+r6Kn54/yPZFlOc239cp+QIJY=;
        b=LpFVnL3FRgJsmVbWxtEPWqAwDjUlSd67vtWmyCnMHlamI+jojlpVpUny2AiWiizJhp
         xOl9141h+WCY3LXj1wFv6IRI+YviTAJ8vQaBfuyluMPcJf5Bn2ypV2I91KKQRfr7fp8c
         vZlp8LZt5wkho42+oF1JH/+gQZYB7ws3YD8wQUSxClGHA/RndlbTGAPEQmhtdYxBR28Y
         UpTLBT997+YKeh5eQSiGCH1Oiv4MRE1OdpsPJH34dzYXSjn6gALJADIQp4Z6EFcLhrmU
         aS4dnB7KPty4q6MdP+inQSS1HJhlfJEtjodLA+D9KRbuThoG3/jouKQ5Aq2dLZ4NG4Bc
         3ydw==
X-Forwarded-Encrypted: i=1; AFNElJ8teoCiZri0U9sIY3uBORmrPGss7fw41Qq+OAzdctRZFy+fQq7uqveEXp1qggXfIh+ZjZKR4AvtB+dy@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTaIzmaT646XA0FYuRdPGqY5Z41RcvSesCzoj1HqR2+x37pMY
	6GOU0yC9P4YuAPEhrcfBT+iBEnb7/u3SFVsdK1PXazsNRLoInR6cl35r9KXUrQjd4Jo=
X-Gm-Gg: AeBDietkxbi6obu4gptRqPoG4lbXzwyhXEs2ii6K8TCBv+dcUMdCjH8IW+AGAAEFvRP
	g7V8PASMYVid/rOJhBs+vB8Kz1EQoPIMbfoSmmNwCqk7HI/6DThRqOjV+hO7b9HX4kJSVWUWQXo
	JFNwep2U/39YI/jLCNIEaG6fDxRcd+pWYqORECPzW72hvI5QbGDKhPlR1JPLZNyUsOfM+JGv687
	W7D9ywAfCLUtIKqqxtslDK9+iM03dWJTzVI1CYQCBYJYRcBSp57lbKiObWBtpKq4qV74pGcvjMQ
	q7jj2Dp69SpEysRROV3kkgspL3ebRuzNxNNlnv9nKDFhMPjpZRFOoeoDAobm737F/uhGyNUiUAN
	gKWy7Bc8V8XMOZhN16ah93+7Xf09E9ih0s4oAllJ9KJWo5dZEw2wcnmtJzAO21IIu2JqWV7Qxwh
	Sc12aeP5ryMg==
X-Received: by 2002:a05:600c:26d5:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-4891c1f3715mr151003525e9.10.1776929104554;
        Thu, 23 Apr 2026 00:25:04 -0700 (PDT)
Received: from localhost ([2001:9e8:d5bd:a700::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52d232afsm73226595e9.31.2026.04.23.00.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 09:25:02 +0200
Message-Id: <DI0CSOLOJQQ6.2CDH5XKJLN76K@riscstar.com>
Subject: Re: [PATCH libgpiod] build: replace autotools with meson & ninja
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus
 Walleij" <linusw@kernel.org>, "Vincent Fazio" <vfazio@xes-inc.com>, "Kent
 Gibson" <warthog618@gmail.com>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Erik Wierich" <erik@riscstar.com>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.21.0
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
In-Reply-To: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35392-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,xes-inc.com,gmail.com,linaro.org,riscstar.com];
	URIBL_MULTI_FAIL(0.00)[configure.ac:server fail,meson.build:server fail,riscstar-com.20251104.gappssmtp.com:server fail,makefile.am:server fail,sea.lore.kernel.org:server fail,riscstar.com:server fail,autogen.sh:server fail,qualcomm.com:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[erik@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,autogen.sh:url,qualcomm.com:email,riscstar-com.20251104.gappssmtp.com:dkim,configure.ac:url,meson.build:url,makefile.am:url]
X-Rspamd-Queue-Id: 4473244DFE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 22, 2026 at 12:27 PM CEST, Bartosz Golaszewski wrote:
> Port the project from autotools to meson. All build options are
> preserved with the same semantics.
>
> The goal of this change is to produce the same set of files as the
> current autotools approach: libraries with correct SONAME/version,
> headers, pkg-config files, GObject introspection data, Python extension
> modules, D-Bus interface and configuration files. This is done to enable
> a one-liner test command running all available test suites.
>
> The only thing we drop is the `make docs` target as it's rarely used and
> docs can be generated easily with sphinx directly. They are also not
> required for testing.
>
> The Rust workspace is built via a custom target that invokes cargo and
> uses SYSTEM_DEPS_* environment variables to point the libgpiod-sys and
> gpiosim-sys crates at the locally built C libraries.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I think this is the third or fourth time we try this, maybe this time
> it'll stick. This is a port of the current autotools build system to
> meson & ninja. A PoC yocto recipe update[1] can be used for testing.
>
> [1] https://github.com/brgl/meta-openembedded/tree/topic/libgpiod-meson
> ---
>  Makefile.am                                     |  62 ----
>  autogen.sh                                      |  17 -
>  bindings/Makefile.am                            |  29 --
>  bindings/cxx/Makefile.am                        |  47 ---
>  bindings/cxx/examples/Makefile.am               |  47 ---
>  bindings/cxx/examples/meson.build               |  27 ++
>  bindings/cxx/gpiodcxx/Makefile.am               |  20 --
>  bindings/cxx/meson.build                        |  73 +++++
>  bindings/cxx/tests/Makefile.am                  |  30 --
>  bindings/cxx/tests/meson.build                  |  29 ++
>  bindings/glib/Makefile.am                       | 133 --------
>  bindings/glib/examples/Makefile.am              |  22 --
>  bindings/glib/examples/meson.build              |  25 ++
>  bindings/glib/gpiod-glib/meson.build            |  18 ++
>  bindings/glib/meson.build                       | 111 +++++++
>  bindings/glib/tests/Makefile.am                 |  29 --
>  bindings/glib/tests/meson.build                 |  27 ++
>  bindings/meson.build                            |  18 ++
>  bindings/python/Makefile.am                     |  58 ----
>  bindings/python/examples/Makefile.am            |  17 -
>  bindings/python/gpiod/Makefile.am               |  19 --
>  bindings/python/gpiod/ext/Makefile.am           |  11 -
>  bindings/python/gpiod/meson.build               |  41 +++
>  bindings/python/meson.build                     |  10 +
>  bindings/python/tests/Makefile.am               |  18 --
>  bindings/python/tests/gpiosim/Makefile.am       |   8 -
>  bindings/python/tests/gpiosim/meson.build       |  14 +
>  bindings/python/tests/meson.build               |  34 ++
>  bindings/python/tests/system/Makefile.am        |   7 -
>  bindings/python/tests/system/meson.build        |  12 +
>  bindings/rust/Makefile.am                       |   6 -
>  bindings/rust/gpiosim-sys/Makefile.am           |   6 -
>  bindings/rust/gpiosim-sys/src/Makefile.am       |   5 -
>  bindings/rust/libgpiod-sys/Makefile.am          |   6 -
>  bindings/rust/libgpiod-sys/src/Makefile.am      |   5 -
>  bindings/rust/libgpiod/Makefile.am              |  28 --
>  bindings/rust/libgpiod/examples/Makefile.am     |  18 --
>  bindings/rust/libgpiod/src/Makefile.am          |  15 -
>  bindings/rust/libgpiod/tests/Makefile.am        |  15 -
>  bindings/rust/libgpiod/tests/common/Makefile.am |   5 -
>  bindings/rust/meson.build                       |  40 +++
>  configure.ac                                    | 407 ------------------=
------
>  contrib/Makefile.am                             |   4 -
>  dbus/Makefile.am                                |  10 -
>  dbus/client/Makefile.am                         |  31 --
>  dbus/client/gpiocli-test.bash                   |   2 -
>  dbus/client/meson.build                         |  30 ++
>  dbus/data/Makefile.am                           |  14 -
>  dbus/data/meson.build                           |  24 ++
>  dbus/lib/Makefile.am                            |  29 --
>  dbus/lib/meson.build                            |  35 ++
>  dbus/manager/Makefile.am                        |  21 --
>  dbus/manager/meson.build                        |  26 ++
>  dbus/meson.build                                |  11 +
>  dbus/tests/Makefile.am                          |  25 --
>  dbus/tests/meson.build                          |  25 ++
>  docs/Makefile.am                                |  65 ----
>  examples/Makefile.am                            |  22 --
>  examples/meson.build                            |  25 ++
>  include/Makefile.am                             |   4 -
>  include/meson.build                             |   4 +
>  lib/Makefile.am                                 |  28 --
>  lib/meson.build                                 |  37 +++
>  man/Makefile.am                                 |  70 ----
>  man/meson.build                                 |  82 +++++
>  meson.build                                     | 155 +++++++++
>  meson_options.txt                               |  38 +++
>  tests/Makefile.am                               |  31 --
>  tests/gpiosim-glib/Makefile.am                  |  13 -
>  tests/gpiosim-glib/meson.build                  |  11 +
>  tests/gpiosim/Makefile.am                       |  15 -
>  tests/gpiosim/meson.build                       |  19 ++
>  tests/harness/Makefile.am                       |  12 -
>  tests/harness/meson.build                       |   9 +
>  tests/meson.build                               |  37 +++
>  tests/scripts/Makefile.am                       |   4 -
>  tests/scripts/gpiod-bash-test-helper.inc        |   8 +-
>  tools/Makefile.am                               |  25 --
>  tools/gpio-tools-test.bash                      |   3 -
>  tools/meson.build                               |  32 ++
>  80 files changed, 1083 insertions(+), 1522 deletions(-)

docs/building.rst also needs an update with that :).

[...]

> diff --git a/meson.build b/meson.build
> new file mode 100644
> index 0000000000000000000000000000000000000000..10df7969d0f6e8f157e9f1b39=
bd8cc90b2092d47
> --- /dev/null
> +++ b/meson.build
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its su=
bsidiaries
> +
> +project('libgpiod', ['c', 'cpp'],
> +  version: '2.3',
> +  license: 'LGPL-2.1-or-later',
> +  default_options: [
> +    'c_std=3Dgnu89',
> +    'cpp_std=3Dgnu++17',
> +    'warning_level=3D2',
> +  ],
> +  meson_version: '>=3D 0.63.0',
> +)
> +
> +extra_version =3D '-devel'
> +version_str =3D meson.project_version() + extra_version
> +
> +# Core libgpiod API version.
> +api_version =3D '2.2.0'
> +
> +# Core C library ABI version.
> +libgpiod_soversion      =3D '3'
> +libgpiod_version        =3D '3.1.1'
> +# Have a separate ABI version for C++ bindings:
> +libgpiodcxx_soversion   =3D '2'
> +libgpiodcxx_version     =3D '2.1.0'
> +# ABI version for libgpiosim (we need this since it can be installed if =
we
> +# enable tests).
> +libgpiosim_soversion    =3D '1'
> +libgpiosim_version      =3D '1.0.1'
> +# ... and another one for GLib bindings:
> +libgpiod_glib_soversion =3D '1'
> +libgpiod_glib_version   =3D '1.0.0'
> +
> +add_project_arguments(
> +  '-D_GNU_SOURCE',
> +  '-DGPIOD_VERSION_STR=3D"@0@"'.format(version_str),
> +  '-DGPIOD_API_VERSION_STR=3D"@0@"'.format(api_version),
> +  language: ['c', 'cpp'],
> +)
> +
> +opt_tools               =3D get_option('tools')
> +opt_gpioset_interactive =3D get_option('gpioset-interactive')
> +opt_tests               =3D get_option('tests')
> +opt_examples            =3D get_option('examples')
> +opt_bindings_cxx        =3D get_option('bindings-cxx')
> +opt_bindings_python     =3D get_option('bindings-python')
> +opt_bindings_rust       =3D get_option('bindings-rust')
> +opt_bindings_glib       =3D get_option('bindings-glib')
> +opt_dbus                =3D get_option('dbus')
> +opt_introspection       =3D get_option('introspection')
> +opt_systemd             =3D get_option('systemd')
> +
> +# D-Bus implies glib bindings.
> +if opt_dbus.enabled() and not opt_bindings_glib.enabled()
> +  opt_bindings_glib =3D opt_dbus
> +endif
> +
> +# Introspection requires glib bindings.
> +if opt_introspection.enabled()
> +  assert(opt_bindings_glib.allowed(),
> +    'introspection requires -Dbindings-glib=3Denabled')
> +endif
> +
> +# systemd requires D-Bus.
> +if opt_systemd.enabled()
> +  assert(opt_dbus.allowed(),
> +    'systemd support requires -Ddbus=3Denabled')
> +endif
> +
> +libgpiod_inc =3D include_directories('include')
> +
> +libedit_dep =3D dependency('libedit', version: '>=3D 3.1', required: opt=
_gpioset_interactive)
> +
> +if opt_tests.allowed()
> +  libkmod_dep   =3D dependency('libkmod', version: '>=3D 18', required: =
opt_tests)
> +  mount_dep     =3D dependency('mount', version: '>=3D 2.33.1', required=
: opt_tests)
> +  threads_dep   =3D dependency('threads', required: opt_tests)
> +  # glib/gio are also used by tests (different min-version from bindings=
).
> +  glib_test_dep =3D dependency('glib-2.0', version: '>=3D 2.74', require=
d: opt_tests)
> +  gio_test_dep  =3D dependency('gio-2.0', version: '>=3D 2.74', required=
: opt_tests)
> +endif
> +
> +if opt_bindings_cxx.allowed() and opt_tests.allowed()
> +  catch2_test_dep =3D dependency('catch2-with-main', version: '>=3D 3.0'=
, required: false)
> +  if not catch2_test_dep.found()
> +    cxx =3D meson.get_compiler('cpp')
> +    if cxx.has_header('catch2/catch_all.hpp')
> +      catch2_test_dep =3D declare_dependency()
> +    endif
> +  endif
> +endif

This effectively leaves catch2 optional even if cxx && tests is mandated
(if catch2-with-main fails to yield a result and catch_all.hpp does
not exist).

I think either this lookup should mandate it to exist if cxx && tests
are chosen OR the executable() in bindings/cxx/tests/meson.build has to
be made conditional on the catch2_test_dep?

As it stands, it does not compile on Fedora (which only ships an old
catch2 version that does not have catch_all.hpp).

> +
> +if opt_bindings_glib.allowed()
> +  glib_dep      =3D dependency('glib-2.0', version: '>=3D 2.80', require=
d: opt_bindings_glib)
> +  gobject_dep   =3D dependency('gobject-2.0', version: '>=3D 2.80', requ=
ired: opt_bindings_glib)
> +  gio_dep       =3D dependency('gio-2.0', version: '>=3D 2.80', required=
: opt_bindings_glib)
> +  gio_unix_dep  =3D dependency('gio-unix-2.0', version: '>=3D 2.80', req=
uired: opt_bindings_glib)
> +  glib_mkenums  =3D find_program('glib-mkenums', required: opt_bindings_=
glib)
> +endif
> +
> +if opt_dbus.allowed()
> +  gudev_dep      =3D dependency('gudev-1.0', version: '>=3D 230', requir=
ed: opt_dbus)
> +  gdbus_codegen  =3D find_program('gdbus-codegen', required: opt_dbus)
> +endif
> +
> +if opt_introspection.allowed()
> +  gir_dep       =3D dependency('gobject-introspection-1.0', version: '>=
=3D 0.6.2',
> +                             required: opt_introspection)
> +  g_ir_scanner  =3D find_program('g-ir-scanner', required: opt_introspec=
tion)
> +  g_ir_compiler =3D find_program('g-ir-compiler', required: opt_introspe=
ction)
> +endif
> +
> +if opt_systemd.allowed()
> +  systemd_dep =3D dependency('systemd', required: opt_systemd)
> +  if systemd_dep.found()
> +    opt_systemd_unit_dir =3D get_option('systemd-unit-dir')
> +    if opt_systemd_unit_dir !=3D ''
> +      systemd_unit_dir =3D opt_systemd_unit_dir
> +    else
> +      systemd_unit_dir =3D systemd_dep.get_variable('systemdsystemunitdi=
r')
> +    endif
> +  endif
> +endif
> +
> +if opt_bindings_rust.allowed()
> +  cargo =3D find_program('cargo', required: opt_bindings_rust)
> +endif
> +
> +help2man =3D find_program('help2man', required: false)
> +
> +subdir('include')
> +subdir('lib')
> +
> +if opt_tools.allowed()
> +  subdir('tools')
> +endif
> +
> +if opt_examples.allowed()
> +  subdir('examples')
> +endif
> +
> +if opt_tests.allowed()
> +  subdir('tests')
> +endif
> +
> +subdir('bindings')
> +
> +if opt_dbus.allowed()
> +  subdir('dbus')
> +endif
> +
> +if help2man.found()
> +  subdir('man')
> +endif
> diff --git a/meson_options.txt b/meson_options.txt
> new file mode 100644
> index 0000000000000000000000000000000000000000..9b9a5ed6b28347b213cf78df2=
3bbeb2214e8c248
> --- /dev/null
> +++ b/meson_options.txt
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its su=
bsidiaries
> +
> +option('tools', type: 'feature', value: 'disabled',
> +  description: 'Build libgpiod command-line tools')
> +
> +option('gpioset-interactive', type: 'feature', value: 'disabled',
> +  description: 'Enable gpioset interactive mode (requires libedit >=3D 3=
.1)')
> +
> +option('tests', type: 'feature', value: 'disabled',
> +  description: 'Build the test suite')
> +
> +option('examples', type: 'feature', value: 'disabled',
> +  description: 'Build code examples')
> +
> +option('bindings-cxx', type: 'feature', value: 'disabled',
> +  description: 'Build C++ bindings')
> +
> +option('bindings-python', type: 'feature', value: 'disabled',
> +  description: 'Build Python 3 bindings (requires Python >=3D 3.10)')
> +
> +option('bindings-rust', type: 'feature', value: 'disabled',
> +  description: 'Build Rust bindings (requires cargo)')
> +
> +option('bindings-glib', type: 'feature', value: 'disabled',
> +  description: 'Build GLib 2.0 / GObject bindings')
> +
> +option('dbus', type: 'feature', value: 'disabled',
> +  description: 'Build the D-Bus daemon and client (implies bindings-glib=
)')
> +
> +option('introspection', type: 'feature', value: 'disabled',
> +  description: 'Generate GObject introspection data (requires bindings-g=
lib)')

Setting value: 'disabled' on all these options keeps them disabled even
when running with meson setup --auto-features=3Denabled (which is what
distros like Fedora do to ensure they catch new options).

So I am not sure if all of these should have presets? I think they could
just be left out and be automatically be negotiated by their dependencies
being discovered?

Otherwise people risk bumping libgpiod but forgetting to package up new
tools like the dbus daemon.

> +option('systemd', type: 'feature', value: 'disabled',
> +  description: 'Install systemd unit and udev rules (requires dbus)')
> +
> +option('systemd-unit-dir', type: 'string', value: '',
> +  description: 'Directory for systemd system unit files (default: from p=
kg-config)')

[...]

Tested-by: Erik Wierich <erik@riscstar.com>


