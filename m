Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40543BB7DF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 09:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhGEHdJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jul 2021 03:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229975AbhGEHdI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Jul 2021 03:33:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAC4F6135D;
        Mon,  5 Jul 2021 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625470232;
        bh=NiW/HXfBqch2oY+lEOTlQYrXSsK64D3GwvR6BGZndyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NY9EFz6AZqrFYFDfqnsVvqYabkcRKqofUQMVRgEUMX11+CK/ioJgr0Q316XZaOeXF
         cyGQH9s4RQUTgLnAUUuKfXNUY1yPDkK5M41JGvqF2aRqIoYkmqQiVBm/nFu0TAa8IS
         DQDSuP/3GsXF9VoPTthvFnvvIRyGWUcL55W3VJAM=
Date:   Mon, 5 Jul 2021 09:30:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, warthog618@gmail.com,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [RFC 02/11] drivers: Add HTE subsystem
Message-ID: <YOK1Fq45P/DeqxAA@kroah.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-3-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625235532.19575-3-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 04:55:23PM -0700, Dipen Patel wrote:
> +static void hte_chip_dbgfs_init(struct hte_device *gdev)
> +{
> +	const struct hte_chip *chip = gdev->chip;
> +	const char *name = chip->name ? chip->name : dev_name(chip->dev);
> +
> +	gdev->dbg_root = debugfs_create_dir(name, hte_root);
> +	if (!gdev->dbg_root)
> +		return;

No need to check for this, if it fails, your other debugfs calls
will handle it just fine.


> +
> +	debugfs_create_atomic_t("ts_requested", 0444, gdev->dbg_root,
> +				&gdev->ts_req);
> +	debugfs_create_u32("total_ts", 0444, gdev->dbg_root,
> +			   &gdev->nlines);
> +}
> +
> +static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
> +{
> +	if (!ei->gdev->dbg_root || !name)
> +		return;
> +
> +	ei->ts_dbg_root = debugfs_create_dir(name, ei->gdev->dbg_root);
> +	if (!ei->ts_dbg_root)
> +		return;

Again, no need to check.

> +
> +	debugfs_create_size_t("ts_buffer_depth", 0444, ei->ts_dbg_root,
> +			      &ei->buf->datum_len);
> +	debugfs_create_size_t("ts_buffer_watermark", 0444, ei->ts_dbg_root,
> +			      &ei->buf->watermark);
> +	debugfs_create_atomic_t("dropped_timestamps", 0444, ei->ts_dbg_root,
> +				&ei->dropped_ts);
> +}
> +
> +static inline void hte_dbgfs_deinit(struct dentry *root)
> +{
> +	if (!root)
> +		return;

No need to check this.

> +
> +	debugfs_remove_recursive(root);

Do not wrap a single call with another call :)


thanks,

greg k-h
