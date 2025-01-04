Return-Path: <linux-gpio+bounces-14511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9483A0164A
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 19:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7773E3A3E05
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 18:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D131D47BC;
	Sat,  4 Jan 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulhkq8O4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301EE11CA0;
	Sat,  4 Jan 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736015059; cv=none; b=exNaplKrqkgzKzfIJPbA8J5b1aXLguMtLW+A02cgkZgqyzS/eN/0Froq/E0dWF+t3qGxrduHcmYIgRKBKllbrR55f3CumY/FEYqKLE8cbVnAW4sy0wSrQgd6tLg82eT61gbd4Sv+fGFjQqfY0Fl8ByM5ZI57nyNp1/u5PVKiy1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736015059; c=relaxed/simple;
	bh=NmnuBbDu9rV6QmZPSJwWf20Iz3ZSYgDCXT8ZTd81iE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUVoxQElrwh+QTq/YzOU+/65/UQ2Q3HD/gUsOBMUs1ZH7H0vlGWdX/mM9z5fGU3wQ5kQdZ+P7cb5LASc5EK33kqE2oKioZYZ0geIjsTgsxYpZYa0wMrgfPYPOaR3qV/+fLmFyTm6HwtUa/qWQz6pfoSJFGjdeaVzLCRi57crnto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulhkq8O4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8E1C4CED1;
	Sat,  4 Jan 2025 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736015058;
	bh=NmnuBbDu9rV6QmZPSJwWf20Iz3ZSYgDCXT8ZTd81iE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ulhkq8O4o3xDc8v6tiGAAWwITaHN5WhDOYWJXwMwGVFzGKEf5doN0MU9mkWlo51ZN
	 2gvOm44x241JAiTSv5+W++IBamLmam7PIWogg1DwbgN3A3c922D6QmQpviEH8Sibk9
	 76fDKfVOPKzhQ/l/FXPmKzQ45v0aGnMn2kUNMnHJe4gcwt+uRpKzU5EsJ+BE2T71aO
	 +MYT9Qk+a80U0G/bU/25j2QCXFnH9GDrUdd8gNY0l38OClx99cdbg6PEtUEREHutJV
	 1JiErPpXy0pX8fBe1dMhKZNujL36g9awUz7cnNrTykXna/RVyk83k5An0udLs1gL4M
	 ttR2KX//PovrA==
Message-ID: <5f663fbb-8f17-44bb-8050-987d00781377@kernel.org>
Date: Sat, 4 Jan 2025 20:24:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] gpio: tps65215: Update GPIO0_IDX macro prefix
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, tony@atomide.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
References: <20250103225407.196068-1-s-ramamoorthy@ti.com>
 <20250103225407.196068-3-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250103225407.196068-3-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/01/2025 00:54, Shree Ramamoorthy wrote:
> Updating the macro name to TPS6521X_GPIO0_IDX is meant to indicate this
> macro applies to both PMIC devices.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


