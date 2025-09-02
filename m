Return-Path: <linux-gpio+bounces-25351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5EB3FBEA
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FED61B23E90
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 10:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A352F3608;
	Tue,  2 Sep 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZrp67rN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945FF2F361A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807865; cv=none; b=MU4Pj8F5r7x9YYfiEmH3VOuiaxKdKxsPf8nDyRH5X7sONaOMpVJfwaIBU1hDYGjSj5HkLniM3hbpvcrmnoQRjFx+cm93rvaF/CH0jScGWavbb+YiJPxzSdBH/1cc71UzvF+ygqfiGMzkIHON+i/k5uTScNLBz9t3UgrqfjoZ0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807865; c=relaxed/simple;
	bh=f4FSCQOOsa/4OCBJBGTowZPZFe3uwXyHE8EAIbJ1KzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZHGNoXyWgQJ9iZ9We3iT+ofqyNhIkbZd/iw3vk2Icbk4/Yy5AHTjIuaCNm32swmdQ/zkckhIbghPGFYzXWPoBKybCHjAr9s8PU6AkB4nm4m8IYGJlek44SxM/yCzuBN3qunkJzUBSGO3Qxw8bqySZHsqYpLyJg5gY8VVvyR2hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZrp67rN; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso2159657e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807862; x=1757412662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=qZrp67rN8XplLKcepeAzOZpBM2vkxbddlAxns88NOS75WkWMp5a7tftIC5j31G/gZN
         vpDQ/U8CedvYpuOl5mU5/0UiKJntFTiucGBTT5etoEDlCR/Cw768+vOUWL0oR7rtsg3X
         ILfUyWmomFtemqMgb8+kwfc9WWGvbm507EDkPbJ0m5OrQdn4fM4jn2AXsdLIb2sROcX2
         BMb4IDp1xaSol6aVBAs6D13/rZGFPjqgbd1ItJD6mxwj8K+XE4uoADFV/FZqioEopMwF
         I3ojUVK6h5kNN0XS7Ib9AxJwDLyUyhe6adhZFeg2Eyo8CDhG8DFl/jFORKWPrWXxVsPf
         dBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807862; x=1757412662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=bTUhDBmsYX7QLUK4+IHqprtplOeThmEYfDKHb68b2zmTCR/a5HvDAhI0D6r2BVvbvh
         B3Tx7XlduV3PHe76walJyvStQtSTHsOiys5uPxMy4vpTqLVSDAR6BNFDbxHYub1fvn53
         eE3zORN1Q1jfGCkHWeHFWj0yW3kW6Gn0OnZcRjufOPBcExygnM4KcMTda3W0wzyIMA/t
         k1x/JF+l1no51OQexklu7qGnsevXn+H3xnTs9rmV2WCCVV3Fo0agM00GQFBRJjjzcXOF
         anTRL6kZkqLUzQfdCWWpqirHBmORXngHCAxI3pSCIfeOfTXWuJLcvdadxNWgNjDjB8SS
         nuLg==
X-Forwarded-Encrypted: i=1; AJvYcCWzP56LBxk40tsIJc9d6Ux6qgt2qpUkTLsJXB6HLQOC0yXMaPJ3n27F4JW/4JPABJntwwv0AQ1IyAAr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ohFdU0VvxLW5D0yMQjcyATHtghiOJkTi8YoSpglI/yNpZi6S
	OsVSzePOMMv+4r+GAgrSzgve7mneFO1C5QM1GHiLBy+Kx15n16c6FVFvn1Q71lpgU1Sw2Js4Cyj
	9aE1PmT+RmGg+FWnbrlHR4GJdDLWmf0UFSVGRpzc5LA==
X-Gm-Gg: ASbGncuvVO1pky2Ol9FKSD0SVHoHzSrNSbMF10RzzGlhWV5C0pRnCg04gK0QGz1d2Wa
	yeZSuTnD5hMlOkU9fsejiad6xkd8wllegdd1H7jkLPFvsbik5aoVJkpuiPyNKCyVTJnkoySzAXc
	duc/JHGyTV7hKkviVKIwhCGKQlOMQYR/yBrmm+OMW/nXGfV5bQkZ7E7cooPDAs341v7VlZTTtfY
	3EKa1U=
X-Google-Smtp-Source: AGHT+IGvJOVNe+LUFvOCbgL5wgN/h/Cjvl043KlTfsb1COy3EuiSQw/TerVuRTUEwrGuUBs+VE/GG3RycL486iAnqi4=
X-Received: by 2002:a05:6512:250d:b0:55f:34e8:b1a4 with SMTP id
 2adb3069b0e04-55f709dda1amr3184317e87.56.1756807861583; Tue, 02 Sep 2025
 03:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk> <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 12:10:50 +0200
X-Gm-Features: Ac12FXw4LKCvHHNtKGBjLfwABtGCHq93WPj_v3YPD6EUsw9OMGyVKBEoUj5pgYE
Message-ID: <CACRpkdbrRc6E5idzkdN53QPDCSGpPUfdjmFmEFsS3g+v=cB6LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 9:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
> >
> > > That's not a lot of info but it fails in strcmp() which - I suppose -
> > > is the one in pinmux_func_name_to_selector(). Any chance you could
> > > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > > Is it NULL for some reason?
> >
> > [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
> >
> > https://lava.sirena.org.uk/scheduler/job/1758947#L705
>
> Linus,
>
> FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
> be able to debug it and figure it out shortly.

Awesome, thanks a lot for your perseverance on this important
patch series.

Linus

