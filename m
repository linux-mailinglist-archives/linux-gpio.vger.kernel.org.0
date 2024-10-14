Return-Path: <linux-gpio+bounces-11313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E799D7B9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 21:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F3861C226AC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 19:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102C61CEAC4;
	Mon, 14 Oct 2024 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qtfi9rn1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD31C877E;
	Mon, 14 Oct 2024 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728935263; cv=none; b=at1hM4YkqFfONwMwgXgXsUBCbK7VGmm50oRUi+RRnNWVqaT/9WAcemNegOAiAomfY3t3jDZKZdID8hrOv+Pe+1DV4K7ez6/ReXv9SBeVfSkotJ2LkHTqPVu1VfqmNx5gxdA93g/z3Fetn72kVNbB0PdY/AYtvsfZHcI+EBUamwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728935263; c=relaxed/simple;
	bh=BmeazclAOWGBXpv6W51J/lnVKM4suOylLnvlvJPSWFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHuw9VQz3hRuMk1mZBqDxWbBTABr+cYr65DgOBBN89HAXagim0vmaJXnBIrtWSRphW5QZVZtSoDwzTjc1JRmCaTUYJhL9XP663hGV1vvimUrwrS7iJmRekG6iEOsVPnT2hERcpGczXrvL+2Lf41xdZ5JCK+sfOCez7h7o1UBpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qtfi9rn1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A787C4CEC3;
	Mon, 14 Oct 2024 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728935263;
	bh=BmeazclAOWGBXpv6W51J/lnVKM4suOylLnvlvJPSWFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qtfi9rn10vjFc4wmjkonxMOvOlBMcep0XH06igeF//Ho9YkQ0hkNsLeIcgpXp49cC
	 tq9nyBjQ970ruTiIxS0fVy8w44Uc/Zb/r7Z0IUa6hloZ/zXRUiRuYU1irC/5jRpumk
	 kEC5xiXLKgg7cxQgWcPHCeLR5XH+NSBY6kBpXApvyolHjp7Qdxc5/TDoIhUmgS1LcT
	 5MhhcPJXpx1I10VXMR2RklXm5CGYkrYJxf1Bp84VJrvVDidHN3g6bDsfiy9d3C6dqx
	 W7ZWPjVuWwPt7kNCal91yl2GkBEnAR8Box8f4JtJVAlS11wLwUlLZ1B1TSJE6NcVbW
	 effcf43agOYBQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so1776893e87.0;
        Mon, 14 Oct 2024 12:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4NpvaRammqSVDoEbdLoN7URMXpwVyHRQwm7/wgH3pn8qzYGcd/bec+2gQC5Dnx0J4R1HGRr+yKyqQEA==@vger.kernel.org, AJvYcCV5WfAalif1MEgm4fI46yuxL60ryT3omqoEnRpu9P0faJb9yYUmVd8o+M+Aefe2htdieNgrlMq915mg@vger.kernel.org, AJvYcCX7HaR0Eipf8LVIKoYH4qFQqQW4z770jQpA4TyusGFR/wiKWTSzPS2L1ZnSKv6QMUVkmBxFH0tpWQfelQp5@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ27ffYJ1RmbQ0UU88ROOq2GXWqjd7xonTM5SKCsWiVy/R5sfl
	yqKH0t2VgvcKeuZISn2WrpDJ6mdNqAyx8PyyNrTIVOD1mVgX4yWsm7fLirn1PgoDQGbb9e6VMDQ
	Zx+qzZIO2puKIbTiLMyZBw1uAeQ==
X-Google-Smtp-Source: AGHT+IGWKpdEglFpIlk6kIsyRnfEB8zZoqKphERJa0sPyVBgZGiKBn/mqvbmmqVRsK8iGBHs2hU9kQhmNKsc6ZcqYbE=
X-Received: by 2002:a05:6512:b88:b0:539:e98c:c33b with SMTP id
 2adb3069b0e04-539e98cc3c1mr3113634e87.41.1728935261639; Mon, 14 Oct 2024
 12:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com> <20241011165640.GA2475122-robh@kernel.org>
 <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com> <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 14:47:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8s1SmbLuO1saByQ+GWNSAFFqdxFpYFsEaibX3sMMkNg@mail.gmail.com>
