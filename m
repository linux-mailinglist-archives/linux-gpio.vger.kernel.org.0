Return-Path: <linux-gpio+bounces-16107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED497A37D27
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 09:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D1217090B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 08:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AD719F13F;
	Mon, 17 Feb 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q4C4n7mK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20C192B63
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780817; cv=none; b=Ho9ceWygnWn+xlI41V1Av/25eFJ0/kIg9Koq2sBvjBRBXjBP84joZFvTRQoJqmO5op4rAI21Cj+g1dU+WdOjwyTo2omkeRzOVBJkmMvYci+db8Nift1cYRHMayqRDKXw2d61iy7qbsiIAE3UIWeZMoVoo/tyD11yPeU0nEyWwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780817; c=relaxed/simple;
	bh=qZ3DrPPS0PbyUiTM6MstGs475Pp7FpAKksdGT+7jhmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOSiPxbWL1tbHe+lqvQMv+74QwLNFDJp7gEhvi7aftYw6NL9g6LYJxbCMSzr3wF5uPWIaD5RjCRzvMwRumFsITrV65zx2CX2rYpeBKceB9YVZqCATGg4QRwiLyEoPrbIkbc89Mbh/1R0cmYx4d8h51uAYxjlteYZI7s8NC3Tous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q4C4n7mK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so485784f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 00:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739780813; x=1740385613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msevzSxLxbbEgD1PYAJEt+KTRILBkRVPCqxrYeVplt8=;
        b=q4C4n7mKMBjx8/l3bQhj8cMSiiaYUSmANRqJxLol2pJuS+y2Re1PUthsJxuet40bdN
         50nR/r/1PsI5d7UVBIBeU0Zga1xzCZYw3BkYpNmWO2U7FdGYr/q7h61Q1jGW295WK7j/
         wavaIKGZqyl5mo441yoT29e/A3qlttQF9U3GwXya11gkgeF4wbqAJ9QxJWs7DSwxmZ6K
         /rThi7tojrn2c4CT2nMmQDA3yflZJa91SN5HQ+chIXCddQUzzUgb1kMbk4+EkDmxhj0C
         WEn+GVsEtAI7Gdcd+5bBnIbUxpz10xuNTS9mBQTqhJqIuXY67fo80JOVv9ldARSPcp0I
         nh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780813; x=1740385613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msevzSxLxbbEgD1PYAJEt+KTRILBkRVPCqxrYeVplt8=;
        b=wGa9eJRBywvakNJpuYj4W+suVD8/bzQQiUh8VLaPHEJHlEGPItvhnvuLPg4FdQYUmE
         0HfAfoGMEcgLzf0tdO0KTgzg1g7mrowGAnP2rwfcZnHFjFPfifTxJ4Qbbb4iXdgPmpeC
         1QsbnNFPaCd9+6fQCrnOsqGFWKFU1qLN2wiEZmwGYPuv/1855jWib0QmQxd14mJSo5TY
         3V/onrxqeNQQhS0NwCCvBXGNqEcV82MMh/VvfZUulDB66HW6x+mJ2M93LIoVH2oG5UDO
         5R19IyMQOFbo9iPvHvtFlHTiR2z7gYs6ym22DFfYv7g12bPHIYqKBjkJC2oEy0GRo5I/
         YFmw==
X-Forwarded-Encrypted: i=1; AJvYcCUU9e06qrnKFBk4A7N+y4vkolue7DZafiJ+CwPP0Dd8WHO5GnaqUWYaKzrYloB+enOn2dRwCbLFwa1l@vger.kernel.org
X-Gm-Message-State: AOJu0YzfzimjJJ2xVHVbCN0ak0mYxJKAAJnpaLsnRDQyrpEChSFGeEff
	1vZvV+ob1iH8ICEHCPCZZF6j3BiMhLWK8JyFXuDC48yG7LzbDxbS3v3zknzpRXY=
