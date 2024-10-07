Return-Path: <linux-gpio+bounces-10970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81E993176
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 17:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 779F71F23AA1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 15:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E39D1D9323;
	Mon,  7 Oct 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="JdUXqybO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260E1D86DC;
	Mon,  7 Oct 2024 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315488; cv=none; b=UFnmtnBYdP//nTBiYq6TDsonCdNlbtLpMmHmtUZ6HNrGj4NejjnDF60EIKsJm55CuSf7twIrk+xrmk6sRaDAOFxEbBmTY00YDntedq8CifgjeJtxPurEdf7xbs9aI1hx2WSjir5feiAAc013YHpMia+yyka4M0AD6r2/P4NNh0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315488; c=relaxed/simple;
	bh=n3jEEEScjRiJdzU+uck0EUzhi+iFSZ7MgBHOuwVnAYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBqe72rONIDHLK8tWWgfPMWJaEO/AesCMveWSXPCFCqTdqDRsJYS1hOPQZDR+j4ycy4YsQ3ql4l48yKT5bQz2q/kU+LDyaLs4qJAJ59XfEZX4MbIOE8l8yzitR0R9oKItr3WC7BWvswyPbEJrEUY/pDpwViFD3VVqKP3wO++11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=JdUXqybO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BE7EC23FE7;
	Mon,  7 Oct 2024 17:38:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqSCnSJ1L9Jj; Mon,  7 Oct 2024 17:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728315483;
	bh=n3jEEEScjRiJdzU+uck0EUzhi+iFSZ7MgBHOuwVnAYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JdUXqybOvJ1gDaW6VfvHimxHvoNR04PKBQyKg/QivMqUR4sFv27GjVqxvkTHmvLnY
	 0ZltLX/ng1sxcMGXz7/QSbNhEvK9DNy8Slls5A+R/OcD+dQvlt8EI3ChEcNyGbemVq
	 ETC9F29vPNREp4Km3gfJ9EeW+fDJHQmM5CiH8hNtQjz4p4RqREXjxitMt+w9n4p/Vo
	 aEaXXpNWcotau0cihQ1A3EloOmPycaddBcHyHLJoFZf2P0uirQFRy/5OYmlRqnCeg0
	 jJUl+SV/TpXPRGRB72GVAyZ4yIITAJiUyX/QtwyC381XjLeGDsvjbvQ7D3PXUUcxga
	 gJqQujtfyMg5Q==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
Date: Mon,  7 Oct 2024 23:36:31 +0800
Message-ID: <20241007153631.638-1-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241007153252.31449-1-exxxxkc@getgoogleoff.me>
References: <20241007153252.31449-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=0D
Here is the boot log of the stock bootloader trying to boot arm64 kernel :=
=0D
=0D

