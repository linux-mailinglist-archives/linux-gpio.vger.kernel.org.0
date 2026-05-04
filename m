Return-Path: <linux-gpio+bounces-36012-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF1TGoRM+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36012-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:36:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD85F4B96C1
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F29D03012EB7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB562E62A4;
	Mon,  4 May 2026 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gVbAOi/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBF71D63F3
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880090; cv=pass; b=pl9Ubui9y10lyqrS3X7K/Ihv04D7KpuyhNr6YBoTgG732A31CogCFbvNlFDPFL6A27B3WN8+PZK9EphSaIxF+4R4FcBxa89EVdAWQBjggqEg3s819E7gBAG92707COIeN5oNon0vI7TJSKtrRl5AARYeA9ww/PN0RNMKemtuHJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880090; c=relaxed/simple;
	bh=mImTrtDwrEXC7X93ncElFhdb+XQUNNI1BSOw9cTkKyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W36uAXoSmaYhq31/H9CLxn9Uq/yQG1cHrhcCPfAN9vzmkZMgtTrD7FZU+vQUg6OskCWy1wusVExrbP15k/ZEKFUaytLKxF28f6bPuySeNoBwOrcqnB92DW/sbkwELzXHwQX2V+cagRGe0Pkb3CGKhHDmAGJ2uJMNy5Ib/zFALrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gVbAOi/w; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dea72099eso3841666e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880087; cv=none;
        d=google.com; s=arc-20240605;
        b=J29VR0un2zwLqInk2QhWSEGjNqsA3g9h4ozBaB+Efm30njaPH9HI3VYD+kH81Yedbd
         j8CqD79mtmJgeVmv7CuWizJLwYsBLJm4kOOpnZpi4xciEoewSJZuUiNu/8JwPO/pXi61
         7WNqtm0hpA1cg5DEkUbXeJNZD1AcqFZbN2JzRu80EQLA0iYXwHhUBVV2OFGVZ59W/bAm
         tIvHm8O+lOiN/ZQU3XcwSOmsbNgVJS4V07ylemsSLq1L2T2jb8UfN6jwO0XJ/EhuMOvC
         Og1zqVpNGKR1l0KMP8yz/y300USO7BFkBktSzD1jLMrXUPAxr7cstX8PnhXEWdwtjb1g
         P5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        fh=SbApjUznTQgKLRYVcink9hSfCKYetz9SCgUb+RQHjAE=;
        b=d2HC9tqYdYPL1ay5QwXd4rYNbmoAYW5RYzVuueLzLpNYYdK3I4Tnyh5Ph5l6fHqxQn
         Zrd2CPW2aL57JQJ8k2rmM+dNxnpnrCh7FS5Z493Up8PcQTYETneUJXRiuczD16SFEraA
         oMzNl9vwFkndrS/atXcUBQQItA+yKyp48A1+BrOoh2BsJ0hbBB8BVleKxR/SQSK8923p
         X0ZpdAlXIF45bWT70Oa0ck7NHBlj3lzKVuaINXqZ2emRmkZ8zPYU/1/SImFLOAYkb9NC
         hNMFqy1rDmWzG3gWm4GOZ2hGxukuzSY6cEx236GOnaTjtEQoguBhMuL7FyPBhE3n05Lg
         i5Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777880087; x=1778484887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=gVbAOi/wwclWQqbPw7DlfjZ+9+9Tsd+A6szBIUo4DdnMXM9Bmu0V049sNNDEmeLhU4
         BrqiEaiihyBmc53ZTEv3IhU4ZoP3GOEUapLUYY6mkBqTLjohaIhLIFgZuA6LxV9HgevN
         zl4k0Kj9D2qHcJVMmHL2TkRf0O3rQBur/yrQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880087; x=1778484887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=M4BHmQN5oN6L1MIzIPwnK9UEMRaumEDR8/0h7bnRcV+2R3lpKwn0VT9XsSdPjwXQvL
         7tZ4X8KLSXcDVygaKepuujUkKoxJWDRwVhQqwS7S3veWtPt2TB6YmEMiS0rvMpR5o018
         iMyjM9wSVYcILfGZibXiRnUCXAmH121DoZjiru8XDvE/tXtJk021wZO2pU9P4IAJG9hf
         hIDMJ47SHzednWbCEQg5cFB1iuw5VCMi3JuOcKV0O87LC58rQwTHbvy4ajg+Jd74EH7a
         Z84XK5/GQv5EZzI5L7d8PmGfoLHYQNGqRzukORettHif0E3DUoFV2yBDQagw7XKKBqsA
         KoAw==
X-Forwarded-Encrypted: i=1; AFNElJ8e8a+sJrQqMWMggh8XOpXEqd5YM/yoTj7Mfrwf+UUAhq7knVNpvPjvv1uQrbdVwaWKpIfnopkHMT1S@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPeqb8nyT2biu85nSGSAx6Lwnp2cMK801M61IyccXff7HuA22
	oj91SEMX3zIj92p0JqFOtP1dx+Nsn1/muAy/e6JPwc/+CSs4BJ44JHSNBkPPV+O4FvcH7Ox1VfQ
	b/ZJX7kSAc8Zrur3iQr+tYieoJKgp5JhU9gnAOCbH
X-Gm-Gg: AeBDieuqDa5Bbp4gjxMR9ZgxE2PEcNcMZSav7+H1bJMVsgAgpfVib1ZVIkbQfx7/2Te
	Q9DssIF6+led27HYzaXLpICQ5twCdO+CZkuxQOcEI3cZRbBQK8zOzRmYKEkI0pTvHfqAj+LDc5m
	XzWwcIlDypmsvOz2SrjOyWAmCM5o7I7J2WX9ObrwmwVMVCniHetfjZ7nSoQruVggJK6K6tujVUw
	nzhy9jduHFj4Kqy6GfuhOnzvckOtzzKO3+XjvC2DVNXykL28T2ECqLQtk1Ej5DejA2ylJTPBfuB
	NElXZ5i4mQ5XXfqaF1OPm7B4Z3PnJ3VV/7HWDibqZFoWYsHc
X-Received: by 2002:a05:6512:3b84:b0:5a2:a3dc:51e3 with SMTP id
 2adb3069b0e04-5a862ec11b8mr2434888e87.12.1777880087115; Mon, 04 May 2026
 00:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn> <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 15:34:35 +0800
X-Gm-Features: AVHnY4IuKDBbAkS85uOVR5vEB6IDbpI4Sjzup8SfiFFfaDlz9Xmq5t63cjYsvnU
Message-ID: <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
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
X-Rspamd-Queue-Id: BD85F4B96C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36012-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]

Hi,

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> The mainline pcie-mediatek-gen3 driver does not have code managing
> downstream device power / reset.
>
> As the Wi-Fi card on ciri is a fixed device, set the related regulator
> to always-on and use GPIO hog to set the status of its reset pin.

The plan now is to model it as an M.2 E-key slot (even though the chip
is actually soldered on the main board).

I have some of the patches ready, but I'm still working out the USB
side of it.


ChenYu

> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..c25780098103b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -544,6 +544,11 @@ &mt6359codec {
>         mediatek,mic-type-2 =3D <2>; /* DMIC */
>  };
>
> +&mt6359_vcn18_ldo_reg {
> +       /* Used by WLAN */
> +       regulator-always-on;
> +};
> +
>  &mt6359_vcore_buck_reg {
>         regulator-always-on;
>  };
> @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
>                         output-low;
>                 };
>         };
> +
> +       wlan-reset-hog {
> +               gpio-hog;
> +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
>  };
>
>  &pmic {
> --
> 2.52.0
>
>

