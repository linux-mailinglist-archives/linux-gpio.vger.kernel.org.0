Return-Path: <linux-gpio+bounces-15136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C7A241D6
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 18:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63979188AB20
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 17:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4A91F12F6;
	Fri, 31 Jan 2025 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u6pNC8m/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13B1C54A6
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344186; cv=none; b=SclXvRjx7vQh16hK5RBKoXV4MdmBipgsfKWY3UIKldtTRJY5wOijzQb0a5WwCRXSPIRhRgdEF0zXvFRhHCX/jXh1zgLFWPZB2PkePHsPxempWO/cHC2/pD8WdwSi3Hgdxp3zTZLQ2WShE6A6NGYtyMfdb7vr52SFe6YiDKUqXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344186; c=relaxed/simple;
	bh=kme+XPg+cuiUjsUHBIxrAcU2Va9lng0EAL+26Hj0OsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/hdG+ak2lQasLMkw1jJBECiYyFQ8rMtTO5qwMaltSPJWmpn39IyTDW7FoBQ5kknmvrcH+seIeIr+JsDa6B/1o8Avp3u8l9QYA9dKS/ybHxIvlNvCaCn6Rj5vPq8nbA7iBj7NTECbU0mEYHupAlMjwwitYu6jHY8EsIAnSrJvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u6pNC8m/; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3061f1e534bso22613031fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738344182; x=1738948982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjFe7vrxU6YEM1DATv1IgiJrIlKHUq54rhWlLDCXyk8=;
        b=u6pNC8m/M6hWuaNsAw6iUhP4uEFln1Cj09OdSpfwnM0Qg49/9o0GvdBMSNB1lK/TZG
         PxHSAHxFemTr0zi8bMYjreqJluHWu9x35riBOIq5mmusRS7PRCxOKhlz3SeQzBYFdKal
         W2dqwFTFDLtHy2S9gUESrRbEHA1mAUYIcjrmE2M7NM36PQn86WwLXCedBkH7rSkBGiSH
         +KczK7lKL2etHlK+72fIIb9DUPyzegh/CHscMd+uT7+jGRdn/Syj7QJcYRLbMKFzIlQG
         hVe6s/WFJqkNYatZcRHzg1qs5ytgGnSaLdjW0KQKpCoaMKsmg5fs7dnG1uRm7tX/lXRz
         GImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738344182; x=1738948982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjFe7vrxU6YEM1DATv1IgiJrIlKHUq54rhWlLDCXyk8=;
        b=oGaOHpsz3ZNOetJRa7cYPnR+KEIDEC0pLm8IbKXw+gypyjmncA/54xS1fq6qjPUs22
         FlRJlDRpIJzCln60h5+33W2sOdyVQ161aKJKFHwftZzjQNFci2jFap3aj8H27H9zyCwo
         HVj86Olnx0bcdgkFCd/UmLxsHsT0yG2eKxuQzZpCYGhKA/HafNP1gJtdw1uFCx/zewwO
         Sr+01FIFWjZ41Ix3weNmKLwgBj/feWv2peeuIGkDGrNo9VgjtQSHzK8+tdBYm2kaw0TI
         HYKUvYAnAX5ZwDTp08QqKKcmTTMFu/ZyprrqLEHZ7AA9ZBxqGcHA+NdrFWhR+KfFix/K
         qPnA==
X-Gm-Message-State: AOJu0YwXamUwdlSHM7S8W6Nop1Gs4z61lsCm2sbKNH6a91qfXkyICQtv
	b1b3keRnHMT0IsaM/tnX/Rn7BNKhOQePrkpt1AH5QG33I7WEx1Yy01Z1FDNh4SCDSVRpwb1FV+/
	bw8lKXqpcHD1CNnzeVa8iOFmImK9dtYRYNoZV5Q==
X-Gm-Gg: ASbGncvd//qTCH9MmsbgNZoxcSfwb+U+ukdyGeQJllsKdq9p4plkvdwQaX0jlh4m+/t
	ZQ6PGsSuZVnxyjmpfILPB6m7CmUzzRjZKcLRfSMH6VMoZZ49+X7O0mw8qQ4aPg3oZojw7bUw=
X-Google-Smtp-Source: AGHT+IHxXoKtKpfWmHiyCkmDOMffgXB2luyZa9jFQPi8dZzp+nNVT/3VlAaiMixKow+4twrU3G/pSVUWwpEVrrMSCWA=
X-Received: by 2002:a05:651c:b06:b0:300:3a15:8f22 with SMTP id
 38308e7fff4ca-30796872c96mr45396891fa.21.1738344182267; Fri, 31 Jan 2025
 09:23:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com> <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
