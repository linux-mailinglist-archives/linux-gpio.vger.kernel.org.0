Return-Path: <linux-gpio+bounces-25209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D480B3C22C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 20:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2EE1CC2F47
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 18:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F259B304973;
	Fri, 29 Aug 2025 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVbRMIWW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A326F30CD95;
	Fri, 29 Aug 2025 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490468; cv=none; b=udUonEotl78YSj71+M98jIJONHyxcrGG4XfzU6VdcmQWJFEKr2420p4t5eeslv+tY5kIEHuiLl0Fafabb4E0hyKFgpnPJ6cc6+adhwsK5OncjQ3ElxTklEZKVhojo3Q4cQltpcYB7cJzj9j64fCnIb//TVNwZzb3HGhbzsjs0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490468; c=relaxed/simple;
	bh=/UuJhuIUrV4aqujvs/BtKUKwpbhTcdWwtWwkXRQk0yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaUo72s/o3g19XP6jmJn5RM/2gu5A1si7H3lnA2DhvpTpsDEgYNFz3V7epD0qsu3CZokapQo5Ot0tPU5bVe0aBLx/YcIB5sUqiubePmOrH9kndSD661TSUiGXpJCIpFYTWeZKmhdMY9UmhJZKvKk8DKe5I0ZiF1la/A1TBIq2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVbRMIWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD6BC4CEF0;
	Fri, 29 Aug 2025 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756490468;
	bh=/UuJhuIUrV4aqujvs/BtKUKwpbhTcdWwtWwkXRQk0yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVbRMIWWuYPIxA3N0EY/bzeBYgTLaZB5v4vF9wMKcxl1GIc+zYt0Y2PX3AikSLXkx
	 OdzOx3in/PFQ1ZYJIK1zulYhUoT4njtMNNlMMv5M9+wE0/zjU6wMToXfFbvPkSnEl2
	 RFhaKiIAo2kykUSJV8GJSP7A0vs8GmCxVoyfMr29JM8+Hod9ge9Y+u2K21VuTa/E0X
	 Znx7Q+1C9R3VetOwq+o4Q1BVdUxc4jo8mpM9uMiMXfcggaV4eSnPcsF/991Bg0zjQu
	 p6gIAdY2v0rA2q/1AKhkmZKN/agfpV4qrhlI0UAHemVK6Izk7hUXdfFLasbdkXxToS
	 OEGDGSM68rO0Q==
Date: Fri, 29 Aug 2025 13:01:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Al Cooper <alcooperx@gmail.com>, svarbanov@suse.de,
	florian.fainelli@broadcom.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Will Deacon <will@kernel.org>, linus.walleij@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>, mbrugger@suse.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, wahrenst@gmx.net,
	conor+dt@kernel.org, linux-serial@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>, iivanov@suse.de,
	Jiri Slaby <jirislaby@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: mmc: Add support for capabilities to
 Broadcom SDHCI controller
Message-ID: <175649046165.1080149.6916098730897099191.robh@kernel.org>
References: <cover.1756386531.git.andrea.porta@suse.com>
 <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>


On Thu, 28 Aug 2025 15:17:10 +0200, Andrea della Porta wrote:
> The Broadcom BRCMSTB SDHCI Controller device supports Common
> properties in terms of Capabilities.
> 
> Reference sdhci-common schema instead of mmc-controller in order
> for capabilities to be specified in DT nodes avoiding warnings
> from the DT compiler.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


