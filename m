Return-Path: <linux-gpio+bounces-31089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGlgKPyVd2n0iwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:27:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80D8AA93
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9032300613F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732BE33D6FA;
	Mon, 26 Jan 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm7M0CE9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60C533C515
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444858; cv=pass; b=r486OkK7DaeNF53fTsdTPVIqLEP9jVuVBgsLUUZlh1IiJ3CL1n2/ah7Hy+3/0FuaUJPF8yYyEfKWzRHsr9jO6cMlQBbX4Eb9S4Xi82W3g5uEXrnTblaT4i36vwQ0S/CxA3mWBIImi8BXbl41xso4TcQApb24hLhQdvcsKSjA8W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444858; c=relaxed/simple;
	bh=jCfrroXi3TvhSuXnvTgBicvKG87VvpaNM/PcS98fUhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/1jlpyWE/LBQfIn8e53+EB+86o0PMEOKevfKzqC0jKBShIY4xG7iXKqtnI3udNSO1z199tKrWN78pXv0VnscSBBRWP89/pv/IhOWjwzgl9u//P40gfUJZxO6fFCv5sZ++BohBAgQcza39YCuUuRMOza3bzBTHqLCrpo/6vEgIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm7M0CE9; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8838339fc6so897089266b.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 08:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769444855; cv=none;
        d=google.com; s=arc-20240605;
        b=KOGGsBIebloC3h44nFQ9GakH/u4JzqA33Yli0vm3awnNBetdCDsHucRZ73yqWFXRSH
         T1PSHsofBWkfI9QF9bzIpLriBj4VunO/b6ktGE4WsbP/H1Gdd1tIy6Lz3jYIjF1T/w38
         YdLt3m+BMJGPgiWv7EM6XLVMPd19+7bj9jXb62U1K3NmljeApSIyfiF/RmgqQqkgszvb
         KBzlvyfESspM+2FTitfRuAS1KQ3A3tQzF936+Z50DDzud9dZ/K27NJz1M5h8BykKWi1n
         vBfwDAZgi2dGCsF51TdzHTIJ3ILyFNjpPIpbFFUk/tX6OvPbiymE9JCWum95ADYcXTaE
         R8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=;
        fh=1PYt+wo3Culpx2U69hfSgRg9hh+3Da/TmFfMSFFd760=;
        b=QqGC72l+/6FlhGG6QZXsreB/fg+fSuBfjbngMxU1XhVy5rk7qSUK0ryx5JWmeujStw
         6wI6V/XIj1EPDTIHcCEHpU0XNUOxhG+cLaWNiwbewbe/gp5n+MyDGbixm9VDjko8Re/e
         1WDWqOn8rLDlYSDEMwJzV/jh37eFZcg+UBlWweq3k/oNLSqNO4YlyrS7jJel2wyZfMeC
         v4TZdJH0dH97WiQcGlfIzgfMwXa+o6JF/fEUYme02Gg/cw/UbHsqTW+vJmojbf2FLVre
         N+BQuMsAb2Q8YLAFmI2ULloaPf+nBhpT8sflwQWTIbpUmO23oRiXDkqqTSPsDed1sBns
         gxPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444855; x=1770049655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=;
        b=Cm7M0CE9G9FQ8c5qcGS/1159u1Qhx1KkbiSqoZsv7jCv6msGef5Z9qJsFJJdFxSY7G
         ISE04Wl7Sz2VwXnSEsJVImAbM576YISXMIO/aI9OpoJsqiGuP9ls6ILmaKV9JsSPlpDY
         6JRUh8ODO3xpKVyVNgY/wY5EuqhKqVeFsL0rqPtZY4YOvg/bBK1h1TnJhEltDe3hM9JR
         tmhO1bXiax2KqfB1L4qu3X6itBy/+CHgIc8dIAMnxH5JhtSE/UiqX/BQALEgKTfl0rvN
         eNOWzpRzJu3oT3yiLBZaKafG3zGlgnU4072AmfX2N8iCSP9HZ6ApR4DIY8WAoW6GgJ4S
         wVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444855; x=1770049655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=;
        b=Sk2A8uPWLAGgBMrfMAmX1/EGGkSKn+1BsB8T50V/RX0CGJWNHCH7RnMTBFfm3wgo8q
         smOQlzQWmxpXfZjjB0FZ7O6M8nEFAclarAvqeb2+55lHGPKDiTD1mm7ikTzZD52iCX9V
         GWCK595kEcOw3RK3wnNQgLYsQSXlP35lO21MuBW8CjlFNK1dJJ6DfB0j4Vpms/rpF88Y
         iXAH0/iUwIRass4FC8wwqSWsEeu+qWspsc66ZT/t6lcb9Du1tkCtU4fKeUWZiMd4OiNM
         V+P75eQfIZQEgdHw6gPjKFhgUhL4QwVG+z9yQfV+VSaaTzba4Ia99zcQEun+c7s1nSi6
         ug3A==
