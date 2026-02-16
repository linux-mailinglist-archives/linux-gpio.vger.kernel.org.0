Return-Path: <linux-gpio+bounces-31721-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAKdDyVAk2kg2wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31721-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 17:04:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB3145E6B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 17:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D8D03007F75
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 16:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C132A318EE6;
	Mon, 16 Feb 2026 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkyzU9sU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409C3D544
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257879; cv=none; b=ei9DaDmnxI1ZCHTjNOIYM30bnhCPQktw2li2YkJwHatytG40Resg66/v8O+Z9ZstLkynTj8qvxlDCzsimXGCmp9GnrkJVskkt2TkEXX9Stimx6WJXIkCZWbOmQxhT4kVrLyKURCctgsrNmOCEEjII/TB1bZREXsUEXS8+lZ1s8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257879; c=relaxed/simple;
	bh=wI0LWFy8ddddsWoIw3P+09cDx6ZTwqr3s7UfJFHnrQk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guOR70CUFeyB6e+/DDnTzVNLkWJEWaPZoTVVBhZ8eglSEi5sIuP7iPx6Bj5/yquZq/cLTu7jviquqrZbzmZ0tnKw+X1OujEJTLthFkGQg8qZf9H2tDeSVcHIqUdV33pN+0CouxHz/aSsF6llTdLi6ZMRU9n4QjhDwgGEQn8bSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkyzU9sU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57621C116C6
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771257879;
	bh=wI0LWFy8ddddsWoIw3P+09cDx6ZTwqr3s7UfJFHnrQk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YkyzU9sUHK0/bNTMS6KqdIY6nGaGSBRNGd9tQPBEMMKRqhL8UN8Gy5pnlNKJxnm3u
	 9LZNC3dq1o+kFsBEEfWrS0QDa2eqVRY1aB7sRCIucEAiPrSTZP2ySftxM7Jb3tlvbf
	 KBhYLighwTj1ARJrUIHePFyxp2w35VVJItnw7DY4kEJjfpVJ+BTwwnuFAac1BM0QRK
	 ptCNWfszdGE0GPr1PRUk4Q4ywe+spniIVfsgFDwBtubWL+MvDT5VLCp7hrb3OwmJyH
	 +RVviUrn3BaenoOmWMSPrFqh2Rcg75oOqTwfOslsLcA4ehIfSRv5NXN6GM2Hb0N7g5
	 9i5hmsLAsfgpQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3870dec27f4so25516401fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:04:39 -0800 (PST)
X-Gm-Message-State: AOJu0YwTsj+8gVZDS7GMmgan7zbJFPlN4UA9yCxMcALEf9omTe9lBZfv
	RsWMO26NKA231gJyglf6cwAlBADGennf5R41kG7b+3cQU1mOGhjmxAMk3Gq/XqFCzxlgTbtyGPl
	FC6aLfFjZ8jHAz7aAmipI1L5hHU9Uzl0x5XNOe+rQ9g==
X-Received: by 2002:a05:651c:400f:b0:385:c236:33a2 with SMTP id
 38308e7fff4ca-38819d78feemr20377051fa.16.1771257878023; Mon, 16 Feb 2026
 08:04:38 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 10:04:36 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 10:04:36 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <3a32c32a-5f4b-4f7f-a7d0-c5b708be780c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214003402.3851492-1-dlechner@baylibre.com>
 <CAMRc=Mf7LNW+3u9j97VwLpmXGgZAKZuqNiYNYUS7wd4oxsndeQ@mail.gmail.com>
 <3f763c4e-e57e-4282-80c9-7cbda8bb6926@baylibre.com> <3a32c32a-5f4b-4f7f-a7d0-c5b708be780c@baylibre.com>
Date: Mon, 16 Feb 2026 10:04:36 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfRgFjxB2HQ262t7k1Robt3mDOddCAAZ6wRz5ONKwkFiw@mail.gmail.com>
X-Gm-Features: AaiRm53AKqcher-1wq8qIgg4P6ikom7RhUPTIRZnMppgzH2TFgtT-ROANJZxKTE
Message-ID: <CAMRc=MfRgFjxB2HQ262t7k1Robt3mDOddCAAZ6wRz5ONKwkFiw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] dbus: add -c option to gpiocli-get/set commands
To: David Lechner <dlechner@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31721-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email,mail.gmail.com:mid];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96DB3145E6B
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 16:53:55 +0100, David Lechner <dlechner@baylibre.com> s=
aid:
> On 2/16/26 9:16 AM, David Lechner wrote:
>> On 2/16/26 4:30 AM, Bartosz Golaszewski wrote:
>>> On Sat, Feb 14, 2026 at 1:34=E2=80=AFAM David Lechner <dlechner@baylibr=
e.com> wrote:
>>>>
>>>> Add the -c/--chip option to gpiocli-get/set to allow users to specify =
a
>>>> chip and line number instead of a line name. This is useful when a lin=
e
>>>> does not have a name.
>>>>
>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>>> ---
>>>
>>> Hi David!
>>>
>>> I did not accidentally omit the --chip option in gpiocli
>>> get/set/monitor. GetValues/SetValues are methods of the Request
>>> interface, not Chip. User can request lines with a chip specified but
>>> getting/setting values happens on the object implementing the Request
>>> interface. You can check what requests are currently managed with
>>> `gpiocli requests` and use the -r/--request to restrict the scope to a
>>> particular one.
>>>
>>> In other words, I don't think the client needs this.
>>>
>>> Bartosz
>>
>> OK. It just seems strange that the get/set commands have the offset and
>> name options too if the intention is to only use the request name and
>> not the line name or chip and offset specifiers.
>
> I shouldn't reply to emails first thing in the morning. :-p
>
> Now that my brain is working better, I get it that the offset/name
> are needed because the request itself can contain multiple lines
> and this is how the lines are identified in the request.
>
> And if you need lines from two different chips in a single request,
> then you need to do the gpio-aggregator thing to make them look like
> they are all on a single chip.
>

Yes, just as if you were using the library's C API.

Bart

