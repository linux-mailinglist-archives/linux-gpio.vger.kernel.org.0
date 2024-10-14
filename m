Return-Path: <linux-gpio+bounces-11311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 529DC99D6EE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 21:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4764F1F237A4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 19:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF431C876F;
	Mon, 14 Oct 2024 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJrzfcM3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3C26296;
	Mon, 14 Oct 2024 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932576; cv=none; b=Wc9fjOoOAxF/0fB3YsnbgzmRyBsPwyTzQSPoKhNXJG3sQ/fvR5uAI7y3Z3atPg6xzN2FuPOqazHnGDrsjVWuxD53V/bQ4i+/Pi5OG4IP2/AntXos9IObAczrSe9hQQHvNLmfVtYaa1Ci5eBEjr696OhfC7bO7KMUhIKWIeKoEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932576; c=relaxed/simple;
	bh=S4arwuzO7j1jhWd47g0uoukq8DJJ4fWBq2BNobj+aYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEb8iu1ymtfYcI1ZcUx7IaGi7SD4xaCtY1aGxdcUk/Nw9vb3iM3JWGe4Abdh2pqS2aGdeta22I8sPa0Lb68z19wj3QDlI7rzBZq7tdEEeMgiN+5WToLSOw0pRuNLPzv4hJVqdlhp7XKECRYN/SmgmGRHdvNN1asI+QGDnZ89BCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJrzfcM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67466C4AF09;
	Mon, 14 Oct 2024 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728932576;
	bh=S4arwuzO7j1jhWd47g0uoukq8DJJ4fWBq2BNobj+aYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FJrzfcM3db9LMyFqGD0McuCfW5vQyJWws3eb53Nmcl98QJWehOZ+Hj6mo5k0CVoy+
	 Z2pdlcLzUEO44rXQhR418TQyBBBUvH4Y9uviHGulNNgx3oO9qY4wuHHi3k26swa4Ly
	 vQvJ2nVgCv+LS1Gi3sRZP9EleiOyHMeHftTNhprCmO4X6Is1atfq8Ax/qSLuIUYHFH
	 aH8RMsoqrAbIMd16uBIASKVrAf1db71NwR72vZuLZLFdWb1hKJllsvftpKZtzmle+F
	 Kkl+QN2XTpOUpJmnK4Nht5RFARNucP9p/p8hRJQVdULTjBJcX/du5YySfiRAMLHNTr
	 Z3oLHmDN4RukQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2e4d16c2fso39302487b3.3;
        Mon, 14 Oct 2024 12:02:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVma8Ka9WPB/OVqHqzwDeqlaPpGthVxNZe0bN5RPG1ff84XhQUzUZx2l+tmN2XhI6YwMJ4roecTGvmdDOZB@vger.kernel.org, AJvYcCWhI4MNIdv5KiniQkiMhDzUTYDvAfP3jSve7cqqAz/LnLhmHI9Nd8BKhlMJDpGqyZA+SbYI8PQEQtGk@vger.kernel.org, AJvYcCXTXdG3TivN6Os5+2oxbDhLXfDjzRxL3gqXNsjNuR0pCaCXmFiAeTYs4So2YMAtwrPC7WZa7P7lPDhH/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzolZu0pjM9z1+bUZK3sPHCjNFlo7afy5aH4gREf+m8nMP3cYNd
	0GWYg1ZqCXJFl/IdkdGij1ocvUYKTelrabt4WwOBSK2UG6UcnczAskfYxmeBQXN0SWRsuBtYjXs
	WOscfPQLOdhvRS86rclHaVSvlNQ==
X-Google-Smtp-Source: AGHT+IG1Um+TeY+p/HlTwahS1LZNEmjEHI6QEzViuZbWFDN/48qQYMlejknzr8AsHrp6NBMHHATDBJ03Iku1z4EHf24=
X-Received: by 2002:a05:690c:9692:b0:6d5:90f:d497 with SMTP id
 00721157ae682-6e364153287mr68863237b3.19.1728932575616; Mon, 14 Oct 2024
 12:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com> <20241011165640.GA2475122-robh@kernel.org>
 <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
In-Reply-To: <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 14:02:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
Message-ID: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:27=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/10/24 18:56, Rob Herring ha scritto:
> > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> >> From: Yassine Oudjana <y.oudjana@protonmail.com>
> >>
> >> mediatek,pinctrl-mt6795.yaml has different node name patterns which ma=
tch
> >> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml w=
hich
> >> has a description of the pinmux property, as well as some additional
> >> descriptions for some pin configuration properties. Pull those changes
> >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match =
in
> >> preparation to combine the MT6795 document into it.
> >>
> >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >> ---
> >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++---=
--
> >>   1 file changed, 28 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779=
-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-p=
inctrl.yaml
> >> index 3bbc00df5548d..352a88d7b135e 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
> >> @@ -111,12 +111,12 @@ allOf:
> >>           - "#interrupt-cells"
> >>
> >>   patternProperties:
> >> -  '-[0-9]*$':
> >> +  '-pins$':
> >
> > Worst case, this could be an ABI break. Best case, it's churn for
> > mt6779. Is it worth unifying?
> >
> All those MediaTek pinctrl bindings are mostly the same, where only the p=
in
> definitions in the binding header does actually change.
>
> I think that it's worth unifying them, not only to get rid of the duplica=
tion
> but mostly for consistency between all of those subnode names which are w=
ildly
> differing for no real reason... and consistency is a long time issue with
> MediaTek bindings/dts in general (which is way way way better now, but st=
ill)...
>
> Besides - just for context and nothing else: the driver doesn't care abou=
t
> the names of the subnodes, anyway... so while this is technically an ABI =
break
> it's not really creating any functionality issue, and then, actually, Yas=
sine
> is also modifying the devicetrees to comply with his consistency changes,=
 so,
> in my own perspective, it's still acceptable.

Wait, I thought there were no users?

We generally only consider node names ABI when/if something or someone
cares. Most of the time it doesn't matter. For the pinctrl nodes, it's
really just a question of churn renaming a lot of nodes.

Ultimately, it's up to you. I only care that the implications of the
changes are clear in the commit msg.

Rob

