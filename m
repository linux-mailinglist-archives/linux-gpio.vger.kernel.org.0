Return-Path: <linux-gpio+bounces-17200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10542A5588E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 22:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D106C1898F36
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46654277803;
	Thu,  6 Mar 2025 21:15:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC8277017;
	Thu,  6 Mar 2025 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.171.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741295736; cv=none; b=BiEgWsNJM5wj/r+NXdks033+e8tOqb6QRKbW+W9Tv5WHYAa81SwYp6LALDgzNv7n++53KLw2zXHlEOPE0+DRaZ+4yTAeUh1jp1xlO+VFg4ouYGrHPjVx0LdOHNgGYIVi9lbxct4oKyCAJ0olk0I791StGQIn2zrWZF9v39zA5SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741295736; c=relaxed/simple;
	bh=gij/ZjBozazw9QMucfCzOqeE+vX+wQDy+lz7JzWJloM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFo73rJjEu1UsP5ro/4q6j9IAxQboG7719qGlxrVdbHFTzRRLBsndPxyUdX77sVOc+4iY+lgknalysRyHrQDMUyYuiv3/XG2PsLGvoZ0ui1BP0C/5UFS2nv8tm+CQrK1ULkVfFcl5qJDpxEAzarfnPfTFO5KSS48CIIroi59EFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=datenfreihafen.org; spf=pass smtp.mailfrom=datenfreihafen.org; arc=none smtp.client-ip=78.47.171.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=datenfreihafen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=datenfreihafen.org
Received: from work.datenfreihafen.local (unknown [45.118.184.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id BBCF5C03F3;
	Thu,  6 Mar 2025 22:05:54 +0100 (CET)
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>
Subject: Re: [PATCH net-next v4 0/4] ieee802154: ca8210: Sparse fix and GPIOd conversion
Date: Thu,  6 Mar 2025 22:05:01 +0100
Message-ID: <174129482390.1935348.6456362941147965930.b4-ty@datenfreihafen.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
References: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello Andy Shevchenko.

On Wed, 05 Mar 2025 12:55:33 +0200, Andy Shevchenko wrote:
> The main part is the patch 3 that converts the driver to GPIO descriptor APIs,
> the first one is just an ad-hoc fix WRT sparse complains on the bitwise
> types misuse. The second one is a small cleanup that helps patch 3 to be nicer.
> 
> In v4:
> - split DT patch (Krzysztof)
> - collected tags (Miquel)
> 
> [...]

Applied to wpan/wpan-next.git, thanks!

[1/4] ieee802154: ca8210: Use proper setters and getters for bitwise types
      https://git.kernel.org/wpan/wpan-next/c/169b22622058
[2/4] ieee802154: ca8210: Get platform data via dev_get_platdata()
      https://git.kernel.org/wpan/wpan-next/c/0a3e89b06d36
[3/4] ieee802154: ca8210: Switch to using gpiod API
      https://git.kernel.org/wpan/wpan-next/c/20629a48d50a
[4/4] dt-bindings: ieee802154: ca8210: Update polarity of the reset pin
      https://git.kernel.org/wpan/wpan-next/c/a5d4d993fac4

regards,
Stefan Schmidt

