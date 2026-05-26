Return-Path: <linux-gpio+bounces-37545-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN6PFFLcFWpzdQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37545-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:45:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9105DAE32
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E3A0300C7E7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 17:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E78C41C30F;
	Tue, 26 May 2026 17:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baQx7Cas"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51F410D37
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817548; cv=pass; b=mRt4GU/vWlZcgpm9RkwqaZYEQnwdDqy5oQXKHas/i2Sun8A5c1HWdwxxV/KgvDBSGkLJN6jBlxvNZgLLNRQLBYb/MBF8C8wCoiq8ij+nRLrjWp7Acz2+x2kN7lyDHFJhqozrc2/WkTrx63iLc7fKQoWbeq/uJDbKQeX6tDgUrlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817548; c=relaxed/simple;
	bh=y1lMBuG4tB8iDBcWBkJjpV7w6ve9zeNKYweoLhSqFP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2HQQCkU95jaXFScJLqJTg5Z0W07YFEjyTdpXVeU5TJw4g0rnIoYaw9STJnP606Z9BZ/rDBXdk5uSzAY8De1E1h1Xub8WE8vx/PShLY2tVon1TjUUJnDX0RX43+hyypL55MObKjMx9U4hGYEBqj6QrekUPk3ruQIUbbPS62WpoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baQx7Cas; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bde9d73678so111210887b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817546; cv=none;
        d=google.com; s=arc-20240605;
        b=URqhdh1NqVRKk3j8QByiiKXOcVxkRRejtg0h2r6GbCAfUKk75Zchik/y6UEsnyhNp3
         Kn4Td9z0fVnePW3DvGewbgLWAGaizSCzltgpEkVP/3vno64PO08m9/mq7AqcQK6AwJYE
         MIZIINeICYOtrDOt6c+p47vIhXIJQY9Lwru4qeAoapY68XF/cEzrOhFUPeDffc60GAb5
         lHremGLLIGIMHNO4SvBFUrJ1Ughicz+/1a/uqFPtLiraiaZazL76FGsFIjlSSe4VSxPY
         AFtt7R/+DE5nqonlto6paiZXMLEY7MUCdl+gDZpNqGecAYG97dkeJg5/pRYRetQF0+vE
         Q8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNaHFxMYzogeNLVau+FaeyKV8yS5iM27JnCQOsp9/Pc=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=fFxOmRW85alr5ZpuXtIOmy7xq7DGhT9J/RuzMxIVzQh01niEHZ2KdYnpipdOQFy+4r
         M7tn7RpD8EdCv/h8Np6AEHxwLt8JkaefhWcNiprhBRnZvhoWzfDsrb1pvDm4Rqi1kXLJ
         RHs+Fj/9a4x+2tZnYeXTr4eCR7v8n+kZ1xfXlVfWPm5GsOvKI0sQQtzTrbP5cUad51uY
         UFn7qVSwCnL5uYmlOMjPbmnvt2GMCrAxAOovVPXgfbydiCIvVm8KBeKtNKwDz2aEfYLa
         pqWSSx9GsOkvWsgbLiZPMZaQKiy3DX43trZGLL47ysUYx56o5DgieEZb+UE1UPMyp52w
         mW5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817546; x=1780422346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNaHFxMYzogeNLVau+FaeyKV8yS5iM27JnCQOsp9/Pc=;
        b=baQx7Casz9Vy0D+wsR8WyZzMriJDcdeMi7CRM6lE9+yAsOo/GUY/1NKTmFsOpwBUQO
         DxrV/dfde5RdVN6lgPEKzeEmo6r9TtN4e6zsuBP1XGz9hNbWL1VaDC4LnQm25OA5ApsB
         p3xr9ESTSHfctkzbZO7Tz27qlcJ/miypvFaL/s28y2lsAkqWnTWfA/B6mOsukG0jD2/p
         Drv/BWAanYZr7jiQD2e2gApdCKYdixkCMnrrtJBpZQPGvZB9GIt3yZI0+7V5FHMELN/Y
         DhswMOZRhPjg1skSVr5fV/aESt+sQ5J56a/QvvSrwbNy8UV4w6tNHk833kalimIUsiur
         n5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817546; x=1780422346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNaHFxMYzogeNLVau+FaeyKV8yS5iM27JnCQOsp9/Pc=;
        b=YZU6czIuYqMjv5g+xIEYT30Orb4+gcUj1WWn+r2lzdhC4EMvMUPB04whuIY1Az8syc
         JM0ApS1XGyEpg4ElGRujB+1BXrJFjUhB0HY4euIDkmjIuJSK8hdxeTmjQd6V21RgZJ3c
         VdZi+Ts/YqfvM8ZJj+osTwbO5Jij0/c+wkMhJE4TU+vv7xu49DzitWb5WT5ihaMxkZaA
         yO13hy3+ub0Y0t4HUtfOyBlRK+5Dhz9eCvy3dPWhVeT6DsTdDhJoIYWy3H3ctDrT6TN/
         kfgDn34Fc8DS7m/1EdOM6Bx5auNrnuvEW8BzC7zTY+bKMP04Y3NrMY0mw5TqwlRIq6XM
         hfOg==
