Return-Path: <linux-gpio+bounces-26837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD416BBE78C
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 17:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D503B8983
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3275C2D6E4F;
	Mon,  6 Oct 2025 15:20:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC327FD44
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764044; cv=none; b=iycxqrnmfyYn6BQ1soRygw82c0nIJ8cMKR24PNrhkdpy3rXwZ3GOh19UA/i+vyCc+5NI3M5NVFmKuF3YH/jeN7q3kshaTejQyoZJRksoaJ1m/tZNBTi/DudZfFef3yWYPiMb3A2cJswB+jXpL7p7qhjNV+enXE3s+G2/2esE2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764044; c=relaxed/simple;
	bh=6hToGOFXXAg1wy2SZROJ2/S2Yw28zFL9TM4bTt277Ho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nraLUshMxRBROUNfTijwA8rb715fCQQ5X1+GvQVIl24V5ZZ+7h5a8CyI0shYKYoPy7d1CSQQ1nx+1qjabuu6adj6RqwyJ6nHjGrOPg/9Up/zN0fRCj61I1r29AVyQIvT4dXA9MlFzm1dgHZ6gpz3bLgjOBIo2Xy8So4QPRfeEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5n0r-0008P0-5o; Mon, 06 Oct 2025 17:20:33 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5n0q-002Fjx-26;
	Mon, 06 Oct 2025 17:20:32 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5n0q-00000000CG1-2Ml9;
	Mon, 06 Oct 2025 17:20:32 +0200
Message-ID: <c3faa8981b942cdaa99a0c232e670aa9dddcebda.camel@pengutronix.de>
Subject: Re: [PATCH 6/9] reset: order includes alphabetically in reset/core.c
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij	
 <linus.walleij@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  "Rafael J. Wysocki"	 <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski	 <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Date: Mon, 06 Oct 2025 17:20:32 +0200
In-Reply-To: <20251006-reset-gpios-swnodes-v1-6-6d3325b9af42@linaro.org>
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
	 <20251006-reset-gpios-swnodes-v1-6-6d3325b9af42@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Mo, 2025-10-06 at 15:00 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> For better readability and easier maintenance order the includes
> alphabetically.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

