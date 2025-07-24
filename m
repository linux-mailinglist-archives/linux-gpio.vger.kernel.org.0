Return-Path: <linux-gpio+bounces-23771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022CB106B7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38BF8AE2D0C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB1524A06D;
	Thu, 24 Jul 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a5jCpCSl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E772405E3
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349671; cv=none; b=FPOACuJqnIIz+Q8hExip493LsWFxuPyVSK1k3Up5eVmCvNyjF7opGbDbCwI5P4Gv42rlTn/SatCydGXnnXTdKh3sajUE4NjsCmubN7QDOO/Z/SjAYIdAw79UGLkssTuMHeTVfoOHUvzrU52/+ce45jgZ8QitIHKlonbL2v6hpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349671; c=relaxed/simple;
	bh=5fM4O5mlIBXMh+83kGnKKJzdndRtAsTin43siUV5gCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUDKigvwlj9ovUmYnD7+oiZkbqx06LFfdfhY7fGPlDclNTBFsA4DxhxTXNgdfDzdeVy3TjDoEZf+HB6Qn+FgV4MUOxzGKmQ/yHgY/CimRB5VfGzWjiV7Up1X6VRmn9Ik9Ya+TZZdGjLlfl4y14gkh0u08NBhY4MP4XshLiTNj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a5jCpCSl; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5551a770828so808922e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753349668; x=1753954468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
        b=a5jCpCSlmj87IOOm+0wkKsdl8ZdzFGIkwdEt9M6maV6Brhd9xM8iP4qUNktBupWN5L
         Dqa0Bog/Jqd7oxNAPsjpWOSA6swlrkeBk1jhb9iJE07kWSTlERXrapw0nRGST5YdT/uY
         X3hiy7tm57mI8ZXiOHw8ISXcLho2A0b91Agiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349668; x=1753954468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
        b=Y/1zHZaiecqc4kogOSaMnZ7xmy0MzVj2d2/xb3QOZawj4w/Z0EBeY284hanpeLIGrj
         RBEUFGOrbHRWIftJucmbgmJih7hc37BPPkIdA0Y/bac/txe16GfFOpHP8Ksvn+lQOXGz
         YTKwBYYwfbSBB2kM1IgnRJvzsi2BSP0zFGYfhM4+65GS7L5AEdmKenlFHRfiZQlocDDb
         WCb0TGHySvYDdnfQqfNTcV94TiCb34Bcr/3ceXrsxxQFIHg8tWHgt4G9ncLSDL80XAi0
         Xkg/y91hQfPqFKmQfTadqKR6sI5RG4iNT+4JX2yTN+7wVeAhYUB/n+J1/mjGsZqhPZj/
         bNsg==
X-Forwarded-Encrypted: i=1; AJvYcCWccfzV40lWRvIlITADpV30J4Z8NPvmRb9/2VnP6eXXHJGOBkfJzjQkG26By6xjZQMdD6AZuyHPCXuN@vger.kernel.org
X-Gm-Message-State: AOJu0YwKoPFZgYJkfd/5wdSpS3oNmrBjT/oQ8Un3fu5vJhdPDVaj0Spd
	BPVp9+PRupVFPFRBM3/586I7tQcmJOkdsBOBcwILfkd0G8TVOVH8082+SeuhGZQzfnJYEZYz0pm
	Tt642brkcTT3fjhDDnBGehXb4uW/uUdptYLAnFNch
X-Gm-Gg: ASbGncs1eaKtea43Iplb6OOue/ZV6dWTroThriJvEUvFhsWYcHbpjpRlftwo5p0RXVo
	bL31o9jurL/3wdM16HJH+GTqRRoLTk/x7V17cYASD+FTPYXkFSTFqvsTpVb5rS3YAOl/RG5T2eU
	GNWKPG2g8voL5mwHDa0fHhLPXM99PeNI5jQiT9AG6H7ODzZvFgGW7p4FOjrLbu5uX//7hrItCHO
	dDpKS3BX8yTr+PTi+nIPUB4828iImCgZN8=
X-Google-Smtp-Source: AGHT+IGbQGAzYrZuGKb7ZyVDVB2IA3/m7/1T14ShQ1gB/s052YEW14kETsBT1/6F7qIVfTgZAU3RoBMdAKdnokA3DJc=
X-Received: by 2002:a05:6512:2391:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-55a513bf799mr2287118e87.31.1753349667560; Thu, 24 Jul 2025
 02:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:34:15 +0800
X-Gm-Features: Ac12FXx-dC7GqsweL9em8IYbzr7gdu7h7TRc-hJouMaDYtIUw_U2Osb1ZV53HA8
Message-ID: <CAGXv+5ECM53Q4ndZ49Xa71mamy=GhGqdOMQYXydH6cEeT=0EgA@mail.gmail.com>
Subject: Re: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel
 node to machine dtsis
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Not all of the kukui machines have got a real DSI panel, infact,
> some of those have got a DSI to eDP bridge instead: this means
> that the address and size cells are necessary in the first case
> but unnecessary in the latter.
>
> Instead of adding a bunch of /delete-node/ which would impact on
> human readability, move the entire panel node declaration to each
> of the relevant Kukui machine dtsi: even though this introduces
> some duplication, the advantages in readability surclass that.

This is just an artifact of the lineage. Kukui the original design
was a tablet with MIPI DSI panels. Then the Jacuzzi clamshell design
with eDP panels was derived from that.

If we really don't like the duplication, maybe we could introduce
a `mt8183-kukui-tablet.dtsi` file for the bits that are specific
to the tablet design.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
>  5 files changed, 83 insertions(+), 28 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index f2afca63c75a..1b74ec171c10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
>         };
>  };
>
> -&dsi0 {
> -       status =3D "okay";
> -       /delete-node/panel@0;
> -};
> -
>  &dsi_out {
>         remote-endpoint =3D <&anx7625_in>;
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 472d4987615a..d71972c94e42 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -61,6 +61,33 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 1b21e3958061..b702ff066636 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
>         };
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a85c73b43195..b6cfcafd8b06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -45,6 +45,34 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 8f3a0e85b4ed..4ac0a60fdd24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -252,29 +252,6 @@ &cpu7 {
>
>  &dsi0 {
>         status =3D "okay";
> -       #address-cells =3D <1>;
> -       #size-cells =3D <0>;
> -       panel: panel@0 {
> -               /* compatible will be set in board dts */
> -               reg =3D <0>;
> -               enable-gpios =3D <&pio 45 0>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&panel_pins_default>;
> -               avdd-supply =3D <&ppvarn_lcd>;
> -               avee-supply =3D <&ppvarp_lcd>;
> -               pp1800-supply =3D <&pp1800_lcd>;
> -               backlight =3D <&backlight_lcd0>;
> -               rotation =3D <270>;
> -               port {
> -                       panel_in: endpoint {
> -                               remote-endpoint =3D <&dsi_out>;
> -                       };
> -               };
> -       };
> -};
> -
> -&dsi_out {
> -       remote-endpoint =3D <&panel_in>;
>  };
>
>  &gic {
> --
> 2.50.1
>

