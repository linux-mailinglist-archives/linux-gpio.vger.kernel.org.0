Return-Path: <linux-gpio+bounces-24846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C5B32C82
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 01:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A83956776C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 23:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD0024677E;
	Sat, 23 Aug 2025 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4CAkBCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729311FF1A1;
	Sat, 23 Aug 2025 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755990581; cv=none; b=ODEBs/offqr2W6FJhqvKoXvx4Qc6NT3ZXxqhtgIxRpixAqbdUY8rFYcmFxaNcupo1FVjnrswykfuhRCNq1gP6TBj6S4Wk8K0abi0fcHX9jg+F2c7FYnjBW8UdbLyLiNSszIQWVO90G2QLbT5dFGoAOmENrCO4HPS5EfcQPw7+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755990581; c=relaxed/simple;
	bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u45rdyN8qHiThqUVHuYLQVIkUaiuZf2RCaEsbExtYoiFTI6t/BuLCXZLupgPgOYknsX7WbO1PqwYn1MkprAPdt2AyMzM+DCgCri5i7067uJY87x4Izi0ACKQAEYx0rBvnNr779g3oWzHBQ0wqU8XyWD50DYdsU7drUDsJyrfXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4CAkBCn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b133b24ed7so27263811cf.3;
        Sat, 23 Aug 2025 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755990578; x=1756595378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
        b=Y4CAkBCntOOYGHRswhqOzYxqNW8sBl1gFieMlKQrDk2AYnn/3h1pSRhI5mD5GFKh24
         6etukx08sZ2nweykcs61zGrij1lC2aOvWs6GiWieVFgwxcc5oxGdEc5gnOzRFSdR51Y4
         gGvlp1A86ZtpbsU6Vapj7k8Z3D2pzhNBmctAl3twogNEIOuE7avLmB6qcVC9D/lFxcei
         PllHcM5EenpQ++ZCqU9uPFBML2RMtawM+3dAR1mzfaggP19alBgSIQn6xI3Pr8VaxNB4
         qhb6cuAxhiPWe34lqlo7qTl3os2bYMw0U+mnen0t9MVuJEyBOkg7PzusaulLKjitC9y6
         CE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755990578; x=1756595378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
        b=dgAnHGaPD6n9Lwo3TKpcjdjytn0g7jfTxlfm1gGao4/zfIFYDAuSFyhrL2Mq03W2XO
         Nw96hUoKgwEKqyNsHkmV/ZvqxohrjuF1JnTO0TyIXNDhpqdDH+OaVhOE3u6RnfymeNl1
         HK3+LlkoEQcq5sN0oMMTbJntxPANRW8o0clTEf9KgZ41yoGcBIwZk401DrkuqFspHoc6
         NPyGBEJtGH3CYQlCvPahnXvnC5RY82YjNTvpq+3fzJwrNiIEBLO5xQ+0hnWntI/TX2jW
         pUO9G3ujbgpIxL6iF9QpM+Gvrl7QWwIl3N2DHumMr1GHbLv4msa5kofXHYkw2INLaYQ/
         4JzA==
X-Forwarded-Encrypted: i=1; AJvYcCV2D8kJv7XyTkRiBBzUu4hCDJVPRDY07ZEym7hyXNlRf4KjOaZtEoI1/Dlix4jyskL4zSzmAZAWoivsqg==@vger.kernel.org, AJvYcCW3PUfJecmIv9RJ9LWuGI8/IEi7BoJNd7UppAXUZ4yHX980rQKf9Ploqr/qFT5Z5SqenGWjvW3w9u6n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9Jz5JckGMmtoD0wgxaaaNnH0vscibJVsMCY9gL8dHvtS+LJv
	csBuqRrgO1mPh9TEG/XfiTzKf6YeKkQBvyIZjFfBS/mtH/JtQndQCbzoyDRNN+ML4U7Gybj3HHA
	+pORzorW5trmE1ovTGxB1nDsPwBTGqCQ=
X-Gm-Gg: ASbGncveDaV5PIj6D73YKKNO8kt4C4A6HBgEZVo3nhLCJqnwRccXPtlmDPe6huYCEGE
	wEtug+p/HZH/ldtjQz8qZU3E7pyg6DoOefIHCK853nUl6vXwVTgwN5mpEeoEzunNVt20l5Nm9Xg
	KsMPoSUegNXHiDH3Q2fqZ05F8zVUa2HNgfZOI+d3Ftw9tdMpnlJ7aUiCsx/GVAGoZeJOZbS671b
	x9roJY=
X-Google-Smtp-Source: AGHT+IEkAzV8H+clwN6tL7gqmSvk56dPwvIVT4gQVPsLgXNkLSqtTBC6lbcVlarR1iUNCNSl5l1xmo1oxjBxcJoE0Ac=
X-Received: by 2002:a05:622a:1449:b0:4b2:8ac4:ef76 with SMTP id
 d75a77b69052e-4b2aab27f7fmr97527041cf.69.1755990578167; Sat, 23 Aug 2025
 16:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821004232.8134-1-andre.przywara@arm.com> <20250821004232.8134-9-andre.przywara@arm.com>
In-Reply-To: <20250821004232.8134-9-andre.przywara@arm.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 24 Aug 2025 09:09:24 +1000
X-Gm-Features: Ac12FXwXg3BBSbryJoDW3xmfP_LFIAOgrCsFqUWYjsCuW9pa0DyK6tp1OMBe8g0
Message-ID: <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible string
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Thu, Aug 21, 2025 at 10:46=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> The secondary Allwinner A733 pincontroller ("-r") is interestingly not
> using the same new MMIO frame layout as the main controller, but is in
> fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
> each. From the driver's perspective, this is all we care about, so we can
> re-use the a523-r pinctrl driver for the a733-r, too.
>
> The individual pinmux settings are different, so we must not use the
> a523-r compatible string as a fallback, but we can surely let the same
> driver care for both the a523-r and a733-r IP, as the pinmux values will
> be provided by the DT.

If the bank and pin counts are the same and the pinmux values are
provided by the DT, that means they _are_ compatible, right?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

