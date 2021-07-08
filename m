Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C163C1C35
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jul 2021 01:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhGHXnQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 19:43:16 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:32351 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229491AbhGHXnQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Jul 2021 19:43:16 -0400
X-Greylist: delayed 412 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Jul 2021 19:43:15 EDT
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4GLXfq4rKlzMT;
        Fri,  9 Jul 2021 01:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1625787220; bh=qGNg7hSbfzBvr5magCDMkvgViKrImUwppARwb6jC+qA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FBlLRDt3tje8tO2OFphoFwEHC3eQ8/MU1ItlKZ7Hwfw+Y9sCzFfsvS36Aiqt0iK6G
         KCZnWjpD6vWkn/MNP48ZnZ9wzh6xwE8miH73lnGN3SiWaFO1UXOApuBNNSccS+qw7Z
         kXdgF0sFTMuakQlEC/IpdJNVaJQ3iU0O/Rlxm8D3sozTrsUe/0+QH6jgE2C0TR02TF
         PsuSyzvmqN3WvjxbKE0VgQDxldX1N5fXtVDQps5xbE7XtzPGidg2qJuZMEKcMoSzYE
         oIIOj5P/S3Dgw6B9pslzLHvZlEY4whdIVTAMsKRHCiu4U6hRc4KY7safXtsNr2DijO
         M2fmG/hHVVN+Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date:   Fri, 9 Jul 2021 01:33:35 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, warthog618@gmail.com,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <YOeLT4T5stjsAUMr@qmqm.qmqm.pl>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210625235532.19575-4-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
> Tegra194 device has multiple HTE instances also known as GTE
> (Generic hardware Timestamping Engine) which can timestamp subset of
> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
> and exposes timestamping ability on those lines to the consumers
> through HTE subsystem.
[...]
> +	ret = of_property_read_u32(dev->of_node, "slices", &slices);
> +	if (ret != 0) {
> +		dev_err(dev, "Could not read slices\n");
> +		return -EINVAL;
> +	}
> +
> +	hte_dev->sl = devm_kzalloc(dev, sizeof(struct hte_slices) * slices,
> +				   GFP_KERNEL);

Nit: There is devm_kcalloc() that will check for overflow in the
multiply in case @slices from DT is broken.

Best Regards
Micha³ Miros³aw
