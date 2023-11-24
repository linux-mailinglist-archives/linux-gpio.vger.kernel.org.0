Return-Path: <linux-gpio+bounces-475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB07F713C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8F94B20F5E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747CA18C20;
	Fri, 24 Nov 2023 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0MEdI7E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C82D10F3
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:18:05 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-db40898721fso1611496276.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700821085; x=1701425885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe7iByES8qCcfT1IfYNFaShLSvrVUDFw50wM8vwtGhs=;
        b=y0MEdI7EHts4uF/isdmDFTtTGZzOpe6XZRUlT4bnZlmi+z8jT2bgyTejtglnxO9N38
         PyjPF0QCy9KqQEBUbaO3L68e7vAzJ9EIPNPFwjz/fAd2jfSwzi/ocRwoO4x4qRPisCYg
         Ms43zhEkuyLL5WSACdD29u2aNfzfFzMZS9thH8LISc3AbKNgTenxKxqqbwzU4sbNcOXl
         Xr7UPj6hZGvuVCOlOvcfutwYDStQNLAvEo0jkrOHxKe3OIMTDSnISfr49RURHyHPa501
         VShz1iC03befwAK8VkqrCGIFIhf+znF1JbZKQN2I0s080KdT/Gw1ZKBxmjSxCjmY3gJJ
         ec5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821085; x=1701425885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe7iByES8qCcfT1IfYNFaShLSvrVUDFw50wM8vwtGhs=;
        b=Vy6tR28CEtFIS+w1kZD8gdxQp4TzAMgJlTjEXInYXHfAEd2/wymKel7/Ma2KaKe2GG
         idufrVpa6PsL0sPJ/0wFB9YMVA5d1z//volOeSjtt+VSEdtHxtx7gVvfXs6P80ch84z5
         tfF1omdtb/tZEOGNDyoQ3jwn0CHPouX+B4witv0RgIDjobCu6xOloPkpBAr4uCLg2W3I
         SrNWlNHvdpCuZCUt8i/pTGP6eP/C9Mj4uSBjwXmgV8MC46dkpotmEqnJnTdnBlApDbbp
         Gq1uGoxMMFZFgF6CkCkKDXjOQA9b/pd8PITwNYs4323PqHqZOACPMvzmckKEMdS8Pa+Y
         RbkA==
X-Gm-Message-State: AOJu0YwYqg3EALuQEEn6bd4Np6wpfjHOpfhLPGkqNbm4LepsdNQyPV1B
	FuQS+gCilgDQQ7mGZ9G69jkNejNExwzaSddsqtZkeg==
X-Google-Smtp-Source: AGHT+IG8iaEyiFM59ESevDjE9vPuHHbQDr1w/P/tGmZWOMIBN3A2ZiFwbVfmEed56HUcIuuKQk+nI+Fh1ToiAf1nTUE=
X-Received: by 2002:a25:6d7:0:b0:db0:2f97:8757 with SMTP id
 206-20020a2506d7000000b00db02f978757mr1792022ybg.38.1700821084607; Fri, 24
 Nov 2023 02:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:17:53 +0100
Message-ID: <CACRpkdbEoAvTs4c5e910bsBZej2Gs6H+SPLAXUnKM2qRk+5MTw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 8:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The struct group_desc has a lot of duplication with struct pingroup.
> Deduplicate that by embeddind the latter in the former and convert
> users.
>
> Linus, assuming everything is fine, I can push this to my tree.
> Or you can apply it (assumming all CIs and people are happy with
> the series).

I would give people some time to test the changes and ACK it,
but admittedly it's a very tasty patch set and I am eager to merge
it ASAP.

Shall we give people a week and then we merge it?

> NB. This series contains previously sent patches for Qualcomm and
> Nuovoton. Here the updated version for Qualcomm that splits previous
> patch to two and fixes compilation warnings.

Fair enough, I'll just use this series.

> NB. The function_desc is in plan to follow the similar deduplication.

Yes!

Yours,
Linus Walleij