X-Forwarded-Encrypted: i=1; AJvYcCVtfwWImMUutQ9yJRxCnZw17KORXiu7kD6wIjK6PXLGHq6tq760Zr97GMM/z1rVFvV+CUlaZbd+IhiU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60SwMkMDljO5f1RJ2S1+9Q8RDg2BqSUgZB6Oj3XN7S7TGvSUq
	tkLV+aX70iSlT+h+HVAJo3O0LrqZNeEsvhugS0J01q+1RxxyYAls2BjTdUGloKeP4kaN1OTw4Tn
	WF5nXuwkdC9JgS7MkN8fBsdasvKz/YLA=
X-Gm-Gg: AZuq6aLI3j5UeNZl8nGIEXn+u3r5zTZQqWHaxIhoaehQMoreCxiqtO+yDtpgKg3Gkf4
	z6zmAZ4ZfE8vED1R9VU3Uk3voanBOZEj1a4zBFrTgmPnj5mM/DP6DT8dmnw9rTnKqVmvURsSljl
	91IWE+4pJyOcADslHGuuE9YbvZezJBRTtROg4BOil2WLxwVVrY+mM44zDfqy+8ZW6WHC4ZNdPbl
	+y3gaVslPMWsBiBcNql/gGf0ylA54bxx5LgqR/UsYcKryAyusxjssaoUjnDHYSjYeEh/LJ9GGlG
	XOtMBfX6+vowEo8Hz3mjHBRnHSJkl55R6xAPsZ8H11CzgfhzxBI134UjheTd9GoyrG7B16DzsYv
	YmwUpnw==
X-Received: by 2002:a17:907:968f:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b8ceed5bfc0mr416879066b.2.1769444854813; Mon, 26 Jan 2026
 08:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
 <20260122010516.1200630-4-florian.fainelli@broadcom.com> <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
 <a7b2f013-965b-436d-95f0-8ce1e2ec0c41@broadcom.com>
In-Reply-To: <a7b2f013-965b-436d-95f0-8ce1e2ec0c41@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Jan 2026 18:26:58 +0200
X-Gm-Features: AZwV_QjJmye1Ztm1Y3JRlqubTBVm6XTIk_3V-19hYG_-47rSPwV71iUOBV2yjhk
Message-ID: <CAHp75VdFE6A+Gv=-OsNT_GqJyzOfLDXSB+gant_jenSgtEYA7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31089-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,broadcom.com:email]
X-Rspamd-Queue-Id: 4D80D8AA93
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 9:24=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 1/21/2026 11:42 PM, Andy Shevchenko wrote:
> > On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:

...

> >> +               if (priv->suspended && bank->wake_active & (u32)status=
) {
> >
> > Why casting?
>
> status is an unsigned long, which is what for_each_set_bit() expects, so
> it is intended here to ensure the top bits are not participating in the
> comparison, I think this is just being extra explicit with intent here.

Isn't that guaranteed by the C standard?

> >> +                       priv->suspended =3D false;
> >> +                       pm_wakeup_event(&priv->pdev->dev, 0);
> >> +               }


--=20
With Best Regards,
Andy Shevchenko

