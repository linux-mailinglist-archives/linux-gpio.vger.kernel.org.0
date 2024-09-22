Return-Path: <linux-gpio+bounces-10344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668397E36A
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4E61F21152
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2136F2EB;
	Sun, 22 Sep 2024 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7t9VEfn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974264CEC;
	Sun, 22 Sep 2024 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037994; cv=none; b=Vtf/3dlmelBf0qOVH7xPcAi4hE+WkrASE5QY+y2ev11UiCfROT9Ld/ll7dPhY4U6/cF5j8V8V3jS4znhCGE4+M2oU6NtzevEiqogtv4g6ZClr8zxwM7fKqzCeBaysShk4mCIKkmeupIW/tmwhNJd1Ig91i+BsAI3PRi6nGy6ZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037994; c=relaxed/simple;
	bh=p6n4LnRx83y59Q5FS4ZMlUfj1sSNn2wWz0+E3nDJODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5DkTDINGqbGXv7s7sV90KmJcQWo/zc0vtoTrrackSMzgysk3RpyBauVqGNtktxSty77kGWD/8CGfuLAOrepYQTS3U6dWhrVRhD7tetUoZx2hp720HbTeB3iMnFgoH4cp6bQbuZtXgFMP4EA8oik76DuU9ka0dg1IDPrXedX0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7t9VEfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAE2C4CEC4;
	Sun, 22 Sep 2024 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037994;
	bh=p6n4LnRx83y59Q5FS4ZMlUfj1sSNn2wWz0+E3nDJODQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7t9VEfnO35gXT5Asv0gaKWxc5/dgJmrIF7UHFyWZDgekH45/POk6phXcUM94OMAA
	 fyOxokZFQafX6uSJNmhu8LE81Vy7j3DD3C81ELMEw2Obt5KiYXuilLHkpBl/DpIWId
	 RQsxZmTbUPbXJjA8b773envB7oTW3S8fw9TE/orWiQ5LJjQqEgf6GqkzhKw5CvwUSH
	 VUbT7cvdjVUkLcnwwM13Jurug9ZaXuPN0bHRzDvlbyjdwfRyujY01+FYJQ9fnU31aQ
	 k5PNCYcGrSVYEjDX8lKi6ZlGK0R6w57wRseye1PqeQlt/YejPog+gzQXznRcOuhZxJ
	 zP1FXlLMdedlg==
Date: Sun, 22 Sep 2024 22:46:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 06/20] dt-bindings: arm: apple: Add A8X devices
Message-ID: <ab66qxmv7ztc7mrkam4jvh5k7rhalwhc2opemtgbff7aywy2sr@mimr2gv3emqc>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-7-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-7-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:55AM +0800, Nick Chan wrote:
> Add the only platform based on apple,t7001, the iPad Air 2.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