X-Gm-Gg: ASbGncu2Y7zQ50uTUEL8fFTVw+Pr7K2dl7l6Adjgqwu/ochWdEUTuu3KLK3BX9wWbGn
	iolhaKSK91LCXubmhup/suV6XDV6JqXHwC66xcOcO4zKDpch0k0IDzXm5YtYNygr0ri9cIG0V5E
	xQ/4jPpsWYNQiQGqLGVJqGeScZPVpRN0I+hj70dhw+ZhiCAAm99fShTIHJofgwmVkKPyQiyqd+8
	zBdwGmAbhsziwl4NrAzIXRJm1DQheGMnN/gb1bjBlK1Oe+kFCSbqb50szghAKjbXSHfj32ULqgU
	coN4YGUuev+/
X-Google-Smtp-Source: AGHT+IFgRdw92EWtefN37lvXT6ZKrYurtht7S5ytpBGwUaD0zpQLnhiFCY+T5ECKrsij1GF3/gbCFw==
X-Received: by 2002:a5d:47c9:0:b0:38f:4493:e274 with SMTP id ffacd0b85a97d-38f4493ffe2mr2685265f8f.54.1739780813258;
        Mon, 17 Feb 2025 00:26:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7f3sm147815945e9.29.2025.02.17.00.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:26:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v4 00/17] doc: improvements for ReadTheDocs
Date: Mon, 17 Feb 2025 09:26:51 +0100
Message-ID: <173978077536.64112.16244035934382093305.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Feb 2025 13:59:21 +0100, Bartosz Golaszewski wrote:
> One thing that this project is missing is nicely looking, accessible and
> automatically updated documentation. I'd like to finally address it and
> replace our static doxygen pages with sphinx docs.
> 
> I spent some time playing with sphinx, doxygen, breathe and exhale. It
> turned out that exhale doesn't support doxygen groups and I really want
> to have them for the core C API to avoid having to manually assign each
> function to a specific module. That means we must use breathe on its own
> to integrate our existing doxygen docs with .rst.
> 
> [...]

I'm happy with the series so let's merge it and start building the official
docs from the master branch.

[01/17] build: set PACKAGE_URL
        commit: 588a196abbebc82eaa3495a9db4e9edfbaa44ed9
[02/17] bindings: cxx: doc: remove the gpiod_cxx doxygen group
        commit: e025e1cb5cbb5be933ab3d7b34cef2800a41eed1
[03/17] bindings: python: doc: update the docstring for gpiod.request_lines()
        commit: 8aa4d84b6f8e2d5d5fbb1b5c23d0eab69f9bf72a
[04/17] bindings: python: doc: make code examples appear as such in sphinx
        commit: b1bc6664f697c2aa693192d43f58d01b8210d3e5
[05/17] bindings: python: doc: describe undocumented members
        commit: d46e8f67aa45e2acbe8b918ff9815628167aea9b
[06/17] bindings: gpiod: reword the docstring for LineRequest.__init__()
        commit: 7ac26508931ce6aa8a5b2f9e45bcdeb4fb9d80a1
[07/17] bindings: glib: add the configuration file for gi-docgen
        commit: d0139ffa9c02b594e36681d3bb2b48932b3d573d
[08/17] dbus: daemon: add a more detailed description to help text
        commit: 681c0c2767944f668f2e6649ff0663ce4dbbcbd1
[09/17] dbus: client: tweak help text
        commit: 1ddfa9fc4b5b58bcf11a8852c5b71a66223de9ac
[10/17] dbus: improve comments in API xml
        commit: 91955a1f934452eafbc862de2b3392110cc338c0
[11/17] doc: create man entries for gpio-manager and gpiocli
        commit: 3b4a2ced02138c2837f99bfd1ed3773390ded74a
[12/17] doc: provide sphinx docs for the core C API and C++ bindings
        commit: 7e11886fffc095b9d3f211d49a49f96cfd73e578
[13/17] doc: add documentation for python bindings
        commit: 07da46218683322a246dfe5eda317589cd822a58
[14/17] doc: add documentation for GLib bindings
        commit: f37aaf2a6af66f22518091c7c58de596ff613010
[15/17] doc: add documentation for gpio-tools
        commit: 6f8b77c712a30ebea4089d317f4f8617287341cc
[16/17] doc: add documentation for D-Bus API, daemon and command-line client
        commit: bbcb5d44611d15d4db5d4f9fdb3362a0f84d7d10
[17/17] doc: move README contents to sphinx docs
        commit: dda57bd63f220d57bf80e3c1411ee612befda011

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

