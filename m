Return-Path: <linux-gpio+bounces-34040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEVXMUN0wWkQTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:11:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 881912F98DD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00B9630E8288
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 16:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB05B3BD64E;
	Mon, 23 Mar 2026 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kksSMOby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8F3C1403
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284195; cv=pass; b=YMJXmO70DsiAcw+VfCeJzSp7nR0evOiguIBz5XbBLX2KTn+9V4D+NLzfTTwSoQ1R59Kw0hnL6yLi7fI5r329lzlTyZ45oW/YaT+r4cMKwbER94IZBngEp9s2y5MVPVdZRunMaaIFaTIMJScXP4bdr+dmzsWH4/vuXyUDmQpa7r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284195; c=relaxed/simple;
	bh=1fvRhUogs1V9rKEcsI/PCKxEMWCn6MR0Es71uuKVz88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kA+qkwcXJOurRz8/wUwsM/12rvplFGLdLs88NVKLosxCmxGchZTTc+Vw1gAduSE8qKFytRBkXV1wAtiTUFR9+YPbEJ9rOnDTmws1My0fo9j4zITdRDwco4So4h+BwhOzXgOCdP8Dyu980QczkpCWn2oD5gCOrs29rSIsu1pD+cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kksSMOby; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso671258666b.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774284192; cv=none;
        d=google.com; s=arc-20240605;
        b=T3eAi4vMSraDvLv9qutV8wCQDDb7N3X5lA9/jg9ALzimGjCWmm48P6l/R6AgU3wJOz
         vgoYb+Kek6qBsAzSQO2Tx1tELWNPN/xds78oduyosvlZ7QwUW1O176o6huiLyLNedTwK
         VOLoaNV8KLXawOJzCh3+ZMKmrMoUyC099wlW4JL8rtbQoOXxnd1TKmsuPpcSPt8xaGQv
         v1Rl4vCNnU+jsI8svh762YOwvnpsp7Als2I5DAd5MyM/ATkbPKFwyTrIpe9sBcS66ndX
         eMoA0lTlmFxEdjPuMYvsdX+pOp0jLP5vn5WRQGOPXBVX45c0L5bYEmD9U5I3R4ixg+1D
         oXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXz025swToeMHHQtF/dGQpue1EMwmv0J9i7P0ZIHR38=;
        fh=gJHxdWmF/I3Klea0LZMjtPLZFgAECnheZP1iJuTWogM=;
        b=GlyGFNBc+cTAn8RHg7b4r9vESHtOuVm2aSOvi0CCzMS0WRB6MnrzVb8GWe5E7n/s6v
         mx7PHgZuMS04L7a5BPJc7SGjiq/R3d+PbwLogaoWhVNtQ/XVkKZr6w3hMr5eW+VeNumk
         bfQf09pl+Whe4OKJ8osYgHduYgLoVn3aw7g7O6BThOw5mKqfLvsZqhHISXoAOdUJxkVA
         GgSWNUzlmL91JI/0Gfc0mw7x5Ib+Y49XAzLY11h+ayKPJikhzNf+q90DsCwtKKVQ75yP
         kRfZ6KIphzObgEtLPXN8FVaELhtMVo2FD0XQjXEOFqgaA4a8z2JKdEwYUO6K8l9ApKk1
         kQjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774284192; x=1774888992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXz025swToeMHHQtF/dGQpue1EMwmv0J9i7P0ZIHR38=;
        b=kksSMObyD7jS9SsMxSrYGWpIdb52bWibg3ZjeJW3kFJusT5eyY4sXEIdQeWzuGL0nI
         1bYhT5BgFttbASkUqCzesXgGl/Zvt2D5E73qi18slfKkhTZNdjJ27arnbupRh6X/YDzu
         QoU6kRziSOsM+OP9yttJPmzw3pKbv9QwP6cf5uL1ShKMSf9rxz+LSyufNbfuNaDF0qhC
         NWimtDLipbenUUAiPv899moLANcAU0mUdJZjpRu7iTOZdEgAzb8jCMffykoffhbp2SpO
         ERu5a+Z7TOonkpw4ruxy9XO4OD40INW8cvcZNTFd7q0srRC2vreI09OF33UIA4yG+EOT
         XfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284192; x=1774888992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qXz025swToeMHHQtF/dGQpue1EMwmv0J9i7P0ZIHR38=;
        b=QayyjyJ8AbrgOTd5E7O04UvaY+dZuEQTC026S3Pp4Cyjn/OMja99fe/A1KIjxKJOxy
         j8DpeZ4FGl2ZV0ekRIcua0Bd/9NXZHKKKds0rgKOyPe5b5ylyVVE5MYxo+fW+jZ2OUyW
         Qow+JNQ+hXoDSxOjnBRzz3SzIGEssplhP+vxjEKeiYa7njLo44uHJtkDmPrmgb1r7xHl
         GMH9rOgP2jXhmdcA4W7EobaqT3LtTIlb79TUN/F4gxLYxgJBKssK8lrSaoD7EuObRpuP
         rHw8eSq4XlROvR2OMhLIafMbQSyJu/Kiva5Xh7ERc7rgP4Xt73M66dnSHmRikY5oqfY5
         QKNw==
