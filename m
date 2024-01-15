Return-Path: <linux-gpio+bounces-2219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27082D6E0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF9B1C2173C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6AAF9EC;
	Mon, 15 Jan 2024 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wxXXPFrl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C0F4FA
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4670a58b118so1618624137.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705313419; x=1705918219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFrJ/HBVhAaF/Xj3UF7R09WaPdNiQxW3jxD4yq9rGCo=;
        b=wxXXPFrlTHNI+ZPTngfwHRAKyfC8yieHAuvY5e72H6VYXNdpbx5V8uRoETzRmHnN68
         qLS+/axQCwzjyKhZ3irSAvk7E024HQS9GrfEBG/sUFMs8uHxOqPfiUm27Hjb1Typ9t3f
         IKL/2EfADKTft7/wDMWWvZph1RkgsBzBl9ZCtnPQWhtLbKW5z5hoVTOY1nT5uVJxte3u
         M9hxJMqOwFT0VDaRrjI7zD+LzN3rdaBh0cSVO0+rKEGdRKRGx60K63LAekIVU6hfldM9
         egmarYr3xsYvEyKFjEsBOIJMnlq+Nxqn9+JRy9LQJlEgigPXXDvN5hiYpPWme7V/jXAo
         MoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313419; x=1705918219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFrJ/HBVhAaF/Xj3UF7R09WaPdNiQxW3jxD4yq9rGCo=;
        b=HT0zLuSj8lJfMpYaNGiyrNuCqeO9XWAwNtVadonA0GM6W6cOGJ7pou250NcCgalmOJ
         eTY1Aqz/n45H0jVXMJFKH6RgpeQ8y5C3cB82bizTxzOa0l0AWpuo0xZAOfiXbcFLDMzS
         U/xyf0Am/H5M7W7fP0dewALWbh3yYIcC9StBNx+GH95/8ppXD+HqYbDLui/eOSl3/A50
         HMv0QXQm8TOavRbNGql0awOaUDoDbV/liSt7VCiQYv2tdflWRnMma6TA9dIZ+1k8uCfB
         fedsci/6IsZ5A58omdxsH840dT/Avom+OixpmVqy8AT59YGX3wepLfSzQ9hLrYc/4hOh
         eBrg==
X-Gm-Message-State: AOJu0Yw9fvJZhSCN2ZAaDNWdeIvWUAL2d/ABCtKhjHhd39tVvLGftq+Q
	y79hWzWgRnbU6F2S0OA6HrdxyrEqlYKQnLw50MOKBt8iA5Gj3g==
X-Google-Smtp-Source: AGHT+IFemXuL2baV138dkJ60wnBQZ5yEQVegtqUburpnv198cY9dfdhifBKph5rBcD+Ri8PjkQUazo21ni196CG6rnY=
X-Received: by 2002:a67:fa43:0:b0:468:1368:7af4 with SMTP id
 j3-20020a67fa43000000b0046813687af4mr2901727vsq.0.1705313418965; Mon, 15 Jan
 2024 02:10:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <168de7084faeee0113cc7b93800cc24c49f308c7.1705059172.git.michal.simek@amd.com>
In-Reply-To: <168de7084faeee0113cc7b93800cc24c49f308c7.1705059172.git.michal.simek@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 11:10:08 +0100
Message-ID: <CAMRc=Mevutv-Offk+VOrUt1YoAnSxBMGeEf=NbAgaZ=ACwJaOw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: xilinx: Fix node address in gpio
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, 
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 12:33=E2=80=AFPM Michal Simek <michal.simek@amd.com=
> wrote:
>
> Node address doesn't match reg property which is not correct.
>
> Fixes: ba96b2e7974b ("dt-bindings: gpio: gpio-xilinx: Convert Xilinx axi =
gpio binding to YAML")
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
>  Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml=
 b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> index c1060e5fcef3..d3d8a2e143ed 100644
> --- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> @@ -126,7 +126,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        gpio@e000a000 {
> +        gpio@a0020000 {
>              compatible =3D "xlnx,xps-gpio-1.00.a";
>              reg =3D <0xa0020000 0x10000>;
>              #gpio-cells =3D <2>;
> --
> 2.36.1
>

Queued for fixes, thanks!

Bart

