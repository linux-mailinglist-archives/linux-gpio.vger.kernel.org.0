Return-Path: <linux-gpio+bounces-37555-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP+FNKOiFmqBnwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37555-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:52:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CEA5E0A3C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DCEB3010BC7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F873CDBC6;
	Wed, 27 May 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3X3GE52"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345E3CF02C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868318; cv=none; b=PB2IhE1QSXf1Y8z9mV7W02PKE9Qv646UOtspaInthHv5wDcCHtLw4EMsACSk2q0BAoHIsyMfhBiW4Nx/TiWjGfV8GiNNgKq9tcfBzB95Vb8rNcqoVKEPwWZMw7iAxJ9NQeDVDzBwGrRzzKvON+CMnKI06ptUFmHdYw5hyzN8E2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868318; c=relaxed/simple;
	bh=AGBIh5uTyMvFuAPN9XXKk4NxipJS9msXutqQSW2UXAQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrxiQ573cRNjtPbp94uBvumscZnedDtqyL9ByJcw7IEPR0XGetXhwOoWR3ditQxJjzyOW+8GNo21j/AmnFpxzq+GZTyyih5Aqz7GmxklWFVnp9u3uR79KmSA/yncDA7Ijq13Gcx6Ts0RVlxNhLq9hocwe+HXAU6jT8M8GgfxeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3X3GE52; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9731F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779868317;
	bh=vHLwGbppZD+Q7QmW8iI0x1UHSpMt6X6tlYvi1l85upU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=H3X3GE52Esuw9tnM5dp09Gl6J1XbtSNDwgDoQbaxP2Ekp0K0hnUpKVL0hhMCY3oBs
	 fNss5dCHr0+PVWTK2jUh/TSQ/wNJIH/4swL2bs7HEng4+txWeuklqBV+4x35swD7a2
	 lLecm4uIiVemnYzd/ae+DIodax/SMnUHWCdMsCwjyQtOKvsLtLozXZi9mKcAHMzqpZ
	 8ZHhjaCCC7YUr5+7I1ICJJCWViRoss4+jrIjBOXTkNGMsMVrRwo3Z8y6DKaPs1XHNR
	 6rIRpTXWRP8TJEPnLxHY7hzR6kGuc5gyW9grqf948C86YcuolukuEqqOYCsj5jpl/B
	 lB+qL0ZJfrpYw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a87782588cso5002597e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 00:51:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YxppGW72jhAWr1anoDXiD+4D0tqDlD2wqtFroOKz4z96742x7Ou
	V/hmWgkSFDj10B1MworjqHO2iyfQaIAMW8PFbDPW/SUeqpzpDpBEqDPrgBsVEOtDGXyHlqgTlRm
	EC3cW4pEEv26O8UIODJEgexZ+Hg+Ln5tv+aVZ0d/dWw==
X-Received: by 2002:a05:6512:3186:b0:5a8:8eda:bed5 with SMTP id
 2adb3069b0e04-5aa3239abebmr6209582e87.32.1779868316143; Wed, 27 May 2026
 00:51:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 03:51:54 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 03:51:54 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAOrEah7sz2r0qzsd74kO5UfGw19qze-dLxd8U9gWA0_7r6tY-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com> <20260522200419.105496-2-vfazio@gmail.com>
 <CAMRc=Mdbx79maxLFXOf-=UPe298fin9hqFzdzY7vc59P1Fss-w@mail.gmail.com> <CAOrEah7sz2r0qzsd74kO5UfGw19qze-dLxd8U9gWA0_7r6tY-w@mail.gmail.com>
Date: Wed, 27 May 2026 03:51:54 -0400
X-Gmail-Original-Message-ID: <CAMRc=McY8vZUAoPrcfPV+2Szgi4D4ymZFZxx3-VDzkCpgthKsQ@mail.gmail.com>
X-Gm-Features: AVHnY4KbAzhQSGTLmxultplO5p7JbksQx6fSHZ7oDIg929aElhCxLLk4S8COYhg
Message-ID: <CAMRc=McY8vZUAoPrcfPV+2Szgi4D4ymZFZxx3-VDzkCpgthKsQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: tests: add multi-threaded tests
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37555-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,python.org:url,py-free-threading.github.io:url];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75CEA5E0A3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 19:45:34 +0200, Vincent Fazio <vfazio@gmail.com> said:
> On Tue, May 26, 2026 at 6:06=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> On Fri, 22 May 2026 22:04:16 +0200, Vincent Fazio <vfazio@gmail.com> sai=
d:
>> > Add new multi-threaded test cases to ensure the bindings operate as
>> > expected and do not lead to crashes or data corruption.
>> >
>>
>> Awesome work, thanks for doing this!
>>
>> I assume these tests effectively don't test anything in single-threaded =
python?
>>
>
> The tests still run since there's a small chance that the Python interpre=
ter
> could switch threads at an inopportune time and cause issues. We could tr=
y
> to bring this out with `sys.setswitchinterval` [0][1].
>
> It didn't seem like something we needed to test explicitly because if we'=
re
> passing on a free-threaded build, we're more than likely going to pass on=
 a
> standard GIL-enabled build if proper synchronization is used.
>
>> > +    def shortDescription(self) -> None:
>> > +        return None
>> > +
>>
>> Is this needed? Tests seem to work without it.
>
>
> It's a short-cut to stop unittest from printing out the first line of the
> docstring as the test description [2] which I found irritating while debu=
gging
> in verbose mode. Instead of trying to make the docstrings more succinct, =
I just
> neutered the feature by stubbing this out.
>

Would you mind just commenting on it here since you're already sending v2
anyway?

Bart

> -Vincent
>
> [0]: https://docs.python.org/3/library/sys.html#sys.setswitchinterval
> [1]: https://py-free-threading.github.io/testing/#validating-thread-safet=
y-with-testing
> [2]: https://docs.python.org/3/library/unittest.html#unittest.TestCase.sh=
ortDescription
>

