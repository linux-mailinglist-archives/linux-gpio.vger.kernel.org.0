Return-Path: <linux-gpio+bounces-13867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770B9F1347
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5757816ACFA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194991E32CD;
	Fri, 13 Dec 2024 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT5McpZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D3E17C21E;
	Fri, 13 Dec 2024 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109775; cv=none; b=kDMuRGEZJ2A+zlRwXDoolkKflFkMwyKHZU4uXY/MviMP5DjSZfVO/j2Ndpol8so72wObOdy3fhQLuPj+yPp5XulocsXY9KtHLbRsb+r85G7z2xuJB2+9uROvvJfmups6qsDN3yy6siTY4J9/Bw2THDarsyndOArsiSQKQYpA2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109775; c=relaxed/simple;
	bh=JZ2USEEEV7FFcVBTCgSNTmRnykylc2iH9qSCZf1QpHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SpTjo1VncPV1ZkGYVRXqBmki29rU2LrrOf/UlOGEASP2rAeNFxZVXarp4/09rw8/27tiLKZ78iCfkBFuw8PTd3QORRnTVUmK327Vsuz8Fll5C22d7o4dD+pkohEF+vU1ccM2bO2IIv8JNfq50HUKWmo46/0h+10ZYiFwiwWHEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT5McpZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B20C4CED0;
	Fri, 13 Dec 2024 17:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734109775;
	bh=JZ2USEEEV7FFcVBTCgSNTmRnykylc2iH9qSCZf1QpHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QT5McpZZONNcg7KADmbU2DPbaBeP8mlRlKQHNkSI9YZmDWrQRRKDUevKF72qD4psW
	 19KAfNdNGsk/0I9B+eimsCrsOB4OPh3x6D3qzkCVx/KvXYK/0MPn9LKxQPpNFKFuF8
	 CpmTjJMCbNQ3oyXTGp524MsYj1KPoWHw9DDysKV3IDlCInt/Gpgbxh+g3LTbPQ8odV
	 9amrJGml01xQ29W432ZegOypMgyqzLByXHRo6T7sp4BRoRG9ErZySJAjKtzvdvvunl
	 ejTwv1LOvO+V9vcrPqXQVgH5XIm1do9dxmTivb/Dn98gqBdzvSxtPNYiJ82KAjG82G
	 CRG5paaOHNyyQ==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>, Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
Subject: Re: (subset) [PATCH 0/5] Add support for the AAEON UP board FPGA
Message-Id: <173410977288.944644.7928182846086408038.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 17:09:32 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 11 Dec 2024 17:27:15 +0100, Thomas Richard wrote:
> This is the revival of the AAEON UP boards FPGA.
> The latest version was sent one year ago [1].
> 
> I started a new series, as I re-wrote all the drivers using the AAEON
> DKMS driver [2] as reference. I also read all series sent to the ML to
> collect the comments sent by the maintainers and reviewers (to not
> reproduce the same errors).
> 
> [...]

Applied, thanks!

[1/5] mfd: Add support for AAEON UP board FPGA
      commit: 577ced9b8ac3791edfddc7c371a7f948cdd0e35c
[2/5] leds: Add AAEON UP board LED driver
      commit: 5885a1731d0052d5d8a8cbc9871f94fae1f3baa3
[5/5] MAINTAINERS: Add entry for AAEON UP board FPGA drivers
      commit: f35d82b6f63994e7d7944daa99651ab88300ce22

--
Lee Jones [李琼斯]