X-Gm-Message-State: AOJu0YzR+zxnuAxAeNPhwplDk7676TvV81e/pjwIentHQWSriyImDiHk
	qi5M+lZB1afn78Y2TREwL1mEQrccaDmzX60aJmISwIbKSx2Hret2kkdU1N7j/CzCBBGq+GYiOfG
	Oix3NlxNSNZ7fwLKSWZ1P1K1k1c8TB4rDOg==
X-Gm-Gg: Acq92OG2Wdituap4OSkxy5lh5sz9F1L4HCx0ENUUyQ9PTGhr4aCDxdVPosK0AnVspVm
	uYk7FSKmsB3aKN4Lx6O2zlA7mZLUVbofJ2CrjW1RtR+MyXznsw7kzOMvvwmndXSvuU8KHlLdlP3
	X8lyqpWQjdisqMSEASjHyhyI1LTNgXRtpqoOZEVDFJhLuF2h+w3LMQkwfG2Q3mRtCwcnA/VdKVD
	fHGtOYgEOH0ixdcmP5bZ9DI6d9zUOeHGNUKARlyEkyTwAG45Rp9Orh3xXJEBfohguXgmJBOpIIm
	F/HGkIh4zQlhY9kplxUfgdZP0oxtS6BDvB+tIVsJ
X-Received: by 2002:a05:690c:16:b0:7c2:db9a:7bdc with SMTP id
 00721157ae682-7d20d50d345mr190974927b3.22.1779817546031; Tue, 26 May 2026
 10:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com> <20260522200419.105496-2-vfazio@gmail.com>
 <CAMRc=Mdbx79maxLFXOf-=UPe298fin9hqFzdzY7vc59P1Fss-w@mail.gmail.com>
In-Reply-To: <CAMRc=Mdbx79maxLFXOf-=UPe298fin9hqFzdzY7vc59P1Fss-w@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 26 May 2026 12:45:34 -0500
X-Gm-Features: AVHnY4IRHM1jGKcV4bz5-RhzAilLEEohAr6PJLcjS7oh6EIUyLN-lTvoMk640H8
Message-ID: <CAOrEah7sz2r0qzsd74kO5UfGw19qze-dLxd8U9gWA0_7r6tY-w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: tests: add multi-threaded tests
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37545-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,python.org:url]
X-Rspamd-Queue-Id: 4B9105DAE32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 6:06=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, 22 May 2026 22:04:16 +0200, Vincent Fazio <vfazio@gmail.com> said=
:
> > Add new multi-threaded test cases to ensure the bindings operate as
> > expected and do not lead to crashes or data corruption.
> >
>
> Awesome work, thanks for doing this!
>
> I assume these tests effectively don't test anything in single-threaded p=
ython?
>

The tests still run since there's a small chance that the Python interprete=
r
could switch threads at an inopportune time and cause issues. We could try
to bring this out with `sys.setswitchinterval` [0][1].

It didn't seem like something we needed to test explicitly because if we're
passing on a free-threaded build, we're more than likely going to pass on a
standard GIL-enabled build if proper synchronization is used.

> > +    def shortDescription(self) -> None:
> > +        return None
> > +
>
> Is this needed? Tests seem to work without it.


It's a short-cut to stop unittest from printing out the first line of the
docstring as the test description [2] which I found irritating while debugg=
ing
in verbose mode. Instead of trying to make the docstrings more succinct, I =
just
neutered the feature by stubbing this out.

-Vincent

[0]: https://docs.python.org/3/library/sys.html#sys.setswitchinterval
[1]: https://py-free-threading.github.io/testing/#validating-thread-safety-=
with-testing
[2]: https://docs.python.org/3/library/unittest.html#unittest.TestCase.shor=
tDescription

