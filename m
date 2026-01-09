Return-Path: <linux-gpio+bounces-30341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7AD09967
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 13:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED5630622BD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 12:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692CD35A956;
	Fri,  9 Jan 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yOQ5FDo3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57535A957
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961234; cv=none; b=s21caSHDzYDSORCI5P8acM+tJohhSnn/2DiN2p8x/80VPgpI5m1YWspji9eRmoaIXbJs/G1//4CcBg1Ed27dxur2IPLq1l+pEiaRnPqzyk+blkq9O5W+yv6wOfbCZLeucfi0zK6M3Rb4hqlS/bSbYHv/hx0F4J+p9c7T0IVBO/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961234; c=relaxed/simple;
	bh=iZMXxod4+roZ3ZATUDhYNOynA14pD/OOmrS9JayfZjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeu0WXvsHhZzIVcFzA7mGLD/+pvoDu7YVrGOk4dTIE9GaRZp8ruJISAXS/MxbskvBmeoolXeuaiJdgzEjjCtgkxmLVbeRabkSzLJfcI0bGts+zoPpc/zxjI+V2rVjZKRpT6bqfCrXQwqAUGRTum1jc54Bi2iKQCeWybPFhuYtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yOQ5FDo3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fba1a1b1eso47016747b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 04:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767961231; x=1768566031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukh2GBiqrpSOrFovoNwBAt/J/QmgBGkcNbLsTOHoYIQ=;
        b=yOQ5FDo3jAsZd8Y0UdH4QmSVbKfqRlefFNag/4CAiRnZ/LYRDMVqJNUwHuwn0F1s8t
         XpRk37PsOKwM07W9tgoOdAuX+B0RqW6SVyUQsqi6kEY57RecGxj8kD6aVVO6A6Rd1DQn
         f278MIcqVOMz0Dw27exsaVhcuGxTF4Xe9H9IFTSpHvEuGxY6zHgIECgasis9NA2Movec
         kfKUpKfHX8YrJ5RKMr6PXGwWU17X269TG4ltn7vbmXrQ8Ybs2xiIEd7X9NHrFVx7hc1n
         ynGZ+a2wRMkJ2BX7sRr0oQNMEZWD3CmfyHs7oLPHM6DSLe8V9nVpBWPbVwqM+oqN28zC
         SB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767961231; x=1768566031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ukh2GBiqrpSOrFovoNwBAt/J/QmgBGkcNbLsTOHoYIQ=;
        b=a8oH+SOk8psYrnj/GBn+xl45WwcmHaKLsQCoLmy11rqcfFCpXkfUcAC0vFUkjK38KT
         K70njLT0R13AUJbHG4QpBDLbGvJJAqDaJkt3GyEN13ZU6FC6oE4of6EXjmUhWpHtCXiz
         J2l3z8ykjzvAsWkN43MW51y1TamliRyyQur54P0v37lNm2FMUFTOPUQ0WMDlEGDEhO+Y
         WGV8e796/GFNbZkbsSuIHeVnp30Eq3HbC+eNe5nROOuZeA3wjioXl78zAt53I5NjobTC
         camNFP7aO3hfF1QBU7CNkTQyFBo+l/1c4YbDsC12BZjr2o7nlEGCk08o0YDX1xn8yZkP
         YEYg==
X-Forwarded-Encrypted: i=1; AJvYcCWFGTNBQZTJXQ4DbSwdFbSYLOk+mh3uApuuDIL4gHBuke9d0Sv71h8XzB8xp0MHlXErhbIAsJ2dbHqi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8FYJS3j53sPYBOjBJfQrSuC8RamSn4UT/dKc3mysZcNo0+9KE
	lvV5eHiKmWNkJrWbRbG91dJeBk4OGCctoa8fIrQZyJBAHxIzrp94GFC2i+ag08gwi1qM4IlCZdz
	Xv1IP5vim5tgfUXZ7z5kYuz/iyVKOVL7kKi0Y+cfwYA==
X-Gm-Gg: AY/fxX4N4sABPo8nrnDYfIMWHQFTv40JO5LQDDPf+WF3WIEOmHhnvZj7f/nbyT2jRuN
	+xFY/kCnFrTsYq5lOv94VDFaqqB3lwWHPzQhPTOQk1fMCrovCrGCDfmItZfQ0Sh0z/56FOHbe1l
	l7JcvPeYG/IS2u9C+bF9AcAP4r52GXR62rOiLkpiors6/Gunr3ioiDSzprLooqcc3wDTgAHYTgp
	WRrb3ox4B1x35qQi5w/qfpXa7ItO6EhQzf8KtLybUV5eIe8uuqlMDh59CdKgdi+5dq6zguM5LB4
	s21TF5N7/pTfjF1i9B30saBrTvQoldyzyW3yEaxshKE=
X-Google-Smtp-Source: AGHT+IEhMWcvDM1SrRQXH+l+w0IiP0cunz8wXS9r5P4Z+auaz2lvzOyrhy9URS2jkNUL58e6LoB0ZIxYLGgtVQF/jg4=
X-Received: by 2002:a05:690e:4008:b0:645:527b:bc25 with SMTP id
 956f58d0204a3-6470d316484mr11391255d50.43.1767961231358; Fri, 09 Jan 2026
 04:20:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org> <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 9 Jan 2026 20:20:19 +0800
X-Gm-Features: AQt7F2pX-qHrvIy9ewuvaqm_6fzKWfdXRjphTDvJYELxE1h4Qxa4FZfMO-nJbgI
Message-ID: <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, Jan 2, 2026 at 3:04=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 ++++=
+++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index 609d7db97822..9a76cffcbaee 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
>
>    reg:
>      items:
> @@ -81,6 +83,12 @@ patternProperties:
>                - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
>                  description: For K1 SoC, 3.3V voltage output
>
> +              - enum: [ 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 3=
0, 31, 33 ]
> +                description: For K3 SoC, 1.8V voltage output
> +
> +              - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, =
35, 37, 38 ]
> +                description: For K3 SoC, 1.8V voltage output

Should one of these be 3.3V? Both descriptions currently specify 1.8V.

Best regards,
Guodong Xu

> +
>            input-schmitt:
>              description: |
>                typical threshold for schmitt trigger.
>
> --
> 2.52.0
>
>

