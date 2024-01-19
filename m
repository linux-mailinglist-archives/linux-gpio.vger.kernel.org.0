Return-Path: <linux-gpio+bounces-2357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B7E832943
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jan 2024 12:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B51FCB23C66
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jan 2024 11:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DB04F203;
	Fri, 19 Jan 2024 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kmhQ8tcb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E624B47
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jan 2024 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705665223; cv=none; b=fFHNpshfhNon7Xh9fP8Z5rM+mjLqMU2JkqLb6Vxm2KfbuxZ6TlT5pz/aLSqFpFZUFHJ2/beHV2RxSmYjiqBRXiic3ddIh5yOLRjY3zqvLMvfJAy6yeKMdbdzvFJoeNgT7q9QG6GLEXYxLpBlLODWZEyLx9DtCCBl5ach0jqRX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705665223; c=relaxed/simple;
	bh=l/9ghh5sZNG50d5xIaj7ON6EVW6p2iNzyQioT697ezs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjmSIoDCELb+Qq4WmUiF7k2uYezYr8/IIjvKSyxgM5UnWx+CRuzMwBKT1ujBOSo8SCZxjvO2vqFXSFIHbhi8Whv7qaVNGusCC3iTv2e3o1wJcI2SBpUKVGHsykaWHyuu22HqWYhCyqUTugOrhCQVVzVnYKmSsNEr1k99+7RePAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kmhQ8tcb; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-466fb179334so191438137.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jan 2024 03:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705665220; x=1706270020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdyfVh6//9O93MHLA2iBuWLwQbIIxJp93yFjTXEDrOA=;
        b=kmhQ8tcbokOmRRB+HNfrE/jb4dfO4DiWfjv9i0QuQqT/8nq6QF1yI2TN8YhLLl3ykD
         y/jqObSlstXmLvsZcgOnUCxhGz/8MWGJm5QYnSCIAhcV1wdSuSgjl2lUcoDawPEbyEbD
         rEB16Y06JQiXfOC2PlgI3MYSBOQPiztJYLXgHdpf+m0HnUmQs9ql8ilTEbg/D29/KbMm
         Hr72pmolyhQ61/5Cqc3wGAk4vZwrIhya0iWOdnw5+d/L51aNdgaIYIOctdwoWNYLeF/O
         SkXn3TCstVWHlj/+NcEmRkLHRhyw8tqF204VZO0/eF0dmxD6r2gWhM0c7lescTsX0TLH
         y3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705665220; x=1706270020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdyfVh6//9O93MHLA2iBuWLwQbIIxJp93yFjTXEDrOA=;
        b=wyeqGRhJNtYUfkVGHpzYEv1BWhjstyjblT7nh/yAf5HWUcn+dHTTs1at7IZeOpIBL0
         wmCKGGxp2/aOKGEiqMExVq1+YI/3MQGSOZ7FnSKsR3UzL5+6oVPmWUJQ0BGtCJSsu1hg
         TwUEORjB53ubTAOjrr3TYd1v3mAjqRntCEgB6gVPADteYK5sYvylTwVtNAFsw+Q1WHc+
         5XmhpYy10VO8hQMfc55dFGH/IMW28rI0vReSoZ9oK3JfuN7vD8E34NbjXTazJuOmlq+/
         6uoW4uaTRR5CRZ/SPGZqcwqiDqWQ/5INXviW89IoCoL1ktlLfyPyehteIy5UWs2tVQmh
         FW8g==
X-Gm-Message-State: AOJu0YzNrl9MRufqArV9BuFR+3DiNyWLIklQDH9pzMgBpK+VVg+0qtkZ
	2fO3gXEJQqAUylZ+R6WPjqU09jIJt5Abrb3z0u8nBbSwu1vULBIUyuYkehBOL8VaK8BIcFSeEFT
	DuIoNDZOQOmoAma9bZsuFRqZAt3HTy6O9fU2cWg==
X-Google-Smtp-Source: AGHT+IHQ3U9Hg9WEo4Q/SGuPbw2OLuTsK6SdCFn3dBtBA7yPPGLxrDq5Ybq2Sbb9Q+mVkFk1I0t3rMA8IdEw0Rv+tzI=
X-Received: by 2002:a05:6102:ac5:b0:467:c4cf:cac7 with SMTP id
 m5-20020a0561020ac500b00467c4cfcac7mr1929825vsh.14.1705665219501; Fri, 19 Jan
 2024 03:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705664181-722937-1-git-send-email-radhey.shyam.pandey@amd.com>
In-Reply-To: <1705664181-722937-1-git-send-email-radhey.shyam.pandey@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 19 Jan 2024 12:53:28 +0100
Message-ID: <CAMRc=MeatMgQqase263xfsLRcSwMjx3Xwprt78igooYT-+8NaQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: xilinx: replace Piyush Mehta maintainership
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: dlemoal@kernel.org, cassel@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linus.walleij@linaro.org, michal.simek@amd.com, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, piyush.mehta@amd.com, mubin.sayyed@amd.com, 
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 12:36=E2=80=AFPM Radhey Shyam Pandey
<radhey.shyam.pandey@amd.com> wrote:
>
> As Piyush is leaving AMD, he handed over ahci-ceva, ZynqMP Mode Pin GPIO
> controller, Zynq UltraScale+ MPSoC and Versal reset, Xilinx SuperSpeed
> DWC3 USB SoC controller, Microchip USB5744 4-port Hub Controller and
> Xilinx udc controller maintainership duties to Mubin and Radhey.
>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-mode=
pin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.=
yaml
> index b1fd632718d4..bb93baa88879 100644
> --- a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yam=
l
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yam=
l
> @@ -12,7 +12,8 @@ description:
>    PS_MODE). Every pin can be configured as input/output.
>
>  maintainers:
> -  - Piyush Mehta <piyush.mehta@amd.com>
> +  - Mubin Sayyed <mubin.sayyed@amd.com>
> +  - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>
>  properties:
>    compatible:

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[snip]

