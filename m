Return-Path: <linux-gpio+bounces-36292-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJyHOgFQ+2mSZQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36292-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:28:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5946E4DC2B6
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700BD315656D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 14:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945A0480DE0;
	Wed,  6 May 2026 14:14:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0447F2C4;
	Wed,  6 May 2026 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076899; cv=none; b=jyva5tCA1QRvlP19856zabT8SlRaeyuKXGubTbt7TJxJRQBnxsrTS1FIrwAhuBbeGIXqowkqmPmBgHBOzF5PYJFGXDDx6gv4KG9uA9NVcuum1N22WiLZSH6UXPQflOCL3OhOdm2inHX3nUuQ7TraoqZsVM875eKV2nCi1B3Zj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076899; c=relaxed/simple;
	bh=Pm0+Gh1N3CQZmo80V9svpnAeqF+PlXCFFDOgCkyNM1Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DXoXmvKv7oB08/j5MTLsGzvSwWXRUXVnNP/556zoJZhbQ1pxD3sFDbAEh7zIfEBbIdhoKZDb65Y9bJyItjQ7gAKC5kbxt6zaLZQx3Iv7tFQxVYSKNoK3+Jfh8hYXxpLSSmpKYnBGYiZEiahtakjwSiJjKVARMSTp6oO47GeTZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-05 (Coremail) with SMTP id zQCowABH2AvSTPtpLvWNDw--.25404S2;
	Wed, 06 May 2026 22:14:42 +0800 (CST)
Message-ID: <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi
 card
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Hui
 Liu <hui.liu@mediatek.com>, 	linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Wed, 06 May 2026 22:14:41 +0800
In-Reply-To: <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
	 <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
	 <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowABH2AvSTPtpLvWNDw--.25404S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try8Xw1Dtw4DWF47JrWfuFg_yoW8uFWxpr
	1ktFWUtryUGrs7JF45Xr17JFW5Ar1fJwn8Cr1xXFy8tr15Ar1jqr98Xr909w4UJr48Jw1F
	qr10vry7ur1UZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j8KsUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: 5946E4DC2B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36292-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email]

=E5=9C=A8 2026-05-04=E4=B8=80=E7=9A=84 15:34 +0800=EF=BC=8CChen-Yu Tsai=E5=
=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng
> <zhengxingda@iscas.ac.cn> wrote:
> >=20
> > The mainline pcie-mediatek-gen3 driver does not have code managing
> > downstream device power / reset.
> >=20
> > As the Wi-Fi card on ciri is a fixed device, set the related
> > regulator
> > to always-on and use GPIO hog to set the status of its reset pin.
>=20
> The plan now is to model it as an M.2 E-key slot (even though the
> chip
> is actually soldered on the main board).

Interestingly I saw a "PCI_PWRCTRL_GENERIC" driver in 7.1, although it
does not support toggling #PERST now -- maybe this should be done and
used instead? (Well it looks like the driver had existed for some time,
but it was for "slots" previously)

Thanks,
Icenowy

>=20
> I have some of the patches ready, but I'm still working out the USB
> side of it.
>=20
>=20
> ChenYu
>=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
> > =C2=A01 file changed, 11 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 8e423504ec052..c25780098103b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -544,6 +544,11 @@ &mt6359codec {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mediatek,mic-type-2 =3D <2>;=
 /* DMIC */
> > =C2=A0};
> >=20
> > +&mt6359_vcn18_ldo_reg {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Used by WLAN */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator-always-on;
> > +};
> > +
> > =C2=A0&mt6359_vcore_buck_reg {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator-always-on;
> > =C2=A0};
> > @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outpu=
t-low;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wlan-reset-hog {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gpio-hog;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gpios =3D <145 GPIO_ACTIVE_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 output-high;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0};
> >=20
> > =C2=A0&pmic {
> > --
> > 2.52.0
> >=20
> >=20


