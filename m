Return-Path: <linux-gpio+bounces-13976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC69F5711
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 20:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 928DF7A39A5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 19:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE1B1F9AA7;
	Tue, 17 Dec 2024 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="P0YlsuKz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDA91F942F;
	Tue, 17 Dec 2024 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734464576; cv=none; b=ZL1CdaCRYQ47ZCP2FIdRgdud7TwXM7HmZxtYIcIsGDwjyBFjzZ2xqxNbzjng03rn9f15gTlmyWHAxJfUETMY6kHWKz+D0R575cy3dV8jm/qyWEERw+N9GI+2OwfkfXv4tgmSL2pjtmpvwHioXM4+S5lrpebnprFrEHf/y4QabOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734464576; c=relaxed/simple;
	bh=+/S+LRrwM3J5EIBu52etndXpcG9G7qL3AVg28RtoSVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXRZGdgA7Q1k+KR857MdCca9fjCGiaCrnIYlKs1MyI/ag8CMsbGb87NcX+SaLWw3wOSqDFNKNgSL4Q+t1//Dchja/ZgYXrka6btew8MrfY3wkya+izlbTGraXyWlE+ezyanmV13lrfHUKJDv5N52yIdla8EO3donHf4DFgl7Alc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=P0YlsuKz; arc=none smtp.client-ip=192.19.144.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7E89DC002821;
	Tue, 17 Dec 2024 11:37:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7E89DC002821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734464226;
	bh=+/S+LRrwM3J5EIBu52etndXpcG9G7qL3AVg28RtoSVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0YlsuKzBM8rNwZmTeYuUn4wdku1TQmDW/zLlnELZ4+fob8MX4DHm4zlzcuYGO/6I
	 D3pDyqmHseqZRwDhEjVHV8yqpcTsdNWWHlIzqBF3+joaLGo7Oje6zj+ka9BgxyjNRm
	 P1maX0ZWyrcno1PPpVkRfLS39rbM7xLL38/wtTSE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id E6AEE18041CAC6;
	Tue, 17 Dec 2024 11:37:05 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt controllers
Date: Tue, 17 Dec 2024 11:37:05 -0800
Message-ID: <20241217193705.897820-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-5-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com> <20241212-dt-bcm2712-fixes-v3-5-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Dec 2024 18:36:32 +0000, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> CHECK_DTBS produces errors on bcm2712-rpi-5-b.dtb and bcm2712-d-rpi-5-b.dtb
> of:
> intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
> intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
> 
> Rename the nodes from intc to interrupt-controller.
> 
> Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