Message-ID: <CAL_JsqL8s1SmbLuO1saByQ+GWNSAFFqdxFpYFsEaibX3sMMkNg@mail.gmail.com>
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

On Mon, Oct 14, 2024 at 2:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 14, 2024 at 3:27=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 11/10/24 18:56, Rob Herring ha scritto:
> > > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> > >> From: Yassine Oudjana <y.oudjana@protonmail.com>
> > >>
> > >> mediatek,pinctrl-mt6795.yaml has different node name patterns which =
match
> > >> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml=
 which
> > >> has a description of the pinmux property, as well as some additional
> > >> descriptions for some pin configuration properties. Pull those chang=
es
> > >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to matc=
h in
> > >> preparation to combine the MT6795 document into it.
> > >>
> > >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > >> ---
> > >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-=
----
> > >>   1 file changed, 28 insertions(+), 10 deletions(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt67=
79-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779=
-pinctrl.yaml
> > >> index 3bbc00df5548d..352a88d7b135e 100644
> > >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> > >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> > >> @@ -111,12 +111,12 @@ allOf:
> > >>           - "#interrupt-cells"
> > >>
> > >>   patternProperties:
> > >> -  '-[0-9]*$':
> > >> +  '-pins$':
> > >
> > > Worst case, this could be an ABI break. Best case, it's churn for
> > > mt6779. Is it worth unifying?
> > >
> > All those MediaTek pinctrl bindings are mostly the same, where only the=
 pin
> > definitions in the binding header does actually change.
> >
> > I think that it's worth unifying them, not only to get rid of the dupli=
cation
> > but mostly for consistency between all of those subnode names which are=
 wildly
> > differing for no real reason... and consistency is a long time issue wi=
th
> > MediaTek bindings/dts in general (which is way way way better now, but =
still)...
> >
> > Besides - just for context and nothing else: the driver doesn't care ab=
out
> > the names of the subnodes, anyway... so while this is technically an AB=
I break
> > it's not really creating any functionality issue, and then, actually, Y=
assine
> > is also modifying the devicetrees to comply with his consistency change=
s, so,
> > in my own perspective, it's still acceptable.
>
> Wait, I thought there were no users?
>
> We generally only consider node names ABI when/if something or someone
> cares. Most of the time it doesn't matter. For the pinctrl nodes, it's
> really just a question of churn renaming a lot of nodes.
>
> Ultimately, it's up to you. I only care that the implications of the
> changes are clear in the commit msg.

FWIW, these are the top occuring warnings on arm64 mediatek pinctrl nodes:

     27 mediatek: pinctrl@10005000: panel-pins-default: 'panel-reset'
does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     27 mediatek: pinctrl@10005000:
mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0,
1, 2, 3]
     27 mediatek: pinctrl@10005000:
mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1,
2, 3]
     27 mediatek: pinctrl@10005000:
mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of
[0, 1, 2, 3]
     27 mediatek: pinctrl@10005000:
mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of
[0, 1, 2, 3]
     27 mediatek: pinctrl@10005000:
mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1,
2, 3]
     27 mediatek: pinctrl@10005000:
mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1,
2, 3]
     27 mediatek: pinctrl@10005000:
mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of
[0, 1, 2, 3]
     17 mediatek: pinctrl@10005000: volume-button-pins:
'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes:
'^pins', 'pinctrl-[0-9]+'
     17 mediatek: pinctrl@10005000: trackpad-pins: 'trackpad-int' does
not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     17 mediatek: pinctrl@10005000: touchscreen-pins: 'touch-int-odl',
'touch-rst-l' do not match any of the regexes: '^pins',
'pinctrl-[0-9]+'
     17 mediatek: pinctrl@10005000: pp3300-panel-pins:
'panel-3v3-enable' does not match any of the regexes: '^pins',
'pinctrl-[0-9]+'

Not sure what SoC because I strip the dtb names to deduplicate the
warnings which get amplified by number of boards for an SoC. The first
number is the number of times the warning occurs.

Rob

