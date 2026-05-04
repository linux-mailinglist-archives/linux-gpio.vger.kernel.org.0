Return-Path: <linux-gpio+bounces-36094-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGgTDgwJ+Wlt4gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36094-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:01:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 306BF4C3D67
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DEAC33008445
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E6433DEE6;
	Mon,  4 May 2026 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyQinYo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B130F7F3
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928451; cv=pass; b=o7wsMIxfV1DKPFPu6b4xNDLtllJjo4eQh/NBJ2GHJfrTkihZZymz8WvswM997d2eMIwdEmwVtYsaIukReWsrW4jqa9Nlm+KTG9AJmFgkT9hS1bcLoICkVH1oRjQjzlp64cwbJtZJgcplXRns7wb4PW95Y/UOW0wB9ahN7zgtLng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928451; c=relaxed/simple;
	bh=2/KjE9HnteZ/50b6Nijz+rgvhEOOWn8JvLdnywqUcWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYgv0+Tf9Oo7ov5rs3gPen2Q4VgbE28v3tDwLx3vLbN2AECAnYEWgUIY2Q0h8CgVUN41gT5vRPQ4j4v1+LMz1gEl1DxD00+EbnRvxXNICXaoN/YE680PeImKQW/SxfW/LjF8tgJLLnHd4URF/qeoc/lMCZRw21br8UjDxNGG8TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyQinYo4; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6587cee8b57so4956126d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 14:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777928450; cv=none;
        d=google.com; s=arc-20240605;
        b=KrLTr4d4fa5eoIeFDsdsbnIJ5+hME6uXRRBskt1VNfIbBaJGEUKPvZcdpTuBan/ss9
         iHKDnMwGD4qhrKEXCIA99x9DQAPT+xoOmPThkjJOaM1uqIUKRC0nC2tnq5dK/ie5KQlL
         8JotPqz/VznHb9Sz8wFtmNjHtybJiwe1vNKKskECpkIDk3jydTi0EjMLtVtiGiFwli6H
         JXWJkO2s1LpAm11RsejntwKvKJLBoN3z2dMTossA0BQ57kAICS2unvb+nXOHlqoFszA0
         gWoiFfMRABdiOabSQN9vV7/7bh0xwQJXIbfGffDhDeWLxTBXB32gHRZcYepAAtlvlurc
         tTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/KjE9HnteZ/50b6Nijz+rgvhEOOWn8JvLdnywqUcWw=;
        fh=OSpvQJ4KiZ6/y0YrcIHFOUNP5xYE3mtjpvUmzb0IccI=;
        b=k1HoXSgovkwkfN+t9Lu9y2JyKyMrQNbr35h6zhVijEFTdkJIq+U+5bLgAUBW/hIYLM
         jbJkrGTb1wpFMZzy4/viWSpOBSyko6IrYhpxjR532jFvlDOQFCm1EWQKH9W70aU4+G68
         gMPGbb5Qv0KFN4K8A5BY7lJmb9C43iaZziK4afHVnKCB2SbtU2ms2RgLW2iRqNFuni9f
         GvuCWKkrPhUSTsWCNW7//aXJ/rXzUSRrBEGr2o9nWxyAp6+WV9B4jFEXiofFJKsJW5rp
         QjHEFW/TLj1c8Xsddo67R9wz5gZQqxprQih0gbDtVy5fEsTRTYbKqLBh2RxlX/OONAWE
         Jc6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777928450; x=1778533250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/KjE9HnteZ/50b6Nijz+rgvhEOOWn8JvLdnywqUcWw=;
        b=eyQinYo4RC1RszLhAqCGjqrJn8VJEjPwOb6zlOPIblF36A6J43i5HHriJg+HoJR4jk
         auNMgKJBzY0dwnItbag8SyQkTaMvK9ix6Ywu//CDMYWeYOVNZAkyATogZk7QfjVjYDc5
         6Cjp9qcP9U7788Tz7yCzhpoB3BmzNU2u79tosFmKHHlTyvBKl2k0Rwwuv5MMRdZhNtoW
         bZilLjGrP1j9pN0Sz4AznEF4dk4xbzCPUK0BlTsPqNJuTEqr6u3Jsv7w+gaeeaumU2Cn
         lwQr22K+gIl2a8fBeDX6mDagV5wI+t1W2UD9UNt3wC+F3RpQokSQdzPY9B+XXYCK6SJf
         gbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777928450; x=1778533250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/KjE9HnteZ/50b6Nijz+rgvhEOOWn8JvLdnywqUcWw=;
        b=rW3sKU3Z1EFGnsG0roeKngq9H8mDggDO9RUrO54egZ/S6GsD6HSWTeG/FWdlH+LEFY
         D5uMsIBZl8c2IzPWfEaj9UXqzov+8DojXQarfbfysqNCedoBjVuUzSyLGgufGHvi5TZE
         t+9qjq6d2MoR+nIMTwZgoH3N8NMEAWpn8dOCX/2v/UL2GeVQ/gMr/HlLvR1AikYqutkk
         QMf/0tbqbOYOb9ZSPmy9LkA2LrLp9vwe2BXGY/ZlODIYxoqHYb6Y/XrcwXq9jwYNyT8A
         yTbdlscMS2k/8A6ofJ8p/pJOWCKG3/miSTyA6jSZkyKHcrnv/fDJrYoW8+HV9r3Ndekh
         G6gg==
