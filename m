Return-Path: <linux-gpio+bounces-18808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341E5A89538
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 489C87A6A95
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3DF27A112;
	Tue, 15 Apr 2025 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+oo7O0h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE812750FA
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702530; cv=none; b=CDnX+rQpULbg+VpfMloPEoFMReiTMbpUiLWroT9oNNPmqjKY3PcDQY5bkZ/oU1xOkLiN9J4+vM8LwSq16Ct0O8Qq6sl829VFpgJVGvjj+Z79TeEtCIXZbrVPYnl0fBHEYFl65xyHi1gEaX15gtKJlto6qp8Mnm3535lDnDU+PRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702530; c=relaxed/simple;
	bh=/t01dfXvGRgfX4KTskLD9RHr8QjggEKBR5una7CkTdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wez+vb2JF8VSuW1CsFuriC5f7bKmg5hUuNGAzdo8WcJTPt39Tkl7cGrUNrGHaNCTiJJjw2it8u95REpwkCW4HGlagrQU16pstLhg5jlQnl+TALTvS43Wex4xfRUyAxuc1H5hvBrj53rAN80KUv5RUy7OiGtbIB0tzqy3MnaWIW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+oo7O0h; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so45329801fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702526; x=1745307326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=s+oo7O0hziTMTn6ffzLugD78KNSlG1XVVmBSNq7/dA2+BW+COsqPeulYH1zmbHlyXD
         YRiFIof75U2YhtqwpQOc4yHyBTmuwwaNjI9STsEKbAuHlHbhGEJhGavHL6jwgqQ6K1Q8
         u4T5uVapy/DQM8ExQU4KQE5sFdt7QdIgLpAmVtIzavjMn4ci77v0VtHX2K8sl+obp34G
         GHgVk1E5oiRb59saVQLjCA2W8y5XWTmcG6bPqRVFHyJl28t+hBio6SXIB5BNOX+ienNf
         ntV0TX487Fw+Gngj+c9Y5JiENlGQRJ82XYkt+0FFvVvjEo/HefvdGyiHqPI7/GzadqRm
         liAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702526; x=1745307326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=dAPt6h7RqjIVHYNz4deJz0wb6E0JSBkPbvlLd/kduqEkVGnimln1OAkaY+JPF6PdQ3
         /S5bgBeW01CCUoAUYCQbeQw2YL2GZySF+qVzMvL9KySVly0NHGZJH0/b8RQGl1cMAMI0
         wwcHDweDcy9vhbOxn6H+aJe55+/9vZ0wkPEZq0LUKwLHBQ7uLb7J8sxl+ge4iFH1nJ/u
         zadQbQdq9iP3QqZdBGVIwv1GAsCZCRQus76cBbOtMCbET7Cup2loI12OhxR1B0nw8WuN
         l1uO/xCuxH4a2RvZTZal5157h+M/VcKIZCU0f0POZdkcic2+Ds6QF5alNnV7Gq6UnVdw
         YHyg==
X-Forwarded-Encrypted: i=1; AJvYcCVr7+xiB5Jb/XCELzR2/j30pxt9D/HshXMoSSxKMMWNjoMFQP1yJf9OMvdtBqsGyRnRzjF1RcNgAQ+L@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZ3NxQIjvd/9V8bdk6PG5S93DH5GhDBaxQOUaU4919QsWRodS
	sKOmapfT8/JasF4iw5DoR1HQBzA5OKr5e+fBn7D49847InQgknUMsflA9P+emkuHU7bTMYgr4oZ
	F4IiAwwXG+4OS1hd0/aWLHPObe62RIXVGz9EbNg==
X-Gm-Gg: ASbGncv32DmgkwBCkzQDMcDHrOpLzP1JCnfYUMZGty7qTExz5LdNRmHdkiZY3cUez2w
	aDWrclGLgxXgYH+vvidqstlHb629sjHYaxCfX875revlyVZONXLtRyLzKrHYMvXe1KZWXlW15UI
	ZabU6G/SQ2hmJgnaYnZU/P26GjAguWxvMt
X-Google-Smtp-Source: AGHT+IF/f3ma4C5o9c0efnyvduCTab9wDDK72+7lhXFZsmhgzu8nGsMsG6D4c0qe2PhRQIiyrICHnRVYY1XaZjetoDw=
X-Received: by 2002:a05:651c:30c1:b0:30d:b3d1:a71 with SMTP id
 38308e7fff4ca-31049a80682mr54317271fa.33.1744702526493; Tue, 15 Apr 2025
 00:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org> <20250415023234-GYA29961@gentoo>
In-Reply-To: <20250415023234-GYA29961@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:35:15 +0200
X-Gm-Features: ATxdqUFrvoN3oToav7nR6RzJi6WKzvpJz5pszWK5ULoM2MOJjET7tU5z2QtEKvY
Message-ID: <CACRpkdZ6A0xORRQBnNNPFcNHg3xL=U3_xAcePmaDN3_ZYMzsaA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:32=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> Hi Bartosz,
>   I think this version is good to go, if you agree,
> can you take patch [1,2 / 5] through gpio tree?

I agree with this, it's the final piece making use of all the nice
infrastructure we put in for threecell GPIO and threecell
IRQ so let's merge patches 1+2!

Yours,
Linus Walleij

