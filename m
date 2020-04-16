Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B761AD0ED
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 22:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgDPUPe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 16:15:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbgDPUPb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 16:15:31 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DBCE2076D;
        Thu, 16 Apr 2020 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587068130;
        bh=D1k4FGZwtqhoI1ElVs5JDDEH95csH4x4jdsRBKIrsUI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pb1Aidbcr89YNzTHVpk+AyNMZbTkFc8vyI3afURRbjXDvFwV15/ymxbzA+qyRv2Yz
         zkt3XEVweYahiTnIo3Fe5Z27TgbaQy1wyQI+t7pmfTd25UUanPeCULpZddV5Ht6h6E
         mnFBpqnuRzUXcgTpoCGGyvNva9RmPVcpUddIvrBM=
Date:   Thu, 16 Apr 2020 22:15:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        benjamin.tissoires@redhat.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/1] HID: mcp2221: add GPIO functionality support
In-Reply-To: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
Message-ID: <nycvar.YFH.7.76.2004162212080.19713@cbobk.fhfr.pm>
References: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Apr 2020, Rishi Gupta wrote:

> MCP2221 has 4 pins that can be used as GPIO or configured
> for alternate functionality such as clock generation and
> IRQ detection. This patch adds support for GPIO functionality.
> 
> To set direction of a pin or to toggle its state after it
> has been configured as GPIO, driver sends command to mcp2221
> and parses response received from mcp2221. Based on this
> response either 0 or appropriate error code is returned to
> GPIO framework.
> 
> To get the direction or current state of a pin, driver
> sends command and read response from the device. Based on
> the response received from device direction or value
> is sent to the GPIO framework.
> 
> Command from driver to mcp2221 device are output report.
> Response received from mcp2221 is input report.
> 
> Datasheet (page 45-48) contains details about how to decode
> the response received from device:
> http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf
> 
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>
> ---
>  drivers/hid/hid-mcp2221.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

