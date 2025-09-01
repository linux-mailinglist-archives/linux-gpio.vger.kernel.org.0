Return-Path: <linux-gpio+bounces-25296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F4B3DC8E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98F6189D7C5
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0048E2FC865;
	Mon,  1 Sep 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1IevM38Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1446A2FC03D
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715678; cv=none; b=loBwj1022y5JvLkpWDNa1NFsc4DkuT9rl2fdQx4nK7BGvQpuAK1R3eyszsynlA0GVHmfKqpxXbjmWRlq9EIlu7uQCZiAlyUhHAFVvFwLB77oBevutt7SSLxL9kp2JX4NWGKAxk14rmRFNQ+L3PrQZ2vgbgWLxLa2ZH8huNjkB2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715678; c=relaxed/simple;
	bh=39DETOS6vNez6Y226+ALS8td0nl160a+Uf7v79luhD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8FMcA6JsAK29wiUjCJa82Phs3GgJg0nElxTv6J7nMADbxA2HzWSz5RNNjhFrdwuy61AXvS50F8DMbXmd4PkQro06YojjDrquuElVgROaGKDU3uIKIf3dbvcpdU5ui0M9b/TNnsqSIP01aLn9OuzGiJTXkPIhhZv/hT0s1fHCQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1IevM38Y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f7a34fb35so694069e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756715675; x=1757320475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39DETOS6vNez6Y226+ALS8td0nl160a+Uf7v79luhD8=;
        b=1IevM38YfNlTD+aTUrCsc0g3paZ7k0BCr0ECTQr9Rbf6xrde59QDh5Ms6UdquVYvWq
         geEvCfEvrzkoMK3pGyWfjV5E5gnTmUG/h3+CRMhqzxy/sbiur2uV0HzGgBcgpJQ6Tvdl
         2djD9Suar9AHlOnhQ88fzt8hbLffaWuCHOVeR2xdU8FLwzm2SrdzQ4DTyeW9REo441mE
         sahC9qGVIOaGSJIjuC6sJQ163PlnTnLdjxGhKyWkSh57PIrTjq9RbQYeeZpfWDJot68x
         GDsQwh73XN75EdLGOqygrUharpojG7pPFGnUtNj+2OZe+TI4XF+e28zvFEG92L15G1TE
         r66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715675; x=1757320475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39DETOS6vNez6Y226+ALS8td0nl160a+Uf7v79luhD8=;
        b=sJxSaQ5h2RVi1tpW6HLt6P6BB+/pQYJ9DDyZ/iU7TRLIBleuZTw1isd0Df/U63jX3R
         dbutdFOP8CUdfG2K2FuOfP31Ud+/FORCfn8nHhSpDIaqQ0h2KYMo5zA9fXt4CtBg+Gjp
         WEpBW73mgLrQ06/hzFGzItRwXd+TGmnZmws/BRegCfKF9+CXAQGlmCmKaqmwNOHh0bYv
         bs3GONaO5/mxF6n/btxhiMZu/D2hTnY+EYlmunbR8D8i5/vq1Ve/EhynzaZGtGJjTrDM
         WgG1+S5DvX+YeZXD78C+xDkduFqSTm8LbyLbyJlxCYZqncgTViaT1bHHKaYnjHFKTulF
         k2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE4ww7q1bLMSH2QvT8dFOzMO+0iKwYkd0EtHQJlmwrglGHv8Auvme75xvrmzpTC5tLgnFNBn1rOpB2@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/PcHZrD/OeIWh+dmRKGJkNR/zyuBv9z58bC+knAJFRNV2D9/
	idnr3F6g/nB8Blo4V07ctU062y9cUZ0e1NHq/0+/wf9sh42Gbq882VP0zLN5sPIMY7LbKKel2EP
	HHrGwZMUawTUqk28X76XIhu8vtXPvM7HdpqLED9ZEEA==
X-Gm-Gg: ASbGncs5zdQdxRRUWApQ6jW45XS6yqVZ8rW9p2D5rfo+CvIG4ATs6DswqPu6rm1F3VT
	Uib2UDeB9NAjgSnpHh/1zRm3AhgFd1iUP8AgVcaMSnhKmqAuB6vBs7ZyyhoynBmcJPQ/U7cQaUi
	fa2gV1mWjrDBOEnAMgzVeRozxXrI1rHJtbLDYmhCYOSKqY0Rg90b87mJtLO5xfHkCxfhB/w17c1
	xfngfDbbVkjGI0sl9G+EUdMaWFftKqUL1eZh8v9iRhpVNW9Sw==
X-Google-Smtp-Source: AGHT+IFvvN9ahNPe5qHZqgsGxSWYWIYkUijyOt4zXNDAGa1vEQF6LNv4KjL2EC1uh6zpjK1hm4xOhtvSP0h6YecbdGs=
X-Received: by 2002:a05:6512:1289:b0:55f:3f25:f03d with SMTP id
 2adb3069b0e04-55f708dbc89mr2314529e87.32.1756715675202; Mon, 01 Sep 2025
 01:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com> <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
In-Reply-To: <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 10:34:23 +0200
X-Gm-Features: Ac12FXw1K_oL8rhC-DnjIn1Cs7YcfvulHGz-GiwjDWSfYP_4tIeMD4yzENOHaAA
Message-ID: <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Note mainly for Linus and Bart:
> > I agree with the patches 1..11, but starting from 12 needs more
> > discussion. That said, I hope Linus can apply the first 11 ones to
> > make it easier to continue with the rest.
>
> I applied patches 1 thru 11 so we get some traction.
>

Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
100% sure the fix in this iteration actually works.

Bartosz

