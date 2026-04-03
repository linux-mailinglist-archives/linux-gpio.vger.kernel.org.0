Return-Path: <linux-gpio+bounces-34640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMHHMl++z2nd0AYAu9opvQ
	(envelope-from <linux-gpio+bounces-34640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:19:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF703945FD
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF72E301DD91
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A73D37C93C;
	Fri,  3 Apr 2026 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU//Be4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2009368263
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221780; cv=pass; b=JkveQHz1W2XFDEJnmGpknNGgJW2GBGz05JzpEwRIvjKusTV447NTQCPkbUy4ltULgQHillBg53v/le6ykZAZoDTdt5Us/zu+l+D6IYnpXia2jeYmrgTd19qXHs/JccrWqzJlWobQopOwRF2Uxlk2oT6fmcnQ7GWJaN4hI2qZ2Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221780; c=relaxed/simple;
	bh=F45zoa+g/BXFyfkgDrjG65c7CxKReKzwKOk5t25BW2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hh2JzWv3Qc2pHZkHHyR7IRzK3RGa1j1qy3eICr9AAyALRe9V2B6SW4rq0p7F0IekKXTbydXyXYVojytPK+1ahHcfi002pcbKx6JA2bc/AunOkVgIkoL6ydghAeVB+JhJjqv4ZYKm7vRAyyJaMp0i5+qXoC665KRs61JqCR6YqUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU//Be4O; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64eb84d1e37so1483351d50.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775221779; cv=none;
        d=google.com; s=arc-20240605;
        b=RScY3NRoH0fSu8qn+et0Gvq2ThrNU/6VjAewuCAu1mmSb1/HkUmpDDMXrk4yB6jIAx
         fmdvcNo36taumffdmDt0o7PL1RCVldN2VctbxYGcFPSKVKXHxPdWIQ0E6sVver3yHeYV
         v0DQUfSjoK8hf/pSKB0Szwv2IQMqLWDe8GkDgM8bOGBuYL5qudj8TXKrTDsolSUOUl9f
         i/4/+6T7ApGdxuJxnDmIXHJdeYbWtV6InpEheo5z6trFC8ma2jZLBN5l/YS2iMpm06+z
         9Q2g/aAngN42tishGaq07WAhQaBjR/pcEL6rtaz7/U3AocUlzwxtXrh/9QaxssURiDMi
         yV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F45zoa+g/BXFyfkgDrjG65c7CxKReKzwKOk5t25BW2E=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=Zx8smKv/SdcYXMKgcDZuTT4FjVZ5y58JiYEpRuc5SHxPG2p9fPm0VdDmTdWpebzOIU
         j1yeoUEvgPhQpjNJtLUZfIZF0GobHL5FEy2RzB7Qq5Y6pJKj4sHa9takMbyWo9ZYggad
         UKrbqc570bxzI2J48Z0VLTAxLUDWRkAF1kRxkPHqyWYLdW/+NI1cX87lgGpwYiTdDK3z
         dQ1yRm23j33GHzjTrwMK9HFnu7cqk5I/3o519jJxeDzD7HIfhi88AUIs07ql6aE2c9xc
         4hyhWDJeuxIPO8jY+KVUW5UvS8o0+0hAFZUrGev4Pal2PzlBmBof1T3qhR1KZTVA8gvf
         yKAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775221779; x=1775826579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F45zoa+g/BXFyfkgDrjG65c7CxKReKzwKOk5t25BW2E=;
        b=VU//Be4OrQ0rXBM6v5weALQqKX2wRWEuBMMz5QVlny9/jijCocsMY+Ra9jRaTybXAY
         s2aLQsvfA+EagKnkjqNZrEAupiJauT2cSMFxhGrbqe59x5qfVto9HBTGpcmmTgTrd/dO
         /+tKB2+pFXeob/0S6fcNASNiUmh0oFNfopekAi76S2U/bnQmfiBvdbF5YfkJ3wwI5zDO
         pBmEIf53CslVEtQTDkfqgFW1/QzeWPqBBnGTOGualFH20oYlrWIIinpIx4pjvbAUAaIg
         U4ADNcUOhgj8fbxYdnmSexBMdicKiKCpmpmgkceDFzRz6n9KScJEjm7Ootcci6Q5z0Eu
         Ay/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221779; x=1775826579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F45zoa+g/BXFyfkgDrjG65c7CxKReKzwKOk5t25BW2E=;
        b=Ms+LOgShQLgW6o+BGmAlcKFiPchOyRYJOcZXDyst4fBAz99JqL8Nvawm1PNCm2JpAk
         bVt4vEM5unbyH0FS+FH5q9xmkrONoCbUgB0N+ITcXYiAZsjnPr4xXGjCeIvGp6HFf7Bm
         kU4hsCI0kBwImuN0vkrZWVKeNnWYHDsRgiPXbfRoxE230Llm6ilZl1Bu9MiLGJbl2scb
         YZDCyvlH+jxB+4M51a8tSoYV0FVYzz/ZUxSSBleSYYN+Xms7XA1N4ER4+qE0pnVTl3kv
         X/Q62yQbwLh+UfAFgthimrg8Laq6cL5ux01fNWU//r/rGHS6bOTT1Un0OE56NGq2GoF7
         3O5A==
X-Gm-Message-State: AOJu0YwTjPSuGgEH6H4ZJOQ0n6ZTsgf2ik/PqjihkmY+hb+MUqSYrzeR
	YpU95IS7uBsv3WcPSU9HAFsbnUIOAKjF9jRK9vqzkuFxOcPW4WjsRQA60U4U7GT8ggkL5FB4U2Z
	yTlwhPO3IqblvV4vtKHdaf7TRXhCg3DLA98/P
X-Gm-Gg: AeBDievR0nVg0FENJtJWk5oN8Wg+1ITRQS0m/5GPnW/13dCr2ctCSZW/sAdR/YOU3pa
	ZJew82M6+9Oz4Bt0U8axT5NlTX3F4BDUIcg9zcayjindnf25fRp9W/AW2BXzDGU9+N1WzllxevT
	/SNZL2OqNYjzJ3RldRBjDhOL/LKwRIPwD9ZzAWMX1DmihbvU7lyupB8D3ZDFWFAB91ZWXSMrHZr
	HQ3TadcdDsUWI3SxmBM5rYCD7QWAFvBKn4YZbJ70hCl3ddKAZtxjghG2O1QDQ8nn/uPkTsnL1Bt
	Er6ZEOXqxytOcssH8Whd2jr7AqMY9r8+IV9RmpAQSaUXLoTaeZY=
X-Received: by 2002:a05:690e:2512:20b0:64e:e896:a86 with SMTP id
 956f58d0204a3-6504881ebc7mr1992232d50.36.1775221778652; Fri, 03 Apr 2026
 06:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401001459.19159-1-vfazio@gmail.com> <20260401001459.19159-9-vfazio@gmail.com>
 <CAMRc=MdbVb4cXGE56eLOpAe33mgBKC971K-W-z8mUVZh_aVsJQ@mail.gmail.com>
 <CAOrEah6BHFHeCWxqzR57jOrAaJ7h6+_uwBn8bTFMr4x0oRffOg@mail.gmail.com>
 <CAMRc=MeQ+AXkXiCbELywekSEOsd3N_DZf1YNMMMYy=mCGWVLEQ@mail.gmail.com>
 <CAOrEah4FxteUvZHn-zN2fX7e7cvfov4gVw-AKbzgANg+ur6wZA@mail.gmail.com> <CAMRc=Me286zYriFV-nFNV7K052RAe8H32CjZXbig2cmny7gNXw@mail.gmail.com>
In-Reply-To: <CAMRc=Me286zYriFV-nFNV7K052RAe8H32CjZXbig2cmny7gNXw@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Fri, 3 Apr 2026 08:09:27 -0500
X-Gm-Features: AQROBzCoS8ZzrIDpMyDdi82jv8V5nQpqcpnXZMScLWdxA1vY3iwLPXl68dMCrQ0
Message-ID: <CAOrEah4tpwLkWXbf++na4QUT8--fBT_9_-SkaBL-bmzPV_XhMQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 9/9] bindings: python: update linter configuration
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [12.34 / 15.00];
	PH_SURBL_MULTI(7.50)[htmlpreview.github.io:url];
	ABUSE_SURBL(5.00)[htmlpreview.github.io:url];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34640-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.917];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3EF703945FD
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Fri, Apr 3, 2026 at 4:02=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> I do run them but don't necessarily want them as a commit hook since
> not everyone is working on python side of libgpiod.

There are tools like pre-commit [0] and prek [1] that can trigger
specific actions based on what in the tree is being modified and file
type if that's something you're interested in.

>
> I queued the patches, thanks! I have to say: it's crazy how much
> faster ruff is compared to mypy.

mypy (at least the compiled version) is not too bad when it has a
cache built up since it can do incremental comparisons.

There are alternatives like ty and zuban that are written in rust but
mypy is the reference implementation and not all tools have the same
comprehensive checks, though there is evidence [2] that I may be
operating on old information.


[0]: https://github.com/pre-commit/pre-commit
[1]: https://github.com/j178/prek
[2]: https://htmlpreview.github.io/?https://github.com/python/typing/blob/m=
ain/conformance/results/results.html

