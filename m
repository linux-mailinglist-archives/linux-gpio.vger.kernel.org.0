Return-Path: <linux-gpio+bounces-35417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGY1GVMW6mlHtwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 14:53:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4A452596
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 14:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06FF43012BFC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A253EE1F6;
	Thu, 23 Apr 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASlwJzSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02B3EE1DC
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948807; cv=pass; b=dMETIp7jyhiakUAq7O6Q7Aojdhpeu+tqi90CBBy07zpZrx6OfIYB/RpqJBImfIz2OHK1h3bAC4AFy82ZRs7SpGi3Sezq3F8YJMC6OpYEzKcwvf5fIr2UIvwS+ZICa6gg6YOZ54hQXYhyie0pSYOpFOFJggkPdAz1FF5otZmOZVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948807; c=relaxed/simple;
	bh=F2lKZ/qSN6SIkBL+rAQMZomA6ldD6Jeu1f52cfpnYWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqzNgN+oE88kgkL4eqti+2d7TXg/eyGk2xvUzKpF2G7zAK1QkdwZnN1ieHt7VinAQTxgjkzQpRKlvAn3I61ItwMav3DkUgDC30Ig/9vkbJdRKnOthZXfv6Cp81kGRcccUbnc+mDVOV0VLF9AwSahUYpR9MbhQXjRvTCfpQMdz6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASlwJzSH; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b886fc047d5so1180841266b.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 05:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776948804; cv=none;
        d=google.com; s=arc-20240605;
        b=Mo19pL8COJRSRdhdN/lxDzpjzFBaKGH/Hv0tB7ZeGcwunnSH1Iq1SH19aRQBOfDJD/
         OXQ+5faEUdti6qanVETNLujEDCKkflZTWZfZfL3CRtL42Adtz2dyEhveIYbRIyo/WOOz
         Vp/UwU7enjOjrZOSbVrLLaudaNPg36a71T1rEQHoHp06T5Tnv3RbU3qDVtNcdoe+K/q4
         oChhqKoeMUQm+965Tr5s4Xxxji6aYJTHDGW3D5q32UScNlaTfXf1NC+ibNXY4d6dk0Z2
         sxRjcaAoTTr2AuPeOPtSJVUaBWVvx8F7qyC1Z3SAvTdnsuSOi0gBwlwU+JqLEoXHNzyQ
         RLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        fh=1uBcesMO+STh3x/X5CJV6z2SpaZeztr3d4y9fv0D674=;
        b=hqMieMr0r+QE87OMewK7Vy7ZBMLO6JhkaQLoKi5dVOy75Z8oiAGiJVq/OFkDBj3L5x
         AjTlUflNqKtjaf1E9nPGH2B/zdbrKMkSPiDG7sQdGzRDRYt93mLe+WMgrcdIt+yx4arf
         XlP3/4vmgbr2iL/8pRcMs21Uf8Mo3HdI5Bsuk4Hiv7Rhtn8PcjXOrxoGT7E4wVW63X+5
         OeOzGUCQcQ+TUzlDSa+0w0pkEwU/mEPdS6UyoV70iq6tzTCyZPFMPOEejeyD4CX9QX6c
         lyFSXWOZrL6dFT1rqI6sevHzLk8kj+tlZvBcOgxFWGD6WsqXqMxXJoevifyQSs4HIkA2
         iJfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776948804; x=1777553604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=ASlwJzSHC/dQrb0JYRidEzn1VtTETAsTnh0iRtLd5k5wb9woApgz46P06CcHDf5Ez+
         LlO2V5NOvzbQQU9l/rI+J+Uhzu+YVcrLL7sXK6XkrCYxHBwik8lxghOGKWiIcxYumIhj
         Ham25yjBX3AM/yWsUwy80m+8LmXBITSsLHNo78d4ProoFFuCcpOmLjNPVrgjnoxqkRkT
         stx5pNZNofbYStKGhey2MCvb/djxYOXkDaB387SvBv/o4W+2N9xy77zb1qb9O3AdPd7a
         jnqbs9WELZxQOcdzHtnUcmJ9T0opZRDg3a+fX0e6jVspkPHbU8Z1Zz6OMfYzJbEQxRVR
         k4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948804; x=1777553604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=mBNAhVY6QRk6e4chZVg2hRdmd72sajPMqzbLaXEyIq/qZn4rRh7UZ01nyVHIDmyGgL
         SIOdQg8aFhu1cl+u2vc9KNRBG+44Uj6RlCbKrwSsbk0Wp2Rx8WNc0yvn8lXTfTlcI1KT
         Twl8OdYr3o5yyd1NhLHNx3qEIqNTFbFWkDXYGhfrQ4bsnp9dN1VPnJsekCgLDj7GuyEs
         OcKIbSH5bq2SQFfwaBBGtiWFj+clruRDdIm6Jc4pKf97kbGJvDXf9uqQSeqWQYfRXrh+
         CTTLi/Hbp3TIvA17fyy9Lno8bS2H4IgaZFd0VcfzJMQWEXfJ39MHp/+WC4KR79xfhxv5
         6cjw==
X-Forwarded-Encrypted: i=1; AFNElJ/E/OkFKOnB8itjELkf01XJz7XHzR3CVpLOh7KX7f18dftFPRYR02j3H9lwm6T4OLYI05YDWIP3dQhM@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxV3NThz58QSQYSyE88plVodQDeesasLaKmo3PO45IyJz8x4/
	UIyMA8NU53nhJVNr7hAR7VtW67BRt7RYJgj8VT/v7BgrGulhBpGMh+rNrmTOzeOvWjiFBN+AWzc
	7ZmfC5V29iwo+YMqUDRz+C/dGM3zRLqSpt7VKOOtijg==
X-Gm-Gg: AeBDiesL6hAe1fdH5X2YL90IUAFNqAEyXOYjkkKcU+wbaEjnVhpQUtEdvmbn3eenC3T
	s1VsdleCkLhaWgyEzE9e9HP0ZeJdryTLQ72JF0HGDRWF8ebvmpoilIIPbnv30p+Sx1tGv6Wmb8P
	IZeqb8WJT23ptpTN5GJwZbqcVq+Vp6J3LxsvfSevlgD1vCpGDX6EY4F63/j6qBDArn8RdIE4mlO
	/D7JW1FUDgbrfMiN0fvBgQoC9FSPocuV5bWNoA8bgE2bnAXlugMznjMcYptC/BkCB+J4jfHhXvP
	9InYLv8HaeVl0kxfeVm06pQc7B7RrP3BuUbNPXAzYbBVwHIhGxzj
X-Received: by 2002:a17:907:72c5:b0:ba5:bef2:2aa9 with SMTP id
 a640c23a62f3a-ba5bef2333fmr1133294666b.35.1776948803573; Thu, 23 Apr 2026
 05:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 23 Apr 2026 06:53:12 -0600
X-Gm-Features: AQROBzBDIr-bn4DX0ExOJm0nVY72516bKXS1r-ubIMnAcS6p_qKbuXjU_FLZ6Pw
Message-ID: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35417-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,nxp.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 4FB4A452596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Once again Andrew Lunn was left out.

On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
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
> Shenwei Wang (4):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 573 ++++++++++++++++++
>  8 files changed, 991 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>

