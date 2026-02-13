Return-Path: <linux-gpio+bounces-31648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id t342DLPajmkrFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:02:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E503133C6B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8350A305F33D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0654731985D;
	Fri, 13 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjAZX8jc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60938318BAD
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969775; cv=pass; b=dwbwJyNjAO2e5hd5rmapkmn+Nt9CbnujUINuSw+555aCfk8b2Qt8/hwO4RMFOvPeNoCl/BV3b/Al+kOmhszavNXq65JFhbrGPKVFtOAHlkJM4hCf0PP8R1zr64kllQJaZI0PUwJhPrMOs2XC7vqRBi7EPSlSQLahH8ZAX+FCgoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969775; c=relaxed/simple;
	bh=ADatVKo3rZMrDxWVHnx+IY4BzioDqNA/2hzS4G99MMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzRfAJpOifWjnUZWIUylwbeE0vqWMBFFfNb9EVzhNhlJRbqctKs+C7JupcwM9IZwgIEhdACOLoCmE5SYL8Gt5WyjNOYoaO/r6X0hA0hgeRg0XvAnbS1ANpOWesGWhbo4/uwwnYlLfnCI1+yXscydP/4ZYu7RRHg4V5N6u4oRezo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjAZX8jc; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-948a378b9deso170596241.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 00:02:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770969772; cv=none;
        d=google.com; s=arc-20240605;
        b=KAyiyK7zkXiLhp9NWAY7jsqLrEL9SoLW0Zc0dADFsuZ6HrVv4M7Xxm73zsxBoiwvEd
         nkgLNs4x+r2QCLRtwlBkC+tA+nGivYQgl+Cu0CSI54OYvy2hzxWfDdMtwvpXW711jz2r
         WRx51h6MBjjNIJ4yhAzOJwso/6EjiwkNT+xk5NXzsmRMCpB+YGCwaFfqUApA8zFGpCca
         HPsMM4aJY/+L0OM/TI9bE7D8aU1EdLZWzqq4BrjZaGOySiDbfYQif04n6sE3RMFqB/ip
         7Ud4fstW0hRpyD1ef1tfg8UpDgwfSz5/mGciPV4m0jzD29lIpKUk6zbP5J0pe8ufgWEA
         cshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADatVKo3rZMrDxWVHnx+IY4BzioDqNA/2hzS4G99MMk=;
        fh=O15GnqyFo3ZiT5pBJXnVJKNSig5d9j/bYd8X0Xi9uhA=;
        b=goEWDIGvIWsWmPSTtoXzk/8E/O2rZVfl1zVC9vQDhTTnRsNwAPvocuysU4k14ZK28I
         3BTDg/j5zkH7pswSp/1UzBiMWvyTrGUilh7bD4WhkkiH3Rh5K41IZcCv1jP2nmf3cMNg
         qvntMsY1z3tZBmqHD1FM2h7V1NiF8NYetr+tZtvID6WR0pEIc5o6ME5tadiNkYgsOjkr
         1J8m086UM+T4WA/6SCOAQdnK+73TiblTrKOvmJjIkgPEC8PV5as1JwHUD3Sz+JbjeznJ
         1YQQ76LUvQWLh/u5mOJelbGoeywEGnXSH7xNVctoMI9UQO1XukSRGXTZG1GgIKIOLd7d
         JBpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770969772; x=1771574572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADatVKo3rZMrDxWVHnx+IY4BzioDqNA/2hzS4G99MMk=;
        b=kjAZX8jceR4Z6VGOgXuKn4u/Z9NvbMxVoTjUUR+xNTIA/yZGFjdLJcGJ58vVoLHW2k
         77ggp20xzfn7Qm8/hEI5OrxQqmR09nvUn8sHfHIsuRanRNj5XQBLQhxDZMKZiGrFnt9h
         2uwsaakeUnoAt2lZd5vQluAwktaEP54SwlnW7mvPJFzaJINiLTEc5tvf5f5B2jqHT/lP
         Y9GQNaVTqS9Q8j64q16V9kX+fA8NnQGpEqQey/xRKpYV+S/7c2YhbBappt+mjFmDZygm
         wKkxePW/VR56+8adNxL/XHWPiiaMawY9sTHlzOC+3lm9lmKErZ/TDx1i/yoslPPtBAp7
         ZiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770969772; x=1771574572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADatVKo3rZMrDxWVHnx+IY4BzioDqNA/2hzS4G99MMk=;
        b=flNYEPHwJY+O8NNtHZIhJCBv0Lu36s02AHpKPzTocjJqsw1/mFZLbFgOOgJaF0QVLw
         FVoiZUM0SRmWrSP8Olk7RpqAZs0Vc2jgl3ALb1oVUOXEvW3x+vVeY4+BUaTc0eXts+0j
         ybywTvg2/5wA9KiHSfCFiAt3b27cj6/iod3BiN+cMV5Jh6eY21SEDiRxFtVHTKgNKgq5
         TqjT1dIkFwGj/JQPtWnlFJVjGO+h2WhyrLOPDgZGaq5CYkE0hFlYUd3xG7Hni5r2iff8
         jwMgwUw5SfPcZx7fVdmdxuFa6tHIhCLVYPkuHJtp612lDU68m0+1kWjyH1hRy4GULQpN
         4obg==