X-Forwarded-Encrypted: i=1; AJvYcCUgxZYgE11IZ6xPJilQj82m4aT8nJiq5DQ4606DG5y0CW5SkxiXZ0zZ8Ksnr796u1GV+6PF18q4Wwzc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GWX+Hyxv8KgL52BtHTKN4v7BebnN8FEpgflyJTJuchQ5NuHQ
	kgXLbVBf7/Ilojla7wueJnIEgoaFdsKZDZI9ZnE1emXnf4r3dgUfhASBFhB2P/bWHgXs2gopgcy
	TC/erMurPSjpfHWyyKrvvoW6jUTKbehY=
X-Gm-Gg: ATEYQzxkVIW180v93maoROoQ+4yWKG0WsX2hGGrNgM+Z5dbQ82g74EMwQ8M1imxWtzG
	tYZvAe6vJxn715D/+2kGme+mCYHEHERu8H4MsnNdtyawY8rkMgoYIA556sU5vgJpFTECsh7z7kL
	7z5eR6teqQjTdjzoMzOpOD65dysU8mkSc+Bhklf9mCiwE7KD80hUYwwu8OVBL5xNQAYI424VIH7
	xCRomQjMZPWjQUqojGykI3ty1LhVVBM3gkw0rpxPI+6jRk/YososLkWZdke+5HKn08RqTkhs2/5
	vtMlFFPQ9tz/V5+/AlknFf/6jcFMl5FSgim1MOn25qz8LnNZU8hEvmPaWlVdcXTErUwUPj3BUcP
	OYKg/Qw==
X-Received: by 2002:a17:907:c20d:b0:b96:ef71:49f9 with SMTP id
 a640c23a62f3a-b982f0b9a37mr982589366b.9.1774284191993; Mon, 23 Mar 2026
 09:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319000558.22108-1-rosenp@gmail.com> <202603201104.8D7B8A1@keescook>
 <CAKxU2N8ZZp5fcCWfMaqZ9VKwNQ3a06fsQPXpBQa-d1N07zPGng@mail.gmail.com> <CAMRc=MctGTeqBHQ8zaQ7_2YAoWoTUxOK4_hs+-EHEQEPnz+A-g@mail.gmail.com>
In-Reply-To: <CAMRc=MctGTeqBHQ8zaQ7_2YAoWoTUxOK4_hs+-EHEQEPnz+A-g@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 23 Mar 2026 09:43:00 -0700
X-Gm-Features: AQROBzA2qaX1yaM8KyWefigkU6SOxX6FP_EtmkeEIENTjos0A7j-OoAxHhEnBi8
Message-ID: <CAKxU2N9KdziPen9-_gfe0UZjyuMTOsbb583aeF3=kqm22rGieA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34040-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 881912F98DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 3:00=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Sat, Mar 21, 2026 at 12:00=E2=80=AFAM Rosen Penev <rosenp@gmail.com> w=
rote:
> >
> > >
> > > static int gpio_mockup_probe(struct platform_device *pdev)
> > > {
> > >         ...
> > >         u16 ngpio;
> > >         ...
> > >         rv =3D device_property_read_u16(dev, "nr-gpios", &ngpio);
> > >         ...
> > >         gc->ngpio =3D ngpio;
> > >         ...
> > >         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> > >                                    sizeof(*chip->lines), GFP_KERNEL);
> > >
> > > But this begs the question: why add nr_lines when ngpio is already pa=
rt
> > > of the struct:
> > Maintainers for some inexplicable reason want an extra variable for
> > __counted_by works.
>
> I believe what Kees means here is: you can use ngpio for __counted_by() l=
ike so:
>
>   __counted_by(gc.ngpio)
__counted_by doesn't support nested variables like that.

drivers/gpio/gpio-mockup.c:59:61: error: =E2=80=98gc=E2=80=99 undeclared he=
re (not in
a function)
   59 |         struct gpio_mockup_line_status lines[] __counted_by(gc.ngpi=
o);
>
> I didn't think about it and I do prefer it of course over an extra field.
>
> Bart