X-Forwarded-Encrypted: i=1; AFNElJ8FeDkmopBp4ELSKsaK4TnbI4ehcszbGdtj/blwR4aiPOIzGKn4RXQpvRZ/ml0GYaQA5FLxdGmWcZN8@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8zr3jnZBGHFG9yHkKm4nWbNc1ajugibmw5xyKsz9zMZaHPzR
	1IFmFRIz36duOQPAS8/Xq8JwaCiZJ57A0EfKbp0h3m+l3MGAtZPPLcGKFyBXVKB+IFd2hCJwSqc
	u0WtKsYo95XxZGJg6v2G4V1Fxi4lkQ7E=
X-Gm-Gg: AeBDietquW+DvXxWT6CzQZE7E1XFWfxhJCM2NvtXLmwUSV/lMRCpW+FUg+jmlsuuTzC
	q3DhXdpXO57h0TxJj/jqvfWrt8ns13hm6M5/O3J71ChvfmAEeuSS6eeZTPq3mF/0XrfIQcGp3/T
	fs3mBypSJkZAbflQTIrEphrlTkVmV8p60jg6cTH8mFLw4bY9Uw9S3HFNn9OemweU1IGorwSwqVM
	/KFqoyMSHBPqT5nphwx3dki2YYZvnVqWrTuWrc5JKAXx+moByXEh4qpm7AjixEMCRu/+jWExcfi
	tm0lA6MGcXnUk7WH/LdMADt5tHOG3IXz43c7s47aV3SssOb4NXnhi01WytNodF4=
X-Received: by 2002:a05:690e:148b:b0:651:c29e:f0b0 with SMTP id
 956f58d0204a3-65c69c768ebmr564171d50.4.1777928449612; Mon, 04 May 2026
 14:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504195251.53771-1-lucasp.linux@gmail.com>
 <DIA656PT46GW.2Q15WVT679RS6@gmail.com> <CAKYXYMRX-oV6iO+Kh+dV7_2BfsY9gjdXMw6cueOgYw2hjLWeaQ@mail.gmail.com>
 <CAKqfh0EPFPxFN8ime2EaO9gP8z2m8mshR9b1dEswgzQe-2Ge2Q@mail.gmail.com>
In-Reply-To: <CAKqfh0EPFPxFN8ime2EaO9gP8z2m8mshR9b1dEswgzQe-2Ge2Q@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 16:00:38 -0500
X-Gm-Features: AVHnY4Kx7yNh21XfqT_4tqqDng308pjM8o-28jBx-Yznrn0LSIPv8tuMrJ4YoGI
Message-ID: <CAKqfh0HA7s=apD4u3DbauME-7NWK7CbUAAm5ArdkRjjHHF=hCA@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: replace strncpy with strscpy
To: Lucas <lucasp.linux@gmail.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 306BF4C3D67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36094-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, May 4, 2026 at 3:54=E2=80=AFPM Maxwell Doose <m32285159@gmail.com> =
wrote:
>
> Hi Lucas,
>
> On Mon, May 4, 2026 at 3:34=E2=80=AFPM Lucas <lucasp.linux@gmail.com> wro=
te:
> >
> > Hi Max,
> >
> > Thank you for your review and your kind words!
> >
> > I will follow your recommendations and send a v2 shortly. I'll make sur=
e
> > to update the function call to include the destination buffer size, and
> > I'll also correct the commit message and subject as you pointed out.
> >
> > I'll include your "Reviewed-by" tag in the new version.
> >
> > Best regards,
> > Lucas
> >
>
> Actually, timeout, I'm not sure if strscpy() is allowed in tools/. I'm
> going to double-check and I'll let you know if it is.
>
> best regards,
> max

Alright, just checked tools/include/linux/string.h, this can't be done
unfortunately. I like the idea though, perhaps you should submit a
patch adding strscpy there.

best regards,
max