X-Forwarded-Encrypted: i=1; AJvYcCXtTQlpYEpPX+jLIMSSEFTbEwBTAhst9ahzaxnEEnAknOCQL4ZI54BydxxYlTO22sWUIikL02Bd5BpP@vger.kernel.org
X-Gm-Message-State: AOJu0YxkVRgM4NJHSpfF09D9DoCPGhtSWTARJkt3cDEGYP/Ks7JP0GRK
	n52XxaNgFACjiUiBkvWfG6y/wVe2jrb317GInJn7Rrm/VYd+6fuC5j7RTTMR6TYx1UAZparPKNr
	ggWdQJmUIRddGnH57Xdv/hnLZmOr/6kg=
X-Gm-Gg: AZuq6aLMy/0uRXEnWyL/xpOQPg0cMlvGVFQlxA08hrcMS87mr+qAgTBkKJE5gdzyz3j
	9Q4G9q6tHNIRjIcLtXAgE/j+PqcoYBDfClLwSBNrl+BbkXxDai6hnGwfmbz5c7WwqX+FNtdB7i1
	TIlZKktY1GjMt+0OvDF6eI86hHhne1tbkpg+45f9yQM6oWODP34VfxZUTfT9pqfSZmYZxw+cZo1
	YnteHNCzhRNTDVRRaNwFHE5OrXTcbeQFADDdKYlqUCEk5wAwRGtcrhKCnkjbOWVqmFRJJBkFcPq
	pi4GFazQ5QcKs4dyr5VdR5Y/UVwWzZPCOSuWN/EG2uaLPGW8+dHyOq6PH3RMTKtbdBL1dZpmMyi
	OK2s=
X-Received: by 2002:a05:6102:dcb:b0:5df:b5d4:e45d with SMTP id
 ada2fe7eead31-5fe1ae65105mr291712137.33.1770969772085; Fri, 13 Feb 2026
 00:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org> <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
 <20260211214708.GA3947691-robh@kernel.org> <CADvTj4p-zHMrXW+GJstB2sKS-7Wij98JNJGoiPiYmaP5RHhNQg@mail.gmail.com>
 <9afa52c1-b7de-4ccb-9114-a142567d21af@kernel.org> <CADvTj4pmAXo+KUMyB0=+x3HRdUdUq=baj_pnoa44oxnugZuTOg@mail.gmail.com>
 <89c0dd51-fdd5-4368-b5f5-615143ffd166@kernel.org>
