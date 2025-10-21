Return-Path: <linux-gpio+bounces-27374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22422BF68FB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFF7C188E098
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744CA33343A;
	Tue, 21 Oct 2025 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK13Bz8u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084E2F0C79;
	Tue, 21 Oct 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051235; cv=none; b=EJMNwK9v1YIfMlNmEvYR9WToCj0apNwJEYhEROMHdlD6d9oStMXNCIk0Ozw8N5ENRbVdPeaKNzW4bg1+pgZSDxc//ZW/MifATvoFtFhVug19p+3UTXZ7W5wz+RqBNHXt6NAKpQEnlTanVXo66gzUi720G4eLbdWlu0dpu6VdbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051235; c=relaxed/simple;
	bh=UY2OSllcqRDaiG/AFNpJ3ozdueOD0RXvdE2EaOV+UH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6Ae0DfyKLNKlPwMIV/1IhvbR5Km22hEVsiDrX0KzriqXqjDrWiTQy8XRcwDO1yJd7uByVaiWaEsItCgnF+Ni90Mvp6rJFCrDVdHhXPoKnmJ4u0udlqW03Z1rBWToOVJpzGtjuyLX+tXfgm7VaUsXQBF8bkXuQcsHt7DFWTGvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK13Bz8u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55553C4CEF1;
	Tue, 21 Oct 2025 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761051234;
	bh=UY2OSllcqRDaiG/AFNpJ3ozdueOD0RXvdE2EaOV+UH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MK13Bz8u0aFDcU4UaydmuPJ94/RJsUSk49QV9YFFxyqro787NvORkZoXkPqM8E0Or
	 CcLkp8Kp/iS+s/2nVgTWhzegXbjFKaG0dQnO4B6QFI1ixEDoPBJOt7XSEtVyWXmW/9
	 qKmvDCQDJqrwKvumbdyVJKcuXpfHUfwwRDi51VQT4mskKM6g5KasWj5mm7PRLqrE6c
	 B3CXCoFC5SN3tUmZYJSoGHIhQnDn1PoTiBLDFfvYKSSvnaVl4L60rXy8axwUHaedHu
	 j8Yx061Fz6PO6hC23FWr0/8ddRTTlSHTU5475hpeZjVw44HqQt6f44aw9jA8WSg+3y
	 KYUTqxRmLDd2w==
Date: Tue, 21 Oct 2025 18:23:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
 <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
 <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>

On Tue, Oct 21, 2025 at 02:22:46PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 2:20 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > >
> > > And with the implementation this series proposes it would mean that
> > > the perst signal will go high after the first endpoint pwrctl driver
> > > sets it to high and only go down once the last driver sets it to low.
> > > The only thing I'm not sure about is the synchronization between the
> > > endpoints - how do we wait for all of them to be powered-up before
> > > calling the last gpiod_set_value()?
> > >
> >
> > That will be handled by the pwrctrl core. Not today, but in the coming days.
> >
> 
> But is this the right approach or are you doing it this way *because*
> there's no support for enable-counted GPIOs as of yet?
> 

This is the right approach since as of today, pwrctrl core scans the bus, tries
to probe the pwrctrl driver (if one exists for the device to be scanned), powers
it ON, and deasserts the PERST#. If the device is a PCI bridge/switch, then the
devices underneath the downstream bus will only be powered ON after the further
rescan of the downstream bus. But the pwrctrl drivers for those devices might
get loaded at any time (even after the bus rescan).

This causes several issues with the PCI core as this behavior sort of emulates
the PCI hot-plug (devices showing up at random times after bus scan). If the
upstream PCI bridge/switch is not hot-plug capable, then the devices that were
showing up later will fail to enumerate due to lack of resources. The failure
is due to PCI core limiting the resources for non hot-plug PCI bridges as it
doesn't expect the devices to show up later in the downstream port.

One way to fix this issue is by making sure all the pwrctrl capable devices
underneath a PCI bridge getting probed, powered ON, and finally deasserting the
PERST# for each one of them. If the PERST# happens to be shared, it will be
deasserted once at the last. And this order has to be ensured by the pwrctrl
core irrespective of the shared PERST#.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

