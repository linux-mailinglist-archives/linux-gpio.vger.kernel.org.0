Return-Path: <linux-gpio+bounces-34594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eICYKH+AzmkqoAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 16:43:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B838AC22
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 16:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98EA630238F7
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 14:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FB53E5593;
	Thu,  2 Apr 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bP8POma2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA953CA4AB
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140669; cv=none; b=GCAuTKU6iGui0Wc2BqNxmkYOQ0nBXzry0c7uEx8HaO3wJSBK8svMPT4zCQvv2YCd9g+3OFdzB0wuEHNpcWxdZqbO9pMR0IugboJcbLzZWPVsnZm+xcU6zfTMX3O4Ggkr2mjDALZ+9RQhssB8tnyq99ibbfAILuoXCXGt+BfhGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140669; c=relaxed/simple;
	bh=9I9t0C+gSbw8zKeuqt77He+iPSUovR0xdxqTAKN7wg0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmaZtc1TtnxfhH9VZrqXJ9Vz45efzAyZ5ya5iuwJccCr2S1iufSbPuo07u0HCVWUZBTo0u6zmn9rN1ubJloB7VGT789pqPPwnPsOy+6586jl9i1bPgQHdF8k3z9E8D5R+2orXhLTJeoY7qhlY14ufx2lT73hCKGApg0eAc3fEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bP8POma2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA79C116C6
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775140669;
	bh=9I9t0C+gSbw8zKeuqt77He+iPSUovR0xdxqTAKN7wg0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=bP8POma29+KIrl8vR8krSwnPyaea0g4mNm1+LcnNNEzCdP7StY6X8o51o17WrqGD+
	 CyNJkhpN2lVgtKOq7RABzL/O2kEtN4luDMjpMahbNtHd90sT6vo8H8ZFq2XqsO3UeV
	 N/uUCofiOwAuP7n5lZumzuJSS0dxwSoBM2cbZJOvT4KN4sRBFmlnaNvr5iAz/TRb1n
	 sE/UU52z7qkScNs4Ytx9FoaZWsKttOoxgyLOJNV9vyp5dd9vI5ksl2TWL1yOPhuKyq
	 E58oTlc+uI78/p22Mlo2cR27Xucj2m2ghjNYdaCLgeYTeFvG0bk62jQRjzf4ZS+ha6
	 bBP/FG7+Y7SLA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so1137592e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 07:37:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YySLzc/ofFaSUaI5vDzLpelEv+rnEbfbYZC0vTSmRyI8I273Y12
	3RPcMRI1LdkCbF1E5E2VhejFnRpkAAB3IxUgBlsni8lRmUt8JmFein9IQdR3L/JaJjCE44Y9/Ng
	HVZA7aEdIFBeniXGLoqeWYx1+kyIOR+r29bOHMt0gtQ==
X-Received: by 2002:a05:6512:b17:b0:5a2:b59a:5ea2 with SMTP id
 2adb3069b0e04-5a2c1f196acmr3636903e87.23.1775140667811; Thu, 02 Apr 2026
 07:37:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 07:37:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 07:37:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260401001459.19159-9-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401001459.19159-1-vfazio@gmail.com> <20260401001459.19159-9-vfazio@gmail.com>
Date: Thu, 2 Apr 2026 07:37:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
X-Gm-Features: AQROBzDi7iV1meZ6P3MJibfjvcNxsXl31mCi_n6PHJcSqCEzv8eXCNHD5f4FejU
Message-ID: <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34594-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D8B838AC22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 02:14:58 +0200, Vincent Fazio <vfazio@gmail.com> said:
> Simplify linter configuration to check all files in the bindings
> directory while excluding files in .gitignore.
>
> With a minimum mypy version of 1.18.1, the `strict_equality` knob can
> be removed as it was a work around a known issue [0] that is now fixed.
>
> With a minimum ruff version of 15.x, rename the TCH check to TC since
> it was renamed in v0.8.0 [1].
>
> [0]: https://github.com/python/mypy/issues/10910
> [1]: https://github.com/astral-sh/ruff/releases/tag/0.8.0
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---

Ruff checks work fine but I'm seeing this with mypy:

$ mypy
build_tests.py:22: error: Library stubs not installed for "setuptools"
 [import-untyped]
build_tests.py:23: error: Library stubs not installed for
"setuptools.command.build_ext"  [import-untyped]
build_tests.py:23: note: Hint: "python3 -m pip install types-setuptools"
build_tests.py:23: note: (or run "mypy --install-types" to install all
missing stub packages)
build_tests.py:23: note: See
https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
setup.py:10: error: Library stubs not installed for "setuptools"
[import-untyped]
setup.py:11: error: Library stubs not installed for
"setuptools.command.build_ext"  [import-untyped]
setup.py:12: error: Library stubs not installed for
"setuptools.command.sdist"  [import-untyped]
setup.py:13: error: Library stubs not installed for
"setuptools.errors"  [import-untyped]
Found 6 errors in 2 files (checked 45 source files)

I'm using mypy v1.20.0. Is this something with my environment?

Bart

