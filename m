Return-Path: <linux-gpio+bounces-28823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1BC7043D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 743DA2F1E1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D879B36C0DA;
	Wed, 19 Nov 2025 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYC60abh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F536C58C
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571136; cv=none; b=UyJt91nKOvMVLv1HfUS9xP6MhHFw0hi9UY4EAfgDNMYU5eAsYgunHzg/7B/dBnO1v0pRS/zmhsmLUgnAGGgf3fx493wg+ngMLVXQcBG+6N8lgXIroWS6SPsjC7xD0+00w0d/3FGnVFNg8KHBZ9eDKbNp46DYvXa+jg7X95QE8Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571136; c=relaxed/simple;
	bh=vcjFWfWOR2yjv9sI5u/+MJAF+m7NirhgjHp5gOavo68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRRzFxH4hDmOgN1Mq3GliKeN9uP+Yjsml84939xawY5FDrfiolBuB+F0GHevcFBpN7XWU1kGCJrhaED6IbvaR/3y3Nat9Y2d6/WArFxMxs6h0mQK1q9I15FGeLG7jTSgBAhFquSLYUT//wd9A/Pw9bmfe8nuQ47sMwGCb4YLYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYC60abh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so518641066b.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763571133; x=1764175933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcjFWfWOR2yjv9sI5u/+MJAF+m7NirhgjHp5gOavo68=;
        b=DYC60abhm1f5UWLW4iaVs2unNLoBN4dhoRGoTW7GmcDwLAoaIP9dFBhODvzKcl4mhY
         FQKzgk9xvUtNPUij6Lxdf+q7RrZIojuHnF0Pp85TxG4Txe5XOFe7syHQuryH87CVzxHT
         E2BDFEgcZKIpzD2uiKzWYd6UXjtjIuDl3GxKdT/GC68i79/0oRL5ax9doOmYefQG8j7L
         2nDVr6RacsvlAkT1tycgChWLkqW/TfK7yYeuFJaDaN7Wf9lmkr6DvcjKX86YwgHsxWZH
         b52wIJ8s5rrmQI9Zy16CIsuEILytgE0vW2bD0apMxba+Isch9lQfuXajkIfMsu9ii8KH
         A6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571133; x=1764175933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vcjFWfWOR2yjv9sI5u/+MJAF+m7NirhgjHp5gOavo68=;
        b=ILjlQJy1x0ejTnSjhvQKTg/rRXldvI/K2etHSDM4zyrJ7L6mkEYbznLyUALP6178MZ
         aLcTS9Qv1nb5oZUxVcNgi7Q3b+UAUGT5f+sTUT3HeSQcCYCJtXgsml2/zmw7Tiz0rz0U
         4wH3TxbhtwYg/q5p2BRusAXo4Lv7aJlbdObdLQT12st8vwYYoglr7KGktkd1DwxAHqvA
         big3F/H3cPJzxQkqlelLbUWKeGNHJsVnhmLDTioopjWt2OJIOmrzJAc4i1Nq5z3q01wI
         8VNMoKNDdKfbQhpnA0ftgakw6IXyHoH4cXx4wSbUtT2IKWrSIlxv/RcWG0pm9Fha0I0e
         IYiA==
X-Forwarded-Encrypted: i=1; AJvYcCXSTj/iDWE64aB8qpHku9kXgAocXclYKroMDMKH1/UgFjgWFim1jeYbQ714sPzzNqOW7PX7kE3gESup@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKCK+mZzG7eD5OAQqq/ZebKy0Ias4awC1993DGxyZ4smHmOC7
	J047xORkpdaRx8SdzVv+a1szXHEXIdshuMafzLynm0nZJwIED1/yF7bFJGflW0qOGRx5jLUhlXt
	juHld0rtM52CppgdVLIPFOtNTzygcL08=
X-Gm-Gg: ASbGncsuKzK3PuZ6HvtsNquBY91G14NUifVFEbkV4NqAr6yLYCBIvE99rWuPjJ2cZ7a
	71ZTX2me1erkfKadLdB8cYEl4jVts7R3LC9aNlks43mG46GfYDl0mbBQQYb2at46n1EcuNka2qx
	vn7yeGjcmBwWQenrL5cB/gVitHlNHeSLk9lCd0GHa6fFP5tWRjfQM4HBy7/NEGouUBOIqPBXEP/
	rQ/TwsG3zdLWcXqVGZLxCXAIsJkMnfdyE4ffL7Z3RnzAYftyxl3KcS2QOhoUKg7vUxlct2ZNNA4
	+4nqI4dZdK24eyiGnjuswSueMbbhlqSBvrduLbEqJbLu06RzIPU56EvB98TQwVXxLpGc/R8=
X-Google-Smtp-Source: AGHT+IG79/yoAniLg5m6pTLusTRypXvDIibAvx3mJng3rzludQe6A04i/KKfcn3WLMTF9und/v0GYqvS4b0sDflHd0g=
X-Received: by 2002:a17:906:7309:b0:b45:60ad:daf9 with SMTP id
 a640c23a62f3a-b73677ed721mr2190487066b.3.1763571132962; Wed, 19 Nov 2025
 08:52:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119164017.1115791-1-ckeepax@opensource.cirrus.com> <aR30JbIbx3MIySjM@opensource.cirrus.com>
In-Reply-To: <aR30JbIbx3MIySjM@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 18:51:35 +0200
X-Gm-Features: AWmQ_bnRsmqZgCIFOlKbUCCwqqweHfcYam2Yo1Gl2z3a9M5AASJDSi9azoDaq0U
Message-ID: <CAHp75VeQgq8AFSPAOvtq+U32KAWO+NOZ_=LXWA_r5vRzkD2TTQ@mail.gmail.com>
Subject: Re: [PATCH] spi: cs42l43: Use actual ACPI firmware node for chip selects
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	andy@kernel.org, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, bartosz.golaszewski@linaro.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:45=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Wed, Nov 19, 2025 at 04:40:17PM +0000, Charles Keepax wrote:

...

> Apologies this probably should have a fixes tag, or two and I
> probably should have marked it RFC. Lets have some discussion and
> if people like the approach I will send a v2 with the tags
> included.

At least I don't see anything quite wrong with it. But I probably need
to have a fresh look when you send a v2.

--=20
With Best Regards,
Andy Shevchenko

