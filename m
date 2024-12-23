Return-Path: <linux-gpio+bounces-14147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6E9FA954
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 03:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394481648C6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 02:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD97432C85;
	Mon, 23 Dec 2024 02:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA6qnPTY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1561F5FA;
	Mon, 23 Dec 2024 02:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734920638; cv=none; b=dcmNyY92L8iJlQ1PcHEzMpzEqz7YWof/WJF5AYvmv2w1FQ7jPuNddY3CirLHQ/mbhAry0eKQgqAr+DDoW4rsJac8Kn9V+X/AvumBg8yfLC0MemuWtnJ7cHgFf1Zlr46IcVMpv6KR7qxO6nBL/wvR7rHzs71pQ0sLDfKzrmid8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734920638; c=relaxed/simple;
	bh=qdOYZ4zFeYMIjzrJQ3ac4gRrzkvyJg7TCvk82ShzMc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxLjatQ43+lpnKefrZdWCOdqZA4ywPpCI+2ZCPopUEG6AerOCtCHZR0RxQJLdudUvoSc9UimQmYevKci2FckFdbDb+Csg9HP1j8G7Aua1GnGdY+60J1sBQ8iowC1JNDc/IJbnNwMbqZB6qQ3qFyYnS90dnkJ9Gmh1ybfanxh+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GA6qnPTY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so1862701a12.3;
        Sun, 22 Dec 2024 18:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734920635; x=1735525435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=;
        b=GA6qnPTYN4LUuMS7AgXyl6d6hKltAWEU9SleqyUxIqtBAabxQOgfi1RZ+fwS2AWicj
         tWgNxdpyE9pk7i88KIjzqqqgFPLDFhd7jjg2NnhfUn58/44IhRZEVuIa9vafckDWuhYL
         0dohaxS15sXC+wfG27IpULpH+ZYEuNNkn8emL9SbYK6/7MQDElY2SSBwlyZ7ofxKqoJG
         qAOTYVAfovFNcpdfNnQVQu1xMMnuHExGCE9cMvWn1ae7fI/uC1K0VSPUeTxM1nGLGASs
         qR77TthcYuPEym2Hvj3Ypc7twq04lG7t05acZnzoTcxHCmeEafSaW6jjygaQN3p4+3To
         uXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734920635; x=1735525435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=;
        b=Q5rxJu3LDUMMGQ8fob33HR/wB1N+Snm1ihviF6K7ySHVMWgDkeb3DrmpunY+Zscm8v
         nyCxvgdMM7lOvP1iGa+kuaPaehIbw4TjWn5uMSSSoR3pcak7CD6XSEfO+/8XjTTs++rC
         +Kjtb+4okl9ncrmOkwN95VWCMxuvH3c/MLSYGjoc3guT4F0Hqg/xml9YSuTAvWPOPwxa
         XQI0iUGKg9nwFWN1flMgCPnojdcl0f9OFopnLy92KbFzAdS9YKlD0BPIh/fwBPQ2tjPD
         kGDF7L7iFXnmca8TMQCP3zI4+X7hcKdgmddIT0zJM+TxW5k1oRZq8Ga4wKG0MbEQO5zI
         0TQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKfpZREJFumXTuvyCitQlVclmVeHNT9Ea9WnVtaHkPqa1M4mVlL8TwjYAmtSFPaPfjcEgJ/ZKgGUz78ubv@vger.kernel.org, AJvYcCVTe/u5/qjQfttEtXYtaJ4lq4s0tLP5Ip2ww0SYQ6LQz4Al6x5RuFn2r4aHgwqTW104/gEGtOCX88cK@vger.kernel.org
X-Gm-Message-State: AOJu0YywDeoHZPuChNVq5Fro+MRURvUN/iD269TwkMDQgli+tw5aNz9a
	ozaxgy5pGyMVRXpsRuTYWImeBpNyczYQH5kOX9oq0ZFS2kVjhTU//UdGgLuAuUhGzzlIO70c3Th
	iQZBvOVVH7ocJFrVTkweLOLn9Zl0=
X-Gm-Gg: ASbGncsPlLWGVy3VOXzzAQvgpE3jE4OkOU72BN9ruLmHlJkX5LZ4bq9x4CcACK0l6hG
	+UYHAQUyh15pnH03fxoCQ+8YBlGrGg5h7qCaDNFrUzdjKaMRuie0cK8fTc2mS3d3hyc+aoRE=
X-Google-Smtp-Source: AGHT+IFOQ+YJJjZ98YVVZNwOrG0qsOM9r08CSwciPXEClz4vbTeokWJahyw8uhtMV2WnJ1NN+6tN5a7MOjvOSmVwcIw=
X-Received: by 2002:a05:6402:5251:b0:5cf:43c1:6ba7 with SMTP id
 4fb4d7f45d1cf-5d81de162acmr11181357a12.30.1734920635218; Sun, 22 Dec 2024
 18:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215204014.4076659-1-zmw12306@gmail.com> <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
In-Reply-To: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Sun, 22 Dec 2024 21:23:43 -0500
X-Gm-Features: AbW1kvZUUzJKKpkCx1FgWYjvLlCb7cV9If9o4mEuNky8MJMq5ODnIq-nWEKhIdY
Message-ID: <CAN4iqtRuj9M=GzFbY-hY4Ks3ktSKfA2W5yLT19vkJ2CSe1it9Q@mail.gmail.com>
Subject: Re: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
To: Marek Vasut <marex@denx.de>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn, 
	peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sun, Dec 15, 2024 at 6:54=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 12/15/24 9:40 PM, Mingwei Zheng wrote:
>
> [...]
>
> > @@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pd=
ev)
> >               return -EINVAL;
> >       }
> >       pctl->banks =3D devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> > -                     GFP_KERNEL);
> > +                                GFP_KERNEL);
>
> Please drop this one change.

Fixed in PATCH v6.

>
> >       if (!pctl->banks)
> >               return -ENOMEM;
> >
> > +     pctl->clks =3D devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> > +                               GFP_KERNEL);
> > +     if (!pctl->clks)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < banks; ++i)
> > +             pctl->clks[i].id =3D "";
>
> Is this ^ assignment necessary ? If so, why ?
>
> [...]

Thanks for pointing this out. We call devm_clk_bulk_get_all in
stm32_pctl_probe() to handle get clk in PATCH v6.

Best,
Mingwei

