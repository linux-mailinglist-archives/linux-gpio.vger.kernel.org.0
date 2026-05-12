Return-Path: <linux-gpio+bounces-36659-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC1mAwzzAmrpywEAu9opvQ
	(envelope-from <linux-gpio+bounces-36659-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:29:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDE51DB97
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8DC33169215
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F12F3A9618;
	Tue, 12 May 2026 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VpokuH5M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08653921D5
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577042; cv=pass; b=Y1qbZb3m2ANwHML67R5UIyCIGV/XZd1x5yxSYGZsqfXnSe8/KqbZWna+lwhOpX5UMBiKaO8a+/5CLG9ytPvmYOz+e0eJjY2QP/D3np7otVfqo1UZn+nEcmYEf+1rEAqCAfBu24fl/2Adn3/oxYJGZk06/ZehXDQyxk6f78E1qtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577042; c=relaxed/simple;
	bh=SldyvNr/n4Wfj4nI29FY5/NOTaJNZ4ScLZjfw6gtFeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zbdr8O1EZML9tiwGFHgbETAv6/YF1bV0+YTXH2u65QWJti9NI/r2GHfsORhB/e34HsxQ0S3YdzxLhx60RCmOlZSYRlIGam7d3Ze6pqbq2I0SZCvvKuvClMW08sqo0CpblghcPLhnZMRauS619RGsogtYTs4rebB2QPGy4oCAY4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VpokuH5M; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8891febd2so6237596e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 02:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577039; cv=none;
        d=google.com; s=arc-20240605;
        b=Js9XI12RETzcvlCQ8DM/bh3l+50cZj0Tj141xmtWN1E7qruX7jFMx6nvXOW8m9WM99
         9vmYn6JsqAMl9PfKAB+YUe9QxyfqU3t5JLLU/zMG4bycM+NH1PcHx/XzQdowEysL5I6z
         XXbLD2K1x5rEFc2abY9nx/jh0v+KgE+D5RFEeTqCN+SMkg+bbyFl1T25HqmtnmzSL82e
         4CuB8q3UV14wu5NNP3xEtF97xIX+AYjZgGJ/XtYZ9d4bnWQfFOkBbJs1XJysWxTMqiP6
         rdSF1oM2q2Ns0OoSCNuEsZc16WUZeGg9jU1lR2ZcOg/MkILDnp/Dzk7Wz7vMhsp6+LdV
         L5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        fh=gqM72/NSPpQmxeoRffmJOineFLID3Fo1Wrn0wf2Hv9k=;
        b=AmRXDd8Lxt1xd1Ufr9lNq2tczDRKwoAovoKWWahTO9UhfkPVPtFQwPB90g/Fny8ZiB
         DQQ7e1HmdX/0sXgPGZ97fMvLlxYtzPIW7SfPNfX87jMrvMnTrV9q219vqCYHp1EFl2Cr
         9qLGHcTYnx56pQPaYzgTILV8gaV4fv5pDGC8PBlIQ7NUzduUVCuOlM8NDaPsKsr6jNgV
         fs71sPa+jgGnHlMYrcKK7nT+8n2A59VLvMRlfB/OTHlEwnKj+poO7o3eoTOHYfzYuaTJ
         rSxcSaC2C8qnKu7Zh0EO09UD056pNeUPHLi0pCEUcIArtZb0GK4AYtx3VL9MBs3TurWI
         FcGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778577039; x=1779181839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=VpokuH5Mco8HOKOadwhqWFcpCG7VGfzr7GO9uGE0n7xBXpM0FImQsg7J0MMekSfDtm
         EKscSTPZy0mES8VtXeWeATPPppM+xWbnrcWDo0L53llEJedmBNPnXukUYa5twluMp76Q
         a3sY2kNRGobdGLZQ3nDbHDeQBS2z81WBYmmPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577039; x=1779181839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=BBmaLM+5poy9m50v7hr5QZ9nnnyVFpRn92/lfH+c8hPFG3iMcwr2UEq84Z9z1c0Lz2
         58I7Vtj2GEkESLpnF7H8U1mxlHbj1mZ72UWtvkXH4VGmhakBl8A/eg19dKRlVzqyUfiD
         XVSxqExwc55lUbAhXh2CQ1xw16Xf+do0QOS6ciK+RBkzIV/sDlmS3Hv94TBSVEpNJhhv
         WApCamS9fclnzSZbQAStyxKIvqaWpXBqOvega5bKolT2ho2g/dl+dwF1Wqohy0YUe0Tx
         GezOXojIY+FYcs7iu2O1Z4UrZP7NXS6WoofAXoyLeAkQFmGbidhGrnzNeS2flTM0+ClO
         5+XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LEgMvEiKprTkQZRnaatBvIH0ZnTEbOAyIacNj8p8DwdvIaW0hKc6sa0nj0AWtL1SuT9k3YRYh5wFW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6SfI0D26f/TabfbnAICTFYY/IaVFrRp/xDkzuV37g4dgAcnC
	x+tIhb2Mme2C3nrBjZJEegdxLU2DoMkboTzdg8c8c4cUqXY3ahRrf4s4qllyiq7CCSGtGNKqniM
	6NNQbgRfCSxOuN8bBe4+J5EXPdpn8wpanr/CLZOCa
X-Gm-Gg: Acq92OHjf4DZvASnvwibUxFw8TOm+7kLywTdxB8N2sBfH+O9zDmzZITugQR8xDhaTu8
	WkKGkvq391xp4PPAMezzOHtgA9LgPr2F6oKFIBN9sIpaYIJ8j+7UNIZlIpWd+t2E7+72xCHooAO
	pwkZxARhCL44MXCfDM5B0l1i5ZhpC2O5zwanfQn5DTOcevUcWePeVOFn0dGs80697aKVawanJhI
	8mM8N6Sc5TithhhoLthRev+2oj/1pfjKRxMGb928O4w7yvynw5ojG+UbzUV33lvATSs52M2K8TE
	p/Mn43JbByGn2iJZQmyhQIbMLXOOkZK2pGKC9Q==
X-Received: by 2002:ac2:4f03:0:b0:5a3:cc81:eff3 with SMTP id
 2adb3069b0e04-5a8e31e792cmr741475e87.26.1778577038810; Tue, 12 May 2026
 02:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
 <20260504072748.2580172-2-zhengxingda@iscas.ac.cn> <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
 <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
In-Reply-To: <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 May 2026 17:10:25 +0800
X-Gm-Features: AVHnY4JpFJ80xfcJKb4R3fVCclO5uQOrLLkEvtBAuF9RxcpiffXxdfYLmlfODZk
Message-ID: <CAGXv+5HFD_8e7odEwXk3vXZThBAor0PvVCbb+=wjR8gxwqwnqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5FFDE51DB97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36659-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 10:14=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> =E5=9C=A8 2026-05-04=E4=B8=80=E7=9A=84 15:34 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > The mainline pcie-mediatek-gen3 driver does not have code managing
> > > downstream device power / reset.
> > >
> > > As the Wi-Fi card on ciri is a fixed device, set the related
> > > regulator
> > > to always-on and use GPIO hog to set the status of its reset pin.
> >
> > The plan now is to model it as an M.2 E-key slot (even though the
> > chip
> > is actually soldered on the main board).
>
> Interestingly I saw a "PCI_PWRCTRL_GENERIC" driver in 7.1, although it
> does not support toggling #PERST now -- maybe this should be done and
> used instead? (Well it looks like the driver had existed for some time,
> but it was for "slots" previously)

#PERST currently is still left to the PCI controller drivers, since some
of them have dedicated functions for it, while others use the GPIO API.

If you check the history of the "PCI pwrctrl framework" [1], you will
see the design choice.

[1] https://lore.kernel.org/all/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce9=
03@oss.qualcomm.com/

> Thanks,
> Icenowy
>
> >
> > I have some of the patches ready, but I'm still working out the USB
> > side of it.
> >
> >
> > ChenYu
> >
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > index 8e423504ec052..c25780098103b 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > @@ -544,6 +544,11 @@ &mt6359codec {
> > >         mediatek,mic-type-2 =3D <2>; /* DMIC */
> > >  };
> > >
> > > +&mt6359_vcn18_ldo_reg {
> > > +       /* Used by WLAN */
> > > +       regulator-always-on;
> > > +};
> > > +
> > >  &mt6359_vcore_buck_reg {
> > >         regulator-always-on;
> > >  };
> > > @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
> > >                         output-low;
> > >                 };
> > >         };
> > > +
> > > +       wlan-reset-hog {
> > > +               gpio-hog;
> > > +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> > > +               output-high;
> > > +       };
> > >  };
> > >
> > >  &pmic {
> > > --
> > > 2.52.0
> > >
> > >
>

