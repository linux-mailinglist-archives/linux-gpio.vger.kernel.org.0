Return-Path: <linux-gpio+bounces-30367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3DD0B430
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 17:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A05A30407F9
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 16:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9754031065B;
	Fri,  9 Jan 2026 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVL0HP5T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930613D51E;
	Fri,  9 Jan 2026 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975975; cv=none; b=AVq3WKws3zGtxCXA5Azokli6+nns/WYDUzmS1o6QaogQZQiybzd+vz0iuWx7sXfHLUtdjeJ4d2HCpvHagWmbRym+5sMtSYLNqn3+gCDRohKwxbBj9q05NReLswXFh6PhdnmLdqu+hcIgT9hkBOTVtQ5iA3K1BawIKiaiZ0UCV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975975; c=relaxed/simple;
	bh=lTBTxXQNL7hqbxTiZ2EKsXGVPJPeJZe96rJnHGb8A2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Oe3rQD25hQrvrZYct6ZQc4I8hyHtN2QQTws3p5uBlhDfN0PCowBkjgJ/IqKCbhO7lIRA/Md2UdDAg8FOUOoMFiPd7a5uENWNFe5Hig6tG1HJf/OVE3B2TZh8bBSVOzwLEqXH+OpMsWONOqzmXuy39fkdzepxy2jpKQedeeUlcX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVL0HP5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3896C4CEF1;
	Fri,  9 Jan 2026 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767975975;
	bh=lTBTxXQNL7hqbxTiZ2EKsXGVPJPeJZe96rJnHGb8A2A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rVL0HP5TWHVLYSGcgRteqvOuqjD4leuhEdACnXsiMKKNOyNn3zPCubXMCqv5FU0Ah
	 t+HYWqkAepZvnlibw9pFLVqmnlQWk3Iv1tlW+c2/5WN+sDqNuiEdCWKqRl9rn8ZPpb
	 V21hppOk4ml0j4uCqKLl3whRECn37l1yMOmI8LX0lmfFjM5m8n7Zdxkh+tif6ZZSUv
	 g9RJBizIP2CuAmpuMf77P6DAbBw4G5diUbZTTEU1eAFvvu34Dpsj8gPl9NHKDHnSW/
	 WIdAVhTSJPQ2dOgClVbe6qTLREUZ6ynFtwDuEbrxvP4SCymb5DNfPFUTqCA8m3N8NU
	 dsjPLZ1LfFeZA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 17:26:12 +0100
Message-Id: <DFK76D6YF9HK.GCKCRXUU7ZZT@kernel.org>
Subject: Re: [PATCH] driver core: make pinctrl_bind_pins() private
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>

On Thu Jan 8, 2026 at 1:52 PM CET, Bartosz Golaszewski wrote:
> pinctrl_bind_pins() is only used by driver core (as it should). Move it
> out of the public header into base.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

Should this go through the driver-core or pinctrl tree?

