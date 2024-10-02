Return-Path: <linux-gpio+bounces-10752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186398E55A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 23:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7F728848F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 21:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516AA216A2C;
	Wed,  2 Oct 2024 21:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1N06G2L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73F19580A;
	Wed,  2 Oct 2024 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727905014; cv=none; b=MoQ2AtCv2slG2vBYm6eU8pTZextW3SqRgoB21VgIq9x5SHOJY9PqxlW41KkXLPznVs0zWzYquKBu7q7JsGkxBK84vOCwdlKQzhFBAf5afsJMwC2rmCOsVZqnWjmeZqj5K9YKuQOF2NI6PMa9Y8dcrihEEzkYV6XaRV6qPdeZpIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727905014; c=relaxed/simple;
	bh=sQm9eReAnj0pyFh14LT4Y54vlKc7ZES4WehMjayQ0lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDHGGEkoCFlhidGHcKR4dJZNwDtZiEt7FFcO41dNHMQyYjumS8FRZVztFI6NYdMk2PisHJh/jTvotqFJ+63cPqj6/GTPAubY67+W7DqgQk4ESBr4/EFaawGHu7Ppr421xmkC6rUMKAmjeayVY6KsKBSg5dj4/V1oS7imfIqxio0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1N06G2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DCEC4CEC2;
	Wed,  2 Oct 2024 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727905013;
	bh=sQm9eReAnj0pyFh14LT4Y54vlKc7ZES4WehMjayQ0lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1N06G2LHY5CQW+EIzeEbV9JZPPXnJmaAI7gMMPHadIIqlrRxonMiWoC7AG4VkEhi
	 u/TGmE2kaq+X70FOm5kcnIgrlqYGRv5p/Ru1jhhnD3ZUo2wmWM4S8h0lBHId6LGBku
	 EIiyG89hNFcu1NPBkSrfo1pHctT5HqmRqooxeZS+rrrMOsZyNbghcHRD1XxmtLy8SP
	 izVRq446Bz54XARdP3oH8txWMuNCMVgKKk+3UwaFLWJl24sQWNsZA0yVXgy8LmHOYP
	 FnfE63YYsRcBRx93ld9/tlRuGLLlth9QH9pzMAqnb+jUOMQH2LD0VrtL9YvWiPQHhW
	 KM4DsOiYr7B7Q==
Date: Wed, 2 Oct 2024 16:36:52 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Deprecate
 renesas,enable-gpio
Message-ID: <20241002213652.GA1330004-robh@kernel.org>
References: <cover.1727853953.git.geert+renesas@glider.be>
 <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>
 <Zvz8yA4sIKpKP8eD@ninjato>
 <CAMuHMdXGZPa8R78YjCd5izycug_t3o5wF0Kk_SpAw=k6uxpeZQ@mail.gmail.com>
 <CACRpkdYrkR4tLyri_n56_Spuj9t0L9h4wRnBCeXR6quxCQdebQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYrkR4tLyri_n56_Spuj9t0L9h4wRnBCeXR6quxCQdebQ@mail.gmail.com>

On Wed, Oct 02, 2024 at 04:09:28PM +0200, Linus Walleij wrote:
> On Wed, Oct 2, 2024 at 2:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > Option B: Switch usbhs_probe() from "renesas,enable" to "enable"
> > and add quirks to of_find_gpio_rename():
> >
> >     #if IS_ENABLED(CONFIG_USB_RENESAS_USBHS)
> >                    /*
> >                     * The Renesas HS-USB DT bindings happened before
> > enable-gpios
> >                     * was established as a generic property
> >                     */
> >                    { "enable",     "renesas,enable-gpio",
> > "renesas,rza1-usbhs" },
> (...)
> 
> I would actually prefer this.
> 
> > Option C: Add a generic "strip vendor prefix" fallback to
> > of_find_gpio():
> 
> I understand the appeal, but the idea is for the quirks to be
> very specific (hence they are enabled only if specific
> drivers are compiled in) and not start to be helpful. Doing
> this would make any vendor,foo start to work and I don't like that
> at all: any such mechanism will invariably be abused.

+1

Unless there's a bunch more platforms coming, I'd just stick with this 
patch (or even do nothing).

Rob