In-Reply-To: <89c0dd51-fdd5-4368-b5f5-615143ffd166@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Feb 2026 01:02:40 -0700
X-Gm-Features: AZwV_Qj_iwNXQ6RmAIEFBdUrg9cASfFzeeF-k5iTtS9faMgHJFCCusXY4_CNhoQ
Message-ID: <CADvTj4rhn32T=AOqq8boK6r0JXzV5oZ+CPWBEejLrUpP1771zA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31648-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 8E503133C6B
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 12:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/02/2026 20:16, James Hilliard wrote:
> > On Thu, Feb 12, 2026 at 12:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 11/02/2026 22:49, James Hilliard wrote:
> >>>>>>>
> >>>>>>> Regardless of the DT bindings - this change is perfectly fine. We=
 do
> >>>>>>
> >>>>>> You cannot have compatible without DT bindings, so this alone is n=
ot
> >>>>>> "perfectly fine". Maybe you wanted platform_device_id entry for
> >>>>>> ACPI/legacy/MFD devices?
> >>>>>>
> >>>>>
> >>>>> Sure you can, you just can't put it into upstream devicetree source=
s.
> >>>>> We have had a compatible for gpio-sim for testing purposes for year=
s.
> >>>>> Why would it be illegal to enable matching of platform drivers over=
 DT
> >>>>> for testing purposes?
> >>>>
> >>>> The primary issue is undocumented ones show up in 'make
> >>>> dt_compatible_check'. I would like that to be warning free.
> >>>
> >>> Would adding it here make sense?
> >>> https://github.com/torvalds/linux/blob/v6.19/Documentation/devicetree=
/bindings/incomplete-devices.yaml#L243-L245
> >>
> >> What would you like to achieve with that? The binding patch did not ha=
ve
> >> rationale why do we want it and here is the same question - what sort =
of
> >> problem is being solved by adding it to incomplete (so wrong) devices?
> >
> > See details for what I'm trying to accomplish with gpio-aggregator:
> > https://lore.kernel.org/all/CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAy=
dtxHOV8g@mail.gmail.com/
>
> I don't think that putting it into incomplete-devices would help you. I
> assume you read the binding... You still could not use that compatible
> in any upstreamable DTS code, even if this is only an overlay. You would
> have warnings...
>
> >
> > I'm basically trying to use it for the reasons described here:
> > https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/
> >
> > Is there a different device tree mechanism that can be used to
> > name individual gpio lines on a gpiochip without having to name
> > all of them for non-hog lines?
> >
> > I'm confused why a "gpio-delay" compatible is allowed but one
> > without the delay param is not?
> >
> > Or is the issue just with the name of the compatible I used being
> > called "gpio-aggregator"?
>
> No, the issue is that there is no hardware you are trying represent in DT=
S.

I'm trying to represent the physical board GPIO pin connections in
DTS...so representing hardware is exactly what I'm trying to do AFAIU.

>
> >
> >> This is not a pure virtual device, but for use with actual hardware.
> >>
> >> Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I'm trying to use this with actual hardware, I just called it "virtual"
> > because that's how it was described in the bootlin blog post.
> >
> > I'm confused about what the issue is here as "gpio-delay" is also
> > a virtual device in the same way.
>
> gpio-delay IS NOT a virtual device. You can even touch it. Can I touch
> your gpio-aggregator?

Sure I guess, the gpio-aggregator would be used to say define the
physical GPIO lines for exposed peripheral connectors in my case.

>
> >
> >> Well, it is a virtual device in that there's no actual "aggregator"
> >> device on the board. It virtually aggregates GPIOs into a separate
> >> chip for user's convenience. While there's no such device as a
> >> gpio-aggregator - and so we must not put it into bindings nor into
> >> mainline devicetree sources - having a compatible matching in the
> >> driver is perfectly fine IMO. Just like gpio-sim.
> >
> > There's no such "gpio-delay" device either right? I'm confused
>
> There is.

I'm not really seeing the difference, both are used to describe
physical circuit layouts, the only difference is a delay configuration
AFAIU.

Should the compatible be named something like "gpio-connector" or
something else to indicate it's for describing physical connections.

>
> > why that compatible can exist but one without the delay param can
> > not in the mainline sources. Aren't they both virtual devices?
>
>
> Best regards,
> Krzysztof

