Return-Path: <linux-gpio+bounces-3424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 040CE859018
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 15:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9316A1F21983
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6236A7B3DC;
	Sat, 17 Feb 2024 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7FOQfpp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1674E69E1D;
	Sat, 17 Feb 2024 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708180116; cv=none; b=esY892pEsDUb0qXrxXPs0wX+5i3nGP97MUx8oAFsp4HUP/7kT9OGstv7DR7HLyZJk2plLrFNG2cyrcUfJ15GFs+MSLG8t6VeLU8yEcNNjAjZ5wQHAgIfoQsdcamouRQmYXtqYWxevgKH+Vf7GvG0HGqI9evnRca4EbapRErp0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708180116; c=relaxed/simple;
	bh=uEPJyTNR09mIQK9QTFBbWWcxHHww3pxUVhvv2ZEb3rY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLoefdMSGC3TO94nyWWGQz0xxFdi6G8VFEHJeU3487wNBmJsKd8b8QxDVKB+S92qqhdhgzNgXOZ5rNpA38FvcPLAm8pokBqqqEfsVMqIxpTMS58IsnInAxO0bExWdqIPHYZ2jGPOrihpmyqGraN+ipNUZ2zj/ZD/YG6SYSa0xbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7FOQfpp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123FDC433C7;
	Sat, 17 Feb 2024 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708180115;
	bh=uEPJyTNR09mIQK9QTFBbWWcxHHww3pxUVhvv2ZEb3rY=;
	h=Date:From:To:Cc:Subject:From;
	b=t7FOQfppklIRRpNzjau3tuiln7EhyS0zxUYBDbF4qqC/fMiFhgAZkO8DxWrcgdlYY
	 hNRMhozkPTFMfitRFok6UOJN10Hb21nBM1ZboWwGz51lpwN+ojCKjevg3qUqI3705v
	 xM3/bTEEO+xXfZVpLJnzrOBpdzDuK/sQabfIF5fjh5xhfjK5xi42tRuTekhNU2DgRh
	 iIMfHMd6YFQl7S7FLiENo6QSTE6KQKH4hihaYcTO9hZgS3jEv0ObqcTyV/UJpqm5vO
	 gjULKmKjrrRIS/Q1lO1U2dHZlnqgsgA/0+Y/JDwpZH+ICpOa9yO5LbVFoNftKDNULZ
	 oN6W3LnONEc6w==
Date: Sat, 17 Feb 2024 22:15:31 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: commit f34fd6ee1be8 breaks current dwapb gpio DT users
Message-ID: <ZdC_g3U4l0CJIWzh@xhacker>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Emil, Linus,

commit f34fd6ee1be8 ("gpio: dwapb: Use generic request, free and
set_config") breaks all current dwapb gpio DT users, for example, getting
cd-gpios will always fail as -EPROBE_DEFER. Before the commit,
dwapb_gpio_set_config() returns -ENOTSUPP for !PIN_CONFIG_INPUT_DEBOUNCE
then gpio_set_config_with_argument_optional() will happily ignore
-ENOTSUPP. After the commit, dwapb_gpio_set_config() will return
-EPROBE_DEFER unless the gpio-ranges are set in DT.

The key problem here is: almost all dwapb gpio DT users don't set
the gpio-ranges DT property, so I guess current dwapb gpio DT users
have this problem and the commit also breaks old DT compatbility.
So could we getback to previous behavior?

Thanks in advance

