Return-Path: <linux-gpio+bounces-29235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F4CA1642
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 20:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A17E430F100E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 19:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6209932AAA8;
	Wed,  3 Dec 2025 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwHwke8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89CE32E138
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764788984; cv=none; b=NIPQ9f078o2h/alvixah5M+NZoWoz4LFMPnp57K/HQDXwI4IKMhB6z6UB1FfDDCZ2rjKOyqQFp5HdoTFPnc8XoFgJHg2/aofPqIocW6GT0zV2+8lDcIIejp+trOuzgq13GoHAS0DWI10EOFJz63+Dan0krtUD/y5af3okBTX8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764788984; c=relaxed/simple;
	bh=UQ9P4gpoDW6/g+aOONFllk+M86mat3ZiIaRaBBWZWHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENvYe93Lo4Wv9HJ1a2RQ7XJF7r8P+5E+PSH/3CxK+7FMbk/pDAs9BlCDac4J1pwYu5hVjx26k0Bc5ncNGktjzVsP/p9asQ5RSHtnQrANbwrbYghtfuGK8OXrSlQObVUSw3nzxuc3wOO9S61X0F51qAHUEhwlofzVOFHZMOono4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwHwke8e; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-298039e00c2so1310615ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 11:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764788981; x=1765393781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=;
        b=pwHwke8e/pv0MnQBxHtn34JFOWKRfYnkjYSJ5KPdk8MKepsuyBFH7weJsQ0fWSt0I1
         /eqlxOlLBgywz7H+nPhQRwmNiW7wNiZ0TqzOFdTXCMxVxboICLYLIsGdxW5iuWUb+6i7
         LtfYObIsmB1jh4OfbKgAWykQlK2ZbGm1OfI1EfNQIpHqRBKqBDEXXpCTFL8SRxsuOtqz
         pbjuic708dJAuawrsKwqo6xOnof60kic317n05avi1myu5zxFQ7LAjLHyyqXx0dO53Ih
         APZY9HS8KDq/2ih6GGzRgfIQ5+EF6ypSgfbY5q5+yG7rlsB00rT4qS2/sNyP3IRh+XXG
         +2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764788981; x=1765393781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=;
        b=XsJq5wqAKb52+XN882Aq8j2ti4hn1G7ywOh8GooaXHVCR+gHW9wwD05Ru7ICjAbnP+
         OvYPFarV5seB0xVfeHnOkMTKqm5Rn9U7kG5BT8T3lZyq87spHVE3Ov7OP6KfuME2G1In
         v8ckNueFZV1ZBbn4yyARm4kBALQTISkscbXHc7uSClN/ih9KOHG76RjfzHWpe2m6B1qa
         HvdUgyx0wEyrZjrtqnZI/SmgvSDAmyjIHApUNO0Vmn+clDvJvsNtLwlC37I/ztxTY2qc
         B/nDik+C2vPMySwJ3Z45LV8ISAolRKE8qp35T8lRSMTRodOlzl1vhveJsnv+BZ1BwLSP
         v1ww==
X-Forwarded-Encrypted: i=1; AJvYcCVaP0u2668gKm9Leu1hdHFAqy/FDEKnOafkQy4SPLvDFGRcQz9g/Q9nspEeO/gGHiSVt610qa5zidlc@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/iTwlCVV83OHUKbLagc4u+LHFvGCQDZQ+REU9onu6xuqSbP+
	c/8bgOnzRF2Q5TGoTPHbMuZYoOla2ZICMWWwA76ou5bRXdmGxjxFxy7vevpiNYrLSOs=
X-Gm-Gg: ASbGncu4Lk9/I3wh6ZkFZX1vGrR0IZRpL77zVziPKODJ/kNnOvrS0WQOaXZeMJqNHxJ
	fSgD54fUbYOx7A02pZJ0Wyl8yftvRqkf0xJpjlWQnz+CyItpiibTHd+gvHn2WrXuiJLsoG82Lr/
	rXOF5AowT+c0WYlfexzxESZAtnP9kQbU0lXJ5jKNSRWGczO+3/SJp3TKoeVHo51Z8L1+8+Sw9p3
	stePYjUb0q8Karmi3TLCmY5+2T/k/7gSGUQ0j+p8DqXgUhyCtYW/k3aFfiA60fIln7nkTqrHCjg
	dqLKIefEXstKqzY7a5eyjgkF7OZMf/WX6AQiTK3SVEKCXrgY7bMaQ6Scn41+XYWPsYwnGxNpSz3
	GahTel7rerPVPgHmOuo9pjInzYPjmyJw3+kBUvoc/13JA+nJsWAJVsWUXHvrwhwk+nEzn1SZno/
	xyKeRrI0FbuN64eH+NW1EQ48oU
X-Google-Smtp-Source: AGHT+IF06RISZgnSJBztNS3j4oN16EtI84xL0/NkOjF0OCvNrCJXb3n/r6sR5sNc/4qd+kbVJVFsEA==
X-Received: by 2002:a17:903:94f:b0:29d:73cc:c9f6 with SMTP id d9443c01a7336-29d73cce8bdmr29319365ad.1.1764788981186;
        Wed, 03 Dec 2025 11:09:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:dc26:2c67:b58f:e40a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7f69asm190635605ad.102.2025.12.03.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:09:40 -0800 (PST)
Date: Wed, 3 Dec 2025 12:09:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com, Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aTCK8e1SJA7Uh3wL@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:10PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
> 
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
> 
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
> 
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: staging: gpio-rpmsg: gpio over rpmsg bus
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
>  Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
>  Documentation/staging/index.rst               |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 146 ++++++
>  include/linux/rpmsg/imx_rpmsg.h               |  48 ++
>  9 files changed, 1040 insertions(+)
>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
>

After reviewing this patchset I come to the following conclusion:

(1) Other people have pointed this out multiple time and I will do the same: the
only way this work will move forward is by adopting a generic solution.  This
proposal is not (no need to try to convince me otherwise).

(2) The right way to do this would be to have a separate set of virtqueues for
each component that sits behind the remoteproc, instantiated using the content
found in the resource table.  This would follow the same approach as the
namespace, with their own VIRTIO IDS as published in [1].  That way we could
re-use a lot of the work already done for other components, such as virtio-i2c
and virtio-gpio.

(3) Some environment may be too memory constrained for option (2) above, hence
using rpmsg as a transport protocol.  But as with option (2), that way also
needs to look like virtio devices to the kernel.  It also means that protocol
to interact with components need to follow the OASIS specification.  As such
you'd have platform drivers for rpmsg-i2c and rpmsg-gpio that would register
rpmsg_drivers.

I don't mind which approach is taken as they both represent the same amount of
work.  Lastly, your next patchset should contain an implementation for GPIO or
I2C, not both.

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v6.18-rc7/source/include/uapi/linux/virtio_ids.h#L38
 
> --
> 2.43.0
> 

