Return-Path: <linux-gpio+bounces-833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F099E800CD6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 15:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7051C20CCE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE7C3C6A7;
	Fri,  1 Dec 2023 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4trwNxF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3521724
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 06:05:42 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d40c728fc4so5539957b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 06:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701439541; x=1702044341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S981KapfzO045oI7EezmWMBJ8fVn+98mRDxQPvPZv8g=;
        b=V4trwNxFf+s7KYOqzzLek9nMTOpq3xYJz9nrOKvoJn7RAI7+g6JBhG9uFOYiO9BMna
         zPok0K+ZnEJw3c+ZEIuldKepv2m+T7vGOU01V4kDVSxBhcg4YEybYL+kXsfpPPKKp2s9
         9PRjGvWuTA4MbFHG96kM9ohUvPvIiXyHwxlwjRb/izsXem80byp+t1Y+T2gwo2zlflge
         ZXSZ1AyZS01G7zcHB7LfW97KUBXbDJdCo/TnH7PUCLNBC/1aiqukYZqdQILkvBLvyVdg
         qdSx+8nFVTEVKhPIvVP94F7xi0TkawDPg6nmuoLAO3z/WPOlrhABWV4Hhi9kIrfU1qe2
         n56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439541; x=1702044341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S981KapfzO045oI7EezmWMBJ8fVn+98mRDxQPvPZv8g=;
        b=qE/eVYogdyZVpvvOo1JSYyJ3/ohRH1VvkokPZXz3Hyda+xkRgaZ2MUO68hSLzYok2O
         1cPeK4PB8xncxs2BrbG9uV+91HXc9ToEwiIDSwue6226FHt7+6bRxiDh6xcg90WaJzC9
         U0tYqh3sOrQQBHlpWFn0BxJig6cRLjO/3Rp1Dv0ZpY6AJx8gCGzRiTB9LcUOmQfImDmF
         UhZVdTs2qhbJli7pptWPJGaIQif4cCXf5rnCDm/0aPW+8X8DltvLLYLdvsd87dnazN7z
         7ifC7KN+dg7oPo+N+8/v/+1D8DToEIWnJk16ZlQGTIUnnbnzFD8OjsyqB6CK4aj6yx63
         1lmg==
X-Gm-Message-State: AOJu0Yw52FpTKHCRtP7cUcNK6ISHR9lFAT8LJTyK0PAmYOPgi99jeBQf
	gXJG1LRULmfjw/STx8GhXXKQYkazeEMH+zuQKNc3CAi/9YWOXQYe
X-Google-Smtp-Source: AGHT+IGgZieAgbL8W8KVNwc6EnusoD/krGGnayXbUe4OQQFB/f3qh/vCdT4Gm9aE0Qgd6YmyIbk9BOCGJMnoZgchng0=
X-Received: by 2002:a81:a184:0:b0:5d3:b71b:4d30 with SMTP id
 y126-20020a81a184000000b005d3b71b4d30mr3497574ywg.17.1701439541650; Fri, 01
 Dec 2023 06:05:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Dec 2023 15:05:30 +0100
Message-ID: <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
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
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The struct group_desc has a lot of duplication with struct pingroup.
> Deduplicate that by embeddind the latter in the former and convert
> users.
>
> Linus, assuming everything is fine, I can push this to my tree.
> Or you can apply it (assumming all CIs and people are happy with
> the series).

I applied the series to devel so we get some rotation in linux-next,
augmenting the relevant commit messages as discussed!

Yours,
Linus Walleij