In-Reply-To: <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Jan 2025 18:22:50 +0100
X-Gm-Features: AWEUYZljrTXtp6VdTg8U8MI4zsCzrgDx5TFvSWaWs-N0kRXVKgUx5Ql-znHgiZc
Message-ID: <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 3:36=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Thu, Jan 30, 2025 at 09:47:47PM GMT, Bartosz Golaszewski wrote:
> > On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > >
>
> (Small reply to the previous comment:)
> Yes, I understand your point about why you think 'num_lines' is
> unnecessary. What I meant was more of a UX (User eXperience) consideratio=
n.
>

If anything this sounds like worse user experience - having to provide
duplicate information.

> > > While at it: there's no reason to impose a
> > > naming convention of lineX, lineY etc., the names don't matter for th=
e
> > > aggregator setup (unlike gpio-sim where they indicate the offset of
> > > the line they concern).
> > >
> >
> > Scratch that part. There's a good reason for that - the ordering of
> > lines within the aggregator. [...]
>
> You're right, that's exactly the intention of the strict naming, 'line0',
> 'line1', ..., 'line<Y>'.
>
> > [...] I'm just not sure whether we should
> > impose a strict naming where - for an aggregator of 3 lines total - we
> > expect there to exist groups named line0, line1 and line2 or if we
> > should be more lenient and possibly sort whatever names the user
> > provides alphabetically?
>
> As Maciej pointed out:
>
>   (https://lore.kernel.org/all/CAFGk_a0U=3DjSQD85UKC1e=3DpSWr8W9y_MMAFyPV=
FOcE-fUZry7-Q@mail.gmail.com/#t)
>   > [...] if free form names were for e.g. [1, 02, 10].
>
> we would need a well-defined rule to avoid ambiguity, which could
> potentially unnecessarily impose burden on users to understand how to
> properly use the interface.
>
>
> Regardless, the point is that we need to make it clear to users which GPI=
O
> line a specific line<Y> of an aggregator forwards operations to. Since
> requiring users to explicitly set the offset within the aggregator for ea=
ch
> virtual line (e.g. besides 'key'/'offset'/'name' attributes, by adding
> 'idx' attribute, which users would need to set explicitly) would be
> cumbersome, this RFC implementation instead just makes use of directory
> naming. I believe we agree on this approach (i.e., using directory naming
> to establish ordering). Correct me if I'm wrong.
>
> So, to move forward, let me outline the possible approaches we can take:
>
> Option (a). Drop 'num_lines' attribute and:
>
>   (a-1). Impose strict naming rule for line directories
>
>          Users can only create directories with a predefined naming
>          convention. This could be 'line0', 'line1', ... 'line<Y>' (as in
>          the RFC implementation), or simply '0', '1', ..., '<Y>'.
>
>   (a-2). Allow arbitrary naming for line directories
>
>          This would require a well-defined rule to avoid ambiguity. As
>          Maciej pointed out:
>
>          (from https://lore.kernel.org/all/CAFGk_a0U=3DjSQD85UKC1e=3DpSWr=
8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
>          > if free form names were for e.g. [1, 02, 10]
>
>          Users would need to understand these rules, which might impose
>          unnecessary burden on users.
>
> Option (b). Keep 'num_lines' attribute but:
>
>     (b-1). Prohibit manual creation of line directories
>
>            Users would no longer run 'mkdir line0', etc. Instead, writing
>            <Y+1> (Y >=3D 0) to 'num_lines' would automatically set up the
>            required directories.  convention. This could be 'line0',
>            'line1', ... 'line<Y>' (as in this RFC implementation), or
>            simply '0', '1', ..., '<Y>'.
>
>     (b-2). Keep manual 'mkdir' for each line, in the same manner as (a-1)
>            (as in the RFC implementation) or (a-2). Seems that no-one is
>            favor of this option.
>
>
>     Note: (b-1) is a new idea. Considering what really needs to be
>     configured by users, this could be the least burdensome and simplest,
>     especially when configuring many lines. I'm including it here for
>     broader discussion.
>
> Personally, now I'm inclined towards (a-1) with the simplest naming schem=
e:
> non-zero-padded integers ('./0', './1', './2', ..., './<Y>'). Or even (b-=
1).
>

I too think a-1 is the best option. However, I'd go for line0, line1
etc. convention as for computers it doesn't make any difference while
for humans it's more readable.

Bartosz

> Let me know your thoughts.
>
> Thanks.
>
> -Koichiro
>
> >
> > Bart

