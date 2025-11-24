Return-Path: <linux-gpio+bounces-29043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEAC822ED
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 19:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 416F5349BB0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 18:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6158F3168EE;
	Mon, 24 Nov 2025 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmpYBxDa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDBA2D24BF
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764010458; cv=none; b=ONaLK0rR4CO942ZeaXm9zW6rRaxHjHxRbehrk8KEHhCkRL6mVYHJ8HLoEVL7kvmO8Ic7sIsSy1Z6oX0CSdp9MTcMbpnMhPyo2ivgmmdnQ4qO0U03HnX06RYqtWFZY8P9U2VKSRH/HqsiJrTAUspKtFFtNG430FvQ5WVRCdzuOqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764010458; c=relaxed/simple;
	bh=TEK7y+I345Za9ATxX+knyA/Uh489WPY9Dd1JCZP1I5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzP7O8AODyRf6feRRhZ4aUSa02Mo0uZ13mO1Y1lFkYKCYlJBfHMoCVUF2TgnK4btY1cNRLdsTgLbEXrnXinzQWB7PNXNuOKjDPJaT6hFtmN4nHVssmDbWp7ugdYJ73OTHuEmcvKveDngvhiqUNbLAzVYbWPXwymxSo2ny/+YR6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmpYBxDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3146C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 18:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764010457;
	bh=TEK7y+I345Za9ATxX+knyA/Uh489WPY9Dd1JCZP1I5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AmpYBxDaPN5ZX9P0uxZqWlwOpLxvn2PrmdmQy+Ucj2PSpzD1kjzVJQNspQ3O+zzAE
	 SoyfcVuxENoe6qN/jwgovr+Map/yE1k+ds7flRVlx2SmXzlUGVnFRek18ncwAZHd7S
	 CmZZxqAIg/l3VjDKxFy7NVIj3yVu8kSd1iexr44ZzLxCtAc/tf/uV7g0Evv7eqHjnm
	 1YCo41nZXFteqNZB42Xy6mkJWgTsrY3vio3yZSuwLAF9h+4WTNJsjuMD9VktUXg+iG
	 xqY1spckPyd0iU/VIM2tMeSOPeqRpUk3qI2vXgOXeQZFFERXoX3JYZp2Be25cXhs5B
	 9ERA2nzw21Whg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso8323535a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 10:54:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLZihSOltGKezEgJ/0FKjdpzPJCBm71u2AjAjuUa7g9h6Hg4G6qbGj4Vf+TldUEphPxADK84o2+ouS@vger.kernel.org
X-Gm-Message-State: AOJu0YxckF8RgAS4FAEIP0aDY90nQfnf/DabSFeYDW1K1hOi6n+ou/j3
	sST0bR1V6ftqoqrwMYWnteCGmCsT25eSXkqQYpkWYuve6cE8RHuJ5a9c6EUvOFPigYber07OK9p
	vOMvLYEZogK0sPKbn0XP9w/7JEpFA4Q==
X-Google-Smtp-Source: AGHT+IFReAtDFuSFDhp918Ohx2vHaiN5KlMAX/uodATZY6O/YB75rQVqkELqtwQbH271c/8FxbJ2Dkum3f0Uu3OWMzM=
X-Received: by 2002:a05:6402:5252:b0:643:4e9c:d166 with SMTP id
 4fb4d7f45d1cf-6455443ed4cmr10891528a12.8.1764010456224; Mon, 24 Nov 2025
 10:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com> <20250912140619.GA1293647-robh@kernel.org>
 <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
In-Reply-To: <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 12:54:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
X-Gm-Features: AWmQ_blUF-g1qhHGkKsa6U6HY_V7mtf4Q-WkpVuhZVm09t2HSWt6-IOrweXVTPs
Message-ID: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org, 
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com, 
	flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com, 
	jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, 
	maarten.lankhorst@linux.intel.com, marcel@holtmann.org, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com, 
	tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 12:28=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Rob,
>
> On 9/12/25 11:06 AM, Rob Herring wrote:
> > On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
> >> Convert the existing text-based DT bindings for Marvell 8897/8997
> >> (sd8897/sd8997) bluetooth devices controller to a DT schema.
> >>
> >> While here:
> >>
> >> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
> >>    schema definition as these are currently documented in file [0].
> >> * DT binding users are updated to use bluetooth generic name
> >>    recommendation.
> >>
> >> [0] Documentation/devicetree/bindings/net/btusb.txt
> >>
> >> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> >> ---
> >>   .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 +++++++++++++++++=
+
> >>   .../devicetree/bindings/net/btusb.txt         |  2 +-
> >>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------=
--
> >
> >>   .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
> >>   .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
> >>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
> >
> > .dts files should be separate patches. Please send the bindings patches
> > separately per subsystem so subsystem maintainers can apply them. All
> > the Mediatek dts changes can be 1 series.
>
> Ack, will fix in v3.

Are you going to send v3 still?

Rob

