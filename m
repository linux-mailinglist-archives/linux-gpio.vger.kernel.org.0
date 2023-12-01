Return-Path: <linux-gpio+bounces-822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79E800876
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 11:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2DDCB211D1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 10:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CCB1C6BB;
	Fri,  1 Dec 2023 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kEJAUXez"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902FEF4
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 02:38:11 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-46446cd5c8eso665063137.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701427090; x=1702031890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTTB5Qf3NGi+WB3GCJHG37DhU59Gl9ODLb3haNT1v/c=;
        b=kEJAUXezhcezJLZxMjtGjmmwIBcxqs+4A2DBK2At1NFG4VXACwh4I+X4Z5X6yja1lJ
         F2ESnvA0dnxy2jC87uy7dPz+HuVPHbcQLwsthM/Jjh13zRLzl+7WXan2CNE2w0aTDOX6
         2NVQENlG5BJw6FwWlmt2fkbh5kHFVpn8HOrrbzlTkxVX4P/TjecdWGfE3PB533uF++7H
         Sj7TIgNjvdESagMEbr41pg38lJ3JiC5rLFZj5Eg4dRm4Ez01/9rHHQdUO/gOb7My+ja6
         OuvuwWLdPBW3eWljkWFFNO/5gNi5S9rOv8cSTXx5d68se+xwosg0JzDSgEI9QMT9uJnz
         q4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701427090; x=1702031890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTTB5Qf3NGi+WB3GCJHG37DhU59Gl9ODLb3haNT1v/c=;
        b=i7bSRjocvtax1WPlbBuNgi0baiVCodtzPutPdN1aM7xF9vsBzbQHIw96Lb2f1avSkA
         Db3+Yi/mHdMmfteUz5+dFPAyWP2rbg5gf917jAuz+HzJPft238FxjxAgygUTAtuKjSzB
         OJDqXiH3FOwfyLph3+JV5zgmuTR/lah2H8n/Y83QK857Bki/OtqUDBY52KYo4pa1dNay
         svsYX3FvPTr/aALDrC7Hc5CAiOdryT7xuUP5GfLICRQ91zzhieYxLb3EzupG7lS9lHB/
         B2VfKIiCyb80KJI6mLRVy4C7P0NhUqc3nc+dtqiIPQes89IPmgY4IFu4cEEoQ+tA6N52
         0EKw==
X-Gm-Message-State: AOJu0YzOR2GjQyNB/Yx0mxXJGAHxJ6EK/Qv3+t2HJOvgG1n8DPlTyvc3
	ejoQkBCzOPVCl6sqKFuUjUc+bjjvmyx/DoIV+YDXbg==
X-Google-Smtp-Source: AGHT+IHD3C4jeU8YUMrsywQzBJT50HuwUQ8yJRyHKKpw9tFA3HPIcqu/SHTN20FoIPSzlf2zVyUp/WJHxr0sgyP3xm4=
X-Received: by 2002:a67:bc19:0:b0:464:4891:cce4 with SMTP id
 t25-20020a67bc19000000b004644891cce4mr8735525vsn.20.1701427090706; Fri, 01
 Dec 2023 02:38:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <10db3021e8617c1f98eca51e26d350dc4b51b53c.1701335736.git.michal.simek@amd.com>
In-Reply-To: <10db3021e8617c1f98eca51e26d350dc4b51b53c.1701335736.git.michal.simek@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Dec 2023 11:37:59 +0100
Message-ID: <CAMRc=Md7iQnkOp+nB3=haakpt5jF_STtYgDAcxRVQJjYWnjFKA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: modepin: Describe label property
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, 
	git@xilinx.com, Andy Shevchenko <andy@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Piyush Mehta <piyush.mehta@amd.com>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:15=E2=80=AFAM Michal Simek <michal.simek@amd.com=
> wrote:
>
> Describe optional label property which can be used for better gpio
> identification.
>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-mode=
pin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.=
yaml
> index 56143f1fe84a..b1fd632718d4 100644
> --- a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yam=
l
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yam=
l
> @@ -23,6 +23,8 @@ properties:
>    "#gpio-cells":
>      const: 2
>
> +  label: true
> +
>  required:
>    - compatible
>    - gpio-controller
> @@ -37,6 +39,7 @@ examples:
>              compatible =3D "xlnx,zynqmp-gpio-modepin";
>              gpio-controller;
>              #gpio-cells =3D <2>;
> +            label =3D "modepin";
>          };
>      };
>
> --
> 2.36.1
>

Applied, thanks!

Bart

